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