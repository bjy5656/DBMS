--3번문제
/*- 오라클 DBMS 설치
-> WINDOW + R 
-> cmd 실행 
-> dbms 실행 => sqlplus 입력 
-> 최고 관리자 계정명으로 접속 => Enter USER-name: 뒤에 sys AS sysdba 입력 
-> 설정했던 비밀번호 입력 => 1234
-> hr계정의 잠금을 해제 => ALTER USER hr account unlock;
-> hr계정의 비밀번호 변경 => ALTER USER hr IDENTIFIED BY 1234;
-> eixt -> sqlplus -> 
-> hr계정으로 접속 => Enter USER-name: hr
-> 변경했던 비밀번호 입력 => 1234
-> 현재 계정 확인 => show USER;*/*/

--4번문제 
SELECT * FROM employees;

--5번문제
SELECT email FROM employees;

--2번문제
DB : DATABASE, 여러가지 데이터를 모아둔 공간이다. 일상생활에서 사용하는 정보가 모두 데이터베이스에 기록된다. 
DBMS : DATABASE Management System, 데이터베이스 관리 시스템이다. 구조화된 쿼리 언어를 통해 DB를 관리할 수 있는 구체적인 체계를 지닌다. 
관계형 데이터 베이스 : 테이블 형식으로 데이터를 저장하는 데이터베이스이다. 행(튜플, 레코드, row)과 열(칼럼, 필드) 로 이루어진다. 
가장 일반적인 SQL 언어를 사용하여 데이터를 추가, 삭제, 수정, 검색한다. 
