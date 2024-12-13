with
    source_stateprovince as (
        select *
        from {{ source('erp', 'stateprovince') }}
    )

    , renomed as (
        select 
            cast(stateprovinceid as int) as pk_stateprovince
            , cast(name as varchar) as stateprovince_name  
        from source_stateprovince
    )

select *
from renomed