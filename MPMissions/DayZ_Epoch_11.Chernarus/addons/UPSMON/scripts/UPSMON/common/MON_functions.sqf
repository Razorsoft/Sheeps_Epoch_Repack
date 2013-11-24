
MON_bugged_vehicles = ["BIS_alice_emptydoor","ACE_Grenade_Geometry"];
if !(AcePresent) then {
MON_bugged_vehicles = MON_bugged_vehicles + ["HMMWV_M998A2_SOV_DES_EP1"];
};
MON_subir = {
private ["_object","_altura","_pos","_x","_y","_z"];
if (!isserver) exitwith{};
_object = _this select 0;
_altura = _this select 1;
_x = 0;
_y = 0;
_z = 0;
_pos =0;
_pos = getposAsl _object;
_x = _pos select 0;
_y = ( _pos select 1 );
_z = ( _pos select 2 ) + _altura;
_object setposasl [_x,_y ,_z];
};
MON_getDirPos = {private["_a","_b","_from","_to","_return"]; _from = _this select 0; _to = _this select 1; _return = 0; _a = ((_to select 0) - (_from select 0)); _b = ((_to select 1) - (_from select 1)); if (_a != 0 || _b != 0) then {_return = _a atan2 _b}; if ( _return < 0 ) then { _return = _return + 360 }; _return};
MON_deleteDead = {private["_u","_s"];_u=_this select 0; _s= _this select 1; _u removeAllEventHandlers "killed"; sleep _s; deletevehicle _u};
MON_deleteDeadDist = {
    private ["_u","_s","_dist","_OCercanos","_cicle","_deleted","_isplayer"];
_cicle = 10;
_deleted = false;
_isplayer = false;
_u = _this select 0; 
    _s = _this select 1; 
    _dist = _this select 2; 
    _u removeAllEventHandlers "killed"; 
sleep _s; 
while {!_deleted} do {
_isplayer = false;
_OCercanos = nearestObjects [_u, ["Man"] , _dist];
{if (isplayer _x && alive _x) exitwith {_isplayer = true;}}foreach _OCercanos;
if (!_isplayer) then {
deletevehicle _u;
_deleted = true;
};
sleep _cicle; 
};
};
MON_getArg = {private["_cmd","_arg","_list","_a","_v"]; _cmd=_this select 0; _arg=_this select 1; _list=_this select 2; _a=-1; {_a=_a+1; _v=format["%1",_list select _a]; 
if (_v==_cmd) then {_arg=(_list select _a+1)}} foreach _list; _arg};
MON_GetPos =
{
private ["_pos","_dir","_dist","_cosU","_cosT","_relTX","_sinU","_sinT","_relTY","_newPos","_newPosX","_newPosY","_targetZ","_targetX","_targetY"];
_pos = _this select 0;
_dir = _this select 1;
_dist = _this select 2;
_targetX = _pos select 0; 
    _targetY = _pos select 1; 
    _targetZ = _pos select 2;
_cosU = [_dir] call MON_GetCOS;_sinU = [_dir] call MON_GetSIN;
_cosT = abs cos(_dir);_sinT = abs sin(_dir);
_relTX = _sinT * _dist * _cosU;  _relTY = _cosT * _dist * _sinU;
_newPosX = _targetX + _relTX;_newPosY = _targetY + _relTY;
_newPos = [_newPosX,_newPosY,_targetZ];
_newPos;
};
MON_GetPos2D =
{
private ["_pos","_dir","_dist","_cosU","_cosT","_relTX","_sinU","_sinT","_relTY","_newPos","_newPosX","_newPosY","_targetX","_targetY"];
_pos = _this select 0;
_dir = _this select 1;
_dist = _this select 2;
_targetX = _pos select 0; _targetY = _pos select 1; 
_cosU = [_dir] call MON_GetCOS;_sinU = [_dir] call MON_GetSIN;
_cosT = abs cos(_dir);_sinT = abs sin(_dir);
_relTX = _sinT * _dist * _cosU;  _relTY = _cosT * _dist * _sinU;
_newPosX = _targetX + _relTX;_newPosY = _targetY + _relTY;
_newPos = [_newPosX,_newPosY];
_newPos;
};
MON_BldPos = {
    private ["_bld","_bldpos"];
_bld=_this; 
    _bldpos = 1;
while {format ["%1", _bld buildingPos _bldpos] != "[0,0,0]"}  do {_bldpos = _bldpos + 1;};
_bldpos = _bldpos - 1;
    _bldpos;
};
MON_PosInfo = {
private["_obj","_bld","_bldpos"];
_obj=_this; 
_bld = nearestbuilding _obj; 
_bldpos= _bld call MON_BldPos; 
[_bld,_bldpos];
};
MON_GetSIN = {
private ["_dir","_sin"];
_dir=_this select 0; 
 if (_dir<90)  then  
 {
_sin=1;
 } else 
{ 
if (_dir<180) then 
{
_sin=-1;
} else 
{ 
if (_dir<270) then 
{
_sin=-1;
}
else 
{
_sin=1;
};
};
};
_sin
};
MON_GetCOS = {
private["_dir","_cos"];
_dir=_this select 0; 
 if (_dir<90)  then  
 {
_cos=1;
 } else 
{ 
if (_dir<180) then 
{
_cos=1;
} else 
{ 
if (_dir<270) then 
{
_cos=-1;
}
else 
{
_cos=-1;
};
};
};
_cos
};
MON_GetIn_NearestVehicles = {
private ["_vehicles","_npc","_units","_unitsIn","_grpid","_air"];
_grpid = _this select 0;
_npc = _this select 1;
_vehicles=[[]];
_air=[[]];
_units = [];
_unitsIn = [];
if (leader _npc == _npc) then {
_units = units _npc;
} else
{
_units = _units + [_npc];
};
{
if ( (_x!= vehicle _x && !((vehicle _x) iskindof "StaticWeapon" )) || !(_x iskindof "Man") || !alive _x || !canmove _x || !canstand _x) then {_units = _units-[_x];};
}foreach _units;
_unitsIn = _units;
if ( (count _units) > 0) then {
_air = [_npc,200] call MON_NearestsAirTransports;
{if (_npc knowsabout (_x select 0) <= 0.5) then{ _air = _air - [_x]};}foreach _air;
_units = [_grpid, _units, _air, false] call MON_selectvehicles;
};
sleep 0.05;
if ( (count _units) > 1) then {
_vehicles = [_npc,200,true] call MON_NearestsLandCombat;
{if (_npc knowsabout(_x select 0) <= 0.5) then{ _vehicles = _vehicles - [_x]};}foreach _vehicles;
_units = [_grpid, _units, _vehicles, false] call MON_selectvehicles;
};
sleep 0.05;
if ( (count _units) > 0) then {
_vehicles = [_npc,200] call MON_NearestsLandTransports;
{if (_npc knowsabout (_x select 0) <= 0.5) then{ _vehicles = _vehicles - [_x]};}foreach _vehicles;
_units = [_grpid, _units, _vehicles, false] call MON_selectvehicles;
};
sleep 0.05;
if ( (count _units) > 0 &&  (count _vehicles) > 0) then {
sleep 1;
_vehicles = _vehicles + _air;
_units = [_grpid, _units, _vehicles, true] call MON_selectvehicles;
};
sleep 0.05;
_unitsIn = _unitsIn - _units;
_unitsIn;
};
MON_GetIn_NearestCombat = {
private["_vehicles","_npc","_units","_unitsIn","_grpid","_dist","_all"];
_grpid = _this select 0;
_npc = _this select 1;
_dist = _this select 2;
_all = _this select 3;
_vehicles=[[]];
_units = [];
_unitsIn = [];
if (leader _npc == _npc) then {
_units = units _npc;
} else
{
_units = _units + [_npc];
};
{
if ( (_x!= vehicle _x && !((vehicle _x) iskindof "StaticWeapon" )) || !(_x iskindof "Man") || !alive _x || !canmove _x || !canstand _x) then {_units = _units-[_x];};
}foreach _units;
if (!_all) then {
if (count _units > 2 ) then {_units = _units - [leader _npc]};
};
_unitsIn = _units;
if ( (count _units) > 1) then {
_vehicles = [_npc,_dist,_all] call MON_NearestsAirCombat;
{if (_npc knowsabout (_x select 0) <= 0.5) then{ _vehicles = _vehicles - [_x]};}foreach _vehicles;
_units = [_grpid, _units, _vehicles, false] call MON_selectvehicles;
};
sleep 0.05;
if ( (count _units) > 1) then {
_vehicles = [_npc,_dist,_all] call MON_NearestsLandCombat;
{if (_npc knowsabout(_x select 0) <= 0.5) then{ _vehicles = _vehicles - [_x]};}foreach _vehicles;
_units = [_grpid, _units, _vehicles, false] call MON_selectvehicles;
};
_unitsIn = _unitsIn - _units;
 _unitsIn;
};
MON_GetIn_NearestBoat = {
private["_vehicles","_npc","_units","_unitsIn","_grpid","_dist"];
_grpid = _this select 0;
_npc = _this select 1;
_dist = _this select 2;
_vehicles=[[]];
_units = [];
_unitsIn = [];
if (leader _npc == _npc) then {
_units = units _npc;
} else
{
_units = _units + [_npc];
};
{
if ( (_x!= vehicle _x && !((vehicle _x) iskindof "StaticWeapon" )) || !(_x iskindof "Man") || !alive _x || !canmove _x || !canstand _x) then {_units = _units-[_x];};
}foreach _units;
_unitsIn = _units;
if ( (count _units) > 0) then {
_vehicles = [_npc,_dist] call MON_Nearestsboats;
{if (_npc knowsabout (_x select 0) <= 0.5) then{ _vehicles = _vehicles - [_x]};}foreach _vehicles;
_units = [_grpid, _units, _vehicles, false] call MON_selectvehicles;
};
if ( (count _units) > 1 &&  (count _vehicles) > 0) then {
sleep 1;
_units = [_grpid, _units, _vehicles, true] call MON_selectvehicles;
};
_unitsIn = _unitsIn - _units;
_unitsIn;
};
MON_GetIn_NearestStatic = {
private ["_vehicles","_npc","_units","_unitsIn","_grpid","_distance"];
_grpid = _this select 0;
_npc = _this select 1;
_distance = 100;
if ((count _this) > 2) then {_distance = _this select 2;};
_vehicles=[];
_units = [];
_unitsIn = [];
_vehicles = [_npc,_distance] call MON_NearestsStaticWeapons;
if ( count _vehicles == 0) exitwith {_unitsIn;};
if (leader _npc == _npc) then {
_units = (units _npc) - [_npc];
} else
{
_units = _units + [_npc];
};
{
if ( (_x iskindof "Man") && _x == vehicle _x && alive _x && canmove _x && canstand _x) then {
_unitsIn = _unitsIn + [_x];
};
}foreach _units;
_units = [];
{
if (unitready _x) then {
_units = _units + [_x];
};
}foreach _unitsin;
if (count _units > 0) then {
_unitsIn = _units;
};
 _units = _unitsIn;
if ( count _unitsIn > 0) then {
_units = [_grpid, _units, _vehicles, true] call MON_selectvehicles;
};
_unitsIn = _unitsIn - _units;
_unitsIn;
};
 MON_selectvehicles = {
private ["_vehicles","_emptypositions","_units","_unitsIn","_i","_grpid","_vehgrpid","_unit","_any","_index","_cargo","_vehicle"];
_grpid = _this select 0;
_units = _this select 1;
_vehicles = _this select 2;
_any = _this select 3;
_vehicle = [];
_unitsIn = [];
_emptypositions = 0;
_i = 0;
_vehgrpid = 0;
_unit = objnull;
_index = 0;
_cargo = [];
  {
if ((count _units) == 0 )  exitwith {};
_vehicle = _x select 0 ;
_emptypositions = _x select 1;
_unitsIn = [];
_i = 0;
_vehgrpid = _vehicle getvariable ("UPSMON_grpid");
_cargo = _vehicle getvariable ("UPSMON_cargo");
if ( isNil("_vehgrpid") ) then {_vehgrpid = 0;};
if ( isNil("_cargo") ) then {_cargo = [];};
if (_vehgrpid == 0) then {
_vehicle setVariable ["UPSMON_grpid", _grpid, false];
_vehicle setVariable ["UPSMON_cargo", _unitsIn, false];
_vehgrpid = _grpid;
};
{
if (!alive _x || !canmove _x) then {_cargo = _cargo - [_x]; };
}foreach _cargo;
_emptypositions = _emptypositions - (count _cargo - count ( crew _vehicle) );
if ( _vehgrpid == _grpid || (_emptypositions > 0 && _any)) then {
while {_i < _emptypositions && _i < count _units} do
{
_unit = _units select _i;
_unitsIn = _unitsIn + [_unit];
_i = _i + 1;
};
_units = _units - _unitsIn;
if ( (count _unitsIn) > 0) then {
[_grpid,_unitsIn,_vehicle] spawn MON_UnitsGetIn;
if (KRON_UPS_Debug>0 ) then {diag_log format["KRON_UPS_Debug: Group %1: Moving %3 units into %2 with %4 positions",_grpid,typeof _vehicle,count _unitsIn,_emptypositions]}; 
};
};
_index = _index  + 1;
sleep 0.05;
} foreach _vehicles;
_units;
 };
