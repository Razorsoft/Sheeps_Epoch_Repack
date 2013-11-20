
private ["_crate", "_crates", "_y", "_id", "_marker", "_mission_info", "_group"];

diag_log format ["DEBUG: Create Mission Code: _this: %1", _this];
_id = _this select 0;
_mission_info = _this select 1;
_text = (_mission_info select 7);
_crates = [];


// Start Mission

[nil,nil,rTitleText, _text, "PLAIN",10] call RE;
MCoords = (_mission_info select 0);
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

// Spawn Crates
_y = -1;
{
	_y = _y + 1;
	//TODO: Add check that loot position is clear of objects i.e vehicles ???
	_crate = createVehicle [(_mission_info select 5) select _y, _x, [], 0, "CAN_COLLIDE"];
	[_crate, (_mission_info select 6) select _y] execVM "\z\addons\dayz_server\missions\misc\fillBoxes.sqf";
	_crate setVariable ["Sarge",1,true];  // Stop Server Cleanup Killing Box
	_crates = _crates + [_crate];
} forEach (_mission_info select 1);


// Spawn SARGE AI
// 		Create Dynamic SARGE MARKER
_marker = createMarker [("SAR_mission_" + str(_id)), (_mission_info select 0)];
_marker setMarkerShape "RECTANGLE";
_marker setMarkeralpha 0;
_marker setMarkerType "Flag";
_marker setMarkerBrush "Solid";
_marker setMarkerSize [200,200];
missionNamespace setVariable ["SAR_mission_" + str(_id), _marker];  
_group = [missionNameSpace getVariable ("SAR_mission_" + str(_id)), 3, _mission_info select 2, _mission_info select 3, (_mission_info select 4) call BIS_fnc_selectRandom ,false] call SAR_AI;

_id2 = _id + 1;
_rNumber = random 10;
if (_rNumber > 3) then {
	_marker2 = createMarker [("SAR_mission_" + str(_id2)), (_mission_info select 0)];
	_marker2 setMarkerShape "RECTANGLE";
	_marker2 setMarkeralpha 0;
	_marker2 setMarkerType "Flag";
	_marker2 setMarkerBrush "Solid";
	_marker2 setMarkerSize [650,650];
	missionNamespace setVariable ["SAR_mission_" + str(_id2), _marker];
	_group2 = [missionNameSpace getVariable ("SAR_mission_" + str(_id2)), 3,false] call SAR_AI_heli;
} else {
	_marker2 = createMarker [("SAR_mission_" + str(_id2)), (_mission_info select 0)];
	_marker2 setMarkerShape "RECTANGLE";
	_marker2 setMarkeralpha 0;
	_marker2 setMarkerType "Flag";
	_marker2 setMarkerBrush "Solid";
	_marker2 setMarkerSize [80,80];
	missionNamespace setVariable ["SAR_mission_" + str(_id2), _marker];
	_group2 = [missionNameSpace getVariable ("SAR_mission_" + str(_id2)), 3, 1, 3, (_mission_info select 4) call BIS_fnc_selectRandom ,false] call SAR_AI;
};
		
// Wait till all AI Dead or Mission Times Out
_timeout = time + 1800;
waitUntil{
	sleep 30;
	if (count units _group == 0) exitWith {true};
	if (time > _timeout) exitWith {true};
	false
};

// Send Message to Players about mission completed / failed
if (count units _group == 0) then {
	_text = (_mission_info select 8);
	diag_log ("DEBUG: Mission Code: AI DEAD");
} else {
	_text = (_mission_info select 9);
	diag_log ("DEBUG: Mission Code: Mission Timed Out");
};

// Remove Map Marker
[nil,nil,rTitleText, _text, "PLAIN",10] call RE;
[] execVM "debug\remmarkers75.sqf";
MCoords = 0;
publicVariable "MCoords";

// Wait till no Players within 200 metres && Mission Timeout Check for Crates
_isNear = true;
_timeout = time + 600;
_timeout2 = _timeout + 900;
while {_isNear} do
{
	sleep 30;
	_isNear = [(_mission_info select 0), 200] call mission_check;
	if ((!_isNear) && (time > _timeout)) then {
		_isNear = false;
	};
	if (time > _timeout2) then {
		_isNear = false;
	};
};

// Remove Crates
{
	//_x setVariable ["Sarge",nil];
	//_x setDammage 1;
	deleteVehicle _x;
} forEach _crates;
// Temp Kill All AI
{
	_x setDamage 1;
} forEach units _group;
{
	_x setDamage 1;
} forEach units _group2;

[[("SAR_mission_" + str(_id)), _group],[("SAR_mission_" + str(_id2)), _group2]]