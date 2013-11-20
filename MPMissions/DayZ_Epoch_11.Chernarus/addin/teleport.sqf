//===================piXel 12-02-2013============
private ["_player","_telelocation","_factIn"];
_player = _this select 0;
_nul = [objNull, _player, rSAY, "teleport"] call RE; 
_telelocation = round (random 20.3);
_factIn = _this select 1;
if (_factIn == "In") then {_telelocation = 18;};
switch (_telelocation) do
	{
 	case 0:
		{
		_player setPosATL [(getPosATL anomalyStone select 0)-200*sin(round(random 359)),(getPosATL anomalyStone select 1)-100*cos(round(random 359)),(getPosATL anomalyStone select 2)+1.5];
		};
	case 1:
		{
		_player setPosATL [(getPosATL anomalySpark select 0)-200*sin(round(random 359)),(getPosATL anomalySpark select 1)-100*cos(round(random 359)),(getPosATL anomalySpark select 2)+1.5];
		};
	case 2:
		{
		_player setPosATL [(getPosATL anomalyFire select 0)-200*sin(round(random 359)),(getPosATL anomalyFire select 1)-100*cos(round(random 359)),(getPosATL anomalyFire select 2)+1.5];
		};
	case 3:
		{
		_player setPosATL [(getPosATL anomalySpark_1 select 0)-200*sin(round(random 359)),(getPosATL anomalySpark_1 select 1)-100*cos(round(random 359)),(getPosATL anomalySpark_1 select 2)+1.5];
		};
	case 4:
		{
		_player setPosATL [(getPosATL anomalySpark_2 select 0)-200*sin(round(random 359)),(getPosATL anomalySpark_2 select 1)-100*cos(round(random 359)),(getPosATL anomalySpark_2 select 2)+1.5];
		};
	case 5:
		{
		_player setPosATL [(getPosATL anomalySpark_3 select 0)-200*sin(round(random 359)),(getPosATL anomalySpark_3 select 1)-100*cos(round(random 359)),(getPosATL anomalySpark_3 select 2)+1.5];
		};
	case 6:
		{
		_player setPosATL [(getPosATL anomalySpark_4 select 0)-200*sin(round(random 359)),(getPosATL anomalySpark_4 select 1)-100*cos(round(random 359)),(getPosATL anomalySpark_4 select 2)+1.5];
		};
	case 7:
		{
		_player setPosATL [(getPosATL anomalyFire_1 select 0)-200*sin(round(random 359)),(getPosATL anomalyFire_1 select 1)-100*cos(round(random 359)),(getPosATL anomalyFire_1 select 2)+1.5];
		};
	case 8:
		{
		_player setPosATL [(getPosATL anomalyFire_2 select 0)-200*sin(round(random 359)),(getPosATL anomalyFire_2 select 1)-100*cos(round(random 359)),(getPosATL anomalyFire_2 select 2)+1.5];
		};
	case 8:
		{
		_player setPosATL [(getPosATL anomalyStone_1 select 0)-200*sin(round(random 359)),(getPosATL anomalyStone_1 select 1)-100*cos(round(random 359)),(getPosATL anomalyStone_1 select 2)+1.5];
		};
	case 10:
		{
		_player setPosATL [(getPosATL anomalyStone_2 select 0)-200*sin(round(random 359)),(getPosATL anomalyStone_2 select 1)-100*cos(round(random 359)),(getPosATL anomalyStone_2 select 2)+1.5];
		};
	case 11:
		{
		_player setPosATL [(getPosATL anomalyStoneFac select 0)-1*sin(round(random 359)),(getPosATL anomalyStoneFac select 1)-1*cos(round(random 359)),(getPosATL anomalyStoneFac select 2)+1.5];
		};
	case 12:
		{
		_player setPosATL [(getPosATL anomalySparkFac select 0)-1*sin(round(random 359)),(getPosATL anomalySparkFac select 1)-1*cos(round(random 359)),(getPosATL anomalySparkFac select 2)+1.5];
		};
	case 13:
		{
		_player setPosATL [(getPosATL anomalyFireFac select 0)-1*sin(round(random 359)),(getPosATL anomalyFireFac select 1)-1*cos(round(random 359)),(getPosATL anomalyFireFac select 2)+1.5];
		};		
	case 14:
		{
		//rogpor
		_player setPosATL [11252.922,4298.4238,2];
		};
	case 15:
		{
		//greenmountain
		_player setPosATL [3704.6484,5988.3066,2];
		};
	case 16:
		{
		//devils castle
		_player setPosATL [6894.3135,11435.512,2];
		};
	case 17:
		{
		//black mountain
		_player setPosATL [10285.188,12055.198,2];
		};
	case 18:
		{
		//factory
		_player setPosATL [7901.9189,13685.755,0.1];
		};
	case 19:
		{
		_player setPosATL [(getPosATL anomalyStone_3 select 0)-200*sin(round(random 359)),(getPosATL anomalyStone_3 select 1)-100*cos(round(random 359)),(getPosATL anomalyStone_3 select 2)+1.5];
		};
	case 20:
		{
		_player setPosATL [(getPosATL anomalySpark_5 select 0)-200*sin(round(random 359)),(getPosATL anomalySpark_5 select 1)-100*cos(round(random 359)),(getPosATL anomalySpark_5 select 2)+1.5];
		};
	};