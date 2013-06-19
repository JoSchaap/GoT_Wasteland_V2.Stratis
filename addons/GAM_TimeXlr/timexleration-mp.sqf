/*******************************************************************************
							 --- TimeXleration ---
								  for Arma 3
							  v1.6 Multiplayer (beta)

	Author      : gammadust (GAM)

	Contact		: gamma (dot) stardust (at) gmail (dot) com
	Website		: gamma.toile-libre.com

	Additional  : - BIS for the awesome sandbox 
	Credits		  - Iceman77 for helpful dialog tutorial
				  - Terox for comprehensive help on multiplayer code
				  - Sickboy for his 6thSense multiplayer connection role (Server/Client/JIP) code
				  - Whole community for the help given in learning ArmA
				    scripting and making the ArmA experience even better

	License		: - You are permitted to install, use and modify this software
	Disclaimer	    for personal entertainment/learning purposes only.

					Any commercial, promotional, military or educational use or
					any other use not explicitely stated is forbidden without
					the authors	permission.
					Further inquiries please send them to:
							gamma(dot)stardust(at)gmail(dot)com
					
					You are free to distribute this software for no additional
					charge, only as long as the original package distribution
					and its included licenses are kept intact.

					The authors take no responsibility for any damages this
					software may cause. Use it at your own risk.
					
	Changelog	: - Improved base synching code
				  - Added JIP synching
				  - Added Admin menu (only basic authentication)

	Todo		: - Allow JIPs to become Admin
				  - Unify with single player version

*******************************************************************************/

// Lacking code for defaults
GAM_TXLsrvActive = true;
GAM_TXLsrvSyncDelayM = _this select 0;
GAM_TXLsrvFactor = _this select 1;

//GAM_TXLsrvSyncDelayM = 1;
GAM_TXLsrvSyncDelayS = GAM_TXLsrvSyncDelayM * 60;
//GAM_TXLFactor = 60;
GAM_TXLsrvSkipM = GAM_TXLsrvFactor - GAM_TXLsrvSyncDelayM;

GAM_TXLcliFactor = _this select 1;
GAM_TXLcliActive = _this select 2;
GAM_TXLcliSkipping = _this select 3;

GAM_TXLadmActive = true;

T_INIT = false; T_Server = false; T_Client = false; T_JIP = false;

// Server Functions
GAM_TXLsrvDateUpdate = {
	GAM_TXLsrvActive = true;
	GAM_TXLsrvStartSyncTime = diag_tickTime;
	GAM_TXLsrvDate = call GAM_TXLgetVirtualDate;
	setDate GAM_TXLsrvDate;

	publicVariable "GAM_TXLsrvDate"; // Sync date to clients
	diag_log format ["Sync Start Date: %1", GAM_TXLsrvDate];
	while {true} do {
		GAM_TXLsrvStartSyncTime = diag_tickTime;
		sleep GAM_TXLsrvSyncDelayS;
		GAM_TXLsrvDate = call GAM_TXLgetVirtualDate;
		setDate GAM_TXLsrvDate;
		
		publicVariable "GAM_TXLsrvDate"; // Sync date to clients
		diag_log format ["Sync Cycle Date: %1", GAM_TXLsrvDate];
	};
};

GAM_TXLsrvChangeFactor = {
	GAM_TXLsrvFactor = _this select 1;
	GAM_TXLsrvSkipM = GAM_TXLsrvFactor - GAM_TXLsrvSyncDelayM; // Must update skipping too!!!
	
	GAM_TXLcliFactor = GAM_TXLsrvFactor;
	publicVariable "GAM_TXLcliFactor";
	diag_log format ["New Server Accelleration Factor: %1", GAM_TXLsrvFactor];
};

GAM_TXLsendFactor = {
	//_variable = _this select 0;
	_clientID = (owner (_this select 1)); // Requester
	GAM_TXLcliFactor = GAM_TXLsrvFactor;
	_clientID publicVariableClient "GAM_TXLcliFactor";
	diag_log format ["Accelleration Factor: %1 | Sent to: %2", GAM_TXLsrvFactor, _clientID];
};

