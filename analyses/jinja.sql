{% set myname = 'Harshal' %}

{{myname}}

{% set mytool = ['sql','python','tableau'] %}

{{mytool}}

{#
{% for tools in mytool %}
    my favourite tool is {{tools}}
{% endfor %} #}

{% for tool in mytool %}
    {% if tool=='tableau' %}
        my favourite tool is {{tool}}
    {% else %}
       {{tool}} is not favourite tool
    {% endif %}
{% endfor %}