SELECT COUNT(column_a, column_b, ...)
FROM table_name;

-- then compare the number of rows, if the number of Distinct row matches the total number of 
--rows then the column or combination of column can be used as keys

SELECT COUNT(DISTINCT(column_a, column_b, ...))
FROM table_name;

CREATE TABLE products (
    product_no integer UNIQUE NOT NULL, -- same constraint as of Primary Key
    name text,
    price numberic
);

CREATE TABLE products (
    product_no integer PRIMARY KEY,
    name text,
    price numberic
);

-- Designmate composite key as primary key
CREATE TABLE example (
    a integer,
    b integer,
    c integer,
    PRIMARY KEY (a, c)
);

ALTER TABLE table_name
ADD CONSTRAINT some_name PRIMARY KEY (column_name)