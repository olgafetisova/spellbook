{{
    config(
        schema = 'dackieswap_v2_arbitrum',
        alias = 'base_trades',
        materialized = 'incremental',
        file_format = 'delta',
        incremental_strategy = 'merge',
        unique_key = ['tx_hash', 'evt_index'],
        incremental_predicates = [incremental_predicate('DBT_INTERNAL_DEST.block_time')]
    )
}}

{{
    uniswap_compatible_v2_trades(
        blockchain = 'arbitrum',
        project = 'dackieswap',
        version = '2',
        Pair_evt_Swap = source('dackieswap_v2_arbitrum', 'DackiePair_evt_Swap'),
        Factory_evt_PairCreated = source('dackieswap_v2_arbitrum', 'DackieFactory_evt_PairCreated')
    )
}}
