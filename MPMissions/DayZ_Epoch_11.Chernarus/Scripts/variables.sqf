disableSerialization;
Bandit1_DZ = 	"Bandit1_DZ";
Bandit2_DZ = 	"Bandit2_DZ";
BanditW1_DZ = 	"BanditW1_DZ";
BanditW2_DZ = 	"BanditW2_DZ";
Survivor1_DZ = 	"Survivor2_DZ";
Survivor2_DZ = 	"Survivor2_DZ";
SurvivorW2_DZ = "SurvivorW2_DZ";
SurvivorW3_DZ = "SurvivorW2_DZ";
Sniper1_DZ = 	"Sniper1_DZ";
Camo1_DZ = 		"Camo1_DZ";
Soldier1_DZ = 	"Soldier1_DZ";
Rocket_DZ = 	"Rocket_DZ";
AllPlayers = ["Survivor2_DZ","SurvivorWcombat_DZ","SurvivorWdesert_DZ","SurvivorWurban_DZ","SurvivorWsequishaD_DZ","SurvivorWsequisha_DZ","SurvivorWpink_DZ","SurvivorW3_DZ","SurvivorW2_DZ","Bandit1_DZ","Bandit2_DZ","BanditW1_DZ","BanditW2_DZ","Soldier_Crew_PMC","Sniper1_DZ","Camo1_DZ","Soldier1_DZ","Rocket_DZ","Rocker1_DZ","Rocker2_DZ","Rocker3_DZ","Rocker4_DZ","Priest_DZ","Functionary1_EP1_DZ","GUE_Commander_DZ","Ins_Soldier_GL_DZ","Haris_Press_EP1_DZ","Pilot_EP1_DZ","RU_Policeman_DZ","pz_policeman","pz_suit1","pz_suit2","pz_worker1","pz_worker2","pz_worker3","pz_doctor","pz_teacher","pz_hunter","pz_villager1","pz_villager2","pz_villager3","pz_priest","Soldier_TL_PMC_DZ","Soldier_Sniper_PMC_DZ","Soldier_Bodyguard_AA12_PMC_DZ","Drake_Light_DZ","CZ_Special_Forces_GL_DES_EP1_DZ","TK_INS_Soldier_EP1_DZ","TK_INS_Warlord_EP1_DZ","FR_OHara_DZ","FR_Rodriguez_DZ","CZ_Soldier_Sniper_EP1_DZ","Graves_Light_DZ","GUE_Soldier_MG_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_CO_DZ","GUE_Soldier_2_DZ"];
meatraw = [
    "FoodSteakRaw",
    "FoodmeatRaw",
    "FoodbeefRaw",
    "FoodmuttonRaw",
    "FoodchickenRaw",
    "FoodrabbitRaw",
    "FoodbaconRaw",
	"ItemTrout",
	"ItemSeaBass",
	"ItemTuna"
];
exceptionsraw = ["ItemTuna"];
meatcooked = [
    "FoodSteakCooked",
    "FoodmeatCooked",
    "FoodbeefCooked",
    "FoodmuttonCooked",
    "FoodchickenCooked",
    "FoodrabbitCooked",
    "FoodbaconCooked",
	"ItemTroutCooked",
	"ItemSeaBassCooked",
	"ItemTunaCooked"
];
no_output_food = ["FoodMRE", "FoodPistachio", "FoodNutmix","FoodBioMeat"]+meatcooked+meatraw;
badfood = ["FoodBioMeat","FoodCanUnlabeled"];
food_with_output=[
    "FoodCanBakedBeans",
    "FoodCanSardines",
    "FoodCanFrankBeans",
    "FoodCanPasta",
	"FoodCanGriff",
	"FoodCanBadguy",
	"FoodCanBoneboy",
	"FoodCanCorn",
	"FoodCanCurgon",
	"FoodCanDemon",
	"FoodCanFraggleos",
	"FoodCanHerpy",
	"FoodCanOrlok",
	"FoodCanPowell",
	"FoodCanTylers",
	"FoodCanUnlabeled"
];
food_output = [
    "TrashTinCan",
    "TrashTinCan",
    "TrashTinCan",
    "TrashTinCan",
	"FoodCanGriffEmpty",
	"FoodCanBadguyEmpty",
	"FoodCanBoneboyEmpty",
	"FoodCanCornEmpty",
	"FoodCanCurgonEmpty",
	"FoodCanDemonEmpty",
	"FoodCanFraggleosEmpty",
	"FoodCanHerpyEmpty",
	"FoodCanOrlokEmpty",
	"FoodCanPowellEmpty",
	"FoodCanTylersEmpty",
	"FoodCanUnlabeledEmpty"
];
no_output_drink = ["ItemWaterbottle", "ItemWaterbottleBoiled"];
drink_with_output = [
    "ItemSoda",  
	"ItemSodaRbull",
	"ItemSodaOrangeSherbet",
    "ItemSodaCoke",
    "ItemSodaPepsi",
    "ItemSodaMdew",
    "ItemSodaMtngreen",
    "ItemSodaR4z0r",
    "ItemSodaClays",
    "ItemSodaSmasht", 
    "ItemSodaDrwaste", 
    "ItemSodaLemonade", 
    "ItemSodaLvg", 
    "ItemSodaMzly", 
    "ItemSodaRabbit"
];
drink_output = [
    "ItemSodaEmpty", 
	"ItemSodaEmpty", 
	"ItemSodaEmpty", 
    "ItemSodaCokeEmpty",
    "ItemSodaPepsiEmpty",
    "ItemSodaMdewEmpty",
    "ItemSodaMtngreenEmpty",
    "ItemSodaR4z0rEmpty",
    "ItemSodaClaysEmpty",
    "ItemSodaSmashtEmpty", 
    "ItemSodaDrwasteEmpty", 
    "ItemSodaLemonadeEmpty", 
    "ItemSodaLvgEmpty", 
    "ItemSodaMzlyEmpty", 
    "ItemSodaRabbitEmpty"
];
boil_tin_cans = [
    "TrashTinCan",
	"FoodCanGriffEmpty",
	"FoodCanBadguyEmpty",
	"FoodCanBoneboyEmpty",
	"FoodCanCornEmpty",
	"FoodCanCurgonEmpty",
	"FoodCanDemonEmpty",
	"FoodCanFraggleosEmpty",
	"FoodCanHerpyEmpty",
	"FoodCanOrlokEmpty",
	"FoodCanPowellEmpty",
	"FoodCanTylersEmpty",
	"FoodCanUnlabeledEmpty",
    "ItemSodaEmpty", 
    "ItemSodaCokeEmpty",
    "ItemSodaPepsiEmpty",
    "ItemSodaMdewEmpty",
    "ItemSodaMtngreenEmpty",
    "ItemSodaR4z0rEmpty",
    "ItemSodaClaysEmpty",
    "ItemSodaSmashtEmpty", 
    "ItemSodaDrwasteEmpty", 
    "ItemSodaLemonadeEmpty", 
    "ItemSodaLvgEmpty", 
    "ItemSodaMzlyEmpty", 
    "ItemSodaRabbitEmpty"
];
dayz_combination = "";
dayz_humanitytarget = "";
dayz_combatLog = "";
canRoll = true;
canbuild = true;
dayZ_partClasses = [
	"PartFueltank",
	"PartWheel",
	
	"PartEngine"
];
dayZ_explosiveParts = [
	"palivo",
	"motor"
];
SleepFood =				2160; 
SleepWater =			1440; 
SleepTemperatur	= 		90 / 100;	
allowConnection = 		false;
isSinglePlayer =		false;
PVDZE_serverObjectMonitor = [];
PlayerDeaths = [];
dayz_Locations = [];
dayz_locationsActive = [];
Dayz_GUI_R = 0.38; 
Dayz_GUI_G = 0.63; 
Dayz_GUI_B = 0.26; 
dayz_resetSelfActions = {
	s_player_fire =			-1;
	s_player_cook =			-1;
	s_player_boil =			-1;
	s_player_fireout =		-1;
	s_player_butcher =		-1;
	s_player_packtent = 	-1;
	s_player_packvault = 	-1;
	s_player_lockvault = 	-1;
	s_player_unlockvault = 	-1;
	s_player_fillwater =	-1;
	s_player_fillwater2 = 	-1;
	s_player_fillfuel = 	-1;
	s_player_grabflare = 	-1;
	s_player_callzombies = 	-1;
	s_player_showname = 	-1;
	s_player_debuglootpos = 	-1;
	s_player_pzombiesattack = 	-1;
	s_player_pzombiesvision =	-1;
	s_player_pzombiesfeed = 	-1;
	s_player_removeflare = 	-1;
	s_player_painkiller =	-1;
	s_player_studybody = 	-1;
	s_player_madsci_crtl =	-1;
	s_player_parts_crtl =	-1;
	s_build_Sandbag1_DZ = 	-1;
	s_build_Hedgehog_DZ =	-1;
	s_build_Wire_cat1 =		-1;
	s_player_deleteBuild =	-1;
	s_player_forceSave = 	-1;
	s_player_checkGear = 	-1;
	s_player_flipveh = 		-1;
	s_player_stats =		-1;
	s_player_sleep =		-1;
	s_player_movedog =		-1;
	s_player_speeddog =		-1;
	s_player_calldog = 		-1;
	s_player_feeddog = 		-1;
	s_player_waterdog = 	-1;
	s_player_staydog = 		-1;
	s_player_trackdog = 	-1;
	s_player_barkdog = 		-1;
	s_player_warndog = 		-1;
	s_player_followdog = 	-1;
	s_player_repair_crtl =  -1;
	s_player_information =  -1;
	s_player_fuelauto    =  -1;
	s_player_fuelauto2    =  -1;
	s_player_fillgen	 =  -1;
	s_player_upgrade_build	 =  -1;
	s_player_maint_build	 =  -1;
	s_player_downgrade_build	 =  -1;
	s_player_towing		 =  -1;
};
call dayz_resetSelfActions;
s_player_lastTarget =	[objNull,objNull,objNull,objNull,objNull];
s_player_repairActions = [];
s_player_madsci 		= 	[];
s_player_parts 			= 	[];
s_player_combi 			= 	[];
r_interrupt = 			false;
r_doLoop = 				false;
r_self = 				false;
r_self_actions = 		[];
r_drag_sqf = 			false;
r_action = 				false;
r_action_unload = 		false;
r_player_handler = 		false;
r_player_handler1 = 	false;
r_player_dead = 		false;
r_player_unconscious = 	false;
r_player_infected =		false;
r_player_injured = 		false;
r_player_inpain = 		false;
r_player_loaded = 		false;
r_player_cardiac = 		false;
r_fracture_legs =		false;
r_fracture_arms =		false;
r_player_vehicle =		player;
r_player_blood = 		12000;
r_player_lowblood = 	false;
r_player_timeout =		0;
r_player_bloodTotal = 	r_player_blood;
r_public_blood =		r_player_blood;
r_player_bloodDanger =	r_player_bloodTotal * 0.2;
r_player_actions = 		[];
r_handlerCount = 		0;
r_action_repair = 		false;
r_action_targets = 		[];
r_pitchWhine = 			false;
r_isBandit =			false;
DZE_PROTOBOX = objNull;
r_player_actions2 = [];
r_action2 = false;
r_player_lastVehicle = objNull;
r_player_lastSeat = [];
r_player_removeActions2 = {
	if (!isNull r_player_lastVehicle) then {
		{
			r_player_lastVehicle removeAction _x;
		} forEach r_player_actions2;
		r_player_actions2 = [];
		r_action2 = false;
	};
};
USEC_woundHit 	= [
	"",
	"body",
	"hands",
	"legs",
	"head_hit"
];
DAYZ_woundHit 	= [
	[
		"body",
		"hands",
		"legs",
		"head_hit"
	],
	[ 0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,2,2,3]
];
DAYZ_woundHit_ok = [
	[
		"body",
		"hands",
		"legs"
	],
	[0,0,0,0,0,1,1,1,2,2]
];
DAYZ_woundHit_dog = [
	[
		"body",
		"hands",
		"legs"
	],
	[0,0,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2]
];
USEC_MinorWounds 	= [
	"hands",
	"legs"
];
USEC_woundPoint	= [
	["Pelvis","aimpoint"],
	["aimpoint"], 
	["lelbow","relbow"],
	["RightFoot","LeftFoot"],
	["neck","pilot"]
];
USEC_typeOfWounds = [
	"Pelvis",
	"aimpoint",
	"lelbow","relbow",
	"RightFoot","LeftFoot",
	"neck","pilot"
];
DZE_vehicleZwounds = [
	"sklo predni L",
	"sklo predni P",
	"sklo zadni",
	"sklo zadni L",
	"sklo zadni P",
	"sklo P",
	"Glass1",
	"Glass2",
	"Glass3",
	"Glass4",
	"Glass5",
	"Glass6"
];
dayz_zombieTargetList = [
	["SoldierWB",50],
	["Air",500],
	["LandVehicle",200]
];
PVDZE_plr_Hit = [];
PVDZE_obj_Publish = [];		
PVDZE_plr_HideBody = objNull;
dayz_selectedVault = objNull;
dayz_selectedDoor = objNull;
PVDZE_veh_Publish = [];		
PVDZE_obj_Trade = [];		
PVDZE_plr_TradeMenu = [];  		
PVDZE_plr_DeathB = [];
dayz_dawn = 6;
dayz_dusk = 18;
if(isNil "dayz_maxAnimals") then {
	dayz_maxAnimals = 8;
};
DAYZ_agentnumber = 0;
dayz_animalDistance = 800;
dayz_zSpawnDistance = 1000;
if(isNil "dayz_maxLocalZombies") then {
	dayz_maxLocalZombies = 15;
};
if(isNil "dayz_maxGlobalZombiesInit") then {
	dayz_maxGlobalZombiesInit = 15;
};
if(isNil "dayz_maxGlobalZombiesIncrease") then {
	dayz_maxGlobalZombiesIncrease = 5;
};
if(isNil "dayz_maxZeds") then {
	dayz_maxZeds = 500;
};
if(isNil "DZEdebug") then {
	DZEdebug = false;
};
if(isNil "DZE_TRADER_SPAWNMODE") then {
	DZE_TRADER_SPAWNMODE = false;
};
if(isNil "dayz_tameDogs") then {
	dayz_tameDogs = false;
};
if(isNil "dayz_sellDistance") then {
	dayz_sellDistance = 20;
};
if(isNil "dayz_paraSpawn") then {
	dayz_paraSpawn = false;
};
if(isNil "dayz_minpos") then {
	dayz_minpos = -20000;
};
if(isNil "dayz_maxpos") then {
	dayz_maxpos = 20000;
};
if(isNil "DZE_teleport") then {
	DZE_teleport = [14000,14000,14000,14000,14000];
};
if(isNil "DZE_BuildingLimit") then {
	DZE_BuildingLimit = 150;
};
if(isNil "DZE_HumanityTargetDistance") then {
	DZE_HumanityTargetDistance = 25;
};
DZE_REPLACE_WEAPONS = [["Crossbow","ItemMatchbox","ItemHatchet"],["Crossbow_DZ","ItemMatchbox_DZE","ItemHatchet_DZE"]];
/*
if(isNil "dayz_canBuildInCity") then {
	dayz_canBuildInCity = false;
};
*/
if(isNil "dayz_zedSpawnVehCount") then {
	dayz_zedSpawnVehCount = dayz_maxLocalZombies / 2;
};
if(isNil "dayz_spawnAirCount") then {
	dayz_spawnAirCount = 0;
};
if(isNil "dayz_zedsAttackVehicles") then {
	dayz_zedsAttackVehicles = true;
};
dayz_updateObjects = ["Plane","Car", "Helicopter", "Motorcycle", "Ship", "TentStorage", "VaultStorage","LockboxStorage","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ"];
dayz_disallowedVault = ["TentStorage", "BuiltItems","ModularItems","DZE_Base_Object"];
dayz_reveal = ["AllVehicles","WeaponHolder","Land_A_tent","BuiltItems","ModularItems","DZE_Base_Object"];
dayz_allowedObjects = ["TentStorage","TentStorageDomed","TentStorageDomed2", "VaultStorageLocked", "Hedgehog_DZ", "Sandbag1_DZ","TrapBear","Fort_RazorWire","WoodGate_DZ","Land_HBarrier1_DZ","Land_HBarrier3_DZ","Fence_corrugated_DZ","M240Nest_DZ","CanvasHut_DZ","ParkBench_DZ","MetalGate_DZ","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","Plastic_Pole_EP1_DZ","Generator_DZ","StickFence_DZ","LightPole_DZ","FuelPump_DZ","DesertCamoNet_DZ","ForestCamoNet_DZ","DesertLargeCamoNet_DZ","ForestLargeCamoNet_DZ","SandNest_DZ","DeerStand_DZ","MetalPanel_DZ","WorkBench_DZ","WoodFloor_DZ","WoodLargeWall_DZ","WoodLargeWallDoor_DZ","WoodLargeWallWin_DZ","WoodSmallWall_DZ","WoodSmallWallWin_DZ","WoodSmallWallDoor_DZ","LockboxStorageLocked","WoodFloorHalf_DZ","WoodFloorQuarter_DZ","WoodStairs_DZ","WoodStairsSans_DZ","WoodSmallWallThird_DZ","WoodLadder_DZ","Land_DZE_GarageWoodDoor","Land_DZE_LargeWoodDoor","Land_DZE_WoodDoor","Land_DZE_GarageWoodDoorLocked","Land_DZE_LargeWoodDoorLocked","Land_DZE_WoodDoorLocked","CinderWallHalf_DZ","CinderWall_DZ","CinderWallDoorway_DZ","CinderWallDoor_DZ","CinderWallDoorLocked_DZ","CinderWallSmallDoorway_DZ","CinderWallDoorSmall_DZ","CinderWallDoorSmallLocked_DZ","MetalFloor_DZ","WoodRamp_DZ"];
DZE_LockableStorage = ["VaultStorage","VaultStorageLocked","LockboxStorageLocked","LockboxStorage"];
DZE_LockedStorage = ["VaultStorageLocked","LockboxStorageLocked"];
DZE_UnLockedStorage = ["VaultStorage","LockboxStorage"];
DZE_isRemovable = ["Fence_corrugated_DZ","M240Nest_DZ","ParkBench_DZ","Plastic_Pole_EP1_DZ"];
DZE_isWreck = ["SKODAWreck","HMMWVWreck","UralWreck","datsun01Wreck","hiluxWreck","datsun02Wreck","UAZWreck","Land_Misc_Garb_Heap_EP1","Fort_Barricade_EP1","Rubbish2"];
DZE_isWreckBuilding = ["Land_wreck_cinder","Land_wood_wreck_quarter","Land_wood_wreck_floor","Land_wood_wreck_third","Land_wood_wreck_frame","Land_iron_vein_wreck","Land_silver_vein_wreck","Land_gold_vein_wreck","Land_ammo_supply_wreck"];
DZE_isNewStorage = ["VaultStorage","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ"];
dayz_fuelpumparray = ["FuelPump_DZ","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","FuelStation","Land_ibr_FuelStation_Feed","Land_fuelstation_army","Land_fuelstation","land_fuelstation_w","Land_benzina_schnell"];
DZE_fueltruckarray = ["KamazRefuel_DZ","UralRefuel_TK_EP1_DZ","MtvrRefuel_DES_EP1_DZ","V3S_Refuel_TK_GUE_EP1_DZ"];
dayz_fuelsources = ["Land_Ind_TankSmall","Land_fuel_tank_big","Land_fuel_tank_stairs","Land_fuel_tank_stairs_ep1","Land_wagon_tanker","Land_fuelstation","Land_fuelstation_army","land_fuelstation_w","Land_benzina_schnell"];
dayz_spawnPos = getPosATL player;
DZE_Lock_Door = "";
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\loot_init.sqf";
if(isServer) then {
	dayz_players = [];
	dead_bodyCleanup = [];
	needUpdate_objects = [];
	if(isNil "dayz_fullMoonNights") then {
		dayz_fullMoonNights = false;
	};
	if(isNil "EpochEvents") then {
		EpochEvents = [];
	};
	if(isNil "DZE_vehicleAmmo") then {
		DZE_vehicleAmmo = 0;
	};
	if(isNil "DZE_BackpackGuard") then {
		DZE_BackpackGuard = true;
	};
	
	dayz_flyMonitor = [];		
	DZE_FlyWorkingSet = [];
	DZE_safeVehicle = ["ParachuteWest","ParachuteC"];
	
};
if(!isDedicated) then {
	
	_funcGetLocation = 
	{
		for "_i" from 0 to ((count _this) - 1) do 
		{
			private ["_location","_config","_locHdr","_position","_size","_type"];
			
			_config = 	(_this select _i);
			_locHdr = 	configName _config;
			_position = getArray	(_config >> "position");
			_size = 	getNumber	(_config >> "size");
			_type = 	getText		(_config >> "type");
			
			
			_location = nearestLocation [_position, _type];
			
			
			dayz_Locations set [count dayz_Locations, [_location,_locHdr,_size]]; 
		};
	};
	
	
	
	dayz_buildingMonitor = [];	
	dayz_bodyMonitor = [];
	
	
	dayz_baseTypes = 		getArray (configFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
	
	
	dayz_temperatur 		= 	36;		
	dayz_temperaturnormal 	= 	36;		
	dayz_temperaturmax 		= 	42;		
	dayz_temperaturmin 		= 	27;		
	
	
	dayZ_lastPlayerUpdate = 0;
	dayZ_everyonesTents =	[];
	dayz_hunger	=			0;
	dayz_thirst = 			0;
	dayz_combat =			0;
	dayz_preloadFinished = 	false;
	dayz_statusArray =		[1,1];
	dayz_disAudial =		0;
	dayz_disVisual =		0;
	dayz_firedCooldown = 	0;
	dayz_DeathActioned =	false;
	dayz_canDisconnect = 	true;
	dayz_damageCounter =	time;
	dayz_lastSave =			time;
	dayz_isSwimming	=		true;
	dayz_isKneeling	=		false;
	dayz_isCrawling	=		false;
	dayz_PreviousTown =		"Wilderness";
	dayz_currentDay = 		0;
	dayz_hasLight = 		false;
	dayz_surfaceNoise =		0;
	dayz_surfaceType =		"None";
	dayz_noPenalty = 		[];
	dayz_heavenCooldown =	0;
	deathHandled = 			false;
	dayz_lastHumanity =		0;
	dayz_guiHumanity =		-90000;
	dayz_firstGroup = 		group player;
	dayz_originalPlayer = 	player;
	dayz_playerName =		"Unknown";
	dayz_sourceBleeding =	objNull;
	dayz_clientPreload = 	false;
	dayz_authed = 			false;
	dayz_panicCooldown = 	0;
	dayz_areaAffect =		2;
	dayz_heartBeat = 		false;
	dayzClickTime =			0;
	dayz_spawnDelay =		120;
	dayz_spawnWait =		-120;
	dayz_lootDelay =		3;
	dayz_lootWait =			-300;
	dayz_spawnZombies =		0;
	
	dayz_CurrentZombies = 0;
	
	dayz_maxCurrentZeds = 0;
	dayz_inVehicle =		false;
	dayz_Magazines = 		[];
	dayzGearSave = 			false;
	dayz_unsaved =			false;
	TradeInprogress =		false;
	dayz_scaleLight = 		0;
	dayzDebug = false;
	dayzState = -1;
	
	
	
	
	
	if(isNil "DZE_AllowForceSave") then {
		DZE_AllowForceSave = false;
	};
	if(isNil "DZE_AllowCargoCheck") then {
		DZE_AllowCargoCheck = true;
	};
	if(isNil "DZE_ForceNameTags") then {
		DZE_ForceNameTags = false;
	};
	if(isNil "DZE_ForceNameTagsOff") then {
		DZE_ForceNameTagsOff = false;
	};
	DZE_CanPickup = true;
	DZE_Q = false;
	DZE_Z = false;
	DZE_Q_alt = false;
	DZE_Z_alt = false;
	DZE_Q_ctrl = false;
	DZE_Z_ctrl = false;
	DZE_5 = false;
	DZE_4 = false;
	DZE_6 = false;
	DZE_cancelBuilding = false;
	DZE_PZATTACK = false;
};
globalSkin = "";
allbuildables_class = [];
allbuildables = [];
allbuild_notowns = [];
allremovables = [];
wallarray = [];
structures = [];
CODEINPUT = [];
keyCode = [];
remProc = false;
hasBuildItem = false;
rem_procPart = false;
repProc = false;
keyValid = false;
procBuild = false;
currentBuildRecipe = 0;
removeObject = false;
safeObjects = ["TentStorage","TentStorageDomed","TentStorageDomed2", "VaultStorageLocked", "Hedgehog_DZ", "Sandbag1_DZ","TrapBear","Fort_RazorWire","WoodGate_DZ","Land_HBarrier1_DZ","Land_HBarrier3_DZ","Fence_corrugated_DZ","M240Nest_DZ","CanvasHut_DZ","ParkBench_DZ","MetalGate_DZ","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","Plastic_Pole_EP1_DZ","Generator_DZ","StickFence_DZ","LightPole_DZ","FuelPump_DZ","DesertCamoNet_DZ","ForestCamoNet_DZ","DesertLargeCamoNet_DZ","ForestLargeCamoNet_DZ","SandNest_DZ","DeerStand_DZ","MetalPanel_DZ","WorkBench_DZ","WoodFloor_DZ","WoodLargeWall_DZ","WoodLargeWallDoor_DZ","WoodLargeWallWin_DZ","WoodSmallWall_DZ","WoodSmallWallWin_DZ","WoodSmallWallDoor_DZ","LockboxStorageLocked","WoodFloorHalf_DZ","WoodFloorQuarter_DZ","WoodStairs_DZ","WoodStairsSans_DZ","WoodSmallWallThird_DZ","WoodLadder_DZ","Land_DZE_GarageWoodDoor","Land_DZE_LargeWoodDoor","Land_DZE_WoodDoor","Land_DZE_GarageWoodDoorLocked","Land_DZE_LargeWoodDoorLocked","Land_DZE_WoodDoorLocked","CinderWallHalf_DZ","CinderWall_DZ","CinderWallDoorway_DZ","CinderWallDoor_DZ","CinderWallDoorLocked_DZ","CinderWallSmallDoorway_DZ","CinderWallDoorSmall_DZ","CinderWallDoorSmallLocked_DZ","MetalFloor_DZ","WoodRamp_DZ"];
dayz_allowedObjects = ["TentStorage","TentStorageDomed","TentStorageDomed2", "VaultStorageLocked", "Hedgehog_DZ", "Sandbag1_DZ","TrapBear","Fort_RazorWire","WoodGate_DZ","Land_HBarrier1_DZ","Land_HBarrier3_DZ","Fence_corrugated_DZ","M240Nest_DZ","CanvasHut_DZ","ParkBench_DZ","MetalGate_DZ","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","Plastic_Pole_EP1_DZ","Generator_DZ","StickFence_DZ","LightPole_DZ","FuelPump_DZ","DesertCamoNet_DZ","ForestCamoNet_DZ","DesertLargeCamoNet_DZ","ForestLargeCamoNet_DZ","SandNest_DZ","DeerStand_DZ","MetalPanel_DZ","WorkBench_DZ","WoodFloor_DZ","WoodLargeWall_DZ","WoodLargeWallDoor_DZ","WoodLargeWallWin_DZ","WoodSmallWall_DZ","WoodSmallWallWin_DZ","WoodSmallWallDoor_DZ","LockboxStorageLocked","WoodFloorHalf_DZ","WoodFloorQuarter_DZ","WoodStairs_DZ","WoodStairsSans_DZ","WoodSmallWallThird_DZ","WoodLadder_DZ","Land_DZE_GarageWoodDoor","Land_DZE_LargeWoodDoor","Land_DZE_WoodDoor","Land_DZE_GarageWoodDoorLocked","Land_DZE_LargeWoodDoorLocked","Land_DZE_WoodDoorLocked","CinderWallHalf_DZ","CinderWall_DZ","CinderWallDoorway_DZ","CinderWallDoor_DZ","CinderWallDoorLocked_DZ","CinderWallSmallDoorway_DZ","CinderWallDoorSmall_DZ","CinderWallDoorSmallLocked_DZ","MetalFloor_DZ","WoodRamp_DZ"];
