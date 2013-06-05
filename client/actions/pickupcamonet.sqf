//	@file Version: 1.2
//	@file Name: pickupcamonet.sqf
//	@file Author: Sixty8 Pulse, [GoT] JoSchaap
//	@file Date modified: 17/12/2012 20:19
//	@file Args:

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
};

mutexScriptInProgress = true;
_camonet = (nearestobjects [getpos player, ["Land_cargo_addon02_V2_F"],  5] select 0);

deleteVehicle _camonet; 
player playmove "AinvPknlMstpSlayWrflDnon";

sleep 2.9;

player setVariable ["camonet",+1,true]; 
hint format["You can now build an improvised roof"];
player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation. 
sleep 1;
mutexScriptInProgress = false;