MON_UnitsGetIn = {
private ["_grpid","_vehicle","_driver","_gunner","_unitsin","_units","_Commandercount","_Drivercount","_Gunnercount","_cargo","_Cargocount","_commander","_vehgrpid"];
_grpid = _this select 0;
_unitsin = _this select 1;
_vehicle = _this select 2;
_units = _unitsin;
_driver = objnull;
_gunner = objnull;
_commander= objnull;
_Cargocount = 0;
_Gunnercount = 0;
_Commandercount = 0;
_Drivercount = 0;
_cargo = [];
_Cargocount = (_vehicle) emptyPositions "Cargo";
_Gunnercount = (_vehicle) emptyPositions "Gunner"; 
_Commandercount = (_vehicle) emptyPositions "Commander"; 
_Drivercount = (_vehicle) emptyPositions "Driver"; 
_vehgrpid = _vehicle getvariable ("UPSMON_grpid");
_cargo = _vehicle getvariable ("UPSMON_cargo");
if ( isNil("_vehgrpid") ) then {_vehgrpid = 0;};
if ( isNil("_cargo") ) then {_cargo = [];};
_cargo = _cargo - _unitsin; 
_cargo = _cargo + _unitsin; 
_vehicle setVariable ["UPSMON_cargo", _cargo, false];
{
[_x,0] call MON_dostop;
if ("StaticWeapon" countType [vehicle (_x)]>0) then 
{
_x spawn MON_doGetOut;
};
unassignVehicle _x;
_x spawn MON_Allowgetin;
}foreach _units;
{
if ( _vehgrpid == _grpid && _x == leader _x && _Commandercount > 0 ) exitwith
{
_Commandercount = 0;
_commander = _x;
_commander assignAsCommander _vehicle;
_units = _units - [_x];
[_x] orderGetIn true;
};
if ( _x == leader _x && _Cargocount > 0 ) exitwith
{
_x assignAsCargo _vehicle;
_units = _units - [_x];
_Cargocount = _Cargocount - 1;
[_x] orderGetIn true;
};
}foreach _units;
if ( _vehgrpid == _grpid ) then {
if ( _Drivercount > 0 && count (_units) > 0 ) then { 
_driver =  _units  select (count _units - 1);
[_driver,_vehicle,0] spawn MON_assignasdriver;
_units = _units - [_driver];
};
if ( _Gunnercount > 0 && count (_units) > 0 ) then { 
_gunner = [_vehicle,_units] call MON_getNearestSoldier;
[_gunner,_vehicle] spawn MON_assignasgunner;
_units = _units - [_gunner];
};
};
if ( _Cargocount > 0 && count (_units) > 0 ) then { 
{ 
_x assignAsCargo _vehicle;
[_x] orderGetIn true;
sleep 0.05;
} forEach _units;  
};
{
[_x] spawn MON_avoidDissembark;
} forEach _unitsin - [_driver] - [_gunner] -[_commander]; 
};
MON_getNearestSoldier = {
private["_units","_obj","_near"];
_obj = _this select 0;
_units = _this select 1;
_near = objnull;
{
if (isnull _near) then {
_near = _x;
} else {
if ( _x distance _obj < _near distance _obj ) then {_near = _x;};
};
}foreach _units;
_near;
};
MON_avoidDissembark = {
private["_npc","_timeout"];
_npc = _this select 0;
_timeout = 120;
_timeout = time + _timeout;
while {_npc == vehicle _npc && alive _npc && canmove _npc && time < _timeout} do {
sleep 1;
};
if (!alive _npc || !canmove _npc || time >= _timeout || driver vehicle _npc == _npc) exitwith{};
_npc stop true;
while {_npc != vehicle _npc && alive _npc && canmove _npc} do {sleep 1;};
_npc stop false;
sleep 0.5;
if (!alive _npc || !canmove _npc) exitwith{};
};
MON_NearestLandTransport = {
private ["_vehicle","_npc","_transportSoldier","_OCercanos","_Commandercount","_Drivercount","_Gunnercount","_Cargocount"];
_npc = _this;
_OCercanos = [];
_transportSoldier = 0;
_vehicle = objnull;
_Cargocount = 0;
_Gunnercount = 0;
_Commandercount = 0;
_Drivercount = 0;
_OCercanos = nearestObjects [_npc, ["Car","TANK","Truck","Motorcycle"] , 150];
{
_Cargocount = (_x) emptyPositions "Cargo";
_Gunnercount = (_x) emptyPositions "Gunner"; 
_Commandercount = (_x) emptyPositions "Commander"; 
_Drivercount = (_x) emptyPositions "Driver"; 
_transportSoldier = _Cargocount + _Gunnercount + _Commandercount + _Drivercount;
if (!locked _x  && canMove _x && _transportSoldier >= count (units _npc) && !(typeof _x in MON_bugged_vehicles)
&& (_drivercount > 0 || side _npc == side _x )) exitwith {_vehicle = _x;};
}foreach _OCercanos;
_vehicle;
};
MON_NearestsLandTransports = {
private ["_vehicles","_npc","_emptypositions","_OCercanos","_Commandercount","_Drivercount","_Gunnercount","_Cargocount","_distance"];
_npc = _this select 0;
_distance = _this select 1;
_OCercanos = [];
_emptypositions = 0;
_vehicles = [];
_Cargocount = 0;
_Gunnercount = 0;
_Commandercount = 0;
_Drivercount = 0;
_OCercanos = nearestObjects [_npc, ["Car","TANK","Truck","Motorcycle"] , _distance];
{
_Cargocount = (_x) emptyPositions "Cargo";
_Gunnercount = (_x) emptyPositions "Gunner"; 
_Commandercount = (_x) emptyPositions "Commander"; 
_Drivercount = (_x) emptyPositions "Driver"; 
_emptypositions = _Cargocount + _Gunnercount + _Commandercount + _Drivercount;
if (!locked _x && _emptypositions > 0 && canMove _x && !(typeof _x in MON_bugged_vehicles)
&& (_drivercount > 0 || side _npc == side _x )) then { _vehicles = _vehicles + [[_x,_emptypositions]];};
}foreach _OCercanos;
_vehicles;
};
MON_NearestsLandCombat = {
private ["_vehicles","_npc","_emptypositions","_OCercanos","_Commandercount","_Drivercount","_Gunnercount","_Cargocount","_distance","_all"];
_npc = _this select 0;
_distance = _this select 1;
_all = _this select 2;
_OCercanos = [];
_emptypositions = 0;
_vehicles = [];
_Cargocount = 0;
_Gunnercount = 0;
_Commandercount = 0;
_Drivercount = 0;
_OCercanos = nearestObjects [_npc, ["Car","TANK","Truck","Motorcycle"] , _distance];
{
if (_all) then {
_Cargocount = (_x) emptyPositions "Cargo";
};
_Gunnercount = (_x) emptyPositions "Gunner"; 
_Drivercount = (_x) emptyPositions "Driver"; 
_Commandercount = (_x) emptyPositions "Commander"; 
_emptypositions = _Cargocount + _Gunnercount + _Commandercount + _Drivercount;
if (!locked _x && _Gunnercount > 0 && canMove _x && !(typeof _x in MON_bugged_vehicles)
&& (_drivercount > 0 || side _npc == side _x )) then { _vehicles = _vehicles + [[_x,_emptypositions]];};
}foreach _OCercanos;
_vehicles;
};
MON_NearestsAirTransports = {
private ["_vehicles","_npc","_emptypositions","_OCercanos","_Commandercount","_Drivercount","_Gunnercount","_Cargocount","_distance"];
_npc = _this select 0;
_distance = _this select 1;
_OCercanos = [];
_emptypositions = 0;
_vehicles = [];
_Cargocount = 0;
_Gunnercount = 0;
_Commandercount = 0;
_Drivercount = 0;
_OCercanos = nearestObjects [_npc, ["Helicopter"] , _distance];
{
_Cargocount = (_x) emptyPositions "Cargo";
_Gunnercount = (_x) emptyPositions "Gunner"; 
_Commandercount = (_x) emptyPositions "Commander"; 
_Drivercount = (_x) emptyPositions "Driver"; 
_emptypositions = _Cargocount + _Gunnercount + _Commandercount + _Drivercount;
if (!locked _x && _emptypositions > 0 && canMove _x && !(typeof _x in MON_bugged_vehicles)
&& (_drivercount > 0 || side _npc == side _x )) then { _vehicles = _vehicles + [[_x,_emptypositions]];};
}foreach _OCercanos;
_vehicles;
};
MON_NearestsAirCombat = {
private ["_vehicles","_npc","_emptypositions","_OCercanos","_Commandercount","_Drivercount","_Gunnercount","_Cargocount","_distance","_all"];
_npc = _this select 0;
_distance = _this select 1;
_all  = _this select 2;
_OCercanos = [];
_emptypositions = 0;
_vehicles = [];
_Cargocount = 0;
_Gunnercount = 0;
_Commandercount = 0;
_Drivercount = 0;
_OCercanos = nearestObjects [_npc, ["Helicopter"] , _distance];
{
if (_all) then {
_Cargocount = (_x) emptyPositions "Cargo";
};
_Gunnercount = (_x) emptyPositions "Gunner"; 
_Drivercount = (_x) emptyPositions "Driver"; 
_Commandercount = (_x) emptyPositions "Commander"; 
_emptypositions = _Cargocount + _Gunnercount + _Commandercount + _Drivercount;
if (!locked _x && _Gunnercount > 0 && canMove _x && !(typeof _x in MON_bugged_vehicles)
&& (_drivercount > 0 || side _npc == side _x )) then { _vehicles = _vehicles + [[_x,_emptypositions]];};
}foreach _OCercanos;
_vehicles 
};
MON_NearestsStaticWeapons = {
private ["_vehicles","_npc","_emptypositions","_OCercanos","_Gunnercount","_distance"];
_npc = _this select 0;
_distance = _this select 1;
_OCercanos = [];
_emptypositions = 0;
_vehicles = [];
_Gunnercount = 0;
_OCercanos = nearestObjects [_npc, ["StaticWeapon"] , _distance];
{
_Gunnercount = (_x) emptyPositions "Gunner"; 
_emptypositions = _Gunnercount;
if (!locked _x && alive _x && _emptypositions > 0 && !(typeof _x in MON_bugged_vehicles) ) then { _vehicles = _vehicles + [[_x,_emptypositions]];};
}foreach _OCercanos;
_vehicles 
};
MON_Nearestsboats = {
private ["_vehicles","_npc","_emptypositions","_OCercanos","_Commandercount","_Drivercount","_Gunnercount","_Cargocount","_distance"];
_npc = _this select 0;
_distance = _this select 1;
_OCercanos = [];
_emptypositions = 0;
_vehicles = [];
_Cargocount = 0;
_Gunnercount = 0;
_Commandercount = 0;
_Drivercount = 0;
_OCercanos = nearestObjects [_npc, ["Ship"] , _distance];
{
_Cargocount = (_x) emptyPositions "Cargo";
_Gunnercount = (_x) emptyPositions "Gunner"; 
_Commandercount = (_x) emptyPositions "Commander"; 
_Drivercount = (_x) emptyPositions "Driver"; 
_emptypositions = _Cargocount + _Gunnercount + _Commandercount + _Drivercount;
if (!locked _x && _emptypositions > 0 && canMove _x && (_drivercount > 0 || side _npc == side _x )) then { _vehicles = _vehicles + [[_x,_emptypositions]];};
}foreach _OCercanos;
_vehicles 
};
MON_assignasdriver = {
private["_vehicle","_driver","_wait"];
_driver =  _this  select 0;
_vehicle = _this select 1;
_wait = _this select 2;
[_driver,_wait] spawn MON_dostop;
sleep _wait;
unassignVehicle _driver;
_driver assignasdriver _vehicle;
[_driver] orderGetIn true;
};
MON_assignasgunner = {
private["_vehicle","_gunner","_dist"];
_gunner =  _this  select 0;
_vehicle = _this select 1;
_dist=0;
_gunner assignasgunner _vehicle;
[_gunner] orderGetIn true;
waituntil  { _gunner != vehicle _gunner || !alive _gunner || !canmove _gunner ||!alive _vehicle || !canfire _vehicle};
if ( alive _gunner && alive _vehicle && canmove _gunner && canfire _vehicle) then {
_dist = _gunner distance _vehicle;
if (_dist < 3) then {
_gunner moveInTurret [_vehicle, [0]] ;
};
};
};
MON_Allowgetin = {
[_this] allowGetIn true;
};
 MON_checkleaveVehicle={
private ["_in","_npc","_vehicle","_driver"];
_npc = _this select 0;
_vehicle = _this select 1;
_driver = _this select 2;
_in = false;
sleep 5;
{
if (_x != vehicle _x) then {_in = true};
}foreach units _npc;
if (!_in) then {
_driver enableAI "MOVE"; 
sleep 1;
_driver stop false;
sleep 1;
_driver leaveVehicle _vehicle; 
sleep 1;
 };
 };
 
