-- Mekan erişim engelleme
alter table businesses add column if not exists is_active boolean not null default true;

-- "public read businesses" politikasını is_active=true ile sınırla
drop policy if exists "public read businesses" on businesses;
create policy "public read businesses" on businesses for select
  using (is_active = true);

-- Sahibi, engellenmiş olsa bile kendi mekanını görebilsin
create policy "owner read own business" on businesses for select
  using (auth.uid() = owner_id);

-- Sahibi is_active alanını değiştiremesin (sadece admin)
create or replace function public.restrict_owner_business_updates()
returns trigger
language plpgsql
security definer set search_path = public
as $$
declare
  is_admin boolean;
begin
  select exists(select 1 from profiles where id = auth.uid() and role = 'admin') into is_admin;
  if auth.uid() is not null and not is_admin then
    new.name := old.name;
    new.category := old.category;
    new.city_id := old.city_id;
    new.description := old.description;
    new.rating := old.rating;
    new.price_level := old.price_level;
    new.featured := old.featured;
    new.moods := old.moods;
    new.lat := old.lat;
    new.lng := old.lng;
    new.owner_id := old.owner_id;
    new.is_active := old.is_active;
  end if;
  return new;
end;
$$;

-- Sahibi kendi mekanının menüsünü yönetebilsin (sadece businesses'a bakar, döngü riski yok)
create policy "owner manage own menus" on menus for all
  using (exists(select 1 from businesses b where b.id = menus.business_id and b.owner_id = auth.uid()))
  with check (exists(select 1 from businesses b where b.id = menus.business_id and b.owner_id = auth.uid()));
