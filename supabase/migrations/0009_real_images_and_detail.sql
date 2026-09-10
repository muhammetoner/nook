-- Mekanlara kategoriye uygun gerçek fotoğraflar
update businesses set image_url = 'https://images.unsplash.com/photo-1767974968707-db3d448d4ef3?w=1200&q=80&auto=format&fit=crop' where id = 11; -- Döner Palace
update businesses set image_url = 'https://images.unsplash.com/photo-1761207299561-05887fac97b1?w=1200&q=80&auto=format&fit=crop' where id = 1;  -- Kebapçı

update businesses set image_url = 'https://images.unsplash.com/photo-1550071555-917d67a1188f?w=1200&q=80&auto=format&fit=crop' where id = 2;  -- Cafe Berlin
update businesses set image_url = 'https://images.unsplash.com/photo-1760175445000-0e01e193d1cd?w=1200&q=80&auto=format&fit=crop' where id = 19; -- Espresso Bar Roma
update businesses set image_url = 'https://images.unsplash.com/photo-1761271046396-97d231b59dd7?w=1200&q=80&auto=format&fit=crop' where id = 15; -- Montmartre Kahve
update businesses set image_url = 'https://images.unsplash.com/photo-1550071555-917d67a1188f?w=1200&q=80&auto=format&fit=crop' where id = 8;  -- Öğrenci Kafe
update businesses set image_url = 'https://images.unsplash.com/photo-1760175445000-0e01e193d1cd?w=1200&q=80&auto=format&fit=crop' where id = 10; -- Saat Kulesi Kahve

update businesses set image_url = 'https://images.unsplash.com/photo-1770902971693-8d638e97a496?w=1200&q=80&auto=format&fit=crop' where id = 7;  -- Kale Restoran
update businesses set image_url = 'https://images.unsplash.com/photo-1753727471014-efe38840c7c7?w=1200&q=80&auto=format&fit=crop' where id = 9;  -- Kordon Balık
update businesses set image_url = 'https://images.unsplash.com/photo-1765741836925-5363bbaa6507?w=1200&q=80&auto=format&fit=crop' where id = 17; -- Lyon Lokantası
update businesses set image_url = 'https://images.unsplash.com/photo-1770902971693-8d638e97a496?w=1200&q=80&auto=format&fit=crop' where id = 14; -- Marienplatz Restoran
update businesses set image_url = 'https://images.unsplash.com/photo-1753727471014-efe38840c7c7?w=1200&q=80&auto=format&fit=crop' where id = 3;  -- Paris Bistro
update businesses set image_url = 'https://images.unsplash.com/photo-1765741836925-5363bbaa6507?w=1200&q=80&auto=format&fit=crop' where id = 18; -- Trattoria Roma

update businesses set image_url = 'https://images.unsplash.com/photo-1758526348199-8008e0d8c2f8?w=1200&q=80&auto=format&fit=crop' where id = 13; -- Bavyera Bira Evi
update businesses set image_url = 'https://images.unsplash.com/photo-1754490928914-12a0482edef5?w=1200&q=80&auto=format&fit=crop' where id = 5;  -- Nostalji Bar
update businesses set image_url = 'https://images.unsplash.com/photo-1676472022789-7c1c201778f2?w=1200&q=80&auto=format&fit=crop' where id = 12; -- Spree Bar

update businesses set image_url = 'https://images.unsplash.com/photo-1747829581686-b5f0bede4a70?w=1200&q=80&auto=format&fit=crop' where id = 16; -- Éclair Tatlı
update businesses set image_url = 'https://images.unsplash.com/photo-1782864639148-91dcc2ad0a7b?w=1200&q=80&auto=format&fit=crop' where id = 6;  -- Tatlı Dükkanı

update businesses set image_url = 'https://images.unsplash.com/photo-1768319920501-2d124ccfd8dc?w=1200&q=80&auto=format&fit=crop' where id = 4;  -- Boğaz Manzaralı Kahvaltı

