SELECT
    client_id,
    {{ count_by_status(['completed', 'pending']) }}
FROM
    {{ ref('stg_orders') }}
GROUP BY
    client_id
