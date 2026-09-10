const path = require('path');
const Database = require('better-sqlite3');

const dbPath = path.join(__dirname, 'bimekan.db');
const db = new Database(dbPath);
db.pragma('foreign_keys = ON');

// pg.Pool.query(text, params) benzeri basit bir arayüz.
// $1, $2... -> ? dönüştürülüyor ki models/ katmanı hiç değişmeden çalışsın.
async function query(text, params = []) {
  const sql = text.trim().replace(/\$(\d+)/g, '?');
  const isSelect = /^select/i.test(sql);
  const stmt = db.prepare(sql);
  if (isSelect) {
    return { rows: stmt.all(...params) };
  }
  const info = stmt.run(...params);
  return { rows: [], rowCount: info.changes };
}

module.exports = { query };
