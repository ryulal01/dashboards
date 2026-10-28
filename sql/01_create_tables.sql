-- Avito Analytics Dashboard: schema for PostgreSQL
CREATE TABLE IF NOT EXISTS listings (
    listing_id      INTEGER PRIMARY KEY,
    title           TEXT NOT NULL,
    category        TEXT NOT NULL,
    region          TEXT NOT NULL,
    price_rub       NUMERIC(12, 2),
    published_date  DATE,
    status          TEXT NOT NULL CHECK (status IN ('active', 'closed'))
);

CREATE TABLE IF NOT EXISTS listing_daily_stats (
    listing_id  INTEGER NOT NULL REFERENCES listings(listing_id),
    event_date  DATE NOT NULL,
    views       INTEGER NOT NULL CHECK (views >= 0),
    contacts    INTEGER NOT NULL CHECK (contacts >= 0),
    responses   INTEGER NOT NULL CHECK (responses >= 0),
    PRIMARY KEY (listing_id, event_date),
    CHECK (contacts <= views)
);

CREATE INDEX IF NOT EXISTS idx_stats_event_date ON listing_daily_stats(event_date);
CREATE INDEX IF NOT EXISTS idx_listings_category ON listings(category);
CREATE INDEX IF NOT EXISTS idx_listings_region ON listings(region);
