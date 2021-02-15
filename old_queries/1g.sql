create view all_player_avg as 
select striker, player_name, country_name, sum(runs_scored) as total_runs, count(match_id) as num_of_matches, sum(runs_scored)/count(match_id) as average
from ball_by_ball
natural join batsman_scored
inner join player on player.player_id = ball_by_ball.striker
group by striker
;

select country_name, sum(average)/count(player_name) as country_avg
from all_player_avg
group by country_name
order by sum(average)/count(player_name) desc
limit 3
;

select * from all_player_avg;

drop view all_player_avg;