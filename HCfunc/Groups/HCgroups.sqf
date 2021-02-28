// Arma 2 function
// Assumes that only group leaders are high commanders.

private ["_unithc","_maxgroups","_groups","_groupstack","_ngstack","_hcgi","_depth","_numgroups",
         "_gi","_leader","_numsubgroups"];

_unithc = _this select 0;
_maxgroups = _this select 1;

_groups = hcAllGroups _unithc;

if ((count _groups) >= 1) then {

	_groupstack = [(hcAllGroups _unithc)];
	_ngstack = [(count (_groupstack select 0))];
	_hcgi = [0];
	_depth = 0;

	_numgroups = count _groups;

	while {(_depth >= 0) && (_numgroups <= _maxgroups)} do {

		// 3 options
		// 1. If there are no more nodes at this level go up.
		// 2. Check group for child nodes if so go down.
		// 3. Check group for child nodes if not go to the next node.

		_gi = _hcgi select _depth; 

		if (_gi < (_ngstack select _depth)) then {

			_leader = leader ((_groupstack select _depth) select _gi);
			_numsubgroups = count (hcAllGroups _leader);

			if (_numsubgroups >= 1) then {

				// Go down to child groups
				_depth = _depth + 1;
				_groupstack set [_depth, (hcAllGroups _leader)];
				_ngstack set [_depth, _numsubgroups];
				_hcgi set [_depth, 0];

				_groups = _groups + (_groupstack select _depth);
				_numgroups = _numgroups + _numsubgroups;

				//hintSilent format ["count (hcAllGroups _leader) = %1", (count (hcAllGroups _leader))];
				//hintSilent format ["count _groups = %1", (count _groups)];
			} else {
				//No child groups
				_hcgi set [_depth, ((_hcgi select _depth) + 1)];
			}; 
		} else {

			//Go up.
			_depth = _depth - 1;
			
			if (_depth >= 0) then {
			
				_hcgi set [_depth, ((_hcgi select _depth) + 1)];
			};
		};
	};
}; 

_groups;
