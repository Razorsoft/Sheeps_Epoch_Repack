
private ["_currDirection", "_targetDirection", "_rotateAmount"];

_rotateAmount = _this select 3;
_targetDirection = "";

if (R3F_LOG_mutex_local_verrou) then {
	player globalChat STR_R3F_LOG_mutex_action_en_cours; 
} else {
	_targetDirection = (getDir R3F_LOG_joueur_deplace_objet) + _rotateAmount; 
	_targetDirection = _targetDirection - getDir player;

	R3F_LOG_joueur_deplace_objet setDir _targetDirection;
	R3F_ARTY_AND_LOG_PUBVAR_setDir = [R3F_LOG_joueur_deplace_objet, _targetDirection];
	publicVariable "R3F_ARTY_AND_LOG_PUBVAR_setDir";
	R3F_LOG_mutex_local_verrou = false;
};





