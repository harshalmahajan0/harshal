{{
    config(
        materialized='table',
        transient = false
    )
}}

with cte1 as
(select *
from {{ source('PRACTICE', 'JSON_DATA') }})
select data as raw_json,
filename,
load_date
from cte1