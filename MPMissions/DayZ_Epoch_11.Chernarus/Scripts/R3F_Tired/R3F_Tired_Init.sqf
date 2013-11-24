

#include "R3F_TIRED_Configuration.cfg"

call compile preprocessFile "Scripts\R3F_Tired\R3F_Tired_Fnct.sqf";

R3F_Weight = 0;

R3F_TIRED_Ratio_Position = 0;
R3F_TIRED_Accumulator = 0;
R3F_TIRED_Handle_Blur_Effect = [] spawn {}; 
R3F_TIRED_Handle_Blackout_Effect = [] spawn {};
R3F_TIRED_Counter_Time = 0;
R3F_TIRED_Ratio_Recovery = R3F_TIRED_RATIO_RECOVERING;
R3F_TIRED_Ratio_Overweight = 1;

_void = [] execVM "Scripts\R3F_Tired\R3F_DoTired.sqf";