 _punit = _this select 0;
 _pmis = _this select 1;
 _prew = _this select 2;
 
 switch (_pmis) do
 {
    	 case 1:
    	{
    		_run = [_punit,_prew] execVM "data\scripts\Mass.sqf"
    	};
    	 case 2:
    	{
    		_run = [_punit,_prew] execVM "data\scripts\Mlpat.sqf"
    	}; 
    	 case 3:
    	{
    		_run = [_punit,_prew] execVM "data\scripts\Mwpat.sqf"
    	};
    	 case 4:
    	{
    		_run = [_punit,_prew] execVM "data\scripts\Mdst.sqf"
    	};
    	 case 5:
    	{
    		_run = [_punit,_prew] execVM "data\scripts\Mcsar.sqf"	
    	};
    	 case 6:
    	{
    		_run = [_punit,_prew] execVM "data\scripts\Mcsarb.sqf"
    	};  
    	 case 7:
    	{
    		_run = [_punit,_prew] execVM "data\scripts\Mdefn.sqf"
    	};
    	 case 8:
    	{
    		_run = [_punit,_prew] execVM "data\scripts\Msaad.sqf"
    	};  
    	 case 9:
    	{
    		_run = [_punit,_prew] execVM "data\scripts\Mapat.sqf"
    	};     
    	 case 10:
    	{
    		_run = [_punit,_prew] execVM "data\scripts\Mcsarc.sqf"
    	};     	
    	 case 11:
    	{
    		_run = [_punit,_prew] execVM "data\scripts\Mdst2.sqf"
    	};     	
    	 case 12:
    	{
    		_run = [_punit,_prew] execVM "data\scripts\Massa.sqf"
    	};     	
    	 case 13:
    	{
    		_run = [_punit,_prew] execVM "data\scripts\Massg.sqf"
    	};     	
    	 case 14:
    	{
    		_run = [_punit,_prew] execVM "data\scripts\Mcsard.sqf"
    	};     	
    	 case 15:
    	{
    		_run = [_punit,_prew] execVM "data\scripts\Mapat2.sqf"
    	};     	
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
	
};
