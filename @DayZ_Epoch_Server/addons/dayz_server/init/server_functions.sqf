waituntil {!isnil "bis_fnc_init"};

BIS_MPF_remoteExecutionServer = {
	if ((_this select 1) select 2 == "JIPrequest") then {
		[nil,(_this select 1) select 0,"loc",rJIPEXEC,[any,any,"per","execVM","ca\Modules\Functions\init.sqf"]] call RE;
	};
};

BIS_Effects_Burn =			{};
server_playerLogin =		compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerLogin.sqf";
server_playerSetup =		compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerSetup.sqf";
server_onPlayerDisconnect = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_onPlayerDisconnect.sqf";
server_updateObject =		compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_updateObject.sqf";
server_playerDied =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerDied.sqf";
server_publishObj = 		compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_publishObject.sqf";	//Creates the object in DB
server_deleteObj =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_deleteObj.sqf"; 	//Removes the object from the DB
server_swapObject =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_swapObject.sqf"; 
server_publishVeh = 		compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_publishVehicle.sqf"; // Custom to add vehicles
server_publishVeh2 = 		compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_publishVehicle2.sqf"; // Custom to add vehicles
server_tradeObj = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_tradeObject.sqf";
server_traders = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_traders.sqf";
server_playerSync =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerSync.sqf";
zombie_findOwner =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\zombie_findOwner.sqf";
server_updateNearbyObjects =	compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_updateNearbyObjects.sqf";
server_spawnCrashSite  =    compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_spawnCrashSite.sqf";

server_spawnC130CrashSite = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_spawnC130CrashSite.sqf";

server_handleZedSpawn =		compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_handleZedSpawn.sqf";
server_spawnEvents =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_spawnEvent.sqf";
server_airRaid = compile preprocessFileLineNumbers "z\addons\dayz_server\compile\server_airRaid.sqf";

fnc_plyrHit   = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\fnc_plyrHit.sqf";
server_deaths = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerDeaths.sqf";
fnc_hTime = compile preprocessFile "\z\addons\dayz_server\Missions\misc\fnc_hTime.sqf"; //Random integer selector for mission wait time


vehicle_handleInteract = {
	private["_object"];
	_object = _this select 0;
	needUpdate_objects = needUpdate_objects - [_object];
	[_object, "all"] call server_updateObject;
};

vehicle_handleServerKilled = {
	private["_unit","_killer"];
	_unit = _this select 0;
	_killer = _this select 1;
		
	[_unit, "killed"] call server_updateObject;
	
	_unit removeAllMPEventHandlers "MPKilled";
	_unit removeAllEventHandlers "Killed";
	_unit removeAllEventHandlers "HandleDamage";
	_unit removeAllEventHandlers "GetIn";
	_unit removeAllEventHandlers "GetOut";
};

object_handleServerKilled = {
	private["_unit","_objectID","_objectUID"];
	_unit = _this select 0;
	
	_objectID =	 _unit getVariable ["ObjectID","0"];
	_objectUID = _unit getVariable ["ObjectUID","0"];
		
	[_objectID,_objectUID] call server_deleteObj;
	
	_unit removeAllMPEventHandlers "MPKilled";
	_unit removeAllEventHandlers "Killed";
	_unit removeAllEventHandlers "HandleDamage";
	_unit removeAllEventHandlers "GetIn";
	_unit removeAllEventHandlers "GetOut";
};

check_publishobject = {
	private["_allowed","_object","_playername"];

	_object = _this select 0;
	_playername = _this select 1;
	
	_allowed = false;
       
	//diag_log format ["DEBUG: Checking if Object: %1 is allowed published by %2", _object, _playername];

	//if (((typeOf _object) in dayz_allowedObjects) or ((typeOf _object) in _allowedObjects) or ((typeOf _object) in allbuildables_class)) then {
	//		diag_log format ["DEBUG: Object: %1 published by %2 is Safe",_object, _playername];
			_allowed = true;
	//};
    _allowed
};

//event Handlers
eh_localCleanup =			{
	private ["_object"];
	_object = _this select 0;
	_object addEventHandler ["local", {
		if(_this select 1) then {
			private["_type","_unit"];
			_unit = _this select 0;
			_type = typeOf _unit;
			 _myGroupUnit = group _unit;
 			_unit removeAllMPEventHandlers "mpkilled";
 			_unit removeAllMPEventHandlers "mphit";
 			_unit removeAllMPEventHandlers "mprespawn";
 			_unit removeAllEventHandlers "FiredNear";
			_unit removeAllEventHandlers "HandleDamage";
			_unit removeAllEventHandlers "Killed";
			_unit removeAllEventHandlers "Fired";
			_unit removeAllEventHandlers "GetOut";
			_unit removeAllEventHandlers "GetIn";
			_unit removeAllEventHandlers "Local";
			clearVehicleInit _unit;
			deleteVehicle _unit;
			deleteGroup _myGroupUnit;
			_unit = nil;
			diag_log ("CLEANUP: DELETED A " + str(_type) );
		};
	}];
};

server_hiveWrite = {
	private["_data"];
	//diag_log ("ATTEMPT WRITE: " + _this);
	_data = "HiveExt" callExtension _this;
	//diag_log ("WRITE: " +str(_data));
};

