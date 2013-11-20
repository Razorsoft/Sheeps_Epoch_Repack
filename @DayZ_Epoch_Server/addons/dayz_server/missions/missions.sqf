private ["_sar_pos", "_loot_pos", "_loot_boxes", "_loot_types", "_text"];

_sar_pos = 			[1912.21,2244.73,0.00143003];
_loot_pos =		  	[
					[1915.45,2234.73,0.00147915], 
					[1916.81,2229.3,0.00147629], 
					[1904.81,2225.72,0.00138426], 
					[1906.98,2224.75,0.00149155]];
_loot_boxes = 		[
					"USVehicleBox",
					"USLaunchersBox",
					"USLaunchersBox",
					"USVehicleBox"];
_loot_types = 		[
					"Residental",
					"Random",
					"Money",
					"Residental"];
_text_start =		"Bandits Have Been Spotted at Kamenka! Check your map for the location!";
_text_done  =		"All Bandits Have Been Killed at Kamenka!";
_text_failed =		"Bandits Have Left Kamenka";
					
mission_kamenka = [_sar_pos, _loot_pos, 2, 5, ["ambush"], _loot_boxes, _loot_types, _text_start, _text_done, _text_failed];


// BALOTA AIRFIELD  -- PATROL
_sar_pos = 			[4720.7,2587.41,0.00138092];
_loot_pos =		  	[
					[4726.5,2593.38,0.00151253],
					[4726.23,2600.2,0.00140285],
					[4719.99,2605.23,0.00147533],
					[4720.7,2587.41,0.00138092],
					[4719.51,2610.04,0.00151825]];
_loot_boxes = 		[
					"USVehicleBox",
					"USLaunchersBox",
					"USLaunchersBox",
					"USVehicleBox",
					"USVehicleBox"];
_loot_types = 		[
					"Rare",
					"Miltary",
					"Miltary",
					"Random",
					"Random"];
_text_start = 		"Bandits Have Been Spotted at an AirField! Check your map for the location!";
_text_done = 		"All Bandits Have Been Killed at the AirField!";
_text_failed = 		"Bandits Have Left the AirField";
					
mission_balota_airfield = [_sar_pos, _loot_pos, 1, 6, ["patrol"], _loot_boxes, _loot_types, _text_start, _text_done, _text_failed];


// OUTSIDE CHERNO -- AMBUSH
_sar_pos = 			[5862.46,2197.52,0.00158548];
_loot_pos =		  	[
					[5848.54,2205.52,0.00139999],
					[5843.64,2205.37,0.00135231],
					[5839.66,2204.4,0.00136995],
					[5851.77,2211.1,0.00141573]];
_loot_boxes = 		[
					"USVehicleBox",
					"USVehicleBox",
					"USLaunchersBox",
					"USVehicleBox"];
_loot_types = 		[
					"Money",
					"Building Supplies",
					"Residental",
					"Residental"];
_text_start = 		"Bandits Have Been Spotted at Cherno! Check your map for the location!";
_text_done = 		"All Bandits Have Been Killed at Cherno!";
_text_failed = 		"Bandits Have Left Cherno";
					
mission_cherno_outside = [_sar_pos, _loot_pos, 2, 5, ["ambush"], _loot_boxes, _loot_types, _text_start, _text_done, _text_failed];


// CHERNO HOSPTIAL -- AMBUSH / PATROL
_sar_pos = 			[6405.17,2740.78,0.00143909];
_loot_pos =		  	[
					[6407.13,2754.67,0.00143862],
					[6408.52,2753.03,0.00143862],
					[6408,2748.13,0.00144196],
					[6404.22,2750.66,0.0014348]];
_loot_boxes = 		[
					"USVehicleBox",
					"USVehicleBox",
					"USLaunchersBox",
					"USVehicleBox"];
_loot_types = 		[
					"Medical",
					"Medical",
					"Random",
					"Medical"];
_text_start =		"Bandits Have Been Spotted at Cherno! Check your map for the location!";
_text_done = 		"All Bandits Have Been Killed at Cherno!";
_text_failed = 		"Bandits Have Left Cherno";
					
mission_cherno_hospital = [_sar_pos, _loot_pos, 1, 4, ["ambush", "patrol"], _loot_boxes, _loot_types, _text_start, _text_done, _text_failed];


