{{
    config(
        materialized='table',
        transient = false
    )
}}

select y.value::varchar as team_name,
x.raw_json:info.team_type::varchar as team_type
from {{ ref('cricket_raw_data') }} x,
lateral flatten (input => x.raw_json:info.teams) y
group by all