server_hiveReadWrite = {
	private["_key","_resultArray","_data"];
	_key = _this;
	//diag_log ("ATTEMPT READ/WRITE: " + _key);
	_data = "HiveExt" callExtension _key;
	//diag_log ("READ/WRITE: " +str(_data));
	_resultArray = call compile format ["%1",_data];
	_resultArray
};

server_characterSync = {
	private ["_characterID","_playerPos","_playerGear","_playerBackp","_medical","_currentState","_currentModel","_key"];
	_characterID = 	_this select 0;	
	_playerPos =	_this select 1;
	_playerGear =	_this select 2;
	_playerBackp =	_this select 3;
	_medical = 		_this select 4;
	_currentState =	_this select 5;
	_currentModel = _this select 6;
	
	_key = format["CHILD:201:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:",_characterID,_playerPos,_playerGear,_playerBackp,_medical,false,false,0,0,0,0,_currentState,0,0,_currentModel,0];
	//diag_log ("HIVE: WRITE: "+ str(_key) + " / " + _characterID);
	_key call server_hiveWrite;
};

//onPlayerConnected 		"[_uid,_name] spawn server_onPlayerConnect;";
onPlayerDisconnected 		"[_uid,_name] call server_onPlayerDisconnect;";

// Setup globals allow overwrite from init.sqf
if(isnil "dayz_MapArea") then {
	dayz_MapArea = 10000;
};
if(isnil "DynamicVehicleArea") then {
	DynamicVehicleArea = dayz_MapArea / 2;
};

// Get all buildings and roads only once TODO: set variables to nil after done if nessicary 
MarkerPosition = getMarkerPos "center";
RoadList = MarkerPosition nearRoads DynamicVehicleArea;

BuildingList = [];
{
	if (isClass (configFile >> "CfgBuildingLoot" >> (typeOf _x))) then
	{
		BuildingList set [count BuildingList,_x];
	};
} forEach (MarkerPosition nearObjects ["building",DynamicVehicleArea]);

spawn_vehicles = {
	private ["_weights","_isOverLimit","_isAbort","_counter","_index","_vehicle","_velimit","_qty","_isAir","_isShip","_position","_dir","_istoomany","_veh","_objPosition","_marker","_iClass","_itemTypes","_cntWeights","_itemType","_num","_allCfgLoots"];
	
	if (isDedicated) then {
		
		_isOverLimit = true;
		_isAbort = false;
		_counter = 0;
		while {_isOverLimit} do {

			waitUntil{!isNil "BIS_fnc_selectRandom"};
			_index = AllowedVehiclesList call BIS_fnc_selectRandom;

			_vehicle = _index select 0;
			_velimit = _index select 1;

			_qty = {_x == _vehicle} count serverVehicleCounter;

			// If under limit allow to proceed
			if(_qty <= _velimit) then {
				_isOverLimit = false;
			};

			// counter to stop after 5 attempts
			_counter = _counter + 1;

			if(_counter >= 5) then {
				_isOverLimit = false;
				_isAbort = true;
			};
		};

		if (_isAbort) then {
			diag_log("DEBUG: unable to find sutable vehicle to spawn");
		} else {

			// add vehicle to counter for next pass
			serverVehicleCounter set [count serverVehicleCounter,_vehicle];
		
			// Find Vehicle Type to better control spawns
			_isAir = _vehicle isKindOf "Air";
			_isShip = _vehicle isKindOf "Ship";
		
			if(_isShip || _isAir) then {
				if(_isShip) then {
					// Spawn anywhere on coast on water
					waitUntil{!isNil "BIS_fnc_findSafePos"};
					_position = [MarkerPosition,0,DynamicVehicleArea,10,1,2000,1] call BIS_fnc_findSafePos;
					//diag_log("DEBUG: spawning boat near coast " + str(_position));
				} else {
					// Spawn air anywhere that is flat
					waitUntil{!isNil "BIS_fnc_findSafePos"};
					_position = [MarkerPosition,0,DynamicVehicleArea,10,0,2000,0] call BIS_fnc_findSafePos;
					//diag_log("DEBUG: spawning air anywhere flat " + str(_position));
				};
			
			
			} else {
				// Spawn around buildings and 50% near roads
				if((random 1) > 0.5) then {
				
					waitUntil{!isNil "BIS_fnc_selectRandom"};
					_position = RoadList call BIS_fnc_selectRandom;
				
					_position = _position modelToWorld [0,0,0];
				
					waitUntil{!isNil "BIS_fnc_findSafePos"};
					_position = [_position,0,10,10,0,2000,0] call BIS_fnc_findSafePos;
				
					//diag_log("DEBUG: spawning near road " + str(_position));
				
				} else {
				
					waitUntil{!isNil "BIS_fnc_selectRandom"};
					_position = BuildingList call BIS_fnc_selectRandom;
				
					_position = _position modelToWorld [0,0,0];
				
					waitUntil{!isNil "BIS_fnc_findSafePos"};
					_position = [_position,0,40,5,0,2000,0] call BIS_fnc_findSafePos;
				
					//diag_log("DEBUG: spawning around buildings " + str(_position));
			
				};
			};
			// only proceed if two params otherwise BIS_fnc_findSafePos failed and may spawn in air
			if ((count _position) == 2) then { 
		
				_dir = round(random 180);
			
				_istoomany = _position nearObjects ["AllVehicles",50];
				if((count _istoomany) > 0) exitWith { diag_log("DEBUG: Too many vehicles at " + str(_position)); };
			
				//place vehicle 
				_veh = createVehicle [_vehicle, _position, [], 0, "CAN_COLLIDE"];
				_veh setdir _dir;
				_veh setpos _position;		
				
				if(DZEdebug) then {
					_marker = createMarker [str(_position) , _position];
					_marker setMarkerShape "ICON";
					_marker setMarkerType "DOT";
					_marker setMarkerText _vehicle;
				};	
			
				// Get position with ground
				_objPosition = getPosATL _veh;
			
				clearWeaponCargoGlobal  _veh;
				clearMagazineCargoGlobal  _veh;
				// _veh setVehicleAmmo DZE_vehicleAmmo;

				// Add 0-3 loots to vehicle using random cfgloots 
				_num = floor(random 4);
				_allCfgLoots = ["trash","civilian","food","generic","medical","military","policeman","hunter","worker","clothes","militaryclothes","specialclothes","trash"];
				
				for "_x" from 1 to _num do {
					_iClass = _allCfgLoots call BIS_fnc_selectRandom;

					_itemTypes = [] + ((getArray (configFile >> "cfgLoot" >> _iClass)) select 0);
					_index = dayz_CLBase find _iClass;
					_weights = dayz_CLChances select _index;
					_cntWeights = count _weights;
					
					_index = floor(random _cntWeights);
					_index = _weights select _index;
					_itemType = _itemTypes select _index;
					_veh addMagazineCargoGlobal [_itemType,1];
					//diag_log("DEBUG: spawed loot inside vehicle " + str(_itemType));
				};

				[_veh,[_dir,_objPosition],_vehicle,true,"0"] call server_publishVeh;
			};
		};
	};
};

