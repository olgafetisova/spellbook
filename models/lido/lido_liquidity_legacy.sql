{{ config(
	tags=['legacy'],
	
        alias = alias('liquidity', legacy_model=True),
        post_hook='{{ expose_spells(\'["ethereum", "arbitrum", "optimism"]\',
                                "project",
                                "lido_liquidity",
                                \'["ppclunghe", "gregshestakovlido", "hosuke"]\') }}'
        )
}}

{% set lido_liquidity_models = [
 ref('lido_liquidity_ethereum_kyberswap_pools_legacy'),
 ref('lido_liquidity_arbitrum_kyberswap_pools_legacy'),
 ref('lido_liquidity_optimism_kyberswap_pools_legacy'),
 ref('lido_liquidity_ethereum_uniswap_v3_pools_legacy'),
 ref('lido_liquidity_arbitrum_uniswap_v3_pools_legacy'),
 ref('lido_liquidity_optimism_uniswap_v3_pools_legacy'),
 ref('lido_liquidity_arbitrum_camelot_pools_legacy'),
 ref('lido_liquidity_arbitrum_balancer_pools_legacy'),
 ref('lido_liquidity_optimism_balancer_pools_legacy'),
 ref('lido_liquidity_polygon_balancer_pools_legacy'),
 ref('lido_liquidity_ethereum_balancer_pools_legacy'),
 ref('lido_liquidity_arbitrum_curve_pools_legacy'),
 ref('lido_liquidity_optimism_curve_pools_legacy'),
 ref('lido_liquidity_ethereum_curve_steth_pool_legacy'),
 ref('lido_liquidity_ethereum_curve_steth_conc_pool_legacy'),
 ref('lido_liquidity_ethereum_curve_steth_ng_pool_legacy'),
 ref('lido_liquidity_ethereum_curve_steth_frxeth_pool_legacy'),
 ref('lido_liquidity_ethereum_curve_wsteth_reth_pool_legacy'),
 ref('lido_liquidity_optimism_velodrome_pools_legacy'),
 ref('lido_liquidity_ethereum_maverick_pools_legacy')
] %}


SELECT *
FROM (
    {% for k_model in lido_liquidity_models %}
    SELECT pool_name, 
           pool, 
           blockchain, 
           project, 
           fee, 
           time, 
           main_token, 
           main_token_symbol,
           paired_token, 
           paired_token_symbol, 
           main_token_reserve, 
           paired_token_reserve,
           main_token_usd_reserve, 
           paired_token_usd_reserve, 
           trading_volume
    FROM {{ k_model }}
    {% if not loop.last %}
    UNION ALL
    {% endif %}
    {% endfor %}
)
;