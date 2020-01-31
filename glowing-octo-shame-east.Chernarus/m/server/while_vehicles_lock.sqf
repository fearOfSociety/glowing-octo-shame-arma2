private["_vehicles_lock"];

private["_grp","_units","_leaderPlayer","_isPlayer","_vehicle","_grpPlayer"];

private["_lock"];

while{true}do{

	_vehicles_lock = [];
	{
		_grp = _x;
		_units = units _grp;

		if(isPlayer leader _grp)then{
			_leaderPlayer = true;
		}else{
			_leaderPlayer = false;
		};

		{
/*
			if(isPlayer _x)then{
				_isPlayer = true;
			}else{
				_isPlayer = false;
			};
*/

			if({isPlayer _x}count _units > 0)then{
				_grpPlayer = true;
			}else{
				_grpPlayer = false;
			};

			_vehicle = assignedVehicle _x;

			if(!isNull _vehicle && !_leaderPlayer && !_grpPlayer)then{
				_vehicles_lock set [count _vehicles_lock, _vehicle];
			};

		} forEach _units;

	} forEach allGroups;

	{
		_vehicle = _x;
		if (_vehicle in _vehicles_lock) then {
			_lock = "LOCKED";
		}else{
			_lock = "UNLOCKED";
		};

		if({isPlayer _x}count crew _vehicle > 0)then{
			_lock = "UNLOCKED";
		};

		if (_vehicle isKindOf "UAV" or _vehicle isKindOf "Ka137_Base_PMC") then {
			_lock = "LOCKED";
		};

		_lock_old = _vehicle getVariable "draga_vehicle_lock";
		if (isNil{_lock_old}) then {
			_vehicle setVariable ["draga_vehicle_lock", _lock, true];
			//if (local _x) then {
				_vehicle setVehicleLock _lock;
			//};
		}else{
			if (_lock_old != _lock) then {
				_vehicle setVariable ["draga_vehicle_lock", _lock, true];
				//if (local _x) then {
					_vehicle setVehicleLock _lock;
				//};
			};
		};

	} forEach vehicles;

	sleep 10;
};