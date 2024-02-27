-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist_db;  

CREATE DATABASE craigslist_db; 

\c craigslist_db

CREATE TABLE region (
    region_id SERIAL PRIMARY KEY,
    city VARCHAR(255) NOT NULL,
    us_state VARCHAR(255) NOT NULL
);

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    category_name TEXT NOT NULL
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    preferred_region INT,
    FOREIGN KEY (preferred_region) REFERENCES region(region_id)
);

CREATE TABLE post (
    post_id SERIAL PRIMARY KEY,
    date_of_post DATE NOT NULL,
    user_id INT NOT NULL,
    content_text TEXT NOT NULL,
    title TEXT NOT NULL,
    location_name TEXT NOT NULL,
    region_id INT NOT NULL,
    category_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (region_id) REFERENCES region(region_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

INSERT INTO region (city, us_state) VALUES 
('San Francisco', 'California'),
('New York', 'New York'),
('Austin', 'Texas'),
('Seattle', 'Washington'),
('Boston', 'Massachusetts');

INSERT INTO category (category_name) VALUES 
('For Sale'),
('Housing'),
('Jobs'),
('Services'),
('Community');

INSERT INTO users (username, preferred_region) VALUES 
('johndoe', 1),
('janedoe', 2),
('mike123', 3),
('sarah_smith', 4),
('alexjohnson', 5);

INSERT INTO post (date_of_post, user_id, content_text, title, location_name, region_id, category_id) VALUES 
('2024-02-01', 1, 'Selling a barely used bicycle, in great condition.', 'Used Bicycle for Sale', 'Downtown', 1, 1),
('2024-02-02', 2, 'Looking for a roommate for a 2BR apartment.', 'Roommate Wanted', 'Midtown', 2, 2),
('2024-02-03', 3, 'Hiring a web developer for a startup.', 'Web Developer Position', 'Downtown', 3, 3),
('2024-02-04', 4, 'Offering guitar lessons for beginners and intermediate players.', 'Guitar Lessons Available', 'Central', 4, 4),
('2024-02-05', 5, 'Join our community garden.', 'Community Garden Volunteers', 'South End', 5, 5);

