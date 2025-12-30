# 데이터 입력
use foreign_exchange_account;
insert into currencies values('KRW', 'Korean Won', 0);
insert into currencies values('USD', 'US Dollar', 2);
insert into currencies values('JPY', 'Japanese Yen', 0);
insert into currencies values('EUR', 'Euro', 2);
insert into currencies values('GBP', 'Pound Sterling', 2);
insert into currencies values('AUD', 'Australian Dollar', 2);
select * from currencies;

insert into users (`user_id`, `email`, `full_name`, `status`) values(1, 'alice@example.com', 'Alice Kim', 1);
insert into users (`user_id`, `email`, `full_name`, `status`) values(2, 'bob@example.com', 'Bob Lee', 1);
insert into users (`user_id`, `email`, `full_name`, `status`) values(3, 'carol@example.com', 'Carol Park', 1);
insert into users (`user_id`, `email`, `full_name`, `status`) values(4, 'dave@example.com', 'Dave Choi', 1);
insert into users (`user_id`, `email`, `full_name`, `status`) values(5, 'erin@example.com', 'Erin Jung', 0);
insert into users (`user_id`, `email`, `full_name`, `status`) values(6, 'frank@example.com', 'Frank Yoo', 1);
insert into users (`user_id`, `email`, `full_name`, `status`) values(7, 'grace@example.com', 'Grace Han', 1);
insert into users (`user_id`, `email`, `full_name`, `status`) values(8, 'heidi@example.com', 'Heidi Lim', 1);
select * from users;

insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (1, 'KRW', 1200000.00000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (1, 'USD', 950.25000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (1, 'EUR', 210.00000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (2, 'KRW', 560000.00000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (2, 'JPY', 75000.00000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (3, 'USD', 1250.75000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (3, 'GBP', 80.00000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (4, 'KRW', 330000.00000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (4, 'USD', 420.00000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (4, 'JPY', 12000.00000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (5, 'EUR', 500.00000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (5, 'AUD', 600.00000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (6, 'KRW', 980000.00000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (6, 'USD', 110.00000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (6, 'EUR', 45.50000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (7, 'JPY', 150000.00000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (7, 'GBP', 30.00000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (8, 'KRW', 250000.00000000);
insert into fx_holdings (`user_id`, `currency_code`, `balance`) values (8, 'AUD', 120.00000000);
select * from fx_holdings;


# 문제 1. fx_holdings, users 테이블에서 전체 사용자 보유 외환을 조회하세요.
# (컬럼: user_id, full_name, currency_code, balance / user_id, currency_code 오름차순)
select u.user_id, u.full_name, f.currency_code, f.balance
from users as u
join fx_holdings as f
on u.user_id = f.user_id
order by u.user_id asc, f.currency_code asc;

# 문제 2. users, fx_holdings 테이블에서 이메일이 alice@example.com인 사용자의 보유 외환을 조회하세요.
# (컬럼: currency_code, balance / currency_code 오름차순)
select f.currency_code, f.balance
from users as u
join fx_holdings as f
on u.user_id = f.user_id
where u.email = 'alice@example.com'
order by f.currency_code asc;

# 문제 3. fx_holdings 테이블에서 통화별 총 보유 잔액을 조회하세요.
# (컬럼: currency_code, total_balance / currency_code 오름차순)
select currency_code, sum(balance) as total_balance
from fx_holdings
group by currency_code
order by currency_code asc;

# 문제 4. users, fx_holdings 테이블에서 사용자별 보유 요약(보유 통화 수, 잔액 합계)을 조회하세요.
# (컬럼: user_id, full_name, currency_cnt, sum_raw / user_id 오름차순)
select u.user_id, u.full_name, count(f.currency_code) as currency_cnt, sum(balance) as sum_raw
from users as u
inner join fx_holdings as f
group by u.user_id
order by u.user_id;

# 문제 5. fx_holdings, users 테이블에서 원화(KRW) 보유 상위 5명의 이름과 잔액을 조회하세요.
# (balance 내림차순, 상위 5명)
select *
from users as u
inner join fx_holdings as f
where f.currency_code = 'KRW'
order by balance desc limit 5;

# 문제 6. fx_holdings, users 테이블에서 달러(USD)를 보유한 사용자와 해당 잔액을 조회하세요.
# (컬럼: full_name, balance / balance 내림차순)
select u.full_name, f.balance
from users as u
inner join fx_holdings as f
where f.currency_code = 'USD'
order by balance;

# 문제 7. users, fx_holdings 테이블에서 보유 통화가 2개 이상인 사용자의 ID, 이름, 보유 통화 개수를 조회하세요.
# (개수 내림차순, 같은 개수면 full_name 오름차순)
select u.user_id, u.full_name, count(f.currency_code) as n_currency
from users as u
inner join fx_holdings as f
on u.user_id = f.user_id
group by u.user_id
having n_currency >= 2
order by n_currency desc, full_name;

# 문제 8. users, fx_holdings 테이블에서 상태가 inactive인 사용자의 보유 내역을 조회하세요.
# (컬럼: full_name, currency_code, balance / full_name 오름차순)
select u.full_name, f.currency_code, f.balance
from users as u
inner join fx_holdings as f
on u.user_id = f.user_id
where u.status = 0
order by u.full_name;

# 문제 9. fx_holdings, users, currencies 테이블에서 이메일이 alice@example.com인 사용자의 보유 외환과 통화 영문명을 함께 조회하세요.
# (컬럼: currency_code, currency_name, balance / currency_code 오름차순)
select f.currency_code, c.currency_name, f.balance
from users as u
inner join fx_holdings as f
on u.user_id = f.user_id
inner join currencies as c
on f.currency_code = c.currency_code
where u.email= 'alice@example.com'
order by f.currency_code;

# 문제 10. fx_holdings 테이블에서 통화별 보유 사용자 수와 총 잔액을 함께 조회하세요.
# (컬럼: currency_code, holder_count, total_balance / currency_code 오름차순)
select currency_code, count(user_id) as holder_count, sum(balance) as total_balance
from fx_holdings
group by currency_code
order by currency_code;

