## 📚 Sumário

- [Descrição](#descrição)
- [Instalação](#instalação)
- [Funcionalidades](#funcionalidades)
- [Tecnologias](#tecnologias)
- [Arquitetura](#arquitetura)
- [Telas](#telas)
- [Observação](#observação)

## Descrição
<p>

Este teste técnico tem como objetivo representar desafios que vivemos diariamente na empresa. O teste só vai ser aceito se todos os critérios de aceite forem preenchidos, pessoas com o teste incompleto não passarão para próxima etapa.

Você deve construir uma pequena aplicação de e-commerce whitelabel. Dois clientes querem montar um site para vender seus produtos, essas lojas vão consumir as informações disponibilizadas por 2 fornecedores.
</p>
<p>
  
  ### Frontend

Um dos nossos projetos consiste de um mesmo sistema ser utilizado por vários clientes e a essa estrutura damos o nome de **Whitelabel**. 

Para que essa estrutura funcione é necessário que na api tenhamos uma tabela **clients** que armazene uma URL específica de cada cliente.

<aside>
❓

Recomendo utilizar a resolução de DNS local para permitir a utilização e identificação de diferentes clientes. Pesquisem sobre o arquivo `/etc/hosts`

</aside>

### Critérios de aceite

- [ ]  Deve ser feito usando Flutter
- [ ]  Deve ter a funcionalidade de Login
- [ ]  Deve ser possível listar e filtrar os produtos
    - [ ]  A consulta de produtos deve bater na API que montou, e não diretamente na API de fornecedores
- [ ]  Deve ter a funcionalidade de Whitelabel
    - [ ]  A aplicação deve ter variações no tema a depender do cliente que estiver acessando a aplicação. Exemplo: Se acessarmos http://devnology.com:8000 o site vai ter a cor primária o verde, mas se acessarmos http://in8.com:8000 o site vai ser roxo
- [ ]  Documentação da arquitetura utilizada no repositório
</p>
<p>
  
  ### API

Fica a critério de cada um a forma de persistir os dados, mas o motivo de determinada tecnologia ter sido escolhida vai ser avaliada na próxima etapa.

### Critérios de aceite

- [ ]  Deve ser feito usando NestJS
- [ ]  Deve ter a funcionalidade de Login
- [ ]  Deve ter a funcionalidade para diferenciar os clientes
- [ ]  Collection e Documentação dos endpoints
- [ ]  Criar DER do Banco de Dados
</p>

## Instalação
1. Clone e configure a API que está nesse repositório (no repositório tem o tutorial)
```bash
  https://github.com/EduardoGomesSa/api-whitelabel
```
2. Clone o repósitorio do aplicativo
```bash
  git clone https://github.com/EduardoGomesSa/app_whitelabel.git
```
3. Coloque o link da sua api na variável ``base`` no arquivo Urls que fica em src/core/utils
4. Instale as dependências
```bash
  flutter pub get
```
## Funcionalidades
- ``Login``: usuários podem logar-se com e-mail e senha
- ``Logout``: Usuários podem sair do app quando desejarem
- ``Ordernação por preço``: Usuário pode visualizar produtos pelo maior ou menor valor
- ``Buscar por nome``: usuário pode buscar produtos pelo nome ou partes dele
- ``Informações do produto``: Usuário pode ver detalhes do produto
- ``Whitelabel``: layout do app muda dependendo do cliente
  
## Tecnologias
- ``Flutter``: Framework multiplataforma que usa Dart para criar apps nativos com alta performance e código seguro.
- ``GetX``: Biblioteca para Flutter que oferece gerenciamento de estado, injeção de dependência e navegação de forma simples e eficiente.
- ``Dio``: Cliente HTTP para Flutter com suporte a interceptors, timeouts, cancelamento de requisições e recursos avançados de rede.
- ``shared_preferences``: Armazenamento local simples para salvar dados leves como configurações e preferências do usuário.
- ``fluttertoast``: Biblioteca para exibir mensagens rápidas (toasts) na tela, útil para feedbacks imediatos ao usuário, como erro ao fazer login, logout com sucesso, erro ao buscar produtos etc.

## Arquitetura

<p>
  Como o teste foi um app pequeno, com poucas telas, o padrão escolhido foi o MVC com adição da camada de Repositories, que são os responsáveis por realizar as requisições a API.
</p>

- ``Pages``: São as telas exibidas aos usuários
- ``Controllers``: Gerenciam a ligação das pages com os models/repositories, fornecendo dados ou removendo-os da page quando necessário
- ``Models``: Representações das entidades do banco de dados / API como objetos no paradigma POO
- ``Repositories``: Camada extra adicionada ao MVC para retirar do model a responsabilidade de lidar com as requisições, o que facilita a manutenção do código
- ``Core``: Responsável por armazenar recursos que serão compartilhados por toda a aplicação, como services, widgets personalizados, routes etc
- ``Bindings``: Responsável por definir quais controllers, serviços ou repositórios devem ser criados quando uma rota for aberta.
<img width="253" height="438" alt="image" src="https://github.com/user-attachments/assets/ae2bf7e0-8632-4b42-a878-b25b84b4ddd0" />

## Telas
### Auth
<p align="left">
  <img src="https://github.com/user-attachments/assets/a0f690bb-5952-4dd1-aead-c9656cd6d0f0" alt="login_app" width="250" />
  &nbsp;&nbsp;&nbsp;
</p>

### Tela de usuários de empresas diferentes
<p align="left">
  <img src="https://github.com/user-attachments/assets/8879ce3d-a0f0-4992-ab8a-8c8579931c13" alt="login_app" width="250" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/2f62f1eb-9619-4bc7-9f92-08fc78d8cd3e" alt="register_app" width="250" />
  &nbsp;&nbsp;&nbsp;
</p>

### Exemplos em funcionamento
<p align="left">
  <img src="https://github.com/user-attachments/assets/08853f89-5c8e-43d7-9ee5-39786213420d" alt="login_app" width="250" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/0adb92a9-d3b2-4818-a4cf-38d9eae52296" alt="register_app" width="250" />
  &nbsp;&nbsp;&nbsp;
</p>

## Observação
<p>⚠️ Atenção! ⚠️ O provedor de imagens dos produtos que vinham da API passada para o teste está fora do ar há um tempo, então eu utilizei uma abordagem alternativa, por isso as imagens de produtos são todas iguais,
mas elas mudam conforme o usuário abre o app, é apenas para servir de ilustração.</p>


