//===================piXel 12-02-2013============
_carrier = _this select 0;
_player = _this select 1;
_id = _this select 2;
_actionArray = _this select 3;
_action = _actionArray select 0;
_buoyPos = getPosATL bigBuoy;

if (_action == "pickup") then 
	{
	_allCargo = nearestObjects [_carrier, ["car","motorcycle","bicycle"],15];
	_airCargo = _allCargo select 0;
	if ((count _allCargo == 0) || (getPosATL _carrier select 2 > 12) || (speed _carrier >= 3)) exitWith 
		{
		if (speed _carrier >= 3) then
			{
			_txt = parseText "<img image='addin\fx\heli.paa' align='center' size='4'/><br/><img image='addin\fx\noCargo.paa' align='center' size='4'/><br/><t color='#cecece' align='center'>Speed is to high</t>";
			[nil, _player, "loc", rHINT, _txt, "PLAIN DOWN"] call RE;
			}
			else
			{
			_txt = parseText "<img image='addin\fx\heli.paa' align='center' size='4'/><br/><img image='addin\fx\noCargo.paa' align='center' size='4'/><br/><t color='#cecece' align='center'>No cargo to attach</t>";
			[nil, _player, "loc", rHINT, _txt, "PLAIN DOWN"] call RE;
			};
		};
	if (getPosATL _carrier select 2 < 4) exitWith 
		{
		_txt = parseText "<img image='addin\fx\heli.paa' align='center' size='4'/><br/><img image='addin\fx\lowCargo.paa' align='center' size='4'/><br/><t color='#cecece' align='center'>To low to attach cargo</t>";
		[nil, _player, "loc", rHINT, _txt, "PLAIN DOWN"] call RE;
		};
	_carrier removeAction _id;
	_airCable = nearestObject [_Buoypos, "BuoySmall"];
	_airCable attachTo [_carrier,[0,0,-4.8]]; 
	_airCargo attachTo [_carrier,[0,0,-7.5]];
	_typeOfVehicle = getText (configFile >> "cfgVehicles" >> typeOf _airCargo >> "displayName");
	_txt = parseText format["<img image='addin\fx\heli.paa' align='center' size='4'/><br/><img image='addin\fx\yesCargo.paa' align='center' size='4'/><br/><t color='#cecece' align='center'>%1 attached</t><br/>",_typeOfVehicle];
	[nil, _player, "loc", rHINT, _txt, "PLAIN DOWN"] call RE;
	nul = _carrier addAction [("<t color=""#00a6eb"">Drop cargo</t>"),"addin\liftCargo.sqf",["drop",_airCargo,_airCable],10,false,true,"","driver _target == player"];
	};
if (_action == "drop") then 
	{
	_airCargo = _actionArray select 1;
	_airCable = _actionArray select 2;

	if (position _airCargo select 2 > 15) exitWith 
		{
		_txt = parseText "<img image='addin\fx\heli.paa' align='center' size='4'/><br/><img image='addin\fx\highCargo.paa' align='center' size='4'/><br/><t color='#cecece' align='center'>To high to drop cargo</t>";
		[nil, _player, "loc", rHINT, _txt, "PLAIN DOWN"] call RE;
		};
	_carrier removeAction _id;
	detach _airCable;
	detach _airCargo;
	_typeOfVehicle = getText (configFile >> "cfgVehicles" >> typeOf _airCargo >> "displayName");
	_txt = parseText format["<img image='addin\fx\heli.paa' align='center' size='4'/><br/><img image='addin\fx\defaultCargo.paa' align='center' size='4'/><br/><t color='#cecece' align='center'>%1 dettached</t><br/>",_typeOfVehicle];
	[nil, _player, "loc", rHINT, _txt, "PLAIN DOWN"] call RE;
	nul = _carrier addAction [("<t color=""#00a6eb"">Lift cargo</t>"),"addin\liftCargo.sqf",["pickup"],10,false,true,"","driver _target == player"];
	sleep 3;
	_airCable setPosATL _Buoypos;
	If (getPosATL _airCargo select 2 > 1) then
		{
		_airCargo setPosATL [getPosATL _airCargo select 0, getPosATL _airCargo select 1, 0];
		};
	};