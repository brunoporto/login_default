# Login Default

MeuSistema Login é uma GEM Rails que facilita a implementação de autenticação no sistema utilizando devise.

* A GEM fornece a maioria das configurações já criadas, bastando editar o arquivo login_default.yml e informar as chaves.
* Olhe o arquivo login_default.gemspec para verificar as dependências.
* É necessário que você tenha o model User em seu aplicativo para essa essa Engine.
* É necessário que no seu aplicativo o routes.rb tenha a referência resources :users

## Instalação

* Edite o seu arquivo Gemfile e remova a gem **devise** e qualquer outra gem **devise_**
* Adicione a gem login_default:
```ruby
gem 'login_default', :git => 'https://OAUTH_TOKEN:x-oauth-basic@github.com/brunotporto/login_default'
```

* Remova qualquer referência do **devise_for** em routes.rb e **devise** do seu Model User

* Atualize sua lista de gem no terminal:
```sh
bundle install
```

* Adicione essa linha no seu **Model User**:
```ruby
    include LoginDefault::User
```

* Instale as dependências e o login_default, caso já tenha alguns dos arquivos você pode optar por manter ou sobrescrever:
```sh
rails generate devise:install
rails generate devise_invitable:install
rails generate login_default:install
rake db:migrate
```

**ATENÇÃO** : Para evitar conflitos de mensagens do Login Default com seu aplicativo, remova os arquivos `devise.*.yml` e `devise_invitable.*.yml` do seu diretório `/config/locales/ `

#### Edite o arquivo `config/initializers/devise.rb`:

* Altere `config.mailer_sender` para seu e-mail.

* Altere o valor de `config.pepper` para um valor *unico*. Esse valor *deve ser unico*, pois é usado criptografia das suas senhas. Você pode gerar um hash aleatório acessando o *irb* e rodando o seguinte código
```ruby
require 'securerandom'
print %Q(config.pepper = "#{SecureRandom.hex(64)}"\n)
```

* Edite seus ambientes e adicione a URL de acesso dos seus e-mails:
```ruby
config.action_mailer.default_url_options = { :host => 'localhost:3000' }
```

* Comente a linha `config.sign_out_via = :delete` pois ela é configurada pelo MeuSistema Login
```ruby
# config.sign_out_via = :delete
```

#### Edite o arquivo `config/initializers/login_default.rb`:

* Configure para habilitar as opções desejadas

#### Edite o arquivo `config/login_default.yml`:

* Informe as chaves necessárias para cada tipo de *provider* e *environment*

#### Insira a validação de acesso no seu controller:

* Adicione `before_action :authenticate_user!` e outros helpers devise em seus controllers conforme necessário.
* O padrão é adicionar em `controllers/application_controller.rb`

#### Informações do Provider:
Ao efetuar login via Google é disponibilizado os dados info do provider através do helper  `current_provider`, onde provider é o nome do provedor da autenticação:
`google`, `sistema`

Para cada provider talvez você tenha acesso a informações diferentes utilizando o helper `current_provider`:

* Google `:name, :email, :first_name=>, :last_name, :image, :provider`
* PassaporteWeb `:uuid, :nickname, :email=>, :first_name, :last_name, :name, :provider`
* Sistema `:provider`  

Para identificar qual provider (provedor da autenticação) está sendo utilizado pelo usuário há um helper `login_default_provider` que retorna o nome do provider.
*DICA: Utilize esse provider como classe do seu body para manipular sua barra ou elementos do seu documento de acordo com o provider. Ex: Uso da barra PassaporteWeb*
```html
<body class="<%= current_provider[:provider] %>"></body>
```

#### Caso queira alterar algum comportamento padrão do Devise:

* Crie um novo `controller` em sua aplicação e herde de um dos controllers da gem MeuSistema Login. Por exemplo, para o `controller` Sessions, crie um arquivo `app/controllers/sessions_controller.rb` e defina os métodos que serão alterados:
```ruby
class SessionsController < LoginDefault::SessionsController
    def new
      # Algum codigo especifico para sua aplicacao
      # ...
      # ...

      super # executa o código do controller herdado
    end

    def create
      # Algum codigo especifico para sua aplicacao
      # ...
      # ...

      super # executa o código do controller herdado
    end
end
```
* Adicione as actions do `controller` criado em seu arquivo `config/routes.rb`:
```ruby
devise_scope :user do
    # Override Devise Controller
    get  'authentication/sign_in', controller: :sessions, action: :new
    post 'authentication/sign_in', controller: :sessions, action: :create
end
```
#### Outras configurações (Devise, DeviseInvitable)
* Devise [README](https://github.com/plataformatec/devise#readme)
* DeviseInvitable [README](https://github.com/scambra/devise_invitable#readme)

## Atualizações

#### Versões Menores que 0.10.0
* Comente a linha `config.sign_out_via = :delete` em seu `config/initializers/devise.rb`