#define radarMaxDist 8000
#define detectionTreshold 0.18


radars = radars + [_this select 0];
if(count radars > 1) exitWith {}; //If this logic is already running then dont schedule another

while {sleep 5; count radars > 0} do 
{
    for "_r" from 0 to (count radars)-1 do
    {
        _radar = radars select _r;
        if(isNull _radar or !alive _radar) exitWith {radars = radars - [_radar]};
        {
            if((side _x == EGG_EVO_PLAYERFACTION) and (_x isKindOf "Air"))  then 
            {

                //F117A behaviour
                if((typeof _x == "F117A")) then 
                {
                    _d = _x distance _radar;
                    
                    if(_x animationphase "WeaponBayDoorLeft" != 0) then {_d = _d - 1000};

                    if(floor(random(_d/200))==0  and !(_x in detections)) then 
                    {
                        detections = detections + [_x]; systemChat "we didn't know it's stealthy";
                       [_x,list BIS_EVO_DetectEnemy] call fnc_reveal;    
                    };
                };

                if(_radar knowsAbout _x > detectionTreshold and !(_x in detections)) then {detections = detections + [_x]; systemChat "radar detection";}
                else 
                {
                    if(_radar knowsAbout _x == 0 and (_x in detections)) then {detections = detections - [_x]};
                };
            };
            sleep 0.2; 
        }forEach Enemyplanes;
        sleep 1;
    };
};

