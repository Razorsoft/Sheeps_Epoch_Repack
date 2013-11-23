if (isServer) then {
	waitUntil{dayz_preloadFinished};
};
_id = [] execFSM "dayz_code\system\player_monitor.fsm";