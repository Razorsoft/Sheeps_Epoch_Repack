

















/* reconfiguring the properties of the grid (keep in mind the grid has default settings, but these you should overwrite where needed).

IMPORTANT: The grid squares are named like : SAR_area_0_0

where the first 0 is the x counter, and the second 0 the y counter.

So to adress the bottom left square in the grid, you use SAR_area_0_0.
The square above that one would be: SAR_area_0_1
the square one to the right of the bottom left square is SAR_area_1_0

You want to change the number arrays in the below lines:

The order for these numbers is always [BANDIT, SURVIVOR, SOLDIER]

Lets take an example for Chernarus
 

_check = [["max_grps","rnd_grps","max_p_grp"],[[0,1,2],[0,75,100],[0,4,3]],"SAR_area_0_0"] call SAR_AI_mon_upd; 
  
 [[0,1,2],[0,75,100],[0,4,3]]

the first set of numbers : 0,1,2
stands for
0 bandit groups
1 soldier group
2 surivors groups
thats the max that can spawn in this grid

the second set of numbers : 0,75,100
that means: 
0% probability to spawn bandit groups
75% for soldiers
100% for survivors

the last set of numbers : 0,4,3
thats the maximum number of ppl in the group (plus 1 leader)
0 bandits
max 4 (+1 leader) soldiers
max 3 (+1 leader) survivors
this number is randomized

 
 */





 
 
 
 
 
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,2],[45,0,45],[0,0,0]],"SAR_area_0_0"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,2],[45,0,45],[0,0,0]],"SAR_area_1_0"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[4,3,4],[75,70,85],[2,2,1]],"SAR_area_2_0"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,1],[20,20,20],[0,0,1]],"SAR_area_3_0"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[0,1,1],[0,25,25],[0,0,1]],"SAR_area_4_0"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,2],[25,0,45],[0,0,0]],"SAR_area_5_0"] call SAR_AI_mon_upd;  

_check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,1],[25,0,35],[1,0,1]],"SAR_area_0_1"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_1_1"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,2,2],[35,40,45],[2,1,2]],"SAR_area_2_1"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,2],[15,0,35],[1,0,1]],"SAR_area_3_1"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,1],[35,0,35],[0,0,1]],"SAR_area_4_1"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,1],[35,0,35],[1,0,1]],"SAR_area_5_1"] call SAR_AI_mon_upd;  

_check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_0_2"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,0,1],[45,0,35],[1,0,1]],"SAR_area_1_2"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,1,1],[35,30,35],[1,1,1]],"SAR_area_2_2"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[3,2,2],[75,70,65],[2,2,2]],"SAR_area_3_2"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,2,2],[45,50,55],[0,1,1]],"SAR_area_4_2"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_5_2"] call SAR_AI_mon_upd; 	

_check = [["max_grps","rnd_grps","max_p_grp"],[[2,1,2],[45,30,45],[0,0,1]],"SAR_area_0_3"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,2,2],[55,60,55],[2,1,1]],"SAR_area_1_3"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,2,2],[50,50,50],[2,2,1]],"SAR_area_2_3"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,1],[65,60,75],[0,1,1]],"SAR_area_3_3"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[4,2,2],[75,60,55],[2,1,2]],"SAR_area_4_3"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_5_3"] call SAR_AI_mon_upd; 	

_check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_0_4"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,2,1],[75,75,75],[1,1,1]],"SAR_area_1_4"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,1,2],[65,50,55],[1,1,2]],"SAR_area_2_4"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,1,2],[75,60,55],[1,2,1]],"SAR_area_3_4"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[5,3,2],[75,70,65],[1,1,1]],"SAR_area_4_4"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[3,2,0],[55,50,0],[2,1,0]],"SAR_area_5_4"] call SAR_AI_mon_upd; 	

_check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_0_5"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[3,2,1],[75,70,45],[2,2,1]],"SAR_area_1_5"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,2,1],[75,70,60],[0,0,0]],"SAR_area_2_5"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_3_5"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,0],[50,50,0],[0,0,0]],"SAR_area_4_5"] call SAR_AI_mon_upd; 	
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,1,1],[45,40,35],[2,1,0]],"SAR_area_5_5"] call SAR_AI_mon_upd; 	


 _this = createMarker ["SAR_patrol_prison", [3024.6147, 7969.0239]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [1500, 1050];
SAR_marker_helipatrol_prison = _this;

 _this = createMarker ["SAR_patrol_maruko_airport", [6451.5801, 6991.4985]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [1000, 1500];
SAR_marker_helipatrol_maruko_airport = _this;

 _this = createMarker ["SAR_patrol_fob_eddie", [3058.3813, 6605.2446]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [1500, 1500];
SAR_marker_helipatrol_fob_eddie = _this;

 _this = createMarker ["SAR_patrol_calamar", [4261.3984, 1487.6489]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [2000, 2000];
SAR_marker_helipatrol_calamar = _this;

 _this = createMarker ["SAR_patrol_mainland", [3280.0093, 3431.8176]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [4500, 4500];
SAR_marker_helipatrol_mainland = _this;













diag_log format["SAR_AI: Area & Trigger definition finalized"];
diag_log format["SAR_AI: Static Spawning for Helicopter patrols started"];











[SAR_marker_helipatrol_prison,floor(random 2)+1] call SAR_AI_heli;
[SAR_marker_helipatrol_maruko_airport,floor(random 2)+1] call SAR_AI_heli;
[SAR_marker_helipatrol_fob_eddie,floor(random 2)+1] call SAR_AI_heli;
[SAR_marker_helipatrol_calamar,floor(random 2)+1] call SAR_AI_heli;
[SAR_marker_helipatrol_mainland,floor(random 2)+1] call SAR_AI_heli;

diag_log format["SAR_AI: Static Spawning for Helicopter patrols finished"];



































diag_log format["SAR_AI: Static Spawning for infantry patrols finished"];

