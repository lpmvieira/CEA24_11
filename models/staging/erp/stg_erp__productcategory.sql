with
    source_productcategory as (
        select *
        from {{ source('erp', 'productcategory') }}
    )

    , renomed as (
        select 
            cast(productcategoryid as int) as pk_productcategory
            , cast(name as varchar) as name_category  
        from source_productcategory
    )

select *
from renomed