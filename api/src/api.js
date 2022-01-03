const pgp = require('pg-promise')();
const express = require('express');
const cors = require('cors');

const host = '0.0.0.0';
const port = process.env.API_PORT;
const deployEnv = process.env.DEPLOY_ENV;

const corsOptions = {
  origin: process.env.APP_ORIGIN,
};
const app = express();
app.use(cors(corsOptions));

const cn = (() => {
  if (process.env.DB_SECRET) {
    const { username, host, dbname, password, port } = JSON.parse(process.env.DB_SECRET)
    return {
      host,
      port,
      database: dbname,
      user: username,
      password
    };
  } else {
    return {
      host: process.env.POSTGRES_HOST,
      port: process.env.POSTGRES_PORT,
      database: process.env.POSTGRES_DB,
      user: process.env.POSTGRES_USER,
      password: process.env.POSTGRES_PASSWORD,
    };
  }
})();
const db = pgp(cn);

app.get('/api/greet', async (req, res) => {
  try {
    const name = req.query['name'];
    const { greeting } = await db.one("select * from greeting where id = 1");
    const message = `From ${deployEnv}: ${greeting} ${name}`;
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

app.listen(port, host, () => {
  console.log(`Running "${deployEnv}" on http://${host}:${port}`);
});
