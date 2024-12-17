with
    dim_address as (
        select *
        from {{ ref('int_person__prep_address') }}
    )

select *
from dim_address