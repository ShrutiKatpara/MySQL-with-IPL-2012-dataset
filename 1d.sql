create view oned as
select  player.player_name, 
case 
when ( sum( coalesce( batsman_scored.runs_scored, 0 ) ) / count( wicket_taken.player_out ) ) is not null
then ( sum( coalesce( batsman_scored.runs_scored, 0 ) ) / count( wicket_taken.player_out ) )
when ( sum( coalesce( batsman_scored.runs_scored, 0 ) ) / count( wicket_taken.player_out ) ) is null
then 1000000000000
end as average
from ball_by_ball
left join batsman_scored on (ball_by_ball.match_id = batsman_scored.match_id and ball_by_ball.over_id = batsman_scored.over_id and ball_by_ball.ball_id = batsman_scored.ball_id and ball_by_ball.innings_no = batsman_scored.innings_no)
left join wicket_taken on (ball_by_ball.match_id = wicket_taken.match_id and ball_by_ball.over_id = wicket_taken.over_id and ball_by_ball.ball_id = wicket_taken.ball_id and ball_by_ball.innings_no = wicket_taken.innings_no)
left join player on (ball_by_ball.bowler = player.player_id)
left join match_match on (ball_by_ball.match_id = match_match.match_id)
where match_match.season_id = 5
group by match_match.season_id, ball_by_ball.bowler
order by average, player.player_name
;

select *
from oned
where average in
(select min(average) from oned)
order by player_name
;

drop view oned;