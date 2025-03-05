SELECT 
    m.Title, 
    SUM(c.Salary) AS TotalSalaryCost
FROM Movies m
JOIN Contracts c ON m.MovieId = c.MovieId
GROUP BY m.Title
ORDER BY TotalSalaryCost DESC;
