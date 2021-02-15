select player.player_name, count(temp.kind_out) as frequency
from player
left outer join (select * from wicket_taken where wicket_taken.kind_out = "caught") as temp 
on temp.player_out = player.player_id
group by player.player_id
order by frequency
;


