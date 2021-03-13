
	PRIVATE ["_unit","_sides","_markerw","_markerwrespawn","_markere","_markererespawn","_marker","_markerav8","_obj","_name","_typename"];
	
	waitUntil {sleep 0.4;(Alive player)};
	_markerw = [];
//	for "_i" from 1 to 32 do
	for "_i" from 1 to 4 do
		{
			_marker = createMarkerLocal [format["W%1Unit",_i],[0,0]];
			_markerw = _markerw + [_marker];
			_marker setMarkerTypeLocal "Arrow";
			_marker setMarkerColorLocal "ColorGreen";
			_marker setMarkerSizeLocal [0.4, 0.4];
		};


	//Player marker
	while {(true)} do
	{
			for "_i" from 1 to 5 do
			{
				_obj = player;
				_obj = [] call compile format ["engw%1",_i];
				_marker =_markerw select (_i - 1);
				if (alive _obj) then
				{
				 	_name = (name _obj);

					_marker setmarkerposlocal (getpos (vehicle _obj));
					_marker setmarkerdirlocal (getdir (vehicle _obj));
					//player globalchat format ["Marker: %1:%2:%3:%4:%5",_name,_marker,_obj,(alive _obj),((vehicle _obj) != _obj)];
					if ((vehicle _obj) != _obj) then
					{
						_typename = gettext(configFile >> "CfgVehicles" >> (typeof (vehicle _obj)) >> "displayName");
						_marker setmarkertext format ["%1 (%2)",_name,_typename];
					} else {
						_marker setmarkertext format ["%1",_name];
					};
				} else {
					_marker setmarkerpos [0,0];
				};
			};
	sleep 1;
	};