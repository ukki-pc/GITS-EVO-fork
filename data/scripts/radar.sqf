_radar = _this select 0;
_detectionTreshold = _this select 1;

detections = [];

while {sleep 4; alive _radar} do
{
  //  systemChat "radar Sweep";
    {
        if((side _x == west) and (_x isKindOf "Air"))  then 
        {
           if(_radar knowsAbout _x > _detectionTreshold and !(_x in detections)) then {detections = detections + [_x]; systemChat "radar detection";}
           else 
           {
              if(_radar knowsAbout _x == 0 and (_x in detections)) then {detections = detections - [_x]};
           };
        };
        sleep 0.1; 
    }forEach vehicles;
};

//Send to global namespace


// 0.18 = radar detect