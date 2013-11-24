
diag_log ( "[AGN] Starting Trader City Safezone Commander!" );
 
if ( isDedicated || isServer ) exitWith {diag_log ( "Error: Attempting to start AGN products on a server where it should not be!" );}; 
Private ["_EH_Fired", "_ehID", "_fix","_inVehicle","_inVehicleLast","_EH_Fired_Vehicle",
		"_inVehicleDamage","_antiBackpackThread","_antiBackpackThread2"];
		
private ["AGN_safeZoneGodmode","AGN_safeZoneMessages","AGN_safeZone_Backpack_AllowGearFromLootPiles",
		"AGN_safeZone_Backpack_AllowGearFromVehicles","AGN_safeZone_Backpack_AllowGearFromDeadPlayers",
		"AGN_safeZone_Vehicles_DisableMountedGuns","AGN_safeZone_Players_DisableWeaponFiring",
		"AGN_safeZone_Backpack_EnableAntiBackpack","AGN_safeZone_Vehicles_AllowGearFromWithinVehicles"];
AGN_safeZoneDebug = false; 
AGN_safeZoneGodmode = true; 								
AGN_safeZoneMessages = true;								
AGN_safeZone_Backpack_EnableAntiBackpack = true;			
AGN_safeZone_Backpack_AllowGearFromLootPiles = true;		
AGN_safeZone_Backpack_AllowGearFromVehicles = true;		
AGN_safeZone_Backpack_AllowGearFromDeadPlayers = true;		
AGN_safeZone_Backpack_AllowFriendlyTaggedAccess = true;	
AGN_safeZone_Vehicles_DisableMountedGuns = true;			
AGN_safeZone_Vehicles_AllowGearFromWithinVehicles = true;	
AGN_safeZone_Players_DisableWeaponFiring = true;			
disableSerialization;
waitUntil {!isNil "dayz_animalCheck"};
if ( AGN_safeZoneMessages ) then { systemChat ( "[AGN] Trader Zone Commander Loaded!" ); };
_inVehicle = objNull;
_inVehicleLast = objNull;
while {true} do {
	
	waitUntil { !canBuild };
	_inSafezoneFinished = false;
	if ( AGN_safeZoneMessages ) then { systemChat ("[AGN] Entering Trader Area - God Mode Enabled"); };
	_thePlayer = player;
	if ( AGN_safeZoneGodmode ) then
	{
		player_zombieCheck = {};
		fnc_usec_damageHandler = {};
		_thePlayer removeAllEventHandlers "handleDamage";
		_thePlayer addEventHandler ["handleDamage", {false}];
		_thePlayer allowDamage false;
	};
	
	if ( AGN_safeZone_Players_DisableWeaponFiring ) then
	{
		_EH_Fired = _thePlayer addEventHandler ["Fired", {
			systemChat ("[AGN] You can not fire your weapon in a Trader City Area");
			NearestObject [_this select 0,_this select 4] setPos[0,0,0];
		}];
	};
	
	if ( AGN_safeZone_Backpack_EnableAntiBackpack ) then
	{
		AGN_LastPlayerLookedAt = objNull;
		AGN_LastPlayerLookedAtCountDown = 5;
		_antiBackpackThread = [] spawn {
			private [ "_ct","_ip","_ia","_dis"] ;
			while {!canBuild} do
			{
				if ( isNull AGN_LastPlayerLookedAt ) then
				{
					waitUntil {!isNull cursorTarget};
					_ct = cursorTarget;
					_ip = isPlayer _ct;
					if ( _ip ) then { _ia = alive _ct; _dis = _ct distance player; } else { _ia = false; _dis = 1000; };
					
					if ( (_ip && _ia) && (_dis < 6.5) ) then
					{
						AGN_LastPlayerLookedAt = _ct;
					};
				} else {
					AGN_LastPlayerLookedAtCountDown = AGN_LastPlayerLookedAtCountDown - 1;
					if ( AGN_LastPlayerLookedAtCountDown < 0 ) then { AGN_LastPlayerLookedAtCountDown = 5; AGN_LastPlayerLookedAt = objNull; };
					sleep 1;
				};
			};
		};
			
		_antiBackpackThread2 = [] spawn {
			private ["_to","_dis","_inchk","_ip","_ia","_skip","_ct","_iv","_lp","_inv","_ctOwnerID","_friendlies","_if"];
			_ctOwnerID = 0;
			while {!canBuild} do
			{
				_ct = cursorTarget;
				_skip = false;
				
				if ( !isNull (_ct) ) then
				{
					_to = typeOf _ct;
					_dis = _ct distance player;
					_inchk = ["WeaponHolder","ReammoBox"];
					
					_lp = false;
					{
						if ( (_to isKindOf _x) && (_dis < 10) && AGN_safeZone_Backpack_AllowGearFromLootPiles ) then
						{
							_lp = true;
						};
					} forEach ( _inchk );
					_ip = isPlayer _ct;
					_ia = alive _ct;
					_iv = _ct isKindOf "AllVehicles";
					_inv = (vehicle player != player);
					
					_if = false;
					if ( _ip ) then {
						_ctOwnerID = _ct getVariable["CharacterID","0"];
						_friendlies	= player getVariable ["friendlyTo",[]];
						if(_ctOwnerID in _friendlies) then {	
							if ( AGN_safeZone_Backpack_AllowFriendlyTaggedAccess ) then
							{
								_if = true;
							};
						};
					};
					if ( AGN_safeZoneDebug ) then {
					hintSilent ( format["AGN Safezone Commander\n\nCursorTarget\n%1\n\nDistance\n%2\n\nLootpile\n%3 [%9]\n\nisPlayer\n%4\n\nAlive\n%5\n\nisVehicle\n%6\n\ninVehicle\n%7\n\nisFriendly\n%8 (%12) [%10]\n\nSkip: %11\n",
                                                _ct, _dis, _lp, _ip, _ia, _iv, _inv, _if, AGN_safeZone_Backpack_AllowGearFromLootPiles, AGN_safeZone_Backpack_AllowFriendlyTaggedAccess, _skip, _ctOwnerID] );
};
					
					
					if ( _lp ) then {_skip = true;};
					
					
					if ( !(_ia) && AGN_safeZone_Backpack_AllowGearFromDeadPlayers ) then {_skip = true;};
					
					
					if ( _iv && (_dis < 10) && !(_ip) && AGN_safeZone_Backpack_AllowGearFromVehicles ) then {_skip = true;};
					
					
					if ( _inv && AGN_safeZone_Vehicles_AllowGearFromWithinVehicles ) then { _skip = true; };
					
					
					if ( _if ) then { _skip = true; };
				};
				
				if( !isNull (FindDisplay 106) && !_skip ) then
				{
					if ( isNull AGN_LastPlayerLookedAt ) then
					{
						(findDisplay 106) closeDisplay 1;
						waitUntil { isNull (FindDisplay 106) };
						createGearDialog [(player), 'RscDisplayGear'];
						if ( AGN_safeZoneMessages ) then { systemChat ("[AGN] Anti Backpack Stealing - Redirecting you to your own gear!"); };
						waitUntil { isNull (FindDisplay 106) };
					} else {
						if ( AGN_safeZoneMessages ) then { systemChat (format["[AGN] You cannot open your gear at this time as you have looked at a player in the last 5 seconds."]); };
						(findDisplay 106) closeDisplay 1;
						waitUntil { isNull (FindDisplay 106) };
					};
				};
				if ( _skip && _if ) then {
					if ( AGN_safeZoneMessages ) then { systemChat ("[AGN] This player is tagged friendly, you have access to this players bag") };
				};
			};
		};
	};
	
	if ( AGN_safeZone_Vehicles_DisableMountedGuns ) then
	{
		while { !canBuild } do
		{
			sleep 0.1;
			if ( !(isNull _inVehicle) && (vehicle player == player) ) then
			{
				_inVehicle removeEventHandler ["Fired", _EH_Fired_Vehicle];
				_inVehicleLast = _inVehicle;
				_inVehicleLast removeEventHandler ["Fired", _EH_Fired_Vehicle];
				_inVehicle = objNull;
			};
			
			if ( vehicle player != player && isNull _inVehicle ) then
			{
				if (AGN_safeZoneMessages) then { systemChat ( "[AGN] No Firing Vehicle Guns Enabled" ); };
				_inVehicle = vehicle player;
				_inVehicleDamage = getDammage _inVehicle;
				_EH_Fired_Vehicle = _inVehicle addEventHandler ["Fired", {
					systemChat ("[AGN] You can not fire your vehicles weapon in a Trader City Area");
					NearestObject [_this select 0,_this select 4] setPos[0,0,0];
				}];
			};
		};
	} else {
		waitUntil { canBuild };
	};
	AGN_LastPlayerLookedAt = objNull;
	AGN_LastPlayerLookedAtCountDown = 5;
	terminate _antiBackpackThread;
	terminate _antiBackpackThread2;
	if ( AGN_safeZoneMessages ) then { systemChat ("[AGN] Exiting Trader Area - God Mode Disabled"); };
	
	if ( AGN_safeZone_Vehicles_DisableMountedGuns ) then
	{
		if ( !(isNull _inVehicle) ) then
		{
			if ( AGN_safeZoneMessages ) then { systemChat ( "[AGN] No Firing Vehicle Guns Disabled" ); };
			_inVehicle removeEventHandler ["Fired", _EH_Fired_Vehicle];
		};
		
		if ( !(isNull _inVehicleLast) ) then
		{
			if ( AGN_safeZoneMessages ) then { systemChat ( "[AGN] No Firing Vehicle Guns Disabled" ); };
			_inVehicleLast removeEventHandler ["Fired", _EH_Fired_Vehicle];
		};
	};
	if ( AGN_safeZone_Players_DisableWeaponFiring ) then
	{
		_thePlayer removeEventHandler ["Fired", _EH_Fired];
	};
	
	if ( AGN_safeZoneGodmode ) then
	{
		player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
		fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
		_thePlayer addEventHandler ["handleDamage", {true}];
		_thePlayer removeAllEventHandlers "handleDamage";
		_thePlayer allowDamage true;
	};
	_inSafezoneFinished = true;
};