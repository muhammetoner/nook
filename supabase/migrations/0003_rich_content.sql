-- Daha zengin keşif içeriği: yeni ülke/şehir/mekan/menü + puan/fiyat/öne çıkan

insert into countries (name) values ('İtalya')
on conflict (name) do nothing;

insert into cities (name, country_id)
  select 'Ankara', id from countries where name = 'Türkiye'
  union all select 'İzmir', id from countries where name = 'Türkiye'
  union all select 'Münih', id from countries where name = 'Almanya'
  union all select 'Lyon', id from countries where name = 'Fransa'
  union all select 'Roma', id from countries where name = 'İtalya'
on conflict (name, country_id) do nothing;

-- mevcut 3 mekana puan/fiyat/öne çıkan ata
update businesses set rating = 4.6, price_level = 2, featured = true,
  image_url = 'https://picsum.photos/seed/kebapci/640/420'
  where name = 'Kebapçı';
update businesses set rating = 4.4, price_level = 2, featured = false,
  image_url = 'https://picsum.photos/seed/cafeberlin/640/420'
  where name = 'Cafe Berlin';
update businesses set rating = 4.7, price_level = 3, featured = true,
  image_url = 'https://picsum.photos/seed/parisbistro/640/420'
  where name = 'Paris Bistro';

insert into businesses (name, description, city_id, category, image_url, rating, price_level, featured)
  select 'Boğaz Manzaralı Kahvaltı', 'Serpme kahvaltı ve taze simit, Boğaz manzaralı teras', id, 'Kahvaltı', 'https://picsum.photos/seed/bogaz-kahvalti/640/420', 4.8, 2, true from cities where name='İstanbul'
  union all select 'Nostalji Bar', 'Canlı müzik eşliğinde retro kokteyller', id, 'Bar', 'https://picsum.photos/seed/nostalji-bar/640/420', 4.3, 2, false from cities where name='İstanbul'
  union all select 'Tatlı Dükkanı', 'El yapımı künefe ve şerbetli tatlılar', id, 'Tatlıcı', 'https://picsum.photos/seed/tatli-dukkani/640/420', 4.5, 1, false from cities where name='İstanbul'
  union all select 'Kale Restoran', 'Ankara kalesi manzaralı geleneksel Anadolu mutfağı', id, 'Restoran', 'https://picsum.photos/seed/kale-restoran/640/420', 4.5, 2, true from cities where name='Ankara'
  union all select 'Öğrenci Kafe', 'Uygun fiyatlı kahve ve sessiz çalışma köşeleri', id, 'Kafe', 'https://picsum.photos/seed/ogrenci-kafe/640/420', 4.1, 1, false from cities where name='Ankara'
  union all select 'Kordon Balık', 'Ege usulü taze balık ve meze', id, 'Restoran', 'https://picsum.photos/seed/kordon-balik/640/420', 4.6, 3, false from cities where name='İzmir'
  union all select 'Saat Kulesi Kahve', 'Konak meydanına nazır üçüncü nesil kahveci', id, 'Kafe', 'https://picsum.photos/seed/saat-kulesi/640/420', 4.4, 1, false from cities where name='İzmir'
  union all select 'Döner Palace', 'Berlin''in en sevilen Türk döner zinciri', id, 'Yemek', 'https://picsum.photos/seed/doner-palace/640/420', 4.2, 1, false from cities where name='Berlin'
  union all select 'Spree Bar', 'Nehir kenarında el yapımı biralar', id, 'Bar', 'https://picsum.photos/seed/spree-bar/640/420', 4.5, 2, true from cities where name='Berlin'
  union all select 'Bavyera Bira Evi', 'Geleneksel Bavyera birası ve pretzel', id, 'Bar', 'https://picsum.photos/seed/bavyera-bira/640/420', 4.6, 2, false from cities where name='Münih'
  union all select 'Marienplatz Restoran', 'Şehir meydanında klasik Alman mutfağı', id, 'Restoran', 'https://picsum.photos/seed/marienplatz/640/420', 4.3, 2, false from cities where name='Münih'
  union all select 'Montmartre Kahve', 'Sanatçı mahallesinde küçük ama sevimli kahveci', id, 'Kafe', 'https://picsum.photos/seed/montmartre/640/420', 4.7, 2, false from cities where name='Paris'
  union all select 'Éclair Tatlı', 'Rengarenk éclair ve makaron vitrini', id, 'Tatlıcı', 'https://picsum.photos/seed/eclair-tatli/640/420', 4.8, 2, true from cities where name='Paris'
  union all select 'Lyon Lokantası', 'Fransız gastronomi başkentinde geleneksel lezzetler', id, 'Restoran', 'https://picsum.photos/seed/lyon-lokanta/640/420', 4.5, 3, false from cities where name='Lyon'
  union all select 'Trattoria Roma', 'Odun fırınında pizza ve ev yapımı makarna', id, 'Restoran', 'https://picsum.photos/seed/trattoria-roma/640/420', 4.7, 2, true from cities where name='Roma'
  union all select 'Espresso Bar Roma', 'Ayaküstü hızlı ve güçlü İtalyan espresso kültürü', id, 'Kafe', 'https://picsum.photos/seed/espresso-roma/640/420', 4.4, 1, false from cities where name='Roma'
