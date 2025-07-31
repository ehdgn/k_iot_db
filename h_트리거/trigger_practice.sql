### h_트리거 >>> trigger_practice ###

/*
	문제1
	선수(players)가 삭제될 때, 
	해당 선수의 이름과 삭제 시각을 player_delete_logs 테이블에 기록하는 트리거를 생성
    
	>> 로그 테이블이 없으면 먼저 생성하고, 트리거명: after_player_delete

	문제2
	선수(players)의 포지션(position)이 변경될 경우
		, 이전 포지션과 변경된 포지션, 선수 이름을 player_position_logs에 기록하는 트리거를 생성
	
    >> 로그 테이블이 없으면 먼저 생성하고,트리거명: after_player_position_update

문제3
	선수가 추가되거나 삭제될 때마다 해당 팀의 선수 수(player_count)를 자동으로 업데이트하는 트리거 2개	
    (after_player_insert_count, after_player_delete_count)
	
    >> ※ teams 테이블에 player_count 컬럼이 이미 존재한다고 가정함
	
    ALTER TABLE teams ADD COLUMN player_count INT DEFAULT 0;
*/

USE `baseball_league`;

select * from players;
select * from teams;

#-------------------------------------------------------#

create table if not exists player_delete_logs (
	log_id int auto_increment primary key,
	player_name varchar(20),
    log_time datetime
);

drop trigger if exists after_player_delete;

delimiter $$
create trigger after_player_delete
	after delete
    on players
    for each row
begin
	insert into player_delete_logs(player_name, log_time)
    values
		(OLD.name, curdate());
end $$

delimiter ;

#-------------------------------------------------------#

create table if not exists player_position_logs(
	old_position varchar(50),
    new_position varchar(50),
    player_name varchar(50)
);

drop trigger if exists after_player_position_update

delimiter $$
create trigger after_player_position_update
	after update
    on players
    for each row
begin
	insert into player_position_logs (old_position, new_position, player_name)
    values (OLD.position, NEW.position, NEW.name);
end $$

delimiter ;

#-------------------------------------------------------#
    
ALTER TABLE teams ADD COLUMN player_count INT DEFAULT 0;

drop trigger if exists after_player_insert_count;

drop trigger if exists after_player_delete_count;

delimiter $$

create trigger after_player_insert_count
	after insert
    on teams
    for each row
begin
	update 
		teams
	set
		player_count = player_count + 1
	where
		team_id = NEW.team_id;
	
end $$

delimiter ;
	 
    
delimiter $$

create trigger after_player_delete_count
	after delete
    on teams
    for each row
begin
	update 
		teams
	set
		player_count = player_count - 1
	where
		team_id = OLD.team_id;
end $$

delimiter ;
	 


# ✔문제 1 테스트: 선수 삭제 시 로그 기록 확인
-- 테스트용 선수 추가
INSERT INTO `players`
VALUES
	(201, '테스트 선수1', '타자', '1999-03-03', 2);

-- 삭제 전 로그 확인
SELECT * FROM player_delete_logs;

-- 테스트용 선수 삭제
DELETE FROM players WHERE player_id = 201;

-- 삭제 후 로그 확인
SELECT * FROM player_delete_logs;



-- ✔ 문제 2 테스트: 포지션 변경 시 로그 기록 확인
-- 테스트용 선수 추가
INSERT INTO `players`
VALUES
	(201, '테스트 선수1', '타자', '1999-03-03', 2);
    
-- 포지션 변경 전 로그 확인
SELECT * FROM player_position_logs;

-- 포지션 변경
UPDATE players SET position = '외야수' WHERE player_id = 201;

-- 포지션 변경 후 로그 확인
SELECT * FROM player_position_logs;



-- ✔ 문제 3 테스트: 선수 추가/삭제 시 teams.player_count 자동 업데이트 확인
-- 테스트 전 player_count 초기 상태 확인
SELECT team_id, player_count FROM teams;

-- 선수 추가
INSERT INTO players (player_id, name, position, birth_date, team_id)
VALUES (303, '테스트선수3', '투수', '1994-07-07', 1);

-- 추가 후 player_count 확인
SELECT team_id, player_count FROM teams WHERE team_id = 1;

-- 선수 삭제
DELETE FROM players WHERE player_id = 303;

-- 삭제 후 player_count 확인
SELECT team_id, player_count FROM teams WHERE team_id = 1;



