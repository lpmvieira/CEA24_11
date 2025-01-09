with
    source_address as (
        select *
        from {{ source('erp', 'address') }}
    )

    , renomed as (
        select 
            cast(addressid as int) as id_address
            , cast(city as varchar) as city  
        from source_address
    )

select *
from renomed