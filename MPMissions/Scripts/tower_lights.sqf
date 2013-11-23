
waitUntil {!isNull player};
private ["_nrTowers","_rng","_nrPl","_lCol","_lbrt","_lamb","_twrCl","_stHr","_fnHr","_ndGen","_nrGen","_rngGen","_genCls","_doLit","_gnCnt"];

_rng = 1200; 
_lCol = [1, 0.88, 0.73]; 
_lbrt = 0.04;
_lamb = [1, 0.88, 0.73]; 
_twrCl = "Land_Ind_IlluminantTower";
_stHr = 17;
_fnHr = 6;
_ndGen = false;
_rngGen = 1800;
_genCls = "PowerGenerator_EP1";

fnc_axeTl = compile preprocessFileLineNumbers "Scripts\fnc_tower_lights.sqf";
while {alive player}
do
{
    if(daytime<_fnHr||daytime>_stHr)then{
    _nrPl = vehicle player;
    _nrTowers = nearestObjects [_nrPl, [_twrCl], _rng];
        {
        _doLit=true;
            if(_ndGen)then{
            _nrGen = (position _x) nearEntities [_genCls,_rngGen];
            _gnCnt = count _nrGen;
                if(_gnCnt < 1)then{
                _doLit=false;
                };
            };
        [_lCol,_lbrt,_lamb,[_x],[_doLit]] call fnc_axeTl;
        }forEach _nrTowers;
    };
sleep .5;
};