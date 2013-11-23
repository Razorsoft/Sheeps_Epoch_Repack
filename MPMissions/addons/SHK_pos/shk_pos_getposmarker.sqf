/*  Select a random position from an area defined by a marker.
     In: [marker,water,blacklist]
    Out: position
*/
private ["_area","_water","_blist","_pos"];
_area = _this select 0;
_water = if (count _this > 1) then {_this select 1} else {false};
_blist = if (count _this > 2) then {_this select 2} else {[]};
_pos = [];

if (typename _blist == "STRING") then {_blist = [_blist]};

private ["_shape"];
_shape = _area call SHK_pos_fnc_getMarkerShape;


if (_shape == "ICON") then {
  _pos = getmarkerpos _area;
  
  
  if !_water then {
    if (surfaceIsWater _pos) then {
      _pos = [];
    }
  };
  

} else {
  
  private ["_i","_exit"];
  _exit = false;
  for [{_i = 0}, {_i < 1000 && !_exit}, {_i = _i + 1}] do {
  
    
    if (_shape in ["SQUARE","RECTANGLE"]) then {
      _pos = _area call SHK_pos_fnc_getPosFromRectangle;
    } else {
      _pos = _area call SHK_pos_fnc_getPosFromEllipse;
    };
    
    
    if !_water then {
      
      if !(surfaceIsWater _pos) then {
        _exit = true;
      };
    
    } else {
      _exit = true;
    };

    
    if (count _blist > 0 && _exit) then {
      
      {
        
        if ([_pos,_x] call SHK_pos_fnc_isBlacklisted) exitwith {
          _exit = false;
        };
      } foreach _blist;
    };
    
  };
};

_pos