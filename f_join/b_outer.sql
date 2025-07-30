### f_join >>> b_outer ###

-- 2. 외부 조인 (OUTER JOIN)
# : 한쪽 테이블만 존재하는 데이터까지도 결과로 포함하는 조인 방식
# : 조건에 일치하지 않아도 기준 테이블의 행은 모두 출력
# - 일치하지 않는 열 NULL로 채워짐

# cf) 외부 조인 종류
# 1) LEFT OUTER JOIN
# 	- 기준 테이블 위치(왼쪽, FROM 뒤 테이블)
#	- 포함 범위(왼쪽 테이블의 모든 행 + 매칭된 오른쪽 테이블)
# 2) RIGHT OUTER JOIN
#	- 기준 테이블 위치(오른쪽, JOIN 뒤 테이블)
#	- 포함 범위(오른쪽 테이블의 모든 행 + 매칭된 왼쪽 테이블)
# 3) FULL OUTER JOIN
#	- 양쪽 모두, 두 테이블의 모든 행
# 	- MySQL 직접 지원 X

### 외부 조인 기본 형태 ###
/*
	SELECT 열 목록
	FROM 기준 테이블 별칭
		LEFT | RIGHT OUTER JOIN 조인할 테이블
        ON 조인될 조건
	[WHERE 조건식...];
    
    cf) OUTER 키워드 생략 가능 - LEFT JOIN, RIGHT JOIN으로도 사용 가능
*/















