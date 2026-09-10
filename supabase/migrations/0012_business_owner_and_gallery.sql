-- Mekan sahibi rolü + mekanlara çoklu galeri

alter table businesses add column if not exists owner_id uuid references auth.users(id);
alter table businesses add column if not exists gallery text[] default '{}';

-- Sahibi kendi mekanını güncelleyebilsin (mevcut admin politikasıyla birlikte, OR ile birleşir)
create policy "owner update own business" on businesses for update
  using (auth.uid() = owner_id)
  with check (auth.uid() = owner_id);

-- Sahibi (admin olmayan) SADECE image_url ve gallery değiştirebilsin, başka hiçbir alana dokunamasın
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
  end if;
  return new;
end;
$$;

create trigger businesses_restrict_owner_updates
  before update on businesses
  for each row execute procedure public.restrict_owner_business_updates();

-- Giriş yapmış herhangi bir kullanıcı business-images bucket'ına yükleyebilsin
-- (asıl kısıtlama businesses tablosundaki tetikleyiciyle sağlanıyor)
create policy "authenticated insert business images" on storage.objects for insert
  with check (bucket_id = 'business-images' and auth.uid() is not null);
