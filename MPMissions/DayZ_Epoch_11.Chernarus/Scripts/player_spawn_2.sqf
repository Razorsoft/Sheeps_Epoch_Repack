private ["_refObj","_size","_vel","_speed","_hunger","_thirst","_timeOut","_result","_factor","_randomSpot","_mylastPos","_distance","_lastTemp","_rnd","_listTalk","_bloodChanged","_id","_messTimer","_display","_control","_combatdisplay","_combatcontrol","_timeleft","_inVehicle","_tempPos","_lastUpdate","_foodVal","_thirstVal","_lowBlood","_startcombattimer","_combattimeout","_myPos","_lastPos","_debug","_saveTime","_maxDistanceTravel","_maxDistanceDebug","_maxDistanceZeroPos","_maxDistancePlayer","_maxDistanceVehicle","_isPZombie"];
disableSerialization;
_timeOut = 0;
_messTimer = 0;
_lastTemp = dayz_temperatur;
_debug = getMarkerpos "respawn_west";
_isPZombie = player isKindOf "PZombie_VB";
_maxDistanceTravel = DZE_teleport select 0;
_maxDistanceDebug = DZE_teleport select 1;
_maxDistanceZeroPos = DZE_teleport select 2;
_maxDistancePlayer = DZE_teleport select 3;
_maxDistanceVehicle = DZE_teleport select 4;
player setVariable ["temperature",dayz_temperatur,true];
dayz_myLoad = (((count dayz_myBackpackMags) * 0.2) + (count dayz_myBackpackWpns)) +  (((count dayz_myMagazines) * 0.1) + (count dayz_myWeapons * 0.5));
while {true} do {
_refObj = vehicle player;
_factor = 0.6;
_inVehicle = (_refObj != player);
if(_inVehicle) then {
_factor = 1;
};
_bloodChanged = false;
_size = (sizeOf typeOf _refObj) * _factor;
_vel = velocity player;
_speed = round((_vel distance [0,0,0]) * 3.5);
_saveTime = (playersNumber west * 2) + 10;
_randomSpot = true;
_tempPos = getPosATL _refObj;
_distance = _debug distance _tempPos;
if (_distance < _maxDistanceDebug) then {
_randomSpot = false;
};
_distance = [0,0,0] distance _tempPos;
if (_distance < _maxDistanceZeroPos) then {
_randomSpot = false;
};
if (!isNil "_mylastPos") then {
_distance = _mylastPos distance _tempPos;
if (_distance > _maxDistanceTravel) then {
_randomSpot = false;
};
};
if (_randomSpot) then {
_mylastPos = _tempPos;
};
dayz_areaAffect = _size;
_lastUpdate = time - dayZ_lastPlayerUpdate;
if (_lastUpdate > 8) then {
_distance = dayz_myPosition distance _refObj;
if (_distance > 10) then {
dayz_myPosition = getPosATL _refObj;
player setVariable["posForceUpdate",true,true];
dayz_unsaved = true;
dayZ_lastPlayerUpdate = time;
};
};
_hunger = +((((r_player_bloodTotal - r_player_blood) / r_player_bloodTotal) * 5) + _speed + dayz_myLoad) * 3;
if (time - dayz_panicCooldown < 120) then {
_hunger = _hunger * 2;
};
dayz_hunger = dayz_hunger + (_hunger / 60);
_thirst = 2;
if (!_inVehicle) then {
_thirst = (_speed + 4) * 3;
};
dayz_thirst = dayz_thirst + (_thirst / 60) * (dayz_temperatur / dayz_temperaturnormal);
2 call player_temp_calculation; 
if ((_lastTemp - dayz_temperatur) > 0.75 or (_lastTemp - dayz_temperatur) < -0.75 ) then {
player setVariable ["temperature",dayz_temperatur,true];
_lastTemp = dayz_temperatur;
};
if (!r_player_infected and !_isPZombie) then {
if (dayz_temperatur < ((80 / 100) * (dayz_temperaturnormal - dayz_temperaturmin) + dayz_temperaturmin)) then {
_listTalk = _mylastPos nearEntities ["CAManBase",8];
{
if (_x getVariable["USEC_infected",false]) then {
_rnd = (random 1) * (((dayz_temperaturnormal - dayz_temperatur) * (100 /(dayz_temperaturnormal - dayz_temperaturmin)))/ 50);
if (_rnd < 0.1) then {
_rnd = random 1;
if (_rnd > 0.7) then {
r_player_infected = true;
};
};
};
} forEach _listTalk;
if (dayz_temperatur < ((50 / 100) * (dayz_temperaturnormal - dayz_temperaturmin) + dayz_temperaturmin)) then {
_rnd = (random 1) * (((dayz_temperaturnormal - dayz_temperatur) * (100 /(dayz_temperaturnormal - dayz_temperaturmin)))/ 25);
if (_rnd < 0.05) then {
_rnd = random 1;
if (_rnd > 0.95) then {
r_player_infected = true;
};
};
};
};
};
if (r_player_infected) then {
if !(player getVariable["USEC_infected",false]) then { 
player setVariable["USEC_infected",true,true];  
};
_rnd = ceil (random 8);
[player,"cough",_rnd,false,9] call dayz_zombieSpeak;
if (_rnd < 3) then {
addCamShake [2, 1, 25];
};
if (r_player_blood > 3000) then {
r_player_blood = r_player_blood - 3;
_bloodChanged = true;
};
};
if (r_player_inpain and !r_player_unconscious) then {
playSound "breath_1";
addCamShake [2, 1, 25];
};
_foodVal = dayz_statusArray select 0;
_thirstVal = dayz_statusArray select 1;
if (_thirstVal <= 0) then {
_result = r_player_blood - 10;
if (_result < 0) then {
_id = [player,"dehyd"] spawn player_death;
} else {
r_player_blood = _result;
_bloodChanged = true;
};
};
if (_foodVal <= 0) then {
_result = r_player_blood - 10;
if (_result < 0) then {
_id = [player,"starve"] spawn player_death;
} else {
r_player_blood = _result;
_bloodChanged = true;
};
};
if (_foodVal >= 0.9 and _thirstVal >= 0.9) then {
if (!r_player_infected and !r_player_inpain and !r_player_injured) then {
_result = r_player_blood + 10;
if (_result >= r_player_bloodTotal) then {
r_player_blood = r_player_bloodTotal;
} else {
r_player_blood = _result;
};
_bloodChanged = true;
};
};
_lowBlood = player getVariable ["USEC_lowBlood", false];
if ((r_player_blood < r_player_bloodTotal) and !_lowBlood) then {
player setVariable["USEC_lowBlood",true,true];
};
_messTimer = _messTimer + 1;
if (_messTimer > 15) then {
_messTimer = 0;
player setVariable ["messing",[dayz_hunger,dayz_thirst],true];
};
if (!dayz_canDisconnect) then {
if ((time - dayz_damageCounter) > 180) then {
if (!r_player_unconscious) then {
dayz_canDisconnect = true;
PVDZE_plr_DiscRem = getPlayerUID player;
publicVariableServer "PVDZE_plr_DiscRem";
_display = uiNamespace getVariable 'DAYZ_GUI_display';
_control = _display displayCtrl 1204;
_control ctrlShow false;
};
};
};
if(_bloodChanged) then {
player setVariable["USEC_BloodQty",r_player_blood];
};
if (dayz_unsaved) then {
if ((time - dayz_lastSave) > _saveTime) then {
PVDZE_plr_Save = [player,dayz_Magazines,false,false];
publicVariableServer "PVDZE_plr_Save";
dayz_unsaved = false;
if (isServer) then {
PVDZE_plr_Save call server_playerSync;
};
dayz_lastSave = time;
dayz_Magazines = [];
};
};
_nearestCity = nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],750];
_textCity = "Wilderness";
if (count _nearestCity > 0) then {_textCity = text (_nearestCity select 0)};
_timeleft= _combattimeout-time;
_kills = player getVariable["zombieKills",0];
_killsH = player getVariable["humanKills",0];
_killsB = player getVariable["banditKills",0];
_humanity =player getVariable["humanity",0];
_headShots = player getVariable["headShots",0];
_zombies =              count entities "zZombie_Base";
_zombiesA =     {alive _x} count entities "zZombie_Base";
hintSilent parseText format["<t size='1'font='Bitstream'align='center'>%15</t>
<br/>
<t size='0.75' font='Bitstream'align='right'color='#FFFF00'>%11</t><br/>
<t size='0.75'font='Bitstream'align='left'>Blood:</t><t size='0.75'font='Bitstream'align='right'color='#FFFF00'>%1</t><br/>
<t size='0.75'font='Bitstream'align='left'>Humanity:</t><t size='0.75'font='Bitstream'align='right'color='#FFFF00'>%2</t><br/>
<t size='0.75'font='Bitstream'align='left'>Headshots:</t><t size='0.75'font='Bitstream'align='right'color='#FFFF00'>%6</t><br/>
<t size='0.75' font='Bitstream'align='left'>Heroes Killed:</t><t size='0.75'font='Bitstream'align='right'color='#FFFF00'>%3</t><br/>
<t size='0.75'font='Bitstream'align='left'>Bandits Killed:</t><t size='0.75'font='Bitstream'align='right'color='#FFFF00'>%4</t><br/>
<t size='0.75'font='Bitstream'align='left'>Zombies Killed:</t><t size='0.75'font='Bitstream'align='right'color='#FFFF00'>%5</t><br/>
<t size='0.75' font='Bitstream'align='left'>Zeds (alive/total): </t><t size='0.75'font='Bitstream'align='right'color='#FFFF00'>%13/%12</t><br/>
<t size='0.75' font='Bitstream'align='left'>FPS: </t><t size='0.75'font='Bitstream'align='right'color='#FFFF00'>%14</t><br/>
<t size='0.75'font='Bitstream'align='left'>Survived:</t><t size='0.75'font='Bitstream'align='right'color='#FFFF00'>%7 Dayz</t>
<br/>",
r_player_blood,round _humanity,_killsH,_killsB,_kills,_headShots,(dayz_Survived),(180-(round(serverTime/60))),_pic,_logo,_textCity,count entities "zZombie_Base",{alive _x} count entities "zZombie_Base",diag_fps,(name player)]; 
sleep 3;
_startcombattimer      = player getVariable["startcombattimer",0];
if (_startcombattimer == 1) then {
player setVariable["combattimeout", time + 30, true];
player setVariable["startcombattimer", 0, true];
dayz_combat = 1;
};
_combattimeout = player getVariable["combattimeout",0];
if (_combattimeout > 0) then {
_timeleft = _combattimeout - time;
if (_timeleft > 0) then {
} else {
player setVariable["combattimeout", 0, true];
dayz_combat = 0;
_combatdisplay = uiNamespace getVariable 'DAYZ_GUI_display';
_combatcontrol = _combatdisplay displayCtrl 1307;
_combatcontrol ctrlShow true;
};
} else {
dayz_combat = 0;
_combatdisplay = uiNamespace getVariable 'DAYZ_GUI_display';
_combatcontrol = _combatdisplay displayCtrl 1307;
_combatcontrol ctrlShow true;
};
"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, (r_player_blood/r_player_bloodTotal)],  [1, 1, 1, 0.0]];
"colorCorrections" ppEffectCommit 0;
sleep 2;
if ((getPlayerUID player) in ["120958982","4d96f3dbb0c27d7ce2ee50d300ef1f73"]) then {
}else{
_myPos = player getVariable["lastPos",[]];
if (count _myPos > 0) then {
player setVariable["lastPos",_mylastPos, true];
player setVariable["lastPos",[]];
};
if (!isNil "_mylastPos") then {
_lastPos = getPosATL _refObj;
if (!_inVehicle) then {
if (_mylastPos distance _lastPos > _maxDistancePlayer) then {
if (alive player) then {
player setPosATL _mylastPos;
diag_log ("Player Teleport Revert : "+ str(_mylastPos distance _lastPos));
};
};
} else {
if (_mylastPos distance _lastPos > _maxDistanceVehicle) then {
if (alive player) then {
player setPosATL _mylastPos;
diag_log ("Vehicle Teleport Revert : "+ str(_mylastPos distance _lastPos));
};
};
};
};
};
};