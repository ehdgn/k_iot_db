### f_join >>> z_review_question ###

select * from `members`;
select * from `purchases`;

/*
	문제 1
	모든 회원의 이름, 등급, 구매한 상품 코드, 구매일, 구매 금액(amount)을 조회하세요.
	구매 기록이 없는 회원도 모두 포함되도록 하세요.
	단, 구매일이 오래된 순으로 정렬하세요.

	문제 2
	2023년 이후 가입한 회원 중 구매 총액이 30000원 이상인 
    회원의 이름, 지역코드, 총 구매금액을 조회하세요.

	문제 3
	회원 등급별로 구매 총액 평균을 구하고,
	회원 등급(grade), 구매건수(COUNT), 구매총액합계(SUM), 구매평균(AVG)을 모두 출력하세요.
	단, 구매가 한 건도 없는 등급은 제외하세요.
*/

USE `korea_db`;

select 
	M.name '회원 이름', M.grade 등급, P.product_code '상품 코드', P.purchase_date 구매일, P.amount '구매 금액'
from `members` M
	join `purchases` P
order by
	P.purchase_date;
	


SELECT 
	M.name AS 회원이름, M.area_code AS 지역코드, SUM(P.amount) AS 총합
FROM
	`members` M
    JOIN `purchases` P
    ON M.member_id = P.member_id
WHERE 
	M.join_date >= '2023-01-01'
GROUP BY
	M.member_id, M.name, M.area_code
HAVING
	SUM(P.amount) >= 30000;
    
    
    

SELECT
	M.grade 회원등급, count(P.purchase_id) 구매건수, SUM(P.amount) 구매총액합계, ROUND(AVG(p.amount), 2) 구매총액평균
FROM
	`members` M
    JOIN `purchases` P
    ON M.member_id = P.member_id
GROUP BY
	M.grade

	
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    