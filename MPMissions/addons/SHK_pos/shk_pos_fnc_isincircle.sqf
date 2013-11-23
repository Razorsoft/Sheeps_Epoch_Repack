


private ["_pos","_area","_posX","_posY"];
_pos = _this select 0;
_area = _this select 1;

_posX = _pos select 0;
_posY = _pos select 1;


private ["_center","_centerX","_centerY"];
_center  = getMarkerPos _area;
_centerX = _center select 0;
_centerY = _center select 1;


private ["_size"];
_size  = getMarkerSize _area;
_size = _size select 0;


private ["_difX","_difY"];
_difX = _posX - _centerX;
_difY = _posY - _centerY;

private ["_return"];
_return = false;



if (sqrt((_difX * _difX) + (_difY * _difY)) < _size) then {
  _return = true;
};

_return