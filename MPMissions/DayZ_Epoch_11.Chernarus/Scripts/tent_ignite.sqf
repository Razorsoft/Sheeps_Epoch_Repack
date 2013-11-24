
    private["_ent"];
    
        _ent = _this select 3; 
        _countDownTimer = 60; 
        _timeLeft = _countDownTimer; 
        canAbort = true;
    
 
    player removeAction s_player_igniteTent;
    s_player_igniteTent = -1;
 
    player playActionNow "Medic";
    sleep 7;
 
    _objectID = _ent getVariable["ObjectID","0"];
    _objectUID = _ent getVariable["ObjectUID","0"];
 
    PVDZ_obj_Fire = [_ent,2,time,false,true];
    publicVariable "PVDZ_obj_Fire";
    _id = PVDZ_obj_Fire spawn BIS_Effects_Burn;
    for "_i" from 0 to _countDownTimer do {
    sleep 1;
    _timeLeft = _timeLeft - 1;
    };
 
    if(_timeLeft == 0 || _timeLeft < 0) then {
    _ent setDamage 2;
 
    
    PVDZ_obj_Delete = [_objectID,_objectUID];
    publicVariableServer "PVDZ_obj_Delete";
    if (isServer) then {
        PVDZ_obj_Delete call server_deleteObj;
    };
    deleteVehicle _ent;
    };