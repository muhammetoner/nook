const businessModel = require('../models/businessModel');

// İşletmeleri listele ve filtrele
exports.getBusinesses = async (req, res, next) => {
  try {
    const { city_id, category } = req.query;
    const businesses = await businessModel.getBusinesses(city_id, category);
    res.json(businesses);
  } catch (err) {
    next(err);
  }
};

// Tekil işletme detayları
exports.getBusinessById = async (req, res, next) => {
  try {
    const business = await businessModel.getBusinessById(req.params.id);
    if (!business) {
      return res.status(404).json({ error: 'Business not found' });
    }
    res.json(business);
  } catch (err) {
    next(err);
  }
}; 