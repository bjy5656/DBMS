-- 4번 : 연산자 실습 

/* 이름은 이름과 성을 띄어쓰기 포함하여 연결 
 * 
 * [연습] 모든 직원의 이름, 급여, 연봉이라는 이름으로 출력하기 
 * 
 */
SELECT * FROM employees; 
SELECT first_name || ' ' || last_name 이름, 
	salary 급여, 
	salary * 12 연봉 
FROM employees;

/*1. 모든 직원의 이름, 급여, 커미션, 커미션을 포함한 연봉을 총 보상이라는 이름으로 출력
 * 단, 커미션이 NULL인 경우 0으로 처리할 것 
 * 
 * 2. 직원번호의 이메일을 연결해서 직원번호_이메일이라는 별칭으로 출력
 * 조회할 칼럼명 : 직원번호, 이메일, 급여
 * 
 * 3. 급여가 7000 초과인 직원의 이름과 급여 출력하기 
 * 
 * 4. 부서번호가 50 또는 80번이 아닌 직원들만 출력하기 
 * 
 * 5. 급여가 4000이상 7500 이하인 직원들 조회하기 
 * 기본 조회할 칼럼명 : 직원번호, 이름, 급여, 입사일
 * 
 * 6. 직무ID가 IT_PROG, SA_REP, SA_MAN인 직원만 조회하기 
 * 
 * 7. 커미션을 받는 직원만 조회하기 
 * 
 * 8. 이름에 D와 e가 포함되는 직원들만 조회하기 
 * 
 * 9. 직무ID가 IP_PROG가 아닌 직원만 조회하기 
 * */

SELECT * FROM employees;
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

--* 기본 조회할 컬럼명 : 직원번호, 이름, 급여, 입사일
-- *1. 모든 직원의 이름, 급여, 커미션, 커미션을 포함한 연봉을 총 보상이라는 이름으로 출력
-- * 단, 커미션이 NULL인 경우 0으로 처리할 것 
-- 조회할 칼럼 : 이름, salary, nvl(commission_pct, 0), commission_pct * salary * 12 총보상
-- 테이블 : employees
-- 조건1 : 
-- 조건2 : 
-- 정렬 기준 : 
SELECT first_name || ' ' || last_name 이름, 
	salary 급여, 
	nvl(commission_pct, 0) 커미션, 
	salary * 12 *(1 +  nvl(commission_pct, 0)) "총 보상"
FROM employees;

-- * 2. 직원번호의 이메일을 연결해서 직원번호_이메일이라는 별칭으로 출력
-- 조회할 칼럼 : employee_id와 email 연결해서 직원번호_이메일
-- 테이블 : employees
-- 조건1 : 
-- 조건2 : 
-- 정렬 기준 : 
SELECT employee_id || '_' || email 직원번호_이메일
FROM employees;

--3. 급여가 7000 초과인 직원의 이름과 급여 출력하기
-- 조회할 칼럼 : 이름, salary 급여
-- 테이블 : employees
-- 조건1 : salary 7000 초과 
-- 조건2 : 
-- 정렬 기준 : 
SELECT first_name || ' ' || last_name 이름,
	salary 급여 
FROM EMPLOYEES 
WHERE salary > 7000;

--4. 부서번호가 50 또는 80번이 아닌 직원들만 출력하기
-- 조회할 칼럼 : employee_id 직원번호, 이름, salary 급여, hire_date 입사일 
-- 테이블 : employees
-- 조건1 : department_id not in(50, 80)
-- 조건2 : 
-- 정렬 기준 : 
SELECT employee_id 직원번호, 
	first_name || ' ' || last_name 이름,
	salary 급여, 
	hire_date 입사일 
FROM employees
WHERE DEPARTMENT_ID NOT in(50, 80);

--* 5. 급여가 4000이상 7500이하인 직원들 조회하기
--* 기본 조회할 컬럼명 : 직원번호, 이름, 급여, 입사일
-- 조회할 칼럼 : 직원번호, 이름, 급여, 입사일
-- 테이블 : employees
-- 조건1 : salary 4000 이상 and 7500 이하
-- 조건2 : 
-- 정렬 기준 : 
 SELECT employee_id 직원번호, 
	first_name || ' ' || last_name 이름,
	salary 급여,
	hire_date 입사일 
FROM employees
WHERE salary >= 4000 AND salary <= 7500;

--* 6. 직무ID가 IT_PROG, SA_REP, SA_MAN인 직원만 조회하기
-- 조회할 칼럼 : 직원번호, 이름, 급여, 입사일
-- 테이블 : employees
-- 조건1 : job_id in(IT_PROG, SA_REP, SA_MAN)
-- 조건2 : 
-- 정렬 기준 : 
SELECT employee_id 직원번호, 
	first_name || ' ' || last_name 이름,
	salary 급여,
	hire_date 입사일 
FROM employees  
WHERE job_id in('IT_PROG', 'SA_REP', 'SA_MAN');

--* 7. 커미션을 받는 직원만 조회하기
-- 조회할 칼럼 : employee_id 직원번호, 이름, salary 급여, hire_date 입사일
-- 테이블 : employees
-- 조건1 : commission_pct가 null이 아니다. 
-- 조건2 : 
-- 정렬 기준 : 
SELECT employee_id 직원번호, 
	first_name || ' ' || last_name 이름,
	salary 급여,
	hire_date 입사일 
FROM employees
WHERE commission_pct IS NOT NULL;

--* 8. 이름에 D와 e가 포함되는 직원들만 조회하기
-- 조회할 칼럼 : 직원번호, 이름, 급여, 입사일
-- 테이블 : employees
-- 조건1 : 이름 like '%D%' and 이름 like '%e%'
-- 조건2 : 
-- 정렬 기준 : 
SELECT employee_id 직원번호, 
	first_name || ' ' || last_name 이름,
	salary 급여,
	hire_date 입사일 
FROM employees
WHERE first_name || ' ' || last_name LIKE '%D%' AND first_name || ' ' || last_name LIKE '%e%';

--* 9. 직무ID가 IT_PROG가 아닌 직원만 조회하기
-- 조회할 칼럼 : 직원번호, 이름, 급여, 입사일
-- 테이블 : employees
-- 조건1 : job_id != IT_PROG
-- 조건2 : 
-- 정렬 기준 : 
SELECT employee_id 직원번호, 
	first_name || ' ' || last_name 이름,
	salary 급여,
	hire_date 입사일 
FROM employees
WHERE job_id != 'IT_PROG';