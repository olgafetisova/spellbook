{{ config(
        alias = alias('fellowship_gallery')
        )
}}

select contract_address, collection_name, artist_name, platform, website
from (VALUES
        ('0x398034c799fad7fdc4695c8eb8bec713ebed9da4','Alessandra Sanguinetti','Alessandra Sanguinetti','Foundation','https://foundation.app/collection/alessandra-sanguinetti'),
        ('0xf25d28271e2b98a1771dfa45c6a3ad65958d4f81','La Calle','Alex Webb','Foundation','https://foundation.app/collection/awlc'),
        ('0x7037843d739d846cdce3a6839a80f7d70b60b99a','ASK10','August Sander','OpenSea','https://looksrare.org/collections/0x7037843d739D846CdCe3A6839A80f7D70b60b99A/'),
        ('0xe76e41c710a3108a292bba0e157e7191ec194e9b','Approximate Joy','Christopher Anderson','Foundation','https://foundation.app/collection/caaj'),
        ('0x7f6f65ee55875efd4cdfbf1ffe85b66039f63878','Pia','Christopher Anderson','Foundation','https://foundation.app/collection/cap-e510'),
        ('0x6ec8055528a6e7f2ae87b87ad31f4af00a57c373','Son','Christopher Anderson','Foundation','https://foundation.app/collection/cas'),
        ('0xdcd918c7d0057c02a4d1eb135ede91252e75892b','This is What Hatred Did','Cristina De Middel','Foundation','https://foundation.app/collection/tiwhd'),
        ('0xfd3f2caf95e81c69bf1c531a5e85836bc2b28419','Amusement Park','David Brandon Geeting','Foundation','https://foundation.app/collection/dbgap'),
        ('0xc1c7fb277d9c75df7cd03327a1b39aadbfb545a3','An Eclipse of Moths','Gregory Crewdson','SuperRare','https://www.superrare.com/gregorycrewdson'),
        ('0x69e734d3a64a430cafde0a380711510bb73df008','Beneath the Roses','Gregory Crewdson','SuperRare','https://www.superrare.com/gregorycrewdson'),
        ('0xbf45d42c7ff2c5c148863ce65e492657e7c6d926','Cathedral of the Pines','Gregory Crewdson','SuperRare','https://www.superrare.com/gregorycrewdson'),
        ('0x4866f5e34ae43987b93a929152eb3b95902bb0ca','Dream House','Gregory Crewdson','SuperRare','https://www.superrare.com/gregorycrewdson'),
        ('0x11665f3fdefff375d32ee7fefe96af56ca0cc502','ZZYZX','Gregory Halpern','Foundation','https://foundation.app/collection/zzyzx-c162'),
        ('0xd0b67acc0e5918192b158c1647dad5782e6f4fb5','Guy Bourdin','Guy Bourdin','SuperRare','https://www.superrare.com/guybourdin'),
        ('0x39c7f19b6014ed56b8937a19d92a09875c279cb8','Wayfarer','Hank Willis Thomas','SuperRare','https://www.superrare.com/hwillisthomas'),
        ('0xfe19a176aecca6fe31b6acc5cacbbd0a3315f422','Aircraft','Jeffrey Millstein','Foundation','https://foundation.app/collection/jma'),
        ('0x76a9ae4e5a2228456a4e9595281ad2731423f162','Raised by Wolves','Jim Goldberg','SuperRare','https://superrare.com/jimgoldberg'),
        ('0xd91d6c723f0bcc1671052e1752a63fe572187d98','35mm Black and white','Joel Meyerowitz','Foundation','https://foundation.app/collection/jm35bw'),
        ('0x1b79b08e750e0feb89960266a41ce52a1fe379ec','Bay Sky','Joel Meyerowitz','Foundation','https://foundation.app/collection/jmbs'),
        ('0xc719f2a34a3368aa7c1155e4a99ed5b7707d5d9b','Between The Dog And The Wolf','Joel Meyerowitz','SuperRare','https://superrare.com/joelmeyerowitz'),
        ('0x77ebeea4b1062a773b042fa509410862c1182400','Early color 1962-63','Joel Meyerowitz','Foundation','https://foundation.app/collection/jmec'),
        ('0xda419087c768248b2edd6654719d5b3b0f9a8690','Empire State','Joel Meyerowitz','Foundation','https://foundation.app/collection/jmes'),
        ('0xeba9e69cb3632054d2d20bd052a9199de4d2f73b','From the car','Joel Meyerowitz','Foundation','https://foundation.app/collection/jmfc'),
        ('0x4635b5a4da92a75a2b456f41ce67ec7b984b88ce','Cape Light','Joel Meyerowitz','SuperRare','https://superrare.com/joelmeyerowitz'),
        ('0x8b4046501dfe1c9eb550ce15a72ea5867f8e61e3','Morandi','Joel Meyerowitz','Foundation','https://foundation.app/collection/jmm'),
        ('0xecef5d0e513f8cb9e3df12a698c9661b19110e5c','Portraits','Joel Meyerowitz','Foundation','https://foundation.app/collection/jmp'),
        ('0x45746feaaf9d30268c8c933613456a956540c0cc','Redheads','Joel Meyerowitz','Foundation','https://foundation.app/collection/jmrh'),
        ('0xd57203e8eb4c72c7df6c35ba1b6c4e8d1f93a45a','Skin of the Street','Joel Meyerowitz','Foundation','https://foundation.app/collection/jmss'),
        ('0x49f62f4adf8e77689ca3020e18227da0a7a6b824','St. Louis','Joel Meyerowitz','Foundation','https://foundation.app/collection/jmstl'),
        ('0xcf6e847b8b606fa8be6bf5406012b2f7e4433806','Still life','Joel Meyerowitz','Foundation','https://foundation.app/collection/jmsl'),
        ('0x49b70a25bbe1e8e4c36366651ec7a6640af9a72a','Street Photography','Joel Meyerowitz','Foundation','https://foundation.app/collection/jmsp'),
        ('0x617f43ca24cffaf6a9bbf077577016d712031d3d','Wildflowers','Joel Meyerowitz','Foundation','https://foundation.app/collection/jmw'),
        ('0x7ff020259c65eb9186b72db8181120b28805224d','First Pictures Collection','Joel Sternfeld','Foundation','https://foundation.app/collection/jsfpc'),
        ('0x4765dfb514d05fae20a5a44ec4dd4b8e4209793b','American Prospects','Joel Sternfeld','SuperRare','https://www.superrare.com/joelsternfeld'),
        ('0x74c47b4e0cf7f181631ecb738ac8bd40577db256','Isolated Houses','John Divola','SuperRare','https://www.superrare.com/johndivola'),
        ('0x5b23b7686f84191000329643a91ce33759005ead','The Book of Veles','Jonas Bendiksen','Foundation','https://foundation.app/collection/jb-3ecd'),
        ('0xe58cd4b63a0cb3db983b1aa46dd62c2e47ed9a63','Boulevard','Katy Grannan','SuperRare','https://www.superrare.com/katygrannan'),
        ('0xf656b98d6fdb1c403fa9c7f7628f57005447f946','Exploded Views','Kevin Cooley','Foundation','https://foundation.app/collection/evkc'),
        ('0xfbd960e3f689962c3440fd0d553f4d7eeeb22608','Laszlo Moholy Nagy','Laszlo Moholy Nagy','SuperRare','https://www.superrare.com/laszlomoholynagy'),
        ('0x9eea8d2379c5073133dda015c48bd7047fc72048','Laurie Simmons','Laurie Simmons','SuperRare','https://www.superrare.com/lauriesimmons'),
        ('0xa280da59cae87b4e2fe17b276210745748496c84','The Elusive Years','Mauricio Alejo','Foundation','https://foundation.app/collection/ma-0ae2'),
        ('0xe0d742e4a5fe8b1519c73a32c7d6612f9bd5853d','Margins of Excess','Max Pinckers','Foundation','https://foundation.app/collection/mpme'),
        ('0x6c0f41bf543d4db04550bffc8fea285b129f868c','Recreation','Mitch Epstein','SuperRare','https://www.superrare.com/mitchepstein'),
        ('0xa03ff7e26135de18bb69a7cf812348d5bba6b8b3','American Power','Mitch Epstein','Foundation','https://foundation.app/collection/meap'),
        ('0x99b00c95ea9039229e5f2aab384eeadeb0d48a40','Frontera','Pablo Lopez Luz','SuperRare','https://superrare.com/pablolopezluz'),
        ('0x0162d2752020355d9880515544467d04a014811f','Terrazo','Pablo Lopez Luz','Foundation','https://foundation.app/collection/pllt'),
        ('0x5198dfdc6efd06db7d3ee7c65e794caadca4296a','Crowded Fields','Pelle Cass','Foundation','https://foundation.app/collection/cfpc'),
        ('0x0cdb0dd8ad3aa79cea6841b36cb16c89707dc96f','Crowded Fields II','Pelle Cass','Foundation','https://foundation.app/collection/cfpcii'),
        ('0xb20e266511eec5462baff2570f4fbb272509c207','Fashion','Pelle Cass','Foundation','https://foundation.app/collection/pcf'),
        ('0xb2f4146e76649ec8f4119117c39b1029e000e4cb','Selected People','Pelle Cass','Foundation','https://foundation.app/collection/sppc'),
        ('0x52095e8a6f684ff8aa53d396d514a09b20c1926e','Self Portraits with Mistakes','Pelle Cass','Foundation','https://foundation.app/collection/pcsm'),
        ('0x987f91abce9158fd86818808505c67842b9ed3eb','Uncrowded Fields','Pelle Cass','Foundation','https://foundation.app/collection/pcuf'),
        ('0xf38b61deb728f25358066370b07a7e9629e5804c','Pieter Hugo','Pieter Hugo','SuperRare','https://www.superrare.com/pieterhugo'),
        ('0x0e1932269fdf59fcc448eb91caac307b79223158','Permanent Error','Pieter Hugo','Foundation','https://foundation.app/collection/phpe'),
        ('0xbdd090bb91638ec0972f5f34480c300a6825a15d','Prisca Munkeni Monnier','Prisca Munkeni Monnier','Foundation','https://foundation.app/collection/pmm'),
        ('0x4f67a5572bb4bc0413acd99462c53afa0d733b09','Relief for Ukraine (SSU)','Stephen Shore','Foundation','https://foundation.app/collection/stephenshoreru'),
        ('0x28398a2c1459119efa3e6699e928612ea4909a13','Our Life in The Shadows','Tania Franco Klein','SuperRare','https://superrare.com/taniafrancoklein'),
        ('0x23e3f2ea133f2c80558e181c4f78f4da3bc7c477','House Hunting','Todd Hido','Foundation','https://foundation.app/collection/thhh'),
        ('0xb8c55c77b3617ef22a4f552f9a47503e021c6623','Roaming','Todd Hido','Foundation','https://foundation.app/collection/thr-00f3')
        , ('0x49e6b0cfb1880fd7afb69c062613238049a4b56b','By Accident - The Negatives','Marcel De Baer','Foundation','https://foundation.app/collection/ngtvs')
        , ('0xe31cc44e305955fa5965addb42641832e9a5502f', 'Light Years - Selection Pass', 'Dmitri Cherniak', 'N/A', 'https://lightyears.fellowship.xyz/')
        , ('0x082dcab372505ae56eafde58204ba5b12ff3f3f5', 'Light Years', 'Dmitri Cherniak', 'N/A', 'https://lightyears.fellowship.xyz/')
        , ('0xd07f39b232e935154748bab2aa3b6c18c926957e', 'La Vie est Belle', 'Prisca Munkeni Monnier', 'Foundation', 'https://foundation.app/collection/pmmvb')
        , ('0x4f248709cfee7f6eb125482509de5bebd40466d3', 'Rescued: Shelter Dog Charity Collection', 'Carlo Van de Roer', 'Foundation', 'https://foundation.app/collection/rsdcc')
        , ('0x0835412b2ac0c74644ee6467f43aca5a848e0bfc', 'End of an Age', 'Paul Graham', 'Foundation', 'https://foundation.app/collection/pgea')
        , ('0x69f55fd1425b8dc3362aed8804a74f64c95c99ad', 'Television Portraits', 'Paul Graham', 'Foundation', 'https://foundation.app/collection/pgtp')
        , ('0x47fa0f531b3cda5d092ca4f90b20d56eaa3f1744', 'Maurizio Anzeri', 'Maurizio Anzeri', 'Foundation', 'https://foundation.app/collection/maurizioanzeri')
        , ('0x17a4425708ae3fd28b595f09da7ae384a02adb4a', 'In and Around the House II', 'Laurie Simmons', 'Foundation', 'https://foundation.app/collection/lsiah')
        , ('0xa4448819cf690cb311239e4002ec60175838ac69', 'Gentlemen''s Club', 'Cristina De Middel', 'Foundation', 'https://foundation.app/collection/cmgc')
        , ('0xc44bb15b8b0839beb322ae24283f57f3421d120a', 'Midnight at the Crossroads', 'Cristina De Middel', 'Foundation', 'https://foundation.app/collection/cmmc')
        , ('0x9fea390481b6be2339fe143b0202a5457e0605fa', 'Polyspam', 'Cristina De Middel', 'Foundation', 'https://foundation.app/collection/cm-p')
        , ('0x65cb92b2a4bf5f7827df387b65962154f4666dbb', 'Sharkification', 'Cristina De Middel', 'Foundation', 'https://foundation.app/collection/cm-s')

) as temp_table (contract_address, collection_name, artist_name, platform, website)
    
order by artist_name asc, collection_name asc 