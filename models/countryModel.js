const pool = require('../db/pool');

// Ülkeleri getir
exports.getCountries = async () => {
  const { rows } = await pool.query('SELECT * FROM countries ORDER BY name');
  return rows;
};

// Tablo oluşturma
exports.createTable = async () => {
  await pool.query(`
    CREATE TABLE IF NOT EXISTS countries (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(100) NOT NULL UNIQUE
    );
  `);
};

// Seed fonksiyonu
exports.seed = async () => {
  await pool.query(`
    INSERT INTO countries (name) VALUES
    ('Türkiye'),
    ('Almanya'),
    ('Fransa')
    ON CONFLICT (name) DO NOTHING;
  `);
}; 