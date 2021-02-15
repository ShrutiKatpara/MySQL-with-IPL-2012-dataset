create view indian_players as 
select player_id, player_name , sum(runs_scored)
from ball_by_ball
natural join batsman_scored
inner join player on player.player_id = ball_by_ball.striker and player.country_name = "India"
group by striker
order by player_name
;

select * from indian_players;

drop view indian_players;