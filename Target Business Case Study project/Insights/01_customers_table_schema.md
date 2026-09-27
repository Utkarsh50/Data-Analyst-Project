# Customers Table — Schema Check

**Query:** [`../SQL Queries/01_customers_table_schema.sql`](../SQL%20Queries/01_customers_table_schema.sql)

## Output

| Field name | Type | Mode |
|---|---|---|
| customer_id | STRING | NULLABLE |
| customer_unique_id | STRING | NULLABLE |
| customer_zip_code_prefix | INTEGER | NULLABLE |
| customer_city | STRING | NULLABLE |
| customer_state | STRING | NULLABLE |

## Insights

In the customer table, there are two columns: `customer_id` and `customer_unique_id`. The
`customer_id` is the primary key and uniquely identifies each customer record, while
`customer_unique_id` can appear multiple times in the dataset — indicating that the same customer
may place orders using different profiles or accounts. `customer_zip_code_prefix` tells us the
postal code of the location in Brazil. `customer_city` and `customer_state` tell us the location
of the customer from where they placed the orders.
