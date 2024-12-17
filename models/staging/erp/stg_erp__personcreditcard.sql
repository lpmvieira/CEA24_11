with
    source_personcreditcard as (
        select *
        from {{ source('erp', 'personcreditcard') }}
    )

    , renomed as (
        select 
            cast(businessentityid as int) as pk_personcreditcard
            , cast(creditcardid as int) as fk_creditcard
        from source_personcreditcard
    )

select *
from renomed