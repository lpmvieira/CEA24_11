with
    source_person as (
        select *
        from {{ source('erp', 'person') }}
    )

    , renomed as (
        select 
            cast(businessentityid as int) as pk_person
            , cast (firstname as varchar) as firstname_person
            , cast (lastname as varchar) as lastname_person
            , concat(firstname, ' ', lastname) as fullname_person
        from source_person
    )

select *
from renomed