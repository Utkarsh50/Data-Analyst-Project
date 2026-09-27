-- Section 1: Incident Volume & Trends
-- Q: Incidents opened per month

SELECT
  EXTRACT(YEAR FROM opened_at) AS Year,
  EXTRACT(MONTH FROM opened_at) AS Month,
  COUNT(*) AS incident_count
FROM `Incident.incident_latest_snapshot`
GROUP BY Year, Month
ORDER BY 1, 2;
