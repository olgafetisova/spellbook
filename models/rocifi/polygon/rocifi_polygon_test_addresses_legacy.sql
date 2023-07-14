{{ config(
	tags=['legacy'],
	
    alias = alias('test_addresses', legacy_model=True),
    post_hook = '{{ 
        expose_spells(\'["polygon"]\',
        "project", 
        "rocifi",
        \'["maybeyonas"]\') }}'
) }}


SELECT distinct lower(address) as address
FROM (VALUES 
    ("0x90cd03a2dc6bdbd6d24eeb69f3fdebaddd1459af"),
    ("0x75F71C1923a16774Ea1408216D1141e2bB086249"),
    ("0x7FE505754D406324C1133f8043f2C2Cdcd44ad3C"),
    ("0x4b61Dec3782b2D34d42F51AF8d40e5D6d75AB0Cf"),
    ("0x8032bc80892ED1fB3018CefaCc3e470b24851A3f"),
    ("0xEc0152A0c2495F872849AC7115834D16D1DbF2FF"),
    ("0xe3B73C40e55ee786776b9F8126DB1FCb4a407edE"),
    ("0xe7b1dF3a17FaD4D788b4D727833BeA45DD75D6a6"),
    ("0x116D6970B1cb8850a473499c551ea7891aD167b4"),
    ("0x748384da45F737b4c71e0cABC727bc7712141bbd"),
    ("0x85c6a8fbaEe3cb4c273BEBE5916B0716a6BaA721"),
    ("0x2607fF4E62dfcCE8Df2C15CD3Eef0Cf26784601b"),
    ("0x2435Eb04f20920cEFc6b1d5f1A55d5E0A1E82BE8"),
    ("0xb8b7a8a52F09581F4b1152dCe9B742552E30577C"),
    ("0x9402F038CcCb9259Abb3d51a44f0EaC0D5241236"),
    ("0x038F60e6332b43ac7feb30EC5166F3A4dF9fcb23"),
    ("0x130934426de72034Fc8398b83E6806A6524849c7"),
    ("0x40799AfF479274526a3F126757a2ce0B941529d5"),
    ("0x89C667FA51844ab1865982bdcd9fBdBb5EbB4d2d"),
    ("0x89789c98B0a809B1E64b91E0195693331610D1d9"),
    ("0x3820E69821F906918DDE7d015E0684A980452443"),
    ("0x87C0A3634375342B5558d08f97A8e64193987B38"),
    ("0x14a5286d7c5ea4062b74bec942d5bb916b757aed"),
    ("0xf4C19f8E0B3F368F0a423b1c5c52E36c3D784A19"),
    ("0xFF2EFA62Fb12E7152F8e614fE8d2200f6D9b50D8"),
    ("0xC64Fff4F594780D31Ff1d4bBD12Dd68aB3Cf9F5d"),
    ("0xc9510a6e1207c92cc7D397CA0AF518dE123A1E3F"),
    ("0xD3Fc943A2F4D0633039FFc499B7d975CF735E7cc"),
    ("0xe50C513048e42f13596926a19e56bd7B8ff6659B"),
    ("0x0bF97611D6fD6c3DA269F402a5F85DcD189D457C"),
    ("0xae65eEad3BA405046C4F8C042d739be3bc5B30BD"),
    ("0xf54A7040096acfB6B9DBEe1033A29f26987E88Cc"),
    ("0x030CF9773A60D4ea433833288151df5f2Dd79476"),
    ("0xcb565A495Af29e858868A4e6032F413b6aE94027"),
    ("0xD3b0c4ae466A3151e3dbb1Da93a5D3672D72F63b"),
    ("0xa141EC11cfF0ab8A4E5106D184eB3996C272dB14"),
    ("0xd89e2849A8a4cEd4ffd34e49A8A670aE8ddc74bF"),
    ("0x65E5a31e098c2AB8c26E6EE63A2bfFEF051f04f9"),
    ("0x75b3e1b110Ed07754425f4366b29a3D45dB8DBe8"),
    ("0xbff68bb85a9a858A4Bb62859D1b9aDA6517e0F27"),
    ("0x8aBc7e383594C2F0E7e17465E4AE235a83d20775"),
    ("0x88F972Eb55C004706efff28dc12974a42B86d770"),
    ("0x35Df0E9B33Ee7286D9BA4307320D5b1c836BE87C"),
    ("0xa14f9082a8e6c8669332D69b0f39d749F03f2F26"),
    ("0x1fa07eEA4F276A2D729d167fdB6e1Ffe3956418c"),
    ("0xc8E3338d139877938a6F113Ca3F5e376C5c4ae59"),
    ("0xF4E3cbB7b7f6E915D7186799F2E5A0fcF210Ba3D"),
    ("0x225924F1885E9884d3E5032eD09d9b144DBed482"),
    ("0x6a48D44ee453100aE51cece0F645a7B681904aB0"),
    ("0x63115d17a814Ed9F2380d351Cf5CfE5F24c0d88F"),
    ("0xC106F7DDBAa6674843b71f72cf265009ba67B634"),
    ("0x90abf736218A65d92D41428565Bbd4ADB7b9B738"),
    ("0x42eA4b1Fa309e2d16307b53C6Cf8b21E7fDd63b5"),
    ("0x0CBcF5698bcA3077b4599976845a0ddD4F813644"),
    ("0xaF1eC1CB3a331Dc7e006883EFb1d0D8205A91ca9"),
    ("0xbFe0a811b0CE9fa57559a0089aCf0b6b3026987E"),
    ("0xFA4427A568dae843d6822fE2a75c67F703A035Ec"),
    ("0xa80F7f9883b8fE68450ba9eAb5182b02Bb14feC2"),
    ("0x045bF4C0365f66F0542d77e3bc0d528261DFCBf5"),
    ("0x8aE8d58BadC078B0c3cA85703962A16944Ef0C88"),
    ("0xe83e4a6DFCCCaCbE6EDa6Ad4e9f937fa975dE759"),
    ("0x46617401AC41adD6c21f36B4611349Ff16D80108"),
    ("0xb77Be927915a4f8A2202BD9eA383fd5c1648bD55"),
    ("0xB7321Cc68925Eb5279711142f6D0bBD80eA01a50"),
    ("0xA7C943644A86206aF74E29AdF8ADb9405cBab2C6"),
    ("0xBB7466e42FF6F72087b347FC5D25f09e831fD349"),
    ("0xA9CC3146A474c6e9621b481e5C175B3FCAD23486"),
    ("0x31A38F8F27F5597f4EFdE9C9b5970e6F2D1A8967"),
    ("0xF2224479fe4403f58f5Fd28225695Ff891e3Ab52"),
    ("0x77FB1f20FC99A334b8349BdeBb18D055d1880E97"),
    ("0x479a44d3376649E3e6e0901f0C30174D43d7934B"),
    ("0x2C6502B2aBC3b397820917d86EBf32C86F93808B"),
    ("0xFd5f0f671e907E0D9Ff0C192D3Df0833AB0e7710"),
    ("0xbF7D703DF4fF8aF48eD3eb7590C5d174736D62AA"),
    ("0xa8fCd827e4D515eC4ca2680E8585e998267d9852"),
    ("0x8cEa8Bbe9173aC84Ef95DefA59918998d3c013Cf"),
    ("0xE7dA719dfC9aCDa1A7Fd60613194270F351987E5"),
    ("0x274a804557F79c6a6218196aEAa6e7AE03EFe981"),
    ("0xBE7b66dEB5258258Cf82c74Cfe47A4F71D6C920A"),
    ("0x3b7DAaf5D62d9CF870B960E4c58C0Ec6CC9Ad155"),
    ("0x82094842A07fF1c467D85e110b188C23A03D3161"),
    ("0x94c5E5e642cfa7654215D77848242173cdF0856b"),
    ("0xf91F654c1459f72D2386E37eDc5266DA2d709694"),
    ("0x6243A6a1AB9ff76a78C96385568a58e8492ed80d"),
    ("0xcBaDA4d2076ab7D8c4AA61B5c4250c5d3BDcD75a"),
    ("0x431982A417a9744dab6E3d378e8070fE1Afbf91C"),
    ("0xf8cA2CdA8Ef9f517D1e53f064BCe7A8308819DEc"),
    ("0x75f01F6587716Eb6cab769C4C1C06887Ebe1998f"),
    ("0x62A80625d38f406dE864b4D0D0D5Ab15a655b65B"),
    ("0x33c70cA18AFd7480BC836b4935Fb412d555E267E"),
    ("0xc4E94e4D9e6A15F62cc56ae40C68dA130D7042F8"),
    ("0x4b03155A2Dd2B3987713448A7136601b962e9a00"),
    ("0x826F611C8373880a5BE04eCEE67F0aB2C48D5B3f"),
    ("0x148c36C6943bc4d8d274B916F940dD2ec7B14118"),
    ("0x5A2905b5aCDCEaB332a0e583eEc92d8473996B31"),
    ("0xa9fBB028e57142e2463dBeCDd3543E2922d4b6A0"),
    ("0x87F34B66cAe13cd7F16708673385de6fe1Ca7D93"),
    ("0xE305B02cEd8f9B6407D32EAEf55C4Ab0E4d75685"),
    ("0x5c39073013A5471A6Fe3feFBeBBfd01762C67D1c"),
    ("0xbbC6FB49Cb41481Fc8706bF69AD58B9A94b6CADB"),
    ("0x9Ee225381f449C287afEE15e715B67262EeFaA37"),
    ("0xde1392e95E21E9404600A4054FC80f5e9272c12F"),
    ("0xCFfAadD938EA93551931fA0598857534eece1a9F"),
    ("0x64b31827Fa58Da9d2cE154dECf6755858beC73fA"),
    ("0xD432129A1f59EEf2e2f499279A2B63CFf67b2FaE"),
    ("0xbc4551A8E0590a7d8bE571384d00d1961d411130"),
    ("0x48BFBd1E036F10ba66967B16ef4c5db7658a2A05"),
    ("0xd545A548dD274DC2D3595f0Da82b4a33a3eA0318"),
    ("0x567ecAd326DF7587c03Ca1b7a7Fd66Ebaa8f8b9b"),
    ("0x93ac5704230e1d64D0E7513e3f6c900880F17c84"),
    ("0x5D87eC577Ae23453E7580431816Bf841741F52f4"),
    ("0x773278C2085E50180C9Ef7e5D432D5a53f167bF3"),
    ("0xA44CceF6D966d74f7d91B67796e5EFf861F43EEC"),
    ("0x0D141458a89f955bC97Cb4463aaE9E336f3b6418"),
    ("0xF94C0804b360df90CE4100795D0aD0A3282970dc"),
    ("0x6d5a75487F562a80230a241aA7Ac404ebF635Fa9"),
    ("0x195a646aFF78C1b45a0Af869603c7a971DD9A0Fa"),
    ("0x522aB66a239eefaEc6c8D61D1906acb42b26fe43"),
    ("0x4625b6d976bfdBe94238E75C00B4383C2513e988"),
    ("0x69D57fF72425ae8bD9ef333b8c71bDb41B08F351"),
    ("0xAD38f3f54B6FC901B47BEf450119701FF23C259f"),
    ("0x27B76D2a59c677101558AD31b183B3032FA8965F"),
    ("0x2b3de33A62A656c76Ed366FE55C49CfE142F5427"),
    ("0x663c3f7B600e3C81f06ce627f6b8eBB70Fea1207"),
    ("0xEc2bb1d7A0F551709010E091319Ed52186BA913b"),
    ("0x0F7B19Dc492B91C618b8e59Be415037e30714fc8"),
    ("0xE22FaF247335241682726Cd601f38576B1b1Dc72"),
    ("0x0F3F1fa78F3dE4365A816976D5fFb67C88b75844"),
    ("0x922C10dAfffb8B9bE4C40d3829C8c708a12827F3"),
    ("0x19F5Ed36f1921ca02b466f134cF81857a48B73ae"),
    ("0x94ceF219229d6C371D9212AD97D2c831B4E8C380"),
    ("0xD64cCa07f97Ff3e4C06118accF70B32482445d7c"), 
    ("0xdC5047dC210bC608fF1a6892A77301dCD0844966"), 
    ("0x305705398b1Dd9CeF22D4b9d0F362715d1E3d4d3"), 
    ("0x448BF551cD96488BeEf34eEF6d8732e921F23C65"), 
    ("0x7F5331e15163BAEAeEb7B96b2a5238E5d9E08c12"), 
    ("0xf28b551FB304C8541F781d207e4Ddaf4Aa6D322B"), 
    ("0xf32967d35fa2251f6a0E5c128F5Dc8d95e28fAC8"), 
    ("0xa197b8547981357CbA5241469b915681423a350E"), 
    ("0xec794a7Fd3A1C41107861B937268edb9C097b1a1"), 
    ("0xD3F4Bef2f7675170088A072Db2cf4420Ff084E58"), 
    ("0x7211E68647C18319Cd1719Ca4ABaE23c4400c97e"), 
    ("0x1Bb17039D206C4DD2CCA28Df5B95653FF196181C"), 
    ("0xBB6118544DB2266F96B6f3ED2af485Fe4A7e1999"), 
    ("0x5A0d42B0F48f92C5d1F365093FDCb3b1958f6275"),
    ("0x1Dc31714B2369F7a0402C12bFe9635651739890f"),
    ("0x33388C474426ab037b04202264F2688BB08B35f0"),
    ("0xc7eAC9e6e03603c1aACb7c6da5CdeaEaC18594b3")
  ) AS x (address)