-- Gezilecek yerlere gerçek fotoğraflar + detaylandırılmış hikayeler
update attractions set
  cover_image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Hagia_Sophia_Mars_2013.jpg/1280px-Hagia_Sophia_Mars_2013.jpg',
  gallery = ARRAY['https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Interior_of_Hagia_Sophia.jpg/960px-Interior_of_Hagia_Sophia.jpg'],
  story = 'İmparator I. Justinianus''un emriyle 532-537 yılları arasında, mimarlar Miletli Isidoros ve Trallesli Anthemios tarafından inşa edilen Ayasofya, tamamlandığı dönemde dünyanın en büyük kapalı mekânı ve en yüksek kubbeli yapısıydı; bu unvanını neredeyse bin yıl korudu. 31 metre çapındaki merkezi kubbesi, döneminin mühendislik sınırlarını zorlayan bir teknik başarıydı ve defalarca deprem hasarı görüp onarıldı.

1453''te İstanbul''un fethiyle Fatih Sultan Mehmet''in emriyle camiye çevrildi; mihrap, minber ve minareler eklendi, Bizans dönemi mozaikleri sıvayla kapatıldı. 1934''te Atatürk''ün kararıyla müzeye dönüştürüldükten sonra kapatılan mozaikler ortaya çıkarıldı ve yapı hem Hristiyan hem İslam sanatının bir arada görülebildiği eşsiz bir mekâna dönüştü. 2020''de yeniden ibadete açıldı.

Bugün ziyaretçiler, devasa kubbenin altında altın zemin mozaiklerini, Osmanlı döneminden kalma dev hat levhalarını ve Viking bir askerin 9. yüzyılda üst kata kazıdığı rünik yazıyı bir arada görebiliyor — 1500 yıllık, kesintisiz kullanılan nadir yapılardan biri.'
where name = 'Ayasofya';

update attractions set
  cover_image_url = 'https://upload.wikimedia.org/wikipedia/commons/f/fc/Topkapi_Palace_01.JPG',
  gallery = ARRAY['https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Topkapi_Palace_-_Istanbul_-_09.jpg/960px-Topkapi_Palace_-_Istanbul_-_09.jpg'],
  story = 'Fatih Sultan Mehmet, İstanbul''u fethettikten sekiz yıl sonra, 1459''da yeni sarayın inşasına başlattı. Zamanla avlular etrafında genişleyen kompleks, tek bir bina değil, hazine dairesi, mutfaklar, harem, divan ve kütüphanelerden oluşan geniş bir yapılar topluluğuna dönüştü.

Sarayın en gizemli bölümü olan Harem, padişahın ailesinin ve cariyelerin yaşadığı, sıkı bir hiyerarşiyle yönetilen özel alandı. Hazine dairesinde 86 kıratlık Kaşıkçı Elması ve Topkapı Hançeri gibi Osmanlı hanedanının en değerli eserleri sergileniyor. Kutsal Emanetler bölümünde Hz. Muhammed''e ait olduğuna inanılan eşyalar korunuyor.

1856''da Sultan Abdülmecid''in Dolmabahçe Sarayı''na taşınmasıyla Topkapı''nın padişah konutu olma işlevi sona erdi; 1924''te müzeye dönüştürüldü. Bugün, Boğaz manzaralı avluları ve İslam sanatının en zengin koleksiyonlarından biriyle İstanbul''un en çok ziyaret edilen müzelerinden biri.'
where name = 'Topkapı Sarayı';

update attractions set
  cover_image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/An%C4%B1tkabir.JPG/960px-An%C4%B1tkabir.JPG',
  gallery = ARRAY['https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Ankara_asv2021-10_img04_An%C4%B1tkabir.jpg/960px-Ankara_asv2021-10_img04_An%C4%B1tkabir.jpg'],
  story = 'Mustafa Kemal Atatürk''ün 1938''deki vefatının ardından, kalıcı bir anıt mezar için mimari yarışma açıldı; mimarlar Emin Onat ve Orhan Arda''nın tasarımı seçildi. İnşaat 1944''te başladı, 1953''te tamamlandı ve naaşı o gün burada özel törenle yeniden toprağa verildi.

Anıt, klasik Türk mimarisinden esinlenen sade ve anıtsal çizgileriyle dikkat çeker; Aslanlı Yol boyunca dizilen Hitit heykel geleneğinden ilham alan aslan heykelleri ziyaretçileri Tören Meydanı''na yönlendirir. Ana yapının içinde Atatürk''ün sembolik lahdi, hemen altındaki mezar odasında ise gerçek kabri bulunur.

