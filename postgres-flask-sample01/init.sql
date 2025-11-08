CREATE TABLE IF NOT EXISTS name_table (
    column1 TEXT,
    column2 TEXT,
    column3 TEXT,
    column4 TEXT,
    column5 TEXT,
    column6 TEXT
);

COPY name_table (column1, column2, column3, column4, column5, column6)
FROM '/docker-entrypoint-initdb.d/name.csv'
DELIMITER ','
CSV HEADER;

