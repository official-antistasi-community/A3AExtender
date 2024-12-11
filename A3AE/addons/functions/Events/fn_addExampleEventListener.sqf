if !(isClass (missionConfigFile/"A3A")) exitWith {};//safeguard to block running on none antistasi missions

//see (configFile/"A3A"/"Events") for a list of available events
//arguments are: Event type, Event Unique ID, function
["AIVehInit", "A3A_Events_example", A3A_functions_fnc_AIVehInit] call A3A_Events_fnc_addEventListener;
