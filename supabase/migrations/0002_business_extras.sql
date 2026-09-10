-- Editorial keşif tasarımı için ek alanlar
alter table businesses add column if not exists rating numeric(2,1);
alter table businesses add column if not exists price_level smallint check (price_level between 1 and 3);
alter table businesses add column if not exists featured boolean not null default false;
