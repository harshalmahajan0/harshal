
with cte1 as
(select *
from SNOWFLAKE_PROJECT.PRACTICE.JSON_DATA)
select data as raw_json,
filename,
load_date
from cte1