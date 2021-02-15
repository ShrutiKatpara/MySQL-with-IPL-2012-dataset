select player.player_name, sum( coalesce(runs_scored,0) ) / count( distinct(ball_by_ball.match_id)) as average
from ball_by_ball
left join batsman_scored on (ball_by_ball.match_id = batsman_scored.match_id and ball_by_ball.over_id = batsman_scored.over_id and ball_by_ball.ball_id = batsman_scored.ball_id and ball_by_ball.innings_no = batsman_scored.innings_no)
left join player on (ball_by_ball.striker = player.player_id)
left join match_match on (ball_by_ball.match_id = match_match.match_id)
where match_match.season_id = 2
group by match_match.season_id, ball_by_ball.striker
order by average desc, player.player_name
limit 3
;
