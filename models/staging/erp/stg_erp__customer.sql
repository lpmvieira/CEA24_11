with
    source_customer as (
        select *
        from {{ source('erp', 'customer') }}
    )

    , renomed as (
        select 
            cast(customerid as int) as id_customer
            , cast(personid as int) as fk_person  
            , cast(storeid as int) as fk_store
            , cast (modifieddate as timestamp) as modifieddate
        from source_customer
    )

select *
from renomed