select * from users
where 
created_at >= '2020-01-01 04:24:42'
and 
created_at <= '2020-01-31 13:09:25';


-- BETWEEN SELECIONAR UM RANGE DE DADOS

select * from users
where 
created_at 
between '2020-01-01 04:24:42'
and 
'2020-01-31 13:09:25';


select * from users u 
where u.id between 1 and 10;