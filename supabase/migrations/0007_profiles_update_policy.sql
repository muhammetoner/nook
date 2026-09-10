-- Kullanıcılar kendi profilini güncelleyebilsin (display_name için)
create policy "update own profile" on profiles for update
  using (auth.uid() = id)
  with check (auth.uid() = id);

-- Ama normal kullanıcı isteği (PostgREST/auth.uid() dolu) üzerinden
-- role alanı asla değişmesin; migration/servis bağlamında (auth.uid() boş) etkisiz.
create or replace function public.prevent_role_self_change()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  if auth.uid() is not null and new.role is distinct from old.role then
    new.role := old.role;
  end if;
  return new;
end;
$$;

create trigger profiles_prevent_role_self_change
  before update on profiles
  for each row execute procedure public.prevent_role_self_change();
