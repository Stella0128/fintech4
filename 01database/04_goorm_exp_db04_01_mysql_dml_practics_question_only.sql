-- 원격 DB 221.155.18.165, kict00(본인 번호)로 접속하세요 
-- korea_stock 데이터베이스에서 prices_2025_copy 테이블을 이용해 아래의 문제를 해결할 수 있는 SQL문을 작성하세요.
-- 작성 후 현재 쿼리창을 저장해서 exp에 sql파일을 업로드해 제출하세요.

use korea_stock;
select * from prices_2025_copy;

-- 01. 2025년 테이블에서 임의 10행을 조회하세요.
select * from prices_2025_copy limit 10;
select * from prices_2025_copy order by rand() limit 10;

-- 02. 컬럼 Date, 회사명, 종목코드, Close 만 20행 조회하세요.
select Date, 회사명, 종목코드, Close from prices_2025_copy limit 20;

-- 03. 중복 없이 회사명 목록을 조회하세요.
select distinct 회사명 from prices_2025_copy;

-- 04. 종가(Close)가 50,000 이상인 행을 조회하세요.
select * from prices_2025_copy where Close >= 50000;

-- 05. 종가가 50,000 미만인 행을 조회하세요.
select * from prices_2025_copy where Close < 50000;

-- 06. 시가(Open)가 10,000 이상 20,000 이하인 행을 조회하세요.
select * from prices_2025_copy where Open between 10000 and 20000;

-- 07. 회사명에 '전자'가 포함된 행을 조회하세요.
select * from prices_2025_copy where 회사명 like '%전자%';

-- 08. 회사명이 '삼성전자' 또는 'LG전자'인 행을 조회하세요.
select * from prices_2025_copy where 회사명 = '삼성전자' or 회사명 = 'LG전자';
select * from prices_2025_copy where 회사명 in ('삼성전자', 'LG전자');

-- 09. 종목코드가 '005930'인 데이터만 날짜 오름차순으로 조회하세요.
select * from prices_2025_copy where 종목코드 ='005930' order by Date asc;

-- 10. 종가 내림차순으로 50행을 조회하세요.
select * from prices_2025_copy order by Close desc limit 50;

-- 11. 거래량 Volume 오름차순으로 30행을 조회하세요.
select * from prices_2025_copy order by Volume asc limit 30;

-- 12. 고가(High)가 저가(Low)보다 큰 행만 조회하세요.
select * from prices_2025_copy where High > Low;

-- 13. 회사명이 NULL 이거나 종목코드가 NULL 인 행을 조회하세요.
select * from prices_2025_copy where 회사명 is null or 종목코드 is null;

-- 14. 회사명이 NULL 이 아닌 행만 조회하세요.
select * from prices_2025_copy where 회사명 is not null;

-- 15. 2025-01-02 하루의 데이터를 조회하세요.
select * from prices_2025_copy where Date = '2025-01-02';

-- 16. 2025-02-01부터 2025-02-28까지 데이터를 조회하세요.
select * from prices_2025_copy where Date between '2025-02-01' and '2025-02-28';

-- 17. 2025년 1분기(1~3월) 데이터를 조회하세요.
select * from prices_2025_copy where Date between '2025-01-01' and '2025-03-31';

-- 18. 회사명이 'SK'로 시작하는 행을 조회하세요.
select * from prices_2025_copy where 회사명 like 'SK%';

-- 19. 회사명이 '테스트'로 끝나는 행을 조회하세요.
select * from prices_2025_copy where 회사명 like '%테스트';

-- 20. 시가가 0보다 큰 행만 조회하세요.
select * from prices_2025_copy where Open > 0;

-- 21. 시가보다 종가가 큰(상승) 행만 조회하세요.
select * from prices_2025_copy where Open < Close;

-- 22. 시가와 종가가 같은(보합) 행을 조회하세요.
select * from prices_2025_copy where Open = Close;

-- 23. 시가보다 종가가 작은(하락) 행만 조회하세요.
select * from prices_2025_copy where Open > Close;

-- 24. 고가가 100,000 이상이거나 거래량이 1,000,000 이상인 행을 조회하세요.
select * from prices_2025_copy where High >= 100000 or volume >= 1000000;

-- 25. 저가가 5,000 미만이고 거래량이 10,000 초과인 행을 조회하세요.
select * from prices_2025_copy where Low < 5000 and volume > 10000;

-- 26. 회사명이 '네이버'가 아닌 행을 조회하세요.
select * from prices_2025_copy where 회사명 != '네이버';

-- 27. 종목코드가 '002001'부터 '002025' 사이(문자열 비교)인 행을 조회하세요.
select * from prices_2025_copy where 종목코드 between '002001' and '002025';