Kompleks içindeki Atatürk ve Kurtuluş Savaşı Müzesi, Milli Mücadele dönemine ait belgeleri ve kişisel eşyaları sergiliyor. Anıtkabir, her yıl 10 Kasım ve 19 Mayıs gibi özel günlerde on binlerce ziyaretçi ağırlayan, Türkiye''nin en önemli milli anıtıdır.'
where name = 'Anıtkabir';

update attractions set
  cover_image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Celsus_Library%2C_Ephesus.jpg/960px-Celsus_Library%2C_Ephesus.jpg',
  gallery = ARRAY['https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/The_library_of_Celsus%2C_Ephesus.jpg/960px-The_library_of_Celsus%2C_Ephesus.jpg'],
  story = 'Efes, MÖ 10. yüzyılda İyon göçmenleri tarafından kurulan ve zamanla Akdeniz''in en önemli liman kentlerinden birine dönüşen antik bir yerleşimdir. Roma İmparatorluğu döneminde nüfusu 200.000''e ulaşarak dönemin en kalabalık kentlerinden biri haline geldi; bugün dünyanın en iyi korunmuş antik kentlerinden sayılıyor.

Kentin simgesi olan Celsus Kütüphanesi, MS 117''de Romalı senatör Celsus''un anısına inşa edildi ve döneminde 12.000''den fazla parşömen barındırıyordu. 25.000 kişi kapasiteli büyük tiyatro ise hem gösterilere hem halk toplantılarına ev sahipliği yapıyordu.

Efes aynı zamanda antik dünyanın yedi harikasından biri olan Artemis Tapınağı''na ev sahipliği yaptı; bugün sadece tek bir sütunu ayakta. Kent, Hristiyanlık tarihi açısından da önemlidir — Aziz Pavlus burada vaaz vermiş, İncil''de "Efesliler''e Mektup" bu kente yazılmıştır.'
where name = 'Efes Antik Kenti';

update attractions set
  cover_image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Brandenburg_Gate_-_Brandenburger_Tor_-_Berlin_-_Germany_-_01.jpg/960px-Brandenburg_Gate_-_Brandenburger_Tor_-_Berlin_-_Germany_-_01.jpg',
  gallery = ARRAY['https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Brandenburg_Gate_-_Brandenburger_Tor_-_Berlin_-_Germany_-_02.jpg/960px-Brandenburg_Gate_-_Brandenburger_Tor_-_Berlin_-_Germany_-_02.jpg'],
  story = 'Prusya Kralı II. Friedrich Wilhelm''in emriyle, mimar Carl Gotthard Langhans tarafından 1788-1791 yılları arasında inşa edilen Brandenburg Kapısı, Atina Akropolisi''ndeki Propylaea''dan ilham alan neoklasik bir zafer takıdır. Tepesindeki dört atlı savaş arabasını süren Zafer Tanrıçası heykeli, kapının en tanınan simgesidir.

1806''da Napolyon Berlin''i işgal ettiğinde heykeli Paris''e götürdü; Prusya''nın 1814''teki zaferinin ardından heykel geri getirildi. II. Dünya Savaşı''nda ağır hasar gören kapı, savaş sonrası titizlikle restore edildi.

Berlin Duvarı''nın hemen doğusunda, kapalı bölgede kaldığı 1961-1989 yılları arasında kapı, Doğu-Batı ayrımının en çarpıcı simgesi oldu. 1989''da duvarın yıkılmasının ardından burada toplanan kalabalıklar, Almanya''nın yeniden birleşmesinin de sembolü haline getirdi bu kapıyı.'
where name = 'Brandenburg Kapısı';

update attractions set
  cover_image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Schloss_Nymphenburg.jpg/960px-Schloss_Nymphenburg.jpg',
  gallery = ARRAY['https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Nymphenburg_Palace%2C_Munich%2C_Germany.jpg/960px-Nymphenburg_Palace%2C_Munich%2C_Germany.jpg'],
  story = 'Bavyera Elektörü Ferdinand Maria, 1664''te uzun süredir beklenen bir erkek varis dünyaya getiren eşi İtalyan prenses Henriette Adelaide''ye armağan olarak bu sarayın inşasını başlattı. İtalyan mimar Agostino Barelli''nin tasarladığı yapı, sonraki yüzyılda Wittelsbach hükümdarları tarafından genişletilerek bugünkü devasa haline ulaştı.

