

















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



 
 
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,1,2],[50,75,100],[2,3,3]],"SAR_area_0_0"] call SAR_AI_mon_upd; 

 
_check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_0_3"] call SAR_AI_mon_upd; 


_check = [["max_grps","rnd_grps","max_p_grp"],[[3,1,1],[80,50,75],[2,2,3]],"SAR_area_1_0"] call SAR_AI_mon_upd; 


_check = [["max_grps","rnd_grps","max_p_grp"],[[2,0,2],[70,0,70],[3,0,3]],"SAR_area_2_0"] call SAR_AI_mon_upd; 


_check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,3],[30,20,60],[2,2,3]],"SAR_area_3_0"] call SAR_AI_mon_upd; 


_check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,3],[50,0,75],[2,0,4]],"SAR_area_1_3"] call SAR_AI_mon_upd; 


_check = [["max_grps","rnd_grps","max_p_grp"],[[2,2,1],[50,50,30],[3,3,2]],"SAR_area_2_2"] call SAR_AI_mon_upd; 


_check = [["max_grps","rnd_grps","max_p_grp"],[[2,3,1],[75,75,50],[3,3,3]],"SAR_area_1_1"] call SAR_AI_mon_upd; 


_check = [["max_grps","rnd_grps","max_p_grp"],[[2,1,2],[80,75,75],[2,2,4]],"SAR_area_1_2"] call SAR_AI_mon_upd; 


_check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,3],[20,0,50],[3,0,3]],"SAR_area_3_3"] call SAR_AI_mon_upd; 


_check = [["max_grps","rnd_grps","max_p_grp"],[[2,0,2],[75,0,75],[3,0,3]],"SAR_area_2_1"] call SAR_AI_mon_upd; 












diag_log format["SAR_AI: Area & Trigger definition finalized"];
diag_log format["SAR_AI: Static Spawning for Helicopter patrols started"];











diag_log format["SAR_AI: Static Spawning for Helicopter patrols finished"];



































diag_log format["SAR_AI: Static Spawning for infantry patrols finished"];
