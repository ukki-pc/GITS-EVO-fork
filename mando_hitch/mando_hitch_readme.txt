There are two main scripts: mando_hitch.sqf and mando_add_hitch.sqf. 

mando_hitch.sqf:
Execute this script only once before executing any mando_add_hitch.sqf. Make sure it is executed everywhere, server and clients.
It has a single parameter which is the distance between cargo an chopper while transporting the cargo.

Global variables you might play with:
mando_hitch_min_height = minimum height over potential cargo to be able to pick it up and minimum height to be able to drop cargo. Default value is 14m.
mando_hitch_types = array of vehicle classes that can be picked up and transported, Default value is ["LandVehicle","ship"]

Best place to execute it is inside init.sqf or init.sqs
Example:
[7]execVM"mando_hitch\mando_hitch.sqf";   



mando_add_hitch.sqf:
This script enables hitching capability for a particular chopper or a set of chopper classes.
It has a single parameter and it may be an object (a particular chopper) or an array of chopper classes.

Execute this script there where is a player able to board a chopper as driver and hitch vehicles.

Examples:
[heli1]execVM"mando_hitch\mando_add_hitch.sqf";   

or 

[["UH60MG", "UH60"]]execVM"mando_hitch\mando_add_hitch.sqf";   


You need also to modify description.ext to make sure mando hitch titles are present there. Locate or create RscTitles section and add there the corresponding include:

class RscTitles
{
#include "mando_hitch\mando_hitch_titles.h"
};
