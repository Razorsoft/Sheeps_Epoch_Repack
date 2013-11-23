
waitUntil {!isNull player};

private ["_nrDist","_finishHour","_startHour","_LocalLight","_doLight","_safeCount","_saferMode","_flickering","_plCellsLitVar","_objLightPoint","_awayx","_awayy","_location","_plCurrX","_plCurrY","_map"];



_startHour = 17; 
_finishHour = 6; 
_saferMode = true;
_LocalLight = false;
_nrDist = 8; 








_map = [[484,1546,0],[14323,13556,0]];








_plCellsLitVar = [];

private["_mtrxNum","_mapSW","_mapNE","_widthX","_widthY","_cellWidth","_cellHeight","_lp"];
while {alive player}do{
     
    if(daytime<_finishHour||daytime>_startHour)then {
        _safeCount = 0;
        axeLampReturn=[];
        _plCellsLitVar = player getVariable ["axeCellsLit",[]];
        
        sleep 0.5;
        _plCurrX = getPos vehicle player select 0;
        _plCurrY = getPos vehicle player select 1;
        _mtrxNum = 6;
        _mapSW = _map select 0;
        _mapNE = _map select 1;
        _widthX = (_mapNE select 0) - (_mapSW select 0);
        _widthY = (_mapNE select 1) - (_mapSW select 1);
        _cellWidth = _widthX / _mtrxNum;
        _cellHeight = _widthY / _mtrxNum;
 
        
        for "_x" from 0 to (_mtrxNum - 1) do {
            if(_plCurrX > (_mapSW select 0) + (_cellWidth * _x) && _plCurrX < (_mapSW select 0) + (_cellWidth * (_x+1)))then{
                for "_y" from 0 to (_mtrxNum - 1) do {
                    if(_plCurrY > (_mapSW select 1) + (_cellHeight * _y) && _plCurrY < (_mapSW select 1) + (_cellHeight * (_y+1)))then{
                        if(call Compile format ["%1%2",_x,_y] in _plCellsLitVar)then{
                        axeLampReturn=[];
                        
                        }else{
                        
                        axeLampObjects = [_x,_y,player];
                        publicVariable "axeLampObjects";
                        waitUntil {count axeLampReturn > 0};
                        Call Compile format ["_plCellsLitVar = _plCellsLitVar + [%1%2]",_x,_y];
                        
                        };
                    };
                };
            };
        };
 
        if(count axeLampReturn >0)then{
            
            {
            _doLight = true;
                if(_saferMode&&_safeCount%2==0)then{
                    _doLight = false;
                };
                _safeCount = _safeCount + 1;
                if(_doLight)then{
                _location = [_x select 0,_x select 1,_x select 2];
                _objLightPoint = nearestObject [_location, "#lightpoint"];
                _awayx=(_location select 0)-(getPos _objLightPoint select 0);
                _awayy=(_location select 1)-(getPos _objLightPoint select 1);
         
                    if((_awayx>_nrDist or _awayx<-_nrDist)or(_awayy>_nrDist or _awayy<-_nrDist))then{
                    _location set [1, (_x select 1) + ((0.6)*sin(_x select 3))];
                    _location set [2,_location select 2 - 0.2];
                    _location=[_location select 0, _location select 1, _location select 2];
                        if(_LocalLight)then{
                        _lp = "#lightpoint" createVehicleLocal _location;
                        }else{
                        _lp = "#lightpoint" createVehicle _location;
                        };
                    _lp setLightColor [1, 0.88, 0.73];
                    _lp setLightBrightness 0.04;
                    _lp setLightAmbient [1, 0.88, 0.73];
                    _lp setVectorUp [0,0,-1];
                    _lp setVariable ["axeLit",1];
                    
                    
 
                    }else{
                        if(_objLightPoint getVariable ["axeLit",0]<1)then{
                       
                        _objLightPoint setLightColor [1, 0.88, 0.73];
                        _objLightPoint setLightBrightness 0.04;
                        _objLightPoint setLightAmbient [1, 0.88, 0.73];
                        _objLightPoint setVectorUp [0,0,-1];
                        _objLightPoint setVariable ["axeLit",1];
                        
                        };
                    };
                };
     
            }forEach axeLampReturn;
        player setVariable ["axeCellsLit",_plCellsLitVar];
        };
 
    sleep 3;
    };
};