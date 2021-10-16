BIS_EVO_pallammo = magazines player;
BIS_EVO_pweapons = weapons player;
rucksack="";

if (!isNull (unitBackpack player)) then 
	{ 
		rucksack = typeof (unitbackpack player); 
		ruckmags = getMagazineCargo (unitBackpack player);
		ruckweap = getWeaponCargo (unitBackpack player);
	};
