/*  Select a random position based on anchor position, direction and distance.
     In: [position,distance,direction,water]
    Out: position
*/
private ["_org","_dst","_dir","_pos","_water","_road"];
_org = _this select 0;
_dst = _this select 1;
_dir = if (count _this > 2) then {_this select 2} else {random 360};
_water = if (count _this > 3) then {_this select 3} else {false};
_road = if (count _this > 4) then {_this select 4} else {[0,200]};



if (typename _org == "OBJECT") then {_org = getpos _org};


if (typename _dst == "ARRAY") then {
  private ["_min","_max"];
  _min = _dst select 0;
  _max = _dst select 1;
  _dst = (_min + random(_max - _min));
};


if (typename _dir == "ARRAY") then {
  private ["_min","_max","_ang"];
  _min = _dir select 0;
  _max = _dir select 1;
  
  _ang = _max - _min;
  
  
  if (_ang < 0) then { _ang = _ang + 360 };
  
  _dir = (_min + random _ang);
};

_pos = [_org,_dst,_dir] call SHK_pos_fnc_getPos;


if !_water then {
  if (surfaceIsWater _pos) then {
    private ["_p","_d","_l"];
    _d = 0; _l = true;
    
    
    
    while {_d = _d + 20; _l && _d < 5000} do {
      for "_i" from 0 to 340 step 20 do {
        _p = [_pos,_d,_i] call SHK_pos_fnc_getpos;
        if (!surfaceIsWater _p) exitwith {_l = false};
      };
    };
    _pos = _p;
  };
};


if ((_road select 0) > 0) then {
  private ["_mode","_range","_roads","_cnt","_p","_p2"];
  _mode  = _road select 0;
  _range = _road select 1;
  _roads = _pos nearroads _range;
  _cnt   = count _roads;
  _p     = [];

  
  if (_cnt > 0) then {
    _p = getpos (_roads select 0);
    
    
    if (_cnt > 1) then {
      for "_i" from 1 to (_cnt - 1) do {
        _p2 = getpos (_roads select _i);
        if ((_p2 distance _pos) < (_p distance _pos)) then {
          _p = _p2;
        };
      };
    };
  };
  
  switch _mode do {
    
    case 1: {
      if (count _p > 0) then {
        _pos = _p;
      };
    };
    
    case 2: {
      if (count _p > 0) then {
        _pos = _p;
      } else {
        _pos resize 0;
      };
    };
  };
};


_pos