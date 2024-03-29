-- 책중에서 '축구의 역사' 라는 도서의 출판사와 가격을 알고 싶어.
-- dbo는 DataBase Owner(지금은 패스)
-- DML(4가지) 중 SELECT(조회)
SELECT publisher, price
  FROM Book 
 Where bookname = '축구의 역사'; 
 
/*
 SQL은 python, C, C++과 달리 거의 유일하게 == 이 아닌, = 하나만 사용한다.
 SQL은 문자열을 나타낼 때 "" 이 아닌 '' 을 사용한다.
 SQL은 대소문자 구분이 없지만, 키워드는 대문자로 사용한다.
 SQL은 ;이 필수가 아니지만, 중요한 상황에서는 사용할 것
*/

-- 김연아 고객의 전화번호를 찾으시오.
-- 1
 SELECT * -- All이라고 호칭
   FROM Customer;

-- 2 step (1 step에서 수정)
 SELECT *
  FROM Customer
 WHERE [name] = '김연아';

 -- 3 step(2 step에서 수정)
 SELECT phone
  FROM Customer
 WHERE [name] = '김연아';