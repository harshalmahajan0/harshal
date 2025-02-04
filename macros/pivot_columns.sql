{% macro pivot_columns(input_values,filter_column,agg_column) %}

{% for values in input_values %}
,sum(case when {{filter_column}}='{{values}}' then {{ agg_column }} end) as {{ values }}_runs
{% endfor %}
    
{% endmacro %}