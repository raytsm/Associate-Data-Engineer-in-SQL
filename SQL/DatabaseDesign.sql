SELECT SUM(quantity) FROM fact_booksales
-- Join to get city
INNER JOIN dim_store_star on fact_booksales.store_id = dim_store_star.store_id
-- Join to get author
INNER JOIN dim_book_star on fact_booksales.book_id = dim_book_star.book_id
-- Join to get year and quarter
INNER JOIN dim_time_star on fact_booksales.time_id = dim_time_star.time_id
WHERE
    dim_book_star.city = 'Vancouver' AND dim_book_star.author = 'Octavia E. Butler' AND 
    dim_time_star.year = 2018 AND dim_time_star.quarter = 4;

SELECT
    SUM(fact_booksales.quantity)
FROM 
    fact_booksales
    -- Join to get city
    INNER JOIN dim_store_sf ON fact_booksales.store_id = dim_store_sf.store_id
    INNER JOIN dim_city_sf ON dim_store_sf.city_id = dim_city_sf.city_id
    -- Join to get author
    INNER JOIN dim_book_sf ON fact_booksales.book_id = dim_book_sf.book_id
    INNER JOIN dim_author_sf ON dim_book_sf.author_id = dim_author_sf.author_id
    -- Join to get year and quarter
    INNER JOIN dim_time_sf ON fact_booksales.time_id = dim_time_sf.time_id
    INNER JOIN dim_month_sf ON dim_time_sf.month_id = dim_month_sf.month_id
    INNER JOIN dim_quarter_sf ON dim_month_sf.quarter_id = dim_quarter_sf.quarter_id
    INNER JOIN dim_year_sf ON dim_quarter_sf.year_id = dim_year_sf.year_id
WHERE
    dim_city_sf.city = 'Vancouver'
    AND
    dim_author_sf.author = 'Octavia E. Butler'
    AND
    dim_year_sf.year = 2018 AND dim_quarter_sf.quarter = 4;

CREATE VIEW view_name AS 
SELECT col1, col2
FROM table_name
WHERE condition;

CREATE VIEW scifi_books AS
SELECT title, author, genre
FROM dim_book_sf
JOIN dim_genre_sf ON dim_genre_sf.genre_id = dim_book_sf.genre_id
JOIN dim_author_sf ON dim_author_sf.author_id = dim_book_sf.author_id
WHERE dim_genre_sf.genre = 'science fiction';

SELECT * FROM scifi_books;

SELECT * FROM
(SELECT title, author, genre
FROM dim_book_sf
JOIN dim_genre_sf ON dim_genre_sf.genre_id = dim_book_sf.genre_id
JOIN dim_author_sf ON dim_author_sf.author_id = dim_book_sf.author_id
WHERE dim_genre_sf.genre = 'science fiction');

SELECT * FROM INFORMATION_SCHEMA.views;

SELECT * FROM information_schema.views
WHERE table_schema NOT IN ('pg_catalog', 'information_schema');

GRANT UPDATE ON ratings TO PUBLIC;

REVOKE INSERT ON films FROM db_user;

UPDATE films SET kind = 'Dramatic' WHERE kind = 'Drama';

INSERT INTO films (code, title, did, date_prod, kind)
    VALUES ('T_601', 'Yojimbo', 106, '1961-06-16', 'Drama');

DROP VIEW view_name [ CASCADE | RESTRICT ];

CREATE OR REPLACE VIEW view_name AS new_query

ALTER VIEW [ IF EXISTS ] name ALTER [ COLUMN ] column_name SET DEFAULT expression
ALTER VIEW [ IF EXISTS ] name ALTER [ COLUMN ] column_name DROP DEFAULT
ALTER VIEW [ IF EXISTS ] name OWNER TO new_owner
ALTER VIEW [ IF EXISTS ] name RENAME TO new_name
ALTER VIEW [ IF EXISTS ] name SET SCHEMA new_schema
ALTER VIEW [ IF EXISTS ] name SET ( view_option_name [= view_option_value] [, ...])
ALTER VIEW [ IF EXISTS ] name RESET ( view_option_name [, ...])

CREATE MATERIALIZED VIEW my_mv AS SELECT * FROM existing_table;

REFRESH MATERIALIZED VIEW my_mv; -- use cron jobs in postgres

CREATE ROLE data_analyst;

CREATE ROLE alex WITH PASSWORD 'PasswordForIntern' VALID UNTIL '2020-01-01';

CREATE ROLE admin CREATEDB;

ALTER ROLE admin CREATEROLE;

GRANT UPDATE ON ratings TO data_analyst;

REVOKE UPDATE ON ratings FROM data_analyst;

GRANT data_analyst TO alex;

REVOKE data_analyst FROM alex;