Duplicate payslips (same email, month, year)

This file contains SQL and steps to detect, inspect, and optionally deduplicate payslip rows, and how to add a DB-level unique constraint safely.

1) Find duplicate groups:

SELECT email, month, year, COUNT(*) cnt
FROM payslip
GROUP BY email, month, year
HAVING COUNT(*) > 1;

2) See all duplicate rows for a specific group (replace values):

SELECT * FROM payslip
WHERE email = 'user@example.com' AND month = 'January' AND year = '2025'
ORDER BY id;

3) Keep the latest row (highest id) and delete older duplicates for a specific group:

-- WARNING: run SELECT first to verify
DELETE FROM payslip
WHERE id IN (
  SELECT id FROM (
    SELECT id FROM payslip
    WHERE email = 'user@example.com' AND month = 'January' AND year = '2025'
    ORDER BY id ASC
    LIMIT 100 OFFSET 1
  ) x
);

4) Bulk dedupe: keep the row with the greatest id per (email,month,year)

-- This creates a temporary table of ids to delete, then deletes them.
CREATE TABLE tmp_delete_ids (id BIGINT PRIMARY KEY);

INSERT INTO tmp_delete_ids (id)
SELECT t.id FROM (
  SELECT id,
         ROW_NUMBER() OVER (PARTITION BY email, month, year ORDER BY id DESC) rn
  FROM payslip
) t
WHERE t.rn > 1;

DELETE FROM payslip WHERE id IN (SELECT id FROM tmp_delete_ids);
DROP TABLE tmp_delete_ids;

5) Add a DB unique constraint (only after deduplication)

ALTER TABLE payslip ADD CONSTRAINT uq_payslip_email_month_year UNIQUE (email, month, year);

6) Alternative: enforce uniqueness via application-level upsert (already added in controller):
   - The controller now checks for an existing payslip by email+month+year and updates it instead of inserting a new one.
   - For best results, also add the DB unique constraint above.

7) Notes:
   - Backup your DB before running any destructive SQL.
   - Test the dedupe on a copy of the database first.
   - Adjust SQL types/names if your table/column names differ (e.g., `pay_slip` vs `payslip`).

