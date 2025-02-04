{#
select filename,
sum(case when extra_type='legbyes' then runs_extras end) as legbyes_runs,
sum(case when extra_type='byes' then runs_extras end) as byes_runs,
sum(case when extra_type='wides' then runs_extras end) as wides_runs,
sum(case when extra_type='noballs' then runs_extras end) as noballs_runs,
from {{ ref('int_match_innings') }}
group by 1
#}

{% set v_extra_type = ['legbyes','byes','wides','noballs'] %}
{#
select filename
{% for extra in v_extra_type %}
,sum(case when extra_type='{{extra}}' then runs_extras end) as {{extra}}_runs
{% endfor %}
from {{ ref('int_match_innings') }}
group by 1
#}

select filename
 {{ pivot_columns(v_extra_type, 'extra_type' , 'runs_extras' ) }}
from {{ ref('int_match_innings') }}
group by 1