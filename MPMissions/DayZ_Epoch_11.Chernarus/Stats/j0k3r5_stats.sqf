/*

	/////Tweaked j0k3r5 / Original work done by Matt L / and to anyone else that is involved that Ive forgotten//
	////www.j0k3r5.com//
	If modified and released give credits where due, thank you.
	
*/


dayz_spaceInterrupt = {
    private ["_dikCode", "_handled"];
    _dikCode = _this select 1;
    _handled = false;
 
    if (_dikCode == 0x44) then {
        if (j0k3r5_stats) then {
            j0k3r5_stats = false;
            hintSilent "";
        } else {[] spawn fnc_debug;};
    };
    _handled
};
 
fnc_debug = {
    j0k3r5_stats = true;
    while {j0k3r5_stats} do
	{
		_logo = "Stats\stats_logo.paa";
		_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
		
		_nearestCity = nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],750];
		_textCity = "Wilderness";
		if (count _nearestCity > 0) then {_textCity = text (_nearestCity select 0)};
			
		if (player == vehicle player) then
		{
			_pic = (gettext (configFile >> 'cfgWeapons' >> (currentWeapon player) >> 'picture'));	
		}
		else
		{
			_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));	
		};
		
		_timeleft= _combattimeout-time;
		_kills = 		player getVariable["zombieKills",0];
		_killsH = 		player getVariable["humanKills",0];
		_killsB = 		player getVariable["banditKills",0];
		_humanity =		player getVariable["humanity",0];
		_headShots = 	player getVariable["headShots",0];
		_zombies =              count entities "zZombie_Base";
		_zombiesA =     		{alive _x} count entities "zZombie_Base";

		
		hintSilent parseText format 
			[
				"
				<img size='6' image='%10'/>
				<br/>
				<t size='1'		font='Bitstream'align='center'>STATS</t><br/>
				<t size='1'		font='Bitstream'align='center'>%15</t>
				<br/>
				<t size='0.75'		font='Bitstream'align='left'>Location:</t><t size='0.75' 						font='Bitstream'align='right'color='#FFFF00'>%11</t><br/>
				<t size='0.75'		font='Bitstream'align='left'>Blood:</t><t size='0.75' 							font='Bitstream'align='right'color='#FFFF00'>%1</t><br/>
				<t size='0.75'		font='Bitstream'align='left'>Humanity:</t><t size='0.75'						font='Bitstream'align='right'color='#FFFF00'>%2</t><br/>
				<t size='0.75'		font='Bitstream'align='left'>Headshots:</t><t size='0.75'						font='Bitstream'align='right'color='#FFFF00'>%6</t><br/>
				<t size='0.75' 		font='Bitstream'align='left'>Heroes Killed:</t><t size='0.75' 					font='Bitstream'align='right'color='#FFFF00'>%3</t><br/>
				<t size='0.75'		font='Bitstream'align='left'>Bandits Killed:</t><t size='0.75'					font='Bitstream'align='right'color='#FFFF00'>%4</t><br/>
				<t size='0.75'		font='Bitstream'align='left'>Zombies Killed:</t><t size='0.75'					font='Bitstream'align='right'color='#FFFF00'>%5</t><br/>
				<t size='0.75' 		font='Bitstream'align='left'>Zeds (alive/total): </t><t size='0.75' 			font='Bitstream'align='right'color='#FFFF00'>%13/%12</t><br/>
				<t size='0.75' 		font='Bitstream'align='left'>FPS: </t><t size='0.75' 							font='Bitstream'align='right'color='#FFFF00'>%14</t><br/>
				<t size='0.75'		font='Bitstream'align='left'>Survived:</t><t size='0.75'						font='Bitstream'align='right'color='#FFFF00'>%7 Dayz</t>
				<br/>
				<br/>
				<t size='1'		font='Bitstream'align='center'color='#FFFF00'>Restart in %8 minutes!</t>
				<br/>
				<img size='6' image='%9'/>
				<br/>
				<t size='1' 		font='Bitstream' align='center'>Use F10 to Toggle</t>
				<br/>
				
				
				
				",
				r_player_blood,												
				round _humanity,											
				_killsH,													
				_killsB,													
				_kills,														
				_headShots,													
				(dayz_Survived),											
				(180-(round(serverTime/60))),								
				_pic,														
				_logo,														
				_textCity,													
				count entities "zZombie_Base",								
				{alive _x} count entities "zZombie_Base",					
				diag_fps,													
				(name player)												

			]; 
			sleep 3;
	};
};

[] spawn fnc_debug;