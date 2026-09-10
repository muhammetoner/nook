-- Gezilecek yerler / tarihi mekanlar

create table attractions (
  id bigint generated always as identity primary key,
  name text not null,
  category text,
  city_id bigint references cities(id) on delete cascade,
  era text,
  short_description text,
  story text,
  cover_image_url text,
  gallery text[] default '{}',
  created_at timestamptz not null default now(),
  unique (name, city_id)
);

alter table attractions enable row level security;

create policy "public read attractions" on attractions for select using (true);

create policy "admin write attractions" on attractions for all
  using (exists(select 1 from profiles where id = auth.uid() and role = 'admin'))
  with check (exists(select 1 from profiles where id = auth.uid() and role = 'admin'));

-- Örnek veri
insert into attractions (name, category, city_id, era, short_description, story, cover_image_url, gallery)
  select 'Ayasofya', 'Dini Yapı', id, '537 · Bizans Dönemi',
    'Önce katedral, sonra cami, sonra müze, yeniden cami — 1500 yıllık tarih.',
    'İmparator I. Justinianus tarafından 537 yılında Bizans katedrali olarak inşa edildi ve yüzyıllarca dünyanın en büyük kapalı mekanı unvanını taşıdı. 1453''te İstanbul''un fethiyle camiye çevrildi, 1934''te müze oldu, 2020''de yeniden ibadete açıldı. Muhteşem kubbesi ve mozaikleriyle Bizans ve Osmanlı mimarisinin eşsiz bir birleşimidir.',
    'https://picsum.photos/seed/ayasofya/800/500',
    ARRAY['https://picsum.photos/seed/ayasofya-2/800/500','https://picsum.photos/seed/ayasofya-3/800/500']
  from cities where name='İstanbul'
  union all
  select 'Topkapı Sarayı', 'Kale-Saray', id, '1459 · Osmanlı Dönemi',
    'Osmanlı padişahlarının 400 yıl boyunca yaşadığı, yönettiği saray.',
    'Fatih Sultan Mehmet''in emriyle 1459''da inşasına başlanan Topkapı Sarayı, 19. yüzyıla kadar Osmanlı padişahlarının ikametgahı ve devlet yönetiminin merkezi oldu. Harem dairesi, hazine odası ve kutsal emanetler bölümüyle Osmanlı saray hayatına dair en zengin tanıklığı sunar.',
    'https://picsum.photos/seed/topkapi/800/500',
    ARRAY['https://picsum.photos/seed/topkapi-2/800/500']
  from cities where name='İstanbul'
  union all
  select 'Anıtkabir', 'Anıt', id, '1953',
    'Mustafa Kemal Atatürk''ün ebedi istirahatgahı.',
    'Türkiye Cumhuriyeti''nin kurucusu Mustafa Kemal Atatürk''ün anısına 1944-1953 yılları arasında inşa edilen Anıtkabir, Ankara''nın Anıttepe semtinde yer alır. Anıt, Türk mimarisinin modern yorumuyla dikkat çeker ve her yıl milyonlarca ziyaretçi ağırlar.',
    'https://picsum.photos/seed/anitkabir/800/500',
    ARRAY['https://picsum.photos/seed/anitkabir-2/800/500']
  from cities where name='Ankara'
  union all
  select 'Efes Antik Kenti', 'Tarihi Mekan', id, 'MÖ 10. yüzyıl',
    'Antik dünyanın en iyi korunmuş kentlerinden biri, İzmir''e bir saat mesafede.',
    'İzmir''in Selçuk ilçesinde yer alan Efes, Antik Yunan ve Roma dönemlerinin en önemli liman kentlerinden biriydi. Celsus Kütüphanesi ve büyük tiyatrosuyla ünlü kent, dünyanın yedi harikasından biri olan Artemis Tapınağı''na da ev sahipliği yapmıştır.',
    'https://picsum.photos/seed/efes/800/500',
    ARRAY['https://picsum.photos/seed/efes-2/800/500','https://picsum.photos/seed/efes-3/800/500']
  from cities where name='İzmir'
  union all
  select 'Brandenburg Kapısı', 'Anıt', id, '1791',
    'Berlin''in simgesi, Soğuk Savaş''ın da tanığı.',
    '18. yüzyılda neoklasik üslupta inşa edilen Brandenburg Kapısı, Berlin Duvarı''nın hemen yanında yer aldığı için Soğuk Savaş döneminde Doğu-Batı ayrımının sembolü haline geldi. Duvarın yıkılışının ardından Almanya''nın yeniden birleşmesinin de simgesi oldu.',
    'https://picsum.photos/seed/brandenburg/800/500',
    ARRAY['https://picsum.photos/seed/brandenburg-2/800/500']
  from cities where name='Berlin'
  union all
  select 'Nymphenburg Sarayı', 'Kale-Saray', id, '1675 · Bavyera Dönemi',
    'Bavyera kraliyet ailesinin yazlık sarayı, geniş bahçeleriyle ünlü.',
    'Bavyera Elektörü Ferdinand Maria tarafından eşine hediye olarak yaptırılan Nymphenburg Sarayı, zamanla genişletilerek Wittelsbach hanedanının en görkemli yazlık ikametgahına dönüştü. Barok bahçeleri ve porselen koleksiyonuyla bilinir.',
    'https://picsum.photos/seed/nymphenburg/800/500',
    ARRAY['https://picsum.photos/seed/nymphenburg-2/800/500']
  from cities where name='Münih'
  union all
  select 'Eyfel Kulesi', 'Anıt', id, '1889',
    'Paris''in ve belki dünyanın en tanınan demir yapısı.',
    'Mühendis Gustave Eiffel''in tasarımıyla 1889 Dünya Fuarı için inşa edilen kule, o dönem yıkılması planlanan geçici bir yapıydı; ancak radyo yayıncılığındaki işlevi sayesinde kalıcı hale geldi. Bugün Paris''in ve Fransa''nın en bilinen simgesidir.',
    'https://picsum.photos/seed/eyfel/800/500',
    ARRAY['https://picsum.photos/seed/eyfel-2/800/500','https://picsum.photos/seed/eyfel-3/800/500']
  from cities where name='Paris'
  union all
  select 'Notre-Dame Katedrali', 'Dini Yapı', id, '1163-1345 · Gotik Dönem',
    'Gotik mimarinin başyapıtlarından, 2019 yangınının ardından yeniden doğdu.',
    '12. yüzyılda inşasına başlanan Notre-Dame, Gotik mimarinin en etkileyici örneklerinden biridir. 2019''daki büyük yangının ardından titiz bir restorasyon sürecinden geçirilerek 2024''te yeniden ziyarete açıldı.',
    'https://picsum.photos/seed/notredame/800/500',
    ARRAY['https://picsum.photos/seed/notredame-2/800/500']
  from cities where name='Paris'
  union all
  select 'Fourvière Bazilikası', 'Dini Yapı', id, '1896',
    'Lyon''a tepeden bakan, kentin koruyucusu kabul edilen bazilika.',
    'Fourvière tepesinde yükselen bazilika, 1870''teki Fransa-Prusya Savaşı''nda Lyon''un korunması için yapılan bir adağın ardından inşa edildi. Zengin mozaikleri ve şehrin tamamına hakim manzarasıyla Lyon''un en çok ziyaret edilen yeridir.',
    'https://picsum.photos/seed/fourviere/800/500',
    ARRAY['https://picsum.photos/seed/fourviere-2/800/500']
  from cities where name='Lyon'
  union all
  select 'Kolezyum', 'Tarihi Mekan', id, 'MS 80 · Roma İmparatorluğu',
    'Roma İmparatorluğu''nun dev amfitiyatrosu, gladyatör dövüşlerinin sahnesi.',
    'İmparator Vespasianus döneminde başlanıp oğlu Titus zamanında MS 80''de tamamlanan Kolezyum, aynı anda 50.000''den fazla seyirci alabiliyordu. Gladyatör dövüşleri ve halk gösterilerinin merkezi olan yapı, Roma mühendisliğinin en etkileyici kanıtlarından biridir.',
    'https://picsum.photos/seed/kolezyum/800/500',
    ARRAY['https://picsum.photos/seed/kolezyum-2/800/500','https://picsum.photos/seed/kolezyum-3/800/500']
  from cities where name='Roma'
  union all
  select 'Pantheon', 'Tarihi Mekan', id, 'MS 126',
    'Antik Roma''nın en iyi korunmuş yapısı, dünyanın en büyük donatısız beton kubbesi.',
    'İmparator Hadrianus tarafından MS 126''da tüm tanrılara adanmış bir tapınak olarak yeniden inşa edilen Pantheon, 7. yüzyıldan beri kilise olarak kullanılmaktadır. Tavanındaki dev açıklık (oculus) sayesinde gün ışığı doğrudan iç mekana düşer.',
    'https://picsum.photos/seed/pantheon/800/500',
    ARRAY['https://picsum.photos/seed/pantheon-2/800/500']
  from cities where name='Roma'
on conflict (name, city_id) do nothing;
