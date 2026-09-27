# Target — E-commerce Business Case Study (Olist Dataset, Brazil)

## Project Overview

This project analyzes Target's Brazil e-commerce operations using the Olist multi-table dataset,
covering customers, orders, order items, payments, reviews, sellers, products, and geolocation.
The analysis explores order trends, customer distribution, payment behavior, delivery
performance, and freight costs, and closes with actionable business recommendations.

- **Tool used:** Google BigQuery (SQL)
- **Tables used:** `customers`, `orders`, `order_items`, `payments`, `products`, `sellers`,
  `order_reviews`, `geolocation`

## Schema Diagram

```
olist_order_payments_dataset          olist_products_dataset
            ▲                                  ▲
        order_id                          product_id
            │                                  │
olist_order_reviews_dataset ──order_id──► olist_orders_dataset ──order_id──► olist_order_items_dataset ──seller_id──► olist_sellers_dataset
                                            │                                                                              ▲
                                        customer_id                                                                   zip_code_prefix
                                            │                                                                              │
                                   olist_order_customer_dataset ──────────────zip_code_prefix──────────────► olist_geolocation_dataset
```

- `orders` is the central table, linking to `customers` (via `customer_id`), `order_items`
  (via `order_id`), `order_payments` (via `order_id`), and `order_reviews` (via `order_id`).
- `order_items` links to `products` (via `product_id`) and `sellers` (via `seller_id`).
- `sellers` and `customers` both link to `geolocation` via `zip_code_prefix`.

## Folder structure

```
Target Business Case Study project/
├── README.md              <- this file (project overview + schema)
├── SQL Queries/             <- one .sql file per analysis question
└── Insights/                 <- one .md file per analysis question, with output + findings
```

## Key Findings (TL;DR)

- **Explosive growth:** Orders grew from ~329 (2016, partial) to ~45K (2017) to ~54K (Jan–Oct 2018 alone) — already surpassing all of 2017. Payment value grew **136.98%** YoY (Jan–Aug 2017 vs. 2018).
- **Geographic concentration:** São Paulo (SP) dominates — **41.92%** of all unique customers and the top 10 highest-volume months, by far. RJ and MG are a distant #2 and #3.
- **Peak seasonality:** November, January, and March see the highest order volume — Target should stock up 3–4 months ahead of these windows.
- **Buying behavior:** 99%+ of orders are placed via **Phone equivalent (credit card)** for payment, and most customers pay in a **single installment** rather than splitting payments.
- **Logistics gap:** Remote states (RR, AP, AM, AL, PA) have both the **highest average delivery time** (23–29 days) and a **smaller customer base** — while SP, PR, MG have the fastest delivery (~8–12 days). This points to a direct link between logistics investment and market growth potential.
- **Freight cost imbalance:** Remote states (RR, PB, RO, AC, PI) also pay the **highest freight costs**, compounding the delivery-time disadvantage for customers there.
- **Data quality issue found:** Some orders marked `'delivered'` have NULL approval/delivery timestamps — a data integrity gap flagged with a concrete process fix recommendation.
- **Actionable recommendation:** Prioritize logistics/warehouse investment in underserved, high-delivery-time states to reduce delivery time and unlock customer growth there.

## Analysis Sections

1. **Exploratory Analysis** — table structure, order date range, customer city/state counts
2. **In-Depth Exploration** — yearly order trend, monthly seasonality, time-of-day ordering pattern
3. **Evolution of E-commerce in Brazil** — month-on-month orders by state, customer distribution by state
4. **Impact on Economy** — YoY payment growth, order price & freight value by state
5. **Sales, Freight & Delivery Time** — delivery time vs. estimate, top/bottom states by freight and delivery speed
6. **Payments Analysis** — payment type trends, installment behavior
7. **Actionable Insights & Recommendations** — data quality gaps, logistics investment areas, seasonal planning

See the `SQL Queries/` folder for the exact query behind each question, and the `Insights/`
folder for the output table and written findings for each one.
