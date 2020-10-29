Upgrade of Classic Arma 1 mission: Evolution by Kiljoy

http://91.192.210.5/gits/Arma/

Updates implemented

Features

Class functions:
* Officer class can spawn/de-spawn an armoured humvee as a mobile recon spawn point - great for side missions. He can also carry an M252 mortar.
* Sniper can spawn ladder to access rooftops and Camo Nets
* AA can spawn Stinger Pod, AA gun or Kord
* AT can spawn TOW Pod, M119 or SPG9
* Grenadier can spawn Mk19
* Machinegunner can spawn MG nest, Kord or M2 static MG
* Pilot can access any aircraft at Private rank, and spawn a Refuel Depot
* Medic = mash and heal
* Engineer = FARP
- changed basic team members to spec ops - looks nicer and have more ammo slots

Base
* Ambulance MHQ at airbase for town attack
* Modified base (no flagpoles) has following respawn options - MHQ ambulance, respawn recon HQ (officer hummer), halo, SW Dock, Island, 3 FARPS and respawn airfield (so you dont have to motorbike there all the time)
* Built new base at island with Frigate and boats, AA and heli
* Fully functional aircraft carrier with boats, AA and planes and apaches
* Full working rifle range
* Samples of captured enemy armour and air units to familiarise yourself with enemy capabilities
* Added respawning AA defences and MASH's to base
* Culled units to essentials

Air Units
- All helicopters can winch and FIXED mando hitch HUD toggle etc
- Added AH64 x 2 types
- Uparmed all planes significantly - be sure to let them service when you get in them! e.g.
* F35 has 3 clips of cannon and 8 sidewinders for combat air patrol (against up to 20 air units at a time)
* 1st harrier has 8 Hellfires, 6 Mk80 bombs, 2 x 14 FFAR's and 4 sidewinders for anti armour interdiction
* 2nd harrier has 4 Mavericks, 6 GBU's, 192 S8 FFAR's, and 2 sidewinders for Close Air Support against infantry and softer targets
* A10 has 2 clips of cannon, 6 Mk82 bombs, 4 GBU's, 6 Mavericks, 2 clips of 38 FFAR's and 2 sidewinders
* MV22 has 300xGAU12, 4 FAB32 heli-bombs, 8 hellfires
* C130-J has 24 Vikhrs, 12 sidewinders, 192 S8 FFAR's, 3x750 clips of 30mm Gsh cannon, 20 GBU's, 12 FAB32 heli-bombs for primary battlefield overwatch
*Trial version of AC130 has same as C130J but with additional gunner seat with side-facing 105mm howitzer, 20mm cannon and 7.62mm minigun
* AH64D has 1200rnds cannon, 8 hellfires, 38 FFAR's and additionally 4 sidewinders for anti armour role
* AH64D_Sidewinders has 1200rnds cannon, 8 sidewinders, and additionally 3x38 FFAR's and 4 FAB32 heli-bombs for CAS/AA combined role (battlefield overwatch)

Enemy Units
* Increased range of enemy vehicle types significantly including BRDM2, BRDM-ATGM, BMP2, ZSU-Shilka, ZU23 truck, Motorbike, offroad, SPG UAZ, UAZ-MG, T72, Grad, etc
* Statics improved - removed Metis launcher as he never fires, added ZU23, MG nests
* Enemy air traffic - PAIRS of su25, su34, mi24v, mi24P, mi8 with 4 gunners, ka52 (with FIXED gunner) - all attack you - FIXED spawns
* Added 24 enemy spetznaz units that counterattack the airfield or MHQ in 2 trucks and 2 random APC's

T menu
- New Support options including
* All units can build a randomised Foxhole for cover
* Commander can build a large command bunker as his foxhole
* ammo crate * marker smoke * Minefield
* inflatable boat * smokescreen *Illuminate area (flares)
* precision strike * scout bike * Large Area Fire
* MG station * small artillery
* mortar station * build fortification
* cluster bomb * armoured boat
* AA battery * large artillery
* artillery cannon * chemical strike (no fx yet)
* HALO extraction * ICBM (FIXED effects)

Side-Missions
- New missions in remote corners of the map (castles, odd towns, radio stations, lumberyard, islands, etc):
* Rendition - take on 4 vehicles (including hinds) and 25 troops then capture an enemy officer and return him to base (a variation of csar)
* Extermination - kill all members of a civilian cult before a WMD explodes - in a very short time.
* Ambush Troop Convoy
* Rescue Agent Rescue - partisans and insurgents holding a female agent captive near the coast - you have to exfil her to the carrier
* Assassinate General - from rooftop of International Hotel using elevator script

