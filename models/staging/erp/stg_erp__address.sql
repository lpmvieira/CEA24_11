with
    source_address as (
        select *
        from {{ source('erp', 'address') }}
    )

    , renomed as (
        select 
            cast(addressid as int) as id_address
            , cast(city as varchar) as city  
            , cast(postalcode as varchar) as postalcode
            , cast(spatialLocation as varchar) as spatialLocation
            , cast (modifieddate as timestamp) as modifieddate
        from source_address
    )

select *
from renomed