-- Section 2: SLA Compliance
-- Q: SLA breach rate by priority

SELECT
  priority,
  COUNT(*) AS total_incidents,
  COUNTIF(made_sla = FALSE) AS breached,
  ROUND(COUNTIF(made_sla = FALSE) * 100.0 / COUNT(*), 2) AS breach_rate_pct
FROM `Incident.incident_latest_snapshot`
GROUP BY priority
ORDER BY breach_rate_pct DESC;
