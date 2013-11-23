


private ["_p1","_p2","_return"];
_p1 = _this select 0;
_p2 = _this select 1;
_return = true;


for "_i" from 0 to 1 do {
  if ((_p1 select _i) != (_p2 select _i)) exitwith {
    _return = false;
  };
};

_return