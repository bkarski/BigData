use movielens;
select q.genre as genre, count(1) as counted
from (select explode(split(genres,"\\|")) AS genre from movies) q
group by genre
order by counted desc;

