const pgp = require('pg-promise')();
const express = require('express');
const cors = require('cors');

const port = 8080;
const host = '0.0.0.0';

const corsOptions = {
  origin: 'http://localhost:8081',
};
const app = express();
app.use(cors(corsOptions));

const cn = {
  host: process.env.POSTGRES_HOST,
  port: process.env.POSTGRES_PORT,
  database: process.env.POSTGRES_DB,
  user: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
};
const db = pgp(cn);

app.get('/api/greet', async (req, res) => {
  try {
    const name = req.query['name'];
    const { greeting } = await db.one("select * from greeting where id = 1");
    const message = `${greeting} ${name}`;
    console.log({ message });
    res.send(message);
  } catch (err) {
    console.error(err.message);
    res.status(500).send(err.message);
  }
});
app.get('/api/health', async (req, res) => {
  res.send('ok');
});

app.listen(port, host);
console.log(`Running on http://${host}:${port}`);