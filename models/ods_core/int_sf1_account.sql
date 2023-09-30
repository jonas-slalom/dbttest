{{ config(materialized="incremental", unique_key="ACCOUNT_KEY") }}

select *, SYSDATE()  as MD_START_DATE
from {{ ref("stg_account") }}
where id is not null
