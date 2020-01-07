private  ["_logic"];
_logic = _this select 3 select 0;
private  ["_COIN_items"];
_COIN_items = _this select 3 select 1;

_draga_COIN_areasize = [_this select 3 select 2, _this select 3 select 2];

if ([[_logic], draga_objectsCoinMHQ] call m_fnc_CheckIsKindOfArray) then {
    draga_objectCoin = _logic;
}else{
    draga_objectCoin = objNull;
};

uinamespace setvariable ["COIN_displayMain",finddisplay 46];


draga_CONTROL_CAM_Handler = {
	_mode = _this select 0;
	_input = _this select 1;
	if !(isNil "draga_CONTROL_CAM") then {_camera = draga_CONTROL_CAM};
	_terminate = false;

	if (_mode == "mousedown") then {
		_key = _input select 1;
		if (_key == 1 && 65665 in actionkeys "MenuBack") then {_terminate = true};

    if (_key == 0 && 65536 in actionKeys "DefaultAction") then {
      if (!isNil{draga_Coin_preview} && commandingmenu == "") then {
        _pos = position draga_Coin_preview;
        _dir = direction draga_Coin_preview;
        deletevehicle draga_Coin_preview;
        deletevehicle draga_objectCoin;
        _building = draga_Coin_selectedType createvehicle [(draga_posDefaultHiden select 0) + ((random draga_posDefaultHidenRandom) - (draga_posDefaultHidenRandom/2)), (draga_posDefaultHiden select 1) + ((random draga_posDefaultHidenRandom) - (draga_posDefaultHidenRandom/2))];
        _building setdir _dir;
        _building setVectorUp surfaceNormal _pos;
        _building setpos _pos;
        if (draga_Coin_selectedType == draga_MHQ) then {
            draga_COIN_QUIT = true;
        } else {
          showcommandingmenu "#USER:draga_Coin_categories_0";
          draga_Coin_selectedType = nil;
        };
      };
    };

	};


	if (_mode == "keydown") then {
		_key = _input select 1;

		if (_key in actionkeys "MenuBack") then {_terminate = true};

		if (_key in actionKeys "NightVision") then {
			draga_COIN_nvg = !draga_COIN_nvg;
			camusenvg draga_COIN_nvg;
		};
	};

	if (_mode == "keyup") then {
		_key = _input select 1;
	};

	if (_terminate) then {

			if (commandingmenu == "#USER:draga_Coin_categories_0") then {
				draga_COIN_QUIT = true;
			} else {
        if (commandingmenu == "") then {
          draga_COIN_menu_restart = true;
        };
			};
	};
};


if (isnil "draga_CONTROL_CAM") then {
  private["_camera"];
	_camera = "camconstruct" camcreate [position player select 0,position player select 1,15];
	_camera cameraeffect ["internal","back"];
	_camera camPrepareFOV 0.900;
	_camera campreparefocus [-1,-1];
	_camera camCommitPrepared 0;
  cameraEffectEnableHUD true;
	_camera setdir direction player;
	[_camera,-30,0] call BIS_fnc_setPitchBank;
	_camera camConstuctionSetParams ([position _logic] + _draga_COIN_areasize);

  draga_COIN_menu = "#USER:draga_Coin_categories_0";
  draga_COIN_nvg = if (daytime > 18.5 || daytime < 5.5) then {true} else {false};
  camusenvg draga_COIN_nvg;

  COIN_EH_keydown =		(uinamespace getvariable "COIN_displayMain") displayaddeventhandler [
  "KeyDown",		"if !(isnil 'draga_CONTROL_CAM_Handler') then {['keydown',_this] call draga_CONTROL_CAM_Handler;}"];
  COIN_EH_keyup =			(uinamespace getvariable "COIN_displayMain") displayaddeventhandler [
  "KeyUp",		"if !(isnil 'draga_CONTROL_CAM_Handler') then {['keyup',_this] call draga_CONTROL_CAM_Handler;}"];
  COIN_EH_mousebuttondown =	(uinamespace getvariable "COIN_displayMain") displayaddeventhandler [
  "MouseButtonDown",	"if !(isnil 'draga_CONTROL_CAM_Handler') then {['mousedown',_this] call draga_CONTROL_CAM_Handler;}"];

  draga_CONTROL_CAM = _camera;

  1122 cutrsc ["constructioninterface","plain"];
};





private["_categories"];
_colorGreen = "#(argb,8,8,3)color(0,1,0,0.3,ca)";
_colorRed = "#(argb,8,8,3)color(1,0,0,0.3,ca)";
_colorGray = "#(argb,8,8,3)color(1,1,1,0.1,ca)";
_colorGray = "#(argb,8,8,3)color(0,0,0,0.25,ca)";

