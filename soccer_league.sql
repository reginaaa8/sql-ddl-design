DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY, 
    name TEXT
);

CREATE TABLE season
(
    id SERIAL PRIMARY KEY, 
    start_date TEXT NOT NULL, 
    end_date TEXT NOT NULL
);

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams(id)
);

CREATE TABLE games 
(
    id SERIAL PRIMARY KEY, 
    team_1 INTEGER REFERENCES teams(id),
    team_2 INTEGER REFERENCES teams(id),
    referee_id INTEGER REFERENCES referees(id)
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY, 
    game_id INTEGER REFERENCES games(id),
    player_id INTEGER REFERENCES players(id)
);