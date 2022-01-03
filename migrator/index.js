const fs = require('fs');
const path = require('path');
const pgp = require('pg-promise')();

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

const main = async () => {
  try {
    const migrationDir = './migration';
    const migrationNameList = fs.readdirSync(migrationDir);
    for (const migrationName of migrationNameList) {
      console.log(`\n${migrationName}`);
      const migrationSql = fs.readFileSync(path.join(migrationDir, migrationName), 'utf-8');
      console.log(migrationSql)
      await db.none(migrationSql);
    }
    console.log('migration completed successfully');
  } catch (err) {
    console.error(err);
  }
}

main();