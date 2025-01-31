with cte1 as
(select z.value::varchar as player_name,
y.key as team_name
from {{ ref('cricket_raw_data') }} x,
lateral flatten (input => x.raw_json:info.players) y,
lateral flatten (input => y.value) z
group by all)
select x.*,
y.date_of_birth,
y.gender,
y.batting_style,
y.bowling_style,
y.position
from cte1 x
left join {{ ref('stg_player_info') }} y
on x.player_name = y.name