-- Section 4: Reassignment & Reopen Patterns
-- Q: Reopen rate by category (where's it worst)

SELECT
  category,
  COUNT(*) AS total_incidents,
  COUNTIF(reopen_count > 0) AS reopened_incidents,
  ROUND(COUNTIF(reopen_count > 0) * 100.0 / COUNT(*), 2) AS reopen_rate_pct
FROM `Incident.incident_latest_snapshot`
GROUP BY category
HAVING COUNT(*) >= 30
ORDER BY reopen_rate_pct DESC;
