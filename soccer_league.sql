-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS soccer_league_db;  

CREATE DATABASE soccer_league_db; 

\c soccer_league_db

CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    team_name VARCHAR(255) NOT NULL,
    team_city VARCHAR(255) NOT NULL
);

CREATE TABLE referees (
    referee_id SERIAL PRIMARY KEY,
    referee_name TEXT NOT NULL
);

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    birthday DATE, 
    height INT, 
    current_team INT,
    FOREIGN KEY (current_team) REFERENCES teams(team_id)
);

CREATE TABLE seasons (
    season_id SERIAL PRIMARY KEY, 
    start_date DATE NOT NULL, 
    end_date DATE NOT NULL
);

CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY, 
    home_team_id INT NOT NULL,
    away_team_id INT NOT NULL, 
    season_id INT NOT NULL, 
    referee_id INT NOT NULL,
    FOREIGN KEY (home_team_id) REFERENCES teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES teams(team_id),
    FOREIGN KEY (season_id) REFERENCES seasons(season_id), 
    FOREIGN KEY (referee_id) REFERENCES referees(referee_id)
);

CREATE TABLE goals (
    goal_id SERIAL PRIMARY KEY, 
    player_id INT NOT NULL, 
    match_id INT NOT NULL, 
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (match_id) REFERENCES matches(match_id)
);


CREATE TABLE results (
    result_id SERIAL PRIMARY KEY, 
    team_id INT NOT NULL,
    match_id INT NOT NULL,
    result VARCHAR(255) NOT NULL,
    FOREIGN KEY (team_id) REFERENCES teams(team_id),
    FOREIGN KEY (match_id) REFERENCES matches(match_id)
);


INSERT INTO teams (team_name, team_city) VALUES
('FC Barcelona', 'Barcelona'),
('Real Madrid', 'Madrid'),
('Manchester United', 'Manchester'),
('Liverpool FC', 'Liverpool');


INSERT INTO referees (referee_name) VALUES
('Mark Clattenburg'),
('Howard Webb'),
('Pierluigi Collina'),
('Felix Brych');


INSERT INTO players (first_name, last_name, birthday, height, current_team) VALUES
('Lionel', 'Messi', '1987-06-24', 170, 1),
('Cristiano', 'Ronaldo', '1985-02-05', 187, 2),
('Paul', 'Pogba', '1993-03-15', 191, 3),
('Mohamed', 'Salah', '1992-06-15', 175, 4);


INSERT INTO seasons (start_date, end_date) VALUES
('2023-08-01', '2024-05-31');


INSERT INTO matches (home_team_id, away_team_id, season_id, referee_id) VALUES
(1, 2, 1, 1),
(3, 4, 1, 2);


INSERT INTO goals (player_id, match_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2);


INSERT INTO results (team_id, match_id, result) VALUES
(1, 1, 'Win'),
(2, 1, 'Loss'),
(3, 2, 'Draw'),
(4, 2, 'Draw');