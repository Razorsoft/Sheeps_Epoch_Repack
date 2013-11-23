adminScript = true;
busrouteScript = true;
safeZoneCommander = false;
fastRope = true;
snowstorm = true;
houselights = true;
streetlights = true;
towerlights = true;
refuelScript = true;
nametags = true;
liftTow = true;
SargeAI = true;
_snowChance = 10;
/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];


dayZ_instance =	11;					
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;
DZE_teleport = [14000,14000,14000,14000,14000]; 

player setVariable ["BIS_noCoreConversations", true];

enableRadio false;


spawnShoremode = 1; 
spawnArea= 1500; 
MaxHeliCrashes= 5; 
MaxVehicleLimit = 300; 
MaxDynamicDebris = 500; 
dayz_MapArea = 14000; 
dayz_maxLocalZombies = 30; 

dayz_paraSpawn = false;

dayz_maxAnimals = 8; 
dayz_tameDogs = true;
DynamicVehicleDamageLow = 0; 
DynamicVehicleDamageHigh = 100; 

EpochEvents = [["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];
dayz_fullMoonNights = true;


call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	
progressLoadingScreen 0.4;

call compile preprocessFileLineNumbers "Scripts\compiles.sqf";  				
call compile preprocessFileLineNumbers "Scripts\variables.sqf";
call compile preprocessFileLineNumbers "dayz_code\init\settings.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";				
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

/* BIS_Effects_* fixes from Dwarden */
BIS_Effects_EH_Killed = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\killed.sqf";
BIS_Effects_AirDestruction = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\AirDestruction.sqf";
BIS_Effects_AirDestructionStage2 = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\AirDestructionStage2.sqf";

BIS_Effects_globalEvent = {
	BIS_effects_gepv = _this;
	publicVariable "BIS_effects_gepv";
	_this call BIS_Effects_startEvent;
};

BIS_Effects_startEvent = {
	switch (_this select 0) do {
		case "AirDestruction": {
				[_this select 1] spawn BIS_Effects_AirDestruction;
		};
		case "AirDestructionStage2": {
				[_this select 1, _this select 2, _this select 3] spawn BIS_Effects_AirDestructionStage2;
		};
		case "Burn": {
				[_this select 1, _this select 2, _this select 3, false, true] spawn BIS_Effects_Burn;
		};
	};
};

"BIS_effects_gepv" addPublicVariableEventHandler {
	(_this select 1) call BIS_Effects_startEvent;
};

if ((!isServer) && (isNull player) ) then
{
waitUntil {!isNull player};
waitUntil {time > 3};
};

if ((!isServer) && (player != player)) then
{
  waitUntil {player == player}; 
  waitUntil {time > 3};
};

if (isServer) then {
	call compile preprocessFileLineNumbers "dynamic_vehicle.sqf";				
	dogOwner = [];
	_nil = [] execVM "mission.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
	
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
		_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
		_void = [] execVM "R3F_Realism\R3F_Realism_Init.sqf";
	};

if (busrouteScript) then {
	if (isServer) then {
		
		[true] execVM "Scripts\init_bus.sqf";
	};

	if (!isDedicated) then {
		
		[] execVM "Scripts\player_axeBus.sqf";
	};
};
if (houselights) then {
	if (!isDedicated) then {
	[] execVM "Scripts\house_lights.sqf";
	};
};
if (streetlights) then {
	if (isServer) then {
	axe_server_lampObjs =    compile preprocessFileLineNumbers "Scripts\fnc_returnLampWS.sqf";
		"axeLampObjects" addPublicVariableEventHandler {_id = (_this select 1) spawn axe_server_lampObjs};
	};
	 
	if (!isDedicated) then {
	
	[] execVM "Scripts\street_lights.sqf";
	};
};
if (towerlights) then {
	if (!isDedicated) then {
	
	[] execVM "Scripts\tower_lights.sqf";
	};
};
if (refuelScript) then {
	if (!isDedicated) then {
	
	[] execVM "Scripts\kh_actions.sqf";
	};
};
if (fastRope) then {
sleep 1; _fast_rope = [] execVM "Scripts\BTC_fast_roping_init.sqf";
};
if (nametags) then {
	execVM "Scripts\skaronametags.sqf";
};
if (liftTow) then {
	[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
};
if (snowstorm)then{
	
	if (floor (random 100) < _snowChance)then{
		if (!isDedicated) then {
			[] execVM "Scripts\snow.sqf";
		};
	};
};
if(safeZoneCommander)then{
	[] execvm 'Scripts\agn_SafeZoneCommander.sqf';
};
if(adminScript)then{
	[] execVM "admintools\Activate.sqf";
};
if(SargeAI)then{
	call compile preprocessfile "addons\SHK_pos\shk_pos_init.sqf";
	call compile preprocessFileLineNumbers "addons\UPSMON\scripts\Init_UPSMON.sqf";
	
	[] execVM "addons\SARGE\SAR_AI_init.sqf";
};

#include "\z\addons\dayz_code\system\REsec.sqf"
