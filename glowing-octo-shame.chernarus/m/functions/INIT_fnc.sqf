﻿private["_path"];
_path = "m\Functions\";
if (isServer) then {
	m_fnc_call_reinforcement = compile (preprocessFileLineNumbers (_path + "m_fnc_call_reinforcement.sqf"));
	fnc_cleanup = compile (preprocessFileLineNumbers (_path + "fnc_cleanup.sqf"));
	if (!IsMultiplayer) then {
		m_fnc_playerRespawnSP = compile (preprocessFileLineNumbers (_path + "m_fnc_playerRespawnSP.sqf"));
		m_fnc_playerRespawn = compile (preprocessFileLineNumbers (_path + "m_fnc_playerRespawn.sqf"));
	};
};
if (!IsDedicated) then {
	Client_BuyUnit = compile (preprocessFileLineNumbers (_path + "Client_BuyUnit.sqf"));
	m_fnc_respawnWeaponsAdd = compile (preprocessFileLineNumbers (_path + "m_respawnWeaponsAdd.sqf"));
	m_fnc_teleport = compile (preprocessFileLineNumbers (_path + "m_fnc_teleport.sqf"));
	m_fnc_killcam = compile (preprocessFileLineNumbers (_path + "m_fnc_killcam.sqf"));
	m_fnc_teleport = compile (preprocessFileLineNumbers (_path + "m_fnc_teleport.sqf"));
	m_fnc_teleport2 = compile (preprocessFileLineNumbers (_path + "m_fnc_teleport2.sqf"));
	m_fnc_resetActions = compile (preprocessFileLineNumbers (_path + "m_fnc_resetActions.sqf"));
	draga_fn_getSafePos = compile (preprocessFileLineNumbers (_path + "draga_fn_getSafePos.sqf"));
	ACT_WinchManager = compile (preprocessFileLineNumbers (_path + "ACT_WinchManager.sqf"));
	m_fnc_rating = compile (preprocessFileLineNumbers (_path + "m_fnc_rating.sqf"));
	m_fnc_handlePlayableUnitsMarker = compile (preprocessFileLineNumbers (_path + "m_fnc_handlePlayableUnitsMarker.sqf"));
	m_fnc_handleJoinGroup = compile (preprocessFileLineNumbers (_path + "m_fnc_handleJoinGroup.sqf"));
	m_fnc_handleTeleport = compile (preprocessFileLineNumbers (_path + "m_fnc_handleTeleport.sqf"));
	m_fnc_handleLocationTask = compile (preprocessFileLineNumbers (_path + "m_fnc_handleLocationTask.sqf"));
	m_fnc_handleBuyMenu = compile (preprocessFileLineNumbers (_path + "m_fnc_handleBuyMenu.sqf"));
	m_fnc_turnVehicle = compile (preprocessFileLineNumbers (_path + "m_fnc_turnVehicle.sqf"));
};
m_fnc_check_config_use = compile (preprocessFileLineNumbers (_path + "m_fnc_check_config_use.sqf"));
// m_fnc_returnGroupType = compile (preprocessFileLineNumbers (_path + "m_fnc_returnGroupType.sqf"));
m_fnc_CheckCombatNearUnits = compile (preprocessFileLineNumbers (_path + "m_fnc_CheckCombatNearUnits.sqf"));
m_fnc_CheckIsKindOfArray = compile (preprocessFileLineNumbers (_path + "m_fnc_CheckIsKindOfArray.sqf"));
m_fnc_CheckPlayersDistance = compile (preprocessFileLineNumbers (_path + "m_fnc_CheckPlayersDistance.sqf"));
// m_fnc_EH_GetIn = compile (preprocessFileLineNumbers (_path + "EH_GetIn.sqf"));
m_fnc_Fuel = compile (preprocessFileLineNumbers (_path + "m_fnc_Fuel.sqf"));
m_fnc_GetTransportMagazines = compile (preprocessFileLineNumbers (_path + "m_fnc_GetTransportMagazines.sqf"));
m_fnc_MoveInCargo = compile (preprocessFileLineNumbers (_path + "m_fnc_MoveInCargo.sqf"));
// m_fnc_RankToSkill = compile (preprocessFileLineNumbers (_path + "m_fnc_RankToSkill.sqf"));
m_fnc_ReammoBox = compile (preprocessFileLineNumbers (_path + "m_fnc_ReammoBox.sqf"));
m_fnc_updateReammoBox = compile (preprocessFileLineNumbers (_path + "m_fnc_updateReammoBox.sqf"));
m_fnc_SafePosParams = compile (preprocessFileLineNumbers (_path + "m_fnc_SafePosParams.sqf"));
m_fnc_findSafePos = compile (preprocessFileLineNumbers (_path + "m_fnc_findSafePos.sqf"));
m_fnc_getSide = compile (preprocessFileLineNumbers (_path + "m_fnc_getSide.sqf"));
m_fnc_nearestPlayer = compile (preprocessFileLineNumbers (_path + "m_fnc_nearestPlayer.sqf"));
m_fnc_returnGroups = compile (preprocessFileLineNumbers (_path + "m_fnc_returnGroups.sqf"));
m_fnc_returnVehicleTurrets = compile (preprocessFileLineNumbers (_path + "m_fnc_returnVehicleTurrets.sqf"));
m_fnc_reweapon = compile (preprocessFileLineNumbers (_path + "m_fnc_reweapon.sqf"));
m_fnc_spawnCrew = compile (preprocessFileLineNumbers (_path + "m_fnc_spawnCrew.sqf"));
m_fnc_spawnGroup = compile (preprocessFileLineNumbers (_path + "m_fnc_spawnGroup.sqf"));
m_fnc_spawnVehicle = compile (preprocessFileLineNumbers (_path + "m_fnc_spawnVehicle.sqf"));
m_fnc_waypoints = compile (preprocessFileLineNumbers (_path + "m_fnc_waypoints.sqf"));
fnc_libEnabled = compile (preprocessFileLineNumbers (_path + "fnc_libEnabled.sqf"));
m_fnc_mobileHQ_init = compile (preprocessFileLineNumbers (_path + "m_fnc_mobileHQ_init.sqf"));
m_FirstAid = compile (preprocessFileLineNumbers (_path + "m_FirstAid.sqf"));
m_FirstAid_handleDamage = compile (preprocessFileLineNumbers (_path + "m_FirstAid_handleDamage.sqf"));
m_FirstAid_handleHeal = compile (preprocessFileLineNumbers (_path + "m_FirstAid_handleHeal.sqf"));
m_fnc_vehInit = compile (preprocessFileLineNumbers (_path + "m_fnc_vehInit.sqf"));
m_fnc_SalvageTruck = compile (preprocessFileLineNumbers (_path + "m_fnc_SalvageTruck.sqf"));
m_fnc_handleFirstAid = compile (preprocessFileLineNumbers (_path + "m_fnc_handleFirstAid.sqf"));
m_fnc_defaultCrew = compile (preprocessFileLineNumbers (_path + "m_fnc_defaultCrew.sqf"));
m_fnc_setNestedElement = compile (preprocessFileLineNumbers (_path + "fn_setNestedElement.sqf"));
m_fnc_availableVehicles = compile (preprocessFileLineNumbers (_path + "m_fnc_availableVehicles.sqf"));
m_fnc_CheckTimeAvailableVehiclesBuyMenu = compile (preprocessFileLineNumbers (_path + "m_fnc_CheckTimeAvailableVehiclesBuyMenu.sqf"));
m_fnc_setTimeAvailableVehiclesBuyMenu = compile (preprocessFileLineNumbers (_path + "m_fnc_setTimeAvailableVehiclesBuyMenu.sqf"));
draga_fn_createmenu = compile (preprocessFileLineNumbers (_path + "draga_fn_createmenu.sqf"));
draga_fnc_vehicleHandleDamage = compile (preprocessFileLineNumbers (_path + "draga_fnc_vehicleHandleDamage.sqf"));

draga_fnc_CheckRespawnDistance = compile (preprocessFileLineNumbers (_path + "draga_fnc_CheckRespawnDistance.sqf"));
m_fnc_init = true;