General
- Civ vehicles and civs
- Changed rotation of cities so vehicles make more sense now and mission flows round map

Fixes
FIXED full ammo crate and added full russian ammo crate
FIXED one of the towers (Krasnostav) spawns in the main friendly airbase
FIXED If you're the leader and you die during a sub-mission, the mission is failed
FIXED vehicles don't respawn as broken after they are destroyed e.g. problem with sinits/ evo_VecRM/ evo_VecR
Removed Jail script as it's annoying
FIXED (Thanks to Razor) - environment effects and startup mission menu (some options not working yet)
FIXED build and dismantle special weapons - take out reliance on ammo truck
FIXED reinforcements - razor's heli and truck ones (cool) stop working after a few cities
FIXED remove excess vehicles from the main base and add more to the FARP's
FIXED reintroduce missile camera - missile camera works for all airborne missiles and bombs now
FIXED Add Mi8, KA52, AH64, AH1Z and Mi24 classes to mando_hitch
FIXED ~T menu generating error: "No entry in description.ext Rscmapcontrol/task.iconcreated" by editing the Rscbasic_defines.hpp file to add in the values from dta/bin.pbo config.bin
FIXED T menu bug that made the terraingrid default to 0 when ever you opened and closed the menu (removing the grass)
I made a slider for it instead so it doesn't take the value from the main window cursor location. Also added the 5 grass terraingrid options instead of 3.
FIXED the spawn/flightpath error that makes enemy planes congregate in the SE corner of the map
FIXED - the array in reinforcements only had 10 cities markers and missed the eponia ones (name of city in arma 1). Added them into the array in correct place, so now cities 9, 10 and 11 get reinforcements from the right place.
FIXED Tasklist at disconnect is still the old city list
FIXED Defence mission now functions in 5 locations of Chernarus
FIXED Extermination missions now function in 20 locations of Chernarus - with working WMD = nuke goes off if you fail at Major rank!
FIXED Assassinate General mission now has 3 target vehicles and waypoints at International Hotel etc
IMPROVED Enemy air units now spawn in 1's, 2's and 3's at intervals based on the difficulty parameter set at init.
IMPROVED Enemy spetsnaz assault now spawns at intervals based on the difficulty parameter set at init.
FIXED radio messages and rewards on city/ officer capture/ tower destruction
FIXED Scoring for individual player achievements is no longer applied to whole squad (e.g. cost of support, kill score from artillery etc). Support Cost reinstated.
FIXED Group score reward for all players in same group as player destroying radio tower/ capturing officer/ completing side-mission
FIXED used stringtable to localise languages in side missions and support options
FIXED Localised CITY NAMES in task list and sidechat
FIXED automatic removal of all support elements after 30 minutes (e.g. fortification, mortar, MG nest, boat, etc)
IMPROVED added new music at start-up - "I wanna Be Your Dog" by the Stooges (a homage to Vietcong the first classic co-op game like this)
IMPROVED Water Patrol now spawns near to Aircraft Carrier
FIXED In map screen the mission now has a Briefing explaining the options and tasks etc
FIXED FARP Alpha location - no longer falling over edge of steep hill
IMPROVED relocated all russian hardware to southern airbase (pending addition of mission to secure this resource)
FIXED Briefing/Debriefing functions (seems to multiply for some reason)
FIXED Blue markers for damaged vehicles
FIXED Enable toggling of MHQ/ReconHQ/FARP etc teleports
FIXED Enable toggling of ranked or unlocked ammo crates/ vehicles
FIXED Briefing/Debriefing functions
FIXED Blue markers for deserted/ damaged vehicles 
FIXED You can now disable MHQ, ReconHQ, other teleports, play with vehicles ranked and unranked and weapon crates ranked and unranked, and difficulty affects spetsnaz and aircraft spawn frequency
IMPROVED added a function that allows you to set the rank multiplier for each rank up to colonel (so it can be 60 points or various degrees up to 1200 points), if you don't play unlocked
ADDED Support Option to create a 25m square minefield containing 20 mines - with minefield marker added to map.
IMPROVED Vehicle access with rank more staggered, so now you get new air/land options for each rank
IMPROVED Added ability for Pilots to enter all aircraft at Private rank
FIXED Intro sound "I wanna be your dog" by the Stooges
FIXED bug in vehicle marker script 
ADDED Enabling up to 8 AI helpers, either on a ranked or unlocked basis. Unlocked means you can call in all 8 from mission start. Ranked means you get 1 with each rank. Locked means no AI's can be called.
ADDED Teamkiller punishment - Enabled causes anyone with less than -5 points to be jailed for 60 seconds. This means that you can crach one helicopter but no more without generating some positive scores! Disabled - it does nothing to negatoive scorers.
FIXED Removed the buggy tomahawk
IMPROVED reduced the overkill air units and spetsnaz assaults
IMPROVED the unit counts in cities as they were too few in recent releases
FIXED HALO no longer breaks the T menu
IMPROVED Transfer to LHD Carrier is now part of enable MHQ teleport (default ON) and Farp/Docks teleporting is now default OFF
FIXED Red cross hatch marking circles now appear around cities with active AA vehicles.  Increased units to 2x tunguska and 2x shilka.
IMPROVED Removed shilkas from default enemy mech units and reinforcements.  Removed empty ambulance also
ALMOST FIXED enabled capture of POW's for 3 points each - still needs a little work
IMPROVED Intro song "African tribal chant" for Duala map
IMPROVED set default start time to 7am on Duala and Panthera to account for later sunrise on these maps

