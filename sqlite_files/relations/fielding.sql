CREATE TABLE fielding(
    playerID TEXT,
    yearID TEXT,
    stint INT,
    teamID TEXT,
    lgID TEXT,
    POS INT,
    G INT,
    GS INT,
    InnOuts INT,
    PO INT,
    A INT,
    E INT,
    DP INT,
    PB INT,
    WP INt,
    SB INT,
    CS INT,
    ZR INT
);

.mode csv

.import "lahman/Fielding.csv" fielding

CREATE INDEX fielding_playerID ON fielding (playerID);
CREATE INDEX fielding_uniqueID ON fielding (playerID, yearID);
CREATE INDEX fielding_yearID ON fielding (yearID);
