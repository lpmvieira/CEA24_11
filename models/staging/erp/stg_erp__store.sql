with
    source_store as (
        select *
        from {{ source('erp', 'store') }}
    )

    , renomed as (
        select 
            cast(businessentityid as int) as pk_store
            , cast (name as varchar) as name_store
        from source_store
    )

select *
from renomed