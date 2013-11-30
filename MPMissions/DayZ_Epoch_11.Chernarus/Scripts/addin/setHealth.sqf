//===================piXel 12-02-2013============
if (isserver) exitwith {};
private ["_setHealth"];
_setHealth = round(random 10.25);
if (_setHealth == 3) then
{
r_player_inpain = false;
dayz_hunger	= 0;
dayz_thirst = 0;
}
else
{
r_player_inpain = true;
r_player_blood = 12000;
r_player_infected = false;
r_player_injured = false;
r_fracture_legs = false;
r_fracture_arms = false;
r_player_lowblood = false;
};