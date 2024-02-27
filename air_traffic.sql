-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

-- Passengers Table
CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

-- Airlines Table
CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Cities Table
CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country TEXT NOT NULL
);

-- Flights Table
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  airline_id INTEGER NOT NULL,
  from_city_id INTEGER NOT NULL,
  to_city_id INTEGER NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  FOREIGN KEY (airline_id) REFERENCES airlines(id),
  FOREIGN KEY (from_city_id) REFERENCES cities(id),
  FOREIGN KEY (to_city_id) REFERENCES cities(id)
);

-- Tickets Table
CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER NOT NULL,
  flight_id INTEGER NOT NULL,
  seat TEXT NOT NULL,
  FOREIGN KEY (passenger_id) REFERENCES passengers(id),
  FOREIGN KEY (flight_id) REFERENCES flights(id)
);

INSERT INTO passengers (first_name, last_name) VALUES ('Jennifer', 'Finch');


INSERT INTO airlines (name) VALUES ('United');


INSERT INTO cities (name, country) VALUES ('Washington DC', 'United States'), ('Seattle', 'United States');


INSERT INTO flights (airline_id, from_city_id, to_city_id, departure, arrival) 
VALUES (1, 1, 2, '2018-04-08 09:00:00', '2018-04-08 12:00:00');

INSERT INTO tickets (passenger_id, flight_id, seat) VALUES (1, 1, '33B');