
R_relPos3D = 
{
private["_p","_d","_a","_x","_y","_z","_xout","_yout"];
_p=_this select 0; 
_x=_p select 0; 
_y=_p select 1; 
_z=_p select 2;
_d=_this select 1; 
_a=_this select 2; 
_xout=_x + sin(_a) * _d; 
_yout=_y + cos(_a) * _d;
[_xout,_yout,_z]
};
R_ThrowSmoke = 
{
private ["_unit","_shell",
"_moves","_unitPos","_pos","_flare","_direction"];
_moves = ["AwopPercMstpSgthWrflDnon_Start1","AwopPknlMstpSgthWrflDnon_Start","AwopPpneMstpSgthWrflDnon_Start"];
_unit = _this select 0;
_shell = ["SmokeShell","SmokeShellGreen","SmokeShellYellow","SmokeShellBlue","SmokeShellRed"] call SAR_fnc_selectRandom;
_unitPos = unitPos _unit; 
switch (_unitPos) do {   
case "Auto":
{
_unit playMove (_moves select 1);
};
case "Up":
{
_unit playMove (_moves select 0);
};
case "Middle":
{
_unit playMove (_moves select 1);
};
case "Down":
{
_unit playMove (_moves select 2);
};
};
sleep 4;
_direction = direction _unit;
_pos = position _unit;
_pos = [(_pos select 0),(_pos select 1),(_pos select 2)+1.5];
_pos = [_pos, 18, _direction] call R_relPos3D;
if (alive _unit && canmove _unit) then {
_flare = _shell createVehicle _pos;
};
};
R_FN_deleteObsoleteWaypoints = 
{
private ["_unit","_grp"];
_unit = _this select 0;
_grp = group _unit;
while {(count (waypoints _grp)) > 1} do
{
deleteWaypoint ((waypoints _grp) select 0);
};
};
R_FN_vehiclesUsedByGroup =
{
private ["_npc","_vehicles"];
_npc = _this select 0;
_vehicles = [];
if (!alive _npc) exitwith {};
{
if (( vehicle _x != _x || !(_x iskindof "Man")) && !((vehicle _x) in _vehicles)) then {
 _vehicles = _vehicles + [vehicle _x];
};
} foreach units _npc;
_vehicles
};
R_FN_unitsInCargo =
{
private ["_vehicle","_unitsInCargo"]; 
_vehicle = _this select 0;
_unitsInCargo = [];
{
if( (assignedVehicleRole _x) select 0 == "Cargo") then
{
_unitsInCargo = _unitsInCargo + [_x];
};
} forEach crew _vehicle;
_unitsInCargo
};
R_FN_allUnitsInCargo =
{
private ["_npc","_vehicles","_unitsInCargo","_allUnitsInCargo"];
_npc = _this select 0;
if (!alive _npc) exitwith {};
_allUnitsInCargo =[];
_vehicles = [_npc] call R_FN_vehiclesUsedByGroup;
{
_unitsInCargo = [_x]  call R_FN_unitsInCargo;
_allUnitsInCargo = _allUnitsInCargo + _unitsInCargo; 
} foreach _vehicles;
_allUnitsInCargo
};
R_SN_GetOutDist = {
private ["_vehicle","_npc","_atdist","_dogetout","_driver","_targetpos","_dist","_vehpos","_vehicles"];
_npc = _this select 0;
_targetpos = _this select 1;
_atdist = _this select 2; 
_dogetout = []; 
_vehicles = []; 
if (!alive _npc) exitwith{};
_vehicle = vehicle _npc;
_vehpos = getpos _vehicle;
_dist = round([_vehpos,_targetpos] call KRON_distancePosSqr); 
if ( _vehicle != _npc || !(_npc iskindof "Man")) then {
if ( (_dist) <= _atdist ) then {
_vehicles = [_npc] call R_FN_vehiclesUsedByGroup; 
{
_dogetout = [_x] call R_FN_unitsInCargo; 
_driver = driver _x;
if ( count _dogetout > 0 ) then { 
nul = [_vehicle,5] spawn MON_doStop;
sleep 0.8; 
{
_x spawn MON_GetOut;
sleep 0.3;
} foreach _dogetout;
                        if (KRON_UPS_Debug>0) then {diag_log format["KRON_UPS_Debug: Crew got out of a vehicle. Vehicle %1: Getoutdist dist=%2 atdist=%3 ",typeof _vehicle,_dist, _atdist]};
                        
                        [_npc,"defend"] spawn SAR_circle;
_x setVariable ["UPSMON_grpid", 0, false];
_x setVariable ["UPSMON_cargo", [], false];
[_npc,_x, _driver] spawn MON_checkleaveVehicle; 
sleep 0.01;
};
} foreach _vehicles;
};
};
};
R_FN_GOTHIT =
{
        private ["_grpId"];
        _grpId = _this select 0;
if ((R_GOTHIT_ARRAY select _grpId) != 0) then {
true;
}else{
false;
};
};
R_SN_EHHIT = 
{
private ["_unit","_shooter","_grpId"];
_unit = _this select 0;
_shooter = _this select 1;
_grpId = _unit getVariable ("UPSMON_grpid");
 
if ((side _unit != side _shooter) && (R_GOTHIT_ARRAY select _grpId) == 0) then
{
R_GOTHIT_ARRAY set [_grpId, 1]; 
};
};
R_SN_EHKILLED = 
{
private ["_unit","_shooter","_grpId"];
_unit = _this select 0;
_shooter = _this select 1;
_grpId = _unit getVariable ("UPSMON_grpid");
if ((side _unit != side _shooter) && (R_GOTHIT_ARRAY select _grpId) == 0) then
{
R_GOTHIT_ARRAY set [_grpId, 2]; 
};
};
private ["_center","_group"];
_center = createCenter sideLogic; _group = createGroup _center;
R_Logic_civkill = _group createUnit ["LOGIC", [2,2,1], [], 0, "NONE"];
_group = nil;
_center = nil;
R_SN_EHKILLEDCIV = 
{
private ["_killer"];
_killer = _this select 1;
if (isPlayer _killer) then {
KILLED_CIV_COUNTER set [0,(KILLED_CIV_COUNTER select 0) + 1];
switch (side _killer) do
{
case west:
{
KILLED_CIV_COUNTER set [1,(KILLED_CIV_COUNTER select 1) + 1];
};
case east:
{
KILLED_CIV_COUNTER set [2,(KILLED_CIV_COUNTER select 2) + 1];
};
case resistance:
{
KILLED_CIV_COUNTER set [3,(KILLED_CIV_COUNTER select 3) + 1];
};
};
KILLED_CIV_COUNTER set [4,_killer];
if (KRON_UPS_Debug > 0) then {player globalchat format["KILLED_CIV_COUNTER: %1",KILLED_CIV_COUNTER]};
if (R_WHO_IS_CIV_KILLER_INFO > 0) then {      
[R_Logic_civkill, nil , rglobalChat, format ["A CIVILIAN WAS KILLED BY %1",_killer]] call RE;
};
};
};
R_SN_EHFIREDNEAR = 
{
private ["_civ"];
_civ = leader (_this select 0);
_civ setspeedmode "FULL";
};
