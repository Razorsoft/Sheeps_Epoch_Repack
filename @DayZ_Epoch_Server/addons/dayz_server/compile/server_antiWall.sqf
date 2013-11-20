/*
	DayZ Epoch anti wall
	Made for DayZ Epoch please ask permission to use/edit/distrubute email vbawol@veteranbastards.com.
*/

private ["_vehicle","_player","_intersects","_vehiclePos","_position","_playerPos"];

// Vehicle 
_vehicle = _this select 0;
_vehiclePos = getPosASL _vehicle;

// Player
_position = _this select 1;

// Player
_player = _this select 2;
_vector = vectorDir _player;
_playerPos = getPosASL _player;
_playerPos = [(_playerPos select 0)+(_vector select 0),_playerPos select 1+(_vector select 1),_playerPos select 2];

// check if intersects anything
_intersects = lineIntersects [_playerPos, _vehiclePos, _player, _vehicle];

diag_log format["Player Wall glitched %1 Result: %2 - player: %3 vehicle:%4", _player,_intersects,_playerPos,_vehiclePos];



if (_intersects) then {

	// move player back to vehicle pos
	_player setPosASL _vehiclePos;

	// put player back in vehicle -- needs to be ran client side
	/* 
	switch(true)do{ 
		case (_position == "driver"): { 
			_player moveInDriver _vehicle;
		}; 
		case (_position == "gunner"): { 
			_player moveInGunner _vehicle;
		}; 
		case (_position == "commander"): { 
			_player moveInCommander _vehicle;
		}; 
		case (_position == "cargo"): { 
			_player moveInCargo _vehicle;
		}; 
	};
	*/
};