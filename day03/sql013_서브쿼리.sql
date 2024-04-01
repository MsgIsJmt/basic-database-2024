-- Q. 책가격이 가장 비싼 책
/*
 SELECT MAX(price)
    FROM Book;
 bookname이 GROUP BY에 없어서 에러가 난다.
*/


-- Q. 35,000인 것을 찾아보세요
SELECT *
  FROM Book
 WHERE price = 35000;


-- Q. 서브쿼리를 쓰면 한번에 실행 가능
SELECT bookname
  FROM Book
 WHERE price = (SELECT MAX(price)
                  FROM Book);


-- Q. 도서를 구매한 적이 있는 고객이름 검색 (서브쿼리 사용) 
SELECT [name] AS '고객 이름'
  FROM Customer
 WHERE Custid IN (SELECT DISTINCT custid -- IN을 사용하면 구매한 적 있는사람
                      FROM Orders);      -- NOT IN을 사용하면 구매한 적 없는사람


-- Q. 도서를 구매한 적이 있는 고객이름 검색 (JOIN 사용) 
SELECT DISTINCT c.[name] AS '고객 이름'
  FROM Customer AS c, Orders AS O
 WHERE c.custid = o.custid


 -- Q. 도서를 구매한 적이 없는 고객이름 검색 (JOIN 사용) 
SELECT DISTINCT c.[name] AS '고객 이름'
  FROM Customer AS c LEFT OUTER JOIN Orders AS O
    ON c.custid = o.custid
 WHERE o.orderid IS NULL;

 -- Q. 도서를 구매한 적이 있는 고객이름 검색 (서브쿼리 FROM 절)
 SELECT b.bookid
      , b.bookname
      , b.publisher
      , o.orderdate
      , o.orderid
   FROM Book AS b, Orders AS O
  WHERE b.bookid = o.bookid

-- 서브쿼리 FROM 절
-- SELECT로 만들 실행결과(가상의 테이블)를 마치 DB에 있는 테이블처럼 사용 가능
SELECT t.*
  FROM (
        SELECT b.book
             , b.bookname
             , b.publisher
             , o.orderdate
             , o.orderid
        FROM Book AS b, Orders AS o
        WHERE b.bookid = o.bookid
        ) AS t;

-- 서브쿼리 SELECT절
-- 무조건 1건에 1컬럼만 연결
-- 조인으로 가능(조인보다 성능에 취약)
SELECT o.orderid
     , o.custid
     , (SELECT name FROM Customer WHERE custid = o.custid)
     , o.bookid
     , (SELECT bookname FROM Book WHERE boodid = o.bookid)
     , o.saleprice
     , o.orderdate
  FROM Orders AS o;

-- 대한미디어에서 출판한 도서를 구매한 고객의 이름을 조회
-- 조인으로 가능
SELECT name
  FROM Customer
 WHERE custid IN(SELECT custid
                 FROM Orders
                WHERE bookid IN(SELECT bookid
                                  FROM Book
                                 WHERE publisher = '대한미디어'));

-- 계산결과를 서브쿼리로 사용
SELECT b1.*
  FROM Book b1
 WHERE b1.price > (SELECT AVG(b2.price)
                     FROM Book b2
                    WHERE b2.publisher = b1.publisher);

-- 각 출판사별 평균가격                    
SELECT AVG(b2.price), b2.publisher
  FROM Book b2
GROUP By b2.publisher









