with
    source_creditcard as (
        select *
        from {{ source('erp', 'creditcard') }}
    )

    , renomed as (
        select 
            cast(creditcardid as int) as pk_creditcard
            , cast(cardtype as varchar) as card_type
        from source_creditcard
    )

select *
from renomed