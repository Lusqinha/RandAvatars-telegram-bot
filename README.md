# Projeto RandAvatars Telegram Bot 🎨🤖

Este é um projeto de um bot para o Telegram que gera avatares aleatórios usando a API do DiceBear. O bot permite que os usuários escolham entre diferentes estilos de avatares e recebam uma imagem PNG gerada com base no estilo selecionado.

## Configuração 🔧

Antes de executar o bot, é necessário configurar o token do bot do Telegram. Para isso, siga as instruções abaixo:

1. Crie um arquivo `.env` na raiz do projeto.
2. Adicione a seguinte linha ao arquivo `.env`:

    ```
    TELEGRAM_BOT_TOKEN=SEU_TOKEN_AQUI
    ```

    Substitua `SEU_TOKEN_AQUI` pelo token do seu bot do Telegram.

## Instalação 🛠️

Siga as etapas abaixo para instalar e executar o bot:

1. Clone este repositório:

    ```
    git clone https://github.com/Lusqinha/randavatars-telegram-bot.git
    ```

2. Acesse o diretório do projeto:

    ```
    cd randavatars-telegram-bot
    ```

3. Instale as dependências do projeto:

    ```
    bundle install
    ```

4. Execute o bot:

    ```
    ruby app.rb
    ```

## Uso 🚀

Após iniciar o bot, você pode interagir com ele no Telegram. Abra o aplicativo do Telegram e pesquise pelo nome do seu bot. Inicie uma conversa com o bot e digite `/avatar` para começar a gerar avatares aleatórios.

O bot irá apresentar uma lista de estilos disponíveis. Basta escolher um estilo digitando o nome correspondente. O bot irá gerar um avatar com base no estilo selecionado e enviar a imagem PNG para você.

## Contribuição 🤝

Contribuições são bem-vindas! Se você quiser contribuir para este projeto, siga as etapas abaixo:

1. Fork este repositório.
2. Crie uma branch para sua contribuição:

    ```
    git checkout -b minha-contribuicao
    ```

3. Faça as alterações desejadas.
4. Faça o commit das suas alterações:

    ```
    git commit -m "Minha contribuição"
    ```

5. Faça o push para o seu fork:

    ```
    git push origin minha-contribuicao
    ```

6. Abra um pull request neste repositório.

## Licença 📄

Este projeto está licenciado sob a [MIT License](LICENSE).
