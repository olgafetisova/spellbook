{{ config(
	tags=['legacy'],
	
    schema = 'nft',
    alias = alias('events', legacy_model=True),
    partition_by = ['block_date'],
    materialized = 'incremental',
    file_format = 'delta',
    incremental_strategy = 'merge',
    unique_key = ['unique_trade_id', 'blockchain'],
    post_hook='{{ expose_spells(\'["ethereum","solana","bnb","optimism","arbitrum","polygon"]\',
                    "sector",
                    "nft",
                    \'["soispoke","0xRob", "hildobby"]\') }}')
}}

SELECT
    blockchain,
    project,
    version,
    block_date,
    block_time,
    token_id,
    collection,
    amount_usd,
    token_standard,
    trade_type,
    number_of_items,
    trade_category,
    evt_type,
    seller,
    buyer,
    amount_original,
    amount_raw,
    currency_symbol,
    currency_contract,
    nft_contract_address,
    project_contract_address,
    aggregator_name,
    aggregator_address,
    tx_hash,
    block_number,
    tx_from,
    tx_to,
    platform_fee_amount_raw,
    platform_fee_amount,
    platform_fee_amount_usd,
    platform_fee_percentage,
    royalty_fee_receive_address,
    royalty_fee_currency_symbol,
    royalty_fee_amount_raw,
    royalty_fee_amount,
    royalty_fee_amount_usd,
    royalty_fee_percentage,
    unique_trade_id
FROM {{ ref('nft_ethereum_trades_beta_ported_legacy')}}
{% if is_incremental() %}
WHERE block_time >= date_trunc("day", now() - interval '1 week')
{% endif %}
UNION ALL
SELECT blockchain,
    project,
    version,
    block_date,
    block_time,
    token_id,
    collection,
    amount_usd,
    token_standard,
    trade_type,
    number_of_items,
    trade_category,
    evt_type,
    seller,
    buyer,
    amount_original,
    amount_raw,
    currency_symbol,
    currency_contract,
    nft_contract_address,
    project_contract_address,
    aggregator_name,
    aggregator_address,
    tx_hash,
    block_number,
    tx_from,
    tx_to,
    platform_fee_amount_raw,
    platform_fee_amount,
    platform_fee_amount_usd,
    platform_fee_percentage,
    royalty_fee_receive_address,
    royalty_fee_currency_symbol,
    royalty_fee_amount_raw,
    royalty_fee_amount,
    royalty_fee_amount_usd,
    royalty_fee_percentage,
    unique_trade_id
FROM {{ref('nft_events_old_legacy')}}
WHERE (project, version, blockchain) not in (SELECT distinct project, version, blockchain FROM {{ref('nft_ethereum_trades_beta_ported_legacy')}})
{% if is_incremental() %}
AND block_time >= date_trunc("day", now() - interval '1 week')
{% endif %}


