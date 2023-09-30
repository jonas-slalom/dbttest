with source as (
    select * from {{source('sf1','vw_account')}}
), 
renamed as (

select 
{{ dbt_utils.generate_surrogate_key(['ID', 'LASTMODIFIEDDATE']) }} AS ACCOUNT_KEY
Id as ID,
name as name,
LASTMODIFIEDDATE AS LAST_MODIFIED_DATE,
MD_Source as MD_SOURCE
from source
)

select * from renamed
