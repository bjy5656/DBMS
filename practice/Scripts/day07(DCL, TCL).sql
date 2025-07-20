-- 3번 : DCL

SELECT * FROM test;

INSERT INTO test
--values(1);
--values(2);
values(3);

DELETE FROM test
WHERE id = 3;

TRUNCATE TABLE test;

COMMIT;

ROLLBACK;