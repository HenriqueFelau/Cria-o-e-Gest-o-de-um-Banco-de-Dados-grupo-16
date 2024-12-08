# Banco de Dados: Sistema de Logística

## Objetivo
Este banco de dados foi projetado para gerenciar a logística de entregas, integrando informações de motoristas, veículos, rotas, viagens, clientes e entregas realizadas. O sistema permite monitorar e controlar os processos de transporte, desde a alocação de recursos até a entrega ao cliente final, garantindo eficiência e rastreabilidade.

## Estrutura do Banco de Dados
O banco de dados está organizado em seis tabelas principais:

### 1. **MOTORISTAS**
   - **Descrição**: Armazena informações dos motoristas responsáveis pelas viagens.
   - **Colunas**:
     - `MOTORISTA_ID`: Identificador único do motorista.
     - `NOME`: Nome do motorista.
     - `CNH`: Número da CNH (Carteira Nacional de Habilitação).
     - `TELEFONE`: Contato do motorista.
   - **Relacionamento**: Relaciona-se com a tabela `VIAGENS`, indicando qual motorista realizou a viagem.

---

### 2. **VEICULOS**
   - **Descrição**: Contém dados sobre os veículos utilizados para transporte.
   - **Colunas**:
     - `VEICULO_ID`: Identificador único do veículo.
     - `PLACA`: Placa do veículo.
     - `MODELO`: Modelo do veículo.
     - `CAPACIDADE_CARGA`: Capacidade de carga em toneladas.
     - `STATUS`: Status atual do veículo (disponível, em manutenção, etc.).
   - **Relacionamento**: Associado à tabela `VIAGENS`, indicando qual veículo foi usado.

---

### 3. **ROTAS**
   - **Descrição**: Registra as rotas disponíveis para as viagens.
   - **Colunas**:
     - `ROTA_ID`: Identificador único da rota.
     - `ORIGEM`: Local de partida.
     - `DESTINO`: Local de destino.
     - `DISTANCIA`: Distância entre origem e destino (em quilômetros).
   - **Relacionamento**: Conectada à tabela `VIAGENS`, especificando a rota percorrida.

---

### 4. **VIAGENS**
   - **Descrição**: Registra os detalhes das viagens realizadas.
   - **Colunas**:
     - `VIAGEM_ID`: Identificador único da viagem.
     - `VEICULO_ID`: Referência ao veículo utilizado.
     - `MOTORISTA_ID`: Referência ao motorista responsável.
     - `ROTA_ID`: Referência à rota percorrida.
     - `DATA_PARTIDA`: Data e hora de partida.
     - `DATA_CHEGADA`: Data e hora de chegada.
     - `STATUS`: Status da viagem (concluída, em andamento, etc.).
   - **Relacionamentos**:
     - 1:N com `MOTORISTAS`, `VEICULOS` e `ROTAS`.
     - 1:N com `ENTREGAS`, indicando as entregas realizadas na viagem.

---

### 5. **CLIENTES**
   - **Descrição**: Armazena informações sobre os clientes que recebem as entregas.
   - **Colunas**:
     - `CLIENTE_ID`: Identificador único do cliente.
     - `NOME`: Nome do cliente.
     - `TELEFONE`: Contato do cliente.
     - `EMAIL`: Endereço de email.
     - `ENDERECO`: Endereço do cliente.
   - **Relacionamento**: Associado à tabela `ENTREGAS`, identificando quem recebeu a entrega.

---

### 6. **ENTREGAS**
   - **Descrição**: Detalha as entregas realizadas para os clientes.
   - **Colunas**:
     - `ENTREGA_ID`: Identificador único da entrega.
     - `VIAGEM_ID`: Referência à viagem relacionada.
     - `CLIENTE_ID`: Referência ao cliente destinatário.
     - `ENDERECO_ENTREGA`: Local de entrega.
     - `STATUS`: Status da entrega (pendente, concluída, etc.).
   - **Relacionamentos**:
     - 1:N com `VIAGENS`.
     - 1:N com `CLIENTES`.

---

## Relacionamentos
1. **Motoristas e Viagens**: Cada motorista pode realizar várias viagens, mas uma viagem é realizada por apenas um motorista.
2. **Veículos e Viagens**: Cada veículo pode ser usado em várias viagens, mas uma viagem utiliza um único veículo.
3. **Rotas e Viagens**: Cada viagem percorre uma única rota, enquanto uma rota pode ser utilizada em diversas viagens.
4. **Clientes e Entregas**: Um cliente pode receber várias entregas, mas cada entrega pertence a apenas um cliente.
5. **Viagens e Entregas**: Uma viagem pode incluir várias entregas, mas cada entrega está associada a uma única viagem.

---

## Como executar os scripts no Oracle

Para executar os scripts SQL no Oracle, siga os passos abaixo:

1. **Abra o SQL Live**:
   - Faça Login ou crie cadastro no **SQL Live**.

2. **Crie o esquema e as tabelas**:
   - Execute os scripts DDL para criar o esquema e as tabelas. Exemplo:
    ```sql
    CREATE TABLE VEICULOS (
    VEICULO_ID NUMBER NOT NULL,
    PLACA VARCHAR2(10) NOT NULL,
    MODELO VARCHAR2(100),
    CAPACIDADE_CARGA NUMBER,
    STATUS VARCHAR2(20),
    CONSTRAINT veiculo_id_pk PRIMARY KEY (VEICULO_ID),
    CONSTRAINT uk_placa UNIQUE (PLACA)
    );
    ```
   - É necessário criar tabelas sem Foreign Keys antes.

3. **Insira dados de exemplo (se necessário)**:
   - Para popular o banco de dados com dados de exemplo, execute os comandos DML. Exemplo:
     ```sql
     INSERT INTO VEICULOS (VEICULO_ID, PLACA, MODELO, CAPACIDADE_CARGA, STATUS)
     VALUES (1, 'LVH-5796', 'Legend 3.2/3.5', 1000, 'disponível');
     ```

4. **Realize consultas ou manipulações**:
   - Utilize comandos SQL para interagir com o banco de dados. Exemplo:
     ```sql
     SELECT * FROM VIAGENS;
     ```
---

Este banco de dados foi projetado para garantir a eficiência e a rastreabilidade no gerenciamento de processos logísticos, atendendo a todas as etapas envolvidas no transporte de mercadorias.

---

## Integrantes do Projeto:
- Danilo de Sousa Gonçalves - 178927
- Guilherme Oliveira Esteves - 189795
- Henrique Oliveira Felau - 180414
