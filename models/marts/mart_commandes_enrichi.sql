WITH
    commandes AS (
        SELECT
            *
        FROM
            {{ref ('stg_orders')}}
    ),
    statuts AS (
        SELECT
            *
        FROM
            {{ref ('statuts_commande')}}
    )
SELECT
    c.commande_id,
    c.client_id,
    c.montant,
    s.libelle AS statut_libelle,
    s.est_paye
FROM
    commandes c
    LEFT JOIN statuts s ON c.statut = s.statut