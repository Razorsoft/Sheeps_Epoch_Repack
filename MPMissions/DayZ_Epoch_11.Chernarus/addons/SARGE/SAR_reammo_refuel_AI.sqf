
private ["_ai","_sleeptime","_veh_weapons","_vehicle","_weapons","_reloadmag","_magazintypes","_legit_weapon","_weap_obj"];
if (!isServer) exitWith {}; 
_ai = _this select 0;
_magazintypes =[];
_reloadmag = false;
_weapons = weapons _ai;
_sleeptime = SAR_REAMMO_INTERVAL;
    
while {alive _ai} do {
    
    _vehicle = vehicle _ai;
    if(_vehicle != _ai) then { 
    
_veh_weapons = weapons _vehicle;
_legit_weapon = false;
{
    if (!([_x,"CarHorn"] call SAR_isKindOf_weapon)) then {
_legit_weapon = true;
_weap_obj = _x;
    };
} foreach _veh_weapons;
if(_legit_weapon) then {
    if(_vehicle ammo _weap_obj < 11) then {
_vehicle setVehicleAmmo 1;
if (SAR_EXTREME_DEBUG) then {diag_log "SAR EXTREME DEBUG: Vehicle got new ammo";};
    };
    
};
if(fuel _vehicle < 0.2) then {
    _vehicle setFuel 1;
    if (SAR_EXTREME_DEBUG) then {diag_log "SAR_EXTREME_DEBUG: Vehicle refueled";};
};
    } else { 
{
    
    if([_x,"Rifle"] call SAR_isKindOf_weapon) then {
_reloadmag = true;
_magazintypes = getArray (configFile >> "CfgWeapons" >> _x >> "magazines");
{
    if (_x in magazines _ai) then {
_reloadmag = false;
    };
} foreach _magazintypes;
if (!(someAmmo _ai) || {_reloadmag})  then {
    _ai removeMagazines (_magazintypes select 0);
    _ai addMagazine (_magazintypes select 0);
    if (SAR_EXTREME_DEBUG) then {diag_log format["SAR_EXTREME_DEBUG: Infantry reloaded a magazine (%1) for a rifle (%2).",(_magazintypes select 0),_x];};
};
    };
    if([_x,"Pistol"] call SAR_isKindOf_weapon) then {
_reloadmag = true;
_magazintypes = getArray (configFile >> "CfgWeapons" >> _x >> "magazines");
{
    if (_x in magazines _ai) then {
_reloadmag = false;
    };
} foreach _magazintypes;
if (!(someAmmo _ai) || {_reloadmag})  then {
    _ai removeMagazines (_magazintypes select 0);
    _ai addMagazine (_magazintypes select 0);
    if (SAR_EXTREME_DEBUG) then {diag_log "SAR_EXTREME_DEBUG: Infantry reloaded a magazine for a pistol.";};
};
    };
    
} foreach _weapons;
    };
    sleep _sleeptime;
};