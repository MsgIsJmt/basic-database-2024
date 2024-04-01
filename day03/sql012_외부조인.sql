-- Customer를 기준으로  Orders 테이블과 외부조인하기
SELECT c.custid
     , c.[name]
     , c.[address]
     , c.phone
     , o.orderid
     , o.custid -- OUTER JOIN에서는 이 외래키는 필요
     , o.bookid
     , o.saleprice
     , o.orderdate
  FROM Customer AS c LEFT OUTER JOIN Orders AS o
-- FROM Customer AS c RIGHT OUTER JOIN Orders AS o 
-- RIGHT OUTER JOIN의 경우 INNER JOIN과 같은 결과가 출력된다.
    ON c.custid = o.custid