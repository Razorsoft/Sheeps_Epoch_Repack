
SAR_dynamic_spawning = true;
SAR_DEBUGMONITOR= false;
SAR_max_grps_bandits = 1;
SAR_max_grps_soldiers = 1;
SAR_max_grps_survivors = 1;
SAR_chance_bandits = 75;
SAR_chance_soldiers = 30;
SAR_chance_survivors = 50;
SAR_max_grpsize_bandits = 4;
SAR_max_grpsize_soldiers = 5;
SAR_max_grpsize_survivors = 4;
SAR_FIX_VEHICLE_ISSUE = true;
SAR_AI_disable_UPSMON_AI = false;
SAR_AI_STEAL_VEHICLE = false;
SAR_surv_kill_value = 250;
SAR_band_kill_value = 50;
SAR_HUMANITY_HOSTILE_LIMIT = -2500;
SAR_log_AI_kills = true;
SAR_KILL_MSG = true;
SAR_AI_XP_SYSTEM = true;
SAR_AI_XP_LVL_1 = 0;
SAR_AI_XP_NAME_1 = "Rookie";
SAR_AI_XP_ARMOR_1 = 1;        
SAR_AI_XP_LVL_2 = 5;
SAR_AI_XP_NAME_2 = "Veteran";
SAR_AI_XP_ARMOR_2 = 0.5;        
SAR_AI_XP_LVL_3 = 20;
SAR_AI_XP_NAME_3 = "Legendary";
SAR_AI_XP_ARMOR_3 = 0.3;        
SAR_leader_health_factor = 1;
SAR_heli_shield = false;
SAR_dynamic_group_respawn = true;
SAR_respawn_waittime = 90; 
SAR_DESPAWN_TIMEOUT = 120; 
SAR_DELETE_TIMEOUT = 120; 
SAR_DETECT_HOSTILE = 200;
SAR_DETECT_HOSTILE_FROM_VEHICLE = 500;
SAR_DETECT_INTERVAL = 15;
SAR_DETECT_FROM_VEHICLE_INTERVAL = 5;
SAR_REAMMO_INTERVAL = 30;
SAR_HITKILL_DEBUG = false;
SAR_DEBUG = false;
SAR_EXTREME_DEBUG = false;
KRON_UPS_Debug = 0;
KRON_UPS_WP_Debug = 0;
KRON_UPS_AI_Debug = 0;
SAR_SHOW_XP_LVL = false;
KRON_UPS_ambushdist = 100;
KRON_UPS_Cycle = 10; 
KRON_UPS_react = 60;
KRON_UPS_minreact = 30; 
KRON_UPS_maxwaiting = 60;
KRON_UPS_wp_maxwaiting = 120;
KRON_UPS_alerttime = 90;
KRON_UPS_closeenough = 100; 
KRON_UPS_sharedist = 200;
KRON_UPS_comradio = 0;
KRON_UPS_searchVehicledist = 600; 
KRON_UPS_Res_enemy = [east];
R_knowsAboutEnemy = 1.0;
SAR_leader_sold_list = ["Rocket_DZ"]; 
SAR_sniper_sold_list = ["Sniper1_DZ"]; 
SAR_soldier_sold_list = ["Soldier1_DZ","Camo1_DZ"]; 
SAR_leader_band_list = ["Bandit1_DZ"]; 
SAR_sniper_band_list = ["Sniper1_DZ"]; 
SAR_soldier_band_list = ["Bandit1_DZ", "BanditW1_DZ","Soldier_Crew_PMC"]; 
SAR_leader_surv_list = ["Survivor3_DZ"]; 
SAR_sniper_surv_list = ["Sniper1_DZ"]; 
SAR_soldier_surv_list = ["Survivor2_DZ","SurvivorW2_DZ","Soldier_Crew_PMC"]; 
SAR_leader_sold_skills = [
    ["aimingAccuracy",0.35, 0.10], 
    ["aimingShake",   0.35, 0.10],
    ["aimingSpeed",   0.80, 0.20],
    ["spotDistance",  0.70, 0.30],
    ["spotTime",      0.65, 0.20],
    ["endurance",     0.80, 0.20],
    ["courage",       0.80, 0.20],
    ["reloadSpeed",   0.80, 0.20],
    ["commanding",    0.80, 0.20],
    ["general",       0.80, 0.20]
];
SAR_soldier_sold_skills  = [
    ["aimingAccuracy",0.25, 0.10], 
    ["aimingShake",   0.25, 0.10],
    ["aimingSpeed",   0.70, 0.20],
    ["spotDistance",  0.55, 0.30],
    ["spotTime",      0.30, 0.20],
    ["endurance",     0.60, 0.20],
    ["courage",       0.60, 0.20],
    ["reloadSpeed",   0.60, 0.20],
    ["commanding",    0.60, 0.20],
    ["general",       0.60, 0.20]
];
SAR_sniper_sold_skills = [
    ["aimingAccuracy",0.80, 0.10], 
    ["aimingShake",   0.90, 0.10],
    ["aimingSpeed",   0.70, 0.20],
    ["spotDistance",  0.70, 0.30],
    ["spotTime",      0.75, 0.20],
    ["endurance",     0.70, 0.20],
    ["courage",       0.70, 0.20],
    ["reloadSpeed",   0.70, 0.20],
    ["commanding",    0.70, 0.20],
    ["general",       0.70, 0.20]
];
SAR_leader_band_skills = [
    ["aimingAccuracy",0.35, 0.10], 
    ["aimingShake",   0.35, 0.10],
    ["aimingSpeed",   0.60, 0.20],
    ["spotDistance",  0.40, 0.30],
    ["spotTime",      0.45, 0.20],
    ["endurance",     0.40, 0.20],
    ["courage",       0.50, 0.20],
    ["reloadSpeed",   0.60, 0.20],
    ["commanding",    0.50, 0.20],
    ["general",       0.50, 0.20]
];
SAR_soldier_band_skills = [
    ["aimingAccuracy",0.15, 0.10], 
    ["aimingShake",   0.15, 0.10],
    ["aimingSpeed",   0.60, 0.20],
    ["spotDistance",  0.40, 0.20],
    ["spotTime",      0.40, 0.20],
    ["endurance",     0.40, 0.20],
    ["courage",       0.40, 0.20],
    ["reloadSpeed",   0.40, 0.20],
    ["commanding",    0.40, 0.20],
    ["general",       0.40, 0.20]
];
SAR_sniper_band_skills = [
    ["aimingAccuracy",0.70, 0.10], 
    ["aimingShake",   0.80, 0.10],
    ["aimingSpeed",   0.70, 0.20],
    ["spotDistance",  0.90, 0.10],
    ["spotTime",      0.55, 0.20],
    ["endurance",     0.70, 0.20],
    ["courage",       0.70, 0.20],
    ["reloadSpeed",   0.70, 0.20],
    ["commanding",    0.50, 0.20],
    ["general",       0.60, 0.20]
];
SAR_leader_surv_skills = [
    ["aimingAccuracy",0.35, 0.10], 
    ["aimingShake",   0.35, 0.10],
    ["aimingSpeed",   0.60, 0.20],
    ["spotDistance",  0.40, 0.30],
    ["spotTime",      0.45, 0.20],
    ["endurance",     0.40, 0.20],
    ["courage",       0.50, 0.20],
    ["reloadSpeed",   0.60, 0.20],
    ["commanding",    0.50, 0.20],
    ["general",       0.50, 0.20]
];
SAR_soldier_surv_skills = [
    ["aimingAccuracy",0.15, 0.10], 
    ["aimingShake",   0.15, 0.10],
    ["aimingSpeed",   0.60, 0.20],
    ["spotDistance",  0.45, 0.30],
    ["spotTime",      0.20, 0.20],
    ["endurance",     0.40, 0.20],
    ["courage",       0.40, 0.20],
    ["reloadSpeed",   0.40, 0.20],
    ["commanding",    0.40, 0.20],
    ["general",       0.40, 0.20]
];
SAR_sniper_surv_skills = [
    ["aimingAccuracy",0.70, 0.10], 
    ["aimingShake",   0.80, 0.10],
    ["aimingSpeed",   0.70, 0.20],
    ["spotDistance",  0.70, 0.30],
    ["spotTime",      0.65, 0.20],
    ["endurance",     0.70, 0.20],
    ["courage",       0.70, 0.20],
    ["reloadSpeed",   0.70, 0.20],
    ["commanding",    0.50, 0.20],
    ["general",       0.60, 0.20]
];
SAR_sold_leader_weapon_list = ["M4A1","M4A3_CCO_EP1","AK_47_M"];
SAR_sold_leader_pistol_list = [];   
SAR_sold_leader_items = [["ItemSodaCoke",75],["FoodCanBakedBeans",60]];
SAR_sold_leader_tools =  [["ItemMap",50],["ItemCompass",30],["Binocular_Vector",5],["NVGoggles",5],["ItemRadio",100]];
SAR_sold_rifleman_weapon_list = ["M16A2","Winchester1866","AK_74","LeeEnfield","M1014"];
SAR_sold_rifleman_pistol_list = [];    
SAR_sold_rifleman_items = [["ItemSodaCoke",75],["FoodCanBakedBeans",60]];
SAR_sold_rifleman_tools = [["ItemMap",50],["ItemCompass",30]];
SAR_sold_sniper_weapon_list = ["M4A1_Aim","SVD_CAMO","Huntingrifle"];
SAR_sold_sniper_pistol_list = [];   
SAR_sold_sniper_items = [["ItemSodaCoke",75],["FoodCanBakedBeans",60],["Skin_Sniper1_DZ",10]];
SAR_sold_sniper_tools = [["ItemMap",50],["ItemCompass",30]];
SAR_surv_leader_weapon_list = ["M4A1","M4A3_CCO_EP1","AK_47_M"];
SAR_surv_leader_pistol_list = [];   
SAR_surv_leader_items = [["ItemSodaCoke",75],["FoodCanBakedBeans",60]];
SAR_surv_leader_tools =  [["ItemMap",50],["ItemCompass",30],["Binocular_Vector",5],["NVGoggles",5],["ItemRadio",100]];
SAR_surv_rifleman_weapon_list = ["M16A2","Winchester1866","AK_74","LeeEnfield","M1014"];
SAR_surv_rifleman_pistol_list = [];    
SAR_surv_rifleman_items = [["ItemSodaCoke",75],["FoodCanBakedBeans",60]];
SAR_surv_rifleman_tools = [["ItemMap",50],["ItemCompass",30]];
SAR_surv_sniper_weapon_list = ["M4A1_Aim","SVD_CAMO","Huntingrifle"];
SAR_surv_sniper_pistol_list = [];   
SAR_surv_sniper_items = [["ItemSodaCoke",75],["FoodCanBakedBeans",60],["Skin_Sniper1_DZ",10]];
SAR_surv_sniper_tools = [["ItemMap",50],["ItemCompass",30]];
SAR_band_leader_weapon_list = ["M4A1","M4A3_CCO_EP1","AK_47_M"];
SAR_band_leader_pistol_list = [];   
SAR_band_leader_items = [["ItemSodaCoke",75],["FoodCanBakedBeans",60]];
SAR_band_leader_tools =  [["ItemMap",50],["ItemCompass",30],["Binocular_Vector",5],["NVGoggles",5],["ItemRadio",100]];
SAR_band_rifleman_weapon_list = ["M16A2","Winchester1866","AK_74","LeeEnfield","M1014"];
SAR_band_rifleman_pistol_list = [];    
SAR_band_rifleman_items = [["ItemSodaCoke",75],["FoodCanBakedBeans",60]];
SAR_band_rifleman_tools = [["ItemMap",50],["ItemCompass",30],["Binocular_Vector",2]];
SAR_band_sniper_weapon_list = ["M4A1_Aim","SVD_CAMO","Huntingrifle"];
SAR_band_sniper_pistol_list = [];   
SAR_band_sniper_items = [["ItemSodaCoke",75],["FoodCanBakedBeans",60],["Skin_Sniper1_DZ",100]];
SAR_band_sniper_tools = [["ItemMap",50],["ItemCompass",30],["Binocular_Vector",10],["ItemFlashlight",100]];
SAR_heli_type=["UH1H_DZ"];