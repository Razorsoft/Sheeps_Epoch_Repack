//===================piXel 15-02-2013===========
if (isServer) exitwith {};
private ["_anomaly","_nuclea","_static"];

_anomaly = _this select 0;

_classname = "#particlesource";
_location = getPosATL _anomaly;
_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
_nuclea = _object;
_nuclea setParticleCircle [0, [0, 0, 0]];
_nuclea setDropInterval 0.021;
_nuclea setParticleParams [["\ca\data\rainbow", 1, 0, 1], "", 
"spaceObject", 
0.3,
0.3,
[12, 0, 12],
[0, 0, 0],
5,
5.01,0.72,0.3,
[0.75],
[[0, 0, 1, 0.5], [0, 0, 1, 0.3], [0, 0, 1, 0.1]],
[1],
0,
0,
"",
"",
_anomaly];

_static = createSoundSource ["Sound_Factory09", getPosATL _nuclea, [], 0];