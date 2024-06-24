{{
    config(
        alias='bot_users',
        schema='soul_sniper_solana',
        materialized='incremental',
        file_format='delta',
        incremental_strategy='merge',
        unique_key='user'
    )
}}

{% set project_start_date = '2024-01-06' %}
{% set fee_receiver = '6MgcmcZJXfyux7rRSsvjWaG8iegQ29KLxMtWHKoCZ7fn' %}


select distinct
    signer as user
from {{ source('solana', 'account_activity') }} as activity
inner join {{ source("solana", "transactions") }} as transactions
    on tx_id = id
    and transactions.block_time = activity.block_time
    {% if is_incremental() %}
    and {{ incremental_predicate('activity.block_time') }}
    and {{ incremental_predicate('transactions.block_time') }}
    {% else %}
    and activity.block_time >= timestamp '{{project_start_date}}'
    and transactions.block_time >= timestamp '{{project_start_date}}'
    {% endif %}
where
    tx_success
    and balance_change > 0
    and address = '{{fee_receiver}}'
