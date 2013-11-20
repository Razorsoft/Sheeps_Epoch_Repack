/*
Script Name: crash_spawner.sqf
Original Author: Grafzahl / Finest
Modified by BushWookie for Epoch and to break the tail instead of just blowing up in the air
*/

private["_timeAdjust","_timeToSpawn","_spawnRoll","_crash","_hasAdjustment","_newHeight","_adjustedPos","_useStatic","_crashDamage","_lootRadius","_preWaypoints","_preWaypointPos","_endTime","_startTime","_safetyPoint","_heliStart","_deadBody","_exploRange","_heliModel","_lootPos","_list","_craters","_dummy","_wp2","_wp3","_landingzone","_aigroup","_wp","_helipilot","_crash","_crashwreck","_smokerand","_staticcoords","_pos","_dir","_position","_num","_config","_itemType","_itemChance","_weights","_index","_iArray","_crashModel","_lootTable","_guaranteedLoot","_randomizedLoot","_frequency","_variance","_spawnChance","_spawnMarker","_spawnRadius","_spawnFire","_permanentFire","_crashName"];
//############### //Config Start\\ ###############\\
_SpawnMax        = 100;                //Maximum percent chance of spawning a crash number between 0 - 100
_SpawnMin        = 50;                //Minimum percent chance of spawning a crash number between 0 - 100
_guaranteedLoot = 3;                //Guaranteed Loot Spawns
_randomizedLoot = 4;                //Random number of loot piles aswell as the guaranteed ones
_spawnFire      = true;                //Spawn Smoke/Fire at the helicrash
_fadeFire      = false;            //Fade the Smoke/Fire overtime
_preWaypoints    = 2;                //Amount of waypoints the heli flys to before crashing
_crashDamage    = 1;                //Amount of dammage the heli can take before crashing (between 0.1 and 1) Lower the number and the heli can take less damage before crashing 1 dammage is fully destroyed and 0.1 something like a DMR could one shot the heli
_heliModel        = "UH1Y_DZE";        //The type of heli used
_crashModel    = "UH1Wreck_DZ";    //The type of Crash model used after the heli crashes
_exploRange    = 250;                //How far away from the predefined crash point should the heli start crashing
_minLootRadius    = 4;                //Minimum distance for loot to spawn from the crash site in meters
_maxLootRadius    = 8;                //Maximum distance for loot to spawn from the crash site in meters
_lootTable        = "HeliCrash";        //Name of the loot table the heli gets loot from (DO NOT edit unless you know what your doing)
//############### \\Config End// ###############\\

