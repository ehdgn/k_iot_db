### e_select >>> a_select ###

# select A from B where C;

/*
	select A
    form B
    where C
    group by D
    having E
    order by F 
    limit G
*/

/*
	4. group by
    : 그룹으로 묶어주는 역할
    - 여러 행을 그룹화하여 집계합수를 적용해 데이터 단일화에 주로 사용
    
    cf) 집계 함수: 그룹화 된 데이터에 대한 계산
		- max(), min(), avg(), sum()
        - count(): 행의 수를 반환
        - count(distinct): 행의 수를 반환 (중복은 1개만 인정)
*/

-- select * from `members`
-- group by grades; 
# > 등급별로 데이터를 그룹화 할 때  결합되지 않는 데이터까지 조회하는 경우 오류!

# cf) 집계함수는 그룹화된 영역 내에서 각각 계산
# 1) 등급별 회원 수 계산
select grade, count(*) from `members`
group by
	grade;

# 2) 지역별 평균 포인트 계산
select
	area_code, avg(points)
from
	`members`
group by
	area_code;
    
/*
	5. havig
    : grop by 함꼐 사용 ,그룹화된 결과에 대한 조건 지정
    - where 조건과 식은 유사하지만, 그룹화된 데이터에 대한 조건 지정
*/

select grade, count(*) from `members`
group by
	grade
having
	count(*) >= 2;
    
select area_code, avg(points)
from 
	`members`
group by
	area_code
having
	avg(points) >= 200;   
    
    
/*
	6. order by
    : 데이터 정렬
    - 결과의 값이나 개수에 영향 X
    - 기본값 asc(ascending, 오름차순), desc(desceding, 내림차순)
*/

select * from `members`; -- 데이터 삽입 순서대로 정렬 (auto_increment PK 값에 따라 정렬)

select * from `members`
order by
	join_date; # 과거 순 정렬
    
select * from `members`
order by
	name desc; # 이름 순 정렬 (내림차순)
    
# cf) 정렬된 데이터를 기반으로 추가 정렬 (콤마로 정렬 상태 나열)
select * from `members`
order by
	grade desc, points desc;
    
/*
	7. limit
    : 출력하는 개수를 제한 (반환되는 행의 수를 제한)
    
    limit 행수 (offset 시작행)
    - 첫 번째 행이 기본값 0
*/
select * from `members`;

select * from `members`
limit 5;

select * from `members`
limit 5 offset 2; --  offset 2: 세 번째 행부터 출력

select * from `members`
order by
	grade desc
limit 5;

/*
	cf) distinct(별개의, 뚜렷한)
    : 중복된 결과를 제거
    - 조회된 결과에서 중복된 데이터가 존재하면 1개만 남기고 생략
    
    조회할 열 이름 앞에 distinct 키워드만 작성
*/
select * from `members`;

select distinct area_code from `members`;
select distinct grade from `members`;

































