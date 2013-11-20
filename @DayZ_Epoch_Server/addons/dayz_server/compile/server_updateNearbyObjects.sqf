private["_pos"];
_pos = _this select 0;

_isBuildable = _this select 1;
{
	[_x, "gear"] call server_updateObject;
} forEach nearestObjects [_pos, dayz_updateObjects, 10];

if (_isBuildable) then {
	diag_log("_isBuildable was called!");
{
	[_x, "gear"] call server_updateObject;
	diag_log("BUILDABLES: updating " + _x + " object!");
} forEach nearestObjects [_pos, [allbuildables_class], 300];

};