-- Regional performance: use a bar chart or table.
SELECT
    l.region,
    SUM(s.views) AS views,
    SUM(s.contacts) AS contacts,
    ROUND(100.0 * SUM(s.contacts) / NULLIF(SUM(s.views), 0), 2) AS contact_conversion_pct
FROM listing_daily_stats s
JOIN listings l USING (listing_id)
WHERE s.event_date BETWEEN '2025-05-01' AND '2025-05-31'
GROUP BY l.region
ORDER BY views DESC;
