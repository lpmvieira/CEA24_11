with
    customer as (
        select *
        from {{ ref('stg_erp__customer') }}
    )

    , store as (
        select *
        from {{ ref('stg_erp__store') }}
    )
    
    , person as (
        select *
        from {{ ref('stg_erp__person') }}
    )

    , personcreditcard as (
        select *
        from {{ ref('stg_erp__personcreditcard') }}
    )

    , creditcard as (
        select *
        from {{ ref('stg_erp__creditcard') }}
    )

    , joined_customer as (
        select
            {{ 
                dbt_utils.generate_surrogate_key(['id_customer', 'modifieddate'])
            }} as sk_customer
            , customer.id_customer
            , customer.modifieddate
            , store.name_store
            , person.firstname_person
            , person.lastname_person
            , person.fullname_person
            , creditcard.card_type
        from customer
        left join store on customer.fk_store = store.pk_store
        left join person on customer.fk_person = person.pk_person
        left join personcreditcard on person.pk_person = personcreditcard.pk_personcreditcard
        left join creditcard on personcreditcard.fk_creditcard = creditcard.pk_creditcard
    )

select *
from joined_customer