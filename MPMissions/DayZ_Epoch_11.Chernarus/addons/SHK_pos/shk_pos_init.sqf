SHK_pos_getPos = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_getpos.sqf";
SHK_pos_getPosMarker = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_getposmarker.sqf";
SHK_pos_fnc_findClosestPosition = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_findclosestposition.sqf";
SHK_pos_fnc_getMarkerCorners = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_getmarkercorners.sqf";
SHK_pos_fnc_getMarkerShape = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_getmarkershape.sqf";
SHK_pos_fnc_getPos = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_getpos.sqf";
SHK_pos_fnc_getPosFromCircle = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_getposfromcircle.sqf";
SHK_pos_fnc_getPosFromEllipse = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_getposfromellipse.sqf";
SHK_pos_fnc_getPosFromRectangle = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_getposfromrectangle.sqf";
SHK_pos_fnc_getPosFromSquare = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_getposfromsquare.sqf";
SHK_pos_fnc_isBlacklisted = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_isblacklisted.sqf";
SHK_pos_fnc_isInCircle = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_isincircle.sqf";
SHK_pos_fnc_isInEllipse = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_isinellipse.sqf";
SHK_pos_fnc_isInRectangle = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_isinrectangle.sqf";
SHK_pos_fnc_isSamePosition = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_issameposition.sqf";
SHK_pos_fnc_rotatePosition = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_rotateposition.sqf";
SHK_pos = {
  private ["_pos"];  
  _pos = []; 
  if (typename _this == "STRING") then {
    _pos = [_this] call SHK_pos_getPosMarker; 
  } else {
    if (typename (_this select 0) == "STRING") then {
      _pos = _this call SHK_pos_getPosMarker;
    } else {
      _pos = _this call SHK_pos_getPos;
    };
  };  
  _pos};