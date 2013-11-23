private ["_Secondary"];
canAbort = true;
_Secondary = currentWeapon player;
if(player ammo _Secondary > 1) then {
cutText [(localize "WZ_suicide_bad"), "PLAIN DOWN"];
} else {
player addEventHandler ["fired", {if (alive player) then { player SetDamage 1.1;};}];
cutText [format["Suicide in 10 Seconds"], "PLAIN DOWN"];
sleep 4;
cutText [format["Suicide in 6 Seconds"], "PLAIN DOWN"];
sleep 4;
cutText [format["Suicide in 2 Seconds"], "PLAIN DOWN"];
sleep 2;
cutText [format["Commited Suicide"], "PLAIN DOWN"];
canAbort = false;
player playmove "ActsPercMstpSnonWpstDnon_suicide1B";
sleep 8.4;
player fire _Secondary;
};