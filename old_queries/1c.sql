select venue, extra_type, count(*)
from match_match
natural join extra_runs
where extra_type = "legbyes"
group by venue
order by count(*) desc, venue
;

group by venue
having max(count(*))
;