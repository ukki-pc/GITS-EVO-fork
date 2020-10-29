removeBackpack player;
_rucktype = _this select 3;

switch (_rucktype) do 
{
	case 0:
	{
		player removeAction closepackmenu;
		Player removeAction packID0;
		Player removeAction packID1;
		Player removeAction packID2;
		Player removeAction packID3;
		Player removeAction packID4;
		Player removeAction packID5;
		Player removeAction packID6;
		Player removeAction packID7;
		Player removeAction packID8;
		player removeAction packID9;
		player removeAction packID10;
		player removeAction packID11;
		player removeAction packID12;
		player removeAction packID13;
		player removeAction packID14;
		player removeAction packID15;
		player removeAction packID16;
		player removeAction packID17;
		player removeAction packID18;
		player removeAction packID19;
		player removeAction packID20;
		player removeAction packID21;
	};
	case 1: 
	//empty pack
	{
		player addBackpack "DE_Backpack_Specops_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["pipebomb",1];
		_mypack addMagazineCargoGlobal ["Laserbatteries",1];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",1];
	};
	case 2:
	//mg36 mixed
	{
		player addBackpack "DE_Backpack_Specops_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag",1];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",2];
		_mypack addMagazineCargoGlobal ["mine",1];
		_mypack addMagazineCargoGlobal ["pipebomb",1];
		_mypack addMagazineCargoGlobal ["M136",2];
	};
	case 3:
	//Mk17 CQC
	{
		player addBackpack "DE_Backpack_Specops_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR",1];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",4];
		_mypack addMagazineCargoGlobal ["pipebomb",1];
	};
	case 4:
	//grenadier
	{
		player addBackpack "DE_Backpack_Specops_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag",1];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",2];
		_mypack addMagazineCargoGlobal ["pipebomb",1];
		_mypack addMagazineCargoGlobal ["M136",1];
		if (gitsnades == 1) then {_mypack addMagazineCargoGlobal ["5Rnd_HE_M203",6]} else { _mypack addMagazineCargoGlobal ["1Rnd_HE_M203",6]};
	};
	case 5:
	//Stealth MP5
	{
		player addBackpack "DE_Backpack_Specops_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["30Rnd_9x19_MP5SD",3];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",3];
		_mypack addMagazineCargoGlobal ["pipebomb",1];
	};
	case 6: 
	//eng satchel
	{
		player addbackpack "CZ_Backpack_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag",1];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",2];
		_mypack addMagazineCargoGlobal ["pipebomb",5];
	};
	case 7:
	//eng mines
	{
		player addbackpack "CZ_Backpack_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag",1];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",2];
		_mypack addMagazineCargoGlobal ["mine",4];
		_mypack addMagazineCargoGlobal ["pipebomb",1];
	};
	case 8:
	//AT m136
	{
		player addBackpack "CZ_Backpack_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag",1];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",2];
		_mypack addMagazineCargoGlobal ["pipebomb",1];
		_mypack addMagazineCargoGlobal ["M136",1];
	};
	case 9:
	//AT smaw
	{
		player addBackpack "CZ_Backpack_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag",1];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",2];
		_mypack addMagazineCargoGlobal ["pipebomb",1];
		_mypack addMagazineCargoGlobal ["SMAW_HEAA",1];
	};
	case 10:
	//AT MAAWS
	{
		player addBackpack "CZ_Backpack_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag",1];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",1];
		_mypack addMagazineCargoGlobal ["pipebomb",1];
		_mypack addMagazineCargoGlobal ["MAAWS_HEAT",1];
	};
	case 11:
	//AT NLAW
	{
		player addBackpack "CZ_Backpack_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag",1];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",1];
		_mypack addMagazineCargoGlobal ["NLAW",1];
		_mypack addMagazineCargoGlobal ["pipebomb",1];
	};
	case 12:
	//AT Jav
	{
		player addBackpack "CZ_Backpack_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["pipebomb",1];
		_mypack addMagazineCargoGlobal ["JAVELIN",1];
	};
	case 13:
	//AT Dragon
	{
		player addBackpack "CZ_Backpack_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["Dragon_EP1",1];
		_mypack addMagazineCargoGlobal ["pipebomb",1];
	};
	case 14:
	//sniper DMR
	{
		player addBackpack "DE_Backpack_Specops_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["20Rnd_762x51_DMR",2];
		_mypack addMagazineCargoGlobal ["Laserbatteries",1];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",2];
		_mypack addMagazineCargoGlobal ["mine",1];
		_mypack addMagazineCargoGlobal ["pipebomb",1];
		_mypack addMagazineCargoGlobal ["M136",1];
	};
	case 15:
	//sniper M24
	{
		player addBackpack "DE_Backpack_Specops_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["5Rnd_762x51_M24",6];
		_mypack addMagazineCargoGlobal ["Laserbatteries",1];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",1];
		_mypack addMagazineCargoGlobal ["pipebomb",1];
	};
	case 16:
	//sniper M110
	{
		player addBackpack "DE_Backpack_Specops_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR",3];
		_mypack addMagazineCargoGlobal ["Laserbatteries",1];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",1];
		_mypack addMagazineCargoGlobal ["pipebomb",1];
	};
	case 17:
	//Sniper LRR
	{
		player addBackpack "DE_Backpack_Specops_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["5Rnd_86x70_L115A1",5];
		_mypack addMagazineCargoGlobal ["Laserbatteries",1];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",1];
		_mypack addMagazineCargoGlobal ["pipebomb",1];
	};
	case 18:
	//AA
	{
		player addbackpack "CZ_Backpack_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["pipebomb",1];
		_mypack addMagazineCargoGlobal ["Stinger",2];
	};
	case 19:
	//Sniper M107-AS50
	{
		player addBackpack "DE_Backpack_Specops_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["10Rnd_127x99_m107",4];
		_mypack addMagazineCargoGlobal ["Laserbatteries",1];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",1];
		_mypack addMagazineCargoGlobal ["pipebomb",1];
	};
	case 20:
	//MG M240
	{
		player addBackpack "DE_Backpack_Specops_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["100Rnd_762x51_M240",1];
		_mypack addMagazineCargoGlobal ["Laserbatteries",1];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",3];
		_mypack addMagazineCargoGlobal ["pipebomb",1];
	};
	case 21:
	//MG SAW
	{
		player addBackpack "DE_Backpack_Specops_EP1";
		_mypack = unitBackpack player;
		clearMagazineCargoGlobal _mypack;
		clearWeaponCargoGlobal _mypack;
		_mypack addMagazineCargoGlobal ["200Rnd_556x45_M249",1];
		_mypack addMagazineCargoGlobal ["Laserbatteries",1];
		_mypack addMagazineCargoGlobal ["HandGrenade_West",3];
		_mypack addMagazineCargoGlobal ["pipebomb",1];
	};

};
execVM "data\scripts\loadoutrecorder.sqf";
hint "Weapons Saved";

/*
CZ_VestPouch_EP1 6
US_Assault_Pack_EP1 8
US_Backpack_EP1 12
BAF_AssaultPack_special 13
DE_Backpack_Specops_EP1 14

US_Patrol_Pack_EP1 8
TK_Assault_Pack_EP1 8
US_Backpack_AmmoMG_EP1 ?
USBasicBag ?
US_Backpack_Specops_EP1 12
TK_ALICE_Pack_EP1 12
BAF_AssaultPack_FAC 13
CZ_Backpack_EP1 14
*/
