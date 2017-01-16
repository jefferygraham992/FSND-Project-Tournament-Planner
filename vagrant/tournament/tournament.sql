DROP DATABASE tournament;
CREATE DATABASE tournament;
\c tournament;
-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- players table
CREATE TABLE players (id SERIAL PRIMARY KEY,
                                     name TEXT);


-- matches table
CREATE TABLE matches (id SERIAL PRIMARY KEY,
                                       winner INT REFERENCES players (id) ON DELETE CASCADE,
                                       loser INT REFERENCES players (id) ON DELETE CASCADE);

-- wins view
CREATE VIEW num_wins AS
            SELECT players.id, players.name, COUNT(matches.winner) as wins
            FROM players LEFT JOIN matches
            ON players.id = matches.winner
            GROUP BY players.id, players.name
            ORDER BY wins DESC;

-- losses view
CREATE VIEW num_losses AS
            SELECT players.id, players.name, COUNT(matches.loser) as losses
            FROM players LEFT JOIN matches
            ON players.id = matches.loser
            GROUP BY players.id, players.name
            ORDER BY losses;

-- view for creating the standings
CREATE VIEW standings AS
            SELECT num_wins.id, num_wins.name, num_wins.wins, num_wins.wins + num_losses.losses as matches
            FROM num_losses JOIN num_wins
            ON num_losses.id = num_wins.id
            ORDER BY num_wins.wins DESC, num_wins.id ASC;

-- views for creating swiss pairings
CREATE VIEW evens AS
            SELECT rnum, id, name
            FROM
            (SELECT *, row_number() over (ORDER BY standings.wins DESC) AS rnum FROM standings) AS q WHERE mod(rnum, 2) = 0;

CREATE VIEW odds AS
            SELECT rnum, id, name
            FROM
            (SELECT *, row_number() over (ORDER BY standings.wins DESC) AS rnum FROM standings) AS q WHERE mod(rnum, 2) != 0;









