{{
    config(
        materialized='table'
    )
}}

with rcte as
(select 1 as n
union all
select n+1 from rcte
where n<5)
select *
from rcte