create view onei as
select player.player_name, player.country_name , sum( coalesce(runs,0)) as total_runs
from player
left join 
(select ball_by_ball.striker as id, batsman_scored.runs_scored as runs
from ball_by_ball, batsman_scored
where ball_by_ball.match_id = batsman_scored.match_id and ball_by_ball.over_id = batsman_scored.over_id and ball_by_ball.ball_id = batsman_scored.ball_id and ball_by_ball.innings_no = batsman_scored.innings_no
) as temp on temp.id = player.player_id and player.country_name = "India"
group by player.player_id
;

create view indian_players as
select player_name, total_runs
from onei
where country_name = "India"
order by player_name
;

select * from indian_players;

drop view onei;
drop view indian_players;