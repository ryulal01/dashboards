-- KPI summary for the selected period.
-- In Redash, replace the fixed dates with dashboard parameters if desired.
SELECT
    SUM(s.views) AS total_views,
    SUM(s.contacts) AS total_contacts,
    SUM(s.responses) AS total_responses,
    COUNT(DISTINCT s.listing_id) AS listings_with_activity,
    ROUND(100.0 * SUM(s.contacts) / NULLIF(SUM(s.views), 0), 2) AS contact_conversion_pct,
    ROUND(100.0 * SUM(s.responses) / NULLIF(SUM(s.contacts), 0), 2) AS response_per_contact_pct
FROM listing_daily_stats s
WHERE s.event_date BETWEEN '2025-05-01' AND '2025-05-31';
