with first_yr_prod as
(
    select 
        product_id
        , min(year) as first_year
    from 
        Sales
    group by 1
)
select 
    f.product_id
    , f.first_year
    , s.quantity
    , s.price
from 
    Sales s join first_yr_prod f on s.product_id = f.product_id and s.year = f.first_year