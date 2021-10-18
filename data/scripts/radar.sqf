#define radarMaxDist 8000
#define detectionTreshold 0.18

_thisRadar = _this select 0;

radars = radars + [_thisRadar];
if(count radars > 1) exitWith {}; //If this logic is already running then dont schedule another

while {sleep 5; true} do 
{
    for "_r" from 0 to (count radars)-1 do
    {
        _radar = radars select _r;
        {
            if((side _x == EGG_EVO_PLAYERFACTION) and (_x isKindOf "Air"))  then 
            {
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

