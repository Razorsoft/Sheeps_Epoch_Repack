private ["_template","_position","_params","_copies","_membertypes","_unittype","_side","_UCthis","_initstr","_grp","_lead","_newunit","_i","_newpos","_initlstr","_e","_rnd","_c","_members","_vehicletypes","_spawned"];
if (!isserver) exitWith {}; 
waitUntil {!isNil("KRON_UPS_INIT")};
waitUntil {KRON_UPS_INIT==1};
_template  = _this select 0;
_position = _this select 1;
_copies = _this select 2;
_params = _this select 3;
_membertypes = [];
_side = "";
_UCthis = [];
_initstr = "";
_initlstr = "";
_grp = grpnull;
_lead = objnull;
_newunit = objnull;
_newpos=[];
for [{_i=0},{_i<count _params},{_i=_i+1}] do {_e=_params select _i; if (typeName _e=="STRING") then {_e=toUpper(_e)};_UCthis set [_i,_e]};
_initstr = ["INIT:","",_UCthis] call KRON_UPSgetArg;
_initlstr = ["INITL:","",_UCthis] call KRON_UPSgetArg;
_initlstr = _initlstr + _initstr;
_spawned= if ("SPAWNED" in _UCthis) then {true} else {false};
if (!_spawned) then {_UCthis = _UCthis + ["SPAWNED"]};
if (KRON_UPS_Debug>0) then {player globalchat format["Spawning %3 copies of template %1",_template,_position,_copies,count KRON_UPS_TEMPLATES]};
{
if ((_x select 0) == _template) then {
_side = _x select 1;
_membertypes = _x select 2;
_vehicletypes = _x select 3;
_unittype= _membertypes select 0;
for [{_i=1},{_i<=_copies},{_i=_i+1}] do {
if ((_unittype=="Civilian") && (count _members==1)) then {_rnd=1+round(random 20); if (_rnd>1) then {_unittype=format["Civilian%1",_rnd]}};
_grp=createGroup _side;
_lead = _grp createUnit [_unittype, _position, [], 0, "form"];
_lead setVehicleInit _initlstr;
[_lead] join _grp;
_grp selectLeader _lead;
sleep 1;
_c=0;
{
_c=_c+1;
if (_c>1) then {
_newpos = _position findEmptyPosition [10, 200];
sleep .4;
if (count _newpos <= 0) then {_newpos = _position};
_newunit = _grp createUnit [_x, _newpos, [],0,"form"];
_newunit setVehicleInit _initstr;
[_newunit] join _grp;
};
} foreach _membertypes;
{
_newpos = _position findEmptyPosition [10, 200];
sleep .4;
if (count _newpos <= 0) then {_newpos = _position};
_newunit = _x createvehicle (_newpos);
} foreach _vehicletypes;
_params = [_lead] + _UCthis;
_params SPAWN UPSMON;
processInitCommands;
};
};
}foreach KRON_UPS_TEMPLATES;
if (true) exitwith{};
