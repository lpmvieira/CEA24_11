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
            address.id_address
            , address.city
            , stateprovince.stateprovince_name
            , stateprovince.stateprovince_contryregioncode
            , countryregion.countryregion_name
        from address
        left join stateprovince on address.id_address = stateprovince.pk_stateprovince
        left join countryregion on stateprovince.stateprovince_contryregioncode = countryregion.pk_countryregion
    )

select *
from joined_address