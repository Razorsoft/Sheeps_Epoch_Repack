
private ["_riflemenlist","_side","_leader_group","_initstring","_patrol_area_name","_rndpos","_argc","_grouptype","_respawn","_leader_weapon_names","_leader_items","_leader_tools","_soldier_weapon_names","_soldier_items","_soldier_tools","_leaderskills","_sniperskills","_ups_para_list","_sniperlist","_riflemanskills","_vehicles","_error","_vehicles_crews","_leader","_leadername","_snipers","_riflemen","_veh","_veh_setup","_forEachIndex","_groupvehicles","_sniper_weapon_names","_sniper_items","_sniper_tools","_leader_veh_crew","_type","_respawn_time","_ai_type"];
if(!isServer) exitWith {};
_error = false;
_argc = count _this;
_patrol_area_name = _this select 0;
if (_argc >1) then {
    _grouptype = _this select 1;
    switch (_grouptype) do
    {
case 1: 
{
    _side = SAR_AI_friendly_side;
    _type = "sold";
    _ai_type = "AI Military";
    _initstring = "[this] spawn SAR_AI_trace_veh;this setIdentity 'id_SAR_sold_man';[this] spawn SAR_AI_reammo;";
};
case 2: 
{
    _side = SAR_AI_friendly_side;
    _type = "surv";
    _ai_type = "AI Survivor";
    _initstring = "[this] spawn SAR_AI_trace_veh;this setIdentity 'id_SAR_surv_lead';[this] spawn SAR_AI_reammo;";
    
};
case 3: 
{
    _side = SAR_AI_unfriendly_side;
    _type = "band";
    _ai_type = "AI Bandit";
    _initstring = "[this] spawn SAR_AI_trace_veh;this setIdentity 'id_SAR_band';[this] spawn SAR_AI_reammo;";
    
};
    };
    _leader_group = call compile format ["SAR_leader_%1_list",_type] call SAR_fnc_selectRandom;
    _riflemenlist = call compile format ["SAR_soldier_%1_list",_type];
    _sniperlist = call compile format ["SAR_sniper_%1_list",_type];
    _leaderskills = call compile format ["SAR_leader_%1_skills",_type];
    _riflemanskills = call compile format ["SAR_soldier_%1_skills",_type];
    _sniperskills = call compile format ["SAR_sniper_%1_skills",_type];
} else {
    _error = true;
};
if (_argc >2) then { 
    _vehicles = _this select 2;
} else {
    diag_log "SAR_AI: Error, you need to define vehicles for this land AI group";
    _error = true;
};
if (_argc >3) then { 
    _vehicles_crews = _this select 3;
} else {
    diag_log "SAR_AI: Error, you need to define crews for vehicles for this land AI group";
    _error = true;
};
if (_argc >4) then {
    _respawn = _this select 4;
} else {
    _respawn = false;
};
if(_argc>5) then {
    _respawn_time = _this select 5;
}else {
    _respawn_time = SAR_respawn_waittime;
};
{
    if (_x isKindof "Air" || _x isKindof "Ship") then { 
diag_log "SAR_AI: Error, you need to define land vehicles only for this land AI group";
_error = true;
    };
} foreach _vehicles;
if(_error) exitWith {diag_log "SAR_AI: Vehicle patrol setup failed, wrong parameters passed!";};
_rndpos = [_patrol_area_name] call SAR_get_road_pos;
_groupvehicles = createGroup _side;
_groupvehicles setVariable ["SAR_protect",true,true];
{
    
    _veh = createVehicle [_x, [_rndpos select 0, _rndpos select 1, 0], [], 0, "NONE"];
    _veh setFuel 1;
    _veh setVariable ["Sarge",1,true];
    _veh engineon true; 
    _veh addEventHandler ["HandleDamage", {_this spawn SAR_AI_VEH_HIT;_this select 2;}];  
    [_veh] joinSilent _groupvehicles;
    
    
    _veh_setup = _vehicles_crews select _forEachIndex;
    
    
    if((_veh_setup select 0) == 1) then {
if(SAR_DEBUG) then {
    
    [_veh] spawn SAR_AI_debug;
};
_leader = _groupvehicles createunit [_leader_group, [(_rndpos select 0) + 10, _rndpos select 1, 0], [], 0.5, "NONE"];
_leader_weapon_names = ["leader",_type] call SAR_unit_loadout_weapons;
_leader_items = ["leader",_type] call SAR_unit_loadout_items;
_leader_tools = ["leader",_type] call SAR_unit_loadout_tools;
[_leader,_leader_weapon_names,_leader_items,_leader_tools] call SAR_unit_loadout;
_leader setVehicleInit _initstring;
_leader addMPEventHandler ["MPkilled", {Null = _this spawn SAR_AI_killed;}];
_leader addMPEventHandler ["MPHit", {Null = _this spawn SAR_AI_hit;}];  
_leader addEventHandler ["HandleDamage",{if (_this select 1!="") then {_unit=_this select 0;damage _unit+((_this select 2)-damage _unit)*SAR_leader_health_factor}}];
_leader moveInDriver _veh;
_leader assignAsDriver _veh;
[_leader] joinSilent _groupvehicles;
{
    _leader setskill [_x select 0,(_x select 1 +(floor(random 2) * (_x select 2)))];
} foreach _leaderskills;
_leader setVariable ["SAR_AI_type",_ai_type + " Leader",false];
_leader setVariable ["SAR_AI_experience",0,false];
SAR_leader_number = SAR_leader_number + 1;
_leadername = format["SAR_leader_%1",SAR_leader_number];
_leader setVehicleVarname _leadername;
_leader setVariable ["SAR_leader_name",_leadername,false];
call compile format ["KRON_UPS_%1=1",_leadername];
_leader setspeedmode "FULL";
_leader setBehaviour "SAFE"; 
    }; 
    
    
    
    _snipers = _veh_setup select 1;
    _riflemen = _veh_setup select 2;
    for "_i" from 0 to (_snipers - 1) do
    {
_this = _groupvehicles createunit [_sniperlist call SAR_fnc_selectRandom, [(_rndpos select 0) - 30, _rndpos select 1, 0], [], 0.5, "FORM"];
_sniper_weapon_names = ["sniper",_type] call SAR_unit_loadout_weapons;
_sniper_items = ["sniper",_type] call SAR_unit_loadout_items;
_sniper_tools = ["sniper",_type] call SAR_unit_loadout_tools;
[_this,_sniper_weapon_names,_sniper_items,_sniper_tools] call SAR_unit_loadout;
_this setVehicleInit "null = [this] spawn SAR_AI_trace_veh;this setIdentity 'id_SAR';";
_this addMPEventHandler ["MPkilled", {Null = _this spawn SAR_AI_killed;}]; 
_this addMPEventHandler ["MPHit", {Null = _this spawn SAR_AI_hit;}]; 
[_this] joinSilent _groupvehicles;
if (isnull (assignedDriver _veh)) then {
    _this moveInDriver _veh;
    _this assignAsDriver _veh;
} else {
    
    _this moveInCargo _veh;
    _this assignAsCargo _veh;
    
};
{
    _this setskill [_x select 0,(_x select 1 +(floor(random 2) * (_x select 2)))];
} foreach _sniperskills;
_this setVariable ["SAR_AI_type",_ai_type,false];
_this setVariable ["SAR_AI_experience",0,false];
    };
    for "_i" from 0 to (_riflemen - 1) do
    {
_this = _groupvehicles createunit [_riflemenlist call SAR_fnc_selectRandom, [(_rndpos select 0) + 30, _rndpos select 1, 0], [], 0.5, "FORM"];
_soldier_items = ["rifleman",_type] call SAR_unit_loadout_items;
_soldier_tools = ["rifleman",_type] call SAR_unit_loadout_tools;
_soldier_weapon_names = ["rifleman",_type] call SAR_unit_loadout_weapons;
[_this,_soldier_weapon_names,_soldier_items,_soldier_tools] call SAR_unit_loadout;
_this setVehicleInit "null = [this] spawn SAR_AI_trace_veh;this setIdentity 'id_SAR_sold_man';";    
_this addMPEventHandler ["MPkilled", {Null = _this spawn SAR_AI_killed;}]; 
_this addMPEventHandler ["MPHit", {Null = _this spawn SAR_AI_hit;}];     
[_this] joinSilent _groupvehicles;
_this moveInCargo _veh;
_this assignAsCargo _veh;
{
    _this setskill [_x select 0,(_x select 1 +(floor(random 2) * (_x select 2)))];
} foreach _riflemanskills;
_this setVariable ["SAR_AI_type",_ai_type,false];
_this setVariable ["SAR_AI_experience",0,false];
    };
} foreach _vehicles;    
_leader_veh_crew = leader _groupvehicles;
_ups_para_list = [_leader_veh_crew,_patrol_area_name,'onroad','nofollow','safe','showmarker','spawned','delete:',SAR_DELETE_TIMEOUT];
if(SAR_AI_disable_UPSMON_AI) then {
    _ups_para_list set [count _ups_para_list,'noai'];
};
if (_respawn) then {
    _ups_para_list set [count _ups_para_list,'respawn'];
    _ups_para_list set [count _ups_para_list,'respawntime:'];
    _ups_para_list set [count _ups_para_list,_respawn_time];
};
_ups_para_list spawn SAR_AI_UPSMON;    
    
processInitCommands;
if(SAR_DEBUG) then {
    diag_log format["SAR_DEBUG: Land vehicle group (%2), side %3 spawned in %1 in a %4, side %5.",_patrol_area_name,_groupvehicles, _side, typeOf _veh, side _veh];
};
