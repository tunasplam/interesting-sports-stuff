CREATE TABLE teams(
    yearID INT,
    lgID TEXT,
    teamID TEXT,
    franchID TEXT, 
    divID TEXT,
    Rank INT,
    G INT,
    Ghome INT,
    W INT,
    L INT,
    DivWin TEXT,
    WCWin TEXT,
    LgWin TEXT,
    WSWin TEXT,
    R INT,
    AB INT,
    H INT,
    "2B" INT,
    "3B" INT,
    HR INT,
    BB INT,
    SO INT,
    SB INT,
    CS INT,
    HBP INT, 
    SF INT,
    RA INT,
    ER INT,
    ERA NUMERIC,
    CG INT,
    SHO INT,
    SV INT,
    IPouts NUMERIC,
    HA NUMERIC,
    HRA NUMERIC,
    BBA NUMERIC,
    SOA NUMERIC,
    E INT,
    DP NUMERIC,
    FP NUMERIC,
    name TEXT,
    park TEXT,
    attendance INT,
    BPF TEXT,
    PPF TEXT,
    teamIDBR TEXT,
    teamIDlahman45 TEXT,
    teamIDretro TEXT
);

.mode csv

.import "lahman/Teams.csv" teams

CREATE INDEX fg_teams_yearID ON teams (yearID);
