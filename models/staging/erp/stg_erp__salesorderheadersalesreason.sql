with
    source_salesorderheadersalesreason as (
        select *
        from {{ source('erp', 'salesorderheadersalesreason') }}
    )

    , renomed as (
        select 
            cast(salesorderid as int) as id_salesorderreason
            , cast(salesreasonid as int) as fk_salesreason
        from source_salesorderheadersalesreason
    )

select *
from renomed