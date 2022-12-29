{% if execute %}
    {% set current_models = [] %}
    {% if graph.nodes.values() is not none %}
        {% for node in graph.nodes.values()%}
            {% do current_models.append(node.name) %}
        {% endfor %}
    {% endif %}
{% endif %}

SELECT *, CONCAT(REPLACE(table_type, 'BASE ',''),CONCAT(' `{{target.database}}.{{target.schema}}','.',CONCAT(table_name,'`'))) AS command
FROM {{target.database}}.{{target.schema}}.INFORMATION_SCHEMA.TABLES
WHERE UPPER(table_name) NOT IN (
{%- for model in current_models -%}
    '{{ model.upper() }}'
    {%- if not loop.last -%} -- to avoid comma in the end of list
        ,
    {% endif %}
{%- endfor -%}
)