-- Forma tradicional
select * from users u 
where u.id=90 or u.id=16 or u.id=1;

-- IN valores dentro de uma lista de valores
select * from users u 
where u.id in (90, 16, 1);