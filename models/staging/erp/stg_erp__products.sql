with
    source_products as (
        select *
        from {{ source('erp', 'product') }}
    )

    , renomed as (
        select 
            cast(productid as int) as id_product
            , cast(name as varchar) as name_product  
            , cast(listprice as numeric(18,2)) as listprice
            , cast(sellstartdate as date) as  sellstartdate
            , cast(sellenddate as date) as  sellenddate
        from source_products
    )

select *
from renomed