const pool = require('../db/pool');

// İşletmeleri getir (isteğe bağlı şehir ve kategori filtresiyle)
exports.getBusinesses = async (city_id, category) => {
  let query = 'SELECT * FROM businesses';
  let params = [];
  if (city_id && category) {
    query += ' WHERE city_id = $1 AND category = $2';
    params = [city_id, category];
  } else if (city_id) {
    query += ' WHERE city_id = $1';
    params = [city_id];
  } else if (category) {
    query += ' WHERE category = $1';
    params = [category];
  }
  query += ' ORDER BY name';
  const { rows } = await pool.query(query, params);
  return rows;
};

// Tekil işletme getir
exports.getBusinessById = async (id) => {
  const { rows } = await pool.query('SELECT * FROM businesses WHERE id = $1', [id]);
  return rows[0];
};

// Tablo oluşturma
exports.createTable = async () => {
  await pool.query(`
    CREATE TABLE IF NOT EXISTS businesses (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(100) NOT NULL,
      description TEXT,
      city_id INTEGER REFERENCES cities(id) ON DELETE CASCADE,
      category VARCHAR(100),
      image_url TEXT,
      UNIQUE(name, city_id)
    );
  `);
};

// Seed fonksiyonu
exports.seed = async () => {
  await pool.query(`
    INSERT INTO businesses (name, description, city_id, category, image_url) VALUES
    ('Kebapçı', 'En iyi kebaplar', 1, 'Yemek', 'https://example.com/kebap.jpg'),
    ('Cafe Berlin', 'Alman kahvesi', 2, 'Kafe', 'https://example.com/berlin.jpg'),
    ('Paris Bistro', 'Fransız mutfağı', 3, 'Restoran', 'https://example.com/paris.jpg')
    ON CONFLICT (name, city_id) DO NOTHING;
  `);
}; 