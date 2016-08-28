﻿private ["_grp"];
_grp = (_this select 0);
if(!isNull _grp)then{
	private ["_leader","_units","_vehicles","_landing"];
	_leader = leader _grp;
	_units = units _grp;
	_vehicles = [];
	_landing = false;
	{	
		private ["_veh"];
		_veh = vehicle _x;
		if(_veh != _x)then{
			if!(_veh in _vehicles)then{
				_vehicles set [count _vehicles, _veh];
				if({_grp != group _x} count crew _veh > 0)then{
					_landing = true;
				};
			};
		};
	}forEach _units;

	private ["_patrol"];
	_patrol = _grp getVariable "patrol";
	if (!IsNil "_patrol") then {_patrol = true}else{_patrol = false};

	private ["_pos"];
	_pos=civilianBasePos;

	private ["_air","_AA"];
	_air = ([_vehicles, ["Air"]] call m_fnc_CheckIsKindOfArray);
	_AA = ([_vehicles, ["ZSU_Base","2S6M_Tunguska","HMMWV_Avenger","M6_EP1"]] call m_fnc_CheckIsKindOfArray);

	private ["_maxDist","_WaypointCompletionRadius","_SpeedMode"];
	if(_air)then{
		_maxDist = 4000;
		_WaypointCompletionRadius = 500;
		_SpeedMode = "FULL";
	}else{
		_maxDist = sizeLocation ;
		_WaypointCompletionRadius = 50;
		_SpeedMode = "NORMAL";
	};
	if(_AA)then{
		_maxDist = 200;
		_WaypointCompletionRadius = 1000;
	};
	if(_patrol)then{
		_pos = (_grp getVariable "patrol_pos");
		_maxDist = ((_maxDist * 10) max 1500);
	};

	if(_landing && _air)then{
		_pos = civilianBasePos;
		_maxDist = sizeLocation/2;
		_WaypointCompletionRadius = (sizeLocation max 800);
		_SpeedMode = "NORMAL";
	};

	if(SpeedMode _grp != _SpeedMode)then{_grp setSpeedMode _SpeedMode};

	private ["_wp"];
	if((count waypoints _grp) < 2)then{
		_wp = _grp addWaypoint [_pos, _maxDist];
		_wp setWaypointStatements ["true", "[group this] call m_fnc_waypoints"];
		if(_patrol or _air)then{
			_wp setWaypointType "MOVE";
			_wp setWaypointTimeout [0, 0, 0];
		}else{
			_wp setWaypointType "DISMISS";
			_wp setWaypointTimeout [20, 60, 180];
		};
	}else{
		_wp = [_grp, currentwaypoint _grp];
	};

	if(_landing && _air)then{
		{
			if(isNil {_x getVariable "_landing"})then{
				_x setVariable ["_landing",true];
				_x spawn {
					private ["_grp","_distance"];
					_grp = group _this;
					_distance = waypointCompletionRadius [_grp, currentwaypoint _grp];
					if(_this isKindOf "Plane")then{
						_distance = _distance max 1200;
					};
					waitUntil{(isNull _this) or (!alive _this) or (!canMove _this) or ((_this distance (waypointPosition [_grp, currentwaypoint _grp])) <= _distance)};
					{
						if(group _x != _grp)then{
							if(_this isKindOf "Plane")then{
								sleep 0.5;
								_x action ["Eject", _this];
							};
							unassignVehicle _x;
						};
					}forEach crew _this;
					// [_grp] call m_fnc_waypoints;
				};
			};
		}forEach _vehicles
	};

	_wp setWaypointPosition [_pos, _maxDist];
	_wp setWaypointCompletionRadius _WaypointCompletionRadius;
};