//===================piXel 12-02-2013============
if (isserver) exitwith {};
private["_carrier","_player","_anim","_anim2","_anim3","_anim4","_sitPosture","_display"];

// bug in animationstate filter
_carrier = _this select 0;
_player = _this select 1;
_anim = animationState (nearestObjects [_carrier, ["man"], 4] select 0);
_anim2 = animationState (nearestObjects [_carrier, ["man"], 4] select 1);
_anim3 = animationState (nearestObjects [_carrier, ["man"], 4] select 2);
_anim4 = animationState (nearestObjects [_carrier, ["man"], 4] select 3);
_sitPosture = "sitUnarm_L_idleLoop_inUH1Y";

if (_anim == _sitPosture || _anim2 == _sitPosture || _anim3 == _sitPosture || _anim4 == _sitPosture) exitWith 
{[nil, _player, "loc", rTITLETEXT, "There is only space for one", "PLAIN DOWN"] call RE;};

if (_carrier iskindOf "Old_bike_TK_CIV_EP1") then 
	{
	_player attachTo [_carrier,[0,-0.6,-0.94]];
	_player setDir 180;
	};

If (typeOf _carrier in ["VolhaLimo_TK_CIV_EP1","Volha_2_TK_CIV_EP1","Volha_1_TK_CIV_EP1","car_sedan","car_hatchback"]) then
	{
	_player attachTo [_carrier,[0,-2,-1.3]];
	_player setDir -90;
	};
	
If (typeOf _carrier in ["Lada2_TK_CIV_EP1","Lada1_TK_CIV_EP1","Skoda","Lada1","Lada2","LadaLM","SkodaRed","SkodaGreen","SkodaBlue"]) then
	{
	_player attachTo [_carrier,[-0.55,-1.6,-1.35]];
	_player setDir -10;
	};
	
If (typeOf _carrier in ["datsun1_civil_3_open","datsun1_civil_1_open","hilux1_civil_3_open_EP1","hilux1_civil_1_open"]) then
	{
	_player attachTo [_carrier,[-0.7,-1.2,-1.25]];
	_player setDir 30;
	};
_player setPos getPos _carrier;
[nil,_player,rSwitchMove, _sitPosture] call RE;
//_player setFaceAnimation 0.5;

backSpace = compile preprocessFile "addin\vehKey.sqf";
disableSerialization;
_display = findDisplay 46;
_display displaySetEventHandler ["KeyDown","_this call backSpace"];

[nil, _player, "loc", rTITLETEXT,"To get off press 'BACKSPACE'", "PLAIN DOWN"] call RE;