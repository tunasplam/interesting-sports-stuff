/*
Reference for the batting table.
*/

create table batting(
    playerID TEXT,
    yearID INT,
    stint INT,
    teamID TEXT,
    lgID TEXT,
    G INT,
    G_batting INT,
    AB INT,
    R INT,
    H INT,
    "2B" INT,
    "3B" INT,
    HR INT,
    RBI INT,
    SB INT,
    CS INT,
    BB INT,
    SO INT,
    IBB INT,
    HBP INT,
    SH INT,
    SF INT,
    GIDP INT,
    G_old INT
);

.mode csv

.import "lahman/Batting.csv" batting

CREATE INDEX batting_playerID ON batting (playerID);
CREATE INDEX batting_uniqueID ON batting (playerID, yearID);
CREATE INDEX batting_yearID ON batting (yearID);

-- tabulate PAs
ALTER TABLE batting ADD COLUMN PA INT;

UPDATE batting AS b SET PA = (
    SELECT AB + BB + HBP + SH + SF + IBB
);
