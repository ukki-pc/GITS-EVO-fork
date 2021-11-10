 _punit = _this select 0;
 _pmis = _this select 1;
 _prew = _this select 2;
 _extra = _this select 3;
 
 switch (_pmis) do
 {
		case 16:
    	{
			BIS_EVO_Onmission = false;
    		_run = [] execVM "data\scripts\pickCity.sqf"
    	}; 
		case 17:
    	{
			BIS_EVO_Onmission = false;
    		_run = [] execVM "data\scripts\relocate.sqf"
    	};  
		case 18:
    	{
			BIS_EVO_Onmission = false;
    		_run = [] execVM "actions\saveMission.sqf"
    	}; 
		case 19:
    	{
			BIS_EVO_Onmission = false;
    		_run = [] execVM "actions\changeSpawnPoint.sqf"
    	}; 
};
