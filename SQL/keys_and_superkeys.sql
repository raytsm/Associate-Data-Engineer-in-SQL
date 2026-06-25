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

-- Designate composite key as primary key
CREATE TABLE example (
    a integer,
    b integer,
    c integer,
    PRIMARY KEY (a, c)
);

ALTER TABLE table_name
ADD CONSTRAINT some_name PRIMARY KEY (column_name)

ALTER TABLE car 
ADD COLUMN id serial PRIMARY KEY;

ALTER TABLE table_name
ADD COLUMN column_c varchar(256);

UPDATE TABLE table_name
SET column_c = CONCAT(column_a, column_b);

ALTER TABLE table_name
ADD CONSTRAINT pk PRIMARY KEY (column_c);

CREATE TABLE manufacturers (
    name varchar(255) PRIMARY KEY
);

INSERT INTO manufacturers
VALUES ('Ford'), ('VW'), ('GM')

CREATE TABLE cars (
    model varchar(255) PRIMARY KEY,
    manufacturer_name varchar(255) REFERENCES manufacturers (name) -- or separate column and relatinoship definition as manufacturer_name varchar(255), FOREIGN KEY (manufacturer_name) REFERENCES manufacturers (name)
);

INSERT INTO cars
VALUES ('Ranger', 'Ford'), ('Beetle', 'VW');

--Throws an error!
INSERT INTO cars
VALUES ('Tundra', 'Toyota');

ALTER TABLE a
ADD CONSTRAINT a_fkey FOREIGN KEY (b_id) REFERENCES b (id);

CREATE TABLE affiliations (
    professor_id integer REFERENCES professors (id),
    organization_id varchar(256) REFERENCES organizations (id),
    function varchar(256)
)

CREATE TABLE a (
    id integer PRIMARY KEY,
    column_a varchar(64),
    ...,
    b_id integer REFERENCES b (id) ON DELETE NO ACTION
)

CREATE TABLE a (
    id integer PRIMARY KEY,
    column_a varchar(64),
    ...,
    b_id integer REFERENCES b (id) ON DELETE CASCADE
)

--Identify the correct constraint name
SELECT constraint_name, table_name, constraint_type
FROM information_schema.table_constraints
WHERE constraint_type = 'FOREIGN KEY';

--Drop the right foreign key constraint
ALTER TABLE affiliations
DROP CONSTRAINT constraint_name;