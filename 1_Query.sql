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
