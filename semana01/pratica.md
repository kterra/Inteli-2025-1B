# Prática Guiada na pasta `/src`

## Passo 1: Inicializar o Projeto com npm

Abra o terminal e navegue até a pasta do seu projeto. Em seguida, execute o comando:

`npm init`

Preencha as informações solicitadas ou pressione Enter para usar os valores padrão. Isso criará um arquivo `package.json` na pasta do seu projeto.

## Passo 2: Instalar Dependências

Para um servidor básico, você precisará do Express.js. Instale-o usando npm:

`npm install express`

## Passo 3: Criar o Arquivo `server.js`

Agora, crie um arquivo chamado `server.js` na raiz da pasta do seu projeto e adicione o seguinte código:

```jsx
const express = require('express');
const app = express();
const PORT = 3000;

app.use(express.json()); *// Middleware para lidar com JSON// Rota de teste*
app.get('/', (req, res) => {
    res.send('Servidor Node.js funcionando!');
});

*// Iniciar o servidor*
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});
```

## Passo 4: Executar o Servidor

Para iniciar o servidor, execute o seguinte comando no terminal:

`node server.js`

Agora, você pode acessar o servidor em `http://localhost:3000/` no seu navegador.

## Adicionar Script no `package.json`

Para facilitar o início do servidor, você pode adicionar um script no arquivo `package.json`. Abra o arquivo e adicione a seguinte linha na seção `scripts`:

```yaml
"scripts": {
  "start": "node server.js"
},
```

Depois disso, você pode iniciar o servidor com:

`npm start`

Pronto! Você tem uma aplicação Node.js básica funcionando. 😊

## Exemplo Completo do `package.json`

Seu arquivo `package.json` deve ter algo parecido com isso após a instalação do Express:

```yaml
{
  "name": "nome-do-projeto",
  "version": "1.0.0",
  "description": "",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "express": "^4.18.2"
  }
}
```

Substitua `"nome-do-projeto"` pelo nome que você escolheu durante o `npm init`.

---

Mas se você quiser se adiantar, temos o nosso boilerplate: https://github.com/afonsobrandaointeli/mvc-boilerplate
