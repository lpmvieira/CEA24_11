with
    orderheadersalesreason as (
        select *
        from {{ ref('stg_erp__orderheadersalesreason') }}
    )
    
    , reason as (
        select *
        from {{ ref('stg_erp__reason') }}
    )

    , joined_reason as (
        select
            {{ 
                dbt_utils.generate_surrogate_key(['id_orderreason', 'pk_reason'])
            }} as sk_reason
            , orderheadersalesreason.id_orderreason
            , reason.pk_reason
            , reason.name_reason
            , reason.name_reasontype
        from orderheadersalesreason
        left join reason on orderheadersalesreason.fk_reason = reason.pk_reason
    )

select *
from joined_reason