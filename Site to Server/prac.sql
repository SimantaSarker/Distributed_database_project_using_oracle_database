SELECT pname,page,plocation from (((SELECT * from Persons) UNION (SELECT * from persons@site1))
NATURAL JOIN 
((SELECT * from Found_addicted_people) UNION (SELECT * from found_addicted_people@site1)));