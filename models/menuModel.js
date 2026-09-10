const pool = require('../db/pool');

// Belirli bir işletmeye ait menüleri getir
exports.getMenusByBusinessId = async (business_id) => {
  const { rows } = await pool.query('SELECT * FROM menus WHERE business_id = $1 ORDER BY title', [business_id]);
  return rows;
};

// Tablo oluşturma
exports.createTable = async () => {
  await pool.query(`
    CREATE TABLE IF NOT EXISTS menus (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      business_id INTEGER REFERENCES businesses(id) ON DELETE CASCADE,
      title VARCHAR(100) NOT NULL,
      description TEXT,
      price NUMERIC(10,2),
      image_url TEXT,
      UNIQUE(business_id, title)
    );
  `);
};

// Seed fonksiyonu
exports.seed = async () => {
  await pool.query(`
    INSERT INTO menus (business_id, title, description, price, image_url) VALUES
    (1, 'Adana Kebap', 'Acılı kebap', 120.00, 'https://example.com/adana.jpg'),
    (2, 'Kahve', 'Sıcak Alman kahvesi', 40.00, 'https://example.com/kahve.jpg'),
    (3, 'Kruvasan', 'Tereyağlı kruvasan', 50.00, 'https://example.com/kruvasan.jpg')
    ON CONFLICT (business_id, title) DO NOTHING;
  `);
}; 