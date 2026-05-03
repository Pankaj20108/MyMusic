CREATE DATABASE IF NOT EXISTS Spotify_V2;
USE Spotify_V2;

CREATE TABLE IF NOT EXISTS songs (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  artist VARCHAR(255) NOT NULL,
  youtube_url VARCHAR(500) NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO songs (title, artist) VALUES
  ('Blinding Lights', 'The Weeknd'),
  ('Shape of You', 'Ed Sheeran'),
  ('Levitating', 'Dua Lipa');
