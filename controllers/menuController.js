const menuModel = require('../models/menuModel');

// Belirli bir işletmeye ait menüleri listele
exports.getMenus = async (req, res, next) => {
  try {
    const { business_id } = req.query;
    if (!business_id) {
      return res.status(400).json({ error: 'business_id is required' });
    }
    const menus = await menuModel.getMenusByBusinessId(business_id);
    res.json(menus);
  } catch (err) {
    next(err);
  }
}; 