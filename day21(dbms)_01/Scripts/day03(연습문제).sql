/*	EMPLOYEE_ID	직원ID
	FIRST_NAME 	이름
	LAST_NAME 	성
	EMAIL 		이메일
	PHONE_NUMBER	전화번호 
	HIRE_DATE	입사일 
	JOB_ID		직무 ID
	SALARY 		급여 
	COMMISSION_PCT	커미션 비율 
	MANAGER_ID	상사직원의 ID
	DEPARTMENT_ID	부서 ID 	*/

-- 조회할 칼럼 : 
-- 테이블 : 
-- 조건1 : 
-- 조건2 : 
-- 정렬 기준 :

-- 1. 직원들 중 봉급이 5000 이상인 직원들의 모든 정보 조회하기
SELECT * 
FROM employees
where salary >= 5000;

-- 2. 직원들 중 부서번호가 30번인 직원들의 이름과 입사일 조회하기
SELECT first_name || ' ' || last_name 이름, hire_date 입사일 
FROM EMPLOYEES 
WHERE department_id = 30;

-- 3. 직원들 중 성이 Smith인 직원들의 이름과 봉급 조회하기
SELECT first_name || ' ' || last_name 이름, salary 봉급 
FROM employees
WHERE last_name = 'Smith';

-- 4. 직원들 중 봉급이 3000미만이거나 10000이상인 직원들의 이름과 봉급 조회하기
SELECT first_name || ' ' || last_name 이름, salary 봉급 
FROM employees 
WHERE salary < 3000 OR salary >= 10000;

-- 5. 직원들 중 이름이 A로 시작하는 직원들의 이름과 성을 직원명으로, 이메일을 koreait.com을 붙여서 이메일이라는 별칭으로 출력하기
SELECT first_name || ' ' || last_name 직원명, email || '@koreait.com' 이메일 
FROM employees
WHERE first_name LIKE 'A%';

-- 6. 직원들 중 성에 o가 포함되고 이름이 4글자인 직원들의 이름과 성, 부서번호 조회하기
SELECT first_name 이름, last_name 성, department_id 부서번호 
FROM employees 
WHERE last_name LIKE '%o%' AND first_name LIKE '____';

SELECT first_name 이름, last_name 성, department_id 부서번호 
FROM employees 
WHERE last_name LIKE '%o%' AND LENGTH(first_name) = 4;

-- 7. 직원들 중 이름이 J로 시작하고 성이 n로 끝나는 직원들의 이름과 성 조회하기
SELECT first_name 이름, last_name 성
FROM employees 
WHERE FIRST_name LIKE 'J%' AND last_name LIKE '%n';
