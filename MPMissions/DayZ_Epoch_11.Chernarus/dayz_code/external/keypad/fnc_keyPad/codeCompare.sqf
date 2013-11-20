private ["_isPanel","_validObject","_validObjectCode","_panelPos","_playerPos","_cnt","_gateAccess","_inVehicle","_soundSource","_panel","_convertInput","_code", "_inputCode", "_validMatch", "_stringinput","_numberinputr","_coder"];
_panel = cursortarget;
_gateAccess = false;
_playerPos = getpos player;
_panelPos = getpos _panel;
_cnt = 600;
_validMatch = false;
_validObjectCode = false;
keyCode = _this select 0;

sleep 3;
_code = keyCode;
_inputCode = _this select 1;

_convertInput =+ _inputCode;
for "_i" from 0 to (count _convertInput - 1) do {_convertInput set [_i, (_convertInput select _i) + 48]};

_numberinput = parseNumber((tostring _convertInput));


	if (typeOf(_panel) == "Infostand_2_EP1") then {
	_validMatch = [_code, _numberinput] call BIS_fnc_areEqual;
	} else {
	_validObjectCode = [_code, _numberinput] call BIS_fnc_areEqual;
	};
	

/* <- Remove this line to get it working, also put in your UIDs at PLAYERUID, don't forget to delete the last line also

if ((getPlayerUID player) in ["PLAYERUID1","PLAYERUID2"]) then { 
        if (typeOf(_panel) == "Infostand_2_EP1") then {
            _validMatch = true;
        } else {
            _validObjectCode = true;
        };
    };
*/ 



if (_validMatch) then {
	cutText ["### ACCESS GRANTED ###", "PLAIN DOWN"];

	playsound "beep";
	sleep 0.5;
	playsound "beep";
	sleep 0.5;
	playsound "beep";
	keyValid = true;
	_gateAccess = true;
	sleep 2;
	cutText ["You can now operate the bases gate panel(s) for 60 seconds", "PLAIN DOWN"];
	while {_gateAccess} do 
	{
	_playerPos = getpos player;
	_panelPos = getpos _panel;
	
		if (_playerPos distance _panelPos > 10) then {
		_gateAccess = false;
		keyValid = false;
		cutText ["Lost connection to panel > 10 meters away", "PLAIN DOWN"];
		};
	_cnt = _cnt - 1;
	if (_cnt <= 600 && _cnt % 10 == 0) then {
		cutText [format["Access to panel expires in %1 seconds",(_cnt / 10)], "PLAIN DOWN",1];
	};	
		if (_cnt <= 0) then {
		_gateAccess = false;
		keyValid = false;
		cutText ["You no longer have gate access, type code in again to have access", "PLAIN DOWN"];
		};
	sleep .1;
	};
	keyValid = false;
} else {

if (!_validObjectCode) then {
	removeObject = false;
	cutText ["!!! ACCESS DENIED !!!", "PLAIN DOWN"];

	playsound "beep";

	sleep 2;
	cutText ["Wrong code was entered", "PLAIN DOWN"];
	} else {
	removeObject = true;
	
	_panel setVariable ["validObject", true];
	cutText ["### ACCESS GRANTED ###\n You can now delete object", "PLAIN DOWN"];
	playsound "beep";
	sleep 0.5;
	playsound "beep";
	sleep 0.5;
	playsound "beep";
	_gateAccess = true;
		while {_gateAccess} do 
		{
			_playerPos = getpos player;
			_panelPos = getpos _panel;
			
			if (_playerPos distance _panelPos > 5) then {
				_gateAccess = false;
				cutText ["Object access lost, player > 5 meters away", "PLAIN DOWN"];
			};
			_cnt = _cnt - 1;
			if (_cnt <= 600 && _cnt % 10 == 0) then {
				cutText [format["Access to object expires in %1 seconds",(_cnt / 10)], "PLAIN DOWN",1];
			};	
			if (_cnt <= 0) then {
				_gateAccess = false;
			cutText ["You no longer have object access, type code in again to have access", "PLAIN DOWN"];
			};
		sleep .1;
		};
		removeObject = false;
	};
};

CODEINPUT = [];
