const express = require('express');
const cors = require('cors');

const port = 8080;
const host = '0.0.0.0';

const corsOptions = {
  origin: 'http://localhost:8081',
};
const app = express();
app.use(cors(corsOptions));
app.get('/api/greet', async (req, res) => {
  try {
    const name = req.query['name'];
    const message = `Hello ${name}`;
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