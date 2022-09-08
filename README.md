#  💻 Aplicação Ruby
API para importação e listagem do arquivo Cnab.

## Funcionalidades do projeto
- `Importação`: Importar o arquivo Cnab e salvar os dados no banco.

- `Listagem`: Listar por loja as movimentações financeiras e o totalizador do saldo em conta.

## Endpoints
`POST /cnabs` - Necessita importar o arquivo cnab no parâmetro 'arquivo'.

`GET /cnabs/:nomedaloja` - Necessita informar o nome da loja na URL.


 ### Lista com linguagens e/ou tecnologias usadas
- Ruby
- Rails
- Postgres

### IDE
Visual Studio Code

### Como utilizar o projeto

##### 1- Clonar o repositório

  ❯ git clone <a href="https://github.com/graziellemcm/desafio-back-end">Repositório 📈</a>

##### 2- Entrar no diretório
  ❯ cd desafio-back-end

##### 3- Para instalar as dependências e iniciar o projeto, você pode utilizar Bundle:

  ###### Criar o banco de dados
   ❯ rails db:create

  ###### Instalar as dependências
   ❯ bundle install

  ###### Iniciar o projeto
   ❯ rails s


### Autora

   | [<img src="https://avatars.githubusercontent.com/u/62907120?v=4" width=115><br><sub>Grazielle Martins -- FullStack</sub>](https://github.com/graziellemcm)