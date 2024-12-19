with
    source_calendar  as (
        {{ dbt_date.get_date_dimension("2011-01-01", "2015-01-01")}}
    )

select *
from source_calendar