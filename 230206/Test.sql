SELECT name FROM sys.databases;

SELECT *
FROM test1_1.tables;

select * from sys.sysdatabases;

show tables;

-- =============================================================================

-- 학생 정보 추가
insert into student_mst
	(student_id, student_name)
values
	(0, '김춘식'),
    (0, '손흥민');
    
-- 과목 정보 추가
insert into lecture_mst
	(lecture_id, lecture_name)
values
	(0, '컴퓨터구조'),
	(0, '데이터베이스'),
    (0, '인공지능');
    
-- 점수 정보 추가
insert into score
	(score_id, student_id, lecture_id, score)
values
	(0, 1, 1, 95),
	(0, 2, 1, 84),
	(0, 1, 2, 89),
	(0, 2, 2, 92),
	(0, 1, 3, 100),
    (0, 2, 3, 88);

-- 결과
select 
	sc.score_id as 순번,
    sc.student_id as 학번,
    sm.student_name as 이름,
    sc.lecture_id as 과목번호,
    lm.lecture_name as 과목이름,
    sc.score as 점수
from 
	score sc
    left outer join student_mst sm on(sm.student_id = sc.student_id)
    left outer join lecture_mst lm on(lm.lecture_id = sc.lecture_id)
where
	lm.lecture_id in (1, 2);
    
    
-- =============================================================================

select *
from 상품;

START TRANSACTION;

INSERT INTO `상품`
VALUES
	(0, '오렌지사탕', 20);

UPDATE `상품`
SET
    `수량` = 200
WHERE
	`상품코드` = 1;

 
DELETE
FROM
    `상품`
WHERE
    `상품명` = '누룽지사탕';

rollback;

COMMIT;



-- =============================================================


create index STUDENT_CODE_INDEX on 학생 (학번, 이름, 전공);

show index from 학생;


-- =============================================================

create view user_view as
SELECT
    `ID`,
    `USERNAME`,
    `PASSWORD`,
    `NAME`,
    `EMAIL`
FROM
    `USER_MST`
WHERE
    `ID` BETWEEN 1 AND 200;
    
SELECT * 
FROM user_view
WHERE username like 'a%';


-- =================================================================


SHOW FULL TABLES IN STUDENT_DB
WHERE TABLE_TYPE LIKE 'VIEW';


-- =================================================================


INSERT INTO sales (customer, amount)
VALUES 
    ('John', 100), 
    ('Jane', 200), 
    ('John', 150), 
    ('Jane', 50), 
    ('Jim', 300);
    
select 
	customer, 
	sum(amount) as tatal_sales,
    count(amount) as sales_rank
from
	sales
group by
	customer;
    
    
-- ====================================================================


CALL FIND_USER_BY_USERNAME('JANE');


-- ======================================================================

select * from user_mst;

select * from user_dtl;

delete
from user_mst
where user_id = 1;