-- tabela entregas
CREATE TABLE ENTREGAS (
    ENTREGA_ID NUMBER NOT NULL,
    VIAGEM_ID NUMBER NOT NULL,
    CLIENTE_ID NUMBER NOT NULL,
    ENDERECO_ENTREGA VARCHAR2(255),
    STATUS VARCHAR2 (50),
    CONSTRAINT entrega_id_pk PRIMARY KEY(ENTREGA_ID),
    CONSTRAINT viagem_id_fk FOREIGN KEY (VIAGEM_ID) REFERENCES VIAGENS (VIAGEM_ID),
    CONSTRAINT cliente_id_fk FOREIGN KEY (CLIENTE_ID) REFERENCES CLIENTES (CLIENTE_ID)
)


-- tabela viagens
CREATE TABLE VIAGENS (
    VIAGEM_ID NUMBER NOT NULL,
    VEICULO_ID NUMBER NOT NULL,
    MOTORISTA_ID NUMBER NOT NULL,
    ROTA_ID NUMBER,
    DATA_PARTIDA DATE DEFAULT SYSDATE,
    DATA_CHEGADA DATE,
    STATUS VARCHAR2(50),
    CONSTRAINT viagem_id_pk PRIMARY KEY (VIAGEM_ID),
    CONSTRAINT motorista_id_fk FOREIGN KEY (MOTORISTA_ID) REFERENCES MOTORISTA (MOTORISTA_ID),
    CONSTRAINT rotas_id_fk FOREIGN KEY (ROTA_ID) REFERENCES ROTAS (ROTA_ID),
    CONSTRAINT veiculos_id_fk FOREIGN KEY (VEICULO_ID) REFERENCES VEICULOS (VEICULO_ID)
)


-- tabela clientes
CREATE TABLE CLIENTES (
    CLIENTE_ID NUMBER NOT NULL,
    NOME VARCHAR2(100) NOT NULL,
    TELEFONE VARCHAR2(15) NOT NULL,
    EMAIL VARCHAR2(100),
    ENDERECO VARCHAR2(255) NOT NULL,
    CONSTRAINT cliente_id_pk PRIMARY KEY (CLIENTE_ID)
)


-- tabela motorista
CREATE TABLE MOTORISTAS (
    MOTORISTA_ID NUMBER NOT NULL,
    NOME VARCHAR2(200) NOT NULL,
    CNH VARCHAR2(200),
    TELEFONE VARCHAR2(15),
    CONSTRAINT motorista_id_pk PRIMARY KEY(MOTORISTA_ID),
    CONSTRAINT uk_cnh UNIQUE (CNH)
)


-- tabela rotas
CREATE TABLE ROTAS (
    ROTA_ID NUMBER NOT NULL,
    ORIGEM VARCHAR2(100),
    DESTINO VARCHAR2(100),
    DISTANCIA NUMBER(10,2),
    CONSTRAINT rota_id_pk PRIMARY KEY(ROTA_ID),
    CONSTRAINT distancia_check CHECK (DISTANCIA > 0)
)


-- tabela veiculos
CREATE TABLE VEICULOS (
    VEICULO_ID NUMBER NOT NULL,
    PLACA VARCHAR2(10) NOT NULL,
    MODELO VARCHAR2(100),
    CAPACIDADE_CARGA NUMBER,
    STATUS VARCHAR2(20),
    CONSTRAINT veiculo_id_pk PRIMARY KEY (VEICULO_ID),
    CONSTRAINT uk_placa UNIQUE (PLACA)
)