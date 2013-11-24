_recipe = allBuildables select currentBuildRecipe;
_requeriments = [];
_classname = "";
_requeriments  = _recipe select 0;
_classname = _recipe select 1;
_recipeQtyTankTrap= _requeriments select 0;
_recipeQtyWire= _requeriments select 1;
_recipeQtySandbag= _requeriments select 2;
_recipeQtyLumber= _requeriments select 3;
_recipeQtyPlywood= _requeriments select 4;
_recipeQtyGrenade= _requeriments select 5;
_recipeQtyHesco= _requeriments select 6;
_recipeQtySandbagNest= _requeriments select 7;
_recipeQtyScrap= _requeriments select 8;
_recipeQtyPole= _requeriments select 9;
_recipeQtyCorrugatedFence= _requeriments select 10;
_recipeQtyStorageShed= _requeriments select 11;
_recipeQtyDesertCamoNet= _requeriments select 12;
_recipeQtyForestCamoNet= _requeriments select 13;
_recipeQtyWoodShed= _requeriments select 14;
_recipeQtyBurlap= _requeriments select 15;
_recipeQtyGlass= _requeriments select 16;
_mags = magazines player;
_qtyTankTrap=0;
_qtyWire=0;
_qtySandbag=0;
_qtyLumber=0;
_qtyPlywood=0;
_qtyGrenade=0;
_qtyHesco=0;
_qtySandbagNest=0;
_qtyScrap=0;
_qtyPole=0;
_qtyCorrugatedFence=0;
_qtyStorageShed=0;
_qtyDesertCamoNet=0;
_qtyForestCamoNet=0;
_qtyWoodShed=0;
_qtyBurlap=0;
_qtyGlass=0;
_buildables = [];
_mags = magazines player;
	if ("ItemTankTrap" in _mags) then {
_qtyTankTrap = {_x == "ItemTankTrap"} count magazines player;
_buildables set [count _buildables, _qtyTankTrap];
_itemTankTrap = "ItemTankTrap";
	} else { _qtyTankTrap = 0; _buildables set [count _buildables, _qtyTankTrap]; };
	if ("ItemWire" in _mags) then {
_qtyWire = {_x == "ItemWire"} count magazines player;
_buildables set [count _buildables, _qtyWire]; 
_itemWire = "ItemWire";
	} else { _qtyWire = 0; _buildables set [count _buildables, _qtyWire]; };
	
	if ("ItemSandbag" in _mags) then {
_qtySandbag = {_x == "ItemSandbag"} count magazines player;
_buildables set [count _buildables, _qtySandbag]; 
_itemSandbag = "ItemSandbag";
} else { _qtySandbag = 0; _buildables set [count _buildables, _qtySandbag]; };
	if ("PartWoodLumber" in _mags) then {
_qtyLumber = {_x == "PartWoodLumber"} count magazines player;
_buildables set [count _buildables, _qtyLumber]; 
_itemLumber = "PartWoodLumber";
	} else { _qtyLumber = 0; _buildables set [count _buildables, _qtyLumber]; };
	
	if ("PartWoodPlywood" in _mags) then {
_qtyPlywood = {_x == "PartWoodPlywood"} count magazines player;
_buildables set [count _buildables, _qtyPlywood]; 
_itemPlywood = "PartWoodPlywood";
	} else { _qtyPlywood = 0; _buildables set [count _buildables, _qtyPlywood]; };
	
	if ("HandGrenade_West" in _mags) then {
_qtyGrenade = {_x == "HandGrenade_West"} count magazines player;
_buildables set [count _buildables, _qtyGrenade]; 
_itemGrenade = "HandGrenade_West";
	} else { _qtyGrenade = 0; _buildables set [count _buildables, _qtyGrenade]; };
	if ("ItemSandbagLarge" in _mags) then {
_qtyHesco = {_x == "ItemSandbagLarge"} count magazines player;
_buildables set [count _buildables, _qtyHesco]; 
_itemHesco = "ItemSandbagLarge";
	} else { _qtyHesco = 0; _buildables set [count _buildables, _qtyHesco]; };
	
	if ("sandbag_nest_kit" in _mags) then {
_qtySandbagNest = {_x == "sandbag_nest_kit"} count magazines player;
_buildables set [count _buildables, _qtySandbagNest]; 
_itemSandbagNest = "sandbag_nest_kit";
	} else { _qtySandbagNest = 0; _buildables set [count _buildables, _qtySandbagNest]; };
	
	if ("PartGeneric" in _mags) then {
_qtyScrap = {_x == "PartGeneric"} count magazines player;
_buildables set [count _buildables, _qtyScrap]; 
_itemScrap = "PartGeneric";
	} else { _qtyScrap = 0; _buildables set [count _buildables, _qtyScrap]; };
	
	if ("ItemPole" in _mags) then {
_qtyPole = {_x == "ItemPole"} count magazines player;
_buildables set [count _buildables, _qtyPole]; 
_itemPole = "ItemPole";
	} else { _qtyPole = 0; _buildables set [count _buildables, _qtyPole]; };
	
	if ("ItemCorrugated" in _mags) then {
_qtyCorrugatedFence = {_x == "ItemCorrugated"} count magazines player;
_buildables set [count _buildables, _qtyCorrugatedFence]; 
_itemCorrugatedFence = "ItemCorrugated";
	} else { _qtyCorrugatedFence = 0; _buildables set [count _buildables, _qtyCorrugatedFence]; };
	
	if ("storage_shed_kit" in _mags) then {
_qtyStorageShed = {_x == "storage_shed_kit"} count magazines player;
_buildables set [count _buildables, _qtyStorageShed]; 
_itemStorageShed = "storage_shed_kit";
	} else { _qtyStorageShed = 0; _buildables set [count _buildables, _qtyStorageShed]; };
	
	if ("desert_net_kit" in _mags) then {
_qtyDesertCamoNet = {_x == "desert_net_kit"} count magazines player;
_buildables set [count _buildables, _qtyDesertCamoNet]; 
_itemDesertCamoNet = "desert_net_kit";
	} else { _qtyDesertCamoNet = 0; _buildables set [count _buildables, _qtyDesertCamoNet]; };
	
	if ("forest_net_kit" in _mags) then {
_qtyForestCamoNet = {_x == "forest_net_kit"} count magazines player;
_buildables set [count _buildables, _qtyForestCamoNet]; 
_itemForestCamoNet = "forest_net_kit";
	} else { _qtyForestCamoNet = 0; _buildables set [count _buildables, _qtyForestCamoNet]; };
	
	if ("wooden_shed_kit" in _mags) then {
_qtyWoodShed = {_x == "wooden_shed_kit"} count magazines player;
_buildables set [count _buildables, _qtyWoodShed]; 
_itemWoodShed = "wooden_shed_kit";
	} else { _qtyWoodShed = 0; _buildables set [count _buildables, _qtyWoodShed]; };
	
	if ("ItemBurlap" in _mags) then {
_qtyBurlap = {_x == "ItemBurlap"} count magazines player;
_buildables set [count _buildables, _qtyBurlap]; 
_itemBurlap = "ItemBurlap";
	} else { _qtyBurlap = 0; _buildables set [count _buildables, _qtyBurlap]; };
	
	if ("PartGlass" in _mags) then {
_qtyGlass = {_x == "PartGlass"} count magazines player;
_buildables set [count _buildables, _qtyGlass]; 
_itemGlass = "PartGlass";
	} else { _qtyGlass = 0; _buildables set [count _buildables, _qtyGlass]; };
