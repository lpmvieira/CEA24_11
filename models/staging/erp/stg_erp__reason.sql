with
    source_reason as (
        select *
        from {{ source('erp', 'salesreason') }}
    )

    , renomed as (
        select 
            cast(salesreasonid as int) as pk_reason
            , cast(name as varchar) as name_reason
            , cast(reasontype as varchar) as name_reasontype
        from source_reason
    )

select *
from renomed