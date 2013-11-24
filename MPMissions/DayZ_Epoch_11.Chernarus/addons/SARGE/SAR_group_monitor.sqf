
private ["_allgroups","_running","_sleeptime","_count_friendly_groups","_count_unfriendly_groups","_debugstring"];
if (!isServer) exitWith {}; 
_running = true;
_sleeptime = 5;
while {_running} do {
    _allgroups = allgroups;
    _count_friendly_groups = {side _x == SAR_AI_friendly_side} count _allgroups;
    _count_unfriendly_groups = {side _x == SAR_AI_unfriendly_side} count _allgroups;
    if(_count_friendly_groups > 120) then {
diag_log format["SARGE AI: WARNING - more than 120 friendly AI groups active. Consider decreasing your configured AI survivor and soldier groups. Number of active groups: %1.",_count_friendly_groups];
SAR_MAX_GRP_WEST_SPAWN = true;
    } else {
SAR_MAX_GRP_WEST_SPAWN = false;
    };
    if(_count_unfriendly_groups > 120) then {
    
diag_log format["SARGE AI: WARNING - more than 120 unfriendly AI groups active. Consider decreasing your configured AI bandit groups. Number of active groups: %1.",_count_unfriendly_groups];
SAR_MAX_GRP_EAST_SPAWN = true;
    } else {
SAR_MAX_GRP_EAST_SPAWN = false;    
    };
    
    
    
    if (SAR_DEBUGMONITOR) then {
    
_debugstring = parseText format ["
<t size='0.85' font='Bitstream' align='left' color='#0000FF'>  *******  SARGE AI Monitor *******</t><br/>
<t size='0.85' font='Bitstream' align='left' color='#FFBF00'># of AI units (alive/ever): </t><t size='0.85' font='Bitstream' align='right'>%6(%1)</t><br/>
<t size='0.85' font='Bitstream' align='left' color='#FFBF00'># of AI groups active: </t><t size='0.85' font='Bitstream' align='right'>%2</t><br/>
<t size='0.85' font='Bitstream' align='left' color='#0000FF'>---- Friendly ----</t><br/>
<t size='0.85' font='Bitstream' align='left' color='#FFBF00'># of alive AI units: </t><t size='0.85' font='Bitstream' align='right'>%4</t><br/>
<t size='0.85' font='Bitstream' align='left' color='#FFBF00'># in combat: </t><t size='0.85' font='Bitstream' align='right'>%7</t><br/>
<t size='0.85' font='Bitstream' align='left' color='#FFBF00'># leaders in fight/walkmode: </t><t size='0.85' font='Bitstream' align='right'>%8/%9</t><br/>
<t size='0.85' font='Bitstream' align='left' color='#FFBF00'># of %13/%12 AI units: </t><t size='0.85' font='Bitstream' align='right'>%11/%10</t><br/>
<t size='0.85' font='Bitstream' align='left' color='#0000FF'>---- Unfriendly ----</t><br/>
<t size='0.85' font='Bitstream' align='left' color='#FFBF00'># of alive AI units: </t><t size='0.85' font='Bitstream' align='right'>%5</t><br/>
<t size='0.85' font='Bitstream' align='left' color='#FFBF00'># in combat: </t><t size='0.85' font='Bitstream' align='right'>%14</t><br/>
<t size='0.85' font='Bitstream' align='left' color='#FFBF00'># leaders in fight/walkmode: </t><t size='0.85' font='Bitstream' align='right'>%15/%16</t><br/>
<t size='0.85' font='Bitstream' align='left' color='#FFBF00'># of %13/%12 AI units: </t><t size='0.85' font='Bitstream' align='right'>%18/%17</t><br/>",
KRON_UPS_Total, 
KRON_UPS_Instances,     
((count KRON_NPCs)-1),  
{alive _x} count KRON_AllRes,   
{alive _x} count KRON_AllEast,  
({alive _x} count KRON_AllRes) + ({alive _x} count KRON_AllEast),       
{alive _x && (combatMode _x == "RED")} count KRON_AllRes,       
({alive _x && (_x getVariable ["SAR_fightmode","not defined"] =="fight")} count KRON_AllRes),   
({alive _x && (_x getVariable ["SAR_fightmode","not defined"] =="walk")} count KRON_AllRes),    
({alive _x && (_x getVariable ["SAR_AI_experience",0] >= SAR_AI_XP_LVL_3)} count KRON_AllRes),  
({alive _x && ((_x getVariable ["SAR_AI_experience",0] >= SAR_AI_XP_LVL_2) && (_x getVariable ["SAR_AI_experience",0] < SAR_AI_XP_LVL_3))} count KRON_AllRes),  
SAR_AI_XP_NAME_3,       
SAR_AI_XP_NAME_2,       
{alive _x && (combatMode _x == "RED")} count KRON_AllEast,      
({alive _x && (_x getVariable ["SAR_fightmode","not defined"] =="fight")} count KRON_AllEast),  
({alive _x && (_x getVariable ["SAR_fightmode","not defined"] =="walk")} count KRON_AllEast),   
({alive _x && (_x getVariable ["SAR_AI_experience",0] >= SAR_AI_XP_LVL_3)} count KRON_AllEast), 
({alive _x && ((_x getVariable ["SAR_AI_experience",0] >= SAR_AI_XP_LVL_2) && (_x getVariable ["SAR_AI_experience",0] < SAR_AI_XP_LVL_3))} count KRON_AllEast)  
];
[nil,nil,rHINT,_debugstring] call RE;
    };
    
    sleep _sleeptime;
};