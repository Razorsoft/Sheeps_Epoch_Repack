private["_playerPos","_canDrink","_isPond","_isWell","_pondPos","_objectsWell","_objectsPond","_display"];
 
call gear_ui_init;
_playerPos = getPosATL player;
_canDrink = count nearestObjects [_playerPos, ["Land_pumpa","Land_water_tank"], 4] > 0;
_isPond = false;
_isWell = false;
_pondPos = [];
_objectsWell = [];
 
if (!_canDrink) then {
        _objectsWell = nearestObjects [_playerPos, [], 4];
        {
                
                _isWell = ["_well",str(_x),false] call fnc_inString;
                if (_isWell) then {_canDrink = true};
        } forEach _objectsWell;
};
 
if (!_canDrink) then {
        _objectsPond = nearestObjects [_playerPos, [], 50];
        {
                
                _isPond = ["pond",str(_x),false] call fnc_inString;
                if (_isPond) then {
                        _pondPos = (_x worldToModel _playerPos) select 2;
                        if (_pondPos < 0) then {
                                _canDrink = true;
                        };
                };
        } forEach _objectsPond;
};
 
if (_canDrink) then {
 
                if ((floor (random 100) < 25)) then {
               
                        player playActionNow "PutDown";
                        r_player_infected = true;
                        player setVariable["USEC_infected",true,true];
                        player setVariable ["messing",[dayz_hunger,dayz_thirst],true];
 
                        dayz_lastDrink = time;
                        dayz_thirst = 0;
 
                        
                        _display = uiNamespace getVariable 'DAYZ_GUI_display';
                        (_display displayCtrl 1302) ctrlShow true;
                        
                        cutText ["The water is warm and tastes kinda strange, but your thirst is quenched.", "PLAIN DOWN"];
                       
                } else {
                       
                        player playActionNow "PutDown";
                        dayz_lastDrink = time;
                        dayz_thirst = 0;
 
                        
                        _display = uiNamespace getVariable 'DAYZ_GUI_display';
                        (_display displayCtrl 1302) ctrlShow true;
                        
                        cutText ["The water is cool and tastes a bit stale, but your thirst is quenched.", "PLAIN DOWN"];
                };
 
};