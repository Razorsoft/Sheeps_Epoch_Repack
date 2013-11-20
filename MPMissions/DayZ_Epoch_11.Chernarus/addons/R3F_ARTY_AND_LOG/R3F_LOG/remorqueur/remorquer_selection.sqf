

if (R3F_LOG_mutex_local_verrou) then
{
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
}
else
{
	R3F_LOG_mutex_local_verrou = true;
	
	private ["_objet", "_remorqueur"];
	
	_objet = R3F_LOG_objet_selectionne;
	_remorqueur = _this select 0;
	
	if (!(isNull _objet) && (alive _objet) && !(_objet getVariable "R3F_LOG_disabled")) then
	{
		if (isNull (_objet getVariable "R3F_LOG_est_transporte_par") && (isNull (_objet getVariable "R3F_LOG_est_deplace_par") || (!alive (_objet getVariable "R3F_LOG_est_deplace_par")))) then
		{
			if (_objet distance _remorqueur <= 30) then
			{
             	
                _tempobj = _remorqueur;		_countTransportedBy = 1;
				while{!isNull(_tempobj getVariable["R3F_LOG_est_transporte_par", objNull])} do {_countTransportedBy = _countTransportedBy + 1; _tempobj = _tempobj getVariable["R3F_LOG_est_transporte_par", objNull];};
				
                
				_tempobj = _objet;		_countTowedVehicles = 1;
				while{!isNull(_tempobj getVariable["R3F_LOG_remorque", objNull])} do {_countTowedVehicles = _countTowedVehicles + 1; _tempobj = _tempobj getVariable["R3F_LOG_remorque", objNull];};
                
                if(_countTransportedBy + _countTowedVehicles <= 2) then
                {
                	
					_remorqueur setVariable ["R3F_LOG_remorque", _objet, true];
					
					_objet setVariable ["R3F_LOG_est_transporte_par", _remorqueur, true];
					
					
					player attachTo [_remorqueur, [
						(boundingBox _remorqueur select 1 select 0),
						(boundingBox _remorqueur select 0 select 1) + 1,
						(boundingBox _remorqueur select 0 select 2) - (boundingBox player select 0 select 2)
					]];
					
					player setDir 270;
					player setPos (getPos player);
					
					player playMove "AinvPknlMstpSlayWrflDnon_medic";
					sleep 2;
					
					
					_objet attachTo [_remorqueur, [
						0,
						(boundingBox _remorqueur select 0 select 1) + (boundingBox _objet select 0 select 1) + 3,
						(boundingBox _remorqueur select 0 select 2) - (boundingBox _objet select 0 select 2)
					]];
					
					R3F_LOG_objet_selectionne = objNull;
					
					detach player;
					
					
					if (_objet isKindOf "StaticWeapon") then
					{
						private ["_azimut_canon"];
						
						_azimut_canon = ((_objet weaponDirection (weapons _objet select 0)) select 0) atan2 ((_objet weaponDirection (weapons _objet select 0)) select 1);
						
						
						if !(_objet isKindOf "D30_Base") then
						{
							_azimut_canon = _azimut_canon + 180;
						};
						
						
						R3F_ARTY_AND_LOG_PUBVAR_setDir = [_objet, (getDir _objet)-_azimut_canon];
						if (isServer) then
						{
							["R3F_ARTY_AND_LOG_PUBVAR_setDir", R3F_ARTY_AND_LOG_PUBVAR_setDir] spawn R3F_ARTY_AND_LOG_FNCT_PUBVAR_setDir;
						}
						else
						{
							publicVariable "R3F_ARTY_AND_LOG_PUBVAR_setDir";
						};
					};
					
					sleep 5;    
                } else {
                	player globalChat "You can't tow more than one vehicle.";    
                };
			}
			else
			{
				player globalChat format [STR_R3F_LOG_action_remorquer_selection_trop_loin, getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];
			};
		}
		else
		{
			player globalChat format [STR_R3F_LOG_action_remorquer_selection_objet_transporte, getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];
		};
	};
	
	R3F_LOG_mutex_local_verrou = false;
};