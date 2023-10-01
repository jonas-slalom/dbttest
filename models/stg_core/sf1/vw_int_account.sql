
{{
    config(
        tags = tags=["core","staging"],   
    )
}}

with source as (
    select * from {{source('sf1','vw_account')}}
), 
renamed as (

select 
{{ dbt_utils.generate_surrogate_key(['ID', 'LASTMODIFIEDDATE']) }} AS ACCOUNT_KEY,
Id as ID,
name as name,
LASTMODIFIEDDATE AS LAST_MODIFIED_DATE,
MD_SOURCE as MD_SOURCE,
md_insert_date AS MD_STG_LOADED_DATE
from source
)

select * from renamed
