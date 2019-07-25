DELETE FROM bookkeeping.salary_kind
  WHERE kind IN ('monthly', 'hourly');

INSERT INTO bookkeeping.salary_kind (kind)
    VALUES ('monthly');
INSERT INTO bookkeeping.salary_kind (kind)
    VALUES ('hourly');
COMMIT;