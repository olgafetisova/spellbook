{{ config(
	    tags=['legacy'],
        materialized = 'view',
        alias = alias('erc1155_hour', legacy_model=True),
        post_hook='{{ expose_spells_hide_trino(\'["ethereum"]\',
                                            "sector",
                                            "balances",
                                            \'["soispoke"]\') }}'
        )
}}

with
    hours as (
        select
            explode(
                sequence(
                    to_date('2015-01-01'), date_trunc('hour', now()), interval 1 hour
                )
            ) as hour
    )

, hourly_balances as
 (SELECT
    b.wallet_address,
    b.token_address,
    b.tokenId,
    b.hour,
    b.amount, 
    lead(b.hour, 1, now()) OVER (PARTITION BY b.wallet_address, b.token_address, b.tokenId ORDER BY hour) AS next_hour
FROM {{ ref('transfers_ethereum_erc1155_rolling_hour_legacy') }} b
)

SELECT 
    'ethereum' as blockchain,
    d.hour,
    b.wallet_address,
    b.token_address,
    b.tokenId,
    SUM(b.amount) as amount,
    nft_tokens.name as collection
FROM hourly_balances b
INNER JOIN hours d ON b.hour <= d.hour AND d.hour < b.next_hour
LEFT JOIN {{ ref('tokens_nft_legacy') }} nft_tokens ON nft_tokens.contract_address = b.token_address
AND nft_tokens.blockchain = 'ethereum'
GROUP BY 1, 2, 3, 4, 5, 7
HAVING SUM(b.amount) > 0
