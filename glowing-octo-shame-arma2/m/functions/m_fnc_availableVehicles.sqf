private["_friendly_vehicles_only"];
_friendly_vehicles_only = missionNamespace getVariable "friendly_vehicles_only";

private ["_list","_true"];
_list = [];
_true = false;
for "_i" from 0 to ((count (configFile >> "CfgVehicles")) - 1) do {
	private ["_entry"];
	_entry = ((configFile >> "CfgVehicles") select _i);
	if (isClass _entry) then {
		if ((getNumber(_entry >> "scope")) == 2) then {
			if ((_friendly_vehicles_only == 0) or !isMultiplayer or ((getNumber(_entry >> "side")) call m_fnc_getSide) in m_friendlySide) then {
				_libEnabled = [_entry] call fnc_libEnabled;
				if (_libEnabled) then {
					if (getText(_entry >> "vehicleclass") in ["Ammo","ACE_Ammunition"]) then {
						_true = true;
					};
					if (((getText(_entry >> "simulation")) == "soldier") && (getNumber(_entry >> "isMan") == 1)) then {
						_true = true;
					};
					if !(getText(_entry >> "simulation") in ["invisible", "house", "thing", "flagcarrier", "fire", "breakablehouseproxy", "breakablehouse", "parachute"]) then {
						if!(configname _entry isKindOf "Chukar")then{
							_true = true;
						};
					};
					if (_true) then {
						_list set [count _list, configname _entry];
					};
				};
			};
		};
	};
};
_list;