Tasklist update:

1. enemy AI who submit can't be captured as the capture dialog doesn't work on them (only on the officer) - looked in objoff, sorew, submit and capture - needs to be globalised action for soldiers in evo_missionmanager
2. How to manage dying during a side-mission
3. AI list for recruitment needs work / Disbanding AI from squad
4. Squad joining list is still malfunctioning such that many new players have to be team leader - need to fundamentally rethink the update playerlist scripting - edited core.sqf BIS_EVO_Listupdate to add in engineer, spotter etc to soldier list so now it includes all possible public players in the array
5. Reinforcements fail at a certain city - need to work out which one and why it happens (e.g. reinforcement algorithm inputs) (krasno ok)
6. Minor - AC130 with sidearm cannon does not respawn - set to 300 points to pilot
7. Enable Revive (based on Razors)
8. Interactive Briefing map/markers
9. chemical strike effects (and making nuke ones server-side)
10. Make Sahrani Red Reloaded
11. "Displayvendor does not support serialisation" error in T menu

Mission list:

DUALA
GITSEvolutionDualav5.isladuala.pbo
GITSEvolutionDuala_modv4.isladuala.pbo

CHERNARUS
GITSEvolutionV26.Chernarus.pbo
GITSEvolutionRedV3.Chernarus.pbo

SAHRANI
GITSEvolutionSahraniv4.Sara.pbo
GITSEvolutionSahrani_britv3.Sara.pbo

PANTHERA
GITSEvolutionPanthera_v2.Panthera2.pbo
GITSEvolutionPanthera_modv4.Panthera2.pbo

you have 5 unmodded versions and 3 modded versions.
For linkls to islands and mods, see modlist doc in the zip file.
Mission briefing pdf in the zip file

some tips:
TIP 1 - maintaining a rifle as primary

when you spawn, go to the crate, select gear WHILE STANDING - DO NOT CROUCH OR GO PRONE when accessing GEAR menu - this will cause WEAPON SAVE to FAIL.

empty off enough ammo slots for your rockets
take you SMAW or whatever you fancy and it will have as many ammo as you made room for
next take your rifle
DO NOT EVER put your current rifle in the crate before selecting your new one as this will make your PISTOL A PRIMARY WEAPON and screw your weapon save
And NEVER go on the crate with a pistol or rocket in your hand, as these will become your PRIMARY WEAPON SAVE

If this happens, take a rifle etc then come off the crate, equip your rifle and choose gear on the other crate to make the weapon save refresh with your rifle in PRIMARY.
Next take your postol and your grenades etc

simple. stick to this logic and you won't have a problem.

TIP 2 - dealing with lag

when the server gets laggy you sometimes spawn with the stock weapon. do nothing (in terms of changing weapon) until the script catches up and rearms you with your saved weapon.

TIP 3 - when the crate doesn't save
very occasionally you won't see the message WEAPON SAVES when you access the ammo crate or a dead body.
If this happens remember that your new loadout will not be remembered until you manage to access another crate or body to force the save to refresh
you can try switching from russian to american crate just to see if this will trigger the save - half the time it works. otherwise, just wait a few secs for the server scripts to catch up and the lag to diminish then try again on the crate and you'll see it works. This is the same when you first teleport and you cant get in a vehicle - the server needs time to catch up with your surroundings - it depends on how fast your PC is and how good the server is
