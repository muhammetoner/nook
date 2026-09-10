require('dotenv').config();
const express = require('express');
const cors = require('cors');
const app = express();
const businessRoutes = require('./routes/businessRoutes');
const cityRoutes = require('./routes/cityRoutes');
const countryRoutes = require('./routes/countryRoutes');
const menuRoutes = require('./routes/menuRoutes');

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
  res.json({ status: 'ok', service: 'bimekan-backend' });
});

// Route'lar
app.use('/businesses', businessRoutes);
app.use('/cities', cityRoutes);
app.use('/countries', countryRoutes);
app.use('/menus', menuRoutes);

// 404 Hatası
app.use((req, res, next) => {
  res.status(404).json({ error: 'Not found' });
});

// Genel hata yönetimi
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(err.status || 500).json({ error: err.message || 'Internal Server Error' });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
}); 