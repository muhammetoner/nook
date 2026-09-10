-- biMekan — temel şema, RLS ve ilk-admin bootstrap

create table countries (
  id bigint generated always as identity primary key,
  name text not null unique,
  created_at timestamptz not null default now()
);

create table cities (
  id bigint generated always as identity primary key,
  name text not null,
  country_id bigint references countries(id) on delete cascade,
  created_at timestamptz not null default now(),
  unique (name, country_id)
);

create table businesses (
  id bigint generated always as identity primary key,
  name text not null,
  description text,
  city_id bigint references cities(id) on delete cascade,
  category text,
  image_url text,
  created_at timestamptz not null default now(),
  unique (name, city_id)
);

create table menus (
  id bigint generated always as identity primary key,
  business_id bigint references businesses(id) on delete cascade,
  title text not null,
  description text,
  price numeric(10,2),
  image_url text,
  created_at timestamptz not null default now(),
  unique (business_id, title)
);

-- Kullanıcı profilleri: admin panelden kimin yazabileceğini belirler
create table profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  email text,
  role text not null default 'user',
  created_at timestamptz not null default now()
);

-- İlk kayıt olan kullanıcı otomatik admin olur
create function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
declare
  is_first boolean;
begin
  select not exists(select 1 from public.profiles) into is_first;
  insert into public.profiles (id, email, role)
  values (new.id, new.email, case when is_first then 'admin' else 'user' end);
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- Row Level Security
alter table countries enable row level security;
alter table cities enable row level security;
alter table businesses enable row level security;
alter table menus enable row level security;
alter table profiles enable row level security;

-- Herkese açık okuma
create policy "public read countries" on countries for select using (true);
create policy "public read cities" on cities for select using (true);
create policy "public read businesses" on businesses for select using (true);
create policy "public read menus" on menus for select using (true);

-- Sadece admin yazabilir
create policy "admin write countries" on countries for all
  using (exists(select 1 from profiles where id = auth.uid() and role = 'admin'))
  with check (exists(select 1 from profiles where id = auth.uid() and role = 'admin'));

create policy "admin write cities" on cities for all
  using (exists(select 1 from profiles where id = auth.uid() and role = 'admin'))
  with check (exists(select 1 from profiles where id = auth.uid() and role = 'admin'));

create policy "admin write businesses" on businesses for all
  using (exists(select 1 from profiles where id = auth.uid() and role = 'admin'))
  with check (exists(select 1 from profiles where id = auth.uid() and role = 'admin'));

create policy "admin write menus" on menus for all
  using (exists(select 1 from profiles where id = auth.uid() and role = 'admin'))
  with check (exists(select 1 from profiles where id = auth.uid() and role = 'admin'));

-- Kullanıcı kendi profilini görebilir
create policy "read own profile" on profiles for select using (auth.uid() = id);

-- Örnek veri
insert into countries (name) values ('Türkiye'), ('Almanya'), ('Fransa');

insert into cities (name, country_id)
  select 'İstanbul', id from countries where name = 'Türkiye'
  union all select 'Berlin', id from countries where name = 'Almanya'
  union all select 'Paris', id from countries where name = 'Fransa';

insert into businesses (name, description, city_id, category)
  select 'Kebapçı', 'En iyi kebaplar', id, 'Yemek' from cities where name = 'İstanbul'
  union all select 'Cafe Berlin', 'Alman kahvesi', id, 'Kafe' from cities where name = 'Berlin'
  union all select 'Paris Bistro', 'Fransız mutfağı', id, 'Restoran' from cities where name = 'Paris';

insert into menus (business_id, title, description, price)
  select id, 'Adana Kebap', 'Acılı kebap', 120.00 from businesses where name = 'Kebapçı'
  union all select id, 'Kahve', 'Sıcak Alman kahvesi', 40.00 from businesses where name = 'Cafe Berlin'
  union all select id, 'Kruvasan', 'Tereyağlı kruvasan', 50.00 from businesses where name = 'Paris Bistro';

-- Görseller için storage bucket
insert into storage.buckets (id, name, public)
values ('business-images', 'business-images', true)
on conflict (id) do nothing;

create policy "public read business images" on storage.objects for select
  using (bucket_id = 'business-images');

create policy "admin write business images" on storage.objects for insert
  with check (bucket_id = 'business-images' and exists(select 1 from profiles where id = auth.uid() and role = 'admin'));

create policy "admin update business images" on storage.objects for update
  using (bucket_id = 'business-images' and exists(select 1 from profiles where id = auth.uid() and role = 'admin'));

create policy "admin delete business images" on storage.objects for delete
  using (bucket_id = 'business-images' and exists(select 1 from profiles where id = auth.uid() and role = 'admin'));
