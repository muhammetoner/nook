-- Admin, işletme sahibi ataması yapabilmek için tüm kullanıcı profillerini (e-postalarını) görebilsin
create policy "admin read all profiles" on profiles for select
  using (exists(select 1 from profiles p2 where p2.id = auth.uid() and p2.role = 'admin'));
