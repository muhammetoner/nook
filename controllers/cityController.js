const cityModel = require('../models/cityModel');

// Şehirleri listele (isteğe bağlı ülke filtresiyle)
exports.getCities = async (req, res, next) => {
  try {
    const { country_id } = req.query;
    const cities = await cityModel.getCities(country_id);
    res.json(cities);
  } catch (err) {
    next(err);
  }
}; 