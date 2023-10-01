{{
    config(
        materialized="incremental",
        unique_key="ACCOUNT_KEY",
        merge_exclude_columns=["md_insert_date"],        
        on_schema_change="append_new_columns",
        incremental_strategy="append",
        tags = tags=["core","int"],
    )
}}

select *, sysdate() as md_loaded_date
from {{ ref("vw_int_account") }}
{% if is_incremental() %}

    -- this filter will only be applied on an incremental run
    -- (uses >= to include records arriving later on the same day as the last run of
    -- this model)
    where md_stg_loaded_date >= (select max(md_stg_loaded_date) from {{ this }})

{% endif %}
