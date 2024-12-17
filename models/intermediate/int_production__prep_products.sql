with
    product as (
        select *
        from {{ ref('stg_erp__products') }}
    )
    
    , productsubcategory as (
        select *
        from {{ ref('stg_erp__productsubcategory') }}
    )

    , productcategory as (
        select *
        from {{ ref('stg_erp__productcategory') }}
    )

    , joined_product as (
        select
            {{ 
                dbt_utils.generate_surrogate_key(['id_product', 'modifieddate'])
            }} as sk_product
            , product.id_product
            , product.name_product
            , product.listprice
            , product.sellstartdate
            , product.sellenddate
            , product.modifieddate
            , productsubcategory.name_subcategory
            , productcategory.name_category
        from product
        left join productsubcategory on product.id_product = productsubcategory.pk_productsubcategory
        left join productcategory on productsubcategory.productsub_category = productcategory.pk_productcategory
    )

select *
from joined_product