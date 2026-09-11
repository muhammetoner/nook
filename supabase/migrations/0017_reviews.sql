-- Kullanıcı değerlendirmeleri: sadece giriş yapmış kullanıcılar, mekan başına tek yorum
create table reviews (
  id uuid primary key default gen_random_uuid(),
  business_id bigint not null references businesses(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  rating smallint not null check (rating between 1 and 5),
  comment text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique(business_id, user_id)
);

alter table reviews enable row level security;

create policy "public read reviews" on reviews for select using (true);

create policy "user insert own review" on reviews for insert
  with check (auth.uid() = user_id);

create policy "user update own review" on reviews for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create policy "user delete own review" on reviews for delete
  using (auth.uid() = user_id);

create policy "admin manage reviews" on reviews for all
  using (exists(select 1 from profiles where id = auth.uid() and role = 'admin'))
  with check (exists(select 1 from profiles where id = auth.uid() and role = 'admin'));

-- Yorumcunun görünen adını (e-postasını değil) RLS'e takılmadan okumak için güvenli fonksiyon
-- (profiles tablosu "read own profile" ile kendi satırıyla sınırlı olduğundan, başkalarının
-- yorumlarında görünen adını göstermek için security definer fonksiyon gerekiyor)
create or replace function public.public_display_names(user_ids uuid[])
returns table(id uuid, display_name text)
language sql
security definer set search_path = public
as $$
  select p.id, p.display_name from profiles p where p.id = any(user_ids);
$$;

grant execute on function public.public_display_names(uuid[]) to authenticated, anon;
