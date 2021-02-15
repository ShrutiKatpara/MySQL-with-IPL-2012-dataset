CREATE TABLE player_copy LIKE player; 
INSERT INTO player_copy SELECT * FROM player;

select * from player_copy;