Sarayın "Güzeller Galerisi" bölümünde, Kral I. Ludwig''in döneminin en güzel kadınlarından yaptırdığı 36 portre sergileniyor. 200 hektarlık İngiliz tarzı bahçesinde kanallar, göletler ve barok köşkler yer alır; kışın donan kanallar Münihlilerin buz pateni yaptığı popüler bir mekâna dönüşür.

Saray aynı zamanda Bavyera''nın efsanevi kralı II. Ludwig''in doğum yeridir. Bugün hem tarihi iç mekânlarıyla hem de dünyanın en eski porselen üretim atölyelerinden Nymphenburg Porselen Fabrikası''na ev sahipliği yapmasıyla biliniyor.'
where name = 'Nymphenburg Sarayı';

update attractions set
  cover_image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Tour_Eiffel_Wikimedia_Commons.jpg/960px-Tour_Eiffel_Wikimedia_Commons.jpg',
  gallery = ARRAY['https://upload.wikimedia.org/wikipedia/commons/e/e1/Eiffel_Tower_01.jpg'],
  story = 'Mühendis Gustave Eiffel''in şirketi tarafından, 1889 Paris Dünya Fuarı''nın simgesi olarak inşa edilen kule, 300 metrelik yüksekliğiyle tamamlandığında dünyanın en yüksek insan yapımı yapısı unvanını kazandı ve bu unvanı 41 yıl korudu.

Döneminde pek çok sanatçı ve entelektüel kulenin "çirkin bir demir iskelet" olduğunu düşünüp yıkılması için dilekçe imzaladı; kulenin sadece fuar süresince ayakta kalması planlanmıştı. Ancak radyo telgraf yayınları için değerli bir anten görevi görmesi, kulenin kalıcı hale gelmesini sağladı.

7.300 tondan fazla demirden, 18.000 parçanın 2,5 milyon perçinle birleştirilmesiyle inşa edildi. Sıcaklığa bağlı genleşme nedeniyle kule yazın kışa göre yaklaşık 15 santimetre daha uzun olabiliyor. Bugün yılda 7 milyondan fazla ziyaretçiyle dünyanın en çok ziyaret edilen ücretli anıtlarından biri.'
where name = 'Eyfel Kulesi';

update attractions set
  cover_image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Facade_of_Notre-Dame_de_Paris.jpg/960px-Facade_of_Notre-Dame_de_Paris.jpg',
  gallery = ARRAY['https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Cath%C3%A9drale_Notre-Dame_%28exterior%29.000_-_Paris.jpg/960px-Cath%C3%A9drale_Notre-Dame_%28exterior%29.000_-_Paris.jpg'],
  story = 'İnşasına 1163''te başlanan Notre-Dame, Gotik mimarinin Fransa''daki en erken ve en etkileyici örneklerinden biridir; uçan payandaları, gül pencereleri ve sivri kemerleriyle sonraki yüzyıllarda inşa edilecek pek çok katedrale ilham kaynağı oldu. Tamamlanması yaklaşık 180 yıl sürdü.

Katedral, Fransız tarihinin pek çok kritik anına sahne oldu: 1804''te Napolyon burada imparator ilan edildi, Fransız Devrimi sırasında yağmalanıp bir süre "Akıl Tapınağı" olarak kullanıldı. Victor Hugo''nun 1831 tarihli romanı, harap durumdaki yapıya kamuoyunun ilgisini çekerek büyük bir restorasyonu tetikledi.

15 Nisan 2019''da çıkan büyük yangın, kulesini ve çatısının büyük kısmını yok etti; dünya çapında büyük bir üzüntü ve dayanışma dalgası yarattı. Titiz bir restorasyon sürecinin ardından katedral, Aralık 2024''te yeniden ibadete ve ziyarete açıldı.'
where name = 'Notre-Dame Katedrali';

