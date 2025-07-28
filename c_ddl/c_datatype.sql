### c_ddl >> c_datatype ###

# --- DataType --- #

### SQL의 데이터 형식 (정수형, 문자형, 실수형, 논리형, 날짜형) ###

/*
	1. 정수형
    : 숫자 데이터 저장, 데이터 종류에 따라 메모리 사용 공간이 다름
    
    1) tinyint (1byte: 8bit)
    : -128 ~ 127
    EX) 나이, 성별코드, 성적 등
    
    2) smallint (2byte: 16bit)
    : -32,768 ~ 32,767
    EX) 우편 번호, 사원 번호 등
    
    3) int (4byte: 32bit)
    : 약 -21억 ~ 약 21억
    : 일반적인 용도로 가장 많이 사용되는 정수형 타입
    EX) 주문 번호, 고객 ID 등
    
    4) bigint (8byte: 64bit)
    : 약 -900경 ~ 약 900경
    EX) 금융권, 천문학에서 주로 사용 / 각 테이블의 식별값
    
    +) 대규모 서비스에서는 사용자, 게시글, 주문 등 각종 데이터가 수억 ~ 수십억건 이상 가능
		>> int 범위의 초과가 늘고 있다!
        >> 안전 설계를 위해 bigint 값 사용량이 증가!
*/

CREATE DATABASE IF NOT EXISTS `example`;
USE `example`;

CREATE TABLE `integer` (
	# 컬럼명 데이터타입 [제약사항]
    t_col tinyint,
    s_col smallint,
    i_col int,
    b_col bigint
);

# insert 키워드: 데이터 '삽입'
# insert into 테이블명 value (레코드값을 컬럼 순으로 콤마로 구분하여 나열);





















