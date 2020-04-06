draga_COIN_items = [];
if(faction player in ["BIS_US", "BIS_CZ", "BIS_GER"] or playerSide == west)then{
	draga_COIN_items = [
			["WarfareBMGNest_M240_US_EP1","Defence",0],
			["M2StaticMG_US_EP1","Defence",0],
			["M2HD_mini_TriPod_US_EP1","Defence",0],
			["MK19_TriPod_US_EP1","Defence",0],
			["Stinger_Pod_US_EP1","Defence",0],
			["TOW_TriPod_US_EP1","Defence",0],
			["M119_US_EP1","Defence",0],
			["M252_US_EP1","Defence",0],
			["SearchLight_US_EP1","Defence",0],
			["US_WarfareBBarracks_EP1","Base",0],
			["US_WarfareBLightFactory_EP1","Base",0],
			["US_WarfareBHeavyFactory_EP1","Base",0],
			["US_WarfareBAircraftFactory_EP1","Base",0],
			["US_WarfareBAntiAirRadar_EP1","Base",0],
			["US_WarfareBArtilleryRadar_EP1","Base",0],
			["US_WarfareBUAVterminal_EP1","Base",0],
			["US_WarfareBVehicleServicePoint_EP1","Base",0],
			["US_WarfareBFieldhHospital_EP1","Base",0],
			["WarfareBAirport","Base",0]
		];
};
if(faction player in ["USMC"])then{
	draga_COIN_items = [
			["USMC_WarfareBMGNest_M240","Defence",0],
			["M2StaticMG","Defence",0],
			["M2HD_mini_TriPod","Defence",0],
			["MK19_TriPod","Defence",0],
			["Stinger_Pod","Defence",0],
			["TOW_TriPod","Defence",0],
			["M119","Defence",0],
			["M252","Defence",0],
			["SearchLight","Defence",0],
			["USMC_WarfareBBarracks","Base",0],
			["USMC_WarfareBLightFactory","Base",0],
			["USMC_WarfareBHeavyFactory","Base",0],
			["USMC_WarfareBAircraftFactory","Base",0],
			["USMC_WarfareBAntiAirRadar","Base",0],
			["USMC_WarfareBArtilleryRadar","Base",0],
			["USMC_WarfareBUAVterminal","Base",0],
			["USMC_WarfareBVehicleServicePoint","Base",0],
			["USMC_WarfareBFieldhHospital","Base",0],
			["WarfareBAirport","Base",0]
			];
};
if(faction player in ["CDF"])then{
	draga_COIN_items = [
			["CDF_WarfareBMGNest_PK","Defence",0],
			["DSHKM_CDF","Defence",0],
			["DSHkM_Mini_TriPod_CDF","Defence",0],
			["AGS_CDF","Defence",0],
			["ZU23_CDF","Defence",0],
			["SPG9_CDF","Defence",0],
			["D30_CDF","Defence",0],
			["2b14_82mm_CDF","Defence",0],
			["SearchLight_CDF","Defence",0],
			["CDF_WarfareBBarracks","Base",0],
			["CDF_WarfareBLightFactory","Base",0],
			["CDF_WarfareBHeavyFactory","Base",0],
			["CDF_WarfareBAircraftFactory","Base",0],
			["CDF_WarfareBAntiAirRadar","Base",0],
			["CDF_WarfareBArtilleryRadar","Base",0],
			["CDF_WarfareBUAVterminal","Base",0],
			["CDF_WarfareBVehicleServicePoint","Base",0],
			["CDF_WarfareBFieldhHospital","Base",0],
			["WarfareBAirport","Base",0]
			];
};

