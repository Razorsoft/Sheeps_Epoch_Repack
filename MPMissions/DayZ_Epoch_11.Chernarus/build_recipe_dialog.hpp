class Build_Recipe_Dialog{
    idd = -1;
    onLoad="uiNamespace setVariable ['Build_Recipe_Dialog', _this select 0]";
    movingenable = true;
    onUnLoad="uiNamespace setVariable ['Build_Recipe_Dialog', nil]";
    class Controls{
class DialogBox: BOX{
	idc = -1;
    text = "";
	x = 0.211851 * safezoneW + safezoneX;
	y = 0.194721 * safezoneH + safezoneY;
	w = 0.575881 * safezoneW;
	h = 0.631944 * safezoneH;};  
class RecipeFrame: RscFrame{
	idc = 1800;
	text = "Base Building Recipe Book";
	x = 0.211851 * safezoneW + safezoneX;
	y = 0.194721 * safezoneH + safezoneY;
	w = 0.575881 * safezoneW;
	h = 0.631944 * safezoneH;};
class ObjectImage: RscPicture{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.621195 * safezoneW + safezoneX;
	y = 0.347186 * safezoneH + safezoneY;
	w = 0.162083 * safezoneW;
	h = 0.30952 * safezoneH;};
class ClassNameFrame: RscFrame{
	idc = 1801;
	text = "Materials needed:";
	x = 0.214286 * safezoneW + safezoneX;
	y = 0.2375 * safezoneH + safezoneY;
	w = 0.571685 * safezoneW;
	h = 0.542594 * safezoneH;};
class TankQtyText: RscText{
	idc = 1000;
	text = "x 1";
	x = 0.258929 * safezoneW + safezoneX;
	y = 0.2625 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;};
class WireQuanty: RscText{
	idc = 1001;
	text = "1";
	x = 0.258929 * safezoneW + safezoneX;
	y = 0.35 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;};
class SandQuanty: RscText{
	idc = 1002;
	text = "1";
	x = 0.258929 * safezoneW + safezoneX;
	y = 0.4375 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;};
class LumberQuanty: RscText{
	idc = 1003;
	text = "1";
	x = 0.258929 * safezoneW + safezoneX;
	y = 0.525 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;};
class PlywoodQty: RscText{
	idc = 1004;
	text = "1";
	x = 0.258929 * safezoneW + safezoneX;
	y = 0.6125 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;};
class GrenadeQty: RscText{
	idc = 1005;
	text = "1";
	x = 0.258929 * safezoneW + safezoneX;
	y = 0.7 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;};
class PrevButton: RscButton{
	idc = 1603;
	action = "_nil=[]ExecVM 'buildRecipeBook\prevBuildRecipe.sqf'";
	text = "Previous Page";
	x = 0.214286 * safezoneW + safezoneX;
	y = 0.7875 * safezoneH + safezoneY;
	w = 0.0727273 * safezoneW;
	h = 0.0333333 * safezoneH;};
class ClassNameText: RscText{
	idc = 1006;
	text = "CLASS NAME";
	x = 0.216212 * safezoneW + safezoneX;
	y = 0.209861 * safezoneH + safezoneY;
	w = 0.372727 * safezoneW;
	h = 0.0166667 * safezoneH;};
class NextButton: RscButton{
	idc = 1604;
	action = "_nil=[]ExecVM 'buildRecipeBook\nextBuildRecipe.sqf'";
	text = "Next Page";
	x = 0.712724 * safezoneW + safezoneX;
	y = 0.7875 * safezoneH + safezoneY;
	w = 0.0727273 * safezoneW;
	h = 0.0333333 * safezoneH;};
class ShowButton: RscButton{
	idc = 1600;
	action = "closeDialog 0;_nil=[]ExecVM 'dayz_code\compile\player_basebuild.sqf'";
	text = "Build!";
	x = 0.348214 * safezoneW + safezoneX;
	y = 0.7875 * safezoneH + safezoneY;
	w = 0.0727273 * safezoneW;
	h = 0.0333333 * safezoneH;};
class ShowListButton: RscButton{
	idc = 1601;
	action = "closeDialog 0;_nil=[]ExecVM 'buildRecipeBook\build_recipe_list_dialog.sqf'";
	text = "Show List";
	x = 0.579836 * safezoneW + safezoneX;
	y = 0.7875 * safezoneH + safezoneY;
	w = 0.0727273 * safezoneW;
	h = 0.0333333 * safezoneH;};
class ReqFrame: RscFrame{
	idc = 1802;
	text = "Requirements";
	x = 0.5 * safezoneW + safezoneX;
	y = 0.300167 * safezoneH + safezoneY;
	w = 0.115998 * safezoneW;
	h = 0.395369 * safezoneH;};
class InBuildingText: RscText{
	idc = 1007;
	text = "In Building:";
	x = 0.5 * safezoneW + safezoneX;
	y = 0.488245 * safezoneH + safezoneY;
	w = 0.0542709 * safezoneW;
	h = 0.0249579 * safezoneH;};
class OnRoadText: RscText{
	idc = 1008;
	text = "On Road:";
	x = 0.5 * safezoneW + safezoneX;
	y = 0.52351 * safezoneH + safezoneY;
	w = 0.0542709 * safezoneW;
	h = 0.0249579 * safezoneH;};
class RscText_1009: RscText{
	idc = 1009;
	text = "In Town:";
	x = 0.5 * safezoneW + safezoneX;
	y = 0.558775 * safezoneH + safezoneY;
	w = 0.0542709 * safezoneW;
	h = 0.0249579 * safezoneH;};
class RemText: RscText{
	idc = 1010;
	text = "Removable:";
	x = 0.5 * safezoneW + safezoneX;
	y = 0.605794 * safezoneH + safezoneY;
	w = 0.0542709 * safezoneW;
	h = 0.0249579 * safezoneH;};
class building: RscText{
	idc = 1014;
	text = "building";
	x = 0.582633 * safezoneW + safezoneX;
	y = 0.488245 * safezoneH + safezoneY;
	w = 0.0313546 * safezoneW;
	h = 0.0221405 * safezoneH;};
class road: RscText{
	idc = 1011;
	text = "etool";
	x = 0.582633 * safezoneW + safezoneX;
	y = 0.52351 * safezoneH + safezoneY;
	w = 0.0297918 * safezoneW;
	h = 0.0221405 * safezoneH;};
class town: RscText{
	idc = 1012;
	text = "False";
	x = 0.582633 * safezoneW + safezoneX;
	y = 0.558775 * safezoneH + safezoneY;
	w = 0.0297918 * safezoneW;
	h = 0.0221405 * safezoneH;};
class removable: RscText{
	idc = 1013;
	text = "False";
	x = 0.582633 * safezoneW + safezoneX;
	y = 0.605794 * safezoneH + safezoneY;
	w = 0.0297918 * safezoneW;
	h = 0.0221405 * safezoneH;};
class chance: RscText{
	idc = 1018;
	text = "Chance: 30% (50% lt)";
	x = 0.511018 * safezoneW + safezoneX;
	y = 0.652814 * safezoneH + safezoneY;
	w = 0.0959376 * safezoneW;
	h = 0.0221405 * safezoneH;};
class time: RscText{
	idc = 1015;
	text = "False";
	x = 0.582633 * safezoneW + safezoneX;
	y = 0.441225 * safezoneH + safezoneY;
	w = 0.0297918 * safezoneW;
	h = 0.0221405 * safezoneH;};
class etool: RscText{
	idc = 1016;
	text = "False";
	x = 0.582633 * safezoneW + safezoneX;
	y = 0.394206 * safezoneH + safezoneY;
	w = 0.0297918 * safezoneW;
	h = 0.0221405 * safezoneH;};
class toolbox: RscText{
	idc = 1017;
	text = "False";
	x = 0.582633 * safezoneW + safezoneX;
	y = 0.347186 * safezoneH + safezoneY;
	w = 0.0297918 * safezoneW;
	h = 0.0221405 * safezoneH;};
class SandBagLargQuanty: RscText{
	idc = 1020;
	text = "1";
	x = 0.348214 * safezoneW + safezoneX;
	y = 0.35 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;};
class BurlapQty: RscText{
	idc = 1021;
	text = "1";
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.6125 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;};
class ScrapQty: RscText{
	idc = 1022;
	text = "1";
	x = 0.348214 * safezoneW + safezoneX;
	y = 0.525 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;};
class PoleQty: RscText{
	idc = 1023;
	text = "1";
	x = 0.348214 * safezoneW + safezoneX;
	y = 0.6125 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;};
class GlassQty: RscText{
	idc = 1024;
	text = "1";
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.7 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;};
class ForestNetKit: RscText{
	idc = 1025;
	text = "1";
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.4375 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;};
class desert_net_kit: RscText{
	idc = 1026;
	text = "1";
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.35 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;};
class SotrageShedKit: RscText{
	idc = 1027;
	text = "1";
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.2625 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;};
class wooden_shed_kitQuanty: RscText{
	idc = 1028;
	text = "1";
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.525 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;};
class SandBagNestKitQuanty: RscText{
	idc = 1029;
	text = "1";
	x = 0.348214 * safezoneW + safezoneX;
	y = 0.4375 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;};
class FenceQuanty: RscText{
	idc = 1030;
	text = "1";
	x = 0.348214 * safezoneW + safezoneX;
	y = 0.7 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;};
class TankImage: RscPicture{
	idc = 1201;
	text = "dayz_equip\textures\equip_tanktrap_kit_CA.paa";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.2625 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Tank Trap";};
class WireImage: RscPicture{
	idc = 1202;
	text = "dayz_equip\textures\equip_wire_CA.paa";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.35 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Wire";};
class SandBagImage: RscPicture{
	idc = 1203;
	text = "dayz_equip\textures\equip_sandbag_CA.paa";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.4375 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Sand Bag";};
class LumberImage: RscPicture{
	idc = 1204;
	text = "\z\addons\dayz_epoch\pictures\equip_wood_planks_CA.paa";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.525 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Lumber";};
class PlyWoodImage: RscPicture{
	idc = 1205;
	text = "\z\addons\dayz_epoch\pictures\equip_plywood_CA.paa";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.6125 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "PlyWood";};
class GrenadeImage: RscPicture{
	idc = 1206;
	text = "\CA\weapons\data\equip\m_M67_CA.paa";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.7 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Grenades";};
class ToolboxImage: RscPicture{
	idc = 1207;
	text = "dayz_equip\textures\equip_toolbox_CA.paa";
	x = 0.511018 * safezoneW + safezoneX;
	y = 0.347186 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "ToolBox";};
class EToolImage: RscPicture{
	idc = 1208;
	text = "dayz_equip\textures\equip_etool_CA.paa";
	x = 0.511018 * safezoneW + safezoneX;
	y = 0.394206 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Etool";};
class TimeImage: RscPicture{
	idc = 1209;
	text = "buildRecipeBook\images\timer.paa";
	x = 0.511018 * safezoneW + safezoneX;
	y = 0.441225 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Timer";};
class SandbagLargeImage: RscPicture{
	idc = 1211;
	text = "buildRecipeBook\images\ItemSandbagLarge.paa";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.35 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "SandbagLarge";};
class BurlapImage: RscPicture{
	idc = 1212;
	text = "\z\addons\dayz_epoch\pictures\equip_burlap_ca.paa";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.4375 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Burlap";};
class ScrapImage: RscPicture{
	idc = 1213;
	text = "dayz_equip\textures\equip_genericparts_CA.paa";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.525 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Scrap";};
class PoleImage: RscPicture{
	idc = 1214;
	text = "\z\addons\dayz_epoch\pictures\equip_pipe_CA.paa";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.6125 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Pole";};
class PartGlassImage: RscPicture{
	idc = 1215;
	text = "dayz_equip\textures\equip_carglass_CA.paa";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.7 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Glass";};
class ForestNetKitKitImage: RscPicture{
	idc = 1216;
	text = "buildRecipeBook\images\Forest_Net_Kit.paa";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.2625 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "forest_net_kit";};
class desert_net_kitImage: RscPicture{
	idc = 1217;
	text = "buildRecipeBook\images\desert_net_kit.paa";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.35 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "desert_net_kit";};
class StorageShedKitkitImage: RscPicture{
	idc = 1218;
	text = "buildRecipeBook\images\Storage_shed_kit.paa";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.4375 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "SotrageShedKit";};
class ItemWoodShed: RscPicture{
	idc = 1219;
	text = "buildRecipeBook\images\wood_shack_kit.paa";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.525 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "WoodShedKit";};
class SandBagNestKitImage: RscPicture{
	idc = 1220;
	text = "buildRecipeBook\images\sandbag_nest_kit.paa";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.6125 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "SandBagNestKit";};
class FenceImage: RscPicture{
	idc = 1221;
	text = "buildRecipeBook\images\ItemCorrugated.paa";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.7 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Fence";};
class TankTrapText: RscText{
	idc = 1031;
	text = "Tank Trap";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.3125 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;};
class WireFenceKitText: RscText{
	idc = 1032;
	text = "Wire Fence Kit";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.4 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;};
class SandBagsText: RscText{
	idc = 1033;
	text = "Sand Bags";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.4875 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;};
class LumberText: RscText{
	idc = 1034;
	text = "Lumber";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.575 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;};
class PlyWoodText: RscText{
	idc = 1035;
	text = "PlyWood";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.6625 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;};
class GrenadeText: RscText{
	idc = 1036;
	text = "Grenade";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.75 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;};
class HbarrierText: RscText{
	idc = 1038;
	text = "HBarrier";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.4 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;};
class BurlapText: RscText{
	idc = 1039;
	text = "Burlap";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.4875 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;};
class ScrapMetalText: RscText{
	idc = 1040;
	text = "Scrap Metal";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.575 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;};
class PolesText: RscText{
	idc = 1041;
	text = "Poles";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.6625 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;};
class WindscreenText: RscText{
	idc = 1042;
	text = "Windscreen";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.75 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;};
class ForestNetKitText: RscText{
	idc = 1043;
	text = "Forest Net Kit";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.3125 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;};
class DesertNetkitText: RscText{
	idc = 1044;
	text = "Desert Net Kit";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.4 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;};
class StorageShedText: RscText{
	idc = 1045;
	text = "Storage Shed Kit";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.4875 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;};
class WoodenShedKitText: RscText{
	idc = 1046;
	text = "Wooden Shed Kit";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.575 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;};
class SandBagNestKitText: RscText{
	idc = 1047;
	text = "SandBag Nest Kit";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.6625 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;};
class CorrugatedFenceText: RscText{
	idc = 1048;
	text = "Corrugated Fence Kit";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.75 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;};
   };
};