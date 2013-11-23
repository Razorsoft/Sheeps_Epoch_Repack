
if (R3F_LOG_mutex_local_verrou) then
{
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
}
else
{
	_doReleaseHorizontally = _this select 3;

	R3F_LOG_mutex_local_verrou = true;
	
	if (_doReleaseHorizontally) then {
		R3F_LOG_force_horizontally = true; 
	};

	R3F_LOG_joueur_deplace_objet = objNull;
	sleep 0.1;
	
	R3F_LOG_mutex_local_verrou = false;
};