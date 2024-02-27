-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- Artists Table
CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Producers Table
CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Albums Table
CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_date DATE NOT NULL
);

-- Songs Table
CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album_id INTEGER NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albums(id)
);

-- SongArtists Junction Table
CREATE TABLE song_artists (
  song_id INTEGER NOT NULL,
  artist_id INTEGER NOT NULL,
  PRIMARY KEY (song_id, artist_id),
  FOREIGN KEY (song_id) REFERENCES songs(id),
  FOREIGN KEY (artist_id) REFERENCES artists(id)
);

-- SongProducers Junction Table
CREATE TABLE song_producers (
  song_id INTEGER NOT NULL,
  producer_id INTEGER NOT NULL,
  PRIMARY KEY (song_id, producer_id),
  FOREIGN KEY (song_id) REFERENCES songs(id),
  FOREIGN KEY (producer_id) REFERENCES producers(id)
);

