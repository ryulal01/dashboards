-- Daily dynamics: use a line chart in Redash.
SELECT
    s.event_date,
    SUM(s.views) AS views,
    SUM(s.contacts) AS contacts,
    SUM(s.responses) AS responses,
    ROUND(100.0 * SUM(s.contacts) / NULLIF(SUM(s.views), 0), 2) AS contact_conversion_pct
FROM listing_daily_stats s
WHERE s.event_date BETWEEN '2025-05-01' AND '2025-05-31'
GROUP BY s.event_date
ORDER BY s.event_date;
