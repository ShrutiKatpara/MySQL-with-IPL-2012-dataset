create view onec as
select match_match.venue, count(*) as number_of_legbye_runs
from match_match
natural join extra_runs
where extra_type = "legbyes"
group by venue
order by number_of_legbye_runs desc, venue
;

select *
from onec
where number_of_legbye_runs in
(select max(number_of_legbye_runs) from onec);

drop view onec;