SELECT 
     sev.personId, 
     sev.competitionId, 
     comp.start_date, 
     MIN(sev.average) AS 7avg, 
     six.6avg
FROM Results as sev 
INNER JOIN (
    SELECT 
         personId, 
         competitionID, 
         MIN(average) AS 6avg 
    FROM `Results` 
    WHERE eventId = '666' AND average > 0 
    GROUP BY personId, CompetitionId
) AS six ON sev.personId = six.personId AND sev.competitionId = six.competitionId 
INNER JOIN Competitions AS comp ON sev.competitionId = comp.id
Where sev.eventId = '777' AND sev.average > 0 
GROUP BY sev.PersonId, sev.competitionId 
ORDER BY comp.start_date
