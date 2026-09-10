const countryModel = require('../models/countryModel');

// Ülkeleri listele
exports.getCountries = async (req, res, next) => {
  try {
    const countries = await countryModel.getCountries();
    res.json(countries);
  } catch (err) {
    next(err);
  }
}; 