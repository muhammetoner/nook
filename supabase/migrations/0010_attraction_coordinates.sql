alter table attractions add column if not exists lat double precision;
alter table attractions add column if not exists lng double precision;

update attractions set lat = 41.0086, lng = 28.9802 where name = 'Ayasofya';
update attractions set lat = 41.0115, lng = 28.9833 where name = 'Topkapı Sarayı';
update attractions set lat = 39.9252, lng = 32.8375 where name = 'Anıtkabir';
update attractions set lat = 37.9395, lng = 27.3417 where name = 'Efes Antik Kenti';
update attractions set lat = 52.5163, lng = 13.3777 where name = 'Brandenburg Kapısı';
update attractions set lat = 48.1583, lng = 11.5033 where name = 'Nymphenburg Sarayı';
update attractions set lat = 48.8584, lng = 2.2945  where name = 'Eyfel Kulesi';
update attractions set lat = 48.8530, lng = 2.3499  where name = 'Notre-Dame Katedrali';
update attractions set lat = 45.7622, lng = 4.8226  where name = 'Fourvière Bazilikası';
update attractions set lat = 41.8902, lng = 12.4922 where name = 'Kolezyum';
update attractions set lat = 41.8986, lng = 12.4769 where name = 'Pantheon';
