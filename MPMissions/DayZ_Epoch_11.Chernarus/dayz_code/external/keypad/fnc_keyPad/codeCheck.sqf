private ["_object","_location","_dir","_worldspace","_objectID","_objectUID","_classname","_codeinput","_convertInput","_i","_stringInput","_numberInput","_fuel"];
_object = cursortarget; 
_location = getposATL _object; 
_dir = getDir _object; 
_worldspace = [_dir,_location]; 
_objectID = _object getVariable["ObjectID","0"]; 
_objectUID = _object getVariable["ObjectUID","0"]; 
_classname = _object getVariable["Classname","0"]; 
//_objectUID = _worldspace call dayz_objectUID2;; 
_codeinput = _this select 0; 
sleep 3; 
_convertInput =+ _codeinput; 
for "_i" from 0 to (count _convertInput - 1) do {_convertInput set [_i, (_convertInput select _i) + 48]}; 
_numberInput = parseNumber (toString _convertInput); 


	if ( _numberInput > 1000 && _numberInput < 10000) then { 
	dayzDeleteObj = [_objectID,_objectUID]; 
	publicVariableServer "dayzDeleteObj";
	if (isServer) then {
		dayzDeleteObj call server_deleteObj; 
		};
	sleep 3; 
	_fuel = _numberInput / 1000; 
	_object setVariable ["Code",_numberInput,true]; 
	_object setVariable ["characterID",dayz_playerUID,true]; 
	dayzPublishObj = [dayz_playerUID,_object,[_dir,_location],_classname,_fuel,_numberInput]; 
	publicVariableServer "dayzPublishObj";
	if (isServer) then {
		dayzPublishObj call server_publishObj; 
	};
	_object setVariable ["Code",_numberInput,true]; 
	cutText [format["You have successfully changed your code to: %1",(toString _convertInput)], "PLAIN DOWN",1]; 
	playsound "beep"; 
	sleep 0.5;
	playsound "beep";
	sleep 0.5;
	playsound "beep";
	} 
	else { cutText ["Failed to change your code, please use exact 4 numbers!", "PLAIN DOWN"];breakOut "exit"; 
	_codeinput = []; 
	};
	
	_codeinput = []; 