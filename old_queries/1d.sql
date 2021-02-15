select season_id, match_id, innings_no, over_id, ball_id, bowler, player_name, runs_scored, extra_runs, (runs_scored + extra_runs) as total_runs
from ball_by_ball
natural join match_match
natural join batsman_scored
natural join extra_runs
inner join player on player.player_id = ball_by_ball.bowler
where (match_match.season_id = 5)
;


natural join wicket_taken



season_id, match_id, innings_no, over_id, ball_id, bowler, player_name as bowler_name, (extra_runs + runs_scored) as total_runs, player_out
where (player.player_id = ball_by_ball.bowler and match_match.season_id = 5)
group by bowler
;

order by total_runs/count(*) asc, bowler_name asc
;
