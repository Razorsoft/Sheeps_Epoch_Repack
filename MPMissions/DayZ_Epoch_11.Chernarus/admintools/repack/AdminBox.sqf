_location = (position player);
_className = "AmmoBoxBig";
_dayz_wep =["M14_EP1","Remington870_lamp","M4A3_CCO_EP1","M4A1_AIM_SD_camo","BAF_L85A2_RIS_CWS","BAF_AS50_scoped","Winchester1866","LeeEnfield","revolver_EP1","FN_FAL","FN_FAL_ANPVS4","m107_DZ",
"Mk_48_DZ","DMR","M16A2","M16A2GL","bizon_silenced","AK_74","M4A1_Aim","AKS_74_kobra","AKS_74_U","AK_47_M","M24","SCAR_H_LNG_Sniper_SD","SCAR_H_STD_TWS_SD","SVD_des_EP1","M1014","M4A1","MP5SD","MP5A5","huntingrifle","Crossbow","glock17_EP1","M9",
"M9SD","Colt1911","UZI_EP1",
"Binocular","Binocular_Vector","NVGoggles","ItemGPS","ItemMap","ItemCompass","ItemWatch","ItemFlashlight","ItemFlashlightRed","ItemKnife","ItemHatchet","ItemMatchbox",
"ItemEtool","ItemToolbox"];
_dayz_mag =["30Rnd_556x45_Stanag","30Rnd_556x45_StanagSD","20Rnd_762x51_DMR","30Rnd_762x39_AK47","10Rnd_762x54_SVD","5Rnd_762x51_M24","10Rnd_127x99_m107","8Rnd_B_Beneli_74Slug","1Rnd_HE_M203","FlareWhite_M203","FlareGreen_M203","1Rnd_Smoke_M203","200Rnd_556x45_M249","8Rnd_B_Beneli_Pellets","30Rnd_9x19_MP5","20rnd_762x51_SB_SCAR","30Rnd_9x19_MP5SD","100Rnd_762x51_M240","15Rnd_W1866_Slug","5x_22_LR_17_HMR","10x_303","15Rnd_9x19_M9","15Rnd_9x19_M9SD","7Rnd_45ACP_1911","17Rnd_9x19_glock17","8Rnd_9x18_Makarov","6Rnd_45ACP","8Rnd_9x18_Makarov","BoltSteel","PipeBomb","HandGrenade_west","FoodBioMeat","FoodCanBakedBeans","FoodCanFrankBeans","FoodCanPasta","FoodCanSardines","FoodCanUnlabeled","FoodEdible","FoodMRE","FoodNutmix","FoodPistachio","FoodSteakCooked","FoodSteakRaw","ItemZombieParts","ItemSodaCoke","ItemSodaMdew","ItemSodaOrangeSherbet","ItemSodaPepsi","ItemSodaRbull","ItemWaterbottle","HandRoadFlare","HandChemGreen","HandChemBlue","HandChemRed","ItemBandage","ItemPainkiller","ItemMorphine","ItemEpinephrine","ItemAntibiotic","ItemBloodbag","ItemHeatPack","ItemSandbag","ItemTankTrap","ItemWire","PartWoodPile","30m_plot_kit","ItemPole","ItemCanvas","PartWoodLumber","PartWoodPlywood","ItemLightBulb","ItemBurlap","ItemCorrugated","ItemSandbagLarge","CinderBlocks","PartWheel","PartFueltank","PartGlass","PartEngine","PartGeneric","PartVRotor","ItemJerrycan","ItemGenerator","ItemTent","ItemVault","ItemFishingPole","MortarBucket","ItemComboLock","ItemKeyKit","ItemLockbox","ItemCopperBar","ItemSilverBar","ItemGoldBar","ItemBronzeBar","ItemAluminumBar","ItemTinBar","ItemCopperBar10oz","ItemGoldBar10oz","ItemSilverBar10oz","ItemTinBar10oz","ItemAluminumBar10oz","ItemBriefcase10oz","ItemBriefcase30oz","ItemBriefcase40oz","ItemBriefcase50oz","ItemBriefcase60oz","ItemBriefcase70oz","ItemBriefcase80oz","ItemBriefcase90oz","ItemBriefcase100oz","ItemBriefcaseEmpty","Skin_Soldier1_DZ","Skin_Survivor2_DZ","Skin_Camo1_DZ","Skin_Sniper1_DZ"];
_dayz_bpk =["DZ_Patrol_Pack_EP1","TK_RPG_Backpack_EP1","DZ_Assault_Pack_EP1","DZ_CivilBackpack_EP1","DZ_ALICE_Pack_EP1","DZ_Backpack_EP1"];
_svr = format["
if (isServer) then {
_box = createVehicle [%1, %2, [], 0, 'CAN_COLLIDE'];
_box setVariable ['ObjectID', 654654, true];
{_box addWeaponCargo [_x,100];} forEach %3;  
{_box addMagazineCargo [_x,100];} forEach %4; 
{_box addBackpackCargo [_x,2];} forEach %5;
}", _className, _location, _dayz_wep, _dayz_mag, _dayz_bpk];
sleep 0.1;
player setVehicleInit _svr;
sleep 0.1;
processInitCommands;
sleep 0.1;
clearVehicleInit player;