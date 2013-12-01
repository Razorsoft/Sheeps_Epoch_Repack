//===================piXel 12-02-2013============
private ["_dogHouse","_dogSound","_trg"];

_dogHouse = _this select 0;
if (!isserver) exitwith {};

_trg = createTrigger ["emptyDetector", getPosATL _dogHouse];
_trg setTriggerArea [2,2,0, false];
_trg setTriggerTimeout [0,0,0, false];
_trg setTriggerActivation ["any", "present", true];
_trg setTriggerStatements ["isplayer (thisList select 0)",
"nul = [(thisList select 0)] execVM 'addin\dog.sqf'",
""];