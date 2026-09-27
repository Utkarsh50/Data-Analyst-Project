-- Section 4: Reassignment & Reopen Patterns
-- Q: % of incidents reopened

SELECT
  COUNT(*) AS total_incidents,
  COUNTIF(reopen_count > 0) AS reopened_incidents,
  ROUND(COUNTIF(reopen_count > 0) * 100.0 / COUNT(*), 2) AS pct_reopened
FROM `Incident.incident_latest_snapshot`;