GAM_TXLsendStatus = {
	//_variable = _this select 0;
	_clientID = (owner (_this select 1)); // Requester
	GAM_TXLcliStatus = GAM_TXLsrvActive;
	_clientID publicVariableClient "GAM_TXLcliStatus";
	diag_log format ["Accelleration Status: %1 | Sent to: %2", GAM_TXLcliStatus, _clientID];
};

GAM_TXLsrvStartDateUpdate = {
	if (isNil "GAM_TXLsrvDateUpdateHandle") then {
		GAM_TXLsrvDateUpdateHandle = [] spawn GAM_TXLsrvDateUpdate;
		
		GAM_TXLcliStart = true;
		publicVariable "GAM_TXLcliStart";
	};
};

GAM_TXLsrvStopDateUpdate = {
	if !(isNil "GAM_TXLsrvDateUpdateHandle") then {
		terminate GAM_TXLsrvDateUpdateHandle; GAM_TXLsrvDateUpdateHandle = nil;
		
		GAM_TXLsrvDate = call GAM_TXLgetVirtualDate;
		setDate GAM_TXLsrvDate;
		GAM_TXLsrvActive = false;
		
		GAM_TXLcliStop = true;
		publicVariable "GAM_TXLcliStop";		
		publicVariable "GAM_TXLsrvDate";
		diag_log format ["Sync Stop Date: %1", GAM_TXLsrvDate];
	};
};

GAM_TXLgetVirtualDate = {
	_lastFrameTime = 0;
	_virtualDateM = 0; // accounting minutes only
	_virtualDate = 0;
	if (GAM_TXLsrvActive) then { // Only compute if acceleration is Active
		_lastFrameTime = diag_tickTime - GAM_TXLsrvStartSyncTime;
		_virtualDateM = (round (((_lastFrameTime * GAM_TXLsrvFactor) - _lastFrameTime) / 60)); // accounting minutes only
		_virtualDate = [date select 0, date select 1, date select 2, date select 3, ((date select 4) + _virtualDateM)];
	} else {
		_virtualDate = date;
	};
	_virtualDate
};

GAM_TXLsendVirtualDate = {
	//_variable = _this select 0;
	_clientID = (owner (_this select 1)); // Requester
	GAM_TXLsrvVirtualDate = call GAM_TXLgetVirtualDate;
	_clientID publicVariableClient "GAM_TXLsrvVirtualDate";
	diag_log format ["Server Virtual Date: %1 | Sent to Client: %2", GAM_TXLsrvVirtualDate, _clientID];
};

// Client Functions
GAM_TXLcliStartDateUpdate = {
	// Update menu
	GAM_TXLcliActive = true;
	GAM_TXLcliMenu set [1, ["Switch OFF", [2], "", -5, [["expression", "call GAM_TXLcliTXLSwitch"]], "1", "1"]];
	
	// Reset timer and frame counter before starting the loop
	GAM_TXLcliFrame = 0;
	//GAM_TXLcliSkipping = 2;
	GAM_TXLcliStartFrameTime = diag_tickTime;
	onEachFrame GAM_TXLcliDateUpdate;
	diag_log format ["Client Sart Date: %1", date];
};

GAM_TXLcliDateUpdate = {
	if ((GAM_TXLcliFrame % GAM_TXLcliSkipping) == 0) then {
		_lastFrameTime = diag_tickTime - GAM_TXLcliStartFrameTime;
		GAM_TXLcliStartFrameTime = diag_tickTime;
		skipTime (((_lastFrameTime * GAM_TXLcliFactor) - _lastFrameTime) / 3600);
	};
	GAM_TXLcliFrame = GAM_TXLcliFrame + 1;
};

GAM_TXLcliStopDateUpdate = {
	// Update menu
	GAM_TXLcliActive = false;
	GAM_TXLcliMenu set [1, ["Switch ON", [2], "", -5, [["expression", "call GAM_TXLcliTXLSwitch"]], "1", "1"]];
	onEachFrame {};
	diag_log format ["Client Stop Date: %1", date];
};

