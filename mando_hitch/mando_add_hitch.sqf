/*
mando_add_hitch.sqf v1.5
August 2008 Mandoble

This script enables hitching capability for a particular chopper or a set of chopper classes.
It has a single parameter and it may be an object (a particular chopper) or an array of chopper classes.

Global variables that might be set for this script externally:
mando_hitch_hud_scale = HUD scale, 1, 0.8, etc, default value is 0.8;
mando_hitch_hud_offsetx = HUD offsetX from initial X position, default value is 0.35;
mando_hitch_hud_offsety = HUD offsetY from initial Y position, default value is 0.11;
mando_hitch_min_height = minimum height over potential cargo to be able to pick it up and minimum height to be able to drop cargo. Default value is 14m.
mando_hitch_no_check_for_drop, if set to true you may drop cargo from any height, default value is false.
mando_hitch_types = array of vehicle classes that can be picked up and transported, Default value is ["LandVehicle","ship"]
mando_hitch_heavies = Array of classes that will be considered heavy transports (individual classes)
mando_hitch_types_heavy = Array of classes that will be considered heavy cargos

Examples:
[heli1]execVM"mando_hitch\mando_add_hitch.sqf";   

or 

[["UH60MG", "UH60"]]execVM"mando_hitch\mando_add_hitch.sqf";   

*/

private["_veh", "_units", "_cargo", "_posm", "_poss", "_icon", "_mark", "_text", "_text2", "_line", "_condition", "_types", "_helis", "_action", "_back", "_cross"];
//mando_hitch_hud = displayNull;
disableSerialization;
uiNamespace setVariable ["mando_hitch_hud", displayNull];


if ((typeName (_this select 0)) == "ARRAY") then
{
   _helis = _this select 0;
   _condition = {true};
   _types = true;
}
else
{
   _veh = _this select 0;
   mando_lasthitch_acc = _veh addAction ["Pick Up", "mando_hitch\mando_pickup.sqf"];
   mando_lasthitch_acc_h = _veh addAction ["Toggle hitch hud", "mando_hitch\mando_togglehud.sqf"];
   _condition = {alive _veh};
   _types = false;
};

mando_lasthitch_acc = -1;
mando_lasthitch_acc_h = -1;
mando_hitch_hud_on = true;
if (isNil "mando_hitch_hud_scale") then
{
   mando_hitch_hud_scale = 0.8;
};

if (isNil "mando_hitch_hud_offsety") then
{
   mando_hitch_hud_offsety = 0.11;
};

if (isNil "mando_hitch_hud_offsetx") then
{
   mando_hitch_hud_offsetx = 0.65;
};

if (isNil "mando_hitch_types") then
{
   mando_hitch_types = ["LandVehicle","ship"];
};

if (isNil "mando_hitch_types_heavy") then
{
   mando_hitch_types_heavy = [];
};

if (isNil "mando_hitch_heavies") then
{
   mando_hitch_heavies = [];
};


