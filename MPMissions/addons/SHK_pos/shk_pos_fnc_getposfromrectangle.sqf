



private ["_center","_centerX","_centerY"];
_center  = getMarkerPos _this;
_centerX = _center select 0;
_centerY = _center select 1;


private ["_size","_sizeX","_sizeY"];
_size  = getMarkerSize _this;
_sizeX = _size select 0;
_sizeY = _size select 1;


private ["_dir","_dirCos","_dirSin"];
_dir    = (markerDir _this) * -1;
_dir    = _dir % 360;
_dirCos = cos _dir;
_dirSin = sin _dir;

private ["_rndX","_rndY","_posX","_posY"];

_rndX = (random (_sizeX * 2)) - _sizeX;
_rndY = (random (_sizeY * 2)) - _sizeY;


if (_dir != 0) then {
  _posX = _centerX + (_dirCos * _rndX - _dirSin * _rndY);
  _posY = _centerY + (_dirSin * _rndX + _dirCos * _rndY);
} else {
  _posX = _centerX + _rndX;
  _posY = _centerY + _rndY;
};

[_posX,_posY,0]