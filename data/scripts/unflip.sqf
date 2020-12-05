
_ply = _this select 0;
_targVec = cursorTarget;

if((_targVec isKindOf "Car" or _targVec isKindOf "Air" or _targVec isKindOf "Ship") and count crew _targVec == 0) then 
{
    _targVec setVectorUp [0,0,0]; 
    _targVec setPos getpos _targVec; 
    hint "Unflipped!";
};