spawn_ammosupply = {
	private ["_position","_veh","_istoomany","_marker","_spawnveh","_WreckList"];
	if (isDedicated) then {
		_WreckList = ["Supply_Crate_DZE"];
		waitUntil{!isNil "BIS_fnc_selectRandom"};
		_position = RoadList call BIS_fnc_selectRandom;
		_position = _position modelToWorld [0,0,0];
		waitUntil{!isNil "BIS_fnc_findSafePos"};
		_position = [_position,5,20,5,0,2000,0] call BIS_fnc_findSafePos;
		if ((count _position) == 2) then {

			_istoomany = _position nearObjects ["All",5];
			
			if((count _istoomany) > 0) exitWith { diag_log("DEBUG VEIN: Too many at " + str(_position)); };
			
			_spawnveh = _WreckList call BIS_fnc_selectRandom;

			if(DZEdebug) then {
				_marker = createMarker [str(_position) , _position];
				_marker setMarkerShape "ICON";
				_marker setMarkerType "DOT";
				_marker setMarkerText str(_spawnveh);
			};
			
			_veh = createVehicle [_spawnveh,_position, [], 0, "CAN_COLLIDE"];
			_veh enableSimulation false;
			_veh setDir round(random 360);
			_veh setpos _position;
			_veh setVariable ["ObjectID","1",true];
		};
	};
};


spawn_roadblocks = {
	private ["_position","_veh","_istoomany","_marker","_spawnveh","_WreckList"];
	_WreckList = ["SKODAWreck","HMMWVWreck","UralWreck","datsun01Wreck","hiluxWreck","datsun02Wreck","UAZWreck","Land_Misc_Garb_Heap_EP1","Fort_Barricade_EP1","Rubbish2"];
	
	waitUntil{!isNil "BIS_fnc_selectRandom"};
	if (isDedicated) then {
	
		_position = RoadList call BIS_fnc_selectRandom;
		
		_position = _position modelToWorld [0,0,0];
		
		waitUntil{!isNil "BIS_fnc_findSafePos"};
		_position = [_position,0,10,5,0,2000,0] call BIS_fnc_findSafePos;
		
		if ((count _position) == 2) then {
			// Get position with ground
			
			_istoomany = _position nearObjects ["All",5];
		
			if((count _istoomany) > 0) exitWith { diag_log("DEBUG: Too many at " + str(_position)); };
			
			waitUntil{!isNil "BIS_fnc_selectRandom"};
			_spawnveh = _WreckList call BIS_fnc_selectRandom;

			if(DZEdebug) then {
				_marker = createMarker [str(_position) , _position];
				_marker setMarkerShape "ICON";
				_marker setMarkerType "DOT";
				_marker setMarkerText str(_spawnveh);
			};
			
			//diag_log("DEBUG: Spawning a crashed " + _spawnveh + " with " + _spawnloot + " at " + str(_position));
			_veh = createVehicle [_spawnveh,_position, [], 0, "CAN_COLLIDE"];
			_veh enableSimulation false;

			// Randomize placement a bit
			_veh setDir round(random 360);
			_veh setpos _position;

			_veh setVariable ["ObjectID","1",true];
		};
	
	};
	
};

