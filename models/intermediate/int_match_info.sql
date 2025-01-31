select x.raw_json:info.match_type::string as match_type
  ,x.raw_json:info.gender::string as gender
  ,x.raw_json:info.season::string as season
  ,x.raw_json:info.city::string as city
  ,x.raw_json:info.venue::string as venue
  ,x.raw_json:info.dates[0]::date as match_date
  ,x.raw_json:info.teams[0]::string  as team1
  ,x.raw_json:info.teams[1]::string  as team2
  ,x.raw_json:info.toss.winner::string as toss_winner
  ,x.raw_json:info.toss.decision::string as toss_decision
  ,x.raw_json:info.outcome.winner::string as match_winner
  ,case when x.raw_json:info.outcome.by.wickets::string is not null then x.raw_json:info.outcome.by.wickets::string||' wickets' 
    when x.raw_json:info.outcome.by.runs::string is not null then x.raw_json:info.outcome.by.runs::string||' runs' 
    else 'no result'
    end as margin
  ,x.raw_json:info.event.name::string as event_name
  ,x.raw_json:info.team_type::string as event_type
  ,x.raw_json:info.player_of_match[0]::string as pom
  ,filename  
from {{ ref('cricket_raw_data') }} x