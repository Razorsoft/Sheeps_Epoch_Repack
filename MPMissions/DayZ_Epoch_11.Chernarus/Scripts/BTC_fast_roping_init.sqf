#include "BTC_functions.sqf"
BTC_fast_rope_h = 21; 
BTC_AI_fast_rope_on_deploy = 1; 
BTC_roping_chopper = ["MH60S","UH60M_EP1","UH60M_EP1","UH1H_DZ","Mi17_DZ","AH6X_DZ","MH6J_DZ","AH6J_EP1"]; 
{
    _rope = _x addaction ["Deploy rope","Scripts\BTC_addAction.sqf",[[],BTC_deploy_rope],7,true,false,"","player == driver _target && format [""%1"",_target getVariable ""BTC_rope""] != ""1"" && ((getPos _target) select 2) < BTC_fast_rope_h && speed _target < 2"]; 
    _rope = _x addaction ["Cut rope","Scripts\BTC_addAction.sqf",[[],BTC_cut_rope],7,true,false,"","player == driver _target && format [""%1"",_target getVariable ""BTC_rope""] == ""1"""]; 
    _out  = _x addaction ["Fast rope","Scripts\BTC_addAction.sqf",[[player],BTC_fast_rope],7,true,false,"","player in (assignedCargo _target) && format [""%1"",_target getVariable ""BTC_rope""] == ""1"""]; 
} foreach (nearestObjects [[3000,3000,0], BTC_roping_chopper, 50000]); 