select player.player_name, sum(batsman_scored.runs_scored) as total_runs
from ball_by_ball
inner join match_match on ( match_match.season_id=3 and match_match.match_id = ball_by_ball.match_id)
inner join player_match on ( player_match.role = "Captain" and player_match.match_id = ball_by_ball.match_id and player_match.player_id = ball_by_ball.striker)
inner join batsman_scored on (ball_by_ball.match_id = batsman_scored.match_id and ball_by_ball.over_id = batsman_scored.over_id and ball_by_ball.ball_id = batsman_scored.ball_id and ball_by_ball.innings_no = batsman_scored.innings_no)
inner join player on player.player_id = ball_by_ball.striker
group by ball_by_ball.striker
having total_runs > 50
;

select player.player_name, sum(batsman_scored.runs_scored) as total_runs
from batsman_scored
inner join ball_by_ball on (ball_by_ball.match_id = batsman_scored.match_id and ball_by_ball.over_id = batsman_scored.over_id and ball_by_ball.ball_id = batsman_scored.ball_id and ball_by_ball.innings_no = batsman_scored.innings_no)
inner join match_match on ( match_match.season_id=3 and match_match.match_id = batsman_scored.match_id)
inner join player_match on ( player_match.role = "Captain" and player_match.match_id = batsman_scored.match_id and player_match.player_id = ball_by_ball.striker)
inner join player on player.player_id = ball_by_ball.striker
group by ball_by_ball.striker
having total_runs > 50
;