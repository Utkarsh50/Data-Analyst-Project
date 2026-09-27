-- Section 1: Incident Volume & Trends
-- Q: Top 5 categories by incident count

SELECT
  category,
  COUNT(*) AS Total_count
FROM `Incident.incident_latest_snapshot`
GROUP BY category
ORDER BY Total_count DESC
LIMIT 5;
