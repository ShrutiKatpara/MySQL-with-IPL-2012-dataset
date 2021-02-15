create view oneb as 
select player_id, player_name, count(*) as count
from wicket_taken
natural join player
where wicket_taken.player_out = player.player_id and wicket_taken.kind_out = "caught"
group by player_out
order by count(*) asc, player_name asc
;

select * 
from oneb
where count =  ( select min(count) from oneb )
;