const pool = require('../db/pool');

// Şehirleri getir (isteğe bağlı ülke filtresiyle)
exports.getCities = async (country_id) => {
  let query = 'SELECT * FROM cities';
  let params = [];
  if (country_id) {
    query += ' WHERE country_id = $1';
    params.push(country_id);
  }
  query += ' ORDER BY name';
  const { rows } = await pool.query(query, params);
  return rows;
};

// Tablo oluşturma
exports.createTable = async () => {
  await pool.query(`
    CREATE TABLE IF NOT EXISTS cities (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(100) NOT NULL,
      country_id INTEGER REFERENCES countries(id) ON DELETE CASCADE,
      UNIQUE(name, country_id)
    );
  `);
};

// Seed fonksiyonu
exports.seed = async () => {
  await pool.query(`
    INSERT INTO cities (name, country_id) VALUES
    ('İstanbul', 1),
    ('Berlin', 2),
    ('Paris', 3)
    ON CONFLICT (name, country_id) DO NOTHING;
  `);
}; 