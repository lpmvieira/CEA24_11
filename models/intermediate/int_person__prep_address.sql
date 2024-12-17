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

    , joined_address as (
        select
            {{ 
                dbt_utils.generate_surrogate_key(['id_address', 'modifieddate'])
            }} as sk_address
            , address.id_address
            , address.city
            , address.postalcode
            , address.spatialLocation
            , address.modifieddate
            , stateprovince.stateprovince_name
            , stateprovince.stateprovince_contryregioncode
            , countryregion.countryregion_name
        from address
        left join stateprovince on address.id_address = stateprovince.pk_stateprovince
        left join countryregion on stateprovince.stateprovince_contryregioncode = countryregion.pk_countryregion
    )

select *
from joined_address