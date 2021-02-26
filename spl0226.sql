-- ABS(숫자)
select abs(-100);

-- ceiling(숫자), floor(숫자), round(숫자)
select ceiling(4.4), floor(4.7), round(4.5);

-- rand()
select rand(), floor(1+(rand()*(7-1)));

-- addate (날짜, 차이), subdate(날짜, 차이)
select adddate('2021-02-01', interval 27 day),
adddate('2021-02-01', interval 1 month);

select subdate('2021-02-01', interval 27 day),
subdate('2021-02-01', interval 1 month);

-- addtime(날짜/시간, 시간), subtime(날짜/시간, 시간)
select addtime('2021-02-01 10:23:05' , '1:1:1');

-- curdate(), curtime(), now(), sysdate()
select curdate(), curtime(), now(), sysdate();

-- year(), month(), day(), hour(), minute()
select year(curdate()), month(curdate()), day(curdate());
select hour(curtime()), minute(curtime());


-- date(), time()
select date(now()), time(now());

-- 구매 테이블 중에서 JYP 아이디를 가진 사람을 조회하시오.
use sqldb;
select * 
from buytbl
	inner join usertbl
    on buytbl.userID= usertbl.userID
where buytbl.userID='JYP';



-- 아이디/ 이름/ 구매물품/주소/연락처만 추출하시오.
use sqldb;
select buytbl.userID, usertbl.name, buytbl.prodName, usertbl.addr,
		concat(usertbl.mobile1, usertbl.mobile2) as '연락처'
from buytbl
	inner join usertbl
    on buytbl.userID=usertbl.userID
order by buytbl.num;

use sqldb;
select B.userID, U.name, B.prodName, U.addr,
		concat(U.mobile1, U.mobile2) as '연락처'
from buytbl B
	inner join usertbl U
    on B.userID=U.userID
order by B.num;

-- JYP 아이디를 가진 사용자의 아이디/ 이름/ 구매물품/ 주소/ 연락처만 구하시오
select B.userID, U.name, B.prodName, U.addr,
		concat(U.mobile1, U.mobile2) as '연락처'
from buytbl B
	inner join usertbl U
    on B.userID=U.userID
where B.userID='JYP';

-- 전체 회원들이 구매한 목록을 조회하시오 (회원테이블이 기준)
use sqldb;
select B.userID, U.name, B.prodName, U.addr,
		concat(U.mobile1, U.mobile2) as '연락처'
from usertbl U
	inner join buytbl B
    on U.userID=B.userID
order by U.userID;


-- 중복 없이 회원들이 구매한 목록을 조회하시오 (회원테이블이 기준)
use sqldb;
select distinct U.userID, U.name,
		concat(U.mobile1, U.mobile2) as '연락처'
from usertbl U
	inner join buytbl B
    on U.userID=B.userID
order by U.userID;


