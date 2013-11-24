
private ["_ai","_entity_array","_humanity","_humanitylimit","_sleeptime","_detectrange","_tracewhat","_player_rating","_clientmachine"];
if (!isServer) exitWith {}; 
_ai = _this select 0;
_tracewhat = "CAManBase";
_detectrange = SAR_DETECT_HOSTILE_FROM_VEHICLE;
_humanitylimit = SAR_HUMANITY_HOSTILE_LIMIT;
_humanity = 0;
_sleeptime = SAR_DETECT_FROM_VEHICLE_INTERVAL;
while {alive _ai} do {
_entity_array = (position _ai) nearEntities [_tracewhat, _detectrange];
{
if(isPlayer _x && {vehicle _x == _x}) then { 
_humanity= _x getVariable ["humanity",0];
_player_rating = rating _x;
If (_humanity < _humanitylimit && {_player_rating > -10000}) then {
if(SAR_EXTREME_DEBUG) then {
diag_log format["SAR EXTREME DEBUG: reducing rating (trace_from_vehicle) for player: %1", _x];
};
adjustrating = [_x,(0 - (10000+_player_rating))];
_clientmachine = owner _x;
_clientmachine publicVariableClient "adjustrating";
_ai reveal [_x,4];
};
};
} forEach _entity_array;
sleep _sleeptime;
};