with
    source_salesreason as (
        select *
        from {{ source('erp', 'salesreason') }}
    )

    , renomed as (
        select 
            cast(salesreasonid as int) as pk_salesreason
            , cast(name as varchar) as name_salesreason
            , cast(reasontype as varchar) as name_reasontype
        from source_salesreason
    )

select *
from renomed