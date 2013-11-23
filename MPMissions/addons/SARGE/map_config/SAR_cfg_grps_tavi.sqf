

















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





 
 
    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,2,1],[0,75,100],[0,4,3]],"SAR_area_0_0"] call SAR_AI_mon_upd; 

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,1],[0,0,80],[0,0,3]],"SAR_area_1_0"] call SAR_AI_mon_upd; 

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[2,0,3],[75,0,75],[4,0,4]],"SAR_area_2_0"] call SAR_AI_mon_upd; 

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,3],[50,0,50],[4,0,2]],"SAR_area_3_0"] call SAR_AI_mon_upd; 

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_4_0"] call SAR_AI_mon_upd; 

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_5_0"] call SAR_AI_mon_upd; 

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,1],[0,0,0],[0,0,0]],"SAR_area_0_1"] call SAR_AI_mon_upd; 

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,2],[80,0,60],[2,0,2]],"SAR_area_1_1"] call SAR_AI_mon_upd; 

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[3,1,3],[60,50,75],[2,3,3]],"SAR_area_2_1"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_3_1"] call SAR_AI_mon_upd;		

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,1],[75,50,75],[3,2,3]],"SAR_area_4_1"] call SAR_AI_mon_upd; 

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,3,3],[0,50,75],[0,2,4]],"SAR_area_5_1"] call SAR_AI_mon_upd; 

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[2,2,1],[90,50,75],[4,2,4]],"SAR_area_0_2"] call SAR_AI_mon_upd; 

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[3,1,3],[50,50,50],[3,3,3]],"SAR_area_1_2"] call SAR_AI_mon_upd; 

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[2,3,1],[75,50,75],[3,4,4]],"SAR_area_2_2"] call SAR_AI_mon_upd; 

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[1,2,3],[75,100,75],[3,3,2]],"SAR_area_3_2"] call SAR_AI_mon_upd; 

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,2],[0,0,100],[0,0,5]],"SAR_area_4_2"] call SAR_AI_mon_upd; 

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,1,2],[0,75,100],[0,5,4]],"SAR_area_5_2"] call SAR_AI_mon_upd;
    
    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_0_3"] call SAR_AI_mon_upd;		

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[2,0,1],[75,0,50],[3,0,3]],"SAR_area_1_3"] call SAR_AI_mon_upd; 

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,3,1],[0,75,75],[0,3,6]],"SAR_area_2_3"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[3,1,1],[75,75,75],[3,4,2]],"SAR_area_3_3"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[1,3,1],[20,75,100],[4,4,2]],"SAR_area_4_3"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,1],[75,75,75],[2,4,2]],"SAR_area_5_3"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,1],[75,75,75],[2,4,2]],"SAR_area_0_4"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_1_4"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_2_4"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[1,2,2],[50,75,75],[4,4,2]],"SAR_area_3_4"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,1],[50,75,75],[3,4,2]],"SAR_area_4_4"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,1],[50,75,75],[4,4,2]],"SAR_area_5_4"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_0_5"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_1_5"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,3,1],[0,75,75],[0,4,3]],"SAR_area_2_5"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[2,1,1],[50,75,75],[5,4,2]],"SAR_area_3_5"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,1],[75,75,75],[2,4,2]],"SAR_area_4_5"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_5_5"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_0_6"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_1_6"] call SAR_AI_mon_upd;
    
    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[3,2,1],[100,75,75],[2,4,5]],"SAR_area_2_6"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[2,2,2],[80,75,75],[3,4,2]],"SAR_area_3_6"] call SAR_AI_mon_upd;

    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[2,1,2],[75,75,75],[3,4,4]],"SAR_area_4_6"] call SAR_AI_mon_upd;
    
    
    _check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_5_6"] call SAR_AI_mon_upd;		

 
 







    
    _this = createMarker ["SAR_patrol_sabina", [14894.9, 11081.3]];
    _this setMarkerShape "RECTANGLE";
    _this setMarkeralpha 0;
    _this setMarkerType "Flag";
    _this setMarkerBrush "Solid";
    _this setMarkerSize [1000, 4500];
    SAR_marker_helipatrol_sabina = _this;

    
    _this = createMarker ["SAR_patrol_lyepestok", [11579.5, 15413.4]];
    _this setMarkerShape "RECTANGLE";
    _this setMarkeralpha 0;
    _this setMarkerType "Flag";
    _this setMarkerBrush "Solid";
    _this setMarkerSize [400, 400];
    SAR_marker_helipatrol_lyepestok = _this;

    
    _this = createMarker ["SAR_patrol_nwaf", [10567, 18429.6]];
    _this setMarkerShape "RECTANGLE";
    _this setMarkeralpha 0;
    _this setMarkerType "Flag";
    _this setMarkerBrush "Solid";
    _this setMarkerSize [800, 1000];
    SAR_marker_helipatrol_nwaf = _this;

    
    _this = createMarker ["SAR_patrol_dubovo", [16540.9, 12674.3]];
    _this setMarkerShape "RECTANGLE";
    _this setMarkeralpha 0;
    _this setMarkerType "Flag";
    _this setMarkerBrush "Solid";
    _this setMarkerSize [500, 5000];
    SAR_marker_helipatrol_dubovo = _this;


    
    _this = createMarker ["SAR_patrol_kraz", [8482.28, 8101.42]];
    _this setMarkerShape "RECTANGLE";
    _this setMarkeralpha 0;
    _this setMarkerType "Flag";
    _this setMarkerBrush "Solid";
    _this setMarkerSize [500, 1700];
    _this setMarkerDir 262.10;
    SAR_marker_helipatrol_kraz = _this;
    
    
    
    _this = createMarker ["SAR_patrol_branibor", [7206.91, 4933.56]];
    _this setMarkerShape "RECTANGLE";
    _this setMarkeralpha 0;
    _this setMarkerType "Flag";
    _this setMarkerBrush "Solid";
    _this setMarkerSize [400, 5000];
    _this setMarkerDir 127.30;
    SAR_marker_helipatrol_branibor = _this;






diag_log format["SAR_AI: Area & Trigger definition finalized"];
diag_log format["SAR_AI: Static Spawning for Helicopter patrols started"];









    
    [SAR_marker_helipatrol_sabina,1] call SAR_AI_heli;

    
    [SAR_marker_helipatrol_lyepestok,1] call SAR_AI_heli;

    
    [SAR_marker_helipatrol_nwaf,1] call SAR_AI_heli;
    
    
    [SAR_marker_helipatrol_dubovo,1] call SAR_AI_heli;

    
    [SAR_marker_helipatrol_kraz,1] call SAR_AI_heli;
    
    
    [SAR_marker_helipatrol_branibor,1] call SAR_AI_heli;
    

    

    
    
diag_log format["SAR_AI: Static Spawning for Helicopter patrols finished"];





























    






diag_log format["SAR_AI: Static Spawning for infantry patrols finished"];

