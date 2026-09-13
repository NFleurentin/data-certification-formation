WITH
    source AS (
        SELECT
            *
        FROM
            {{source ('raw', 'customers')}}
    ),
    renamed AS (
        SELECT
            id AS client_id,
            first_name AS prenom,
            last_name AS nom,
            lower(email) AS email,
            created_at AS date_creation
        FROM
            source
    )
SELECT
    *
FROM
    renamed