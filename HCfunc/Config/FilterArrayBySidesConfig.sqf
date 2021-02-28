// Arma 2 function

private ["_Items","_NumItems","_FilteredItems","_ii","_Item"];

_Items = + _this;

_NumItems = count _Items;
_FilteredItems = [];

for [{ _ii = 0 }, { _ii < _NumItems }, { _ii = _ii + 1 }] do {
	
	_Item = _Items select _ii;
	
	if ((side _Item) call F_SideStatsAccessible) then {
		
		_FilteredItems = _FilteredItems + [_Item];
	};
};

_FilteredItems;