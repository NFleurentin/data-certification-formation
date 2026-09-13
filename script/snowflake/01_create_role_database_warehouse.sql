USE ROLE ACCOUNTADMIN;

-- Un warehouse dédié à dbt, en XSMALL pour ne pas cramer tes crédits
CREATE WAREHOUSE IF NOT EXISTS data_certification__dbt_wh WAREHOUSE_SIZE = 'XSMALL' AUTO_SUSPEND = 60 -- s'éteint après 60s d'inactivité
AUTO_RESUME = TRUE INITIALLY_SUSPENDED = TRUE;

-- La base où dbt va construire tes tables
CREATE DATABASE IF NOT EXISTS data_certification__analytics;

-- Un rôle dédié à dbt
CREATE ROLE IF NOT EXISTS data_certification__dbt_role;

-- On donne au rôle ce qu'il faut pour travailler
GRANT USAGE ON WAREHOUSE data_certification__dbt_wh TO ROLE data_certification__dbt_role;

GRANT ALL ON DATABASE data_certification__analytics TO ROLE data_certification__dbt_role;

GRANT ALL ON ALL SCHEMAS IN DATABASE data_certification__analytics TO ROLE data_certification__dbt_role;

GRANT ALL ON FUTURE SCHEMAS IN DATABASE data_certification__analytics TO ROLE data_certification__dbt_role;

-- On attribue le rôle à ton utilisateur
GRANT ROLE data_certification__dbt_role TO USER ton_utilisateur;