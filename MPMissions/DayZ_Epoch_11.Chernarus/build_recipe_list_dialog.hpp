class Build_Recipe_List_Dialog{
    idd = -1;
    onLoad="uiNamespace setVariable ['Build_Recipe_List_Dialog', _this select 0]";
    movingenable = true;
    onUnLoad="uiNamespace setVariable ['Build_Recipe_List_Dialog', nil]";
    class Controls{         
        class backroundImage: RscPicture{
	        idc = 1;
            //text = "buildRecipeBook\images\bookbackground.paa";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.224947 * safezoneH + safezoneY;
            w = 0.411042 * safezoneW;
            h = 0.547125 * safezoneH;}; 
        class BuildRecipeListFrame: RscFrame{
            idc = 1800;
            text = "Build Recipe List";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.224947 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.550106 * safezoneH;};
        class RecipeBuildList: RscListbox{
            idc = 2500;
            x = 0.351758 * safezoneW + safezoneX;
            y = 0.29371 * safezoneH + safezoneY;
            w = 0.296484 * safezoneW;
            h = 0.385074 * safezoneH;};
        class BackButton: RscButton{
            idc = 1600;
            text = "Back";
            x = 0.351758 * safezoneW + safezoneX;
            y = 0.692537 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.0550106 * safezoneH;
            action = "closeDialog 0;_nil=[]ExecVM 'buildRecipeBook\build_recipe_dialog.sqf'";};
        class ViewButton: RscButton{
            idc = 1601;
            text = "View selected";
            x = 0.519336 * safezoneW + safezoneX;
            y = 0.692537 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.0550106 * safezoneH;
            action = "_nil=[]ExecVM 'buildRecipeBook\build_recipe_list_select.sqf'";};
    };
};