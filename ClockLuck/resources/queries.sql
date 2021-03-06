Get All Scrambles:

SELECT s.competitionId, s.roundTypeId, s.groupId, s.scrambleNum, s.scramble
FROM Scrambles AS s 
INNER JOIN (
    SELECT competitionId, roundTypeId, formatId
    FROM Results
    WHERE eventId = 'clock'
    GROUP BY competitionId, roundTypeId, formatId
) AS r ON s.competitionId = r.competitionId AND s.roundTypeId = r.roundTypeId
WHERE s.eventId = 'clock' AND s.isExtra = 0 AND r.formatId = 'a'
ORDER BY s.competitionId, s.roundTypeId, s.groupId, s.scrambleNum

By Delegate:

SELECT u.name, s.competitionId, s.roundTypeId, s.groupId, s.scrambleNum, s.scramble
FROM competition_delegates AS d 
INNER JOIN users AS u ON d.delegate_id = u.id
INNER JOIN Scrambles AS s ON d.competition_id = s.competitionId
INNER JOIN (
    SELECT competitionId, roundTypeId, formatId
    FROM Results
    WHERE eventId = 'clock'
    GROUP BY competitionId, roundTypeId, formatId
) AS r ON s.competitionId = r.competitionId AND s.roundTypeId = r.roundTypeId
WHERE s.eventId = 'clock' AND s.isExtra = 0 AND r.formatId = 'a'
ORDER BY u.name, s.competitionId, s.roundTypeId, s.groupId, s.scrambleNum

Average Ranks:

SELECT a.worldRank, p.name, a.personid, a.best, r.competitionId 
FROM RanksAverage AS a
INNER JOIN Persons AS p ON a.personId = p.id
INNER JOIN Results AS r ON a.personID = r.personId AND a.best = r.average
WHERE a.eventID = 'clock' 
ORDER BY a.WorldRank 
LIMIT 100
