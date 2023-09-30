with source as (
    select * from {{source('sf1','vw_account')}}
), 
renamed as (

select 
Id as ID,
name as name
MD_Source as MD_SOURCE
from source
)

select * from renamed
