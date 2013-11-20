private ["_mypos", "_dir", "_createShield", "_sounddist", "_timeplay", "_shield", "_shieldUp", "_timer", "_zombies", "_count", "_zombie", "_soundList"];
 
player playActionNow "Medic";
sleep 1;
titleText ["You are building an Anti-Zombie Frequency Emitter.","PLAIN DOWN"]; titleFadeOut 5;
 
_mypos = getposATL player;
_dir = getdir player;
_mypos = [(_mypos select 0)+2*sin(_dir),(_mypos select 1)+2*cos(_dir), (_mypos select 2)];
_createShield = createVehicle ["SkeetMachine", _mypos, [], 0, "CAN_COLLIDE"];
_createShield setDir _dir;
_createShield setposATL _mypos;
sleep 1;
 
player removeMagazine "TrashJackDaniels";
player removeMagazine "TrashTinCan";
player removeMagazine "PartEngine";
player removeMagazine "ItemJerrycan";
sleep 0.01;
player addMagazine "ItemJerrycanEmpty";
 
titleText ["Device activated.","PLAIN DOWN"]; titleFadeOut 5;
 
_sounddist = 50;
_timeplay = 18;
while {_timeplay > 1} do {
    _shield = nearestObject [player, "SkeetMachine"];
    [nil,_shield,rSAY,["engine_12s", _sounddist]] call RE;
 
    _shieldUp = (alive _shield);
    _timer = time;
    while {_shieldUp} do {
        _zombies = (getPosATL _shield) nearEntities ["zZombie_Base",20];
        _count = count _zombies;
 
        for "_i" from 0 to (_count -1) do {
            _zombie = _zombies select _i;
            _zombie setdamage 1;
            sleep 0.01;
        };
        if ((time - _timer) > 10) exitwith {};
    };
    _soundList = ["PMC_ElectricBlast1","PMC_ElectricBlast2"] call BIS_fnc_selectRandom;
    [nil,_shield,rSAY,[_soundList, _sounddist]] call RE;
    _timeplay = _timeplay - 1;
};
 
sleep 1;
deleteVehicle _createShield;
titleText ["Device deactivated.","PLAIN DOWN"]; titleFadeOut 5;