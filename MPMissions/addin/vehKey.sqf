
private["_player","_handled","_display"];

_player = player;
_handled = false;
switch (_this select 1) do
	{
	
	case 14: 
		{
		detach _player;
		[nil,_player,rSwitchMove, "AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_GetOutHigh"] call RE;
		_display = findDisplay 46;
		_display displaySetEventHandler ["KeyDown", ""];
		_handled = true;
		};
	};
_handled;