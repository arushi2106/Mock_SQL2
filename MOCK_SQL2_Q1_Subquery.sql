with count_products as (
select 
    customer_id
    , count(distinct product_key) as cust_prod
from 
    customer
group by 1
having cust_prod = (select count(product_key) from Product)
)
select customer_id from count_products