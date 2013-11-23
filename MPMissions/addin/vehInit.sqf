
if (isServer) exitwith {};
waitUntil {sleep 2; count vehicles > 1};
sleep 10;
{
If (typeOf _x in ["UH1H_DZ","Mi17_DZ"]) then
{
nul = _x addAction [("<t color=""#00a6eb"">Lift cargo</t>"),"addin\liftCargo.sqf",["pickup"],10,false,true,"","driver _target == player"];
};
If (typeOf _x in ["Old_bike_TK_CIV_EP1","VolhaLimo_TK_CIV_EP1","Volha_2_TK_CIV_EP1","Volha_1_TK_CIV_EP1","car_sedan","car_hatchback","Lada2_TK_CIV_EP1","Lada1_TK_CIV_EP1","Skoda","Lada1","Lada2","LadaLM","SkodaRed","SkodaGreen","SkodaBlue","datsun1_civil_3_open","datsun1_civil_1_open","hilux1_civil_1_open","hilux1_civil_3_open_EP1"]) then
{
nul = _x addAction ["Climb on back","addin\vehClimb.sqf",[],-5,false,true,"","(vehicle player != _target)"];
};
} forEach (vehicles);