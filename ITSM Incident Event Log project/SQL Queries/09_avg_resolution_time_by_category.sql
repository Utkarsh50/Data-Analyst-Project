-- Section 3: Resolution Time Analysis
-- Q: Average resolution time by category

SELECT
  category,
  COUNT(*) AS total_incidents,
  ROUND(AVG(TIMESTAMP_DIFF(resolved_at, opened_at, HOUR)), 2) AS avg_resolution_hours
FROM `Incident.incident_latest_snapshot`
WHERE resolved_at IS NOT NULL
GROUP BY category
ORDER BY avg_resolution_hours DESC;