// CHERNO HOSTIAL 2 -- AMBUSH / PATROL
_sar_pos = 			[6806.9,2712.85,0.00143909];
_loot_pos =		  	[
					[6808.24,2704.92,0.00143862],
					[6809.37,2706.46,0.00143862],
					[6810.47,2707.94,0.00143862],
					[6811.96,2709.95,0.00143862]];
_loot_boxes = 		[
					"USVehicleBox",
					"USVehicleBox",
					"USLaunchersBox",
					"USVehicleBox"];
_loot_types = 		[
					"Medical",
					"Medical",
					"Random",
					"Medical"];
_text_start = 		"Bandits Have Been Spotted at Cherno! Check your map for the location!";
_text_done = 		"All Bandits Have Been Killed at Cherno!";
_text_failed = 		"Bandits Have Left Cherno";
					
mission_cherno_hostpital2 = [_sar_pos, _loot_pos, 1, 4, ["ambush"], _loot_boxes, _loot_types, _text_start, _text_done, _text_failed];


// CHERNO FIRESTATION -- PATROL
_sar_pos = 			[6587.55,2411.75,0.00143909];
_loot_pos =		  	[
					[6572.9,2405.32,0.00143862],
					[6570.58,2406.92,0.00143862],
					[6567.86,2408.94,0.00143862],
					[6584.31,2406.71,0.00143862]];
_loot_boxes = 		[
					"USVehicleBox",
					"USVehicleBox",
					"USLaunchersBox",
					"USVehicleBox"];
_loot_types = 		[
					"Random",
					"Random",
					"Random",
					"Random"];
_text_start =		"Bandits Have Been Spotted at Cherno! Check your map for the location!";
_text_done = 		"All Bandits Have Been Killed at Cherno!";
_text_failed =		"Bandits Have Left Cherno";
					
mission_cherno_firestation = [_sar_pos, _loot_pos, 1, 6, ["patrol"], _loot_boxes, _loot_types, _text_start, _text_done, _text_failed];


// CHERNO SHOP -- AMBUSH
_sar_pos = 			[6554.75,2303.6,0.00143909];
_loot_pos =		  	[
					[6552.39,2299.7,0.00143909],
					[6548.03,2295.46,0.00143909],
					[6541.19,2289.08,0.00143909],
					[6537.5,2285.31,0.00143909]];
_loot_boxes = 		[
					"USLaunchersBox",
					"USLaunchersBox",
					"USLaunchersBox",
					"USLaunchersBox"];
_loot_types = 		[
					"Residental",
					"Residental",
					"Residental",
					"Residental"];
_text_start =		"Bandits Have Been Spotted at Cherno! Check your map for the location!";
_text_done = 		"All Bandits Have Been Killed at Cherno!";
_text_failed =		"Bandits Have Left Cherno";
					
mission_cherno_shop = [_sar_pos, _loot_pos, 1, 5, ["ambush"], _loot_boxes, _loot_types, _text_start, _text_done, _text_failed];


// CHERNO PETROL -- AMBUSH
_sar_pos = 			[6666.37,2953.67,0.0014677];
_loot_pos =		  	[
					[6672.76,2940.02,0.00143719],
					[6669.97,2938.96,0.00143528],
					[6689.76,2945.23,0.00143909],
					[6692.62,2941.39,0.00144482]];
_loot_boxes = 		[
					"USLaunchersBox",
					"USLaunchersBox",
					"USLaunchersBox",
					"USVehicleBox"];
_loot_types = 		[
					"Residental",
					"Residental",
					"Random",
					"Money"];
_text_start = 		"Bandits Have Been Spotted at Cherno! Check your map for the location!";
_text_done = 		"All Bandits Have Been Killed at Cherno!";
_text_failed = 		"Bandits Have Left Cherno";
					
mission_cherno_petrol = [_sar_pos, _loot_pos, 2, 4, ["ambush"], _loot_boxes, _loot_types, _text_start, _text_done, _text_failed];


// ELECTRO -- PETROL -- AMBUSH / PATROL
_sar_pos = 			[9494.35,2014.38,0.00142765];
_loot_pos =		  	[
					[9493.3,1993.37,-0.00124168],
					[9493.31,1991,-0.00124645],
					[9516.85,1997.6,0.00145721],
					[9522.97,2005.67,0.00147533]];
_loot_boxes = 		[
					"USLaunchersBox",
					"USLaunchersBox",
					"USLaunchersBox",
					"USVehicleBox"];
