create view ans as 
select match_id, striker, player_id, player_name, sum(runs_scored) as total_runs
from ball_by_ball
natural join batsman_scored
inner join player on player.player_id = ball_by_ball.striker
group by match_id, striker
having sum(runs_scored) > 100
order by player_name asc
;

select * 
from ans
group by player_name
having max(total_runs)
;

drop view ans;