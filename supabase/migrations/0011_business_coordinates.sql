alter table businesses add column if not exists lat double precision;
alter table businesses add column if not exists lng double precision;

-- Şehir merkezine yakın, birbirinden hafif kaydırılmış koordinatlar (kurgusal mekanlar)
update businesses b set
  lat = c.center_lat + (b.id % 5 - 2) * 0.004,
  lng = c.center_lng + (b.id % 7 - 3) * 0.004
from (values
  ('İstanbul', 41.0082, 28.9784),
  ('Ankara', 39.9208, 32.8541),
  ('İzmir', 38.4237, 27.1428),
  ('Berlin', 52.5200, 13.4050),
  ('Münih', 48.1351, 11.5820),
  ('Paris', 48.8566, 2.3522),
  ('Lyon', 45.7640, 4.8357),
  ('Roma', 41.9028, 12.4964)
) as c(name, center_lat, center_lng)
join cities ci on ci.name = c.name
where b.city_id = ci.id;
