-- Admin'in kullanıcı e-postalarını RLS'e dokunmadan (recursion riski olmadan) görebilmesi için
-- güvenli bir fonksiyon: SECURITY DEFINER sayesinde tablo sahibi olarak çalışır, RLS'i tetiklemez.
create or replace function public.admin_list_profiles()
returns table(id uuid, email text)
language plpgsql
security definer set search_path = public
as $$
begin
  if not exists(select 1 from profiles pr where pr.id = auth.uid() and pr.role = 'admin') then
    raise exception 'yetkisiz';
  end if;
  return query select p.id, p.email from profiles p;
end;
$$;

grant execute on function public.admin_list_profiles() to authenticated;
