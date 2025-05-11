# 📘 Projeto Node.js MVC com PostgreSQL

Este projeto demonstra a estrutura básica de uma aplicação Node.js utilizando o padrão MVC (Model-View-Controller) com conexão a um banco de dados PostgreSQL.

O objetivo é fornecer um exemplo simples e didático, ideal para iniciantes em backend e APIs REST.

## Estrutura do Projeto

```
📦 mvc-boilerplate
┣ 📂config         → Conexão com o banco (db.js)
┣ 📂models         → Acesso aos dados (aluno.js)
┣ 📂controllers    → Lógica da aplicação (alunoController.js)
┣ 📂routes         → Rotas da aplicação (alunos.js)
┣ 📂views          → Arquivos HTML renderizados com EJS
┃ ┗ 📂alunos
┃   ┗ 📜 index.ejs
┣ 📜 app.js        → Arquivo principal que inicializa a aplicação
┣ 📜 .env          → Variáveis de ambiente (credenciais do banco)
┣ 📜 package.json  → Dependências do projeto
```

> 📌 Essa estrutura segue o padrão MVC, facilitando a manutenção e organização do código.

---

## ✅ Como Executar

### 1. Crie uma cópia do repositório

```bash
git fork https://github.com/afonsobrandaointeli/mvc-boilerplate.git
cd mvc-boilerplate
```

### 2. Instale as dependências

```bash
npm install
npm init -y
npm install express ejs
```

### 3. Configure o banco de dados PostgreSQL

Adicione as seguintes configurações em um arquivo `.env`:

```env
DB_HOST=
DB_PORT=5432
DB_USER=
DB_PASSWORD=
DB_DATABASE=
DB_SSL=true
PORT=3000
```
---

### `init.sql` - Criação da tabela no banco

Script SQL que pode ser executado diretamente no banco para criar a tabela `aluno`.

---

### `runSQLScripts.js` - Executa o SQL automaticamente via Node

Roda o script `init.sql` automaticamente usando Node.js.

```javascript
-- init.sql

CREATE TABLE IF NOT EXISTS aluno (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  email TEXT NOT NULL,
  criado_em TIMESTAMP DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_aluno_email ON aluno (email);
```


---

## 📁 Arquivo `models/aluno.js`

Responsável por interagir diretamente com o banco de dados Supabase:

```javascript
const db = require('../config/db');

module.exports = {
  async create(data) {
    const query = 'INSERT INTO aluno (nome, email) VALUES ($1, $2)';
    const values = [data.nome, data.email];
    return db.query(query, values);
  },

  async findAll() {
    const result = await db.query('SELECT * FROM aluno ORDER BY id ASC');
    return result.rows;
  },

  async update(id, data) {
    const query = 'UPDATE aluno SET nome = $1, email = $2 WHERE id = $3';
    const values = [data.nome, data.email, id];
    return db.query(query, values);
  },

  async delete(id) {
    const query = 'DELETE FROM aluno WHERE id = $1';
    return db.query(query, [id]);
  }
};
```

---

## 📁 Arquivo `controllers/alunoController.js`

Controla o fluxo de dados entre o model e a view.

```javascript
const Aluno = require('../models/aluno');

exports.index = async (req, res) => {
  const alunos = await Aluno.findAll();
  res.render('alunos/index', { alunos });
};

exports.store = async (req, res) => {
  await Aluno.create(req.body);
  res.redirect('/alunos');
};

exports.update = async (req, res) => {
  const { id } = req.params;
  await Aluno.update(id, req.body);
  res.redirect('/alunos');
};

exports.destroy = async (req, res) => {
  const { id } = req.params;
  await Aluno.delete(id);
  res.redirect('/alunos');
};
```

---

## 📁 Arquivo `routes/alunos.js`

Define as rotas para as operações CRUD.

```javascript
const express = require('express');
const router = express.Router();
const controller = require('../controllers/alunoController');

router.get('/', controller.index);
router.post('/', controller.store);
router.post('/edit/:id', controller.update);
router.post('/delete/:id', controller.destroy);

module.exports = router;
```

---

## 📜 Arquivo `app.js`

Configura o servidor Express e integra todas as rotas.

```javascript
const express = require('express');
const app = express();
const path = require('path');
const alunosRoutes = require('./routes/alunos');
const bodyParser = require('body-parser');
require('dotenv').config();

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));

app.use('/alunos', alunosRoutes);

app.get('/', (req, res) => {
  res.redirect('/alunos');
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
});
```

---

## 📄 Arquivo `views/alunos/index.ejs`

Renderiza a interface de cadastro e listagem de alunos.

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CRUD de Alunos</title>
</head>
<body>
  <h1>Cadastro de Alunos</h1>

  <form action="/alunos" method="POST">
    <input name="nome" placeholder="Nome" required>
    <input name="email" placeholder="Email" required>
    <button type="submit">Adicionar</button>
  </form>

  <hr>

  <ul>
    <% alunos.forEach(aluno => { %>
      <li>
        <%= aluno.nome %> - <%= aluno.email %>
        <form action="/alunos/edit/<%= aluno.id %>" method="POST" style="display:inline">
          <input name="nome" placeholder="Novo nome" required>
          <input name="email" placeholder="Novo email" required>
          <button type="submit">Editar</button>
        </form>
        <form action="/alunos/delete/<%= aluno.id %>" method="POST" style="display:inline">
          <button type="submit">Apagar</button>
        </form>
      </li>
    <% }) %>
  </ul>
</body>
</html>
```

---

## ▶️ Como Rodar o Projeto Localmente

1. Inicie o servidor:

```bash
npm run init-db
node app.js
```

4. Acesse [http://localhost:3000](http://localhost:3000) no navegador.

---

## 📄 Licença

Este projeto está sob a licença MIT.
