SELECT
    date_date AS date,
    COUNT(DISTINCT orders_id) AS total_transactions,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) / COUNT(DISTINCT orders_id), 2) AS average_basket,
    ROUND(SUM(operational_margin), 2) AS total_operational_margin,
    ROUND(SUM(purchase_cost),2) AS total_purchase_cost,
    ROUND(SUM(shipping_fee), 2) AS total_shipping_fees,
    ROUND(SUM(logcost), 2) AS total_log_costs,
    SUM(quantity) AS total_quantity_sold
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date
ORDER BY date_date