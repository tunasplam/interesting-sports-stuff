create table fg_constants(
    Season INT,
    "wOBA" NUMERIC,
    "wOBAScale" NUMERIC,
    "wBB" NUMERIC,
    "wHBP" NUMERIC,
    "w1B" NUMERIC,
    "w2B" NUMERIC,
    "w3B" NUMERIC,
    "wHR" NUMERIC,
    "runSB" NUMERIC,
    "runCS" NUMERIC,
    "R/PA" NUMERIC,
    "R/W" NUMERIC,
    "cFIP" NUMERIC
);

.mode csv

.import "fangraphs/fangraphs_constants_by_year.csv" fg_constants

CREATE INDEX fg_constants_season ON fg_constants (Season);
