create view oneb as
select wicket_taken.player_out, player.player_name, count(*) as frequency
from wicket_taken
inner join player on player.player_id = wicket_taken.player_out
where wicket_taken.kind_out = "caught"
group by wicket_taken.player_out
order by frequency, player.player_name
;

select * 
from oneb
where frequency =  ( select min(frequency) from oneb )
;

drop view oneb;