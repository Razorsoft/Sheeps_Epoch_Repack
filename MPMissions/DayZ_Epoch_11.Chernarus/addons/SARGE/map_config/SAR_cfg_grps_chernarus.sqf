if (SAR_dynamic_spawning) then {
diag_log format["SAR_AI: Dynamic spawning definition / adjustments started"];
[["max_grps","rnd_grps","max_p_grp"],[[0,1,2],[0,100,100],[0,2,1]],"SAR_area_0_0"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[1,0,2],[80,0,80],[2,0,3]],"SAR_area_1_0"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[2,0,3],[75,0,75],[4,0,4]],"SAR_area_2_0"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[1,0,3],[50,0,50],[4,0,2]],"SAR_area_3_0"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[2,0,3],[50,0,50],[4,0,4]],"SAR_area_4_0"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[0,0,1],[0,0,80],[0,0,3]],"SAR_area_5_0"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[0,0,1],[0,0,80],[0,0,3]],"SAR_area_5_1"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[1,0,0],[80,0,0],[2,0,0]],"SAR_area_5_2"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[0,0,3],[0,0,75],[0,0,3]],"SAR_area_5_3"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[1,0,1],[75,0,75],[3,0,3]],"SAR_area_5_4"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[0,3,1],[0,50,75],[0,2,4]],"SAR_area_5_5"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[0,2,1],[0,50,75],[0,2,4]],"SAR_area_1_4"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[3,0,3],[50,0,50],[3,0,3]],"SAR_area_2_2"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[2,0,0],[75,0,0],[3,0,0]],"SAR_area_2_4"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[1,0,0],[75,0,0],[3,0,0]],"SAR_area_0_5"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[2,0,0],[75,0,0],[3,0,0]],"SAR_area_1_5"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[2,0,0],[75,0,0],[3,0,0]],"SAR_area_2_5"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[2,0,0],[75,0,0],[3,0,0]],"SAR_area_3_5"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[0,1,1],[0,75,75],[0,4,2]],"SAR_area_4_5"] call SAR_AI_mon_upd; 
[["max_grps","rnd_grps","max_p_grp"],[[1,0,0],[100,0,0],[6,0,0]],"SAR_area_0_3"] call SAR_AI_mon_upd; 
diag_log format["SAR_AI: Dynamic spawning definition / adjustments finished"];
};
diag_log format["SAR_AI: Static spawning area definition started"];
_this = createMarker ["SAR_marker_helipatrol_southcoast", [7997.2837, 2687.6707]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [6500, 1200];
SAR_marker_helipatrol_southcoast = _this;
_this = createMarker ["SAR_marker_helipatrol_eastcoast", [13304.196, 8220.9795]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [1200, 6000];
SAR_marker_helipatrol_eastcoast = _this;
_this = createMarker ["SAR_marker_helipatrol_nwaf", [4525.3335, 10292.299]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [1500, 500];
_this setMarkerDir 59.354115;
SAR_marker_helipatrol_nwaf = _this;
_this = createMarker ["SAR_marker_helipatrol_neaf", [12034.16, 12725.376, 0]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [1000, 600];
SAR_marker_helipatrol_neaf = _this;
_this = createMarker ["SAR_marker_DEBUG_veh", [1951.4304, 11905.569]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [300, 1000];
_this setMarkerDir -19.085985;
SAR_marker_DEBUG_veh = _this;
_this = createMarker ["SAR_marker_DEBUG_devilscastle", [6913.47,11437.2,0.001]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [10, 10];
SAR_marker_DEBUG_devilscastle = _this;
diag_log format["SAR_AI: Static spawning area definition finished"];
diag_log format["SAR_AI: Static Spawning for Helicopter patrols started"];
[SAR_marker_helipatrol_nwaf,1,true] call SAR_AI_heli;
[SAR_marker_helipatrol_neaf,1,true] call SAR_AI_heli;
[SAR_marker_helipatrol_southcoast,1,true] call SAR_AI_heli;
[SAR_marker_helipatrol_southcoast,1,true] call SAR_AI_heli;
[SAR_marker_helipatrol_eastcoast,1,true] call SAR_AI_heli;
[SAR_marker_helipatrol_eastcoast,1,true] call SAR_AI_heli;
[SAR_marker_DEBUG_veh,1,true,30] call SAR_AI_heli;
[SAR_marker_DEBUG_veh,1,true,30] call SAR_AI_heli;
[SAR_marker_DEBUG_veh,3,true,30] call SAR_AI_heli;
[SAR_marker_DEBUG_veh,3,true,30] call SAR_AI_heli;
diag_log format["SAR_AI: Static Spawning for Helicopter patrols finished"];
diag_log format["SAR_AI: Static Spawning for infantry patrols started"];
[SAR_marker_DEBUG_devilscastle,1,0,6,"fortify",true] call SAR_AI;
[SAR_marker_DEBUG_veh,1,0,9,"patrol",true] call SAR_AI;
[SAR_marker_DEBUG_veh,2,0,9,"patrol",true] call SAR_AI;
[SAR_marker_DEBUG_veh,3,0,9,"patrol",true] call SAR_AI;
[SAR_marker_DEBUG_veh,3,0,9,"patrol",true] call SAR_AI;
diag_log format["SAR_AI: Static Spawning for infantry patrols finished"];
diag_log format["SAR_AI: Static Spawning for vehicle patrols started"];
[
SAR_marker_DEBUG_veh,   
1,  
["LandRover_CZ_EP1","M1030","M1030","LandRover_CZ_EP1"],
[[1,1,1],[0,1,1],[0,1,1],[0,1,1]],  
true,   
10
] call SAR_AI_land;
[
SAR_marker_DEBUG_veh,   
3,  
["M1030","M1030","M1030","M1030"],  
[[1,1,0],[0,1,1],[0,1,1],[0,1,1]],  
true,   
60  
] call SAR_AI_land;
[
SAR_marker_DEBUG_veh, 
2,  
["M1030"],  
[[1,1,0]],  
true,   
60  
] call SAR_AI_land;
diag_log format["SAR_AI: Static Spawning for vehicle patrols finished"];
