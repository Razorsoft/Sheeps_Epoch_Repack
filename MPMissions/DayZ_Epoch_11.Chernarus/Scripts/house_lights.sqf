
while {alive player}
do
{
if(daytime<6||daytime>17)
then {
private ["_strMessage","_brightness","_objLightPoint","_awayx","_awayy","_lp","_test","_hcount","_animlightpoint","_switching","_switchpercent"];
_range=600;
_switchpercent = 42;
_objHouse = nearestObjects [player, ["House","Land_HouseV_1I2"], _range];
_houseColour=[1, 1, 1];
_objIndustrial = nearestObjects [player, ["Land_Shed_wooden","Land_Ind_Garage01","Land_Ind_Workshop01_01","Land_Ind_Workshop01_02","Land_Ind_Workshop01_03","Land_Ind_Workshop01_04","Land_Ind_Workshop01_box","Land_Ind_Workshop01_L","Land_stodola_old_open","Land_stodola_open"], _range];
_indColour=[1, 1, 0];
_objMisc = nearestObjects [player, ["Land_A_FuelStation_Build","Land_Hlidac_budka","Land_A_FuelStation_Shed","Land_Mil_Barracks","Land_Mil_Barracks_L","Land_Mil_Barracks_i","Land_Mil_ControlTower","Land_a_stationhouse","Land_sara_hasic_zbroj","Land_sara_domek_zluty","Land_pumpa"], _range];
_miscColour=[1, 0, 0];
 
{
_switching = random 100;
[_miscColour,0.01,[3, 3, 3],[_x],0] call fnc_lightpoint;
} forEach _objMisc;
{
_switching = random 100;
[_indColour,0.01,[3, 3, 3],[_x],0] call fnc_lightpoint;
} forEach _objIndustrial;
{
_switching = random 100;
_switching2 = random 100;
_lightstate = _x animationPhase "Lights_1";
if(_lightstate==0) then
{
[[_x]] call fnc_lightson;
};
[_houseColour,0.01,[5, 5, 5],[_x],1] call fnc_lightpoint;
 
if(_lightstate==1) then
{
[[_x]] call fnc_lightfail;
};
} forEach _objHouse;
  
fnc_lightson={
_building = _this select 0 select 0;
if(_switching <_switchpercent) then
{
_building animate ["Lights_1",1];
if(_switching2 <_switchpercent) then
{
_building animate ["Lights_2",1];
};
sleep 0.1;
};
};
fnc_lightfail={
_building = _this select 0 select 0;
if(_switching>_switchpercent)then
{
_animlightpoint = nearestObject [_building, "#lightpoint"];
for "_s" from 1 to 5 do {
if(_s%2==0)then
{
_brightness=0;
for "_l" from 1 to 2 do {
_building animate [format ["Lights_%1",_l],0];
};
}
else
{
_brightness=0.01;
for "_l" from 1 to 2 do {
_building animate [format ["Lights_%1",_l],1];
};
};
_animlightpoint setLightBrightness _brightness;
_sleeptime=(random 100)/800;
sleep _sleeptime;
};
for "_l" from 1 to 2 do {
_building animate [format ["Lights_%1",_l],0];
};
_animlightpoint setLightBrightness 0;
sleep 6;
};
};
fnc_lightpoint={
_building = _this select 3 select 0;
_doCheck =  _this select 4;
_runfunc=true;
if(_doCheck==1&&_building animationPhase "Lights_1"<1)then{
_runfunc=false;
};
if(_runfunc)then
{
_lightColour = _this select 0;
_lightBrightness = _this select 1;
_lightAmbient = _this select 2;
_objLightPoint = nearestObject [_building, "#lightpoint"];
_xpos = getPos _building select 0;
_ypos = getPos _building select 1;
_lightposX = getPos _objLightPoint select 0;
_lightposY = getPos _objLightPoint select 1;
_awayx=_xpos-_lightposX;
_awayy=_ypos-_lightposY;
if((_awayx>1 or _awayx<-1)or(_awayy>1 or _awayy<-1))then
{
if(_switching<_switchpercent)then
{
_lp = "#lightpoint" createVehicle [0,0,0];
_lp setLightColor _lightColour;
_lp setLightBrightness _lightBrightness;
_lp setLightAmbient _lightAmbient;
_lp setPos [getPos _building select 0,getPos _building select 1,-3];
_lp setDir getDir _building;
};
}
else
{
_objLightPoint setLightColor _lightColour;
_objLightPoint setLightBrightness _lightBrightness;
_objLightPoint setLightAmbient _lightAmbient;
};
};
};
};
}