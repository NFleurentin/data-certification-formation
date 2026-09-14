WITH
    source AS (
        SELECT
            *
        FROM
            {{source ('raw', 'orders')}}
    ),
    renamed AS (
        SELECT
            order_id AS commande_id,
            customer_id AS client_id,
            amount AS montant,
            status AS statut,
            order_date AS date_commande,
            _loaded_at
        FROM
            source
    )
SELECT
    *
FROM
    renamed