MON_GetOut = {
private ["_vehicle","_npc","_gunner"];
_npc = _this;
_vehicle = vehicle (_npc);
_gunner = objnull;
_gunner = gunner _vehicle;
sleep 0.05;
if (!alive _npc) exitwith{};
        
        
        
            [_npc] allowGetIn false;
_npc spawn MON_doGetOut; 
unassignVehicle _npc;
};
MON_doGetOut = {
private ["_vehicle","_npc","_dir"];
_npc = _this;
_vehicle = vehicle (_npc);
sleep 0.05;
if (_vehicle == _npc) exitwith{};
waituntil {!alive _npc || !canmove _npc || !alive _vehicle || ( (abs(velocity _vehicle select 0)) <= 0.1 && (abs(velocity _vehicle select 1)) <= 0.1 )
 || ( _vehicle iskindof "Air" && ((position _vehicle) select 2) <= 1)};
if (!alive _npc || !canmove _npc) exitwith{};
unassignVehicle _npc;
_npc action ["getOut", _vehicle];
doGetOut _npc;
[_npc] allowGetIn false;
nul = [_npc] spawn MON_cancelstop;
waituntil {!alive _npc || !canmove _npc || vehicle _npc == _npc};
if (!alive _npc || !canmove _npc) exitwith{};
if (leader _npc != _npc) then {
_dir = getDir _npc;
_dir = _dir + 45 - (random 90);
nul = [_npc,25,_dir] spawn MON_domove;
if (KRON_UPS_Debug>0 ) then { diag_log format["KRON_UPS_Debug: Group %1 Moving away from %2 in direction %3",_npc, typeof _vehicle,_dir];};
};
};
MON_doParadrop = {
private ["_heli","_npc","_targetpos","_helipos","_dist","_targetPosWp","_crew","_timeout","_jumpers","_atdist","_flyingheigh","_landonBeh"];
if (KRON_UPS_Debug>0 ) then { diag_log format["Mon_doParadrop started"];};
_heli = _this select 0;
_targetPos = [0,0];
_atdist = 250;
_flyingheigh =  KRON_UPS_flyInHeight;
_landonBeh = ["CARELESS","SAFE"];
_timeout=0;
if ((count _this) > 1) then {_targetPos = _this select 1;};
if ((count _this) > 2) then {_atdist = _this select 2;};
if ((count _this) > 3) then {_flyingheigh = _this select 3;};
_helipos = [0,0];
_targetposWp = [0,0];
_dist = 1000000;
_crew =[];
waituntil {count crew _heli > 0 || !alive _heli || !canmove _heli};
_npc = leader ((crew _heli) select 0);
while { (_dist >= _atdist || _dist < 10) && alive _heli && canmove _heli && count crew _heli > 0} do {
_heli flyInHeight _flyingheigh;
/*
_index = (count waypoints _grp) - 1;
_wp = [_grp,_index];
_targetPosWp = waypointPosition _wp;
if (format ["%1", _targetPosWp] == "[0,0,0]") then {_targetPosWp = _targetPos};
*/
_targetPosWp = _targetPos;
_helipos = position _heli;
_dist = round([_helipos,_targetPosWp] call KRON_distancePosSqr);
sleep 1;
};
if (!alive _heli || count crew _heli == 0) exitwith{};
_crew = crew _heli;
    
if (((position _heli) select 2) >= 90 && !surfaceIsWater position _heli && (!(toupper (behaviour _npc) IN _landonBeh) || (random 100) < 20)) then { 
if (KRON_UPS_Debug>0 ) then {diag_log format["doing paradrop high %1 dist=%2",(position _heli) select 2,_dist,_atdist];};
_jumpers = [_heli] call R_FN_unitsInCargo;
{
if( (assignedVehicleRole _x) select 0 == "Cargo")then
{
unassignVehicle _x;
_x action ["EJECT", _heli] ;
_x stop false;
[_x] allowGetIn false;
[_x] spawn MON_ACE_Watersurvival;
};
sleep 0.5;
} forEach crew _heli;
[_heli,700] spawn MON_domove;
_heli setVariable ["UPSMON_grpid", 0, false];
_heli setVariable ["UPSMON_cargo", [], false];
_timeout = time + 60;
{
waituntil {(_x == vehicle _x ) || !alive _x || !canmove _x || isnull _x || time > _timeout};
} foreach _jumpers;
if ( _npc == vehicle _npc) then {
{
if (alive _x && canmove _x) then {
[_x] dofollow _npc;
};
    } foreach units _npc;
};
if (alive _npc && canmove _npc) then {
_npc move _targetPosWp;
}else{
{if (alive _x && canmove _x) exitwith { _x move _targetPosWp;}}foreach _crew;
};
if (count crew _heli <=1) then {
[_heli] spawn MON_landHely;
};
} else {
if ( ((position _heli) select 2) >= 60 && !surfaceIsWater _helipos && ((random 100)<20 || !canmove _heli || (toupper (behaviour _npc) IN _landonBeh))) then {
    [_heli] spawn MON_landHely;
} 
else {
If (alive _heli && canmove _heli && count crew _heli > 0) then {
if (KRON_UPS_Debug>0 ) then {diag_log format["%1 failed paradrop, trying another time",typeof _heli];};
_heli flyInHeight _flyingheigh;
sleep 3;
[_heli, _targetPos, _atdist*1.5,_flyingheigh] spawn MON_doParadrop; 
};
};
};
};
MON_landHely = {
private ["_heli","_npc","_crew","_NearestEnemy","_timeout","_landing","_targetpos","_jumpers","_groupOne","_grpid"];
_heli = _this select 0;
_crew =[];
_targetpos=[0,0];
_timeout = 0;
_landing = false;
sleep 0.05;
if (!alive _heli  || !canmove _heli ) exitwith{};
_crew = crew _heli;
_npc = leader (_crew select 0);
_landing = _heli getVariable "UPSMON_landing";
if (isnil ("_landing")) then {_landing=false; _heli setVariable ["UPSMON_landing", false, false];};
if (_landing) exitwith {};
_heli land "LAND";
if (KRON_UPS_Debug>0 ) then {diag_log format["%1 is landing",typeof _heli];};
_heli setVariable ["UPSMON_landing", true, false];
waituntil {!alive _heli || toUpper(landResult _heli) != "NOTREADY" };
if (alive _heli && (toUpper(landResult _heli) == "NOTFOUND")) exitwith { 
if (KRON_UPS_Debug>0 ) then { diag_log format["%1 no landing zone, doing paradrop",typeof _heli];};
_heli setVariable ["UPSMON_landing", false, false];
[_heli] spawn MON_doparadrop;
};
_timeout = 60 + time;
waituntil {!alive _heli || time > _timeout || ((abs(velocity _heli select 2)) <= 1 && ((position _heli) select 2) <= 0.7)};
if (((position _heli) select 2) > 2 && ((position _heli) select 2) < 30 && !surfaceiswater position _heli) then { 
_heli land "LAND";
_timeout = 30 + time;
waituntil {!alive _heli || time > _timeout || ((position _heli) select 2) > 30 || ( (abs(velocity _heli select 2)) <= 1 && ((position _heli) select 2) <= 0.7)};
if ( ((position _heli) select 2) > 30) exitwith { 
if (KRON_UPS_Debug>0 ) then { diag_log format["%1 landing timeout, doing paradrop",typeof _heli];};
_heli setVariable ["UPSMON_landing", false, false];
sleep 5;
[_heli] spawn MON_doparadrop;
};
};
if (!alive _heli) exitwith{};
if ((!isnull gunner _heli)  && (!isnull driver _heli)) then {
_jumpers = [_heli] call R_FN_unitsInCargo;
} else {
_jumpers = crew _heli;
};
{
_x spawn MON_doGetOut;
sleep 0.5;
} forEach _jumpers;
_timeout = 20 + time;
{
waituntil {vehicle _x == _x || !canmove _x || !alive _x || movetofailed _x  || time > _timeout }; 
} forEach _jumpers;
sleep 1;
_heli land "NONE";
sleep 1;
[_heli,700] spawn MON_domove;
if (alive _npc && canmove _npc) then {
_NearestEnemy = _npc findNearestEnemy _npc;
if (!isnull _NearestEnemy ) then {
_npc setBehaviour "AWARE"; 
_groupOne = group _npc;
_groupOne setFormation "DIAMOND";
};
_grpid = _npc getvariable "UPSMON_grpid";
if !(isnil "_grpid") then {
_targetpos =(KRON_targetsPos select _grpid);
_npc move _targetpos;
if (KRON_UPS_Debug>0 ) then { diag_log format["%1 landed, moving to %2 %3",_grpid,_targetpos,count KRON_targetsPos];};
};
};
_heli setVariable ["UPSMON_grpid", 0, false];
_heli setVariable ["UPSMON_cargo", [], false];
_heli setVariable ["UPSMON_landing", false, false];
};
MON_HeliStuckcontrol = {
private ["_heli","_landing","_stuckcontrol"];
_heli = _this select 0;
_landing = false;
_stuckcontrol = false;
sleep 0.05;
if ( !alive _heli  || !canmove _heli ) exitwith{};
_stuckcontrol = _heli getVariable "UPSMON_stuckcontrol";
if (isnil ("_stuckcontrol")) then {_stuckcontrol=false};
if (_stuckcontrol) exitwith {};
_heli setVariable ["UPSMON_stuckcontrol", true, false];
while {(alive _heli) && (count crew _heli) > 0 } do {
sleep 5;
if ((abs(velocity _heli select 0)) <= 5 && (abs(velocity _heli select 1)) <= 5 && (abs(velocity _heli select 2)) <= 5 && ((position _heli) select 2) >= 30) then {
_landing = _heli getVariable "UPSMON_landing";
if (isnil ("_landing")) then {_landing=false;};
if (!_landing) then {
[_heli,800] spawn MON_domove;
if (KRON_UPS_Debug>0 ) then {diag_log format["KRON_UPS_Debug: Group %1 stuck in heli at %2m height, moving",typeof _heli,(position _heli) select 2];};
sleep 25;
};
};
};
_heli setVariable ["UPSMON_stuckcontrol", false, false];
};
MON_Gunnercontrol = {
private ["_vehicle","_gunnercontrol","_hasgunner","_crew","_crew2"];
_vehicle = _this select 0;
_gunnercontrol = false;
_hasgunner = (_vehicle) emptyPositions "Gunner" > 0 || !isnull gunner _vehicle; 
_crew = [];
_crew2 = []; 
sleep 0.05;
if ( !alive _vehicle  || !canmove _vehicle ) exitwith{};
_gunnercontrol = _vehicle getVariable "UPSMON_gunnercontrol";
if (isnil ("_gunnercontrol")) then {_gunnercontrol=false};
if (_gunnercontrol) exitwith {};
_vehicle setVariable ["UPSMON_gunnercontrol", true, false];
_crew = crew _vehicle;
while {alive _vehicle && canmove _vehicle && count _crew > 0} do {
_crew = crew _vehicle;
{
if (!canmove _x || !alive _x) then {_crew = _crew -[_x];};
}foreach _crew;
if ((isnull (driver _vehicle) || !alive (driver _vehicle) || !canmove (driver _vehicle)) && count _crew > 0) then {
_crew2 = _crew - [gunner _vehicle];
if (count _crew2 > 0) then {
(_crew2 select (count _crew2 - 1)) spawn MON_movetodriver;
};
};
if ( _hasgunner && (isnull (gunner _vehicle) || !alive (gunner _vehicle) || !canmove (gunner _vehicle)) && count _crew > 1) then {
_crew2 = _crew - [driver _vehicle];
if (count _crew2 > 0) then {
(_crew2 select (count _crew2 - 1)) spawn MON_movetogunner;
}else{
(_crew select 0) spawn MON_movetogunner;
};
};
sleep 20;
};
_vehicle setVariable ["UPSMON_gunnercontrol", false, false];
};
MON_move = {
private["_npc","_dir1","_targetPos","_dist"];
_npc = _this select 0;
_dist = _this select 1;
sleep 0.05;
if (!alive _npc  || !canmove _npc ) exitwith{};
_dir1 = getDir _npc;
_targetPos = [position _npc,_dir1, _dist] call MON_GetPos2D;
_npc move _targetPos;
};
MON_domove = {
private["_npc","_dir1","_targetPos","_dist"];
_npc = _this select 0;
_dist = _this select 1;
if ((count _this) > 2) then {_dir1 = _this select 2;} else{_dir1 = getDir _npc;};
sleep 0.05;
if (!alive _npc  || !canmove _npc ) exitwith{};
_targetPos = [position _npc,_dir1, _dist] call MON_GetPos2D;
if (surfaceIsWater _targetPos && !(_npc iskindof "boat" || _npc iskindof "air") ) exitwith {};
_npc domove _targetPos;
};
MON_doStop = {
private["_sleep","_npc"];
_npc = _this select 0;
_sleep = _this select 1;
sleep 0.05;
if (!alive _npc  || !canmove _npc ) exitwith{};
if ( _sleep == 0 ) then {_sleep = 0.1};
dostop _npc ; 
sleep _sleep;
[_npc] spawn MON_cancelstop;
};
MON_cancelstop = {
private["_npc"];
_npc = _this select 0;
_npc stop false;
};
MON_evadeGrenade = {
if (!alive _this || (vehicle _this) != _this  || !canmove _this) exitwith{};
_this playmovenow "AmovPercMstpSlowWrflDnon_ActsPpneMstpSlowWrflDr_GrenadeEscape";
sleep 8;
if (!alive _this || (vehicle _this) != _this  || !canmove _this) exitwith{};
_this switchmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"; 
_this playmovenow "AmovPpneMstpSrasWrflDnon"; 
};
MON_animCroqueta = {
if (!alive _this || (vehicle _this) != _this || !canmove _this || !(_this iskindof "Man")) exitwith{};
if ((random 1)<=.50) then {
_this switchmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl"; 
} else {
_this switchmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"; 
};
};
MON_throw_grenade = {
private["_target","_npc"];
_npc = _this select 0;
_target = _this select 1;
sleep random 1.5;
if (!alive _npc || (vehicle _npc) != _npc || !canmove _npc) exitwith{};
[_npc,_target] spawn MON_dowatch;
sleep 0.1;
[_npc] spawn R_ThrowSmoke;
/*
_npc addMagazine "SmokeShell";
_npc selectWeapon "throw";
sleep .1;
_npc fire ["SmokeShellMuzzle","SmokeShellMuzzle","SmokeShell"];
*/
};
MON_setUnitPos = {
private["_pos","_npc"];
_npc = _this select 0;
_pos = _this select 1;
sleep 0.5;
if (!alive _npc || !canmove _npc || _npc != vehicle _npc || !(_npc iskindof "Man")) exitwith{};
_npc setUnitPos _pos;
sleep 1;
};
MON_setUnitPosTime = {
private ["_pos","_npc","_time"];
_npc = _this select 0;
_pos = _this select 1;
_time = _this select 2;
if (!alive _npc || !canmove _npc) exitwith{};
_npc setUnitPos _pos;
sleep _time;
_npc setUnitPos "AUTO";
sleep 1;
};
MON_dowatch = {
private["_target","_npc"];
_npc = _this select 0;
_target = _this select 1;
if (!alive _npc) exitwith{};
_npc dowatch _target; 
sleep 1;
};
MON_movetoDriver = {
private["_vehicle","_npc"];
_npc = _this ;
_vehicle = vehicle _npc;
if (vehicle _npc == _npc || !alive _npc || !canmove _npc || !(_npc iskindof "Man")) exitwith{};
if (isnull(driver _vehicle) || !alive(driver _vehicle) || !canmove(driver _vehicle)) then { 
if (KRON_UPS_Debug>0) then {diag_log format["KRON_UPS_Debug: Group %1: Moving to driver of %2 ",_npc,typeof _vehicle]}; 
 _npc action ["getOut", _vehicle];
 doGetOut _npc;
WaitUntil {vehicle _npc==_npc || !alive _npc || !canmove _npc};
if (!alive _npc || !canmove _npc) exitwith{};
unassignVehicle _npc;
_npc assignasdriver _vehicle;
_npc moveindriver _vehicle;
};
};
MON_movetogunner = {
private["_vehicle","_npc"];
_npc = _this ;
_vehicle = vehicle _npc;
sleep 0.05;
if (vehicle _npc == _npc || !alive _npc || !canmove _npc || !(_npc iskindof "Man")) exitwith{};
if (isnull(gunner _vehicle) || !alive(gunner _vehicle) || !canmove(gunner _vehicle)) then { 
if (KRON_UPS_Debug>0) then {diag_log format["KRON_UPS_Debug: Group %1: Moving to gunner of %2 ",_npc,typeof _vehicle]}; 
 _npc action ["getOut", _vehicle];
 doGetOut _npc;
WaitUntil {vehicle _npc==_npc || !alive _npc || !canmove _npc};
if (!alive _npc || !canmove _npc) exitwith{};
unassignVehicle _npc;
_npc assignasgunner _vehicle;
_npc moveingunner _vehicle;
};
};
MON_GetNearestBuildings = {
private ["_object","_bldpos","_minfloors","_OCercanos","_distance","_blds"];
_distance = 25;
_minfloors = 2;
_blds = [];
_object = _this select 0;
if ((count _this) > 1) then {_distance = _this select 1;};
if ((count _this) > 2) then {_minfloors = _this select 2;};
 
_bldpos =0;
if ( _minfloors == 0  ) then {
_minfloors = 2;
 };
_OCercanos = nearestObjects [_object, ["house","building"] , _distance];
{
_bldpos = _x call MON_BldPos; 
if ( _bldpos >= _minfloors && damage _x <= 0 ) then { _blds = _blds + [[_x,_bldpos]];};
}foreach _OCercanos;
_blds;
};
MON_moveNearestBuildings = {
private ["_npc","_blds","_distance","_patrol","_wait","_all","_units","_bldunitsin"];
_distance = 30;
_patrol = false;
_wait=60;
_all = false;
_npc = _this select 0;
if ((count _this) > 1) then {_distance = _this select 1;};
if ((count _this) > 2) then {_patrol = _this select 2;};
if ((count _this) > 3) then {_wait = _this select 3;};
if ((count _this) > 4) then {_all = _this select 4;};
_bldunitsin=[];
_units=[];
_blds=[];
if (_all) then {
_units = (units _npc);
}else{
_units = (units _npc) - [_npc];
}; 
sleep 0.05;
{
if (_x iskindof "Man" && unitReady _x && _x == vehicle _x && canmove _x && alive _x && canstand _x) then {_bldunitsin = _bldunitsin + [_x]}
}foreach _units;
if (count _bldunitsin == 0) exitwith {};
_blds = [_npc,_distance] call MON_GetNearestBuildings;
if (count _blds==0) exitwith {};
[_bldunitsin, _blds, _patrol,_wait,_all] spawn MON_moveBuildings;
};
MON_moveBuildings = {
private ["_altura","_bld","_bldpos","_blds","_cntobjs1","_i","_patrol","_wait","_all","_minpos","_blds2","_movein","_bldunitsin","_units"];
_patrol = false;
_wait = 60;
_minpos  = 2;
_all = false;
_units = _this select 0;
_blds = _this select 1;
if ((count _this) > 2) then {_patrol = _this select 2;};
if ((count _this) > 3) then {_wait = _this select 3;};
if ((count _this) > 4) then {_all = _this select 4;};
if ((count _this) > 5) then {_minpos = _this select 5;};
_altura = 0;
_bld = objnull;
_bldpos =0;
_cntobjs1=0;
_bldunitsin=[];
_movein=[];
_blds2 =[];
if (KRON_UPS_Debug>0) then {diag_log format["MON_moveBuildings _units=%1 _blds=%2",count _units, count _blds];};
{
_bld = _x select 0;
_bldpos = _x select 1; 
if ( _bldpos >= _minpos ) then {
_cntobjs1 = 1;
_movein = [];
_i = 0;
if (_patrol) then {
if (_bldpos >= 8) then { _cntobjs1 =  2 };
} else {
                if (_bldpos >= 8) then { _cntobjs1 =   (round(random 3))  + 1;};
};
{
if (_x iskindof "Man" && unitReady _x && canmove _x && alive _x && vehicle _x == _x && _i < _cntobjs1) then{
_movein = _movein + [_x];
_i = _i + 1;
};
} foreach  _units;
if (KRON_UPS_Debug>0) then {diag_log format["_units=%3 _bldunitsin %4 _movein=%1 %2 %5",_movein, typeof _bld, count _units, count _bldunitsin,_x];};
if (count _movein > 0) then {
_bldunitsin = _bldunitsin + _movein;
_units = _units - _bldunitsin;
if (_patrol) then {
{
[_x,_bld,_bldpos] spawn MON_patrolBuilding;
}foreach _movein;
} else {
{
_altura = floor(random(_bldpos));
if (_altura<2) then {_altura = _minpos};
[_x,_bld,_altura,_wait] spawn MON_movetoBuilding;
}foreach _movein;
};
};
};
if (count _units == 0) exitwith {};
}foreach _blds;
if ( _all && count _units > 0 ) then {
_blds2 = [];
_minpos = _minpos + 3;
{
if ( (_x select 1) >= _minpos) then {
_blds2 = _blds2 + [_x];
};
}foreach _blds;
if (count _blds2 > 0 ) then {
[_units, _blds2, _patrol,_wait,_all,_minpos] call MON_moveBuildings;
};
_bldunitsin = _bldunitsin + _units;
};
_bldunitsin;
};
MON_movetoBuilding = {
private ["_npc","_altura","_bld","_wait","_dist","_retry","_soldiers","_inbuilding","_bldpos","_timeout"];
_wait = 60;
_timeout = 120;
_dist = 0;
_retry = false;
_npc = _this select 0;
_bld = _this select 1;
_altura = _this select 2;
if ((count _this) > 3) then {_wait = _this select 3;};
if (vehicle _npc != _npc || !alive _npc || !canmove _npc) exitwith{};
_inbuilding = _npc getvariable ("UPSMON_inbuilding");
if ( isNil("_inbuilding") ) then {_inbuilding = false;};
if (_inbuilding)  exitwith{};
_npc domove (_bld buildingPos _altura); 
_npc setVariable ["UPSMON_inbuilding", _inbuilding, false];
_npc setvariable ["UPSMON_buildingpos", nil, false];
_timeout = time + _timeout;
waitUntil {moveToCompleted _npc || moveToFailed _npc || !alive _npc || !canmove _npc || _timeout < time};
if (moveToCompleted _npc && alive _npc && canmove _npc) then {
_dist = [position _npc,_bld buildingPos _altura] call KRON_distancePosSqr;
_soldiers = [_npc,1] call MON_nearestSoldiers;
if (count _soldiers > 0) then {
{
if (!isnil{_x getvariable ("UPSMON_buildingpos")}) exitwith {_retry = true};
}foreach _soldiers;
};
if (!_retry && _dist <= 2) then {
_npc setvariable ["UPSMON_buildingpos", _altura, false];
sleep 0.1;
[_npc,_wait] spawn MON_dostop;
};
};
if (!alive _npc || !canmove _npc) exitwith{};
_npc setVariable ["UPSMON_inbuilding", false, false];
if (_retry ) then {
_altura = _altura + 1;
_bldpos = _bld call MON_BldPos; 
if (_altura <= _bldpos) then {
[_npc,_bld,_altura] spawn MON_movetoBuilding;
};
};
};
MON_patrolBuilding = {
private ["_npc","_bld","_bldpos","_timeout","_inbuilding","_patrolto","_time","_i"];
_bldpos = 0;
_timeout = 0;
_i = 1;
_inbuilding = false;
_patrolto = 0;
_time = 0;
_npc = _this select 0;
_bld = _this select 1;
    if ((count _this) > 2) then {
        _bldpos = _this select 2;
    } else {
        _bldpos = _this call MON_BldPos;
    };
if (_i > _bldpos) then {_i = _bldpos};
_patrolto = round ( 10 + random (_bldpos) );
if (_patrolto > _bldpos) then {_patrolto = _bldpos};
if (!(_npc iskindof "Man") || !alive _npc || !canmove _npc) exitwith{};
_inbuilding = _npc getvariable ("UPSMON_inbuilding");
if ( isNil("_inbuilding") ) then {_inbuilding = false;};
if (!_inbuilding) then {
_inbuilding = true;
_npc setVariable ["UPSMON_inbuilding", _inbuilding, false];
[_npc,"Middle"] spawn MON_setUnitPos;
_timeout = time + 60;
while { _i <= _patrolto && alive _npc && canmove _npc} do{
_npc domove (_bld buildingPos _i); 
_time = time + 30;
waitUntil {moveToCompleted _npc or moveToFailed _npc or !alive _npc or _time < time};
if (moveToCompleted _npc) then {
_timeout = time + 60;
_i = _i + 1;
} else {
if (moveToFailed _npc  || !canmove _npc || !alive _npc || _timeout < time) then {
_i = _patrolto + 1;
};
};
sleep 0.05;
};
if (!alive _npc || !canmove _npc) exitwith{};
_npc domove(position leader _npc);
sleep 60; 
_npc setVariable ["UPSMON_inbuilding", false, false];
};
};
MON_CreateMine = {
private ["_npc","_rnd","_soldier","_position"];
_soldier = _this select 0;
 if ((count _this) > 1) then {_position = _this select 1;} else {_position = [0,0];};
_rnd = 0;
_npc = leader _soldier;
if (_soldier == _npc ) then {
_rnd = round (random ( count ((units _npc))));
_soldier = (units _npc) select _rnd;
};
if (!(_soldier iskindof "Man" ) || _soldier == _npc || _soldier!=vehicle _soldier || !alive _soldier || !canmove _soldier) exitwith {false};
if ((count _this) > 1) then {
[_soldier,_position] spawn MON_doCreateMine;
}else{
[_soldier] spawn MON_doCreateMine;
};
true;
};
MON_doCreateMine = {
private ["_soldier","_mine","_dir","_position"];
_position = [0,0];
 
_soldier = _this select 0;
if ((count _this) > 1) then {_position = _this select 1;};
if (!(_soldier iskindof "Man" ) || _soldier!=vehicle _soldier || !alive _soldier || !canmove _soldier) exitwith {false};
_soldier stop false;
[_soldier,"AUTO"] spawn MON_setUnitPos;
if ((count _this) > 1) then {
_soldier domove _position;
waituntil {unitReady _soldier || moveToCompleted _soldier || moveToFailed _soldier || !alive _soldier || !canmove _soldier};
};
if (moveToFailed _soldier || !alive _soldier || _soldier != vehicle _soldier || !canmove _soldier) exitwith {false};
 
_soldier playMovenow "ainvpknlmstpslaywrfldnon_1";
sleep 1;
if (!alive _soldier || !canmove _soldier) exitwith{};
_dir = getdir _soldier;
_position = [position _soldier,_dir, 0.5] call MON_GetPos2D;
_mine = createMine ["MineMine", _position , [], 0];
_soldier playMoveNow "AinvPknlMstpSlayWrflDnon_medic";
sleep 5;
_soldier domove position ( leader _soldier );
};
MON_surrender = {
private ["_npc","_vehicle"];
_npc = _this select 0;
if (!alive _npc || !canmove _npc) exitwith {};
_npc addrating -1000;
_npc setcaptive true;
sleep 0.5;
_vehicle = vehicle _npc;
if ( _npc != _vehicle || !(_npc iskindof "Man" )) then {
_vehicle setcaptive true;
if ( "Air" countType [_vehicle]>0) then {
if (_npc == driver _vehicle ) then { 
[_vehicle] call MON_landHely;
};
} else {
_npc spawn MON_doGetOut;
};
waituntil {_npc == vehicle _npc || !alive _npc};
};
if (!alive _npc || !canmove _npc) exitwith {};
_npc setcaptive true;
_npc stop true;
[_npc,"UP"] call MON_setUnitPos;
removeAllWeapons _npc;
sleep 1;
_npc playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
};
MON_getleader = {
private ["_npc","_members","_leadername","_fightmode"];
_npc = _this select 0;
_members = _this select 1;
sleep 0.05;
if (!alive _npc ) then {
        
        _leadername = _npc getVariable ["SAR_leader_name",""];
        _fightmode = _npc getVariable ["SAR_fightmode",""];
{
if (alive _x && canmove _x && _x == vehicle _x && !isplayer _x) exitwith {
_npc = _x;
};
} foreach _members;
if (!alive _npc ) then {
{
if (alive _x && canmove _x) exitwith {_npc = _x;};
} foreach _members;
};
if (isPlayer _npc || !alive _npc || !canmove _npc ) then 
{
{
if (alive _x && !isPlayer _x) exitwith {_npc = [_npc, _members] call MON_getleader;};
}foreach _members;
};
group _npc selectLeader _npc;
        if(SAR_DEBUG) then {
            
            [_npc] spawn SAR_AI_debug;
        };
    
        _npc setVehicleVarname _leadername;
        _npc setVariable ["SAR_leader_name",_leadername,false];
        _npc setVariable ["SAR_fightmode",_fightmode,false];
        
        
    } else {
    
        
    
    
    };
    _npc 
};
MON_ACE_Watersurvival = {
private ["_lb","_pos","_ejector","_in","_grpid"];
_in =[];
_ejector = _this select 0;
waitUntil { !canmove _ejector || !alive _ejector || isnull (_ejector) || ((getPos vehicle _ejector) select 2 < 1) };
if ( !surfaceIsWater (getpos _ejector) || !canmove _ejector || !alive _ejector || isnull (_ejector) ) exitWith {};
_grpid = _ejector getvariable "UPSMON_grpid";
if (isnil "_grpid") then {_grpid = 0};
_in = [_grpid,_ejector,30] call MON_GetIn_NearestBoat;
if (count _in <= 0) then {
if (!(isNil "ace_main")) then {
_lb = "ACE_Lifeboat_US" createVehicle getposASL _ejector;
}else{
_lb = "Zodiac" createVehicle getposASL _ejector;
};
_pos = getposASL _ejector;
_pos set [0, ((_pos select 0) + 2)];
_pos set [1, ((_pos select 1) + 2)];
_lb setPos _pos;
if !(isPlayer _ejector) then {
[_ejector,_lb,0] call MON_assignasdriver;
};
};
waitUntil { !canmove _ejector || !alive _ejector || isnull (_ejector) || !surfaceIsWater (position _ejector) };
if (KRON_UPS_Debug>0) then {player globalchat format["Exit from boat%1",typeof _lb]};
_ejector spawn MON_dogetout;
};
MON_artillery_dofire = {
    private ["_smoke1","_i","_area","_position","_maxcadence","_mincadence","_sleep","_rounds","_arti","_timeout","_salvo_break","_bullet","_area2"];
    if (!isserver) exitWith {}; 
_area = 150;
_maxcadence = 10;
_mincadence = 5;
_sleep = 0;
_rounds = 5;
_bullet = "ARTY_Sh_81_HE";
_position =[];
_salvo_break = 10;
_arti = _this select 0;
_position  = _this select 1;
if ((count _this) > 2) then {_rounds = _this select 2;};
if ((count _this) > 3) then {_area = _this select 3;};
if ((count _this) > 4) then {_maxcadence = _this select 4;};
if ((count _this) > 5) then {_mincadence = _this select 5;};
if ((count _this) > 6) then {_bullet = _this select 6;};
if ((count _this) > 7) then {_salvo_break = _this select 7;};
_timeout = time + 1000;
_arti setVariable ["timeout", _timeout, false];
_area2 = _area * 2;
if (KRON_UPS_Debug>0) then { player globalchat format["artillery doing fire on %1",_position] };
for [{_i=0}, {_i<_rounds}, {_i=_i+1}] do 
{ 
_arti fire (weapons _arti select 0);
_sleep = random _maxcadence;
if (_sleep < _mincadence) then {_sleep = _mincadence};
sleep _sleep; 
_smoke1 = _bullet createVehicle [(_position select 0)+ random _area2 - _area, (_position select 1)+ random  _area2 - _area, (_position select 2)+ 100];  
_arti setVehicleAmmo 1;
};
_timeout = time + _salvo_break;
_arti setVariable ["timeout", _timeout, false];
};
MON_deadbodies = {
private ["_npc","_bodies","_OCercanos","_distance"];
_npc = _this select 0;
_distance = _this select 1;
_OCercanos = [];
_bodies = [];
_OCercanos = nearestObjects [_npc, ["Man"] , _distance];
{
if (_npc knowsabout _x >0.5 && (!canmove _x || !alive _x)) then { _bodies = _bodies + [_x];};
}foreach _OCercanos;
_bodies;
};
MON_nearestSoldiers = {
private ["_npc","_soldiers","_OCercanos","_distance"];
_npc = _this select 0;
_distance = _this select 1;
if (isnull _npc) exitwith {};
_OCercanos = [];
_soldiers = [];
_OCercanos = nearestObjects [_npc, ["Man"] , _distance];
_OCercanos = _OCercanos - [_npc];
{
if ( alive _x && canmove _x ) then { _soldiers = _soldiers + [_x];};
}foreach _OCercanos;
_soldiers;
};