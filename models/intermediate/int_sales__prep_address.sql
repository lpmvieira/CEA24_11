with
    address as (
        select *
        from {{ ref('stg_erp__address') }}
    )
    
    , stateprovince as (
        select *
        from {{ ref('stg_erp__stateprovince') }}
    )

    , countryregion as (
        select *
        from {{ ref('stg_erp__countryregion') }}
    )

    , full_address as (
        select
            address.pk_address
            , address.city
            , address.postalcode
            , address.spatialLocation
            , stateprovince.stateprovince_name
            , countryregion.pk_countryregion
            , countryregion.countryregion_name
        from address
        left join stateprovince on address.pk_address = stateprovince.pk_stateprovince
        left join countryregion on stateprovince.pk_stateprovince = countryregion.pk_countryregion
    )

select *
from full_address