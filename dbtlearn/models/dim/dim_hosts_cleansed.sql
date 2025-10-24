{{
    config(
        materialized = 'view'
    )
}}
WITH src_hosts AS (
    SELECT * FROM {{ ref('src_hosts') }}
)
SELECT
    host_id,
    NVL(
        host_name,
        'Anonymous'
    ) AS host_name,
    -- IFF(is_superhost = 't', TRUE, FALSE ) as is_superhost, -- changing schema to test contracts
    is_superhost,
    created_at,
    updated_at

FROM src_hosts