spawn_mineveins = {
	private ["_position","_veh","_istoomany","_marker","_spawnveh","_positions"];

	if (isDedicated) then {
		
		_position = [getMarkerPos "center",0,(HeliCrashArea*0.75),10,0,2000,0] call BIS_fnc_findSafePos;

		if ((count _position) == 2) then {
			
			_positions = selectBestPlaces [_position, 500, "(1 + forest) * (1 + hills) * (1 - houses) * (1 - sea)", 10, 5];

			_position = (_positions call BIS_fnc_selectRandom) select 0;

			// Get position with ground
			
			_istoomany = _position nearObjects ["All",10];
		
			if((count _istoomany) > 0) exitWith { diag_log("DEBUG VEIN: Too many objects at " + str(_position)); };

			if(isOnRoad _position) exitWith { diag_log("DEBUG VEIN: on road " + str(_position)); };
			
			_spawnveh = ["Iron_Vein_DZE","Iron_Vein_DZE","Iron_Vein_DZE","Iron_Vein_DZE","Iron_Vein_DZE","Iron_Vein_DZE","Iron_Vein_DZE","Silver_Vein_DZE","Silver_Vein_DZE","Gold_Vein_DZE"] call BIS_fnc_selectRandom;

			if(DZEdebug) then {
				_marker = createMarker [str(_position) , _position];
				_marker setMarkerShape "ICON";
				_marker setMarkerType "DOT";
				_marker setMarkerText str(_spawnveh);
			};
			_veh = createVehicle [_spawnveh,_position, [], 0, "CAN_COLLIDE"];
			_veh enableSimulation false;
			_veh setDir round(random 360);
			_veh setpos _position;
			_veh setVariable ["ObjectID","1",true];
		};
	};
};

if(isnil "DynamicVehicleDamageLow") then {
	DynamicVehicleDamageLow = 0;
};
if(isnil "DynamicVehicleDamageHigh") then {
	DynamicVehicleDamageHigh = 100;
};

if(isnil "DynamicVehicleFuelLow") then {
	DynamicVehicleFuelLow = 0;
};
if(isnil "DynamicVehicleFuelHigh") then {
	DynamicVehicleFuelHigh = 100;
};

// Damage generator function
generate_new_damage = {
	private ["_damage"];
    _damage = ((random(DynamicVehicleDamageHigh-DynamicVehicleDamageLow))+DynamicVehicleDamageLow) / 100;
	_damage;
};

// Damage generator fuction
generate_exp_damage = {
	private ["_damage"];
    _damage = ((random(DynamicVehicleDamageHigh-DynamicVehicleDamageLow))+DynamicVehicleDamageLow) / 100;
	_damage;
};

server_getDiff =	{
	private["_variable","_object","_vNew","_vOld","_result"];
	_variable = _this select 0;
	_object = 	_this select 1;
	_vNew = 	_object getVariable[_variable,0];
	_vOld = 	_object getVariable[(_variable + "_CHK"),_vNew];
	_result = 	0;
	if (_vNew < _vOld) then {
		_vNew = _vNew + _vOld;
		_object getVariable[(_variable + "_CHK"),_vNew];
	} else {
		_result = _vNew - _vOld;
		_object setVariable[(_variable + "_CHK"),_vNew];
	};
	_result
};

server_getDiff2 =	{
	private["_variable","_object","_vNew","_vOld","_result"];
	_variable = _this select 0;
	_object = 	_this select 1;
	_vNew = 	_object getVariable[_variable,0];
	_vOld = 	_object getVariable[(_variable + "_CHK"),_vNew];
	_result = _vNew - _vOld;
	_object setVariable[(_variable + "_CHK"),_vNew];
	_result
};

dayz_objectUID = {
	private["_position","_dir","_key","_object"];
	_object = _this;
	_position = getPosATL _object;
	_dir = direction _object;
	_key = [_dir,_position] call dayz_objectUID2;
    _key
};

dayz_objectUID2 = {
	private["_position","_dir","_key"];
	_dir = _this select 0;
	_key = "";
	_position = _this select 1;
	{
		_x = _x * 10;
		if ( _x < 0 ) then { _x = _x * -10 };
		_key = _key + str(round(_x));
	} forEach _position;
	_key = _key + str(round(_dir));
	_key
};

dayz_objectUID3 = {
	private["_position","_dir","_key"];
	_dir = _this select 0;
	_key = "";
	_position = _this select 1;
	{
		_x = _x * 10;
		if ( _x < 0 ) then { _x = _x * -10 };
		_key = _key + str(round(_x));
	} forEach _position;
	_key = _key + str(round(_dir + time));
	_key
};

dayz_recordLogin = {
	private["_key"];
	_key = format["CHILD:103:%1:%2:%3:",_this select 0,_this select 1,_this select 2];
	_key call server_hiveWrite;
};
//----------InitMissions--------//
  MissionGo = 0;
  MissionGoMinor = 0;
    if (isServer) then {
  SMarray = ["SM1","SM2","SM3","SM4","SM5","SM6"];
    [] execVM "\z\addons\dayz_server\missions\major\SMfinder.sqf"; //Starts major mission system
    SMarray2 = ["SM1","SM2","SM3","SM4","SM5","SM6"];
    [] execVM "\z\addons\dayz_server\missions\minor\SMfinder.sqf"; //Starts minor mission system
    };
