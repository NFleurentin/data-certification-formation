USE ROLE data_certification__dbt_role;

USE DATABASE data_certification__analytics;

-- Le schéma qui reçoit les données brutes (la couche Bronze)
CREATE SCHEMA IF NOT EXISTS raw;

-- Table clients
CREATE OR REPLACE TABLE raw.customers (
    id INT,
    first_name STRING,
    last_name STRING,
    email STRING,
    created_at TIMESTAMP,
    _loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP () -- date d'arrivée de la donnée
);

INSERT INTO
    raw.customers (id, first_name, last_name, email, created_at)
VALUES
    (
        1,
        'Marc',
        'Dubois',
        'marc.dubois@email.fr',
        '2026-01-10'
    ),
    (
        2,
        'Sophie',
        'Martin',
        'sophie.martin@email.fr',
        '2026-01-12'
    ),
    (
        3,
        'Karim',
        'Benali',
        'karim.benali@email.fr',
        '2026-02-01'
    );

-- Table commandes
CREATE OR REPLACE TABLE raw.orders (
    order_id INT,
    customer_id INT,
    amount NUMBER (10, 2),
    status STRING,
    order_date DATE,
    _loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ()
);

INSERT INTO
    raw.orders (order_id, customer_id, amount, status, order_date)
VALUES
    (101, 1, 49.90, 'completed', '2026-02-15'),
    (102, 1, 19.90, 'completed', '2026-03-02'),
    (103, 2, 99.00, 'pending', '2026-03-10'),
    (104, 3, 14.99, 'completed', '2026-03-12');