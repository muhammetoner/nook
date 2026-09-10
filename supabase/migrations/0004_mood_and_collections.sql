-- Ruh haline göre keşif
alter table businesses add column if not exists moods text[] default '{}';

-- Kişisel koleksiyonlar
create table collections (
  id bigint generated always as identity primary key,
  owner_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  description text,
  curator_name text,
  is_public boolean not null default true,
  created_at timestamptz not null default now()
);

create table collection_items (
  id bigint generated always as identity primary key,
  collection_id bigint not null references collections(id) on delete cascade,
  business_id bigint not null references businesses(id) on delete cascade,
  note text,
  created_at timestamptz not null default now(),
  unique (collection_id, business_id)
);

alter table collections enable row level security;
alter table collection_items enable row level security;

create policy "read public or own collections" on collections for select
  using (is_public = true or owner_id = auth.uid());

create policy "owner manage collections" on collections for all
  using (owner_id = auth.uid())
  with check (owner_id = auth.uid());

create policy "read items of visible collections" on collection_items for select
  using (exists(
    select 1 from collections c
    where c.id = collection_id and (c.is_public or c.owner_id = auth.uid())
  ));

create policy "owner manage items" on collection_items for all
  using (exists(select 1 from collections c where c.id = collection_id and c.owner_id = auth.uid()))
  with check (exists(select 1 from collections c where c.id = collection_id and c.owner_id = auth.uid()));

-- örnek ruh hali etiketleri (mevcut mekanlara)
update businesses set moods = array['Romantik','Manzaralı'] where name in ('Paris Bistro','Boğaz Manzaralı Kahvaltı');
update businesses set moods = array['Sessiz Çalışma'] where name in ('Öğrenci Kafe','Montmartre Kahve','Espresso Bar Roma');
update businesses set moods = array['Arkadaşlarla','Gece Sohbeti'] where name in ('Nostalji Bar','Spree Bar','Bavyera Bira Evi');
update businesses set moods = array['Aile ile'] where name in ('Kale Restoran','Marienplatz Restoran','Kordon Balık');
update businesses set moods = array['Hızlı Atıştırma'] where name in ('Döner Palace','Espresso Bar Roma');
