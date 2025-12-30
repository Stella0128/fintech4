## 1) SELECT 기본

# 1. actor 테이블에 있는 모든 정보를 조회하시오.
show databases;
use sakila;
show tables;
select * from actor;

# 2. actor 테이블에서 배우의 이름(first_name)과 성(last_name)만 조회하시오.
select first_name, last_name from actor;

# 3. film 테이블에서 영화 제목(title)만 조회하시오.
select title from film;

# 4. customer 테이블에서 고객의 이름(first_name, last_name)과 이메일(email)을 조회하시오.
select first_name, last_name, email from customer;

# 5. payment 테이블의 모든 결제 정보를 조회하시오.
select * from payment;

## 2) WHERE 조건

# 6. film 테이블에서 등급(rating)이 'PG'인 영화만 조회하시오.
select * from film where rating = 'PG';

# 7. film 테이블에서 대여 요금(rental_rate)이 3보다 큰 영화만 조회하시오.
select * from film where rental_rate > 3;

# 8. film 테이블에서 대여 요금이 2 이상이고 등급이 'PG-13'인 영화를 조회하시오.
-- select * from film where rental_rate >= 2 and rating = 'PG-13';
select title, rental_rate, rating
from film
where rental_rate >= 2
and rating = 'PG-13';

# 9. film 테이블에서 등급이 'PG' 또는 'G'인 영화를 조회하시오.
-- select * from film where rating = 'PG' or rating = 'G';
select title, rating
from film
where rating = 'PG'
or rating = 'G';

# 10. film 테이블에서 대여 요금이 2 이상 4 이하인 영화를 조회하시오.
-- select * from film where rental_rate >= 2 and rental_rate <= 4;
select title, rental_rate
from film
where rental_rate between 2 and 4;

# 11. film 테이블에서 등급이 'PG', 'G', 'PG-13' 중 하나인 영화를 조회하시오.
select title, rating from film where rating = 'PG' or rating = 'G' or rating = 'PG-13';
select title, rating from film where rating in ('PG', 'G', 'PG-13');

# 12. customer 테이블에서 이메일이 없는 고객을 조회하시오.
select * from customer where email is null;

## 3) like/문자열 조건

# 13. film 테이블에서 제목에 'LOVE'가 포함된 영화를 조회하시오.
select title from film where title like '%LOVE%';

# 14. film 테이블에서 제목이 'A'로 시작하는 영화를 조회하시오.
select title from film where title like 'A%';

# 15. film 테이블에서 제목이 'MAN'으로 끝나는 영화를 조회하시오.
select title from film where title like '%MAN';

# 16. customer 테이블에서 성(last_name)에 공백이 포함된 고객을 조회하시오.
select * from customer where last_name like '% %';

# 17. actor 테이블에서 이름(first_name)에 'JO'가 포함된 배우를 조회하시오.
select * from actor where first_name like '%JO%';

## 4) order by/limit

# 18. film 테이블에서 대여 요금이 높은 순서대로 정렬하여 조회하시오.
-- select * from film order by rental_rate desc;
select title, rental_rate
from film
order by rental_rate desc;

# 19. film 테이블에서 등급은 오름차순, 대여 요금은 내림차순으로 정렬하시오.
-- select * from film order by rating asc, rental_rate desc;
select title, rating, rental_rate
from film
order by rating asc, rental_rate desc;

# 20. 대여 요금이 가장 비싼 영화 5개만 조회하시오.
select title, rental_rate from film order by rental_rate desc limit 5;

# 21. actor 테이블에서 배우 10명만 조회하시오.
select * from actor limit 10;

# 22. customer 테이블에서 이름(first_name) 오름차순으로 정렬하여 20명만 조회하시오.
select * from customer order by first_name asc limit 20;

# 23. film 테이블에서 대여 요금이 낮은 영화 3개를 조회하시오.
select * from film order by rental_rate asc limit 3;

## 5) distinct/집계 함수

# 24. film 테이블에 존재하는 등급 종류를 중복 없이 조회하시오.
select distinct rating from film;

# 25. film 테이블의 영화 총 개수를 조회하시오.
select count(*) as 영화수 from film;

# 26. film 테이블의 평균 대여 요금을 조회하시오.
select avg(rental_rate) as 평균요금 from film;

# 27. film 테이블에서 가장 비싼 대여 요금을 조회하시오.
select max(rental_rate) as 최대요금 from film;

# 28. film 테이블에서 가장 저렴한 대여 요금을 조회하시오.
select min(rental_rate) as 최소요금 from film;

# 29. payment 테이블의 총 결제 금액을 조회하시오.
select sum(amount) as 총결제금액 from payment;

