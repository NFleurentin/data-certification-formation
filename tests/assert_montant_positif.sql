SELECT
    commande_id,
    montant
FROM
    {{ref ('stg_orders')}}
WHERE
    montant <= 0