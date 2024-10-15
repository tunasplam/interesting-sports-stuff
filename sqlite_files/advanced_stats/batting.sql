/*
Calculations of advanced batting metrics (anything that requires joins to other
tables) will be stashed here.
*/

-- determine wOBA
ALTER TABLE batting ADD COLUMN wOBA NUMERIC;

UPDATE batting AS b SET wOBA = (
    SELECT
        (c.wBB * b.BB + c.wHBP * b.HBP + c."w1B" * (b.H - (b."2B" + b."3B" + b.HR)) + c."w2B" * b."2B" + c."w3B" * b."3B" + c.wHR * b.HR)/(b.AB + b.BB - b.IBB + b.SF + b.HBP) AS wOBA

    FROM fg_constants AS c
    WHERE b.yearID = c.Season
);

-- determine oRAA
ALTER TABLE batting ADD COLUMN oRAA NUMERIC;

UPDATE batting AS b SET oRAA = (
    SELECT
        (b.wOBA - c.wOBA) / c.wOBAScale * b.PA

    FROM fg_constants AS c
    WHERE b.yearID = c.Season
);

-- determine oRAR
ALTER TABLE batting ADD COLUMN oRAR NUMERIC;

-- determine runs_per_win for oRAR.
-- total runs scored in league / total wins in league
WITH runs_per_win_calcs AS (
    SELECT
        yearID,
        SUM(R) / SUM(CAST(W as NUMERIC)) AS runs_per_win
    FROM teams
    GROUP BY yearID
)

UPDATE batting AS b SET oRAR = (
    SELECT
        oRAA + runs_per_win
    FROM runs_per_win_calcs AS c
    WHERE b.yearID = c.yearID
);

-- oWAR
ALTER TABLE batting ADD COLUMN oWAR NUMERIC;

WITH runs_per_win_calcs AS (
    SELECT
        yearID,
        SUM(R) / SUM(CAST(W as NUMERIC)) AS runs_per_win
    FROM teams
    GROUP BY yearID
)
UPDATE batting AS b SET oWAR = (
    SELECT
        (b.wOBA - c.wOBA) / c.wOBAScale * b.PA / r.runs_per_win

    FROM fg_constants AS c
    JOIN runs_per_win_calcs AS r
        ON c.Season = r.yearID

    WHERE b.yearID = c.Season
);
