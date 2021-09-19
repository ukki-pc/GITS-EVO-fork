//Common functions for clients only


fnc_hitMarker = 
{
    _hitmarks = ["hit1","hit2","hit3"];
    3 cutRsc ["Hitmarker","PLAIN"];
    _sound = [_hitmarks] call fnc_pickRandom;
    playSound _sound;
};