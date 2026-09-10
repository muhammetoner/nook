-- ACİL DÜZELTME: 0013'teki politika, profiles tablosunu kendi içinde sorguladığı için
-- sonsuz döngüye (infinite recursion) sebep oluyordu ve TÜM sorguları kırıyordu.
drop policy if exists "admin read all profiles" on profiles;
