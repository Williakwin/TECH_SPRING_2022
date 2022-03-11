use movies;
use movies;
CREATE INDEX movies_ids ON movies(id);

CREATE INDEX movies_titles ON movies(title);

CREATE INDEX movies_ids_titles ON movies(id, title);

SHOW ENGINES;

SELECT * FROM movies WHERE title = 'Finding nemo';

CREATE TABLE IF NOT EXISTS actors_movies (
actors_id INT,
movies_id INT,
FOREIGN KEY (actors_id) REFERENCES actors(id),
FOREIGN KEY (movies_id) REFERENCES movies(id)
);

SELECT a.title,
       a.year,
       b.first_name,
       b.last_name
FROM movies AS a
INNER JOIN actors as b
ON a.id = b.id;

CREATE TABLE IF NOT EXISTS production_teams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS movies_production_teams(
    movie_ID INT,
    production_team_id INT,
    FOREIGN KEY (movie_ID) REFERENCES movies(id) ON DELETE CASCADE,
    FOREIGN KEY(production_team_id) REFERENCES production_teams(id) ON DELETE CASCADE
)

#CREATE AN INSERT STATEMENT