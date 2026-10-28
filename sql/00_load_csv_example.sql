-- Run from psql after creating tables. Adjust paths to your local clone.
-- On Windows, use forward slashes in paths or the path syntax supported by psql.
\copy listings(listing_id, title, category, region, price_rub, published_date, status) FROM 'data/listings.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
\copy listing_daily_stats(listing_id, event_date, views, contacts, responses) FROM 'data/listing_daily_stats.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
