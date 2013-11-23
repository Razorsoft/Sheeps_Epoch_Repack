
player = _this select 1;
_actionArray = _this select 3;
_action = _actionArray select 0;


if (_action == player getVariable "dogAction") exitWith {_nul = [objNull, player, rSAY, "whistleNon"] call RE;};

if (_action == "follow") then
{
player setVariable ["dogAction",_action,true];
_nul = [objNull, player, rSAY, "whistleFollow"] call RE;
};
if (_action == "stay") then
{
player setVariable ["dogAction",_action,true];
_nul = [objNull, player, rSAY, "whistleStay"] call RE;
};
if (_action == "find") then
{
player setVariable ["dogAction",_action,true];
_nul = [objNull, player, rSAY, "whistleFind"] call RE;
};