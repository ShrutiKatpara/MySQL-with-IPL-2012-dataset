create view onea as 
select  player.player_name, (sum(coalesce(extra_runs.extra_runs, 0)) + sum(coalesce(runs_scored,0))) as total_runs
from ball_by_ball
left join extra_runs on ( (extra_runs.extra_type = "noballs" or extra_runs.extra_type="wides") and ball_by_ball.match_id = extra_runs.match_id and ball_by_ball.over_id = extra_runs.over_id and ball_by_ball.ball_id = extra_runs.ball_id and ball_by_ball.innings_no = extra_runs.innings_no)
left join batsman_scored on (ball_by_ball.match_id = batsman_scored.match_id and ball_by_ball.over_id = batsman_scored.over_id and ball_by_ball.ball_id = batsman_scored.ball_id and ball_by_ball.innings_no = batsman_scored.innings_no)
left join player on (ball_by_ball.bowler = player.player_id)
group by ball_by_ball.match_id, ball_by_ball.innings_no, ball_by_ball.over_id
order by total_runs, ball_by_ball.match_id, ball_by_ball.innings_no, ball_by_ball.over_id
;

select * 
from onea
where total_runs in 
(select min(total_runs) from onea); 

drop view onea;