//DO NOT edit below this unless you know what your doing
_maxLootRadius = _maxLootRadius - _minLootRadius;
_spawnRadius = HeliCrashArea;
_heliStart = [[3461.92,5021.77,0],[8582.35,14077.7,0]] call BIS_fnc_selectRandom;
_safetyPoint = [8450.08,20240,0];
_crashName= getText (configFile >> "CfgVehicles" >> _heliModel >> "displayName");
_spawnMarker    = 'center';
_spawnChance = _SpawnMax - _SpawnMin;
_spawnChance = (random _spawnChance) + _SpawnMin;
_spawnRoll = round(random 100);
diag_log(format["CRASHSPAWNER: %1%2 chance to start a crashing %3 with loot table '%4'", _spawnChance, '%', _crashName, _lootTable]);
if (_spawnRoll <= _spawnChance) then
{
    _position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;
    diag_log(format["CRASHSPAWNER: %1 started flying from %2 to %3 NOW!(TIME:%4||LT:%5)", _crashName,  str(_heliStart), str(_position), round(time), _lootTable]);
    _startTime = time;
    _crashwreck = createVehicle [_heliModel,_heliStart, [], 0, "FLY"];
    _crashwreck setCombatMode "BLUE";
    _crashwreck engineOn true;
    _crashwreck flyInHeight 150;
    _crashwreck forceSpeed 150;
    _crashwreck setspeedmode "LIMITED";
    _landingzone = createVehicle ["HeliHEmpty", [_position select 0, _position select 1,0], [], 0, "CAN_COLLIDE"];
    _aigroup = creategroup civilian;
    _helipilot = _aigroup createUnit ["SurvivorW2_DZ",getPos _crashwreck,[],0,"FORM"];
    _helipilot setCombatMode "BLUE";
    _helipilot moveindriver _crashwreck;
    _helipilot assignAsDriver _crashwreck;
    sleep 0.5;
    if(_preWaypoints > 0) then
    {
        for "_x" from 1 to _preWaypoints do
        {
            _preWaypointPos = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;
            _wp = _aigroup addWaypoint [_preWaypointPos, 0];
            _wp setWaypointType "MOVE";
            _wp setWaypointBehaviour "CARELESS";
        };
    };

    _wp2 = _aigroup addWaypoint [position _landingzone, 0];
    _wp2 setWaypointType "MOVE";
    _wp2 setWaypointBehaviour "CARELESS";
    _wp2 setWaypointStatements ["true", "_crashwreck setdamage 1;"];
    _wp3 = _aigroup addWaypoint [_safetyPoint, 0];
    _wp3 setWaypointType "CYCLE";
    _wp3 setWaypointBehaviour "CARELESS";
    waituntil {(_crashwreck distance _position) <= 1000 || not alive _crashwreck || (getPosATL _crashwreck select 2) < 5 || (damage _crashwreck) >= _crashDamage};
    _crashwreck flyInHeight 100;
    _crashwreck forceSpeed 100;
    _crashwreck setspeedmode "NORMAL";
    waituntil {(_crashwreck distance _position) <= _exploRange || not alive _crashwreck || (getPosATL _crashwreck select 2) < 5 || (damage _crashwreck) >= _crashDamage};
    _crashwreck setHit ["mala vrtule", 1];
    _ran15 = random 15;
    _crashwreck setVelocity [_ran15,_ran15,-25];
    _crashwreck setdamage .9;
    waitUntil{sleep 1; getpos _crashwreck select 2 <= 30};
    _helipilot setdamage 1;
    _crashwreck setVelocity [_ran15,_ran15,-20];
    waitUntil{sleep 1; getpos _crashwreck select 2 <= 10};
    _crashwreck setdamage 1;
    waitUntil{sleep 1; getpos _crashwreck select 2 <= 5};
    diag_log(format["CRASHSPAWNER: %1 just exploded at %2!, ", _crashName, str(getPosATL _crashwreck)]);
    _pos = [getpos _crashwreck select 0, getpos _crashwreck select 1,0];
    _dir = getdir _crashwreck;
    heliCrash = _pos;
    publicVariable "heliCrash";
    deletevehicle _crashwreck;
    deletevehicle _helipilot;
    deletevehicle _landingzone;
    _crash = createVehicle [_crashModel, _pos, [], 0, "CAN_COLLIDE"];
    PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_crash];
    if (_spawnFire) then
    {
        PVDZE_obj_Fire = [_crash,2,time,false,_fadeFire];
        publicVariable "PVDZE_obj_Fire";
        _crash setVariable ["fadeFire",_fadeFire,true];
    };
    _num = round(random _randomizedLoot) + _guaranteedLoot;
    _config =        configFile >> "CfgBuildingLoot" >> _lootTable;
    _itemTypes =    [] + getArray (_config >> "itemType");
    _index =        dayz_CBLBase find toLower(_lootTable);
    _weights =        dayz_CBLChances select _index;
    _cntWeights = count _weights;
    for "_x" from 1 to _num do
    {
        _maxLootRadius = (random _maxLootRadius) + _minLootRadius;
        _lootPos = [_pos, _maxLootRadius, random 360] call BIS_fnc_relPos;
        _index = floor(random _cntWeights);
        _index = _weights select _index;
        _itemType = _itemTypes select _index;
        [_itemType select 0, _itemType select 1, _lootPos, 5] call spawn_loot;
        diag_log(format["CRASHSPAWNER: Loot spawn at '%1' with loot table '%2'", _lootPos, _lootTable]);
        _nearby = _pos nearObjects ["ReammoBox", sizeOf(_crashModel)];
        {
            _x setVariable ["permaLoot",true];
        } forEach _nearBy;
    };
    _endTime = time - _startTime;
    diag_log(format["CRASHSPAWNER: Crash completed! Wreck at: %2 - Runtime: %1 Seconds || Distance from calculated POC: %3 meters", round(_endTime), str(getPos _crash), round(_position distance _crash)]);
};