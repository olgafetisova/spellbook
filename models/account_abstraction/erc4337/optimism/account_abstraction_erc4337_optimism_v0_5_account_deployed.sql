{{ config
(
    alias = 'v0_5_account_deployed',
    
    partition_by = ['block_month'],
    materialized = 'incremental',
    file_format = 'delta',
    incremental_strategy = 'merge',
    unique_key = ['userop_hash', 'tx_hash']
)
}}


-- macros/models/sector/erc4337
{{
    erc4337_account_deployed(
        blockchain = 'optimism',
        version = 'v0.5',
        account_deployed_evt_model = source('erc4337_optimism','EntryPoint_evt_AccountDeployed'),
    )
}}