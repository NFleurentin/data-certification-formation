{% macro count_by_status(statuses) %}
    {% for s in statuses %}
        COUNT(CASE WHEN statut = '{{ s }}' THEN 1 END) AS nb_{{ s }}{% if not loop.last %},{% endif %}
    {% endfor %}
{% endmacro %}