//---------EndInitMissions------//
	
server_cleanDead = {
	private ["_objectPos","_noPlayerNear"];
	{
		_objectPos = getPosATL _x;
		_noPlayerNear = {isPlayer _x} count (_objectPos nearEntities ["CAManBase",35]) == 0;
		if (_noPlayerNear) then
		{
			if (_x isKindOf "zZombie_Base") then
			{
				deleteVehicle _x;
			};
		};
	} forEach allDead;
};
server_cleanLoot =
{
private ["_deletedLoot","_startTime","_looted","_objectPos","_noPlayerNear","_nearObj","_endTime"];

	_deletedLoot = 0;
	_startTime = diag_tickTime;

	{
		_looted = (_x getVariable ["looted",-0.1]);
		if (_looted != -0.1) then
		{
			_objectPos = getPosATL _x;
			_noPlayerNear = {isPlayer _x} count (_objectPos nearEntities ["CAManBase",35]) == 0;

			if (_noPlayerNear) then
			{
				_nearObj = nearestObjects [_objectPos,["ReammoBox","WeaponHolder","WeaponHolderBase"],((sizeOf (typeOf _x)) + 5)];
				{
					deleteVehicle _x;
					_deletedLoot = _deletedLoot + 1;
				} forEach _nearObj;
				_x setVariable ["looted",-0.1,true];
			};
		};
	} forEach BuildingList;

	_endTime = diag_tickTime;

	diag_log (format["CLEANUP: DELETED %1 ITEMS, RUNTIME: %2",_deletedLoot,(_endTime - _startTime)]);
};
build_baseBuilding_arrays = {
private["_isDestructable","_classname","_isSimulated","_disableSims","_objectSims","_objectSim","_requirements","_isStructure","_structure","_wallType","_removable","_buildlist","_build_townsrestrict"];
_buildlist = [
[[0,2,0,0,0,1, 0,0,2,0,0, 0,0,0,0,0,0], "Grave",							[[0,2.5,.1], [0,2,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],//Booby Traps --1
[[1,1,4,0,0,0, 1,0,1,0,0, 0,0,0,0,0,0], "Base_WarfareBBarrier10x",		[[0,10,.6],  [0,10,0], 	0, 	true, true, true, false, false, true, false, true, true, false, false]],//Base_WarfareBBarrier10x
[[4,1,4,0,0,0, 0,0,1,0,0, 0,0,0,0,0,0], "Land_HBarrier_large",			[[0,7,1], 	 [0,4,0], 	0, 	true, true, true, false, false, true, false, true, true, true, false]],//Land_HBarrier_large --5
[[2,1,5,0,0,0, 2,0,1,0,0, 0,0,0,0,0,0], "Base_WarfareBBarrier10xTall", 	[[0,10,1],   [0,10,0], 	0, 	true, true, false, true, false, true, false, true, true, false, false]],//Base_WarfareBBarrier10xTall 
[[0,2,0,1,2,0, 2,2,0,1,0, 0,0,1,1,0,0], "Land_Fort_Watchtower",			[[0,10,2.2], [0,8,0], 	90, true, true, false, true, false, true, false, true, true, false, false]],//Land_Fort_Watchtower
[[0,2,0,1,2,0, 2,2,0,1,0, 0,1,0,1,0,0], "Land_Fort_Watchtower_EP1",		[[0,10,2.2], [0,8,0], 	90, true, true, false, true, false, true, false, true, true, false, false]],//Land_Fort_Watchtower
[[0,2,0,0,0,0, 1,1,0,1,0, 0,1,1,1,0,0], "WarfareBCamp",					[[0,12,1],   [0,10,0], 	0, 	true, true, false, true, false, true, false, true, true, false, false]],//WarfareBCamp --10
[[0,2,0,0,2,0, 2,2,0,0,0, 0,1,1,2,0,0], "WarfareBDepot",					[[0,18,2],   [0,15,0], 	90, true, true, false, true, false, true, false, true, true, false, false]],//WarfareBDepot
[[0,0,1,1,2,0, 0,1,0,0,0, 0,0,0,0,1,0], "Land_fortified_nest_small",	 	[[0,7,1], 	 [0,3,0], 	90, true, true, true, false, false, true, false, true, false, true, false]],//Land_fortified_nest_small
[[0,0,0,2,3,0, 0,2,0,0,2, 0,0,0,1,2,0], "Land_fortified_nest_big", 		[[0,12,1],   [2,8,0], 	180,true, true, false, true, false, true, false, true, true, false, false]],//Land_fortified_nest_big
[[0,0,0,4,4,0, 0,0,0,2,0, 0,0,0,0,0,0], "Land_prebehlavka",				[[0,6,.7], 	 [0,3,0], 	90, true, false, false, false, false, true, false, true, false, true, false]],//Land_prebehlavka(Ramp) 
[[0,3,0,3,2,0, 0,0,0,0,1, 0,0,0,0,0,0], "Land_fort_rampart_EP1", 		 	[[0,7,.2],   [0,8,0], 	0, 	true, true, true, false, false, true, false, true, false, true, false]],//Land_fort_rampart_EP1 --15
[[0,3,0,2,3,0, 0,0,0,0,1, 0,0,0,0,0,0], "Land_ConcreteRamp", 	   	        [[0,7,2.6],  [0,5,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],//Land_Ind_TankSmall
[[1,0,0,0,0,0, 0,0,1,0,2, 0,0,0,0,0,0], "Misc_cargo_cont_small_EP1",	  	[[0,5,1.3],  [0,4,0], 	90, true, false, true, false, false, true, false, true, true, true, false]],//Misc_cargo_cont_small_EP1
[[2,1,0,0,0,0, 0,0,2,0,4, 0,0,0,0,0,0], "Ins_WarfareBConstructionSite", 	[[0,7,1.3],  [0,5,0], 	90, true, false, true, false, false, true, false, true, true, true, false]],//Ins_WarfareBContructionSite
[[1,1,0,0,0,0, 0,0,2,0,4, 0,0,0,0,0,0], "Misc_Cargo1Bo_military",		  	[[0,7,1.3],  [0,5,0], 	90, true, false, true, false, false, true, false, true, true, true, false]],//Misc_Cargo1Bo_military 
[[1,2,0,0,0,0, 0,0,3,0,4, 1,0,0,0,0,0], "Land_Misc_Cargo2B",				[[0,7,2.6],  [0,5,0], 	90, true, false, false, true, false, true, false, true, true, true, false]],//Land_Misc_Cargo2E
[[1,1,0,0,0,0, 0,0,4,0,4, 1,0,0,0,0,0], "Land_Misc_Cargo2E",				[[0,7,2.6],  [0,5,0], 	90, true, false, false, true, false, true, false, true, true, true, false]],//Land_Misc_Cargo2E
[[0,1,2,0,0,0, 0,0,0,0,0, 0,0,0,0,0,0], "Land_BagFenceRound",			   	[[0,4,.5], 	 [0,2,0], 	180,true, true, false, false, false, true, false, true, false, true, false]],//Land_BagFenceRound --20
[[0,1,4,1,1,0, 0,0,0,0,0, 0,0,0,0,0,0], "Land_fort_bagfence_long", 	   	[[0,4,.3],	 [0,2,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],//Land_fort_bagfence_long
[[0,2,4,2,1,0, 0,0,0,0,0, 0,0,0,0,0,0], "Land_fort_bagfence_corner",	   	[[0,4,.5],	 [0,2,0], 	180,true, true, false, false, false, true, false, true, false, true, false]],//Land_BagFenceRound
[[0,2,4,2,2,0, 0,0,0,0,0, 0,0,0,0,0,0], "Land_fort_bagfence_round", 	   	[[0,4,.5], 	 [0,2,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],//Land_fort_bagfence_long
[[0,2,0,1,0,0, 0,0,1,1,0, 0,0,0,0,0,0], "Fence_Ind",						[[0,4,.7], 	 [0,2,0], 	0, 	true, false, false, false, false, true, false, true, true, true, false]],//Fence_Ind
[[0,4,0,2,0,0, 0,0,1,3,0, 0,0,0,0,0,0], "Fence_Ind_long",					[[0,5,.6],   [-4,1.5,0],0, 	true, false, true, false, false, true, false, true, true, true, false]], //Fence_Ind_long --25
[[0,0,0,1,0,0, 0,0,0,2,1, 0,0,0,0,0,0], "Fence_corrugated_plate",			[[0,4,.6], 	 [0,3,0], 	0,	true, false, true, false, false, true, false, true, true, true, false]],//Fence_corrugated_plate
[[0,4,0,1,0,0, 0,0,0,1,0, 0,0,0,0,0,0], "Fort_RazorWire",					[[0,5,.8],   [0,4,0], 	0, 	true, false, false, false, false, true, false, true, false, true, false]],//Fort_RazorWire
[[2,0,0,0,0,0, 0,0,1,0,0, 0,0,0,0,0,0], "Hedgehog_DZ",  		        	[[0,5,.7],   [10,10,0], 0,  true, true, false, false, false, true, false, true, false, true, false]],//Hedgehog_DZ
[[2,0,0,1,0,0, 0,0,2,0,0, 0,0,0,0,0,0], "Land_CncBlock",					[[0,3,.4], 	 [0,2,0], 	0, 	true, false, false, false, false, true, false, true, false, true, false]],//Land_CncBlock
[[4,0,0,1,0,0, 0,0,2,0,0, 0,0,0,0,0,0], "Hhedgehog_concrete",				[[0,5,.6], 	 [0,4,0], 	0, 	true, true, true, false, false, true, false, true, false, true, false]],//Hhedgehog_concrete --30
[[0,0,0,3,0,0, 0,0,0,3,0, 0,0,0,0,0,0], "ZavoraAnim", 					[[0,5,4.0],  [0,5,0], 	0, 	true, false, false, false, false, true, false, true, false, true, false]],//ZavoraAnim
[[0,1,0,0,1,0, 0,0,0,1,0, 0,0,0,0,0,0], "Land_pumpa",						[[0,3,.4], 	 [0,3,0], 	0, 	true, true, true, false, false, true, false, true, false, true, false]],//Land_pumpa
[[0,3,0,0,0,0, 0,0,0,2,4, 0,0,0,2,0,1], "Land_Ind_Garage01",  		    [[0,18,.7],  [15,15,0], 0, 	true, true, false, true, false, true, false, true, false, true, false]],//Land_Ind_Garage01 (Small Garage)
[[0,2,0,0,0,0, 0,0,0,0,6, 0,0,0,2,0,0], "Land_Ind_SawMillPen",  	    	[[0,18,.7],  [15,15,0], 0, 	true, true, false, true, false, true, false, true, false, true, false]],//Land_Ind_SawMillPen (Garage Roofing)
[[0,2,0,0,0,0, 0,0,0,0,6, 4,0,0,0,0,0], "Land_hut_old02",  		        [[0,18,.7],  [15,15,0], 0, 	true, true, false, true, false, true, false, true, false, true, false]],//Land_hut_old02 (Large Garage) --35
[[0,0,0,0,0,0, 0,0,0,0,4, 0,0,0,4,0,4], "Land_HouseV_1I4",  		    	[[0,18,.7],  [15,15,0], 0, 	true, true, false, true, false, true, false, true, false, true, false]],//Land_HouseV_1I4 (wood Cabin)
[[0,3,0,0,0,0, 0,0,0,4,0, 0,1,1,0,3,0], "Land_tent_east", 				[[0,8,1.7],  [0,6,0], 	0, 	true, false, true, false, false, true, false, true, false, true, false]],//Land_tent_east
[[0,4,0,0,0,0, 0,0,0,4,0, 0,0,3,0,0,0], "Land_CamoNetB_EAST",				[[0,10,2], 	 [0,10,0], 	0, 	true, false, false, true, false, true, false, true, false, true, false]],//Land_CamoNetB_EAST
[[0,4,0,0,0,0, 0,0,0,4,0, 0,0,3,0,0,0], "Land_CamoNetB_NATO", 			[[0,10,2], 	 [0,10,0], 	0, 	true, false, false, true, false, true, false, true, false, true, false]],//Land_CamoNetB_NATO
[[0,2,0,0,0,0, 0,0,0,4,0, 0,0,1,0,0,0], "Land_CamoNetVar_EAST",		    [[0,10,1.2], [0,7,0], 	0, 	true, false, false, false, false, true, false, true, false, true, false]],//Land_CamoNetVar_EAST --40
[[0,2,0,0,0,0, 0,0,0,4,0, 0,0,1,0,0,0], "Land_CamoNetVar_NATO", 			[[0,10,1.2], [0,7,0], 	0, 	true, false, false, false, false, true, false, true, false, true, false]],//Land_CamoNetVar_NATO
[[0,3,0,0,0,0, 0,0,0,4,0, 0,0,2,0,0,0], "Land_CamoNet_EAST",				[[0,8,1.2],  [0,7,0], 	0, 	true, false, true, false, false, true, false, true, false, true, false]],//Land_CamoNet_EAST
[[0,3,0,0,0,0, 0,0,0,4,0, 0,0,2,0,0,0], "Land_CamoNet_NATO",				[[0,8,1.2],  [0,7,0], 	0, 	true, false, true, false, false, true, false, true, false, true, false]],//Land_CamoNet_NATO
[[0,4,0,0,0,0, 0,0,0,4,0, 0,3,0,0,0,0], "Land_CamoNetB_EAST_EP1",			[[0,10,2], 	 [0,10,0], 	0, 	true, false, false, true, false, true, false, true, false, true, false]],//Land_CamoNetB_EAST 
[[0,4,0,0,0,0, 0,0,0,4,0, 0,3,0,0,0,0], "Land_CamoNetB_NATO_EP1", 		[[0,10,2], 	 [0,10,0], 	0, 	true, false, false, true, false, true, false, true, false, true, false]],//Land_CamoNetB_NATO --45
[[0,2,0,0,0,0, 0,0,0,4,0, 0,1,0,0,0,0], "Land_CamoNetVar_EAST_EP1",		[[0,10,1.2], [0,7,0], 	0, 	true, false, false, false, false, true, false, true, false, true, false]],//Land_CamoNetVar_EAST
[[0,2,0,0,0,0, 0,0,0,4,0, 0,1,0,0,0,0], "Land_CamoNetVar_NATO_EP1", 		[[0,10,1.2], [0,7,0], 	0, 	true, false, false, false, false, true, false, true, false, true, false]],//Land_CamoNetVar_NATO
[[0,3,0,0,0,0, 0,0,0,4,0, 0,2,0,0,0,0], "Land_CamoNet_EAST_EP1",			[[0,8,1.2],  [0,7,0], 	0, 	true, false, true, false, false, true, false, true, false, true, false]],//Land_CamoNet_EAST
[[0,3,0,0,0,0, 0,0,0,4,0, 0,2,0,0,0,0], "Land_CamoNet_NATO_EP1",			[[0,8,1.2],  [0,7,0], 	0, 	true, false, true, false, false, true, false, true, false, true, false]], //Land_CamoNet_NATO --50
[[0,3,0,0,0,0, 0,0,0,5,0, 0,2,2,0,0,0], "vehicleShelter_cdf",  	    	[[0,18,.7],  [15,15,0], 0, 	true, true, false, true, false, true, false, true, false, true, false]],//vehicleShelter_cdf
[[6,0,0,0,0,0, 0,0,2,0,0, 0,0,0,0,0,0], "RampConcrete",  		   	        [[0,5,4.0],  [0,7,0],   0, 	true, true, false, true, false, true, false, true, false, true, false]],//Land_concreteramp
[[0,0,0,4,4,0, 0,0,0,0,0, 0,0,0,0,0,0], "Land_Ind_Timbers",  		    	[[0,5,4.0],  [0,7,0],   0, 	true, true, false, true, false, true, false, true, false, true, false]],//Land_Ind_Timbers
[[0,0,0,4,3,0, 0,0,0,0,0, 0,0,0,0,0,0], "Land_Ind_BoardsPack1",  	    	[[0,4,.5], 	 [0,2,0],   0, 	true, true, false, true, false, true, false, true, false, true, false]],//Land_Ind_BoardsPack1
[[0,0,0,0,0,0, 0,0,0,0,0, 2,0,0,8,0,0], "Land_Barn_W_01",     	    	[[0,18,.7],  [15,15,0], 0, 	true, true, false, true, false, true, false, true, false, true, false]],//Land_Barn_W_01
[[0,0,0,0,2,0, 0,0,0,0,2, 0,0,0,5,0,0], "Land_stodola_open",  	        [[0,18,.7],  [15,15,0], 0, 	true, true, false, true, false, true, false, true, false, true, false]],//Land_stodola_open --60
[[0,0,0,0,0,0, 0,0,2,4,0, 0,0,0,0,0,0], "Land_vez",  		                [[0,18,.7],  [15,15,0], 0, 	true, true, false, true, false, true, false, true, false, true, false]],//Land_vez
[[2,0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0,0], "HeliHCivil",  		            [[0,5,4.0],  [0,15,0],  0, 	true, true, false, true, false, true, false, true, false, true, false]],//ChopperPad
[[0,1,0,0,0,0, 0,0,1,8,0, 0,0,0,0,0,0], "Land_Misc_Scaffolding",          [[0,5,4.0],  [0,15,0],  0, 	true, true, false, true, false, true, false, true, false, true, false]],//Land_Misc_Scaffolding
[[4,0,0,0,0,0, 0,0,4,0,0, 1,0,0,0,0,0], "Land_Ind_TankSmall", 	   	    [[0,7,2.6],  [0,5,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],
[[0,0,0,3,4,0, 0,0,0,2,0, 0,0,0,0,0,0], "CanvasHut_DZ", 	   	            [[0,7,2.6],  [0,5,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],
[[3,0,0,0,0,0, 0,0,0,2,0, 1,0,0,0,0,0], "Land_Misc_ConcPipeline_EP1", 	[[0,7,2.6],  [0,5,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],
[[0,0,0,0,5,0, 0,0,0,0,0, 0,0,0,3,0,0], "Land_Misc_deerstand", 	   	    [[0,7,2.6],  [0,5,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],
[[2,0,0,0,0,0, 0,0,0,5,0, 0,0,0,0,0,0], "Land_plot_green_vrata", 	   	    [[0,7,2.6],  [0,5,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],
[[1,0,0,0,0,0, 0,0,1,4,0, 0,0,0,0,0,0], "Land_plot_rust_vrata", 	   	    [[0,7,2.6],  [0,5,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],
[[0,0,0,0,8,0, 0,0,0,0,0, 0,0,0,1,0,0], "LightPole_DZ", 	   	            [[0,7,2.6],  [0,5,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]]
];
for "_i" from 0 to ((count _buildlist) - 1) do
{
	_removable = (_buildlist select _i) select _i - _i + 1;
	if (_removable != "Grave") then { // Booby traps have disarm bomb
	allremovables set [count allremovables, _removable];
	};
};
for "_i" from 0 to ((count _buildlist) - 1) do
{
	_classname = (_buildlist select _i) select _i - _i + 1;
	allbuildables_class set [count allbuildables_class, _classname];
};

_build_townsrestrict = [
["Chernogorsk", 600],
["Elektrozavodsk", 600],
["Berezino", 600],
["Zelenogorsk", 300],
["Krasnostav", 250],
["Stary Sobor", 275],
["Solnichniy", 200],
["Balota", 200],
["Kamenka", 200],
["Kamyshovo", 200],
["Komarovo", 200],
["Nizhnoye", 200],
["Prigorodki", 200],
["Bor", 200],
["Dolina", 250],
["Drozhino", 200],
["Dubrovka", 250],
["Gorka", 250],
["Grishino", 275],
["Guglovo", 200],
["Gvozdno", 200],
["Kabanino", 250],
["Khelm", 250],
["Kozlovka", 200],
["Lopatino", 275],
["Mogilevka", 200],
["Msta", 250],
["Myshkino", 250],
["Nadezhdino", 250],
["Novy Sobor", 255],
["Orlovets", 220],
["Olsha", 75],
["Pavlovo", 250],
["Petrovka", 250],
["Pogorevka", 250],
["Polana", 200],
["Pulkovo", 200],
["Pusta", 250],
["Pustoshka", 300],
["Rogovo", 250],
["Shakhovka", 250],
["Sosnovka", 250],
["Staroye", 300],
["Tulga", 250],
["Vybor", 300],
["Vyshnoye", 275]
];
allbuildables = _buildlist;
allbuild_notowns = _build_townsrestrict;
};