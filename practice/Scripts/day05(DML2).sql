-- 2번 : DML2(관계 맺은 테이블에서의 DML)

-- 1. FK 관계 맺은 테이블 수정/삭제

CREATE TABLE TBL_PHONE(
	PHONE_NUMBER VARCHAR2(100),
	PHONE_COLOR VARCHAR2(100),
	PHONE_SIZE NUMBER,
	PHONE_PRICE NUMBER,
	PHONE_SALE NUMBER,
	PHONE_PRODUCTION_DATE DATE,
	CONSTRAINT PK_PHONE PRIMARY KEY(PHONE_NUMBER)
);

CREATE TABLE TBL_CASE(
	CASE_NUMBER VARCHAR2(100),
	CASE_COLOR VARCHAR2(100),
	CASE_PRICE NUMBER,
	PHONE_NUMBER VARCHAR2(100),
	CONSTRAINT PK_CASE PRIMARY KEY(CASE_NUMBER),
	CONSTRAINT FK_CASE FOREIGN KEY(PHONE_NUMBER) REFERENCES TBL_PHONE(PHONE_NUMBER)
);

SELECT * FROM TBL_CASE;
SELECT * FROM tbl_phone;

-- 관계를 맺은 테이블이 있을 때 자식테이블은 부모 테이블의 값을 참조하기 때문에 항상 부모 테이블에 data가 먼저 들어가야한다
-- PHONE 테이블이 부모이므로 PHONE에 먼저 데이터를 넣어야한다

INSERT INTO TBL_PHONE
--VALUES('a1', 'white', 1, 100, 0, to_date('2025-05-01', 'yyyy-mm-dd'));
--values('a2', 'black', 1, 120, 10, sysdate - 10);
VALUES('a3', 'black', 1, 130, 20, TO_DATE('2025-06-01', 'YYYY-MM-DD'));

INSERT INTO TBL_CASE
--VALUES('A', 'WHITE', 5, 'A1'); -- TBL_PHONE 테이블에는 A1 값이 없기 때문에(데이터값은 대소문자 구분) 오류발생
--VALUES('A', 'WHITE', 5, 'a1');
VALUES ('B', 'BLACK', 2, 'a2');

SELECT * FROM TBL_CASE;
SELECT * FROM tbl_phone;

-- 부모 테이블의 값을 수정하기
-- 자식테이블에서 FK로 참조하고 있는 값이 아니라면 수정 가능하지만, 참조하고 있는 값인 경우 수정이 불가능하다
-- phone_color는 참조하는 컬럼이 아니므로 수정 가능
UPDATE TBL_PHONE 
SET PHONE_COLOR = 'blue'
WHERE phone_number = 'a1';
-- phone_number는 참조하고있는 컬럼이기 때문에 수정 불가능(오류발생)
--UPDATE TBL_PHONE
--SET PHONE_NUMBER = 'aa1'
--WHERE phone_number = 'a1';

-- 부모의 값을 변경할 때 자식에서 참조중인 값을 변경하려고하면 오류가 발생하므로
-- 자식테이블의 값을 먼저 수정하여 해당 값을 참조하지 않도록 수정해야한다
--1) 자식 테이블에서 참조중인 값을 다른 값으로 변경한다(부모테이블에 존재하는 값이어야한다)
UPDATE TBL_CASE
SET PHONE_NUMBER = 'a2'
WHERE case_number = 'A';

SELECT * FROM tbl_case;

UPDATE TBL_PHONE
SET PHONE_NUMBER = 'aa1'
WHERE phone_number = 'a1';

SELECT * FROM tbl_phone;

-- 2) 자식테이블에서 참조중인 값을 NULL로 변경한다(정말 급한게 아니라면 비추천)
UPDATE TBL_CASE
SET PHONE_NUMBER = NULL
WHERE CASE_NUMBER = 'A';

UPDATE TBL_PHONE
SET PHONE_NUMBER = 'aa3'
WHERE phone_number = 'a3';

UPDATE tbl_case
SET phone_number = 'aa3'
WHERE phone_number IS NULL;

SELECT * FROM TBL_PHONE;
SELECT * FROM TBL_CASE;

-- 부모테이블에서 데이터 삭제하기
-- 자식테이블에서 참조중인 값들을 먼저 처리해야한다
DELETE FROM TBL_PHONE
--WHERE PHONE_NUMBER = 'a2'; -- 자식 테이블에서 참조중인 값이라 삭제 불가능
WHERE phone_number = 'aa1'; -- 자식 테이블에서 참조중인 값이 아니므로 삭제 가능

-- 1) 자식 테이블의 값을 먼저 삭제 후 부모 테이블의 값을 삭제한다(참조중인 행 자체를 삭제)
DELETE FROM tbl_case 
WHERE phone_number = 'a2';

DELETE FROM tbl_phone
WHERE phone_number = 'a2';

-- 2) 자식테이블에서 참조중인 값을 수정 후 부모 테이블의 값을 삭제한다
UPDATE tbl_case 
SET phone_number = NULL
WHERE case_number = 'A';

SELECT * FROM tbl_case;

DELETE FROM TBL_PHONE 
WHERE PHONE_NUMBER = 'aa3';

SELECT * FROM tbl_phone;
