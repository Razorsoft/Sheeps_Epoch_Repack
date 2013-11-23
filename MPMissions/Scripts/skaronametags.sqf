private ["_maxRange","_humanitycheck","_humanity","_skaroTag","_cursorTarget","_bandit","_hero","_color","_string","_targetControl"];

Waituntil{!isNull player};

_maxRange = 5; 
_humanitycheck = true; 
_bandit = -5000; 
_hero = 5000; 



_humanity = 2500; 
_targetControl = _display displayCtrl 1199;
_string = "";
dayz_humanitytarget = "";

while {true} do {
	_humanityTarget = cursorTarget;
	if (!isNull _humanityTarget and isPlayer _humanityTarget and alive _humanityTarget) then {
			_distance = (player distance _humanityTarget);
		if (_distance < _maxRange) then {
			_size = (1-(floor(_distance/5)*0.1)) max 0.1;
			_humanity = _humanityTarget getVariable ["humanity",0];
			if (_humanitycheck) then {
				_color = "color='#ffffff'";
				if(_humanity < _bandit) then {
					_color = "color='#ff0000'";
				} else {
					if(_humanity > _hero) then {
						_color = "color='#3333ff'";
					};
				};
			} else {
			_color = "color='#ffffff'";
			};
			_string = format["<t %2 align='center' size='%3'>%1</t>",(name _humanityTarget),_color,_size];
		};
	};

	
	if (dayz_humanitytarget != _string) then {
			_targetControl ctrlSetStructuredText (parseText _string);
			dayz_humanitytarget = _string;
	};

sleep 0.5;
};


