#2
USE albums_db;

#3
Select *
From albums;
#31 rows

SELECT DISTINCT artist
FROM albums;
#23 unique artists

Select *
From albums;
#primary key is ‘id’

SELECT MAX(release_date)
From albums
#2011

SELECT MIN(release_date)
From albums
#1967

#4
SELECT name
FROM album
WHERE artist = ‘Pink Floyd’;
#The dark side of the moon, The wall

SELECT release_date
FROM albums
WHERE name = “Sgt. Pepper’s Lonely Hearts Club Band”;
#1967

SELECT genre
FROM albums
WHERE name = ‘Nevermind’;
#Grunge, Alternative rock

SELECT name
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;
#The Bodyguard, Jagged Little Pill, Come On Over, Falling into You, Let’s Talk About Love, Dangerous, The Immaculate Collection, Titanic: Music from the Motion Picture, Metallica, Nevermind, Supernatural


SELECT name
FROM albums
WHERE sales < 20;
#Grease, Bad, Sgt. Pepper’s Lonely Hearts Club Band, Dirty Dancing, Let’s Talk About Love, Dangerous, The Immaculate Collection, Abbey Road, Born in the U.S.A., Brothers in Arms, Titanic: Music from the Motion Picture, The Wall

SELECT name
FROM albums
WHERE genre = ‘Rock’;
#Sgt. Pepper’s Lonely Hearts Club Band, 1, Abbey Road, Born in the U.S.A., Supernatural
#Rock is a string, and calling for it must exact
