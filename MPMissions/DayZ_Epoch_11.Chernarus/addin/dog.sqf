//===================piXel 12-02-2013============
if (isServer) exitWith
{
private ["_leader","_dog","_type","_breed","_grp","_dogname","_clientID","_humans","_distance","_foo","_commd","_animals","_targetAnimal","_stopWait","_veh"];
_leader = _this select 0;
_clientID = owner _leader;

if (count dogOwner >= 10) exitWith {[nil, _leader, "loc", rTITLETEXT, "Sorry, all available dogs found a companion", "PLAIN DOWN"] call RE;};
if ({_X == _leader} count dogOwner == 1) exitWith {[nil, _leader, "loc", rTITLETEXT, "This dog is not interested", "PLAIN DOWN"] call RE;};

_type = round(random 1);
_breed = "Pastor";
switch (_type) do 
	{
	case 0:
	{
	_breed = "Pastor";
	};
	case 1:
	{
	_breed = "Fin";
	};
	};	
_grp = creategroup (side _leader);   
_dogname = "K9";
call compile format ['"%2" createUnit [getposATL _leader, _grp,"%1=this; this setSpeedMode ""full""; this disableAI ""autotarget""; this setbehaviour ""aware"";",1]',_dogname,_breed];
_dog = call compile format ["%1",_dogname];
_dog setIdentity "dogs";
_nul = [objNull, _dog, rSAY, "bark"] call RE; 
dogOwner = dogOwner + [_leader];

sleep 1;
_clientID publicVariableClient "dogOwner";

while {(alive _dog) && (alive _leader)} do
{
	_humans = [];
	_distance = 1000;
	_humans = nearestObjects [_leader , ["CAManBase"], 40] - [_leader,_dog];
	_foo = _humans select 0;
	_commd = _leader getVariable "dogAction";
	
	//debug menu
	//_txt = parseText format["debugDog: %1 %2",_leader,_commd];
	//[nil, _leader, "loc", rHINT, _txt, "PLAIN DOWN"] call RE;
	
	if (_commd == "stay") then
		{
		_dog switchmove "Dog_Sit1";
		_dog disableAI "move";
		sleep 4;
		};
	if (_commd == "find") then
		{
		_dog enableAI "move";
		_dog switchmove "";	
		_animals = nearestObjects [_dog, ["Hen","Cock","Cow04","Cow03","Cow02","Cow01","Goat","Sheep","WildBoar"],400];
		if (count _animals != 0) then
			{
			_targetAnimal = _animals select 0;
			_stopWait = (time + 60);
			_dog domove (position _targetAnimal);
			_dog setspeedmode "FULL";
			waituntil {_dog domove (position _targetAnimal); sleep 2;  (_dog distance _targetAnimal < 20) || (time > _stopWait) || (_leader getVariable "dogAction" != "find")};
			_dog switchmove "Dog_Walk";
			_nul = [objNull, _dog, rSAY, "bark"] call RE; 
			};
		_dog switchmove "Dog_Walk";
		sleep 4;
		};	
	if (_commd == "follow") then
	{
	_dog enableAI "move";
	_dog switchmove "";
	//foo
	if ((count _humans > 0) && (alive _foo)) then
		{
		_distance = _leader distance _foo;
		// warning
		If ((_distance > 10) && (_distance < 30)) then
			{
			_nul = [objNull, _dog, rSAY, "bark"] call RE; 
			_dog domove (position _foo);
			_dog setspeedmode "FULL";
			_nul = [objNull, _dog, rSAY, "bark"] call RE; 
			};
		//initiate attack	
		If ((_distance < 11) && (side _foo != side _leader)) then
			{
			_nul = [objNull, _dog, rSAY, "growl"] call RE; 
			_dog domove (position _foo);
			_dog setspeedmode "FULL";
			};
		//attack
		If ((_distance < 10) && (side _foo != side _leader)) then
			{
			_dog domove (position _foo);
			_dog setspeedmode "FULL";
			_stopWait = (time + 4);
			waitUntil {sleep 0.5; (_dog distance _foo) < 5 || time > _stopWait};
			_dog domove (position _foo);
			_dog setspeedmode "FULL";
			if ((alive _dog) && (_foo isKindOf "zZombie_Base")) then 
				{
				_dog attachTo [_foo,[0,0.8,0],"hrudnik"];
				_dog setDir 180;
				_foo setdamage 0.3;
				sleep 1;
				};
			if ((alive _dog) && (_foo isKindOf "zZombie_Base")) then 
				{
				_foo setdamage 0.3;
				sleep 1;
				};
			if ((alive _dog) && (_foo isKindOf "zZombie_Base")) then 
				{
				_dog setDir 160;
				_foo setdamage 0.6;
				sleep 1;
				};
			if ((alive _dog) && (_foo isKindOf "zZombie_Base")) then  
				{		
				_dog setDir 180;
				_foo setdamage 0.8;
				sleep 1;
				};
			if ((alive _dog) && (_foo isKindOf "zZombie_Base")) then 
				{
				_dog setDir 200;
				_foo setdamage 1;
				};
			detach _dog;
			_dog domove (position _leader);
			_dog setspeedmode "FULL";
			};
		};
	//getin
	if ((vehicle _leader != _leader) && ((vehicle _leader isKindOf "car") || (vehicle _leader isKindOf "air"))) then
		{
		_veh = vehicle _leader;
		_dog domove position _veh;
		_dog setspeedmode "FULL";
		_stopWait = (time + 10);
		waituntil {_dog domove position _veh; sleep 1; (_dog distance _veh < 5) || time > _stopWait};
		_dog attachto [_veh,[0,-0.5,-1],"podlaha"];
	//getout
		waitUntil{sleep 2;((vehicle _leader == _leader) || (!alive _dog) || (!alive _leader))};
		sleep 1;
		detach _dog;
		_dog setPos (getposATL _leader);
		_veh = objNull;
		};
	//tofar
	if ((_leader distance _dog) > 1200) then
		{
		_dog  setDamage 1;
		};
	//toClose
	if ((_leader distance _dog) < 5) then 
		{
		_dog switchmove "Dog_Siting";
		}
		else
		{
		_dog switchmove ""; //Dog_Sprint
		_dog domove position _leader;
		_dog setspeedmode "full";
		};
	_foo = objNull;
	sleep 3;
	};
};
_dog  setDamage 1;
sleep 15;
hideBody _dog;
sleep 5;	
deleteVehicle _dog;
_grp = grpNull;
_stopWait = (time + 120);
waitUntil {time >= _stopWait};
dogOwner = dogOwner - [_leader];
sleep 1;
_clientID publicVariableClient "dogOwner";
};