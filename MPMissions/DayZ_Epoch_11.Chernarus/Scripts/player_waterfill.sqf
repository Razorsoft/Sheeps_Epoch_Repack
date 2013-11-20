
private["_Building","_display","_vehicle","_inVehicle","_RainAmt","_HeavyRailFillTime","_MediumRainFillTime","_LightRainFillTime","_playerPos","_canFill","_isRain","_isPond","_isWell","_pondPos","_objectsWell","_onLadder","_hasbottleitem","_config","_item","_text","_objectsPond","_qty","_dis","_sfx"];
_stagnant_water_rates = 25;
call gear_ui_init;
_item = _this;
_playerPos = getPosATL player;
_canFill = count nearestObjects [_playerPos, ["Land_pumpa","Land_water_tank"], 4] > 0;
_isPond = false;
_isWell = false;
_isRain = false;
_pondPos = [];
_objectsWell = [];
_hasbottleitem = _this in magazines player; 
_config = configFile >> "CfgMagazines" >> _item;
_text = getText (_config >> "displayName");
_HeavyRainFillTime = 12;
_MediumRainFillTime = 18;
_LightRainFillTime = 26;
_CleanRainWater = true;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith { cutText [format["You cannot fill a water bottle while on a ladder."], "PLAIN DOWN"]; };
if (!_hasbottleitem) exitWith {cutText [format[(localize "str_player_31"),_text,(localize "str_player_31_fill")] , "PLAIN DOWN"]};
_vehicle = vehicle player;
_inVehicle = (_vehicle != player);
if (_inVehicle) exitwith {cutText [format["You may not do this while in a vehicle."] , "PLAIN DOWN"]};
_RainAmt = drn_var_DynamicWeather_Rain;
if (_RainAmt > 0) then { _isRain = true; };
if (!_canFill) then {
 _objectsWell = nearestObjects [_playerPos, [], 4];
 {
 _isWell = ["_well",str(_x),false] call fnc_inString;
 if (_isWell) then {_canFill = true};
 } forEach _objectsWell;
};
if (!_canFill) then {
 _objectsPond = nearestObjects [_playerPos, [], 50];
 {
 _isPond = ["pond",str(_x),false] call fnc_inString;
 if (_isPond) then {
 _pondPos = (_x worldToModel _playerPos) select 2;
 if (_pondPos < 0) then {
 _canFill = true;
 };
 };
 } forEach _objectsPond;
};
if (_canFill) then {
 _Qty = {_x == "ItemWaterbottleUnfilled"} count magazines player;
 if (!dayz_isSwimming) then {
 player playActionNow "PutDown";
 };
 if ("ItemWaterbottleUnfilled" in magazines player) then {
 player removeMagazines "ItemWaterbottleUnfilled";
 for "_x" from 1 to _qty do {
 sleep 1;
 _dis = 5;
 _sfx = "fillwater";
 [player,_sfx,0,false,_dis] call dayz_zombieSpeak;
 [player,_dis,true,(getPosATL player)] spawn player_alertZombies;

 player addMagazine "ItemWaterbottle";
 };
 if (_Qty > 1) then {
 cutText [format["You have filled %1 water bottles.",_Qty], "PLAIN DOWN"];
 } else {
 cutText [format["You have refilled your water bottle."], "PLAIN DOWN"];
 };
 } else {
 cutText [format["You have no empty water bottles to fill."], "PLAIN DOWN"];
 };
};

if (!_canFill and !_isRain) exitwith {
 cutText [format["You must be near a water source (a pond or well) or it must be raining to refill water bottle(s)."], "PLAIN DOWN"];
};

if (!_canFill and _isRain and ("ItemWaterbottleUnfilled" in magazines player)) then {
 if (dayz_isSwimming) exitwith { cutText [format["You must not be swimming to refill your water bottle in the rain."], "PLAIN DOWN"]; };
 if (dayz_inside) exitwith { cutText [format["You must be outside of a building or structure to fill with rain water."], "PLAIN DOWN"]; };
 _startRefillTime = time;
 r_interrupt = false;
 r_doLoop = true;
 _interrupted = false;
 _Qty = {_x == "ItemWaterbottleUnfilled"} count magazines player;
 player playActionNow "PutDown";
 [player,"fillwater",0,false,5] call dayz_zombieSpeak;
 [player,5,true,(getPosATL player)] spawn player_alertZombies;
 _RefillTime = _LightRainFillTime;
 if (_RainAmt > 0.53) then { 
 _RefillTime = _HeavyRainFillTime; };
 if (_RainAmt > 0.25) then {
 _RefillTime = _MediumRainFillTime; }; 
 if (_RainAmt < 0.25) then {
 _RefillTime = _LightRainFillTime; }; 
 if (_Qty == 1) then {
 cutText [format["You begin filling the empty water bottle. This will take %1 seconds. Do not interrupt.",_RefillTime], "PLAIN DOWN"];
 } else {
 cutText [format["You begin filling %1 empty water bottles. This will take %2 seconds. Do not interrupt.",_Qty,_RefillTime], "PLAIN DOWN"];
 };
 while {r_doLoop} do { 
 if (!r_interrupt) then {
 if ((time - _startRefillTime) <= _RefillTime) then {
 player playActionNow "PutDown";
 } else {     
 r_doLoop = false;
 };
 _RainAmt = drn_var_DynamicWeather_Rain; 
 if (_RainAmt < 0.025) then {
 cutText [format["The rain has stopped. Water bottle filling has been interrupted."], "PLAIN DOWN"];
 r_doLoop = false;
 r_action = false;
 _interrupted = true;
 };
 };
  if (r_interrupt) then {
 cutText [format["Water bottle filling interrupted."], "PLAIN DOWN"];
 r_doLoop = false;
 r_action = false;
 _interrupted = true;
  }; 
 };
 r_doLoop = false;
 if (!_interrupted) then {
 if (_CleanRainWater) then {
 if (_Qty == 1) then {
 cutText [format["You've successfully filled your water bottle with safe to drink, clean rain water."], "PLAIN DOWN"];
 } else {
 cutText [format["You've successfully filled %1 water bottles with safe to drink, clean rain water.",_Qty], "PLAIN DOWN"]; 
 };
 } else {
  if (_Qty == 1) then {
 cutText [format["You've successfully filled your water bottle with rain water. Boil to make safe."], "PLAIN DOWN"];
 } else {
 cutText [format["You've successfully filled %1 water bottles with rain water. Boil to make safe.",_Qty], "PLAIN DOWN"]; 
 };
 };
 player removeMagazines "ItemWaterbottleUnfilled";
 for "_x" from 1 to _Qty do {
 if (_CleanRainWater) then {
  player addMagazine "ItemWaterbottleboiled";
 } else {
  player addMagazine "ItemWaterbottle"; 
 };
 };
 }; 
};