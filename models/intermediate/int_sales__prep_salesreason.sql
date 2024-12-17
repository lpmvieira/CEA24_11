with
    salesorderheadersalesreason as (
        select *
        from {{ ref('stg_erp__salesorderheadersalesreason') }}
    )
    
    , salesreason as (
        select *
        from {{ ref('stg_erp__salesreason') }}
    )

    , joined_salesreason as (
        select
            {{ 
                dbt_utils.generate_surrogate_key(['id_salesorderreason', 'pk_salesreason'])
            }} as sk_salesreason
            , salesorderheadersalesreason.id_salesorderreason
            , salesreason.pk_salesreason
            , salesreason.name_salesreason
            , salesreason.name_reasontype
        from salesorderheadersalesreason
        left join salesreason on salesorderheadersalesreason.fk_salesreason = salesreason.pk_salesreason
    )

select *
from joined_salesreason