create view onea as
select  ball_by_ball.match_id, ball_by_ball.innings_no, ball_by_ball.over_id, ball_by_ball.bowler, player.player_name , (sum(coalesce(extra_runs.extra_runs, 0)) + sum(coalesce(runs_scored,0))) as total_runs
from ball_by_ball
left join extra_runs on ( (extra_runs.extra_type = "noballs" or extra_runs.extra_type="wides") and ball_by_ball.match_id = extra_runs.match_id and ball_by_ball.over_id = extra_runs.over_id and ball_by_ball.ball_id = extra_runs.ball_id and ball_by_ball.innings_no = extra_runs.innings_no)
left join batsman_scored on (ball_by_ball.match_id = batsman_scored.match_id and ball_by_ball.over_id = batsman_scored.over_id and ball_by_ball.ball_id = batsman_scored.ball_id and ball_by_ball.innings_no = batsman_scored.innings_no)
left join player on (ball_by_ball.bowler = player.player_id)
group by ball_by_ball.match_id, ball_by_ball.innings_no, ball_by_ball.over_id
order by ball_by_ball.match_id, ball_by_ball.innings_no, ball_by_ball.over_id
;

select over_id, player_name, min(total_runs) as min_runs
from onea
group by over_id
order by match_id, innings_no, over_id
;
drop view onea;