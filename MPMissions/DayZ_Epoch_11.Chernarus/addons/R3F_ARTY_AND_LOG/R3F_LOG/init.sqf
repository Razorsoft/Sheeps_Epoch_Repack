
#include "config.sqf"
if (isServer) then
{
R3F_LOG_PUBVAR_point_attache = "HeliHEmpty" createVehicle [0, 0, 0];
publicVariable "R3F_LOG_PUBVAR_point_attache";
};
if !(isServer && isDedicated) then
{
waitUntil {!isNil "R3F_LOG_PUBVAR_point_attache"};
R3F_LOG_joueur_deplace_objet = objNull;
R3F_LOG_mutex_local_verrou = false;
R3F_LOG_objet_selectionne = objNull;
R3F_LOG_classes_transporteurs = [];
{
R3F_LOG_classes_transporteurs = R3F_LOG_classes_transporteurs + [_x select 0];
} forEach R3F_LOG_CFG_transporteurs;
R3F_LOG_classes_objets_transportables = [];
{
R3F_LOG_classes_objets_transportables = R3F_LOG_classes_objets_transportables + [_x select 0];
} forEach R3F_LOG_CFG_objets_transportables;
R3F_LOG_FNCT_objet_init = compile preprocessFile "addons\R3F_ARTY_AND_LOG\R3F_LOG\objet_init.sqf";
R3F_LOG_FNCT_heliporteur_init = compile preprocessFile "addons\R3F_ARTY_AND_LOG\R3F_LOG\heliporteur\heliporteur_init.sqf";
R3F_LOG_FNCT_remorqueur_init = compile preprocessFile "addons\R3F_ARTY_AND_LOG\R3F_LOG\remorqueur\remorqueur_init.sqf";
R3F_LOG_FNCT_transporteur_init = compile preprocessFile "addons\R3F_ARTY_AND_LOG\R3F_LOG\transporteur\transporteur_init.sqf";
R3F_LOG_objet_addAction = objNull;
R3F_LOG_action_charger_deplace_valide = true;
R3F_LOG_action_charger_selection_valide = true;
R3F_LOG_action_contenu_vehicule_valide = true;
R3F_LOG_action_remorquer_deplace_valide = false;
R3F_LOG_action_remorquer_selection_valide = false;
R3F_LOG_action_heliporter_valide = false;
R3F_LOG_action_heliport_larguer_valide = false;
R3F_LOG_action_deplacer_objet_valide = true;
R3F_LOG_action_remorquer_deplace_valide = false;
R3F_LOG_action_selectionner_objet_remorque_valide = false;
R3F_LOG_action_detacher_valide = false;
R3F_LOG_action_charger_deplace_valide = false;
R3F_LOG_action_selectionner_objet_charge_valide = true;
execVM "addons\R3F_ARTY_AND_LOG\R3F_LOG\surveiller_conditions_actions_menu.sqf";
};