////////////////////////////////////////////////////////////////////////////////////////
//      DayZ Air Raid written by                                                    //
//              mmmyum    with    work    from                                      //
// sirens: http://www.armaholic.com/page.php?id=12598 by DarkXess                    //
// bombs: http://www.armaholic.com/page.php?id=15612 by Maxjoiner                    //
////////////////////////////////////////////////////////////////////////////////////////
 
/////////////////////////SETUP repeat and break
 
private ["_espl","_sound","_pos2","_pos2cnt","_seconds","_rndLoc","_place","_position","_choice","_duration","_xpos","_ypos","_targetpos","_loc","_target","_pos","_siren","_pos1","_choise","_ray","_dblsecs","_repeat","_break"];
sleep 10;
_repeat = 30;                            //times to repeat
_break = 120;                            //time to break between attacks
_position = [13135.9, 10393.3, 1.5]; //leave this
_xpos = 13135.9;
_ypos = 10393.3;
//repeat script
diag_log format ["AIRRAID: Starting..."];
sleep 2;
While {_repeat > 1} do {
/////////////////////////SETUP position
//                                      enter positions below. format x,y,z
    _rndLoc=floor(random 5);
    _place=
    switch (_rndLoc) do
    {
      case 0: {"Electro"};
      case 1: {"Berezino"};
      case 2: {"NEAF"};
      case 3: {"Stary"};
      case 4: {"Vybor"};
      case 5: {"Gorka"};
    };
    diag_log format ["AIRRAID: Random Location: %1 | %2",_rndLoc,_place];
    _position=
    switch (_rndLoc) do
    {
      case 0: {[10480.6, 2217.8, 1.5]};
      case 1: {[12043.9, 9091.3, 1.5]};
      case 2: {[12073.9, 12724.3, 1.5]};
      case 3: {[6143.6, 7721.5, 1.5]};
      case 4: {[3815.1, 8865.0, 1.5]};
      case 5: {[9659.0, 8795.3, 1.5]};
    };
//////////////////////////SETUP type of bombing and duration
_choice = 1;
_duration = 60;
/////////////////////////
_xpos = _position select 0;
_ypos = _position select 1;
_targetpos = [_xpos, _ypos, 1.5];
_loc = createVehicle ["HeliHEmpty", _targetpos,[], 0, "NONE"];
_target = createVehicle ["HeliHEmpty",position _loc,[], 0, "NONE"];  // target bombing
sleep 2;
diag_log format ["AIRRAID: INCOMING ATTACK: Sounding Siren at: %1 %2 | Repeat: %3| Type: %4 | Duration: %5",_xpos,_ypos,_repeat,_choice,_duration];
 
 
//sound siren
_pos = position _target;
diag_log format ["AIRRAID: POS: %1 | TARGET: %2 | SHOULD MATCH",_pos,_targetpos];
_siren = createVehicle ["HeliHEmpty",position _target,[], 0, "NONE"];
[nil,_siren,rSAY,['eve', 3500]] call RE;
sleep 60;
_pos1 = position _siren;
diag_log format ["AIRRAID: SIREN: %1 | TARGET: %2 | SHOULD MATCH APPROX",_pos1,_targetpos];
[nil,_siren,rSAY,['puk', 3500]] call RE;
sleep 60;
[nil,_siren,rSAY,['eve', 3500]] call RE;
sleep 60;
[nil,_siren,rSAY,['nam', 3500]] call RE;
sleep 10;
[nil,_siren,rSAY,['puk', 3500]] call RE;
sleep 60;
[nil,_siren,rSAY,['nam', 3500]] call RE;
sleep 5;
 
//start bombing init
_choise = _choice;    // choise bombing: 1 = light 2 = medium 3 = heavy
_ray = 120;          // ray of bombing
_seconds = _duration; // time bombing
_dblsecs = _seconds * 2;
diag_log format ["AIRRAID: Bombing Area: %1 %2",_xpos,_ypos];
 
//start bombing
_pos2 = [getPosATL _siren];
While {_seconds > 1} do {
_sound = createVehicle ["HeliHEmpty",position _target,[], _ray, "NONE"];
[nil,_sound,rSAY,['mortar1', 3500]] call RE;
_pos2 set [_seconds, getPosATL _sound];
sleep 2;
If (_choise == 1) then {
_espl = createVehicle ["SH_105_HE",position _sound,[], 0, "NONE"];
};
If (_choise == 2) then {
_espl = createVehicle ["SH_125_HE",position _sound,[], 0, "NONE"];
};
If (_choise == 3) then {
_espl = createVehicle ["BO_GBU12_LGB",position _sound,[], 0, "NONE"];
};
_pos2 = [_dblsecs,getPosATL _espl];
_pos2cnt = count _pos2;
diag_log format ["AIRRAID: BOMB: %1 | TARGET: %2 | SHOULD MATCH APPROX ||| debug arraycount %3 |",str(_pos2),_targetpos,_pos2cnt];
_seconds = _seconds - 1;
deletevehicle _sound;
};
 
//cleanup
sleep 60;
_repeat = _repeat - 1;
deletevehicle _espl;
deletevehicle _siren;
deletevehicle _loc;
deletevehicle _target;
diag_log format ["AIRRAID: Going down for sleep: Repeat:%1 | Sleep:%2",_repeat,_break];
sleep _break;                
};
exit