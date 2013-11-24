
private ["_obj","_text","_objectID","_objectUID","_ownerID","_dir","_locationPlayer","_onLadder","_isWater","_inVehicle","_building","_hasToolbox","_canDo","_hasEtool","_canRemove","_failRemove","_result","_longWloop","_medWloop","_smallWloop","_tblProb","_lowP","_medP","_highP","_cnt","_wait","_qtyTankTrap","_qtyWire","_qtySandbag","_qtyLumber","_qtyPlywood","_qtyGrenade","_qtyTin","_qtyHesco","_qtySandbagNest","_qtyScrap","_qtyPole","_qtyCorrugatedFence","_qtyStorageShed","_qtyDesertCamoNet","_qtyForestCamoNet","_qtyWoodShed","_qtyBurlap","_qtyGlass","_randNum","_randNum2","_message","_func_ownerRemove","_classname","_i","_recipe","_validObject","_requirements","_attachCoords","_startPos","_modDir","_toolBox","_eTool","_medWait","_longWait","_inBuilding","_roadAllowed","_inTown","_removable","_dialog"];
disableserialization;
_obj = cursorTarget;
if (_obj isKindof "Grave") then {
_text = "Bomb";
cutText [format["You can only disarm %1 to remove it",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit";
};
if (!isNull _obj) then {
_objectID = _obj getVariable["ObjectID","0"];
_objectUID = _obj getVariable["ObjectUID","0"];
};
_ownerID = _obj getVariable ["characterID","0"];
_dir = direction _obj;
_pos = getposATL _obj;
_locationPlayer = player modeltoworld [0,0,0];
_onLadder 		= (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_isWater 		= (surfaceIsWater _locationPlayer) or dayz_isSwimming;
_inVehicle 		= (vehicle player != player);
_building 		= nearestObject [player, "Building"];
_onLadder 		=		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_hasToolbox 	= 	"ItemToolbox" in items player;
_canDo 			= (!r_drag_sqf and !r_player_unconscious and !_onLadder);
_hasEtool 		= 	"ItemEtool" in weapons player;
_canRemove 		= false;
_failRemove		= false;
_result 		= false;
_longWloop 		= 6;
_medWloop 		= 4;
_smallWloop 	= 3;
_tblProb 		= 30;
_lowP 			= 35;
_medP 			= 70;
_highP 			= 95;
_cnt 			= 0;
_wait 			= 10;
_qtyTankTrap = 0;
_qtyWire = 0;
_qtySandbag = 0;
_qtyLumber = 0;
_qtyPlywood = 0;
_qtyGrenade = 0;
_qtyHesco = 0;
_qtySandbagNest = 0;
_qtyScrap = 0;
_qtyPole = 0;
_qtyCorrugatedFence = 0;
_qtystorageshed = 0;
_qtyDesertCamoNet = 0;
_qtyForestCamoNet = 0;
_qtyWoodShed = 0;
_qtyBurlap = 0;
_qtyGlass = 0;
_randNum = round(random 100);
_randNum2 = round(random 100);
if (!placevault) then {cutText ["Not allowed to remove things in trader cities!", "PLAIN DOWN"];breakOut "exit";};
if(_isWater) then {cutText [localize "str_player_26", "PLAIN DOWN"];breakOut "exit";};
if(_onLadder) then {cutText [localize "str_player_21", "PLAIN DOWN"];breakOut "exit";};
if (_inVehicle) then {cutText [localize "Can't do this in vehicle", "PLAIN DOWN"];breakOut "exit";};
_func_ownerRemove = {
for "_i" from 0 to ((count allbuildables) - 1) do{
		_classname = (allbuildables select _i) select _i - _i + 1;
		_result = [typeOf(_obj),_classname] call BIS_fnc_areEqual;
			if (_result) then {
				_recipe = (allbuildables select _i) select _i - _i;
				_qtyTankTrap = _recipe select 0;
				_qtyWire = _recipe select 1;
				_qtySandbag = _recipe select 2;
				_qtyLumber = _recipe select 3;
				_qtyPlywood = _recipe select 4;
				_qtyGrenade = _recipe select 5;
				_qtyHesco = _recipe select 6;
				_qtySandbagNest = _recipe select 7;
				_qtyScrap = _recipe select 8;
				_qtyPole = _recipe select 9;
				_qtyCorrugatedFence = _recipe select 10;
				_qtyStorageShed = _recipe select 11;
				_qtyDesertCamoNet = _recipe select 12;
				_qtyForestCamoNet = _recipe select 13;
				_qtyWoodShed = _recipe select 14;
				_qtyBurlap = _recipe select 15;
				_qtyGlass = _recipe select 16;
			};
	};
	if (_qtyTankTrap > 0) then {for "_i" from 1 to _qtyTankTrap do { _result = [player,"ItemTankTrap"] call BIS_fnc_invAdd;  };};
	if (_qtyWire > 0) then {for "_i" from 1 to _qtyWire do { _result = [player,"ItemWire"] call BIS_fnc_invAdd;  };};
	if (_qtySandbag > 0) then {for "_i" from 1 to _qtySandbag do { _result = [player,"ItemSandbag"] call BIS_fnc_invAdd;  };};
	if (_qtyLumber > 0) then {for "_i" from 1 to _qtyLumber do { _result = [player,"PartWoodLumber"] call BIS_fnc_invAdd; };};
	if (_qtyPlywood > 0) then {for "_i" from 1 to _qtyPlywood do { _result = [player,"PartWoodPlywood"] call BIS_fnc_invAdd;  };};
	if (_qtyGrenade > 0) then {for "_i" from 1 to _qtyGrenade do { _result = [player,"HandGrenade_West"] call BIS_fnc_invAdd;  };};
	if (_qtyHesco > 0) then {for "_i" from 1 to _qtyHesco do { _result = [player,"ItemSandbagLarge"] call BIS_fnc_invAdd;  };};
	if (_qtySandbagNest > 0) then {for "_i" from 1 to _qtySandbagNest do { _result = [player,"sandbag_nest_kit"] call BIS_fnc_invAdd;  };};
	if (_qtyScrap > 0) then {for "_i" from 1 to _qtyScrap do { _result = [player,"PartGeneric"] call BIS_fnc_invAdd;  };};
	if (_qtyPole > 0) then {for "_i" from 1 to _qtyPole do { _result = [player,"ItemPole"] call BIS_fnc_invAdd;  };};
	if (_qtyCorrugatedFence > 0) then {for "_i" from 1 to _qtyCorrugatedFence do { _result = [player,"ItemCorrugated"] call BIS_fnc_invAdd;  };};
	if (_qtyStorageShed > 0) then {for "_i" from 1 to _qtyStorageShed do { _result = [player,"storage_shed_kit"] call BIS_fnc_invAdd;  };};
	if (_qtyDesertCamoNet > 0) then {for "_i" from 1 to _qtyDesertCamoNet do { _result = [player,"desert_net_kit"] call BIS_fnc_invAdd;  };};
	if (_qtyForestCamoNet > 0) then {for "_i" from 1 to _qtyForestCamoNet do { _result = [player,"forest_net_kit"] call BIS_fnc_invAdd;  };};
	if (_qtyWoodShed > 0) then {for "_i" from 1 to _qtyWoodShed do { _result = [player,"wooden_shed_kit"] call BIS_fnc_invAdd;  };};
	if (_qtyBurlap > 0) then {for "_i" from 1 to _qtyBurlap do { _result = [player,"ItemBurlap"] call BIS_fnc_invAdd;  };};
	if (_qtyGlass > 0) then {for "_i" from 1 to _qtyGlass do { _result = [player,"PartGlass"] call BIS_fnc_invAdd;  };};
	cutText [format["You have been refunded for object %1",typeof(_obj)], "PLAIN DOWN",1];
	PVDZE_obj_Delete = [_objectID,_objectUID];
	publicVariableServer "PVDZE_obj_Delete";
	if (isServer) then {PVDZE_obj_Delete call server_deleteObj;};
	deletevehicle _obj; 
	breakout "exit";
};
		_validObject = _obj getVariable ["validObject",false];
if (removeObject && _validObject) then {call _func_ownerRemove;};
if ( _ownerID == dayz_characterID ) then { call _func_ownerRemove;};
if ( _ownerID == dayz_playerUID ) then {call _func_ownerRemove;};
if ((getPlayerUID player) in ["010101"]) then {call _func_ownerRemove;};
remProc = true;
switch (true) do{
	case(camoNetB_East distance player < 10 && isNull _obj):{
		_obj = camoNetB_East;
		_objectID = _obj getVariable["ObjectID",0];
		_objectUID = _obj getVariable["ObjectUID","0"];
	};
	case(camoNetVar_East distance player < 10 && isNull _obj):{
		_obj = camoNetVar_East;
		_objectID = _obj getVariable["ObjectID",0];
		_objectUID = _obj getVariable["ObjectUID","0"];
	};
	case(camoNet_East distance player < 10 && isNull _obj):{
		_obj = camoNet_East;
		_objectID = _obj getVariable["ObjectID",0];
		_objectUID = _obj getVariable["ObjectUID","0"];
	};
	case(camoNetB_Nato distance player < 10 && isNull _obj):{
		_obj = camoNetB_Nato;
		_objectID = _obj getVariable["ObjectID",0];
		_objectUID = _obj getVariable["ObjectUID","0"];
	};
	case(camoNetVar_Nato distance player < 10 && isNull _obj):{
		_obj = camoNetVar_Nato;
		_objectID = _obj getVariable["ObjectID",0];
		_objectUID = _obj getVariable["ObjectUID","0"];
	};
	case(camoNet_Nato distance player < 10 && isNull _obj):
	{
		_obj = camoNet_Nato;
		_objectID = _obj getVariable["ObjectID",0];
		_objectUID = _obj getVariable["ObjectUID","0"];
	};
};
for "_i" from 0 to ((count allbuildables) - 1) do{
		_classname = (allbuildables select _i) select _i - _i + 1;
		_result = [typeOf(_obj),_classname] call BIS_fnc_areEqual;
			if (_result) then {
				_text = getText (configFile >> "CfgVehicles" >> typeOf cursorTarget >> "displayName");
				_requirements = (allbuildables select _i) select _i - _i + 2;
			};
	};
if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
_eTool 			= _requirements select 4;
_medWait 		= _requirements select 5;
_longWait 		= _requirements select 6;
_removable 		= false;
if (!_removable) then {cutText [format["%1 is not allowed to be removed!",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
switch (true) do{
	case(_longWait):{
		if (_eTool) then {
			if (!_hasEtool) then {cutText [format["You need an entrenching tool to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
		};
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
		if (_randNum > _highP) then {_tblProb = _tblProb + 40;_canRemove = true;} else {_tblProb = _tblProb + 40;_failRemove = true;_longWait = true; };
	};
	case(_medWait):{
		if (_eTool) then {
			if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
		};
		if (!_hasEtool) then {cutText [format["You need an entrenching tool to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
		if (_randNum > _medP) then {_tblProb = _tblProb + 20;_canRemove = true;} else {_tblProb = _tblProb + 20; _failRemove = true; _medWait = true;};
	};
	case(!_medWait && !_longWait):{
		if (_eTool) then {
			if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
		};
		if (!_hasEtool) then {cutText [format["You need an entrenching tool to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
		if (_randNum > _lowP) then {_canRemove = true;} else { _failRemove = true;};
	};
};
switch (true) do{
	case(_longWait && _canRemove):{
		_cnt = _longWloop;
		_cnt = _cnt * 10;
		for "_i" from 0 to _longWloop do{
			cutText [format["Attempting to deconstruct %1  %2 seconds left.  \nMove from current position to cancel\n %3 percent chance to fail, %4 percent chance to lose toolbox",_text,_cnt + 10,_highP,_tblProb], "PLAIN DOWN",1];
			if (player distance _locationPlayer > 0.2) then {cutText [format["Removal canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; remProc = false; breakOut "exit";};
			if (!_canDo || _onLadder || _inVehicle) then {cutText [format["Removal canceled for %1, player is unable to continue",_text], "PLAIN DOWN",1]; remProc = false; breakOut "exit";};
			player playActionNow "Medic";
			_dialog = findDisplay 106;
			sleep 1;
			[player,"repair",0,false] call dayz_zombieSpeak;
			_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
			sleep _wait;
			_hasToolbox = 	"ItemToolbox" in items player;
			if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
			if (!(isNull _dialog)) then {cutText [format["Removal canceled for %1, you opened your gear menu.",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
			_cnt = _cnt - 10;
		};
		_hasToolbox = 	"ItemToolbox" in items player;
		if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
		if (!isNull _obj && _randNum2 < _tblProb) then {player removeWeapon "ItemToolbox"; cutText ["Your toolbox was used up!", "PLAIN DOWN"];};
			sleep 1.5;
	};
	case(_medWait && _canRemove):{
		_cnt = _medWloop;
		_cnt = _cnt * 10;
		for "_i" from 0 to _medWloop do{
			cutText [format["Attempting to deconstruct %1  %2 seconds left.  \nMove from current position to cancel\n %3 percent chance to fail, %4 percent chance to lose toolbox",_text,_cnt + 10,_medP,_tblProb], "PLAIN DOWN",1];
			if (player distance _locationPlayer > 0.2) then {cutText [format["Removal canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; remProc = false; breakOut "exit";};
			if (!_canDo || _onLadder || _inVehicle) then {cutText [format["Removal canceled for %1, player is unable to continue",_text], "PLAIN DOWN",1]; remProc = false; breakOut "exit";};
			player playActionNow "Medic";
			_dialog = findDisplay 106;
			sleep 1;
			[player,"repair",0,false] call dayz_zombieSpeak;
			_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
			sleep _wait;
			_hasToolbox = 	"ItemToolbox" in items player;
			if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
			if (!(isNull _dialog)) then {cutText [format["Removal canceled for %1, you opened your gear menu.",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
			_cnt = _cnt - 10;
	};
			_hasToolbox = 	"ItemToolbox" in items player;
			if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
			if (!isNull _obj && _randNum2 < _tblProb) then {player removeWeapon "ItemToolbox"; cutText ["Your toolbox was used up!", "PLAIN DOWN"];};
			sleep 1.5;
	};
	case((!_medWait && !_longWait) && _canRemove):{
		_cnt = _smallWloop;
		_cnt = _cnt * 10;
		for "_i" from 0 to _smallWloop do
		{
			cutText [format["Attempting to deconstruct %1  %2 seconds left.  \nMove from current position to cancel\n %3 percent chance to fail, %4 percent chance to lose toolbox",_text,_cnt + 10,_lowP,_tblProb], "PLAIN DOWN",1];
			if (player distance _locationPlayer > 0.2) then {cutText [format["Removal canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; remProc = false; breakOut "exit";};
			if (!_canDo || _onLadder || _inVehicle) then {cutText [format["Removal canceled for %1, player is unable to continue",_text], "PLAIN DOWN",1]; remProc = false; breakOut "exit";};
			player playActionNow "Medic";
			_dialog = findDisplay 106;
			sleep 1;
			[player,"repair",0,false] call dayz_zombieSpeak;
			_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
			sleep _wait;
			_hasToolbox = 	"ItemToolbox" in items player;
			if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
			if (!(isNull _dialog)) then {cutText [format["Removal canceled for %1, you opened your gear menu.",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
			_cnt = _cnt - 10;
		};
			_hasToolbox = 	"ItemToolbox" in items player;
			if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
			if (!isNull _obj && _randNum2 < _tblProb) then {player removeWeapon "ItemToolbox"; cutText ["Your toolbox was used up!", "PLAIN DOWN"];};
			sleep 1.5;
	};
	case(_longWait && _failRemove):{
		_cnt = _longWloop;
		_cnt = _cnt * 10;
		for "_i" from 0 to _longWloop do
		{
			cutText [format["Attempting to deconstruct %1  %2 seconds left.  \nMove from current position to cancel\n %3 percent chance to fail, %4 percent chance to lose toolbox",_text,_cnt + 10,_highP,_tblProb], "PLAIN DOWN",1];
			if (player distance _locationPlayer > 0.2) then {cutText [format["Removal canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; remProc = false; breakOut "exit";};
			if (!_canDo || _onLadder || _inVehicle) then {cutText [format["Removal canceled for %1, player is unable to continue",_text], "PLAIN DOWN",1]; remProc = false; breakOut "exit";};
			player playActionNow "Medic";
			_dialog = findDisplay 106;
			sleep 1;
			[player,"repair",0,false] call dayz_zombieSpeak;
			_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
			sleep _wait;
			_hasToolbox = 	"ItemToolbox" in items player;
			if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
			if (!(isNull _dialog)) then {cutText [format["Removal canceled for %1, you opened your gear menu.",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
			_cnt = _cnt - 10;
		};
			_hasToolbox = 	"ItemToolbox" in items player;
			if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
			if (!isNull _obj && _randNum2 < _tblProb) then {player removeWeapon "ItemToolbox"; cutText ["Your toolbox was used up!", "PLAIN DOWN"];};
			sleep 1.5;
			cutText [format["You failed to remove %1!",_text], "PLAIN DOWN",6]; remProc = false; breakOut "exit";
	};
	case(_medWait && _failRemove):{
		_cnt = _medWloop;
		_cnt = _cnt * 10;
		for "_i" from 0 to _medWloop do{
			cutText [format["Attempting to deconstruct %1  %2 seconds left.  \nMove from current position to cancel\n %3 percent chance to fail, %4 percent chance to lose toolbox",_text,_cnt + 10,_medP,_tblProb], "PLAIN DOWN",1];
			if (player distance _locationPlayer > 0.2) then {cutText [format["Removal canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; remProc = false; breakOut "exit";};
			if (!_canDo || _onLadder || _inVehicle) then {cutText [format["Removal canceled for %1, player is unable to continue",_text], "PLAIN DOWN",1]; remProc = false; breakOut "exit";};
			player playActionNow "Medic";
			_dialog = findDisplay 106;
			sleep 1;
			[player,"repair",0,false] call dayz_zombieSpeak;
			_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
			sleep _wait;
			_hasToolbox = 	"ItemToolbox" in items player;
			if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
			if (!(isNull _dialog)) then {cutText [format["Removal canceled for %1, you opened your gear menu.",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
			_cnt = _cnt - 10;
		};
			_hasToolbox = 	"ItemToolbox" in items player;
			if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
			if (!isNull _obj && _randNum2 < _tblProb) then {player removeWeapon "ItemToolbox"; cutText ["Your toolbox was used up!", "PLAIN DOWN"];};
			sleep 1.5;
			cutText [format["You failed to remove %1!",_text], "PLAIN DOWN",6]; remProc = false; breakOut "exit";
	};
	case((!_medWait && !_longWait) && _failRemove):{
		_cnt = _smallWloop;
		_cnt = _cnt * 10;
		for "_i" from 0 to _smallWloop do{
			cutText [format["Attempting to deconstruct %1  %2 seconds left.  \nMove from current position to cancel\n %3 percent chance to fail, %4 percent chance to lose toolbox",_text,_cnt + 10,_lowP,_tblProb], "PLAIN DOWN",1];
			if (player distance _locationPlayer > 0.2) then {cutText [format["Removal canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; remProc = false; breakOut "exit";};
			if (!_canDo || _onLadder || _inVehicle) then {cutText [format["Removal canceled for %1, player is unable to continue",_text], "PLAIN DOWN",1]; remProc = false; breakOut "exit";};
			player playActionNow "Medic";
			_dialog = findDisplay 106;
			sleep 1;
			[player,"repair",0,false] call dayz_zombieSpeak;
			_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
			sleep _wait;
			_hasToolbox = 	"ItemToolbox" in items player;
			if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
			if (!(isNull _dialog)) then {cutText [format["Removal canceled for %1, you opened your gear menu.",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
			_cnt = _cnt - 10;
		};
			_hasToolbox = 	"ItemToolbox" in items player;
			if (!_hasToolbox) then {cutText [format["You need a tool box to remove %1",_text], "PLAIN DOWN",1];remProc = false; breakOut "exit"; };
			if (!isNull _obj && _randNum2 < _tblProb) then {player removeWeapon "ItemToolbox"; cutText ["Your toolbox was used up!", "PLAIN DOWN"];};
			sleep 1.5;
			cutText [format["You failed to remove %1!",_text], "PLAIN DOWN",6]; remProc = false; breakOut "exit";
	};
};
if (!isNull _obj) then {
cutText [format["You removed a %1 successfully!",_text], "PLAIN DOWN"];
	dayzDeleteObj = [_objectID,_objectUID];
publicVariableServer "dayzDeleteObj";
if (isServer) then {
	dayzDeleteObj call server_deleteObj;
};
sleep .1;
deleteVehicle _obj;
};
remProc = false;