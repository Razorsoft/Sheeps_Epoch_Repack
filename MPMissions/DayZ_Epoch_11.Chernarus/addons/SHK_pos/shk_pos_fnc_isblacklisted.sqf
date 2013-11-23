


private ["_pos","_area","_return"];
_pos = _this select 0;
_area = _this select 1;
_return = false;


private ["_dir"];
_dir = markerDir _area;
_dir = _dir % 360;


private ["_center","_centerX","_centerY"];
_center  = getMarkerPos _area;
_centerX = _center select 0;
_centerY = _center select 1;

private ["_shape"];
_shape = _area call SHK_pos_fnc_getMarkerShape;

if (_shape == "ICON") then {
  
  if ([_pos,_center] call SHK_pos_fnc_isSamePosition) then {
    _return = true;
  };


} else {
  if (_shape in ["RECTANGLE","SQUARE"]) then {
    private ["_corners"];
    _corners = _area call SHK_pos_fnc_getMarkerCorners;

    
    if (_dir % 90 != 0) then {
      
      _corners set [4,_pos];
      
      
      
      private ["_posCor","_posNew","_orgX","_orgY","_shiftedX","_shiftedY","_newX","_newY"];
      for "_i" from 0 to (count _corners - 1) do {
        _posCor = _corners select _i;
        
        
        _orgX = _posCor select 0;
        _orgY = _posCor select 1;
        
        
        
        _shiftedX = _orgX - _centerX;
        _shiftedY = _orgY - _centerY;
        
        
        _posNew = [[_shiftedX,_shiftedY],_dir] call SHK_pos_fnc_rotatePosition;
        
        
        _newX = _posNew select 0;
        _newY = _posNew select 1;
        _newX = _newX + _centerX;
        _newY = _newY + _centerY;
        
        _posCor = [_newX,_newY];
        
        _corners set [_i,_posCor];
      };

      
      _pos = _corners select 4;
    };
    
    
    _return = [_pos,_corners] call SHK_pos_fnc_isInRectangle;
  } else {
    if (_shape == "CIRCLE") then {
      _return = [_pos,_area] call SHK_pos_fnc_isInCircle;
    } else {
      _return = [_pos,_area] call SHK_pos_fnc_isInEllipse;
    };
  };
};


_return