if(faction player in ["BIS_TK", "BIS_TK_INS"] or playerSide == east)then{
	draga_COIN_items = [
			["WarfareBMGNest_PK_TK_EP1","Defence",0],
			["KORD_high_TK_EP1","Defence",0],
			["KORD_TK_EP1","Defence",0],
			["AGS_TK_EP1","Defence",0],
			["ZU23_TK_EP1","Defence",0],
			["Igla_AA_pod_TK_EP1","Defence",0],
			["Metis_TK_EP1","Defence",0],
			["D30_TK_EP1","Defence",0],
			["2b14_82mm_TK_EP1","Defence",0],
			["SearchLight_TK_EP1","Defence",0],
			["TK_WarfareBBarracks_EP1","Base",0],
			["TK_WarfareBLightFactory_EP1","Base",0],
			["TK_WarfareBHeavyFactory_EP1","Base",0],
			["TK_WarfareBAircraftFactory_EP1","Base",0],
			["TK_WarfareBAntiAirRadar_EP1","Base",0],
			["TK_WarfareBArtilleryRadar_EP1","Base",0],
			["TK_WarfareBUAVterminal_EP1","Base",0],
			["TK_WarfareBVehicleServicePoint_EP1","Base",0],
			["TK_WarfareBFieldhHospital_EP1","Base",0],
			["WarfareBAirport","Base",0]
			];
};
if(faction player in ["RU"])then{
	draga_COIN_items = [
			["RU_WarfareBMGNest_PK","Defence",0],
			["KORD_high","Defence",0],
			["KORD","Defence",0],
			["AGS_RU","Defence",0],
			["Igla_AA_pod_East","Defence",0],
			["ZU23_Ins","Defence",0],
			["Metis","Defence",0],
			["D30_RU","Defence",0],
			["2b14_82mm","Defence",0],
			["SearchLight_RUS","Defence",0],
			["RU_WarfareBBarracks","Base",0],
			["RU_WarfareBLightFactory","Base",0],
			["RU_WarfareBHeavyFactory","Base",0],
			["RU_WarfareBAircraftFactory","Base",0],
			["RU_WarfareBAntiAirRadar","Base",0],
			["RU_WarfareBArtilleryRadar","Base",0],
			["RU_WarfareBUAVterminal","Base",0],
			["RU_WarfareBVehicleServicePoint","Base",0],
			["RU_WarfareBFieldhHospital","Base",0],
			["WarfareBAirport","Base",0]
			];
};
if(faction player in ["INS"])then{
	draga_COIN_items = [
			["Ins_WarfareBMGNest_PK","Defence",0],
			["DSHKM_Ins","Defence",0],
			["DSHkM_Mini_TriPod","Defence",0],
			["AGS_Ins","Defence",0],
			["ZU23_Ins","Defence",0],
			["SPG9_Ins","Defence",0],
			["D30_Ins","Defence",0],
			["2b14_82mm_INS","Defence",0],
			["SearchLight_INS","Defence",0],
			["Ins_WarfareBBarracks","Base",0],
			["Ins_WarfareBLightFactory","Base",0],
			["Ins_WarfareBHeavyFactory","Base",0],
			["Ins_WarfareBAircraftFactory","Base",0],
			["Ins_WarfareBAntiAirRadar","Base",0],
			["Ins_WarfareBArtilleryRadar","Base",0],
			["Ins_WarfareBUAVterminal","Base",0],
			["Ins_WarfareBVehicleServicePoint","Base",0],
			["Ins_WarfareBFieldhHospital","Base",0],
			["WarfareBAirport","Base",0]
			];
};

if(faction player in ["BIS_TK_GUE", "BIS_UN"] or playerSide == resistance)then{
	draga_COIN_items = [
			["WarfareBMGNest_PK_TK_GUE_EP1","Defence",0],
			["DSHKM_TK_GUE_EP1","Defence",0],
			["DSHkM_Mini_TriPod_TK_GUE_EP1","Defence",0],
			["AGS_TK_GUE_EP1","Defence",0],
			["ZU23_TK_GUE_EP1","Defence",0],
			["SPG9_TK_GUE_EP1","Defence",0],
			["D30_TK_GUE_EP1","Defence",0],
			["2b14_82mm_TK_GUE_EP1","Defence",0],
			["SearchLight_TK_GUE_EP1","Defence",0],
			["TK_GUE_WarfareBBarracks_EP1","Base",0],
			["TK_GUE_WarfareBLightFactory_EP1","Base",0],
			["TK_GUE_WarfareBHeavyFactory_EP1","Base",0],
			["TK_GUE_WarfareBAircraftFactory_EP1","Base",0],
			["TK_GUE_WarfareBAntiAirRadar_EP1","Base",0],
			["TK_GUE_WarfareBArtilleryRadar_EP1","Base",0],
			["TK_GUE_WarfareBUAVterminal_EP1","Base",0],
			["TK_GUE_WarfareBVehicleServicePoint_EP1","Base",0],
			["TK_GUE_WarfareBFieldhHospital_EP1","Base",0],
			["WarfareBAirport","Base",0]
			];
};
if(faction player in ["GUE"])then{
	draga_COIN_items = [
			["GUE_WarfareBMGNest_PK","Defence",0],
			["DSHKM_Gue","Defence",0],
			["ZU23_Gue","Defence",0],
			["SPG9_Gue","Defence",0],
			["2b14_82mm_GUE","Defence",0],
			["SearchLight_Gue","Defence",0],
			["Gue_WarfareBBarracks","Base",0],
			["Gue_WarfareBLightFactory","Base",0],
			["Gue_WarfareBHeavyFactory","Base",0],
			["Gue_WarfareBAircraftFactory","Base",0],
			["Gue_WarfareBAntiAirRadar","Base",0],
			["Gue_WarfareBArtilleryRadar","Base",0],
			["Gue_WarfareBUAVterminal","Base",0],
			["Gue_WarfareBVehicleServicePoint","Base",0],
			["Gue_WarfareBFieldhHospital","Base",0],
			["WarfareBAirport","Base",0]
		];
};
