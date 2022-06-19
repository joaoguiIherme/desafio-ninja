
# Desafio Ninja API

Esta aplicação foi desenvolvida em resposta ao [Desafio Ninja ](#https://github.com/getninjas/desafio-ninja/)para a criação, leitura, edição e exclusão de agendamentos de reuniões para suprir a demanda da lógica de negócio requirido. Ao inicializar é gerado automaticamente, através das Seeds, quatro salas de reuniões e o fuso horário utilizado é o de São Paulo, também configurado ao inicializar a aplicação em `config/initializers/time_zone.rb`
## Status do Projeto 🛠️
Concluído!
## Stack utilizada

**Back-end:** Rails 7.0.3 Ruby 3.0.2

**Testes:** RSpec-rails

**Banco de Dados** Postgresql
## Funcionalidades
#### API
- Operações CRUD (Create, Read, Update and Delete) para Schedulings (Agendamentos) de reuniões.
- Operação de ler/ver as salas disponíveis.


## Instalação

#### Variável de Ambiente
`DEVISE_JWT_SECRET_KEY`

No repositório da aplicação, execute o comando abaixo para gerar jwt-secret-key:
```ruby
    rake secret
```
Copie e cole a chave gerada para o arquivo `.env`.

#### DOCKER
Com o docker instalado na máquina, rode o comando abaixo no diretório da aplicação para a instalação do container.
```bash
  docker-compose up
```
**_Se o postgresql estiver em uso na máquina na portão padrão_** será necessário pará-lo ou alterar a porta. Para parar rode:
```bash
  systemctl stop postgresql
```
## Documentação da API
* Retorna os dados em JSON.
* Para todas as solicitaçõs na API, é neceśsário que o usuário esteja logado ou passe sua chave de autenticação na requisição.

### Room API
#### Retorna informações de todas as salas.

```http
  GET /api/v1/rooms
```

#### Retorna informações de uma sala específica.

```http
  GET /api/v1/rooms/:id
```

### Schedule API
#### Retorna todos os agendamentos cadastrados.

```http
  GET /api/v1/schedulings
```

#### Retorna um agendamento especifico.

```http
  GET /api/v1/schedulings/:id
```

#### Cria um agendamento.
```http
  POST /api/v1/rooms/:room_id/schedulings
```
O id da sala é passado como parâmetro na url da requisição.
Parâmetros:
```json
{
    "scheduling": 
    {
    "start_time": "22-06-2022 14:44",
        "end_time": "22-06-2022 15:19"
    }
}
```

#### Edite um agendamento.
```http
  PUT /api/v1/schedulings/:id
```
O mesmo do método POST, porém os Parâmetros são opcionais.
Parâmetros:
```json
{
    "scheduling": 
    {
    "start_time": "22-07-2022 14:30"
    }
}
```

#### Delete um agendamento.
```http
    DELETE /api/v1/schedulings/:id
```
O id do agendamento é passado como parâmetro na url da requisição.