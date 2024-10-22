
CREATE TABLE Transacao (
                           id_transacao NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                           id_pedido NUMBER NOT NULL,
                           data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                           valor_total NUMBER(10, 2) NOT NULL,
                           metodo_pagamento CHAR(2) NOT NULL,
                           status_pagamento CHAR(1) NOT NULL,
                           id_cliente NUMBER,
                           tipo_pedido CHAR(1) NOT NULL,
                           observacoes CLOB,
                           CONSTRAINT fk_metodo_pagamento FOREIGN KEY (metodo_pagamento) REFERENCES MetodoPagamento(codigo),
                           CONSTRAINT fk_tipo_pedido FOREIGN KEY (tipo_pedido) REFERENCES TipoPedido(codigo),
                           CONSTRAINT fk_status_pagamento FOREIGN KEY (status_pagamento) REFERENCES StatusPagamento(codigo)
);


CREATE TABLE TipoPedido (
                            codigo CHAR(1) PRIMARY KEY,
                            descricao VARCHAR2(50) NOT NULL
);


INSERT INTO TipoPedido (codigo, descricao) VALUES ('P', 'Presencial');
INSERT INTO TipoPedido (codigo, descricao) VALUES ('D', 'Delivery');


CREATE TABLE MetodoPagamento (
                                 codigo CHAR(2) PRIMARY KEY,
                                 descricao VARCHAR2(50) NOT NULL
);


INSERT INTO MetodoPagamento (codigo, descricao) VALUES ('CC', 'Cartão de Crédito');
INSERT INTO MetodoPagamento (codigo, descricao) VALUES ('CD', 'Cartão de Débito');
INSERT INTO MetodoPagamento (codigo, descricao) VALUES ('DN', 'Dinheiro');
INSERT INTO MetodoPagamento (codigo, descricao) VALUES ('TR', 'Transferência Bancária');


CREATE TABLE StatusPagamento (
                                 codigo CHAR(1) PRIMARY KEY,
                                 descricao VARCHAR2(50) NOT NULL
);


INSERT INTO StatusPagamento (codigo, descricao) VALUES ('C', 'Concluído');
INSERT INTO StatusPagamento (codigo, descricao) VALUES ('P', 'Pendente');
INSERT INTO StatusPagamento (codigo, descricao) VALUES ('X', 'Cancelado');


