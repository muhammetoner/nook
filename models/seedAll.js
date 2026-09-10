const countryModel = require('./countryModel');
const cityModel = require('./cityModel');
const businessModel = require('./businessModel');
const menuModel = require('./menuModel');

async function seedAll() {
  await countryModel.createTable();
  await cityModel.createTable();
  await businessModel.createTable();
  await menuModel.createTable();

  await countryModel.seed();
  await cityModel.seed();
  await businessModel.seed();
  await menuModel.seed();

  console.log('Tüm tablolar oluşturuldu ve örnek veriler eklendi.');
  process.exit();
}

seedAll().catch(err => {
  console.error('Seed sırasında hata:', err);
  process.exit(1);
}); 