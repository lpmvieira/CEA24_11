with
    source_products as (
        select *
        from {{ source('erp', 'product') }}
    )

    , renomeado as (
        select 
            cast(productid as int) as pk_product
            , cast(name as varchar) as name_product  
            , cast(listprice as numeric(18,2)) as listprice
            , cast(sellstartdate as date) as  sellstartdate
            , cast(modifieddate as date) as  modifieddate
        from source_products
    )

select *
from renomeado