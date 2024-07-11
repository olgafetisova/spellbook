 {{
  config(
        schema = 'raydium_v4',
        alias = 'trades',
        materialized = 'view',
        post_hook='{{ expose_spells(\'["solana"]\',
                                    "project",
                                    "raydium",
                                    \'["ilemi"]\') }}')
}}

select * from {{ref('dex_solana_trades')}}
where project = 'raydium' and version = 4
