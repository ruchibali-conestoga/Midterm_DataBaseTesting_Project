INSERT INTO People (PersonName, Dob, Nationality, Biography, ContactInfo)
VALUES 
    ('John Doe', '1980-05-15', 'American', 'Famous Actor', 'johndoe@email.com'),
    ('Jane Smith', '1975-10-22', 'British', 'Award-winning director', 'janesmith@email.com'),
    ('Alice Brown', '1990-07-30', 'Canadian', 'Production assistant', 'alicebrown@email.com');

INSERT INTO Movies (Title, ReleaseDate)
VALUES 
    ('Action Movie', '2023-06-10'),
    ('Comedy Movie', '2022-12-20'),
    ('Drama Movie', '2024-02-14');

INSERT INTO Roles (RoleName)
VALUES 
    ('Director'),
    ('Producer'),
    ('Editor');

INSERT INTO Contracts (MovieId, UnionId, Salary)
VALUES 
    (1, 1, 50000.00),
    (1, 2, 75000.00),
    (2, 3, 40000.00);

INSERT INTO Awards (MovieId, AwardName)
VALUES 
    (1, 'Best Action Film'),
    (2, 'Best Comedy'),
    (3, 'Best Drama')


	--select * from People
	--select * from Movies
	--select * from Roles
	--select * from Contracts
	--select * from Awards
