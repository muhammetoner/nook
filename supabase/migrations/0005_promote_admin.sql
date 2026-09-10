-- Yanlış yazılmış e-posta ilk kaydı tükettiği için doğru hesabı elle admin yapıyoruz
update profiles set role = 'admin' where email = 'onermuhammet156@gmail.com';
