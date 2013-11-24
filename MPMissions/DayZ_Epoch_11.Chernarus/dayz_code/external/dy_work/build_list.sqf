
private["_isDestructable","_isSimulated","_disableSims","_objectSims","_objectSim","_requirements","_isStructure","_structure","_wallType","_removable","_buildlist","_build_townsrestrict"];
_buildlist = [
[[0,2,0,0,0,1, 0,0,2,0,0, 0,0,0,0,0,0], "Grave",							[[0,2.5,.1], [0,2,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],
[[1,1,4,0,0,0, 1,0,1,0,0, 0,0,0,0,0,0], "Base_WarfareBBarrier10x",		[[0,10,.6],  [0,10,0], 	0, 	true, true, true, false, false, true, false, true, true, false, false]],
[[4,1,4,0,0,0, 0,0,1,0,0, 0,0,0,0,0,0], "Land_HBarrier_large",			[[0,7,1], 	 [0,4,0], 	0, 	true, true, true, false, false, true, false, true, true, true, false]],
[[2,1,5,0,0,0, 2,0,1,0,0, 0,0,0,0,0,0], "Base_WarfareBBarrier10xTall", 	[[0,10,1],   [0,10,0], 	0, 	true, true, false, true, false, true, false, true, true, false, false]],
[[0,2,0,1,2,0, 2,2,0,1,0, 0,0,1,1,0,0], "Land_Fort_Watchtower",			[[0,10,2.2], [0,8,0], 	90, true, true, false, true, false, true, false, true, true, false, false]],
[[0,2,0,1,2,0, 2,2,0,1,0, 0,1,0,1,0,0], "Land_Fort_Watchtower_EP1",		[[0,10,2.2], [0,8,0], 	90, true, true, false, true, false, true, false, true, true, false, false]],
[[0,2,0,0,0,0, 1,1,0,1,0, 0,1,1,1,0,0], "WarfareBCamp",					[[0,12,1],   [0,10,0], 	0, 	true, true, false, true, false, true, false, true, true, false, false]],
[[0,2,0,0,2,0, 2,2,0,0,0, 0,1,1,2,0,0], "WarfareBDepot",					[[0,18,2],   [0,15,0], 	90, true, true, false, true, false, true, false, true, true, false, false]],
[[0,0,1,1,2,0, 0,1,0,0,0, 0,0,0,0,1,0], "Land_fortified_nest_small",	 	[[0,7,1], 	 [0,3,0], 	90, true, true, true, false, false, true, false, true, false, true, false]],
[[0,0,0,2,3,0, 0,2,0,0,2, 0,0,0,1,2,0], "Land_fortified_nest_big", 		[[0,12,1],   [2,8,0], 	180,true, true, false, true, false, true, false, true, true, false, false]],
[[0,0,0,4,4,0, 0,0,0,2,0, 0,0,0,0,0,0], "Land_prebehlavka",				[[0,6,.7], 	 [0,3,0], 	90, true, false, false, false, false, true, false, true, false, true, false]],
[[0,3,0,3,2,0, 0,0,0,0,1, 0,0,0,0,0,0], "Land_fort_rampart_EP1", 		 	[[0,7,.2],   [0,8,0], 	0, 	true, true, true, false, false, true, false, true, false, true, false]],
[[0,3,0,2,3,0, 0,0,0,0,1, 0,0,0,0,0,0], "Land_ConcreteRamp", 	   	        [[0,7,2.6],  [0,5,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],
[[1,0,0,0,0,0, 0,0,1,0,2, 0,0,0,0,0,0], "Misc_cargo_cont_small_EP1",	  	[[0,5,1.3],  [0,4,0], 	90, true, false, true, false, false, true, false, true, true, true, false]],
[[2,1,0,0,0,0, 0,0,2,0,4, 0,0,0,0,0,0], "Ins_WarfareBConstructionSite", 	[[0,7,1.3],  [0,5,0], 	90, true, false, true, false, false, true, false, true, true, true, false]],
[[1,1,0,0,0,0, 0,0,2,0,4, 0,0,0,0,0,0], "Misc_Cargo1Bo_military",		  	[[0,7,1.3],  [0,5,0], 	90, true, false, true, false, false, true, false, true, true, true, false]],
[[1,2,0,0,0,0, 0,0,3,0,4, 1,0,0,0,0,0], "Land_Misc_Cargo2B",				[[0,7,2.6],  [0,5,0], 	90, true, false, false, true, false, true, false, true, true, true, false]],
[[1,1,0,0,0,0, 0,0,4,0,4, 1,0,0,0,0,0], "Land_Misc_Cargo2E",				[[0,7,2.6],  [0,5,0], 	90, true, false, false, true, false, true, false, true, true, true, false]],
[[0,1,2,0,0,0, 0,0,0,0,0, 0,0,0,0,0,0], "Land_BagFenceRound",			   	[[0,4,.5], 	 [0,2,0], 	180,true, true, false, false, false, true, false, true, false, true, false]],
[[0,1,4,1,1,0, 0,0,0,0,0, 0,0,0,0,0,0], "Land_fort_bagfence_long", 	   	[[0,4,.3],	 [0,2,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],
[[0,2,4,2,1,0, 0,0,0,0,0, 0,0,0,0,0,0], "Land_fort_bagfence_corner",	   	[[0,4,.5],	 [0,2,0], 	180,true, true, false, false, false, true, false, true, false, true, false]],
[[0,2,4,2,2,0, 0,0,0,0,0, 0,0,0,0,0,0], "Land_fort_bagfence_round", 	   	[[0,4,.5], 	 [0,2,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],
[[0,2,0,1,0,0, 0,0,1,1,0, 0,0,0,0,0,0], "Fence_Ind",						[[0,4,.7], 	 [0,2,0], 	0, 	true, false, false, false, false, true, false, true, true, true, false]],
[[0,4,0,2,0,0, 0,0,1,3,0, 0,0,0,0,0,0], "Fence_Ind_long",					[[0,5,.6],   [-4,1.5,0],0, 	true, false, true, false, false, true, false, true, true, true, false]], 
[[0,0,0,1,0,0, 0,0,0,2,1, 0,0,0,0,0,0], "Fence_corrugated_plate",			[[0,4,.6], 	 [0,3,0], 	0,	true, false, true, false, false, true, false, true, true, true, false]],
[[0,4,0,1,0,0, 0,0,0,1,0, 0,0,0,0,0,0], "Fort_RazorWire",					[[0,5,.8],   [0,4,0], 	0, 	true, false, false, false, false, true, false, true, false, true, false]],
[[2,0,0,0,0,0, 0,0,1,0,0, 0,0,0,0,0,0], "Hedgehog_DZ",  		        	[[0,5,.7],   [10,10,0], 0,  true, true, false, false, false, true, false, true, false, true, false]],
[[2,0,0,1,0,0, 0,0,2,0,0, 0,0,0,0,0,0], "Land_CncBlock",					[[0,3,.4], 	 [0,2,0], 	0, 	true, false, false, false, false, true, false, true, false, true, false]],
[[4,0,0,1,0,0, 0,0,2,0,0, 0,0,0,0,0,0], "Hhedgehog_concrete",				[[0,5,.6], 	 [0,4,0], 	0, 	true, true, true, false, false, true, false, true, false, true, false]],
[[0,0,0,3,0,0, 0,0,0,3,0, 0,0,0,0,0,0], "ZavoraAnim", 					[[0,5,4.0],  [0,5,0], 	0, 	true, false, false, false, false, true, false, true, false, true, false]],
[[0,1,0,0,1,0, 0,0,0,1,0, 0,0,0,0,0,0], "Land_pumpa",						[[0,3,.4], 	 [0,3,0], 	0, 	true, true, true, false, false, true, false, true, false, true, false]],
[[0,3,0,0,0,0, 0,0,0,2,4, 0,0,0,2,0,1], "Land_Ind_Garage01",  		    [[0,18,.7],  [15,15,0], 0, 	true, true, false, true, false, true, false, true, false, true, false]],
[[0,2,0,0,0,0, 0,0,0,0,6, 0,0,0,2,0,0], "Land_Ind_SawMillPen",  	    	[[0,18,.7],  [15,15,0], 0, 	true, true, false, true, false, true, false, true, false, true, false]],
[[0,2,0,0,0,0, 0,0,0,0,6, 4,0,0,0,0,0], "Land_hut_old02",  		        [[0,18,.7],  [15,15,0], 0, 	true, true, false, true, false, true, false, true, false, true, false]],
[[0,0,0,0,0,0, 0,0,0,0,4, 0,0,0,4,0,4], "Land_HouseV_1I4",  		    	[[0,18,.7],  [15,15,0], 0, 	true, true, false, true, false, true, false, true, false, true, false]],
[[0,3,0,0,0,0, 0,0,0,4,0, 0,1,1,0,3,0], "Land_tent_east", 				[[0,8,1.7],  [0,6,0], 	0, 	true, false, true, false, false, true, false, true, false, true, false]],
[[0,4,0,0,0,0, 0,0,0,4,0, 0,0,3,0,0,0], "Land_CamoNetB_EAST",				[[0,10,2], 	 [0,10,0], 	0, 	true, false, false, true, false, true, false, true, false, true, false]],
[[0,4,0,0,0,0, 0,0,0,4,0, 0,0,3,0,0,0], "Land_CamoNetB_NATO", 			[[0,10,2], 	 [0,10,0], 	0, 	true, false, false, true, false, true, false, true, false, true, false]],
[[0,2,0,0,0,0, 0,0,0,4,0, 0,0,1,0,0,0], "Land_CamoNetVar_EAST",		    [[0,10,1.2], [0,7,0], 	0, 	true, false, false, false, false, true, false, true, false, true, false]],
[[0,2,0,0,0,0, 0,0,0,4,0, 0,0,1,0,0,0], "Land_CamoNetVar_NATO", 			[[0,10,1.2], [0,7,0], 	0, 	true, false, false, false, false, true, false, true, false, true, false]],
[[0,3,0,0,0,0, 0,0,0,4,0, 0,0,2,0,0,0], "Land_CamoNet_EAST",				[[0,8,1.2],  [0,7,0], 	0, 	true, false, true, false, false, true, false, true, false, true, false]],
[[0,3,0,0,0,0, 0,0,0,4,0, 0,0,2,0,0,0], "Land_CamoNet_NATO",				[[0,8,1.2],  [0,7,0], 	0, 	true, false, true, false, false, true, false, true, false, true, false]],
[[0,4,0,0,0,0, 0,0,0,4,0, 0,3,0,0,0,0], "Land_CamoNetB_EAST_EP1",			[[0,10,2], 	 [0,10,0], 	0, 	true, false, false, true, false, true, false, true, false, true, false]],
[[0,4,0,0,0,0, 0,0,0,4,0, 0,3,0,0,0,0], "Land_CamoNetB_NATO_EP1", 		[[0,10,2], 	 [0,10,0], 	0, 	true, false, false, true, false, true, false, true, false, true, false]],
[[0,2,0,0,0,0, 0,0,0,4,0, 0,1,0,0,0,0], "Land_CamoNetVar_EAST_EP1",		[[0,10,1.2], [0,7,0], 	0, 	true, false, false, false, false, true, false, true, false, true, false]],
[[0,2,0,0,0,0, 0,0,0,4,0, 0,1,0,0,0,0], "Land_CamoNetVar_NATO_EP1", 		[[0,10,1.2], [0,7,0], 	0, 	true, false, false, false, false, true, false, true, false, true, false]],
[[0,3,0,0,0,0, 0,0,0,4,0, 0,2,0,0,0,0], "Land_CamoNet_EAST_EP1",			[[0,8,1.2],  [0,7,0], 	0, 	true, false, true, false, false, true, false, true, false, true, false]],
[[0,3,0,0,0,0, 0,0,0,4,0, 0,2,0,0,0,0], "Land_CamoNet_NATO_EP1",			[[0,8,1.2],  [0,7,0], 	0, 	true, false, true, false, false, true, false, true, false, true, false]], 
[[0,3,0,0,0,0, 0,0,0,5,0, 0,2,2,0,0,0], "vehicleShelter_cdf",  	    	[[0,18,.7],  [15,15,0], 0, 	true, true, false, true, false, true, false, true, false, true, false]],
[[6,0,0,0,0,0, 0,0,2,0,0, 0,0,0,0,0,0], "RampConcrete",  		   	        [[0,5,4.0],  [0,7,0],   0, 	true, true, false, true, false, true, false, true, false, true, false]],
[[0,0,0,4,4,0, 0,0,0,0,0, 0,0,0,0,0,0], "Land_Ind_Timbers",  		    	[[0,5,4.0],  [0,7,0],   0, 	true, true, false, true, false, true, false, true, false, true, false]],
[[0,0,0,4,3,0, 0,0,0,0,0, 0,0,0,0,0,0], "Land_Ind_BoardsPack1",  	    	[[0,4,.5], 	 [0,2,0],   0, 	true, true, false, true, false, true, false, true, false, true, false]],
[[0,0,0,0,0,0, 0,0,0,0,0, 2,0,0,8,0,0], "Land_Barn_W_01",     	    	[[0,18,.7],  [15,15,0], 0, 	true, true, false, true, false, true, false, true, false, true, false]],
[[0,0,0,0,2,0, 0,0,0,0,2, 0,0,0,5,0,0], "Land_stodola_open",  	        [[0,18,.7],  [15,15,0], 0, 	true, true, false, true, false, true, false, true, false, true, false]],
[[0,0,0,0,0,0, 0,0,2,4,0, 0,0,0,0,0,0], "Land_vez",  		                [[0,18,.7],  [15,15,0], 0, 	true, true, false, true, false, true, false, true, false, true, false]],
[[2,0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0,0], "HeliHCivil",  		            [[0,5,4.0],  [0,15,0],  0, 	true, true, false, true, false, true, false, true, false, true, false]],
[[0,1,0,0,0,0, 0,0,1,8,0, 0,0,0,0,0,0], "Land_Misc_Scaffolding",          [[0,5,4.0],  [0,15,0],  0, 	true, true, false, true, false, true, false, true, false, true, false]],
[[4,0,0,0,0,0, 0,0,4,0,0, 1,0,0,0,0,0], "Land_Ind_TankSmall", 	   	    [[0,7,2.6],  [0,5,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],
[[0,0,0,3,4,0, 0,0,0,2,0, 0,0,0,0,0,0], "CanvasHut_DZ", 	   	            [[0,7,2.6],  [0,5,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],
[[3,0,0,0,0,0, 0,0,0,2,0, 1,0,0,0,0,0], "Land_Misc_ConcPipeline_EP1", 	[[0,7,2.6],  [0,5,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],
[[0,0,0,0,5,0, 0,0,0,0,0, 0,0,0,3,0,0], "Land_Misc_deerstand", 	   	    [[0,7,2.6],  [0,5,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],
[[2,0,0,0,0,0, 0,0,0,5,0, 0,0,0,0,0,0], "Land_plot_green_vrata", 	   	    [[0,7,2.6],  [0,5,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],
[[1,0,0,0,0,0, 0,0,1,4,0, 0,0,0,0,0,0], "Land_plot_rust_vrata", 	   	    [[0,7,2.6],  [0,5,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]],
[[0,0,0,0,8,0, 0,0,0,0,0, 0,0,0,1,0,0], "LightPole_DZ", 	   	            [[0,7,2.6],  [0,5,0], 	0, 	true, true, false, false, false, true, false, true, false, true, false]]
];
for "_i" from 0 to ((count _buildlist) - 1) do
{
	_removable = (_buildlist select _i) select _i - _i + 1;
	if (_removable != "Grave") then { 
	allremovables set [count allremovables, _removable];
	};
};
for "_i" from 0 to ((count _buildlist) - 1) do
{
	_classname = (_buildlist select _i) select _i - _i + 1;
	allbuildables_class set [count allbuildables_class, _classname];
};
/*
*** Remember that the last element in ANY array does not get comma ***
Notice lines 47 and 62
*/
_build_townsrestrict = [
["Chernogorsk", 600],
["Elektrozavodsk", 600],
["Berezino", 600],
["Zelenogorsk", 300],
["Krasnostav", 250],
["Stary Sobor", 275],
["Solnichniy", 200],
["Balota", 200],
["Kamenka", 200],
["Kamyshovo", 200],
["Komarovo", 200],
["Nizhnoye", 200],
["Prigorodki", 200],
["Bor", 200],
["Dolina", 250],
["Drozhino", 200],
["Dubrovka", 250],
["Gorka", 250],
["Grishino", 275],
["Guglovo", 200],
["Gvozdno", 200],
["Kabanino", 250],
["Khelm", 250],
["Kozlovka", 200],
["Lopatino", 275],
["Mogilevka", 200],
["Msta", 250],
["Myshkino", 250],
["Nadezhdino", 250],
["Novy Sobor", 255],
["Orlovets", 220],
["Olsha", 75],
["Pavlovo", 250],
["Petrovka", 250],
["Pogorevka", 250],
["Polana", 200],
["Pulkovo", 200],
["Pusta", 250],
["Pustoshka", 300],
["Rogovo", 250],
["Shakhovka", 250],
["Sosnovka", 250],
["Staroye", 300],
["Tulga", 250],
["Vybor", 300],
["Vyshnoye", 275]
];
allbuildables = _buildlist;
allbuild_notowns = _build_townsrestrict;
	
		for "_i" from 0 to ((count _buildlist) - 1) do
		{
			_requirements = (_buildlist select _i) select _i - _i + 2;
			_isStructure = _requirements select 11;
			_structure = (_buildlist select _i) select _i - _i + 1;
			if (_isStructure) then {
			structures set [count structures, _structure];
			};
		};
	
	
	for "_i" from 0 to ((count _buildlist) - 1) do
	{
		_wallType = (_buildlist select _i) select _i - _i + 1;
		
		if (_walltype != "Grave" && _walltype != "Infostand_2_EP1" && _walltype != "Land_pumpa" && _walltype != "ZavoraAnim") then {
		wallarray set [count wallarray, _wallType];
		};
	};
	
	_objectSims = [];
	for "_i" from 0 to ((count _buildlist) - 1) do
	{
		_requirements = (_buildlist select _i) select _i - _i + 2;
		_isSimulated = _requirements select 12;
		_objectSim = (_buildlist select _i) select _i - _i + 1;
		
		if (!_isSimulated) then {
		_objectSims set [count _objectSims, _objectSim];
		};
	};
	
	_disableSims = nearestObjects [player, _objectSims, 30000];
	{
		_x enableSimulation false;
	} foreach _disableSims;