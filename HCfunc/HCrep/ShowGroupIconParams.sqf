// Arma 2 function

private ["_Groups","_Group","_GroupIconParams","_NumIconParams","_str","_ip"];
         
         
_Groups = + _this;

if ((count _Groups) >= 1) then {

	_Group = _Groups select 0;
	_GroupIconParams = getGroupIconParams _Group;
	_NumIconParams = count _GroupIconParams;
	_str = "[";

	for [{ _ip = 0 }, { _ip < _NumIconParams }, { _ip = _ip + 1 }] do {
		
		if (_ip >= 1) then {
			_str = _str + ",";
		};
		
		_str = _str + (format ["%1", _GroupIconParams select _ip]);
	};
	
	_str = _str + "]";
	
	hintSilent _str;
	copyToClipboard _str;
};

nil;
