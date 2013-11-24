private ["_locationPlayer","_location","_attachCoords","_dir","_building","_staticObj","_hasEtool","_hasToolbox","_onLadder","_canDo","_isWater","_inVehicle","_isOk","_closestTown","_town_name","_town_pos","_roadAllowed","_medWait","_longWait","_checkComplete","_finished","_eTool","_toolBox","_alreadyBuilt","_inBuilding","_inTown","_inProgress","_result","_isSimulated","_isDestructable","_canBuildOnPlot","_classname","_check_town","_cntLoop","_chosenRecipe","_requirements","_buildable","_buildables","_longWloop","_medWloop","_smallWloop","_cnt","_playerCombat","_funcExitScript","_isPole","_distance","_findNearestPoles","_findNearestPole","_IsNearPlot","_nearestPole","_ownerID","_friendlies","_message","_buildings","_isBuilding","_cancel","_reason","_item","_qtyTankTrap","_qtyWire","_qtySandbag","_qtyLumber","_qtyPlywood","_qtyGrenade","_qtyTin","_qtyHesco","_qtySandbagNest","_qtyScrap","_qtyPole","_qtyCorrugatedFence","_qtyStorageShed","_qtyDesertCamoNet","_qtyForestCamoNet","_qtyWoodShed","_qtyBurlap","_qtyGlass","_itemTankTrap","_itemWire","_itemSandbag","_itemLumber","_itemPlywood","_itemGrenade","_itemTin","_itemHesco","_itemSandbagNest","_itemScrap","_itemPole","_itemCorrugatedFence","_itemStorageShed","_itemDesertCamoNet","_itemForestCamoNet","_itemWoodShed","_itemBurlap","_itemGlass","_i","_text","_startPos","_modDir","_isDestrutable","_onRoad","_townRange","_panelNearest2","_buildCheck","_buildReady","_object","_isInCombat","_dialog","_uidDir","_p1","_p2","_p3","_coder","_code","_fuel"];
_locationPlayer = player modeltoworld [0,0,0];
_location = player modeltoworld [0,0,0]; 
_attachCoords = [0,0,0];
_dir = getDir player;
_building = nearestObject [player, "Building"];
_staticObj = nearestObject [player, "Static"];
_hasEtool = "ItemEtool" in weapons player;
_hasToolbox = "ItemToolbox" in items player;
_onLadder =(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder); 
_isWater = (surfaceIsWater _locationPlayer) or dayz_isSwimming;
_inVehicle = (vehicle player != player);
_isOk = [player,_building] call fnc_isInsideBuilding;
_closestTown = (nearestLocations [player,["NameCityCapital","NameCity","NameVillage","Airport"],25600]) select 0;
_town_name = text _closestTown;
_town_pos = position _closestTown;
_roadAllowed = false;
_medWait = false;
_longWait = false;
_checkComplete = false;
_finished = false;
_eTool = false;
_toolBox = false;
_alreadyBuilt = false;
_inBuilding = false;
_inTown = false;
_inProgress = false;
_result = false;
_isSimulated = false;
_isDestructable = false;
_canBuildOnPlot = false;
_classname = "";
_check_town= "";
_cntLoop = 0;
_chosenRecipe = [];
_requirements = [];
_buildable = [];
_buildables= [];
_longWloop= 2;
_medWloop= 1;
_smallWloop = 0;
_cnt = 0;
_playerCombat = player;
_funcExitScript = {
procBuild = false;
breakOut "exit";
};
_isPole = (_classname == "Plastic_Pole_EP1_DZ");
_distance = 30;
if(_isPole) then {
_distance = 200;
};
_findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], _distance];
_findNearestPole = [];
{if (alive _x) then {_findNearestPole set [(count _findNearestPole),_x];};} foreach _findNearestPoles;
_IsNearPlot = count (_findNearestPole);
if(_isPole and _IsNearPlot > 0) exitWith {  TradeInprogress = false; cutText ["Cannot build plot pole within 200m of an existing plot." , "PLAIN DOWN"]; };
if(_IsNearPlot == 0) then {
if(_isPole) then {
_canBuildOnPlot = true;
};
} else {
_nearestPole = _findNearestPole select 0;
_ownerID = _nearestPole getVariable["CharacterID","0"];
if(dayz_playerUID == _ownerID) then {
if(!_isPole) then {
_canBuildOnPlot = true;
};
} else {
if(!_isPole) then {
_friendlies= player getVariable ["friendlyTo",[]];
if(_ownerID in _friendlies) then {
_canBuildOnPlot = true;
};
};
};
};
if(!_canBuildOnPlot) exitWith {  TradeInprogress = false; cutText ["Building requires plot pole within 30m." , "PLAIN DOWN"]; };
_buildings = nearestObjects [(vehicle player), ["Building"], 100];
{
_isBuilding = [(vehicle player),_x] call fnc_isInsideBuilding;
if(_isBuilding) exitWith {
_cancel = true;
_reason = "Cannot build inside another building.";
};
} forEach _buildings;
if (procBuild) then {cutText ["Your already building!", "PLAIN DOWN"];breakOut "exit";};
if(_isWater) then {cutText [localize "str_player_26", "PLAIN DOWN"];call _funcExitScript;};
if(_onLadder) then {cutText [localize "str_player_21", "PLAIN DOWN"];call _funcExitScript;};
if (_inVehicle) then {cutText ["Can't do this in vehicle", "PLAIN DOWN"];call _funcExitScript;};
if (!placevault) then {cutText ["Can't build in a trader city", "PLAIN DOWN"];call _funcExitScript;};
disableSerialization;
closedialog 1;
if (dayz_combat == 1) then {
cutText ["Your currently in combat, time reduced to 3 seconds. \nCanceling/escaping will set you back into combat", "PLAIN DOWN"];
sleep 3;
_playerCombat setVariable["combattimeout", 0, true];
dayz_combat = 0;
};
r_interrupt = false;
r_doLoop = true;
procBuild = true;
call gear_ui_init;
_mags = magazines player;
if ("ItemTankTrap" in _mags) then {
_qtyTankTrap = {_x == "ItemTankTrap"} count magazines player;
_buildables set [count _buildables, _qtyTankTrap];
_itemTankTrap = "ItemTankTrap";
} else { _qtyTankTrap = 0; _buildables set [count _buildables, _qtyTankTrap]; };
if ("ItemWire" in _mags) then {
_qtyWire = {_x == "ItemWire"} count magazines player;
_buildables set [count _buildables, _qtyWire]; 
_itemWire = "ItemWire";
} else { _qtyWire = 0; _buildables set [count _buildables, _qtyWire]; };
if ("ItemSandbag" in _mags) then {
_qtySandbag = {_x == "ItemSandbag"} count magazines player;
_buildables set [count _buildables, _qtySandbag]; 
_itemSandbag = "ItemSandbag";
} else { _qtySandbag = 0; _buildables set [count _buildables, _qtySandbag]; };
if ("PartWoodLumber" in _mags) then {
_qtyLumber = {_x == "PartWoodLumber"} count magazines player;
_buildables set [count _buildables, _qtyLumber]; 
_itemLumber = "PartWoodLumber";
} else { _qtyLumber = 0; _buildables set [count _buildables, _qtyLumber]; };
if ("PartWoodPlywood" in _mags) then {
_qtyPlywood = {_x == "PartWoodPlywood"} count magazines player;
_buildables set [count _buildables, _qtyPlywood]; 
_itemPlywood = "PartWoodPlywood";
} else { _qtyPlywood = 0; _buildables set [count _buildables, _qtyPlywood]; };
if ("HandGrenade_West" in _mags) then {
_qtyGrenade = {_x == "HandGrenade_West"} count magazines player;
_buildables set [count _buildables, _qtyGrenade]; 
_itemGrenade = "HandGrenade_West";
} else { _qtyGrenade = 0; _buildables set [count _buildables, _qtyGrenade]; };
if ("ItemSandbagLarge" in _mags) then {
_qtyHesco = {_x == "ItemSandbagLarge"} count magazines player;
_buildables set [count _buildables, _qtyHesco]; 
_itemHesco = "ItemSandbagLarge";
} else { _qtyHesco = 0; _buildables set [count _buildables, _qtyHesco]; };
if ("sandbag_nest_kit" in _mags) then {
_qtySandbagNest = {_x == "sandbag_nest_kit"} count magazines player;
_buildables set [count _buildables, _qtySandbagNest]; 
_itemSandbagNest = "sandbag_nest_kit";
} else { _qtySandbagNest = 0; _buildables set [count _buildables, _qtySandbagNest]; };
if ("PartGeneric" in _mags) then {
_qtyScrap = {_x == "PartGeneric"} count magazines player;
_buildables set [count _buildables, _qtyScrap]; 
_itemScrap = "PartGeneric";
} else { _qtyScrap = 0; _buildables set [count _buildables, _qtyScrap]; };
if ("ItemPole" in _mags) then {
_qtyPole = {_x == "ItemPole"} count magazines player;
_buildables set [count _buildables, _qtyPole]; 
_itemPole = "ItemPole";
} else { _qtyPole = 0; _buildables set [count _buildables, _qtyPole]; };
if ("ItemCorrugated" in _mags) then {
_qtyCorrugatedFence = {_x == "ItemCorrugated"} count magazines player;
_buildables set [count _buildables, _qtyCorrugatedFence]; 
_itemCorrugatedFence = "ItemCorrugated";
} else { _qtyCorrugatedFence = 0; _buildables set [count _buildables, _qtyCorrugatedFence]; };
if ("storage_shed_kit" in _mags) then {
_qtyStorageShed = {_x == "storage_shed_kit"} count magazines player;
_buildables set [count _buildables, _qtyStorageShed]; 
_itemStorageShed = "storage_shed_kit";
} else { _qtyStorageShed = 0; _buildables set [count _buildables, _qtyStorageShed]; };
if ("desert_net_kit" in _mags) then {
_qtyDesertCamoNet = {_x == "desert_net_kit"} count magazines player;
_buildables set [count _buildables, _qtyDesertCamoNet]; 
_itemDesertCamoNet = "desert_net_kit";
} else { _qtyDesertCamoNet = 0; _buildables set [count _buildables, _qtyDesertCamoNet]; };
if ("forest_net_kit" in _mags) then {
_qtyForestCamoNet = {_x == "forest_net_kit"} count magazines player;
_buildables set [count _buildables, _qtyForestCamoNet]; 
_itemForestCamoNet = "forest_net_kit";
} else { _qtyForestCamoNet = 0; _buildables set [count _buildables, _qtyForestCamoNet]; };
if ("wooden_shed_kit" in _mags) then {
_qtyWoodShed = {_x == "wooden_shed_kit"} count magazines player;
_buildables set [count _buildables, _qtyWoodShed]; 
_itemWoodShed = "wooden_shed_kit";
} else { _qtyWoodShed = 0; _buildables set [count _buildables, _qtyWoodShed]; };
if ("ItemBurlap" in _mags) then {
_qtyBurlap = {_x == "ItemBurlap"} count magazines player;
_buildables set [count _buildables, _qtyBurlap]; 
_itemBurlap = "ItemBurlap";
} else { _qtyBurlap = 0; _buildables set [count _buildables, _qtyBurlap]; };
if ("PartGlass" in _mags) then {
_qtyGlass = {_x == "PartGlass"} count magazines player;
_buildables set [count _buildables, _qtyGlass]; 
_itemGlass = "PartGlass";
} else { _qtyGlass = 0; _buildables set [count _buildables, _qtyGlass]; };
for "_i" from 0 to ((count allbuildables) - 1) do
{
_buildable = (allbuildables select _i) select _i - _i;
_result = [_buildables,_buildable] call BIS_fnc_areEqual;
if (_result) exitWith {
_classname = (allbuildables select _i) select _i - _i + 1;
_requirements = (allbuildables select _i) select _i - _i + 2;
_chosenRecipe = _buildable;
};
_buildable = [];
};
if (_classname == "") then {cutText ["You need the EXACT amount of whatever you are trying to build without extras.", "PLAIN DOWN"];call _funcExitScript;};
if (_classname == "Grave") then {_text = "Booby Trap";};
if (_classname == "Concrete_Wall_EP1") then {_text = "Gate Concrete Wall";};
if (_classname == "Infostand_2_EP1") then {_text = "Gate Panel Keypad Access";};
if (_classname != "Infostand_2_EP1" && 
_classname != "Concrete_Wall_EP1" &&  
_classname != "Grave") then {
_text = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
};
_buildable = [];
_attachCoords = _requirements select 0;
_startPos = _requirements select 1;
_modDir = _requirements select 2;
_toolBox = _requirements select 3;
_eTool = _requirements select 4;
_medWait = _requirements select 5;
_longWait = _requirements select 6;
_inBuilding = _requirements select 7;
_roadAllowed = _requirements select 8;
_inTown = _requirements select 9;
_isSimulated = _requirements select 12;
_isDestrutable= _requirements select 13;
_location = player modeltoworld _startPos;
if (_toolBox) then {
if (!_hasToolbox) then {cutText [format["You need a tool box to build %1",_text], "PLAIN DOWN",1];call _funcExitScript; };
};
if (_eTool) then {
if (!_hasEtool) then {cutText [format["You need an entrenching tool to build %1",_text], "PLAIN DOWN",1];call _funcExitScript; };
};
if (_inBuilding) then {
if (_isOk) then {cutText [format["%1 cannot be built inside of buildings!",_text], "PLAIN DOWN",1];call _funcExitScript; };
};
if (!_roadAllowed) then { 
_onRoad = isOnRoad _locationPlayer;
if(_onRoad) then {cutText [format["You cannot build %1 on the road",_text], "PLAIN DOWN",1];call _funcExitScript;};
};
if (!_inTown) then {
for "_i" from 0 to ((count allbuild_notowns) - 1) do
{
_check_town = (allbuild_notowns select _i) select _i - _i;
if (_town_name == _check_town) then {
_townRange = (allbuild_notowns select _i) select _i - _i + 1;
if (_locationPlayer distance _town_pos <= _townRange) then {
cutText [format["You cannot build %1 within %2 meters of area %3",_text, _townRange, _town_name], "PLAIN DOWN",1];call _funcExitScript;
};
};
};
};
_panelNearest2 = nearestObjects [player, ["Infostand_2_EP1"], 250];
if (_classname == "Infostand_2_EP1" && (count _panelNearest2 > 3)) then {cutText ["Only 4 gate panels per base in a 250 meter radius!", "PLAIN DOWN"];call _funcExitScript;};
_buildCheck = false;
_buildReady = false;
player allowdamage false;
_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
_object setDir (getDir player);
if (_modDir > 0) then {
_object setDir (getDir player) + _modDir;
};
if (_classname == "M240Nest_DZ") then{ 
_object lock true;  
};
player allowdamage true;
hint "";
cutText ["-Build process started.  Move around to re-position\n-Stay still to begin build timer", "PLAIN DOWN", 10];
while {!_buildReady} do {
hintsilent "-Build process started.  \n-Move around to re-position\n-Stay still to begin build timer";
_playerCombat = player;
_isInCombat = _playerCombat getVariable["startcombattimer",0];
_dialog = findDisplay 106;
if ((speed player < 9 && speed player > 0) || (speed player > -7 && speed player < 0)) then {
_object attachto [player, _attachCoords];
_object setDir (getDir player) + _modDir;
_inProgress = true;
} else {
if (_inProgress) then {
detach _object;
sleep 0.03;
_location = getposATL _object;
_dir = getDir _object;
_object setpos [(getposATL _object select 0),(getposATL _object select 1), 0];
_location = _object modeltoworld [0,0,0];  
deletevehicle _object;
_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
_object setDir _dir;
_object setpos [(getposATL _object select 0),(getposATL _object select 1), 0]; 
_cntLoop = 50;
_inProgress = false;
while {speed player == 0 && !_buildReady} do {
sleep 0.1;
if (_cntLoop <= 100 && _cntLoop % 10 == 0) then {
cutText [format["Building of %1 starts in %2 seconds. Move to restart timer and position",_text, (_cntLoop / 10)], "PLAIN DOWN",1];
};
_isInCombat = _playerCombat getVariable["startcombattimer",0];
_dialog = findDisplay 106;
if ((!(isNull _dialog) || _isInCombat > 0) && (isPlayer _playerCombat) ) then {
detach _object;
deletevehicle _object;
cutText [format["Build canceled for %1. Player in combat or opened gear.",_text], "PLAIN DOWN",1];call _funcExitScript;
if (!_roadAllowed) then { 
_onRoad = isOnRoad getposATL(_object);
if(_onRoad) then {cutText [format["You cannot build %1 on the road",_text], "PLAIN DOWN",1];call _funcExitScript;};
};
};
_cntLoop = _cntLoop - 1;
if (_cntLoop <= 0) then {
_buildReady = true;
_cntLoop = 0;
};
};
};
};
if ((!(isNull _dialog) || (speed player > 9 || speed player < -7) || _isInCombat > 0) && (isPlayer _playerCombat) ) then {
detach _object;
deletevehicle _object;
cutText [format["Build canceled for %1. Player moving too fast, in combat or opened gear.",_text], "PLAIN DOWN",1];call _funcExitScript;
};
sleep 0.03;
};
if (_buildReady) then {
cutText [format["Building beginning for %1.",_text], "PLAIN DOWN",1];
} else {cutText [format["Build canceled for %1. Something went wrong!",_text], "PLAIN DOWN",1];call _funcExitScript;};
_locationPlayer = player modeltoworld [0,0,0];
_onLadder =(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder); 
_isWater = (surfaceIsWater _locationPlayer) or dayz_isSwimming;
_inVehicle = (vehicle player != player);
_isOk = [player,_building] call fnc_isInsideBuilding;
if (_inBuilding) then {
if (_isOk) then {deletevehicle _object; cutText [format["%1 cannot be built inside of buildings!",_text], "PLAIN DOWN",1];call _funcExitScript; };
};
_closestTown = (nearestLocations [player,["NameCityCapital","NameCity","NameVillage"],25600]) select 0;
_town_name = text _closestTown;
_town_pos = position _closestTown;
if (!_inTown) then {
for "_i" from 0 to ((count allbuild_notowns) - 1) do
{
_check_town = (allbuild_notowns select _i) select _i - _i;
if (_town_name == _check_town) then {
_townRange = (allbuild_notowns select _i) select _i - _i + 1;
if (_locationPlayer distance _town_pos <= _townRange) then {
 deletevehicle _object; cutText [format["You cannot build %1 within %2 meters of area %3",_text, _townRange, _town_name], "PLAIN DOWN",1];call _funcExitScript;
};
};
};
};
r_interrupt = false;
r_doLoop = true;
_cntLoop = 0;
switch (true) do
{
case(_longWait):
{
_cnt = _longWloop;
_cnt = _cnt * 10;
for "_i" from 0 to _longWloop do
{
cutText [format["Building %1.  %2 seconds left.\nMove from current position to cancel",_text,_cnt + 10], "PLAIN DOWN",1];
if (player distance _locationPlayer > 1) then {deletevehicle _object; cutText [format["Build canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; call _funcExitScript;};
if (!_canDo || _onLadder || _inVehicle || _isWater) then {deletevehicle _object; cutText [format["Build canceled for %1, player is unable to continue",_text], "PLAIN DOWN",1]; call _funcExitScript;};
player playActionNow "Medic";
sleep 1;
[player,"repair",0,false] call dayz_zombieSpeak;
_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
while {r_doLoop} do {
if (r_interrupt) then {
r_doLoop = false;
};
if (_cntLoop >= 100) then {
r_doLoop = false;
_finished = true;
};
sleep .1;
_cntLoop = _cntLoop + 1;
};
if (r_interrupt) then {
deletevehicle _object; 
[objNull, player, rSwitchMove,""] call RE;
player playActionNow "stop";
cutText [format["Build canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; 
procBuild = false;_playerCombat setVariable["startcombattimer", 1, true]; 
breakOut "exit";
};
r_doLoop = true;
_cntLoop = 0;
_cnt = _cnt - 10;
};
sleep 1.5;
};
case(_medWait):
{
_cnt = _medWloop;
_cnt = _cnt * 10;
for "_i" from 0 to _medWloop do
{
cutText [format["Building %1.  %2 seconds left.\nMove from current position to cancel",_text,_cnt + 10], "PLAIN DOWN",1];
if (player distance _locationPlayer > 1) then {deletevehicle _object; cutText [format["Build canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; call _funcExitScript;};
if (!_canDo || _onLadder || _inVehicle || _isWater) then {deletevehicle _object; cutText [format["Build canceled for %1, player is unable to continue",_text], "PLAIN DOWN",1]; call _funcExitScript;};
player playActionNow "Medic";
sleep 1;
[player,"repair",0,false] call dayz_zombieSpeak;
_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
while {r_doLoop} do {
if (r_interrupt) then {
r_doLoop = false;
};
if (_cntLoop >= 100) then {
r_doLoop = false;
_finished = true;
};
sleep .1;
_cntLoop = _cntLoop + 1;
};
if (r_interrupt) then {
deletevehicle _object; 
[objNull, player, rSwitchMove,""] call RE;
player playActionNow "stop";
cutText [format["Build canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; 
procBuild = false;_playerCombat setVariable["startcombattimer", 1, true]; 
breakOut "exit";
};
r_doLoop = true;
_cntLoop = 0;
_cnt = _cnt - 10;
};
sleep 1.5;
};
case(!_medWait && !_longWait):
{
_cnt = _smallWloop;
_cnt = _cnt * 10;
for "_i" from 0 to _smallWloop do
{
cutText [format["Building %1.  %2 seconds left.\nMove from current position to cancel",_text,_cnt + 10], "PLAIN DOWN",1];
if (player distance _locationPlayer > 1) then {deletevehicle _object; cutText [format["Build canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; call _funcExitScript;};
if (!_canDo || _onLadder || _inVehicle || _isWater) then {deletevehicle _object; cutText [format["Build canceled for %1, player is unable to continue",_text], "PLAIN DOWN",1]; call _funcExitScript;};
player playActionNow "Medic";
sleep 1;
[player,"repair",0,false] call dayz_zombieSpeak;
_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
while {r_doLoop} do {
if (r_interrupt) then {
r_doLoop = false;
};
if (_cntLoop >= 100) then {
r_doLoop = false;
_finished = true;
};
sleep .1;
_cntLoop = _cntLoop + 1;
};
if (r_interrupt) then {
deletevehicle _object; 
[objNull, player, rSwitchMove,""] call RE;
player playActionNow "stop";
cutText [format["Build canceled for %1, position of player moved",_text], "PLAIN DOWN",1]; 
procBuild = false;_playerCombat setVariable["startcombattimer", 1, true]; 
breakOut "exit";
};
r_doLoop = true;
_cntLoop = 0;
_cnt = _cnt - 10;
};
sleep 1.5;
};
};
_mags = magazines player;
_buildables = []; 
if ("ItemTankTrap" in _mags) then {
_qtyTankTrap = {_x == "ItemTankTrap"} count magazines player;
_buildables set [count _buildables, _qtyTankTrap];
_itemTankTrap = "ItemTankTrap";
} else { _qtyTankTrap = 0; _buildables set [count _buildables, _qtyTankTrap]; };
if ("ItemWire" in _mags) then {
_qtyWire = {_x == "ItemWire"} count magazines player;
_buildables set [count _buildables, _qtyWire]; 
_itemWire = "ItemWire";
} else { _qtyWire = 0; _buildables set [count _buildables, _qtyWire]; };
if ("ItemSandbag" in _mags) then {
_qtySandbag = {_x == "ItemSandbag"} count magazines player;
_buildables set [count _buildables, _qtySandbag]; 
_itemSandbag = "ItemSandbag";
} else { _qtySandbag = 0; _buildables set [count _buildables, _qtySandbag]; };
if ("PartWoodLumber" in _mags) then {
_qtyLumber = {_x == "PartWoodLumber"} count magazines player;
_buildables set [count _buildables, _qtyLumber]; 
_itemLumber = "PartWoodLumber";
} else { _qtyLumber = 0; _buildables set [count _buildables, _qtyLumber]; };
if ("PartWoodPlywood" in _mags) then {
_qtyPlywood = {_x == "PartWoodPlywood"} count magazines player;
_buildables set [count _buildables, _qtyPlywood]; 
_itemPlywood = "PartWoodPlywood";
} else { _qtyPlywood = 0; _buildables set [count _buildables, _qtyPlywood]; };
if ("HandGrenade_West" in _mags) then {
_qtyGrenade = {_x == "HandGrenade_West"} count magazines player;
_buildables set [count _buildables, _qtyGrenade]; 
_itemGrenade = "HandGrenade_West";
} else { _qtyGrenade = 0; _buildables set [count _buildables, _qtyGrenade]; };
if ("ItemSandbagLarge" in _mags) then {
_qtyHesco = {_x == "ItemSandbagLarge"} count magazines player;
_buildables set [count _buildables, _qtyHesco]; 
_itemHesco = "ItemSandbagLarge";
} else { _qtyHesco = 0; _buildables set [count _buildables, _qtyHesco]; };
if ("sandbag_nest_kit" in _mags) then {
_qtySandbagNest = {_x == "sandbag_nest_kit"} count magazines player;
_buildables set [count _buildables, _qtySandbagNest]; 
_itemSandbagNest = "sandbag_nest_kit";
} else { _qtySandbagNest = 0; _buildables set [count _buildables, _qtySandbagNest]; };
if ("PartGeneric" in _mags) then {
_qtyScrap = {_x == "PartGeneric"} count magazines player;
_buildables set [count _buildables, _qtyScrap]; 
_itemScrap = "PartGeneric";
} else { _qtyScrap = 0; _buildables set [count _buildables, _qtyScrap]; };
if ("ItemPole" in _mags) then {
_qtyPole = {_x == "ItemPole"} count magazines player;
_buildables set [count _buildables, _qtyPole]; 
_itemPole = "ItemPole";
} else { _qtyPole = 0; _buildables set [count _buildables, _qtyPole]; };
if ("ItemCorrugated" in _mags) then {
_qtyCorrugatedFence = {_x == "ItemCorrugated"} count magazines player;
_buildables set [count _buildables, _qtyCorrugatedFence]; 
_itemCorrugatedFence = "ItemCorrugated";
} else { _qtyCorrugatedFence = 0; _buildables set [count _buildables, _qtyCorrugatedFence]; };
if ("storage_shed_kit" in _mags) then {
_qtyStorageShed = {_x == "storage_shed_kit"} count magazines player;
_buildables set [count _buildables, _qtyStorageShed]; 
_itemStorageShed = "storage_shed_kit";
} else { _qtyStorageShed = 0; _buildables set [count _buildables, _qtyStorageShed]; };
if ("desert_net_kit" in _mags) then {
_qtyDesertCamoNet = {_x == "desert_net_kit"} count magazines player;
_buildables set [count _buildables, _qtyDesertCamoNet]; 
_itemDesertCamoNet = "desert_net_kit";
} else { _qtyDesertCamoNet = 0; _buildables set [count _buildables, _qtyDesertCamoNet]; };
if ("forest_net_kit" in _mags) then {
_qtyForestCamoNet = {_x == "forest_net_kit"} count magazines player;
_buildables set [count _buildables, _qtyForestCamoNet]; 
_itemForestCamoNet = "forest_net_kit";
} else { _qtyForestCamoNet = 0; _buildables set [count _buildables, _qtyForestCamoNet]; };
if ("wooden_shed_kit" in _mags) then {
_qtyWoodShed = {_x == "wooden_shed_kit"} count magazines player;
_buildables set [count _buildables, _qtyWoodShed]; 
_itemWoodShed = "wooden_shed_kit";
} else { _qtyWoodShed = 0; _buildables set [count _buildables, _qtyWoodShed]; };
if ("ItemBurlap" in _mags) then {
_qtyBurlap = {_x == "ItemBurlap"} count magazines player;
_buildables set [count _buildables, _qtyBurlap]; 
_itemBurlap = "ItemBurlap";
} else { _qtyBurlap = 0; _buildables set [count _buildables, _qtyBurlap]; };
if ("PartGlass" in _mags) then {
_qtyGlass = {_x == "PartGlass"} count magazines player;
_buildables set [count _buildables, _qtyGlass]; 
_itemGlass = "PartGlass";
} else { _qtyGlass = 0; _buildables set [count _buildables, _qtyGlass]; };
_result = [_buildables,_chosenRecipe] call BIS_fnc_areEqual;
if (_result) then {
if (!_isSimulated) then {
_object enablesimulation false;
};
if (!_isDestructable) then {
_object addEventHandler ["HandleDamage", {false}];
};
_uidDir = _dir;
_uidDir = round(_uidDir);
_uid = "";
{
_x = _x * 10;
if ( _x < 0 ) then { _x = _x * -10 };
_uid = _uid + str(round(_x));
} forEach _location;
_uid = _uid + str(round(_dir));
_coder = random(9999); 
if (_coder < 1000) then { 
_coder = _coder + 1000; 
};
_code = round _coder; 
switch (_classname) do
{
case "Grave":
{
cutText [format["You have constructed a %1, crawl prone so you it dosnt explode!",_text], "PLAIN DOWN",1];
_object setVariable ["isBomb", true];
};
default {
cutText [format["You have constructed a %1.\n",_text], "PLAIN DOWN",60]; 
};
};
if (_qtyTankTrap > 0) then {
for "_i" from 0 to _qtyTankTrap do
{
player removeMagazine _itemTankTrap;
};
};
if (_qtyWire > 0) then {
for "_i" from 0 to _qtyWire do
{
player removeMagazine _itemWire;
};
};
if (_qtySandbag > 0) then {
for "_i" from 0 to _qtySandbag do
{
player removeMagazine _itemSandbag;
};
};
if (_qtyLumber > 0) then {
for "_i" from 0 to _qtyLumber do
{
player removeMagazine _itemLumber;
};
};
if (_qtyPlywood > 0) then {
for "_i" from 0 to _qtyPlywood do
{
player removeMagazine _itemPlywood;
};
};
if (_qtyGrenade > 0 && _classname == "Grave") then {
for "_i" from 0 to _qtyGrenade do
{
player removeMagazine _itemGrenade;
};
};
if (_qtyHesco > 0) then {
for "_i" from 0 to _qtyHesco do
{
player removeMagazine _itemHesco;
};
};
if (_qtySandbagNest > 0) then {
for "_i" from 0 to _qtySandbagNest do
{
player removeMagazine _itemSandbagNest;
};
};
if (_qtyScrap > 0) then {
for "_i" from 0 to _qtyScrap do
{
player removeMagazine _itemScrap;
};
};
if (_qtyPole > 0) then {
for "_i" from 0 to _qtyPole do
{
player removeMagazine _itemPole;
};
};
if (_qtyCorrugatedFence > 0) then {
for "_i" from 0 to _qtyCorrugatedFence do
{
player removeMagazine _itemCorrugatedFence;
};
};
if (_qtyStorageShed > 0) then {
for "_i" from 0 to _qtyStorageShed do
{
player removeMagazine _itemStorageShed;
};
};
if (_qtyDesertCamoNet > 0) then {
for "_i" from 0 to _qtyDesertCamoNet do
{
player removeMagazine _itemDesertCamoNet;
};
};
if (_qtyForestCamoNet > 0) then {
for "_i" from 0 to _qtyForestCamoNet do
{
player removeMagazine _itemForestCamoNet;
};
};
if (_qtyWoodShed > 0) then {
for "_i" from 0 to _qtyWoodShed do
{
player removeMagazine _itemWoodShed;
};
};
if (_qtyBurlap > 0) then {
for "_i" from 0 to _qtyBurlap do
{
player removeMagazine _itemBurlap;
};
};
if (_qtyGlass > 0) then {
for "_i" from 0 to _qtyGlass do
{
player removeMagazine _itemGlass;
};
};
_distance = 30;
_canBuildOnPlot = false;
_findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], _distance];
_findNearestPole = [];
{if (alive _x) then {_findNearestPole set [(count _findNearestPole),_x];};} foreach _findNearestPoles;
_IsNearPlot = count (_findNearestPole);
if(_IsNearPlot == 0) then {
if(_isPole) then {
_canBuildOnPlot = true;
};
} else {
_nearestPole = _findNearestPole select 0;
_ownerID = _nearestPole getVariable["CharacterID","0"];
if(dayz_playerUID == _ownerID) then {
if(!_isPole) then {
_canBuildOnPlot = true;
};
} else {
if(!_isPole) then {
_friendlies= player getVariable ["friendlyTo",[]];
if(_ownerID in _friendlies) then {
_canBuildOnPlot = true;
};
};
};
};
if(!_canBuildOnPlot) exitWith {deletevehicle _object; cutText ["Abusing not allowed, materials deleted" , "PLAIN DOWN"]; };
if (_inBuilding) then {
if (_isOk) then {deletevehicle _object; cutText [format["Abusing not allowed, materials deleted",_text], "PLAIN DOWN",1];call _funcExitScript; };
};
_closestTown = (nearestLocations [player,["NameCityCapital","NameCity","NameVillage"],25600]) select 0;
_town_name = text _closestTown;
_town_pos = position _closestTown;
if (!_inTown) then {
for "_i" from 0 to ((count allbuild_notowns) - 1) do
{
_check_town = (allbuild_notowns select _i) select _i - _i;
if (_town_name == _check_town) then {
_townRange = (allbuild_notowns select _i) select _i - _i + 1;
if (_locationPlayer distance _town_pos <= _townRange) then {
 deletevehicle _object; cutText [format["You cannot build %1 within %2 meters of area %3",_text, _townRange, _town_name], "PLAIN DOWN",1];call _funcExitScript;
};
};
};
};
_buildings = nearestObjects [(vehicle player), ["Building"], 100];
{
_isBuilding = [(vehicle player),_x] call fnc_isInsideBuilding;
if(_isBuilding) exitWith {
_cancel = true;
_reason = "Abusing not allowed, materials deleted";
};
} forEach _buildings;
if (!_roadAllowed) then { 
_onRoad = isOnRoad getposATL(_object);
if(_onRoad) then {deletevehicle _object;cutText [format["You cannot build %1 on the road",_text], "PLAIN DOWN",1];call _funcExitScript;};
};
if(_isWater) then {cutText ["Abusing not allowed, materials deleted" , "PLAIN DOWN"];deleteVehicle _object;call _funcExitScript;};
if(_onLadder) then {cutText ["Abusing not allowed, materials deleted" , "PLAIN DOWN"];deleteVehicle _object;call _funcExitScript;};
if (_inVehicle) then {cutText ["Abusing not allowed, materials deleted" , "PLAIN DOWN"];deleteVehicle _object;call _funcExitScript;};
if (!placevault) then {cutText ["Abusing not allowed, materials deleted" , "PLAIN DOWN"];deleteVehicle _object;call _funcExitScript;};
_fuel = _code / 1000; 
_object setVariable ["characterID",dayz_playerUID,true];
PVDZE_obj_Publish = [dayz_playerUID,_object,[_dir,_location],_classname,_fuel,_code]; 
publicVariableServer "PVDZE_obj_Publish";
if (isServer) then {
PVDZE_obj_Publish call server_publishObj;
};
} else {cutText ["You need the EXACT amount of whatever you are trying to build without extras.", "PLAIN DOWN"];call _funcExitScript;};
player allowdamage true;
procBuild = false;_playerCombat setVariable["startcombattimer", 1, true];
