_x = lbCurSel 2000;

_count = 0;
_price = 0;
_item = "GUN";
_itemType = 0;
_price = 0;
_count = 0;
_curList = listOfWeapons;
_listC = count listOfWeapons;
_equip = weapons cursoldier;


if (recruitClick) exitWith {
 	_item = ((RecList select _x) select 1);
	_rec = [_item] execVM "data\scripts\recruit.sqf";
};
