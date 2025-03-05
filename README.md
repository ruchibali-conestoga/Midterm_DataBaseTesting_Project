Movie Production Management System
Overview
This project involves the creation of a movie production management system. It uses a relational database to manage data about people (actors, directors, etc.), movies, roles, contracts, and awards. This system tracks information about movies, people involved, their roles, associated contracts, and any awards received by the movies.
Tables Overview
The system is built using five main tables, each serving a specific purpose in the management of movie production data. Below are the details of each table:
1. People
This table stores information about people involved in the movie industry, such as actors, directors, and producers.
•	UnionId (Primary Key): A unique identifier for each person.
•	PersonName: The name of the person.
•	Dob: The date of birth of the person.
•	Nationality: The nationality of the person.
•	Biography: A brief biography of the person.
•	ContactInfo: The contact information (e.g., email address) of the person.
2. Movies
This table stores information about movies.
•	MovieId (Primary Key): A unique identifier for each movie.
•	Title: The title of the movie.
•	ReleaseDate: The release date of the movie.
3. Roles
This table stores information about different roles available in movie production, such as Director, Producer, or Editor.
•	RoleId (Primary Key): A unique identifier for each role.
•	RoleName: The name of the role (e.g., Director, Producer, etc.).
4. Contracts
This table links movies to people and specifies the salary for each person involved in the movie production.
•	ContractId (Primary Key): A unique identifier for each contract.
•	MovieId (Foreign Key): References the MovieId in the Movies table.
•	UnionId (Foreign Key): References the UnionId in the People table.
•	Salary: The salary paid to the person for their involvement in the movie.
5. Awards
This table stores information about awards given to movies.
•	AwardId (Primary Key): A unique identifier for each award.
•	MovieId (Foreign Key): References the MovieId in the Movies table.
•	AwardName: The name of the award given to the movie.
SQL Queries
Insert Data
The following queries insert sample data into the tables:
sql

-- Insert data into People table
INSERT INTO People (PersonName, Dob, Nationality, Biography, ContactInfo)
VALUES 
    ('John Doe', '1980-05-15', 'American', 'Famous Actor', 'johndoe@email.com'),
    ('Jane Smith', '1975-10-22', 'British', 'Award-winning director', 'janesmith@email.com'),
    ('Alice Brown', '1990-07-30', 'Canadian', 'Production assistant', 'alicebrown@email.com');

-- Insert data into Movies table
INSERT INTO Movies (Title, ReleaseDate)
VALUES 
    ('Action Movie', '2023-06-10'),
    ('Comedy Movie', '2022-12-20'),
    ('Drama Movie', '2024-02-14');

-- Insert data into Roles table
INSERT INTO Roles (RoleName)
VALUES 
    ('Director'),
    ('Producer'),
    ('Editor');

-- Insert data into Contracts table
INSERT INTO Contracts (MovieId, UnionId, Salary)
VALUES 
    (1, 1, 50000.00),
    (1, 2, 75000.00),
    (2, 3, 40000.00);

-- Insert data into Awards table
INSERT INTO Awards (MovieId, AwardName)
VALUES 
    (1, 'Best Action Film'),
    (2, 'Best Comedy'),
    (3, 'Best Drama');
Query Data
You can retrieve all data from each of the tables using the following queries:
sql

-- Select data from People table
SELECT * FROM People;

-- Select data from Movies table
SELECT * FROM Movies;

-- Select data from Roles table
SELECT * FROM Roles;

-- Select data from Contracts table
SELECT * FROM Contracts;

-- Select data from Awards table
SELECT * FROM Awards;
Database Schema (ERD)
An Entity-Relationship Diagram (ERD) can be used to visualize the relationships between the tables in this system. Below is a brief explanation of the relationships:
1.	People ↔ Contracts: A person (from the People table) can have multiple contracts (in the Contracts table).
2.	Movies ↔ Contracts: A movie (from the Movies table) can have multiple contracts (in the Contracts table).
3.	Movies ↔ Awards: A movie can win multiple awards, which are stored in the Awards table.
4.	Roles: Roles are standalone and linked to the Contracts table indirectly, as each person (via a contract) has a role in a movie.
Setup Instructions
1.	Install PostgreSQL:
o	If you haven't already, install PostgreSQL.
2.	Create Database:
o	Create a new database for the project.
CREATE DATABASE movie_production;
3.	Run SQL Queries:
o	Open the database and execute the CREATE TABLE and INSERT INTO SQL queries to set up the schema and populate the data.
4.	Access Data:
o	Use SQL queries to access and manipulate the data as needed.

1. Retrieve all movies with their directors, release dates, and awards count
SELECT 
    m.Title, 
    p.PersonName AS director, 
    m.ReleaseDate, 
    COUNT(a.AwardId) AS TotalAwards
FROM Movies m
JOIN Contracts c ON m.MovieId = c.MovieId
JOIN People p ON c.UnionId = p.UnionId
LEFT JOIN Awards a ON m.MovieId = a.MovieId
WHERE c.UnionId IN (
    SELECT UnionId FROM Contracts 
    JOIN Roles r ON c.UnionId = r.RoleId 
    WHERE r.RoleName = 'Director'
)
GROUP BY m.Title, p.PersonName, m.ReleaseDate
ORDER BY TotalAwards DESC;

2. Calculate total salary cost for each movie
SELECT 
    m.Title, 
    SUM(c.Salary) AS TotalSalaryCost
FROM Movies m
JOIN Contracts c ON m.MovieId = c.MovieId
GROUP BY m.Title
ORDER BY TotalSalaryCost DESC;
3. Retrieve all movies along with the names and union IDs of all people involved
SELECT 
    m.Title, 
    SUM(c.Salary) AS TotalSalaryCost
FROM Movies m
JOIN Contracts c ON m.MovieId = c.MovieId
GROUP BY m.Title
ORDER BY TotalSalaryCost DESC;

Contribution
If you'd like to contribute to this project, feel free to fork this repository and submit pull requests. Contributions are always welcome!
