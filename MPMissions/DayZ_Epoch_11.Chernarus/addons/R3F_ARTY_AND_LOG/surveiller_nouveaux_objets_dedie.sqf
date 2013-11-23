

#include "R3F_ARTY_disable_enable.sqf"


#ifdef R3F_ARTY_enable


sleep 0.1;

private ["_liste_vehicules_connus", "_liste_vehicules", "_count_liste_vehicules", "_i", "_objet"];


_liste_vehicules_connus = [];

while {true} do
{
	
	_liste_vehicules = vehicles - _liste_vehicules_connus;
	_count_liste_vehicules = count _liste_vehicules;
	
	if (_count_liste_vehicules > 0) then
	{
		
		for [{_i = 0}, {_i < _count_liste_vehicules}, {_i = _i + 1}] do
		{
			_objet = _liste_vehicules select _i;
			
			
			
			if ({_objet isKindOf _x} count R3F_ARTY_CFG_pieces_artillerie > 0) then
			{
				[_objet] spawn R3F_ARTY_FNCT_piece_init_dedie;
			};
			
			
			sleep (18/_count_liste_vehicules);
		};
		
		
		_liste_vehicules_connus = _liste_vehicules_connus + _liste_vehicules;
	}
	else
	{
		sleep 18;
	};
};

#endif