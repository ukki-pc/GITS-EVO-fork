/*
mando_hitch.sqf v1.5
August 2008 Mandoble

Execute this script only once before executing mando_add_hitch.sqf.
This script must be executed everywhere, clients and server.
It has a single parameter which is the distance between cargo an chopper while transporting the cargo.

Global variables you might play with:
mando_hitch_hud_scale = HUD scale, 1, 0.8, etc, default value is 0.8;
mando_hitch_hud_offsetx = HUD offsetX from initial X position, default value is 0.35;
mando_hitch_hud_offsety = HUD offsetY from initial Y position, default value is 0.65;
mando_hitch_min_height = minimum height over potential cargo to be able to pick it up and minimum height to be able to drop cargo. Default value is 14m.
mando_hitch_no_check_for_drop, if set to true you may drop cargo from any height, default value is false.
mando_hitch_types = array of vehicle classes that can be picked up and transported, Default value is ["LandVehicle","ship"]
mando_hitch_heavies = Array of classes that will be considered heavy transports (individual classes)
mando_hitch_types_heavy = Array of classes that will be considered heavy cargos

Best place to execute it is inside init.sqf or init.sqs
Example:
[7]execVM"mando_hitch\mando_hitch.sqf";   
*/


private["_height"];

_height = _this select 0;

if (isNil "mando_hitch_chopper") then
{
   mando_hitch_chopper = objNull;
   mando_hitch_cargo = objNull;
};

if (isNil "mando_hitch_min_height") then
{
   mando_hitch_min_height = 14;
};

if (isNil "mando_hitch_no_check_for_drop") then
{
   mando_hitch_no_check_for_drop = false;
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


while {true} do
{
   if (!(isNull mando_hitch_chopper) && !(isNull mando_hitch_cargo)) then
   {
      if (local mando_hitch_cargo) then
      {
         [mando_hitch_chopper, mando_hitch_cargo, _height] spawn 
         {
            private ["_cargo", "_unit", "_vup", "_vdir", "_continue", "_height", "_pos", "_fheight"];

            _unit  = _this select 0;
            _cargo = _this select 1;
            _height = _this select 2;
            _continue = true;


            mando_hitch_chopper = objNull;
            mando_hitch_cargo = objNull;

            while {_continue} do
            {
               _vup = vectorUp _unit;
               _vdir = vectorDir _unit;

               _fheight = _height + (0 min (_unit modelToWorld [0,-1,-_height] select 2));
               _cargo setPos (_unit modelToWorld [0,-1,-_fheight]);
               _cargo setVectorDir _vdir;
               _cargo setVectorUp  _vup;
               _cargo setVelocity [0,0,0];

               if (!alive _cargo) then
               {
                  _continue = false; 
               };

               if (damage _unit > 0.3) then
               {
                  _continue = false; 
               };


               if ((mando_hitch_chopper == _unit) && (isNull mando_hitch_cargo)) then
               {
                  _continue = false;

                  mando_hitch_chopper = objNull;
                  mando_hitch_cargo = objNull;      
               };

               Sleep 0.001;
            };
            _pos = (_unit modelToWorld [0,-1,-_fheight]);
            _cargo setVelocity (velocity _unit);

            if ((_cargo isKindOf "StaticWeapon") || (_cargo isKindOf "Static"))then
            {
               [_cargo, _pos] spawn 
               {
                  private["_cargo", "_timeold", "_deltatime", "_vel", "_pos"]; 
                  _cargo = _this select 0;
                  _pos = _this select 1;
                  _timeold = time;
                  _vel = 0;

                  while {(_pos select 2) > 0} do
                  {
                     _deltatime = (time-_timeold) max 0.001;
                     _timeold = time;
                     _vel = _vel + 9.8*_deltatime;
                     _pos = [_pos select 0, _pos select 1, (_pos select 2) - _vel * _deltatime];
                     _cargo setPos _pos;
                     Sleep 0.001;
                  };
                  _cargo setPos [_pos select 0, _pos select 1, 0];
               };
            };
         };         

      }
      else
      {
         mando_hitch_chopper = objNull;
         mando_hitch_cargo = objNull;
      };
   };

   if (!(isNull mando_hitch_chopper) && (isNull mando_hitch_cargo)) then
   {
      Sleep 0.5;
      mando_hitch_chopper = objNull;
      mando_hitch_cargo = objNull;      
   };

   Sleep 2;
};