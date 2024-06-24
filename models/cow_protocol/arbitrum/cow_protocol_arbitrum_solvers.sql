{{ config(
        schema = 'cow_protocol_arbitrum',
        alias='solvers',
        post_hook='{{ expose_spells(blockchains = \'["arbitrum"]\',
                                    spell_type = "project",
                                    spell_name = "cow_protocol",
                                    contributors = \'["olgafetisova"]\') }}'
)}}

-- Find the PoC Query here: https://dune.com/queries/3840597
WITH
-- Aggregate the solver added and removed events into a single table
-- with true/false for adds/removes respectively
solver_activation_events as (
    select solver, evt_block_number, evt_index, True as activated
    from {{ source('gnosis_protocol_v2_arbitrum', 'GPv2AllowListAuthentication_evt_SolverAdded') }}
    union
    select solver, evt_block_number, evt_index, False as activated
    from {{ source('gnosis_protocol_v2_arbitrum', 'GPv2AllowListAuthentication_evt_SolverRemoved') }}
),
-- Sorting by (evt_block_number, evt_index) allows us to pick the most recent activation status of each unique solver
ranked_solver_events as (
    select
        rank() over (partition by solver order by evt_block_number desc, evt_index desc) as rk,
        solver,
        evt_block_number,
        evt_index,
        activated as active
    from solver_activation_events
),
registered_solvers as (
    select solver, active
    from ranked_solver_events
    where rk = 1
),
-- Manually inserting environment and name for each "known" solver
known_solver_metadata (address, environment, name) as (
    SELECT *
    FROM (VALUES
                 (0xA70892d1Af41aBD2F648FEC74Ea2c17e56Ac3B9A, 'prod', 'Naive'),
                (0xba36CEfb45d1CdD2Ae30a899C432c5081E095Ff8, 'prod', 'Baseline'),
                (0xF017C6F66D68d11AF00FD243494E3fa0EBf44C66, 'prod', 'Quasimodo'),
                (0x001088C88be46346ED99856dcfA3a00Da7AAf212, 'prod', '1Inch'),
                (0xc46Ac109FDe084192BE59C24C3680D818763b0fd, 'prod', 'ParaSwap'),
                (0xD31E0CE8154Da6b8086d961eB3068Ef74C4322b6, 'prod', '0x'),
                (0xAa224676d096B6Fc257F8C386C67d9e96e53AD59, 'prod', 'BalancerSOR'),
                (0x5932b2c05172aAfE097CE0Fbd27d18a7d5A45eE1, 'prod', 'Furucombo'),
                (0x3A485742Bd85e660e72dE0f49cC27AD7a62911B5, 'prod', 'SeaSolver'),
                (0x059aefdF9d9F47def37cF7066DA83fEB91fDd089, 'prod', 'Barter'),
                (0x40798d2261f8b7F11BFa73623c99C876844dD05A, 'prod', 'OpenOcean'),
                (0x0648548f891E1356f197070D009704e574182bfB, 'prod', 'Rizzolver'),
                (0x20dC1014E946Cf511Ee535D908eC9a1d75Dd66ce, 'barn', 'Naive'),
                (0x2e6822f4Ab355E386d1A4fd34947ACE0F6f344a7, 'barn', 'Baseline'),
                (0x03a65D265E0613326ca23f5E6A1a99Ab2F12600B, 'barn', 'Quasimodo'),
                (0xee10E8D38150BEe3b0B32c41b74821d6e7Da485A, 'barn', '1Inch'),
                (0x9C803d345615aDe1e5ae07A789968403fAc9171a, 'barn', 'ParaSwap'),
                (0x69433b336952e84Db44EF40b16B338F139B8baA1, 'barn', '0x'),
                (0xCED55FC88186f672105712fe177374cce4861FDF, 'barn', 'BalancerSOR'),
                (0xE376a730037D8B495864FD5ed6373BE89643cD06, 'barn', 'Furucombo'),
                (0x2633bd8e5FDf7C72Aca1d291CA11bdB717A6aa3d, 'barn', 'SeaSolver'),
                (0x7B0211286d8Dfdb717f4A2E5Fa5131eD911097e1, 'barn', 'Barter'),
                (0xc8371B2898FBaEeAe658f9FaeE8ddeDA24e37012, 'barn', 'OpenOcean'),
                (0x2aeC288B42C99D2e8e984c5C324FB069f7705186, 'barn', 'Rizzolver')
         ) as _
)
-- Combining the metadata with current activation status for final table
select solver as address,
      case when environment is not null then environment else 'new' end as environment,
      case when name is not null then name else 'Uncatalogued' end      as name,
      active
from registered_solvers
    left outer join known_solver_metadata on solver = address;
