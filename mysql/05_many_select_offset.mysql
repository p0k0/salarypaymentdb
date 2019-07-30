SELECT
  e.id,
  e.name,
  s.rate,
  s.kind,
  if (s.kind like 'monthly', s.rate, s.rate * 8.0 * 20.8) as p
    FROM employee e, salary s
      WHERE e.id = s.employee_id
        ORDER BY p DESC, e.name
LIMIT 8 OFFSET 0;