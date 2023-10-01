{% snapshot account_snapshot %}

{{
    config(
      target_database='dev_sandbox',
      target_schema='jallaire',
      unique_key='ACCOUNT_KEY',
      strategy='timestamp',
      updated_at='LAST_MODIFIED_DATE',
      tags=["core","int"],
    )
}}

select * from {{ ref('vw_int_account') }}

{% endsnapshot %}

