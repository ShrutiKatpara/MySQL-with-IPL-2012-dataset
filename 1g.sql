create view oneg as
select player.player_name as batsman, player.country_name, sum( coalesce(runs_scored,0) ) / count( distinct( ball_by_ball.match_id)) as average
from ball_by_ball
left join batsman_scored on (ball_by_ball.match_id = batsman_scored.match_id and ball_by_ball.over_id = batsman_scored.over_id and ball_by_ball.ball_id = batsman_scored.ball_id and ball_by_ball.innings_no = batsman_scored.innings_no)
left join player on (ball_by_ball.striker = player.player_id)
group by striker
;

select country_name,sum(average)/count( distinct(batsman)) as country_avg
from oneg
group by country_name
order by country_avg desc
limit 3
;

drop view oneg;