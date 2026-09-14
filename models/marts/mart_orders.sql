{{
    config (
        materialized = 'incremental',
        unique_key = 'commande_id'
    )
}}
SELECT
    commande_id,
    client_id,
    montant,
    statut,
    date_commande,
    _loaded_at
FROM
    {{ ref('stg_orders') }}

{% if is_incremental() %}
    WHERE _loaded_at > (SELECT MAX(_loaded_at) FROM {{ this }})
{% endif %}
