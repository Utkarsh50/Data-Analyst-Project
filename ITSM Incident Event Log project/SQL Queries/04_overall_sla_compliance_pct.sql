-- Section 2: SLA Compliance
-- Q: Overall SLA compliance %

SELECT
  COUNTIF(made_sla = TRUE) AS sla_met,
  COUNTIF(made_sla = FALSE) AS sla_breached,
  ROUND(COUNTIF(made_sla = TRUE) * 100.0 / COUNT(*), 2) AS sla_compliance_pct
FROM `Incident.incident_latest_snapshot`;
