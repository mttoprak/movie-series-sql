CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    passw VARCHAR(255) NOT NULL
);

CREATE TABLE Contents (
    content_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    release_year INT CHECK (release_year BETWEEN 1900 AND 2025),
    type VARCHAR(10) CHECK (type IN ('movie','series')) NOT NULL
);

CREATE TABLE Genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE ContentGenres (
    content_id INT NOT NULL,
    genre_id   INT NOT NULL,
    PRIMARY KEY(content_id, genre_id),
    FOREIGN KEY(content_id) REFERENCES Contents(content_id),
    FOREIGN KEY(genre_id)   REFERENCES Genres(genre_id)
);

CREATE TABLE SeriesSeasons (
    season_id     SERIAL PRIMARY KEY,
    content_id    INT NOT NULL,
    season_number INT NOT NULL,
    FOREIGN KEY(content_id) REFERENCES Contents(content_id)
);

CREATE TABLE Episodes (
    episode_id     SERIAL PRIMARY KEY,
    season_id      INT NOT NULL,
    episode_number INT NOT NULL,
    title          VARCHAR(255),
    FOREIGN KEY(season_id) REFERENCES SeriesSeasons(season_id)
);

CREATE TABLE WatchStatus (
    status_id       SERIAL PRIMARY KEY,
    user_id         INT NOT NULL,
    content_id      INT NOT NULL,
    status          VARCHAR(15) CHECK (status IN ('watching','watched','plan_to_watch')) NOT NULL,
    current_season  INT DEFAULT 0,
    current_episode INT DEFAULT 0,
    current_second  INT DEFAULT 0,
    UNIQUE(user_id, content_id),
    FOREIGN KEY(user_id)    REFERENCES Users(user_id),
    FOREIGN KEY(content_id) REFERENCES Contents(content_id)
);

CREATE TABLE Ratings (
    rating_id  SERIAL PRIMARY KEY,
    user_id    INT NOT NULL,
    content_id INT NOT NULL,
    rating     SMALLINT CHECK (rating BETWEEN 1 AND 10),
    UNIQUE(user_id, content_id),
    FOREIGN KEY(user_id)    REFERENCES Users(user_id),
    FOREIGN KEY(content_id) REFERENCES Contents(content_id)
);

CREATE TABLE Comments (
    comment_id   SERIAL PRIMARY KEY,
    user_id      INT NOT NULL,
    content_id   INT NOT NULL,
    comment      TEXT NOT NULL,
    comment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, content_id),
    FOREIGN KEY(user_id)    REFERENCES Users(user_id),
    FOREIGN KEY(content_id) REFERENCES Contents(content_id)
);

-- Data

INSERT INTO Users(username, email, passw) VALUES
('omer','omerdemirel@proton.me','CroswIn9mON'),
('yasin','yasindag@proton.me','tRiso8Huqlz'),
('mehmet','mehmettoprak@proton.me','Sp14IrajaCR'),
('huseyin','huseyinuyar@proton.me','JAd2h4phlst'),
('can','can@proton.me','trLP5sWast6'),
('selin','selin@proton.me','nezePhEnus8'),
('emre','emre@proton.me','ziFu9roqlf2'),
('eda','eda@proton.me','drugeHiswA2'),
('serkan','serkan@proton.me','c0u4lDugOPi'),
('naz','naz@proton.me','weF7lTRabro');

INSERT INTO Contents(title, description, release_year, type) VALUES
('Inception','A mind-bending thriller',2010,'movie'),
('Matrix','Sci-fi action',1999,'movie'),
('Friends','90s sitcom',1994,'series'),
('Breaking Bad','Crime drama',2008,'series'),
('Interstellar','Space epic',2014,'movie'),
('Dark','Time-travel mystery',2017,'series'),
('The Godfather','Mafia classic',1972,'movie'),
('Stranger Things','Supernatural thriller',2016,'series'),
('Parasite','Social satire',2019,'movie'),
('Sherlock','Detective series',2010,'series');

INSERT INTO Genres(name) VALUES
('Action'),('Drama'),('Comedy'),
('Sci-Fi'),('Thriller'),('Mystery'),
('Crime'),('Fantasy'),('Adventure'),
('Romance'),('Horror');

