with
    source_address as (
        select *
        from {{ source('erp', 'address') }}
    )

    , renomed as (
        select 
            cast(addressid as int) as pk_address
            , cast(city as varchar) as city  
            , postalcode
            , spatialLocation
        from source_address
    )

select *
from renomed