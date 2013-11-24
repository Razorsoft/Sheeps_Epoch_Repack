
private ["_timeLeft", "_totalSleepTime","_i","_bloodAmount","_sleepCooldown","_sleepTime"];


_totalSleepTime = 45; 

_bloodAmount = 8000; 

_sleepCooldown = 60; 

_sleepTime = time - sleepTimer; 

if(_sleepTime < _sleepCooldown) exitWith { 
	cutText [format["You are not tired yet please wait %1!",(_sleepTime - _sleepCooldown)], "PLAIN DOWN"]; 
};

if (dayz_combat == 1) then { 
    cutText [format["You cannot sleep while in combat!"], "PLAIN DOWN"]; 
} else {
	
	_timeLeft = _totalSleepTime; 

	disableUserInput true; 

	[objNull, player, rSwitchMove,"AidlPpneMstpSnonWnonDnon_SleepA_layDown"] call RE; 

	sleep 3;

	cutText [format["You begin sleeping. %1 seconds left.",_timeLeft], "BLACK OUT"]; 
	_nul = [objNull, player, rSAY, "playerSnoring"] call RE; 

	for "_i" from 0 to _totalSleepTime do { 
		sleep 1;
		_timeLeft = _timeLeft - 1; 
		
		if (_timeLeft > 0) then {
			cutText [format["You are sleeping. %1 seconds left.",_timeLeft], "BLACK FADED"]; 
		} else {cutText [format["You are beginning to wake up!"], "BLACK FADED"];}; 
		
		if (_timeLeft == 40) then {
			[objNull, player, rSwitchMove,"AidlPpneMstpSnonWnonDnon_SleepA_sleep2"] call RE; 
		};
		
		if (_timeLeft == 30) then {
			[objNull, player, rSwitchMove,"AidlPpneMstpSnonWnonDnon_SleepA_sleep1"] call RE; 
			
		};
		
		if (_timeLeft == 20) then {
			[objNull, player, rSwitchMove,"AidlPpneMstpSnonWnonDnon_SleepA_sleep2"] call RE; 
		};
		
		if (_timeLeft == 10) then {
			[objNull, player, rSwitchMove,"AidlPpneMstpSnonWnonDnon_SleepA_sleep3"] call RE; 
		};
		
		if (_timeLeft == 5) then {
			[objNull, player, rSwitchMove,"AidlPpneMstpSnonWnonDnon_SleepA_sleep1"] call RE; 
		};
	};

	if (_timeLeft == 0 || _timeLeft < 0) then { 
		sleep 3;
		cutText [format["You wake up!"], "BLACK IN"]; 
		
		[objNull, player, rSwitchMove,"AidlPpneMstpSnonWnonDnon_SleepA_standUp"] call RE; 

		r_player_blood = r_player_blood + _bloodAmount; 
		
		if(r_player_blood > 12000) then {
			r_player_blood = 12000; 
		};
		
		r_player_lowblood = false;	
		10 fadeSound 1; 
		"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5; 
		"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5; 
		r_player_lowblood = false; 
		player setVariable["USEC_BloodQty",r_player_blood,true]; 

		cutText [format["You are awake and fully rested!"], "PLAIN DOWN"]; 
		disableUserInput false; 
		
		sleepTimer = time; 
	};
};