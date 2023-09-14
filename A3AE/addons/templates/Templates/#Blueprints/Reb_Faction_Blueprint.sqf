///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", ""] call _fnc_saveToTemplate;    //this line determines the faction name -- Example: ["name", "NATO"] - ENTER ONLY ONE OPTION

["flag", ""] call _fnc_saveToTemplate;    //this line determines the flag -- Example: ["flag", "Flag_NATO_F"] - ENTER ONLY ONE OPTION
["flagTexture", ""] call _fnc_saveToTemplate;    //this line determines the flag texture -- Example: ["flagTexture", "\A3\Data_F\Flags\Flag_NATO_CO.paa"] - ENTER ONLY ONE OPTION
["flagMarkerType", ""] call _fnc_saveToTemplate;    //this line determines the flag marker type -- Example: ["flagMarkerType", "flag_NATO"] - ENTER ONLY ONE OPTION

["vehiclesBasic", []] call _fnc_saveToTemplate;    //this line determines basic vehicles, the lightest kind available. -- Example: ["B_Quadbike_01_F"] -- Array, can have multiple entries
["vehiclesLightUnarmed", []] call _fnc_saveToTemplate;    //this line determines light and unarmed vehicles. -- Example: ["B_MRAP_01_F"] -- Array, can have multiple entries
["vehiclesLightArmed", []] call _fnc_saveToTemplate;    //this line determines light and armed vehicles -- Example: ["B_MRAP_01_hmg_F","B_MRAP_01_gmg_F"] -- Array, can have multiple entries
["vehiclesTruck", []] call _fnc_saveToTemplate;    //this line determines the trucks -- Example: ["B_Truck_01_transport_F","B_Truck_01_covered_F"] -- Array, can have multiple entries
["vehiclesAT", []] call _fnc_saveToTemplate;    //this line determines AT vehicle -- Example: ["B_Truck_01_transport_F","B_Truck_01_covered_F"] -- Array, can have multiple entries
private _vehicleAA = [];    //this line determines AA vehicle -- Example: private _vehicleAA = [["B_Truck_01_transport_F","B_Truck_01_covered_F"] -- Array, can have multiple entries

["vehiclesBoat", []] call _fnc_saveToTemplate;    //this line determines transport boats -- Array, can have multiple entries

["vehiclesPlane", []] call _fnc_saveToTemplate;    //this line determines CAS planes -- Array, can have multiple entries

private _vehiclesCivCar = [];
["vehiclesCivTruck", []] call _fnc_saveToTemplate;
["vehiclesCivHeli", []] call _fnc_saveToTemplate;
["vehiclesCivBoat", []] call _fnc_saveToTemplate;

["staticMGs", []] call _fnc_saveToTemplate;    //this line determines static MGs -- Array, can have multiple entries
["staticAT", []] call _fnc_saveToTemplate;    //this line determinesstatic ATs -- Array, can have multiple entries
private _staticAA = [];    //this line determines static AAs -- Array, can have multiple entries
["staticMortars", []] call _fnc_saveToTemplate;    //this line determines static mortars -- Array, can have multiple entries
["staticMortarMagHE", ""] call _fnc_saveToTemplate;    //this line determines HE shells for static mortars - String, single entry
["staticMortarMagSmoke", ""] call _fnc_saveToTemplate;    //this line determines smoke shells static mortars - String, single entry
["staticMortarMagFlare", ""] call _fnc_saveToTemplate;    //this line determines flare shells static mortars - String, single entry

["mineAT", ""] call _fnc_saveToTemplate;    //this line determines AT mines needed for spawning in minefields - String, single entry
["mineAPERS", ""] call _fnc_saveToTemplate;    //this line determines APERS mines needed for spawning in minefields - String, single entry

["breachingExplosivesAPC", []] call _fnc_saveToTemplate;    //this line determines explosives needed for breaching APCs -- Array, can have multiple entries
["breachingExplosivesTank", []] call _fnc_saveToTemplate;    //this line determines explosives needed for breaching Tanks -- Array, can have multiple entries

["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;

["vehiclesAA", _vehicleAA] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;

#include "Reb_Vehicle_Attributes_Blueprint.sqf"    //include vehicle attribute file

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [];

if (allowDLCExpansion) then {
    _initialRebelEquipment append [];
} else {
    _initialRebelEquipment append [];
};

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [];    //Uniforms given to Normal Rebels

private _dlcUniforms = [];    //Uniforms given if DLCs are enabled, only given to the Arsenal not Rebels

if ("enoch" in A3A_enabledDLC) then {_dlcUniforms append [];
};

if ("expansion" in A3A_enabledDLC) then {_dlcUniforms append [];
};

if ("ws" in A3A_enabledDLC) then {_dlcUniforms append [];
};

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;    //These Items get added to the Arsenal

["headgear", []] call _fnc_saveToTemplate;    //Headgear used by Rebell Ai until you have Armored Headgear.

/////////////////////
///  Identities   ///
/////////////////////

["faces", []] call _fnc_saveToTemplate;
["voices", []] call _fnc_saveToTemplate;
"GreekMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];
_loadoutData set ["facemask", []];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
////////////////////////

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1]] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1]] call _fnc_setFacewear;
    
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
    ["Petros", _squadLeaderTemplate],
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["staticCrew", _riflemanTemplate],
    ["Medic", _riflemanTemplate, [["medic", true]]],
    ["Engineer", _riflemanTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _riflemanTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _riflemanTemplate],
    ["LAT", _riflemanTemplate],
    ["AT", _riflemanTemplate],
    ["AA", _riflemanTemplate],
    ["MachineGunner", _riflemanTemplate],
    ["Marksman", _riflemanTemplate],
    ["Sniper", _riflemanTemplate],
    ["Unarmed", _riflemanTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
