{{ config(
        alias ='erc721_agg_day',
        materialized ='incremental',
        file_format ='delta',
        incremental_strategy='merge',
        unique_key='unique_transfer_id'
        )
}}

select
    'ethereum' as blockchain,
    date_trunc('day', evt_block_time) as day,
    wallet_address,
    token_address,
    tokenId,
    unique_tx_id || '-' || wallet_address || '-' || token_address || tokenId as unique_transfer_id
from {{ ref('transfers_ethereum_erc721') }}
{% if is_incremental() %}
-- this filter will only be applied on an incremental run
where evt_block_time > now() - interval 2 days
{% endif %}
group by
    date_trunc('day', evt_block_time), wallet_address, token_address, tokenId,unique_tx_id
having sum(amount) = 1