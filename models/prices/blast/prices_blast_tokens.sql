{{ config(
        schema='prices_blast',
        alias = 'tokens',
        materialized='table',
        file_format = 'delta',
        tags=['static']
        )
}}
SELECT
    token_id
    , blockchain
    , symbol
    , contract_address
    , decimals
FROM
(
    VALUES
    ('weth-weth','blast','WETH',0x4300000000000000000000000000000000000004,18),
    ('usdb-usdb','blast','USDB',0x4300000000000000000000000000000000000003,18),
    ('weth-weth', 'blast', 'bpETH', 0xb772d5c5f4a2eef67dfbc89aa658d2711341b8e5, 18),
    ('yolo-yolo-games','blast','YOLO',0xf77dd21c5ce38ac08786be35ef1d1dec1a6a15f3,18)    
) as temp (token_id, blockchain, symbol, contract_address, decimals)