while {!isnil "draga_CONTROL_CAM"} do {
	if (!isnil "draga_COIN_QUIT") exitwith {

		if !(isnil "draga_CONTROL_CAM") then {draga_CONTROL_CAM cameraeffect ["terminate","back"];camdestroy draga_CONTROL_CAM;};
		draga_CONTROL_CAM = nil;
		1122 cuttext ["","plain"];
		showcommandingmenu "";

    (uinamespace getvariable "COIN_displayMain") displayRemoveEventHandler ["KeyDown",COIN_EH_keydown];
    (uinamespace getvariable "COIN_displayMain") displayRemoveEventHandler ["KeyUp",COIN_EH_keyup];
    (uinamespace getvariable "COIN_displayMain") displayRemoveEventHandler ["MouseButtonDown",COIN_EH_mousebuttondown];

    if !(isnil "draga_Coin_preview") then {deletevehicle draga_Coin_preview;};


		draga_COIN_QUIT = nil;
    draga_COIN_menu_restart = nil;
    draga_Coin_selectedType = nil;

	};


if (isNil{_categories} or !isNil{draga_COIN_menu_restart}) then {
  _categories = [];
  {
      if !(_x select 1 in _categories) then {
        _categories set [count _categories, _x select 1];
      };
  } forEach _COIN_items;

  _categoriesMenu = [];
  for "_i" from 0 to (count _categories - 1) do {
    _categoriesMenu = _categoriesMenu + [_i];
  };

  [["Categories",true],"draga_Coin_categories",[_categoriesMenu,_categories],"#USER:draga_Coin_%1_items_0","",""] call BIS_fnc_createmenu;

  for "_i" from 0 to (count _categories - 1) do {
    _category = _categories select _i;
    _arrayNames = [];
    _arrayNamesLong = [];
    _arrayEnable = [];
    _arrayParams = [];
    {
      _itemclass = _x select 0;
      _itemcategory = _x select 1;
      if (typename _itemcategory == typename "") then {
        _itemcategory = _categories find _itemcategory;
      } else {100};

      if (_itemcategory < count _categories) then {
        _itemcost = _x select 2;
        _itemname = if (count _x > 3) then {_x select 3} else {gettext (configfile >> "CfgVehicles" >> _itemclass >> "displayName")};
        if (_itemcategory == _i) then {
          _text = _itemname + " - " + "$" + str _itemcost;
          _arrayNames = _arrayNames + [_text];
          _arrayNamesLong = _arrayNamesLong + [_text + "                   "];
          _arrayEnable = _arrayEnable + [1];
          _arrayParams = _arrayParams + [[_x,_i]];
        };
      };
    } foreach _COIN_items;

    [[_category,true],format ["draga_Coin_%1_items",_i],[_arrayNames,_arrayNamesLong,_arrayEnable],"","
    _item = '%1';
    _id = %2;
    _array = (call compile '%3') select _id;
    draga_Coin_selectedType = (_array select 0 select 0);
    showcommandingmenu '';
    ",_arrayParams] call BIS_fnc_createmenu;
  };
  showcommandingmenu "#USER:draga_Coin_categories_0";
  draga_COIN_menu_restart = nil;
  if !(isnil "draga_Coin_preview") then {deletevehicle draga_Coin_preview;};
  draga_Coin_selectedType = nil;

};


if (!isNil{draga_Coin_selectedType}) then {
  _color = _colorGreen;
  if (isNil{draga_Coin_preview}) then {
    draga_Coin_preview = objNull;
  };
  if (typeof draga_Coin_preview != gettext (configfile >> "CfgVehicles" >> draga_Coin_selectedType >> "ghostpreview")) then {
    deletevehicle draga_Coin_preview;
    draga_Coin_preview = gettext (configfile >> "CfgVehicles" >> draga_Coin_selectedType >> "ghostpreview") createVehicleLocal (screentoworld [0.5,0.5]);
    draga_CONTROL_CAM camsettarget draga_Coin_preview;
    draga_CONTROL_CAM camcommit 0;

    draga_Coin_preview setObjectTexture [0,_colorGray];

  } else {
    if (
      ([position draga_Coin_preview,_logic] call BIS_fnc_distance2D) > (_draga_COIN_areasize select 0)
    ) then {
      _color = _colorGray
    } else {

      _dist = (sizeof typeof draga_Coin_preview) / 2 min 4;
      if (draga_Coin_selectedType isKindOf "StaticWeapon") then {
          _dist = 0.25;
      };
      _isFlat = (position draga_Coin_preview) isflatempty [
        _dist,	//--- Minimal distance from another object
        -1,				//--- If 0, just check position. If >0, select new one
        -1,				//--- Max gradient
        _dist,	//--- Gradient area
        0,				//--- 0 for restricted water, 2 for required water,
        false,				//--- True if some water can be in 25m radius
        draga_Coin_preview			//--- Ignored object
      ];
      if (count _isFlat == 0) then {_color = _colorRed};
    };
    draga_Coin_preview setObjectTexture [0,_color];

    _colorGUI = [1,1,1,0.1];
    if (_color == _colorGreen) then {_colorGUI = [0.3,1,0.3,0.3]};
    if (_color == _colorRed) then {_colorGUI = [1,0.2,0.2,0.4]};

    ((uiNamespace getvariable "draga_CONTROL_CAM_DISPLAY") displayctrl 112201) ctrlsettextcolor _colorGUI;
    ((uiNamespace getvariable "draga_CONTROL_CAM_DISPLAY") displayctrl 112201) ctrlcommit 0;
  };
};

	sleep 0.01;
};