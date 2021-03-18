/*
	setVehicleLock "UNLOCKED" = same as "lock 0"
	setVehicleLock "DEFAULT" = same as "lock 1"
	setVehicleLock "LOCKED" = same as "lock 2"
	setVehicleLock "LOCKEDPLAYER" = same as "lock 3"
*/


private["_vehicles_lock"];

private["_grp","_units","_leaderPlayer","_isPlayer","_vehicle","_grpPlayer","_side"];

private["_lock"];

private["_transportPlayer"];

private["_friendly_vehicles_only"];
_friendly_vehicles_only = missionNamespace getVariable "friendly_vehicles_only";

while{true}do{

	// перечислить транспорт который нужно закрыть
	_vehicles_lock = [];
	{
		_grp = _x;
		_units = units _grp;

		if(leader _grp call fnc_isPlayer)then{
			_leaderPlayer = true;
		}else{
			_leaderPlayer = false;
		};

		{

			if({_x call fnc_isPlayer}count _units > 0)then{
				_grpPlayer = true;
			}else{
				_grpPlayer = false;
			};

			_vehicle = assignedVehicle _x;

			if (isNull _vehicle) then {
				_vehicle = _x getVariable "assignedVehicle";
				if (isNil {_vehicle}) then {_vehicle = objNull};
			};


			if(isNull _vehicle)then{
				_vehicle = vehicle _x;
			};

			if(!isNull _vehicle && !_leaderPlayer && !_grpPlayer && _vehicle != _x)then{
				_vehicles_lock set [count _vehicles_lock, _vehicle];
			};

		} forEach _units;
	} forEach allGroups;

	{
		_vehicle = _x;
		if (_vehicle in _vehicles_lock) then {
			_lock = 2;
		}else{
			_lock = 0;
		};

		if (_vehicle isKindOf "UAV" or _vehicle isKindOf "Ka137_Base_PMC") then {
			_lock = 2;
		};

		_transportPlayer = _vehicle getVariable "transportPlayer";
		if(!isNil {_transportPlayer})then{
			if(alive _transportPlayer)then{
				_lock = 0;
			};
		};

		if (_friendly_vehicles_only == 1) then {
			_side = getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "side") call m_fnc_getSide;
			if (_side in [west,east,resistance]) then {
				if !(_side in m_friendlySide) then {
					_lock = 2;
				};
			};
		};

		if({_x call fnc_isPlayer}count crew _vehicle > 0)then{
			_lock = 0;
		};

		_lock_old = locked _vehicle;

		if (draga_loglevel > 0) then {
			diag_log format ["Log: [while_vehicles_lock.sqf] транспорт %1 локальный = %4, нужно lock %2, сейчас %3", _vehicle, _lock, _lock_old, local _vehicle];
		};

		if (_lock == 2) then {_lock = true}else{_lock = false};

		if (!_lock_old && _lock) then {
			_vehicle lock _lock;
		};
		if (_lock_old && !_lock) then {
			_vehicle lock _lock;
		};

	} forEach vehicles;

	sleep 5;
};