on conflict (name, city_id) do nothing;

insert into menus (business_id, title, description, price, image_url)
  select id, 'Simit Tabağı', 'Peynir, zeytin, reçel ile serpme kahvaltı', 220, null from businesses where name='Boğaz Manzaralı Kahvaltı'
  union all select id, 'Menemen', 'Tereyağlı köy yumurtası menemen', 150, null from businesses where name='Boğaz Manzaralı Kahvaltı'
  union all select id, 'Nostalji Kokteyl', 'Ev yapımı şurup ile imza kokteyl', 280, null from businesses where name='Nostalji Bar'
  union all select id, 'Künefe', 'Antep fıstıklı sıcak künefe', 180, null from businesses where name='Tatlı Dükkanı'
  union all select id, 'Mantı', 'El açması yoğurtlu mantı', 190, null from businesses where name='Kale Restoran'
  union all select id, 'Filtre Kahve', 'Taze çekilmiş filtre kahve', 90, null from businesses where name='Öğrenci Kafe'
  union all select id, 'Levrek Izgara', 'Günlük av Ege levreği', 420, null from businesses where name='Kordon Balık'
  union all select id, 'Flat White', 'Çift shot espresso ile flat white', 110, null from businesses where name='Saat Kulesi Kahve'
  union all select id, 'Et Döner', 'Odun ateşinde kavrulmuş et döner', 9, null from businesses where name='Döner Palace'
  union all select id, 'Craft Bira', 'Yerel üretim IPA', 6, null from businesses where name='Spree Bar'
  union all select id, 'Weissbier', 'Klasik Bavyera buğday birası', 5.5, null from businesses where name='Bavyera Bira Evi'
  union all select id, 'Schnitzel', 'Patates salatası ile şnitzel', 16, null from businesses where name='Marienplatz Restoran'
  union all select id, 'Cafe Crème', 'Kadife köpüklü sütlü kahve', 4.5, null from businesses where name='Montmartre Kahve'
  union all select id, 'Éclair Çikolata', 'Belçika çikolatalı éclair', 5, null from businesses where name='Éclair Tatlı'
  union all select id, 'Quenelle', 'Lyon usulü klasik quenelle', 22, null from businesses where name='Lyon Lokantası'
  union all select id, 'Margherita Pizza', 'Odun fırınında ince hamur margherita', 14, null from businesses where name='Trattoria Roma'
  union all select id, 'Espresso', 'Klasik ristretto espresso', 1.5, null from businesses where name='Espresso Bar Roma'
on conflict (business_id, title) do nothing;
