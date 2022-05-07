
DROP TABLE IF EXISTS  location CASCADE;
CREATE TABLE location (
  id SERIAL PRIMARY KEY NOT NULL,
  court VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  province VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS teams CASCADE;
CREATE TABLE teams (
  id SERIAL PRIMARY KEY NOT NULL,
  location_id INTEGER REFERENCES location(id) ON DELETE CASCADE,
  team_name VARCHAR(255) NOT NULL,
  team_description VARCHAR(255) NOT NULL,
  avatar VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  team_id INTEGER REFERENCES teams(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  bio VARCHAR(255),
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  avatar VARCHAR(255),
  secret VARCHAR(255)
);

DROP TABLE IF EXISTS team_matches CASCADE; 
CREATE TABLE team_matches (
  id SERIAL PRIMARY KEY NOT NULL,
  date DATE NOT NULL,
  team1_id INTEGER REFERENCES teams(id) ON DELETE CASCADE,
  team2_id INTEGER REFERENCES teams(id) ON DELETE CASCADE,
  winner_id INTEGER REFERENCES teams(id) ON DELETE CASCADE,
  team1_score VARCHAR(255) NOT NULL,
  team2_score VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS player_matches CASCADE; 
CREATE TABLE player_matches (
  id SERIAL PRIMARY KEY NOT NULL,
  date DATE NOT NULL,
  player1_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  player2_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  winner_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  player1_score VARCHAR(255) NOT NULL,
  player2_score VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS match_stats CASCADE; 
CREATE TABLE match_stats (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  match_id INTEGER REFERENCES matches(id) ON DELETE CASCADE,
  total_score VARCHAR(255) NOT NULL
);


DROP TABLE IF EXISTS challenge_request CASCADE;
CREATE TABLE challenge_request (
  id SERIAL PRIMARY KEY NOT NULL,
  challenger_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  location_id INTEGER REFERENCES location(id) ON DELETE CASCADE,
  date DATE,
  challenge_message VARCHAR(255),
  request_status VARCHAR(255),
  accepted_at DATE,
  declined_at DATE 
);

DROP TABLE IF EXISTS challenge_request_matches CASCADE;
CREATE TABLE challenge_request_matches (
  id SERIAL PRIMARY KEY NOT NULL,
  date DATE NOT NULL,
  player1_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  player2_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  winner_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  player1_id_score VARCHAR(255) NOT NULL,
  player2_id_score VARCHAR(255) NOT NULL,
  total_score VARCHAR(255) NOT NULL
);