_result = false;
_result = [_requeriments,_buildables] call BIS_fnc_areEqual;
_restrictions=[];
_restrictions = _recipe select 2;
_toolbox=false;
_toolbox= _restrictions select 3;
_etool=false;
_etool= _restrictions select 4;
_medWait=false;
_longWait=false;
_medWait=_restrictions select 5;
_longWait=_restrictions select 6;
_removable=false;
_removable=_restrictions select 10;
_chance ="";
if (_removable) then {
    _chance="Rem:30% Fail"
};
_timer="10 s";
if(_medWait) then {
    _timer="20 s";
    if (_removable) then {
        _chance="Rem:70% Fail"
    };
 
};
if(_longWait) then {
    _timer="30 s";
    if (_removable) then {
        _chance="Rem:95% Fail"
    };
} ;
_inBuilding=false;
_inBuilding=_restrictions select 7;
_road=false;
_road=_restrictions select 8;
_inTown=false;
_inTown=_restrictions select 9;
with uiNamespace do {
if (!_result) then { 
    (Build_Recipe_Dialog displayCtrl 1600) ctrlEnable false;
} else {
    
    (Build_Recipe_Dialog displayCtrl 1600) ctrlEnable true;
};
    
    (Build_Recipe_Dialog displayCtrl 1006) ctrlSetText format["%1",_classname];
    
    (Build_Recipe_Dialog displayCtrl 1000) ctrlSetText format["x%1  (%2)",_recipeQtyTankTrap,_qtyTankTrap];
    (Build_Recipe_Dialog displayCtrl 1001) ctrlSetText format["x%1  (%2)",_recipeQtyWire,_qtyWire];
    (Build_Recipe_Dialog displayCtrl 1002) ctrlSetText format["x%1  (%2)",_recipeQtySandbag,_qtySandbag];
    (Build_Recipe_Dialog displayCtrl 1003) ctrlSetText format["x%1  (%2)",_recipeQtyLumber,_qtyLumber];
    (Build_Recipe_Dialog displayCtrl 1004) ctrlSetText format["x%1  (%2)",_recipeQtyPlywood,_qtyPlywood];
    (Build_Recipe_Dialog displayCtrl 1005) ctrlSetText format["x%1  (%2)",_recipeQtyGrenade,_qtyGrenade];
	(Build_Recipe_Dialog displayCtrl 1020) ctrlSetText format["x%1  (%2)",_recipeQtyHesco,_qtyHesco];
	(Build_Recipe_Dialog displayCtrl 1021) ctrlSetText format["x%1  (%2)",_recipeQtySandbagNest,_qtySandbagNest];
	(Build_Recipe_Dialog displayCtrl 1022) ctrlSetText format["x%1  (%2)",_recipeQtyScrap,_qtyScrap];
	(Build_Recipe_Dialog displayCtrl 1023) ctrlSetText format["x%1  (%2)",_recipeQtyPole,_qtyPole];
	(Build_Recipe_Dialog displayCtrl 1024) ctrlSetText format["x%1  (%2)",_recipeQtyCorrugatedFence,_qtyCorrugatedFence];
	(Build_Recipe_Dialog displayCtrl 1025) ctrlSetText format["x%1  (%2)",_recipeQtyStorageShed,_qtyStorageShed];
	(Build_Recipe_Dialog displayCtrl 1026) ctrlSetText format["x%1  (%2)",_recipeQtyDesertCamoNet,_qtyDesertCamoNet];
	(Build_Recipe_Dialog displayCtrl 1027) ctrlSetText format["x%1  (%2)",_recipeQtyForestCamoNet,_qtyForestCamoNet];
	(Build_Recipe_Dialog displayCtrl 1028) ctrlSetText format["x%1  (%2)",_recipeQtyWoodShed,_qtyWoodShed];
	(Build_Recipe_Dialog displayCtrl 1029) ctrlSetText format["x%1  (%2)",_recipeQtyBurlap,_qtyBurlap];
	(Build_Recipe_Dialog displayCtrl 1030) ctrlSetText format["x%1  (%2)",_recipeQtyGlass,_qtyGlass];
    
    
    (Build_Recipe_Dialog displayCtrl 1200) ctrlSetText format["buildRecipeBook\images\buildable\%1.jpg",_classname];
    
    
    (Build_Recipe_Dialog displayCtrl 1017) ctrlSetText format["%1",_toolbox];
    (Build_Recipe_Dialog displayCtrl 1016) ctrlSetText format["%1",_etool];
    (Build_Recipe_Dialog displayCtrl 1015) ctrlSetText format["%1",_timer];
    (Build_Recipe_Dialog displayCtrl 1013) ctrlSetText format["%1",_removable];
    (Build_Recipe_Dialog displayCtrl 1012) ctrlSetText format["%1",_inTown];
    (Build_Recipe_Dialog displayCtrl 1011) ctrlSetText format["%1",_road];
    (Build_Recipe_Dialog displayCtrl 1014) ctrlSetText format["%1",_inBuilding];
    (Build_Recipe_Dialog displayCtrl 1018) ctrlSetText format["%1",_chance];
};