GAM_TXLsrvSync = {
	_variable = _this select 0;
	_srvRcvDate = _this select 1;
	_cliCurrDate = date;
	setDate [_srvRcvDate select 0, _srvRcvDate select 1, _srvRcvDate select 2, _srvRcvDate select 3, _srvRcvDate select 4];
	_dateDelta = (_srvRcvDate select 4) - (_cliCurrDate select 4);
	diag_log format ["Client Current Date: %1 | Server Received Date: %2 | Desync: %3 | JIP: %4", _cliCurrDate, _srvRcvDate, _dateDelta, T_JIP];
	//hint format ["Desync: %1 (minutes)", _dateDelta];
};

GAM_TXLsetFactor = {
	GAM_TXLcliFactor = _this select 1;
	diag_log format ["New Client Accelleration Factor: %1", GAM_TXLcliFactor];
};

GAM_TXLsetStatus = {
	GAM_TXLcliStatus = _this select 1;
	if !(GAM_TXLcliStatus) then {
		call GAM_TXLcliStopDateUpdate;
		GAM_TXLcliActive = GAM_TXLcliStatus;
		GAM_TXLadmActive = GAM_TXLcliStatus;
		GAM_TXLcliMenu set [1, ["Switch ON", [2], "", -5, [["expression", "call GAM_TXLcliTXLSwitch"]], "1", "1"]];
		GAM_TXLcliMenu set [7, ["---", [], "", -1, [], "0", "0"]];
	};
	diag_log format ["New Client Accelleration Status: %1 | GAM_TXLcliActive: %2 | GAM_TXLadmActive: %3", GAM_TXLcliStatus, GAM_TXLcliActive, GAM_TXLadmActive];
};

GAM_TXLcliTXLSwitch = {
	switch (GAM_TXLcliActive) do
	{
		case false:
		{
			call GAM_TXLcliStartDateUpdate;
		};
		case true:
		{
			call GAM_TXLcliStopDateUpdate;
		};
	};
};

GAM_TXLadmStart = {
	// Update menu
	GAM_TXLadmActive = true;
	GAM_TXLcliAdminMenu set [1, ["Switch OFF", [2], "", -5, [["expression", "call GAM_TXLadmTXLSwitch;"]], "1", "1"]];
	
	GAM_TXLadmStartReq = true;
	publicVariableServer "GAM_TXLadmStartReq";
};

GAM_TXLadmMenuStop = {
	// Update menu
	GAM_TXLadmActive = false;
	GAM_TXLcliAdminMenu set [1, ["Switch ON", [2], "", -5, [["expression", "call GAM_TXLadmTXLSwitch;"]], "1", "1"]];
	
	GAM_TXLadmStopReq = true;
	publicVariableServer "GAM_TXLadmStopReq";
};

GAM_TXLadmMenuFactor = {
	if (serverCommandAvailable '#kick') then {
		call GAM_TXLadmMenuStop;

		//GAM_TXLcliFactor = _this select 0;
		GAM_TXLadmFactorChangeReq = _this select 0;
		publicVariableServer "GAM_TXLadmFactorChangeReq";
	} else {
		hint "You must be logged in as an administrator\nto access this functionality";
	};
};

GAM_TXLadmTXLSwitch = {
	if (serverCommandAvailable '#kick') then {
		switch (GAM_TXLadmActive) do
		{
			case false:
			{
				call GAM_TXLadmStart;
			};
			case true:
			{
				call GAM_TXLadmMenuStop;
			};
		};
	} else {
		hint "You must be logged in as an administrator\nto access this functionality";
	};
};

// Client MENU
GAM_TXLcliTXLMenu = [
	["User menu", false],
	["TimeXleration Menu", [2], "#USER:GAM_TXLcliMenu", -5, [["expression", ""]], "1", "1"]
];

GAM_TXLcliMenu = [
	["User menu", false],
	["Turn OFF", [2], "", -5, [["expression", "call GAM_TXLcliTXLSwitch"]], "1", "1"],
	["1 update per 1 frame", [3], "", -5, [["expression", "GAM_TXLcliSkipping = 1"]], "1", "1"],
	["1 update per 2 frames", [4], "", -5, [["expression", "GAM_TXLcliSkipping = 2"]], "1", "1"],
	["1 update per 3 frames", [5], "", -5, [["expression", "GAM_TXLcliSkipping = 3"]], "1", "1"],
	["1 update per 4 frames", [6], "", -5, [["expression", "GAM_TXLcliSkipping = 4"]], "1", "1"],
	["---", [], "", -1, [], "0", "0"],
	["Server Admin", [7], "#USER:GAM_TXLcliAdminMenu", -5, [["expression", ""]], "1", "1"]
];