disableSerialization;
_action = -1;
while _condition do
{
   if (_types) then
   {
      if (((typeOf vehicle player) in _helis) && (driver vehicle player == player)) then
      {
         if (mando_lasthitch_acc == -1) then
         {
            mando_lasthitch_acc = (vehicle player) addAction ["Pick Up", "mando_hitch\mando_pickup.sqf"];
            mando_lasthitch_acc_h = (vehicle player) addAction ["Toggle hitch hud", "mando_hitch\mando_togglehud.sqf"];
            _veh = vehicle player;
         };

         if (mando_hitch_hud_on) then
         {
            if (isNull (uiNamespace getVariable "mando_hitch_hud")) then
            {
               titleRsc["mando_hitch_hud", "PLAIN"];
            };
         }
         else
         {
            if (!isNull (uiNamespace getVariable "mando_hitch_hud")) then
            {
               titleText["", "PLAIN"];
            };
         };
      }
      else
      {
         if (mando_lasthitch_acc != -1) then
         {
            _veh removeAction mando_lasthitch_acc; 
            mando_lasthitch_acc = -1;
         };

         if (mando_lasthitch_acc_h != -1) then
         {
            _veh removeAction mando_lasthitch_acc_h; 
            mando_lasthitch_acc_h = -1;
         };


         if (!isNull (uiNamespace getVariable "mando_hitch_hud")) then
         {
            titleText["", "PLAIN"];
         };
      };
   }
   else
   {
      if (driver _veh == player) then
      {
         if (mando_hitch_hud_on) then
         {
            if (isNull (uiNamespace getVariable "mando_hitch_hud")) then
            {
               titleRsc["mando_hitch_hud", "PLAIN"];
            };
         }
         else
         {
            if (!isNull (uiNamespace getVariable "mando_hitch_hud")) then
            {
               titleText["", "PLAIN"];
            };
         };
      }
      else
      {
         if (!isNull (uiNamespace getVariable "mando_hitch_hud")) then
         {
            titleText["", "PLAIN"];
         };
      };
   };


   if (isNull (uiNamespace getVariable "mando_hitch_hud")) then
   {
      Sleep 1;
   }
   else
   {
      _back = ((uiNamespace getVariable "mando_hitch_hud") displayCtrl 101) ;//mando_hitch_hud displayCtrl 101;
      _mark = ((uiNamespace getVariable "mando_hitch_hud") displayCtrl 102) ;//mando_hitch_hud displayCtrl 102;
      _cross = ((uiNamespace getVariable "mando_hitch_hud") displayCtrl 103) ;//mando_hitch_hud displayCtrl 103;
      _icon = ((uiNamespace getVariable "mando_hitch_hud") displayCtrl 104) ;//mando_hitch_hud displayCtrl 104;
      _text = ((uiNamespace getVariable "mando_hitch_hud") displayCtrl 105) ;//mando_hitch_hud displayCtrl 105;
      _line = ((uiNamespace getVariable "mando_hitch_hud") displayCtrl 106) ;//mando_hitch_hud displayCtrl 106;
      _text2 = ((uiNamespace getVariable "mando_hitch_hud") displayCtrl 107) ;//mando_hitch_hud displayCtrl 107;

      if ((typeOf vehicle player) in mando_hitch_heavies) then
      {
         _units = nearestObjects [getPos (vehicle player), mando_hitch_types+mando_hitch_types_heavy, 12];
      }
      else
      {
         _units = nearestObjects [getPos (vehicle player), mando_hitch_types, 12];
      };
      _units = _units - [vehicle player];


      if (count _units == 0) then
      {
         _units = nearestObjects [[getPos (vehicle player) select 0, getPos (vehicle player) select 1, 0], mando_hitch_types, 50];
      };
      _units = _units - [vehicle player];

      _cross ctrlSetPosition [mando_hitch_hud_offsetx+(0.5-0.3-0.04/2)*mando_hitch_hud_scale, mando_hitch_hud_offsety+(0.5-0.05/2)*mando_hitch_hud_scale, 0.04*mando_hitch_hud_scale, 0.05*mando_hitch_hud_scale];
      _icon ctrlSetPosition [mando_hitch_hud_offsetx, mando_hitch_hud_offsety+(0.7 - 0.05)*mando_hitch_hud_scale, (0.05*mando_hitch_hud_scale), 0.05*mando_hitch_hud_scale*3/4];
      _back ctrlSetPosition [mando_hitch_hud_offsetx, mando_hitch_hud_offsety+0.3*mando_hitch_hud_scale, 0.4*mando_hitch_hud_scale, 0.4*mando_hitch_hud_scale];
      _text ctrlSetPosition [mando_hitch_hud_offsetx+(0.5 - 0.15- 0.3)*mando_hitch_hud_scale, mando_hitch_hud_offsety+(0.7 - 0.06)*mando_hitch_hud_scale];
      _text2 ctrlSetPosition [mando_hitch_hud_offsetx+(0.5 - 0.15- 0.3)*mando_hitch_hud_scale, mando_hitch_hud_offsety+(0.7-0.03)*mando_hitch_hud_scale];

      if (count _units > 0) then
      {
         _cargo = _units select 0;
         if (getText (configFile >> "CfgVehicles" >> (typeOf _cargo) >> "picture") != "picturestaticobject") then
         {
            _icon ctrlSetText getText (configFile >> "CfgVehicles" >> (typeOf _cargo) >> "picture");            
         }
         else
         {
            _icon ctrlSetText "mando_hitch\no_image.paa";
         };
         _text2 ctrlSetText typeOf _cargo;

         _posm = (vehicle player) worldToModel (getPos _cargo);
         _poss = [0.5- 0.3+(_posm select 0)/250 - 0.04/2, 0.5-(_posm select 1)/250 - 0.05/2];


         if (((_poss select 0) > 0) && ((_poss select 0) < (0.7-0.04-0.3)) && ((_poss select 1) > 0.3) && ((_poss select 1) < (0.7-0.05))) then
         {
            _mark ctrlSetPosition [mando_hitch_hud_offsetx+(_poss select 0)*mando_hitch_hud_scale,mando_hitch_hud_offsety+(_poss select 1)*mando_hitch_hud_scale, 0.04*mando_hitch_hud_scale, 0.05*mando_hitch_hud_scale];
            _line ctrlSetPosition [mando_hitch_hud_offsetx+(0.5-0.3)*mando_hitch_hud_scale, mando_hitch_hud_offsety+0.5*mando_hitch_hud_scale, (((_poss select 0)+0.04/2)-0.5+0.3)*mando_hitch_hud_scale, (((_poss select 1)+0.05/2)-0.5)*mando_hitch_hud_scale];
            if ((getPos (vehicle player) select 2) > mando_hitch_min_height) then
            {
               if (mando_hitch_no_check_for_drop) then
               {
                  _text ctrlSetText "Too high to pick up cargo";
               }
               else
               {
                  _text ctrlSetText "Too high to pick up/drop cargo";
               };
            }
            else
            {
               _text ctrlSetText "Correct height";
            };
         }
         else
         {
            _mark ctrlSetPosition [-0.2, -0.2];
            _line ctrlSetPosition [-0.2, -0.2, 0.1, 0.1];
            _text ctrlSetText "";
         };
      }
      else
      {
         _icon ctrlSetText "";
         _text2 ctrlSetText "";
         _mark ctrlSetPosition [-0.2, -0.2];
         _line ctrlSetPosition [-0.2, -0.2, 0.1, 0.1];
         _text ctrlSetText "";
      };

      _mark ctrlCommit 0;
      _line ctrlCommit 0;
      _cross ctrlCommit 0;  
      _icon ctrlCommit 0;  
      _back ctrlCommit 0;  
      _text ctrlCommit 0;  
      _text2 ctrlCommit 0;  

      Sleep 0.1;
   };
};

if (mando_lasthitch_acc != -1) then
{
   _veh removeAction mando_lasthitch_acc; 
   mando_lasthitch_acc = -1;
};

if (mando_lasthitch_acc_h != -1) then
{
   _veh removeAction mando_lasthitch_acc_h; 
   mando_lasthitch_acc_h = -1;
};
