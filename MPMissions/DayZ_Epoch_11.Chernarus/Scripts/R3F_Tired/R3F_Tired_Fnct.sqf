

#include "R3F_TIRED_Configuration.cfg"

FNC_PrintToRPT = {
	diag_log text _this;
};

R3F_TIRED_FNCT_Voile_Noir = {
	_level = _this select 0;
	if(_level < R3F_TIRED_SHORTNESS_THRESHOLD ) then{
		playSound "heartbeat_1";
		addCamShake [2, 1, 25];
	};
	
};
R3F_TIRED_FNCT_DoBlackVanish = {
	[player,0.1] call fnc_usec_damageUnconscious;
	[_refObj,"scream",3,false] call dayz_zombieSpeak;
	cutText ["You are overburdened.", "PLAIN DOWN"];
};

