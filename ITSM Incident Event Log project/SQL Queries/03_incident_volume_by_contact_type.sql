-- Section 1: Incident Volume & Trends
-- Q: Incident volume by contact_type

SELECT
  contact_type,
  COUNT(*) AS Total_count
FROM `Incident.incident_latest_snapshot`
GROUP BY contact_type
ORDER BY Total_count DESC;
