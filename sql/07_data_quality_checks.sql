-- Run these checks after loading the CSV data.
-- Each query should return zero rows (or zero as the count).
SELECT listing_id, event_date
FROM listing_daily_stats
WHERE views < 0 OR contacts < 0 OR responses < 0 OR contacts > views;

SELECT listing_id, event_date, COUNT(*)
FROM listing_daily_stats
GROUP BY listing_id, event_date
HAVING COUNT(*) > 1;

SELECT s.listing_id
FROM listing_daily_stats s
LEFT JOIN listings l USING (listing_id)
WHERE l.listing_id IS NULL;
