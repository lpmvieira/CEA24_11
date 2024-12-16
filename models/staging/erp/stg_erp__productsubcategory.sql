with
    source_productsubcategory as (
        select *
        from {{ source('erp', 'productsubcategory') }}
    )

    , renomed as (
        select 
            cast(productsubcategoryid as int) as pk_productsubcategory
            , cast(productsubcategoryid as varchar) as productsub_category  
            , cast(name as varchar) as name_subcategory 
        from source_productsubcategory
    )

select *
from renomed