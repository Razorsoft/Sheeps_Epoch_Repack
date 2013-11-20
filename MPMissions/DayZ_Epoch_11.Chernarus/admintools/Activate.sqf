waituntil {!alive player ; !isnull (finddisplay 46)};
	if ((getPlayerUID player) in ["120958982","4d96f3dbb0c27d7ce2ee50d300ef1f73"]) then {
	sleep 5;
	player addaction [("<t color=""#0074E8"">" + ("Tools Menu") +"</t>"),"admintools\Eexcute.sqf","",5,false,true,"",""];
};