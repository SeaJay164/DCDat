--This file is for the creation of queries related to this DC Database

/*
CREATE VIEW result AS 
  (SELECT first.*, 
          second.f1, 
          second.f2, 
          second.f3 
   FROM   first 
          INNER JOIN second 
                  ON first.id = second.id);
*/