INSERT INTO ContentGenres(content_id, genre_id) VALUES
(1,1),(1,4),
(2,1),(2,4),
(3,3),
(4,2),(4,7),
(5,4),(5,8),
(6,6),(6,5),
(7,2),(7,7),
(8,5),(8,9),
(9,2),(9,10),(9,11),
(10,6);

INSERT INTO SeriesSeasons(content_id, season_number) VALUES
(3,1),(3,2),
(4,1),(4,2),
(6,1),(6,2),
(8,1),(8,2),
(10,1),(10,2);

INSERT INTO Episodes(season_id, episode_number, title) VALUES
(1,1,'The One Where It All Began'),
(1,2,'The One with the Sonogram at the End'),
(2,1,'The One with Ross''s Wedding'),
(2,2,'The One After Vegas'),
(3,1,'Pilot'),
(3,2,'Cat''s in the Bag'),
(4,1,'Seven Thirty-Seven'),
(4,2,'Grilled'),
(5,1,'Secrets'),
(5,2,'Dark Matter'),
(6,1,'Beginnings and Endings'),
(6,2,'Darkness'),
(7,1,'Chapter One'),
(7,2,'Chapter Two'),
(8,1,'Chapter One'),
(8,2,'Chapter Two'),
(9,1,'A Study in Pink'),
(9,2,'The Blind Banker'),
(10,1,'Pilot'),
(10,2,'The Great Game');

INSERT INTO WatchStatus(user_id, content_id, status, current_season, current_episode, current_second) VALUES
(1,3,'watching',1,1,120),
(2,4,'watched',2,2,0),
(3,1,'watched',0,0,0),
(4,5,'plan_to_watch',0,0,0),
(5,6,'watching',1,2,300),
(6,2,'watched',0,0,0),
(7,8,'watching',2,1,45),
(8,9,'plan_to_watch',0,0,0),
(9,10,'watching',1,2,150),
(10,3,'watched',2,2,0);

INSERT INTO Ratings(user_id, content_id, rating) VALUES
(1,1,9),(2,2,8),(3,3,7),(4,4,10),(5,5,9),
(6,6,8),(7,7,9),(8,8,7),(9,9,8),(10,10,9);

INSERT INTO Comments(user_id, content_id, comment) VALUES
(1,1,'Harika film!'),(2,2,'Mükemmel efektler.'),
(3,3,'Çok eğlenceli.'),(4,4,'Sürükleyici bir dizi.'),
(5,5,'Muhteşem görseller.'),(6,6,'Çözülmesi zor.'),
(7,7,'Klasikleşmiş yapım.'),(8,8,'Heyecan dozu yüksek.'),
(9,9,'Sosyal mesajlar etkili.'),(10,10,'Harika oyunculuk.');



-- DEFINITIONS



-- Basic Selection (SELECT):

-- Lists usernames and emails in alphabetical order
SELECT username, email FROM Users ORDER BY username;

-- Lists contents released in 2010 or later, sorted from newest to oldest
SELECT title, release_year FROM Contents WHERE release_year >= 2010 ORDER BY release_year DESC;

-- Retrieves all data of currently watched contents
SELECT * FROM WatchStatus WHERE status = 'watching';

-- Retrieves contents with status "watching" and watched more than 300 seconds, along with username and seconds
SELECT u.username, w.current_second 
FROM Users u 
JOIN WatchStatus w ON u.user_id = w.user_id 
WHERE w.status = 'watching' AND w.current_second > 300;

-- Aggregate functions,

-- Returns the total number of users
SELECT COUNT(*) AS total_users FROM Users;

-- Calculates the average rating for a specific content (id=1)
SELECT AVG(rating) AS avg_rating FROM Ratings WHERE content_id = 1;

-- Returns the earliest and latest release years of contents
SELECT MIN(release_year) AS earliest, MAX(release_year) AS latest FROM Contents;

-- Grouping (GROUP BY):

-- Groups contents by type and shows the count for each type
SELECT type, COUNT(*) AS cnt FROM Contents GROUP BY type;

-- Groups contents marked as "watched" by content id and returns those watched 2 or more times
SELECT content_id, COUNT(*) AS watch_count 
FROM WatchStatus 
WHERE status = 'watched' 
GROUP BY content_id 
HAVING COUNT(*) >= 2;

