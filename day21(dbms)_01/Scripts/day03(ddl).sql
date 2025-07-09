-- 2번 : DML 연습 

SELECT * FROM tbl_student; 

/*
-- 학생의 평균 점수를 구하고 학점을 수정하기 
A : 90점 이상 
B : 80점 이상 90점 미만 
C : 70점 이상 80점 미만
F : 70점 미만 
*/

-- STUDENT_GRADE 컬럼의 값을 수정 
UPDATE TBL_STUDENT 
SET STUDENT_GRADE = 'A'
WHERE (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR) / 3 >= 90;

UPDATE TBL_STUDENT 
SET STUDENT_GRADE = 'B'
WHERE (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR) / 3 >= 80
AND (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR) / 3 < 90;

UPDATE TBL_STUDENT 
SET STUDENT_GRADE = 'C'
WHERE (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR) / 3 >= 70
AND (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR) / 3 < 80;

UPDATE TBL_STUDENT 
SET STUDENT_GRADE = 'F'
WHERE (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR) / 3 < 70;

-- 학점이 잘 들어갔는지 확인하기 위해서 학생번호, 이름, 평균점수, 학점 조회하기(별칭)
SELECT STUDENT_NUMBER 학생번호, STUDENT_NAME 이름, 
	(STUDENT_MATH + STUDENT_ENG + STUDENT_KOR) / 3 평균점수, 
	STUDENT_GRADE 학점 
FROM TBL_STUDENT;

-- 학생의 수학, 영어, 국어 점수 중 한 과목이라도 50점 미만이 아니고 
-- 학점이 B학점 이상인 학생만 학생번호, 이름, 학점 출력하기 
SELECT * FROM TBL_STUDENT t; 

-- 조회할 칼럼 : 
-- 테이블 : 
-- 조건1 : 
-- 조건2 : 
-- 정렬 기준 :
SELECT student_number 학생번호, student_name 이름, student_grade 학점 
FROM tbl_student
WHERE student_math >= 50 AND student_eng >= 50 AND student_kor >= 50
AND student_grade in('A','B');

SELECT *
FROM tbl_student 
WHERE NOT (student_math < 50 OR student_eng < 50 OR student_kor < 50)
AND student_grade = 'B' OR student_grade = 'A';
-- 조건을 모두 만족하면서 b인 학생, a학생은 모두 다 나옴(a학점이지만 점수가 부족한 학생도 포함)
-- AND 연산자와 우선 순위가 다르다 

SELECT * 
FROM TBL_STUDENT 
WHERE STUDENT_MATH >= 50 AND STUDENT_ENG >= 50 AND STUDENT_KOR >= 50 
	AND STUDENT_GRADE BETWEEN 'A' AND 'B';  

-- 서브쿼리(가독성이 높아짐)
SELECT FROM TBL_STUDENT 
WHERE STUDENT_NUMBER IN (
	SELECT STUDENT_NUMBER 
	FROM TBL_STUDENT 
	WHERE STUDENT_MATH >= 50 
	AND STUDENT_ENG >= 50 
	AND STUDENT_KOR >= 50 
	AND STUDENT_GRADE IN ('A', 'B')
)

-- 학생의 수학, 영어, 국어 점수 중 한 과목이라도 30점 미만이면 퇴학(DB에서 삭제)
DELETE FROM TBL_STUDENT
WHERE STUDENT_MATH < 30 OR STUDENT_ENG < 30 OR STUDENT_KOR < 30; 

SELECT * FROM TBL_STUDENT;
