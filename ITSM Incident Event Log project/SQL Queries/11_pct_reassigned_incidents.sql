-- Section 4: Reassignment & Reopen Patterns
-- Q: % of incidents reassigned at least once + average reassignment_count

SELECT
  COUNT(*) AS total_incidents,
  COUNTIF(reassignment_count > 0) AS reassigned_incidents,
  ROUND(COUNTIF(reassignment_count > 0) * 100.0 / COUNT(*), 2) AS pct_reassigned,
  ROUND(AVG(reassignment_count), 2) AS avg_reassignment_count
FROM `Incident.incident_latest_snapshot`;
