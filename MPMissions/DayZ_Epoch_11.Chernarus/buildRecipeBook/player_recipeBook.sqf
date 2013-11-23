

_recipeBook = [];
{
	_requeriments  = _x select 0;
    
    _requeriments_string="";
    _i =0;
    {
        _letters=["TankTrap","Wire","Sandbag","Lumber","Plywood","Grenade","Tin","Hesco","SandbagNest","Scrap","Pole","CorrugatedFence","StorageShed","DesertCamoNet","ForestCamoNet","WoodShed","Burlap","Glass"];
        _qty="";
        _letter="";
        _qty_letter="";
        if (_x != 0) then {
            _qty = format["%1",_x];
            _letter= _letters select _i;
            _qty_letter=","+_qty+_letter;
        };
        _requeriments_string = format["%1%2",_requeriments_string,_qty_letter];
        
        
        _i = _i + 1;
    } foreach(_requeriments);
    
	_classname = _x select 1;
    
    _row = _classname +":"+ _requeriments_string;
    _recipeBook=_recipeBook + [_row];
	
    
} foreach(allbuildables);

buildRecipeBook = _recipeBook;



"[Tanktrap, Wire, Sandbag, Lumber, Plywood, Grenade, Tin, Hbarrier(ItemSandbagLarge), sandbag_nest_kit, Scrap, Pole, Fencing, storage_shed_kit, desert_net_kit, forest_net_kit, wooden_shed_kit, ItemBurlap, PartGlass]" hintC buildRecipeBook;
