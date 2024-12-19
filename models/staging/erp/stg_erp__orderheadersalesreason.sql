with
    source_orderheadersalesreason as (
        select *
        from {{ source('erp', 'salesorderheadersalesreason') }}
    )

    , renomed as (
        select 
            cast(salesorderid as int) as id_orderreason
            , cast(salesreasonid as int) as fk_reason
        from source_orderheadersalesreason
    )

select *
from renomed