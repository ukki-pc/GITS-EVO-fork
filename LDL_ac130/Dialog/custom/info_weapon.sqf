/*	info_weapon.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

_structured = composeText [""];
_infos = [];
for [{_i = 0;},{_i < count LDL_weaponSlots;},{_i = _i + 1;}] do 
{
	_color = '#e0d8a6';
	if((LDL_weaponSlots select _i)select 2 <= 0) then
	{
		_color = '#FF0000';	
	}
	else
	{
		if((LDL_weaponSlots select _i)select 3) then
		{
			_color = '#FF8C00';
		};
	};
	if(LDL_equippedWeapon == _i) then
	{
		_size = '1.3';	
	}
	else
	{
		_size = '1';	
	};
	_infos  = _infos + [parseText format["<t color='%3'><t size='%4'>%5: %1 / %2</t></t> ", (LDL_weaponSlots select _i)select 2,(LDL_weaponSlots select _i)select 1, _color, _size, (LDL_weaponSlots select _i)select 0]];	
};
{
	_structured = composeText [_structured,_x,lineBreak];
} forEach _infos;