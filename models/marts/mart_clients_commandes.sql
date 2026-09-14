WITH
clients AS (
    SELECT *
    FROM
        {{ ref ('stg_customers') }}
),

commandes AS (
    SELECT *
    FROM
        {{ ref ('stg_orders') }}
)

SELECT
    c.client_id,
    c.prenom,
    c.nom,
    count(co.commande_id) AS nombre_commandes,
    sum(co.montant) AS montant_total,
    {{ safe_divide('montant_total', 'nombre_commandes') }} AS panier_moyen
FROM
    clients AS c
LEFT JOIN commandes AS co ON c.client_id = co.client_id
GROUP BY
    c.client_id,
    c.prenom,
    c.nom