# 30. payment 테이블에서 결제 금액(amount)의 평균을 조회하시오.
select avg(amount) as 평균결제금액 from payment;

## 6) group by/having

# 31. 영화 등급(rating)별 영화 개수를 조회하시오.
select rating, count(*) as 영화수 from film group by rating;

# 32. 영화 등급(rating)별 평균 대여 요금(rental_rate)을 조회하시오.
select rating, avg(rental_rate) as 평균대여요금 from film group by rating;

# 33. 영화가 200편 이상인 등급만 조회하시오.
select rating, count(*) as 영화수 from film group by rating having count(*) >= 200;

# 34. 직원(staff_id)별 총 결제 금액을 조회하시오.
select staff_id, sum(amount) as 총결제금액 from payment group by staff_id;

# 35. 직원(staff_id)별 총 결제 금액이 5000 이상인 직원만 조회하시오.
select staff_id, sum(amount) as 총결제금액 from payment group by staff_id having sum(amount) >= 5000;

# 36. 고객(customer_id)별 결제 횟수를 조회하시오.
select customer_id, count(*) as 결제횟수 from payment group by customer_id;

# 37. 결제 횟수가 30회 이상인 고객만 조회하시오.
select customer_id, count(*) as 결제횟수 from payment group by customer_id having count(*) >= 30;

# 38. 고객(customer_id)별 총 결제 금액을 계산하시오.
select customer_id, sum(amount) as 총결제금액 from payment group by customer_id;

## join + 실무형 복합

# 39. 고객 이름과 대여 날짜(rental_date)를 함께 조회하시오.
select first_name, last_name, rental_date from customer as c inner join rental as r on c.customer_id = r.customer_id;

# 40. 고객별 대여 횟수를 조회하시오.
select c.customer_id, count(r.rental_id) as 대여횟수
from customer as c
left join rental as r
on c.customer_id = r.customer_id
group by c.customer_id;

# 41. 대여 횟수가 20회 이상인 고객만 조회하시오.
select c.customer_id, count(r.rental_id) as 대여횟수
from customer as c
left join rental as r
on c.customer_id = r.customer_id
group by c.customer_id
having count(r.rental_id) >= 20;

# 42. 고객 이름과 총 결제 금액을 함께 조회하시오.
select c.first_name, c.last_name, sum(p.amount) as 총결제금액
from customer as c
join payment as p
on c.customer_id = p.customer_id
group by c.customer_id;

# 43. 총 결제 금액이 100 이상인 고객만 조회하시오.
select c.customer_id, sum(p.amount) as 총결제금액
from customer as c
join payment as p
on c.customer_id = p.customer_id
group by c.customer_id
having sum(p.amount) >= 100;

# 44. 가장 많은 결제 금액을 낸 고객 5명을 조회하시오.
select c.customer_id, sum(p.amount) as 총결제금액
from customer as c
join payment as p
on c.customer_id = p.customer_id
group by c.customer_id
order by 총결제금액 desc
limit 5;

# 45. 대여 기록이 없는 고객도 모두 포함하여 조회하시오.
select c.customer_id, r.rental_id
from customer as c
left join rental as r
on c.customer_id = r.customer_id;

#46. 대여 기록이 없는 고객만 조회하시오.
select c.customer_id
from customer as c
left join rental as r
on c.customer_id = r.customer_id
where r.rental_id is null;

# 47. 결제 금액이 1 미만이거나 NULL인 데이터를 조회하시오.
select *
from payment
where amount < 1
   or amount is null;
   
# 48. 고객별 대여 횟수와 총 결제 금액을 함께 조회하시오.
select c.customer_id,
       count(r.rental_id) as 대여횟수,
       sum(p.amount) as 총결제금액
from customer as c
left join rental as r on c.customer_id = r.customer_id
left join payment as p on r.rental_id = p.rental_id
group by c.customer_id;

# 49. 대여 횟수가 10회 이상이고 총 결제 금액이 50 이상인 고객을 조회하시오.
select c.customer_id,
       count(r.rental_id) as 대여횟수,
       sum(p.amount) as 총결제금액
from customer as c
left join rental as r on c.customer_id = r.customer_id
left join payment as p on r.rental_id = p.rental_id
group by c.customer_id
having 대여횟수 >= 10
and 총결제금액 >= 50;

# 50. 대여 횟수 내림차순, 총 결제 금액 내림차순으로 정렬하여 상위 10명을 조회하시오.
select c.customer_id,
       count(r.rental_id) as 대여횟수,
       sum(p.amount) as 총결제금액
from customer as c
left join rental as r on c.customer_id = r.customer_id
left join payment as p on r.rental_id = p.rental_id
group by c.customer_id
order by 대여횟수 desc, 총결제금액 desc
limit 10;