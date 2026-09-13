WITH
    clients AS (
        SELECT
            *
        FROM
            {{ref ('stg_customers')}}
    ),
    commandes AS (
        SELECT
            *
        FROM
            {{ref ('stg_orders')}}
    )
SELECT
    c.client_id,
    c.prenom,
    c.nom,
    COUNT(co.commande_id) AS nombre_commandes,
    SUM(co.montant) AS montant_total
FROM
    clients c
    LEFT JOIN commandes co ON c.client_id = co.client_id
GROUP BY
    c.client_id,
    c.prenom,
    c.nom