_loot_types = 		[
					"Residental",
					"Residental",
					"Random",
					"Money"];
_text_start = 		"Bandits Have Been Spotted at Electro! Check your map for the location!";
_text_done = 		"All Bandits Have Been Killed at Electro!";
_text_failed = 		"Bandits Have Left Electro";
					
mission_electro_petrol = [_sar_pos, _loot_pos, 2, 4, ["ambush", "patrol"], _loot_boxes, _loot_types, _text_start, _text_done, _text_failed];


// ELECTRO -- SCHOOL -- PATROL / AMBUSH
_sar_pos = 			[10492.2,2346.88,0.00143909];
_loot_pos =		  	[
					[10480.8,2347.11,0.00143862],
					[10478.4,2345.6,0.00143862],
					[10474.6,2342.56,0.00143862],
					[10491.1,2354.77,0.00143862]];
_loot_boxes = 		[
					"USLaunchersBox",
					"USLaunchersBox",
					"USLaunchersBox",
					"USVehicleBox"];
_loot_types = 		[
					"Residental",
					"Residental",
					"Random",
					"Money"];
_text_start = 		"Bandits Have Been Spotted at Electro! Check your map for the location!";
_text_done = 		"All Bandits Have Been Killed at Electro!";
_text_failed =		"Bandits Have Left Electro";
					
mission_electro_school = [_sar_pos, _loot_pos, 1, 8, ["ambush", "patrol"], _loot_boxes, _loot_types, _text_start, _text_done, _text_failed];


// ELECTRO -- SHOP -- PATROL / AMBUSH
_sar_pos = 			[10440.7,2363.39,0.00143909];
_loot_pos =		  	[
					[10434.5,2363.96,0.00143862],
					[10430.6,2361.42,0.00143814],
					[10426.6,2358.95,0.00143814],
					[10419,2352.71,0.0014348]];
_loot_boxes = 		[
					"USVehicleBox",
					"USVehicleBox",
					"USVehicleBox",
					"USVehicleBox"];
_loot_types = 		[
					"Residental",
					"Residental",
					"Residental",
					"Random"];
_text_start = 		"Bandits Have Been Spotted at Electro! Check your map for the location!";
_text_done = 		"All Bandits Have Been Killed at Electro!";
_text_failed = 		"Bandits Have Left Electro";
					
mission_electro_shop = [_sar_pos, _loot_pos, 1, 8, ["ambush", "patrol"], _loot_boxes, _loot_types, _text_start, _text_done, _text_failed];


// DAM  -- AMBUSH - PATROL
_sar_pos = 			[10201.5,3233.67,0.00182343];
_loot_pos =		  	[
					[10188.6,3240.34,0.00149727],
					[10208,3242.45,0.00137901],
					[10222.1,3234.13,0.00133705],
					[10222,3216.36,0.00146675]];
_loot_boxes = 		[
					"USVehicleBox",
					"USLaunchersBox",
					"USLaunchersBox",
					"USVehicleBox"];
_loot_types = 		[
					"Rare",
					"Miltary",
					"Miltary",
					"Random"];
_text_start = 		"Bandits Have Been Spotted! Check your map for the location!";
_text_done = 		"All Bandits Have Been Killed!";
_text_failed = 		"Bandits Have Left";
					
mission_dam = [_sar_pos, _loot_pos, 1, 8, ["ambush", "patrol"], _loot_boxes, _loot_types, _text_start, _text_done, _text_failed];


// GREEN MOUNTAIN
_sar_pos = 			[3708.2,5996.16,0.00143433];
_loot_pos =		  	[
					[3701.12,6004.72,0.00143433],
					[3698.64,6010.62,0.00143433],
					[3688.81,5998.23,0.00143433],
					[3689.88,5989.87,0.00143433]];
_loot_boxes = 		[
					"USVehicleBox",
					"USLaunchersBox",
					"USLaunchersBox",
					"USVehicleBox"];
_loot_types = 		[
					"Rare",
					"Miltary",
					"Miltary",
					"Random"];
_text_start =		"Bandits Have Been Spotted! Check your map for the location!";
_text_done =		"All Bandits Have Been Killed!";
_text_failed = 		"Bandits Have Left";
					
mission_green_mountain = [_sar_pos, _loot_pos, 1, 8, ["ambush", "patrol"], _loot_boxes, _loot_types, _text_start, _text_done, _text_failed];