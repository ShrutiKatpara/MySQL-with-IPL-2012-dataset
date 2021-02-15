select season_id, role, player.player_id, player_name, sum(runs_scored)
from ball_by_ball
natural join player_match
natural join batsman_scored
natural join match_match
inner join player on player.player_id = ball_by_ball.striker
where (match_match.season_id = 3 and player_match.role = "Captain")
group by striker 
having sum(runs_scored) > 50
order by player_name asc
;