update attractions set
  cover_image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Fourvi%C3%A8re_Basilica%2C_Lyon.JPG/960px-Fourvi%C3%A8re_Basilica%2C_Lyon.JPG',
  gallery = ARRAY['https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/023._Basilique_Notre-Dame_de_Fourvi%C3%A8re.JPG/960px-023._Basilique_Notre-Dame_de_Fourvi%C3%A8re.JPG'],
  story = 'Fourvière tepesindeki bazilikanın hikâyesi, 1870-71 Fransa-Prusya Savaşı''na dayanır: Lyon halkı, kentin işgalden korunması için Meryem Ana''ya bir adak adadı; şehir savaştan zarar görmeden çıkınca, bu adağın gereği olarak 1872-1896 yılları arasında bazilika inşa edildi.

Mimar Pierre Bossan''ın tasarımı, Bizans ve Gotik unsurları alışılmadık bir şekilde harmanlar; iç mekândaki zengin mozaikler ve altın yaldızlı detaylar, yapıyı alışılmadık ama etkileyici dış görünümünden çok daha görkemli hale getirir.

Tepe, Roma döneminde Lugdunum adıyla kurulan Lyon''un ilk yerleşim alanıydı; hemen yanında halen ayakta olan iki büyük Roma amfitiyatrosu bulunur. Bazilikanın terasından Lyon''un tamamı, hava açıkken Alp Dağları''na kadar görülebilir.'
where name = 'Fourvière Bazilikası';

update attractions set
  cover_image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Colosseum_of_Rome%2C_Italy.jpg/960px-Colosseum_of_Rome%2C_Italy.jpg',
  gallery = ARRAY['https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Colosseum%2C_Rome_%28868787709%29.jpg/960px-Colosseum%2C_Rome_%28868787709%29.jpg'],
  story = 'İmparator Vespasianus''un MS 72''de başlattığı, oğlu Titus döneminde MS 80''de tamamlanan Kolezyum, dönemin en büyük mühendislik başarılarından biriydi. Elips planlı yapı, aynı anda 50.000-80.000 arası seyirciyi ağırlayabiliyor ve dev bir tente sistemiyle güneşten korunabiliyordu.

Açılışında 100 gün süren gösteriler düzenlendi; bu süreçte binlerce gladyatör dövüştü ve on binlerce hayvan öldürüldü. Zemin altındaki hypogeum adlı karmaşık tünel ve asansör sistemi, hayvanları ve dekorları sahneye çıkarmak için kullanılıyordu.

Roma İmparatorluğu''nun çöküşünden sonra yapı taş ocağı olarak kullanıldı, depremlerde zarar gördü; bugünkü halinin büyük kısmı restore edilmiş durumda. Yine de 2000 yıllık geçmişiyle antik Roma mühendisliğinin en çarpıcı simgesi olmaya devam ediyor.'
where name = 'Kolezyum';

update attractions set
  cover_image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Rome_Pantheon_front.jpg/960px-Rome_Pantheon_front.jpg',
  gallery = ARRAY['https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Pantheon_Rome_04_2016_6460.jpg/960px-Pantheon_Rome_04_2016_6460.jpg'],
  story = 'Bugünkü Pantheon, MS 118-128 yılları arasında İmparator Hadrianus tarafından, MÖ 27''de Marcus Agrippa''nın yaptırdığı ve yangında yıkılan ilk tapınağın yerine inşa edildi; girişteki yazıt hâlâ Agrippa''nın adını taşır.

Yapının en olağanüstü özelliği, 43 metre çapındaki donatısız beton kubbesidir — bugün bile dünyanın en büyük donatısız beton kubbesi unvanını koruyor. Kubbenin tepesindeki 9 metre çapındaki açıklık (oculus), yapının tek doğal ışık kaynağıdır ve yağmur yağdığında zemine damlalar düşer.

7. yüzyılda kiliseye çevrildiği için yıkımdan kurtulan Pantheon, antik Roma''nın neredeyse bozulmadan günümüze ulaşan tek büyük yapısıdır. İçinde Rönesans ressamı Raphael''in mezarı da bulunur; 2000 yıldır kesintisiz kullanılan bir bina olarak mimarlık tarihinde eşsiz bir yere sahiptir.'
where name = 'Pantheon';
