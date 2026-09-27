-- Section 3: Resolution Time Analysis
-- Q: Outlier incidents (longest resolution times) and what they have in common

SELECT
  Number, category, priority, assignment_group, reassignment_count, opened_at,
  resolved_at,
  TIMESTAMP_DIFF(resolved_at, opened_at, HOUR) AS resolution_hours
FROM `Incident.incident_latest_snapshot`
WHERE resolved_at IS NOT NULL
ORDER BY resolution_hours DESC
LIMIT 20;
