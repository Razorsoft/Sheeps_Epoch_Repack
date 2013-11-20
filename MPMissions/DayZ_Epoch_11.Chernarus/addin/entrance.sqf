//===================piXel 12-02-2013============
if (isServer) exitwith {};
private ["_building","_entrance","_trg"];
_building = _this select 0;
_entrance = [getPosATL _building select 0,(getPosATL _building select 1)+2,getPosATL _building select 2];

_trg = createTrigger ["emptyDetector", _entrance];
_trg setTriggerArea [1,1,0, false];
_trg setTriggerTimeout [0,0,0, false];
_trg setTriggerActivation ["any", "present", true];
_trg setTriggerStatements ["(isplayer (thisList select 0)) && (local (thisList select 0))",
"cutText ['','black'];
nul = [(thisList select 0),'in']execVM 'addin\teleport.sqf';
cutText ['','black in', 5];",
""];