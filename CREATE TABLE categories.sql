CREATE TABLE categories
(category_code varchar PRIMARY KEY,
category varchar);
CREATE TABLE businesses
(id integer PRIMARY KEY,
business varchar,
year_founded integer,
category_code varchar,
country_code char(3));
CREATE TABLE countries
(country_code varchar PRIMARY KEY,
country varchar,
continent varchar);
/*GEOG655, Haogang Ji, April 5th, 2022. */
