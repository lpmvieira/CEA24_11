with
    source_orderdetail as (
        select *
        from {{ source('erp', 'salesorderdetail') }}
    )

    , renomed as (
        select 
            cast(salesorderdetailid as int) as pk_orderdetail
            , cast(salesorderid as int) as fk_orderid
            , cast(productid as int) as fk_product  
            , cast(orderqty as int) as orderqty  
            , cast(unitprice as numeric(18,4)) as unitprice
            , cast(unitpricediscount as numeric(18,2)) as discount
        from source_orderdetail
    )

select *
from renomed