GAM_TXLcliAdminMenu = [
	["Server Admin Menu", true],
	["Switch OFF", [2], "", -5, [["expression", "call GAM_TXLadmTXLSwitch;"]], "1", "1"],
	["Acceleration Factor +20", [3], "", -5, [["expression", "[(GAM_TXLcliFactor + 20)] call GAM_TXLadmMenuFactor;"]], "1", "1"],
	["Acceleration Factor -20", [4], "", -5, [["expression", "[(GAM_TXLcliFactor - 20)] call GAM_TXLadmMenuFactor;"]], "1", "1"]
];

if (playersNumber east + playersNumber west + playersNumber resistance + playersNumber civilian > 0) then { T_MP = true } else { T_MP = false };

if (isServer) then {
	T_Server = true;
	if (!(isNull player)) then { T_Client = true };
	T_INIT = true;

	diag_log format ["TimeXleration Init Date: %1", date];

	// Handle requests
	"GAM_TXLcliDateReq" addPublicVariableEventHandler GAM_TXLsendVirtualDate;
	"GAM_TXLcliFactorReq" addPublicVariableEventHandler GAM_TXLsendFactor;
	"GAM_TXLcliStatusReq" addPublicVariableEventHandler GAM_TXLsendStatus;
	
	"GAM_TXLadmStopReq" addPublicVariableEventHandler GAM_TXLsrvStopDateUpdate;
	"GAM_TXLadmStartReq" addPublicVariableEventHandler GAM_TXLsrvStartDateUpdate;
	"GAM_TXLadmFactorChangeReq" addPublicVariableEventHandler GAM_TXLsrvChangeFactor;
	
	// Start Accelleration
	call GAM_TXLsrvStartDateUpdate;
} else {
	if (isNull player) then {
		T_JIP = true;
		[] call { waitUntil { !(isNull player) }; T_INIT = true };
	} else {
		T_INIT = true;
	};

	diag_log format ["TimeXleration Init Date: %1", date];
	
	// Handle regular server date sync
	"GAM_TXLsrvDate" addPublicVariableEventHandler GAM_TXLsrvSync;
	
	// Handle fetching of virtual server time (JIPs)
	"GAM_TXLsrvVirtualDate" addPublicVariableEventHandler GAM_TXLsrvSync;
	
	// Handle status and config
	"GAM_TXLcliStop" addPublicVariableEventHandler GAM_TXLcliStopDateUpdate;
	"GAM_TXLcliStart" addPublicVariableEventHandler GAM_TXLcliStartDateUpdate;
	"GAM_TXLcliFactor" addPublicVariableEventHandler GAM_TXLsetFactor;
	"GAM_TXLcliStatus" addPublicVariableEventHandler GAM_TXLsetStatus;
	
	BIS_MENU_GroupCommunication = GAM_TXLcliTXLMenu;

	// Usage Hints
//	_nil = [] spawn {
//		hint "Client TimeXleration v1.6 \nMultiplayer (beta)\n\nAccess configuration Menu:\n0 - 8 - [option]";
//		sleep 15;
//		hint "Choose higher ""per frame"" values to reduce impact on your frames per second";
//	};

	// JIP presync
	if (T_JIP) then {
		// Sync factor
		GAM_TXLcliFactorReq = player;
		publicVariableServer "GAM_TXLcliFactorReq";
		
		// Sync date
		GAM_TXLcliDateReq = player;
		publicVariableServer 'GAM_TXLcliDateReq';

		// Sync Status
		GAM_TXLcliStatusReq = player;
		publicVariableServer "GAM_TXLcliStatusReq";
	};
	
	// Start Accelleration
	if (GAM_TXLcliActive) then {
		call GAM_TXLcliStartDateUpdate;
	};
};