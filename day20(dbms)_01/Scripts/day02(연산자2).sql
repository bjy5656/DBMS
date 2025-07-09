-- 3번 : 연산자 
-- (3) 관계연산자(비교연산자)
/*SELECT [DISTINCT] 칼럼명 [AS "별칭"]
FROM 테이블명 
WHERE 조건식 
ORDER BY 정렬할칼럼명 [ASC OR desc]
*/

-- 행을 고르기 위해서 WHERE절을 사용한다 
-- 직원의 이름, 성, 급여를 조회한다 
SELECT first_name 이름, last_name 성, salary 급여 -- 3) 각 칼럼에 별칭을 붙여서 조회한다 
FROM employees	-- 1) employees 테이블에서
WHERE salary >= 10000  -- 2) salary가 10000보다 크거나 같은 값이 있는 행만 찾는다 
ORDER BY 급여;	-- 4) 급여의 오름차순 정렬 
--WHERE 급여 >= 10000; 별칭 사용 불가능(별칭은 select에서 만들어진다)

-- from -> where -> select -> order by 

SELECT * FROM employees;

-- 이름이 David인 사람의 이름과 금액만 조회하기 
SELECT FIRST_name, salary 
FROM employees
WHERE first_name = 'David'; 
-- sql은 기본적으로 대소문자를 구분하지 않지만 값(데이터)으로 들어갈 때는 대소문자를 구분한다 !!

-- (4) 논리 연산자 (AND, OR, NOT)
-- 피연산자 자리에 조건이 온다 
-- 여러개의 조건을 연결할 때 사용한다 

-- employees 테이블에서 부서가 영업부서(80)이면서 급여가 10000 이상인 직원들의 
-- 이름, 성, 급여, 부서ID를 급여 오름차순으로 조회 
SELECT first_name 이름, last_name 성, salary 급여, department_id 부서ID
FROM EMPLOYEES
WHERE department_id = 80 AND salary >= 10000
ORDER BY salary;
-- 34행

/*
 * employees 테이블에서 직원의 이름이 Peter인 사람 중에
 * 급여가 5000 이상인 직원들만 email 내림차순으로 조회 
 * 컬럼 전체조회 
 * */
SELECT email "이메일"
FROM employees
WHERE first_name = 'Peter' AND salary >= 5000
ORDER BY email desc;

-- 테이블 : *
-- 조건1 : first_name = 'Peter'
-- 조건2 : salary >= 5000
-- 정렬 기준 : email DESC 
SELECT first_name 
FROM employees 
WHERE first_name = 'Peter' AND salary >= 5000
ORDER BY email DESC;

/*
 * 실습1. 급여가 5000이상이고 직무ID가 SA_MAN인 직원 조회
 * 		직원의 이름과 성은 이름이라는 별칭으로 연결해서 출력하되 급여기준으로 오름차순 정렬되도록 
 * 
 * 실습2. 부서ID가 60이거나 급여가 4000이하인 직원 조회 
 * 		직원의 이름, 전화번호, 입사일을 출력하되 입사일 기준으로 내림차순 정렬되도록
 * 
 * 실습3. manager_id가 존재하지 않는 직원들을 조회 
 * 		직원의 이름과 성은 직원명이라는 별칭으로 연결해서 출력
 * */

-- 실습1. 
-- 조회할 칼럼 : fist_name과 last_name 연결해서 이름, salary 급여 
-- 테이블 : employees 
-- 조건1 : 급여가 5000 이상
-- 조건2 : 직무가 SA_MAN
-- 정렬 기준 : 급여 오름차순 
SELECT first_name || ' ' || last_name 이름, salary 급여
FROM employees
WHERE salary >= 5000 AND job_id = 'SA_MAN'
ORDER BY 급여;

-- 실습2. 
-- 조회할 칼럼 : first_name과 last_name 연결해서 이름, phone_number 전화번호, hire_date 입사일 
-- 테이블 : employees
-- 조건1 : 부서ID가 60
-- 조건2 : 급여가 4000 이하 
-- 정렬 기준 : 입사일 내림차순 
SELECT first_name || ' ' || last_name 이름, phone_number 전화번호, hire_date 입사일
FROM employees
WHERE DEPARTMENT_ID = 60 or SALARY <= 4000
ORDER BY 입사일 DESC; 

-- 실습3. 
-- 조회할 칼럼 : first_name과 last_name 연결해서 직원명 
-- 테이블 : employees 
-- 조건1 : manager_id가 없음 
SELECT first_name || ' ' || last_name 직원명 
FROM employees
WHERE manager_id IS NULL;

-- NULL : 값이 없음을 나타내는 값 
-- NULL은 관계연산자로 연산이 불가능하다 
-- NULL 연산자를 사용한다 IS NULL, IS NOT NULL  
SELECT FIRST_name || ' ' || last_name 직원명 
FROM employees 
where manager_id IS NULL;

-- (5) SQL 연산자 
-- BETWEEN a AND b : a이상 b이하인 조건 => 범위내에 포함되면 참 

-- employees 테이블에서 salary가 10000 이상 12000 이하인 직원의 
-- first_name, last_name, salary를 salary 오름차순으로 조회 

SELECT first_name, 
	last_name,
	salary
FROM employees
WHERE salary BETWEEN 10000 AND 12000
ORDER BY salary;
-- 결과 : 11행 

-- IN(a, b, c) : a 혹은 b 혹은 c인 조건 => a, b, c 중 하나라도 포함되면 참 

SELECT first_name, last_name, salary 
FROM employees
WHERE salary in(10000, 11000, 12000)
ORDER BY salary;
-- 결과 : 8행 

-- LIKE : 문자조건, 패턴을 만들 때 사용한다 
-- % : ~아무거나 _ : 자리수 
SELECT first_name FROM employees;

SELECT first_name 
FROM employees
--WHERE first_name LIKE '%n'; --first_name이 n으로 끝나는 직원 조회 
--WHERE first_name LIKE 'K%'; --first_name이 K로 시작하는 직원 조회 
--WHERE first_name LIKE '%en%'; --first_name에 en이 포함되는 직원 조회 
--WHERE FIRST_name LIKE '%e%n%'; --first_name에 e와 n을 포함하는 직원 조회
--WHERE first_name LIKE '%e_n%'; --first_name에 e와 n 사이에 한글자 더 있는 직원 조회 
WHERE first_name LIKE '____e';

-- NULL : 데이터가 없음을 나타내는 값
-- NULL은 연산하면 결과가 NULL이다 
SELECT NULL + 10, NULL * 10, NULL - 10, NULL / null
FROM dual;


