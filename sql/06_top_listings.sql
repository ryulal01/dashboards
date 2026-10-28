-- Top listings by views. Conversion is calculated from aggregated counts.
SELECT
    l.listing_id,
    l.title,
    l.category,
    l.region,
    SUM(s.views) AS views,
    SUM(s.contacts) AS contacts,
    SUM(s.responses) AS responses,
    ROUND(100.0 * SUM(s.contacts) / NULLIF(SUM(s.views), 0), 2) AS contact_conversion_pct
FROM listing_daily_stats s
JOIN listings l USING (listing_id)
WHERE s.event_date BETWEEN '2025-05-01' AND '2025-05-31'
GROUP BY l.listing_id, l.title, l.category, l.region
ORDER BY views DESC
LIMIT 10;
