//fill any empty fuel cans
_player = player;
_player removeAction EB_player_fillfuel;
EB_player_fillfuel = -1;

_qty = {_x == "EB_ItemFuelcanEmpty"} count magazines _player;

if ("EB_ItemFuelcanEmpty" in magazines _player) then 
{
	for "_x" from 1 to _qty do 
	{
		_player removeMagazine "EB_ItemFuelcanEmpty";
		_player addMagazine "EB_ItemFuelcan";
	};
	playsound "fill";
	_player playActionNow "Medic";
	hintsilent format ["%1 Fuel Cans filled",_qty];
};

