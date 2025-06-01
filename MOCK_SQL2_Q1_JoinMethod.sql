with Product_table_count as 
(
    select
        count(distinct product_key) as total_products
    from 
        Product
), 
customer_product_counts as
(
    select 
        customer_id
        , count(distinct product_key) as cus_prod_count
    from 
        Customer
    group by 1
)
select 
    c.customer_id 
from 
    customer_product_counts c join Product_table_count p
on c.cus_prod_count = p.total_products 