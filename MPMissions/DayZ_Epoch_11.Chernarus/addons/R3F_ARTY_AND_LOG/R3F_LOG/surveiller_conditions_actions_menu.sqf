
private ["_objet_pointe"];

while {true} do
{
	R3F_LOG_objet_addAction = objNull;
	
	_objet_pointe = cursorTarget;
	
	if !(isNull _objet_pointe) then
	{
		if (player distance _objet_pointe < 13) then
		{
			R3F_LOG_objet_addAction = _objet_pointe;
			
			

			Object_canLock = !(_objet_pointe getVariable ['objectLocked', false]);
			
			
			if ({_objet_pointe isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
			{
				
				R3F_LOG_action_deplacer_objet_valide = (vehicle player == player && (count crew _objet_pointe == 0) && (isNull R3F_LOG_joueur_deplace_objet) &&
					(isNull (_objet_pointe getVariable "R3F_LOG_est_deplace_par") || (!alive (_objet_pointe getVariable "R3F_LOG_est_deplace_par"))) &&
					isNull (_objet_pointe getVariable "R3F_LOG_est_transporte_par") && !(_objet_pointe getVariable "R3F_LOG_disabled"));
			};
			
			
			if ({_objet_pointe isKindOf _x} count R3F_LOG_CFG_objets_remorquables > 0) then
			{
				
				if ({_objet_pointe isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
				{
					
					R3F_LOG_action_remorquer_deplace_valide = (vehicle player == player && (alive R3F_LOG_joueur_deplace_objet) &&
						(count crew _objet_pointe == 0) && (R3F_LOG_joueur_deplace_objet == _objet_pointe) &&
						({_x != _objet_pointe && alive _x && isNull (_x getVariable "R3F_LOG_remorque") && ([0,0,0] distance velocity _x < 6) && (getPos _x select 2 < 2) && !(_x getVariable "R3F_LOG_disabled")} count (nearestObjects [_objet_pointe, R3F_LOG_CFG_remorqueurs, 18])) > 0 &&
						!(_objet_pointe getVariable "R3F_LOG_disabled"));
				};
				
				
				R3F_LOG_action_selectionner_objet_remorque_valide = (vehicle player == player && (alive _objet_pointe) && (count crew _objet_pointe == 0) &&
					isNull R3F_LOG_joueur_deplace_objet && isNull (_objet_pointe getVariable "R3F_LOG_est_transporte_par") &&
					(isNull (_objet_pointe getVariable "R3F_LOG_est_deplace_par") || (!alive (_objet_pointe getVariable "R3F_LOG_est_deplace_par"))) &&
					!(_objet_pointe getVariable "R3F_LOG_disabled"));
				
				
				R3F_LOG_action_detacher_valide = (vehicle player == player && (isNull R3F_LOG_joueur_deplace_objet) &&
					!isNull (_objet_pointe getVariable "R3F_LOG_est_transporte_par") && !(_objet_pointe getVariable "R3F_LOG_disabled"));
			};
			
			
			if ({_objet_pointe isKindOf _x} count R3F_LOG_classes_objets_transportables > 0) then
			{
				
				if ({_objet_pointe isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
				{
					
					R3F_LOG_action_charger_deplace_valide = (vehicle player == player && (count crew _objet_pointe == 0) && (R3F_LOG_joueur_deplace_objet == _objet_pointe) &&
						{_x != _objet_pointe && alive _x && ([0,0,0] distance velocity _x < 6) && (getPos _x select 2 < 2) &&
						!(_x getVariable "R3F_LOG_disabled")} count (nearestObjects [_objet_pointe, R3F_LOG_classes_transporteurs, 18]) > 0 &&
						!(_objet_pointe getVariable "R3F_LOG_disabled"));
				};
				
				
				R3F_LOG_action_selectionner_objet_charge_valide = (vehicle player == player && (count crew _objet_pointe == 0) &&
					isNull R3F_LOG_joueur_deplace_objet && isNull (_objet_pointe getVariable "R3F_LOG_est_transporte_par") &&
					(isNull (_objet_pointe getVariable "R3F_LOG_est_deplace_par") || (!alive (_objet_pointe getVariable "R3F_LOG_est_deplace_par"))) &&
					!(_objet_pointe getVariable "R3F_LOG_disabled"));
			};
			
			
			if ({_objet_pointe isKindOf _x} count R3F_LOG_CFG_remorqueurs > 0) then
			{
				
				R3F_LOG_action_remorquer_deplace_valide = (vehicle player == player && (alive _objet_pointe) && (!isNull R3F_LOG_joueur_deplace_objet) &&
					(alive R3F_LOG_joueur_deplace_objet) && !(R3F_LOG_joueur_deplace_objet getVariable "R3F_LOG_disabled") &&
					({R3F_LOG_joueur_deplace_objet isKindOf _x} count R3F_LOG_CFG_objets_remorquables > 0) &&
					isNull (_objet_pointe getVariable "R3F_LOG_remorque") && ([0,0,0] distance velocity _objet_pointe < 6) &&
					(getPos _objet_pointe select 2 < 2) && !(_objet_pointe getVariable "R3F_LOG_disabled"));
				
				
				R3F_LOG_action_remorquer_selection_valide = (vehicle player == player && (alive _objet_pointe) && (isNull R3F_LOG_joueur_deplace_objet) &&
					(!isNull R3F_LOG_objet_selectionne) && (R3F_LOG_objet_selectionne != _objet_pointe) &&
					!(R3F_LOG_objet_selectionne getVariable "R3F_LOG_disabled") &&
					({R3F_LOG_objet_selectionne isKindOf _x} count R3F_LOG_CFG_objets_remorquables > 0) &&
					isNull (_objet_pointe getVariable "R3F_LOG_remorque") && ([0,0,0] distance velocity _objet_pointe < 6) &&
					(getPos _objet_pointe select 2 < 2) && !(_objet_pointe getVariable "R3F_LOG_disabled"));
			};
			
			
			if ({_objet_pointe isKindOf _x} count R3F_LOG_classes_transporteurs > 0) then
			{
				
				R3F_LOG_action_charger_deplace_valide = (alive _objet_pointe && (vehicle player == player) && (!isNull R3F_LOG_joueur_deplace_objet) &&
					!(R3F_LOG_joueur_deplace_objet getVariable "R3F_LOG_disabled") &&
					({R3F_LOG_joueur_deplace_objet isKindOf _x} count R3F_LOG_classes_objets_transportables > 0) &&
					([0,0,0] distance velocity _objet_pointe < 6) && (getPos _objet_pointe select 2 < 2) && !(_objet_pointe getVariable "R3F_LOG_disabled"));
				
				
				R3F_LOG_action_charger_selection_valide = (alive _objet_pointe && (vehicle player == player) && (isNull R3F_LOG_joueur_deplace_objet) &&
					(!isNull R3F_LOG_objet_selectionne) && (R3F_LOG_objet_selectionne != _objet_pointe) &&
					!(R3F_LOG_objet_selectionne getVariable "R3F_LOG_disabled") &&
					({R3F_LOG_objet_selectionne isKindOf _x} count R3F_LOG_classes_objets_transportables > 0) &&
					([0,0,0] distance velocity _objet_pointe < 6) && (getPos _objet_pointe select 2 < 2) && !(_objet_pointe getVariable "R3F_LOG_disabled"));
				
				
				R3F_LOG_action_contenu_vehicule_valide = (alive _objet_pointe && (vehicle player == player) && (isNull R3F_LOG_joueur_deplace_objet) &&
					([0,0,0] distance velocity _objet_pointe < 6) && (getPos _objet_pointe select 2 < 2) && !(_objet_pointe getVariable "R3F_LOG_disabled"));
			};
		};
	};
	
	
	
	if ({(vehicle player) isKindOf _x} count R3F_LOG_CFG_heliporteurs > 0) then
	{
		R3F_LOG_objet_addAction = vehicle player;
		
		
		R3F_LOG_action_charger_deplace_valide = false;
		R3F_LOG_action_charger_selection_valide = false;
		R3F_LOG_action_contenu_vehicule_valide = false;
		R3F_LOG_action_remorquer_deplace_valide = false;
		R3F_LOG_action_remorquer_selection_valide = false;
		
		
		R3F_LOG_action_heliporter_valide = (driver R3F_LOG_objet_addAction == player &&
			({_x != R3F_LOG_objet_addAction && !(_x getVariable "R3F_LOG_disabled")} count (nearestObjects [R3F_LOG_objet_addAction, R3F_LOG_CFG_objets_heliportables, 15]) > 0) &&
			isNull (R3F_LOG_objet_addAction getVariable "R3F_LOG_heliporte") && ([0,0,0] distance velocity R3F_LOG_objet_addAction < 6) && (getPos R3F_LOG_objet_addAction select 2 > 1) &&
			!(R3F_LOG_objet_addAction getVariable "R3F_LOG_disabled"));
		
		
		R3F_LOG_action_heliport_larguer_valide = (driver R3F_LOG_objet_addAction == player && !isNull (R3F_LOG_objet_addAction getVariable "R3F_LOG_heliporte") &&
			([0,0,0] distance velocity R3F_LOG_objet_addAction < 15) && (getPos R3F_LOG_objet_addAction select 2 < 40) && !(R3F_LOG_objet_addAction getVariable "R3F_LOG_disabled"));
	};
	
	sleep 0.3;
};