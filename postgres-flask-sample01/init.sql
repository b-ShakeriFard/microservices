CREATE TABLE IF NOT EXISTS people (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age TEXT,
    education TEXT,
    employment TEXT,
    ownership_car TEXT,
    ownership_real_estate TEXT
);

COPY people (name, age, education, employment, ownership_car, ownership_real_estate)
FROM '/docker-entrypoint-initdb.d/name.csv'
DELIMITER ','
CSV HEADER;

