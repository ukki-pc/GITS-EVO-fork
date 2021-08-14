disableSerialization;
uiNamespace setVariable ["displayVendor", findDisplay 177];
uiNamespace setVariable ["ctrlTitle", (uiNamespace getVariable "displayVendor") displayCtrl 101];
uiNamespace setVariable ["ctrlListBox", (uiNamespace getVariable "displayVendor") displayCtrl 4000];

BIS_EVO_ListUpdate = 
{

	switch(Wpage) do
	{
		case 0: //Pistols
		{

		};
		case 1: //SMG
		{

		};
		case 2: //Shotguns
		{

		};
		case 3: //Rifles
		{

		};
		case 4: //Assault Rifles
		{

		};
		case 5: //Launchers
		{

		};
		case 7: //Ordnance
		{

		};
	};
};	
//Endlsts

BIS_EVO_ActButton = 
{

};

BIS_EVO_ListSelect =
{

};

[] call BIS_EVO_ListUpdate;