-- Returns the number of contents by genre and sorts from most to least
SELECT g.name AS genre, COUNT(*) AS total 
FROM Genres g 
JOIN ContentGenres cg ON g.genre_id = cg.genre_id 
GROUP BY g.name 
ORDER BY total DESC;

-- Join (JOIN):

-- Retrieves username, content title, and rating together
SELECT u.username, c.title, r.rating 
FROM Ratings r 
JOIN Users u ON r.user_id = u.user_id 
JOIN Contents c ON r.content_id = c.content_id;

-- Retrieves each content's title and its rating if available (NULL if no rating)
SELECT c.title, r.rating 
FROM Contents c 
LEFT JOIN Ratings r ON c.content_id = r.content_id;

-- Retrieves content title and status from watch statuses (some contents may be NULL)
SELECT c.title, w.status 
FROM Contents c 
RIGHT JOIN WatchStatus w ON c.content_id = w.content_id;

-- Retrieves user comments, matches users and comments, unmatched ones are also shown (FULL OUTER JOIN)
SELECT u.username, cm.comment 
FROM Users u 
FULL OUTER JOIN Comments cm ON u.user_id = cm.user_id;

-- Subqueries:

-- Retrieves contents with a rating of 9 or higher
SELECT * FROM Contents 
WHERE content_id IN (
    SELECT content_id FROM Ratings WHERE rating >= 9
);

-- Retrieves the watch status of the user with username 'ali'
SELECT * FROM WatchStatus 
WHERE user_id = (
    SELECT user_id FROM Users WHERE username = 'ali'
);

-- Retrieves the title and year of the most recently released content
SELECT title, release_year 
FROM Contents 
WHERE release_year = (
    SELECT MAX(release_year) FROM Contents
);

-- Returns the average number of watches per content (after grouping by subquery)
SELECT AVG(sub.watch_count) AS avg_watches 
FROM (
    SELECT content_id, COUNT(*) AS watch_count 
    FROM WatchStatus 
    GROUP BY content_id
) AS sub;

-- Views:

-- Creates a view for contents with an average rating of 8 or higher
CREATE VIEW HighlyRatedContents AS 
SELECT c.title, AVG(r.rating) AS avg_rating 
FROM Contents c 
JOIN Ratings r ON c.content_id = r.content_id 
GROUP BY c.title 
HAVING AVG(r.rating) >= 8;

-- Lists the highest rated contents from this view
SELECT * FROM HighlyRatedContents ORDER BY avg_rating DESC;

-- Creates a view that holds the total number of comments made by users
CREATE VIEW UserCommentSummary AS 
SELECT u.username, COUNT(cm.comment_id) AS comment_count 
FROM Users u 
LEFT JOIN Comments cm ON u.user_id = cm.user_id 
GROUP BY u.username;

-- Lists users with more than 2 comments
SELECT * FROM UserCommentSummary WHERE comment_count > 2;

-- Set Operators:

-- Retrieves all titles by combining movies and series without duplicates
SELECT title FROM Contents WHERE type = 'movie' 
UNION 
SELECT title FROM Contents WHERE type = 'series';

-- Retrieves contents that are both movies and series between 1990-2000
SELECT title FROM Contents 
WHERE release_year BETWEEN 1990 AND 2000 AND type = 'movie' 
INTERSECT 
SELECT title FROM Contents 
WHERE release_year BETWEEN 1990 AND 2000 AND type = 'series';

-- Retrieves contents released before 2000 and not of type series
SELECT title FROM Contents 
WHERE release_year < 2000 
EXCEPT 
SELECT title FROM Contents WHERE type = 'series';

-- Data Manipulation (DML):

-- Updates the rating of 'mehmet' for the content 'Matrix' to 9
UPDATE Ratings 
SET rating = 9 
WHERE user_id = (SELECT user_id FROM Users WHERE username = 'mehmet') 
AND content_id = (SELECT content_id FROM Contents WHERE title = 'Matrix');

-- Deletes watch records that are planned but not started yet (at 0 seconds)
DELETE FROM WatchStatus 
WHERE status = 'plan_to_watch' AND current_second = 0;