-- 28. 회사명, 종목코드, Date, Close 컬럼을 회사명을 기준으로 가나다순 오름차순으로 100행 조회하세요.
select 회사명, 종목코드, Date, Close from prices_2025_copy order by 회사명 asc limit 100;
 
-- 29. 회사명을 기준으로 가나다순 내림차순으로 100행 조회하세요.
select 회사명, 종목코드, Date, Close from prices_2025_copy order by 회사명 desc limit 100;

-- 30. 고가-저가 스프레드가 1000 이상인 행을 조회하세요. (연산 사용)
select * from prices_2025_copy where (High - Low) >= 1000;

-- 31. 시가가 30,000 초과이고 종가가 25,000 미만인 행을 조회하세요.
select * from prices_2025_copy where Open > 30000 and Close < 25000;

-- 32. 거래량이 100,000 이상 500,000 이하인 행을 조회하세요.
select * from prices_2025_copy where volume between 100000 and 500000;

-- 33. 종목코드가 ('005930','000660','035420') 중 하나인 행을 조회하세요.
select * from prices_2025_copy where 종목코드 in ('005930','000660','035420');

-- 34. '전자' 또는 '화학'을 이름에 포함하는 회사의 행을 조회하세요.
select * from prices_2025_copy where 회사명 like '%전자%' or 회사명 like '%화학%';

-- 35. 회사명에 공백이 포함된 행을 조회하세요.
select * from prices_2025_copy where 회사명 like '% %';

-- 36. 2025-03-01 이후의 데이터만 조회하세요.
select * from prices_2025_copy where Date >= '2025-03-01';

-- 37. 2025-03-01 이전의 데이터만 조회하세요.
select * from prices_2025_copy where Date < '2025-03-01';

-- 38. 종가 기준 내림차순, 같으면 거래량 내림차순으로 50행 조회하세요.
select * from prices_2025_copy order by Open desc, volume desc limit 50;

-- 39. 시가 기준 오름차순, 같으면 회사명 오름차순으로 50행 조회하세요.
select * from prices_2025_copy order by Open asc, 회사명 asc limit 50;

-- 40. 회사명과 종목코드만 조회하되 종목코드 오름차순으로 200행 조회하세요.
select 회사명, 종목코드 from prices_2025_copy order by 종목코드 asc limit 200;

-- 41. 종가가 0인(또는 음수 포함) 비정상 데이터를 조회하세요.
select * from prices_2025_copy where Close <= 0;

-- 42. 거래량이 10,000 미만이거나 NULL 인 행을 조회하세요.
select * from prices_2025_copy where volume < 10000 or volume is null;

-- 43. (INNER) 2025 가격과 회사마스터를 종목코드로 내부조인하여 20행 조회하세요.
select *
from korea_stock_company as c
inner join prices_2025_copy as p
on c.종목코드 = p.종목코드
limit 20;

-- 44. (LEFT) korea_stock_company의 모든 컬럼과 2025년 가격을 30행 조회하세요.
select *
from korea_stock_company as c
left join prices_2025_copy as p
on c.종목코드 = p.종목코드
limit 30;

-- 45. (RIGHT) korea_stock_company를 기준으로 2025 가격을 조인하고 30행 조회하세요.
select *
from korea_stock_company as c
right join prices_2025_copy as p
on c.종목코드 = p.종목코드
limit 30;

-- 46. (INNER) 업종에 '반도체'가 포함된 기업의 2025 데이터를 조회하세요.
select *
from korea_stock_company as c
inner join prices_2025_copy as p
on c.종목코드 = p.종목코드
where c.업종 like '%반도체%';

-- 47. (LEFT) korea_stock_company 테이블과 2025년 주가 테이블을 조인하고 지역명에 "서울"이 들어간 데이터를 조회하세요. 
select *
from korea_stock_company as c
left join prices_2025_copy as p
on c.종목코드 = p.종목코드
where c.지역 like '%서울%';

-- 48. (RIGHT) 대표자명에 '김'이 포함된 회사(가격 유무 무관)를 조회하세요.
select *
from korea_stock_company as c
right join prices_2025_copy as p
on c.종목코드 = p.종목코드
where c.대표자명 like '%김%';

-- 49. (LEFT) korea_stock_company와 2025 데이터를 조인하고 상장일이 '2010-01-01' 이후인 회사를 찾으세요.
 select *
from korea_stock_company as c
left join prices_2025_copy as p
on c.종목코드 = p.종목코드
where c.상장일 > '2010-01-01';

-- 50. (INNER) 홈페이지가 공백이 아닌 기업의 2025 데이터를 조회하세요. (함수 없이)
select *
from korea_stock_company as c
inner join prices_2025_copy as p
on c.종목코드 = p.종목코드
where c.홈페이지 is not null;