//===================piXel 15-02-2013===========
waitUntil {!isNil ("dayzLoginRecord")};

//failsafe vehClimb.sqf
if (animationState player == "sitUnarm_L_idleLoop_inUH1Y") then {[nil,player,rSwitchMove, "AidlPpneMstpSnonWnonDnon_SleepC_killFly"] call RE;};

//intro move
showCinemaBorder true;
camUseNVG false;

_camera = "camera" camCreate [(position player select 0)-100*sin (round(random 359)), (position player select 1)-100*cos (round(random 359)),(position player select 2)+60];
_camera cameraEffect ["internal","back"];

_camera camSetFOV 2.000;
_camera camCommit 0;
waitUntil {camCommitted _camera};
TitleRsc["logo","PLAIN"];

_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,0];
_camera camCommit 8;
waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;

//dog commands
sleep 1;
player setVariable ["dogAction","follow",true];
sleep 6;
//useless failsafe
_commd = player getVariable "dogAction";
if (_commd != "follow") then 
{
player setVariable ["dogAction","follow",true];
};
nul = player addAction ["Dog |<t color='#00a6eb'> Stay here</t>","addin\dogCommand.sqf",["stay"],-10,false,true,"","((nearestObjects [player, ['Pastor','Fin'], 40]) select 0) isKindOf 'Pastor' || ((nearestObjects [player, ['Pastor','Fin'], 40]) select 0) isKindOf 'Fin' && player in dogOwner"];
nul = player addAction ["Dog |<t color='#00a6eb'> Follow me</t>","addin\dogCommand.sqf",["follow"],-11,false,true,"","((nearestObjects [player, ['Pastor','Fin'], 40]) select 0) isKindOf 'Pastor' || ((nearestObjects [player, ['Pastor','Fin'], 40]) select 0) isKindOf 'Fin' && player in dogOwner"];
nul = player addAction ["Dog |<t color='#00a6eb'> Find animal</t>","addin\dogCommand.sqf",["find"],-12,false,true,"","((nearestObjects [player, ['Pastor','Fin'], 40]) select 0) isKindOf 'Pastor' || ((nearestObjects [player, ['Pastor','Fin'], 40]) select 0) isKindOf 'Fin' && player in dogOwner"];

//vehicle climb
_nul = [] execVM "addin\vehInit.sqf";