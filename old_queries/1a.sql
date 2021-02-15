select match_id, innings_no, over_id, ball_id, extra_type, extra_runs, runs_scored, bowler, player_name, runs_scored + extra_runs as new_runs
from ball_by_ball
natural join extra_runs 
natural join batsman_scored
natural join player where (player.player_id = ball_by_ball.bowler and (extra_type = "wides" or extra_type = "noballs"))
group by match_id, innings_no, over_id
order by sum(new_runs) asc, match_id, innings_no, over_id
limit 1
;


select match_id, innings_no, over_id, ball_id, bowler, runs_scored + extra_runs as new_runs
from ball_by_ball
natural join extra_runs
natural join batsman_scored
order by match_id, innings_no, over_id, ball_id asc
;

