with
    source_countryregion as (
        select *
        from {{ source('erp', 'countryregion') }}
    )

    , renomed as (
        select 
             countryregioncode as pk_countryregion
            , cast(name as varchar) as countryregion_name  
        from source_countryregion
    )

select *
from renomed

