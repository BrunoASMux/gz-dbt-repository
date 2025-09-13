WITH sales AS (
    SELECT *
    FROM {{ ref('stg_raw__sales') }}
),

products AS (
    SELECT *
    FROM {{ ref('stg_raw__product') }}
)

SELECT
    s.*,
    p.*,
    s.quantity * p.purchase_price AS purchase_cost,
    ROUND(s.revenue - (s.quantity * p.purchase_price),2) AS margin
FROM sales s
JOIN products p
    ON s.products_id = p.products_id