/*
  *	Mikey's Briefing Template v0.03
  *
  *
  *	Notes: 
  *		- Use the tsk prefix for any tasks you add. This way you know what the varname is for by just looking at it, and 
  *			aids you in preventing using duplicate variable names.
  *
  *
  *		Required briefing commands:		
  *		- Create Note:			player createDiaryRecord ["Diary", ["*The Note Title*", "*The Note Message*"]]; 
  *		- Create Task:			tskExample = player createSimpleTask ["*The Task Title*"];
  *		- Set Task Description:	tskExample setSimpleTaskDescription ["*Task Message*", "*Task Title*", "*Task HUD Title*"];
  *
  *		Optional briefing commands:
  * 		- Set Task Destination:	tskExample setSimpleTaskDestination (getMarkerPos "mkrObj1");  // use an existing marker!
  *		- Set the Current Task:	player setCurrentTask tskExample;
  *		
  *		Formatting:
  *		- To add a newline: 		<br/>
  *		- To add a marker link:	<marker name='mkrObj1'>Attack this area!!!</marker>
  *		- To add an image: 		<img image='somePic.jpg'/> 
  *		   - custom width/height:	<img image='somePic.jpg' width='200' height='200'/>
  *		
  *		Commands to use in-game:
  *		- Set Task State:		tskExample setTaskState "SUCCEEDED";   // states: "SUCCEEDED"  "FAILED"  "CANCELED" "CREATED"
  *		- Get Task State:		taskState tskExample;
  *		- Get Task Description:	taskDescription tskExample;   // returns the *task title* as a string
  *		- Show Task Hint:		[tskExample] call mk_fTaskHint;  // make sure tskExample and the mk_fTaskHint function exist
  *							
  *
  *	Authors: Jinef & mikey
  */

// since we're working with the player object here, make sure it exists
waitUntil { !isNull player }; // all hip now ;-)
waitUntil { player == player };

/*
player createDiaryRecord["Diary", ["Info", "<br/>Author - mikey<br/>Version 0.03<br/>"]];
player createDiaryRecord["Diary", ["Enemy forces", "<br/>Enemy forces are expected to be running to the same <marker name='mkrFlagpole'>flagpole</marker> as us, so stay frosty!"]];
player createDiaryRecord["Diary", ["Friendly forces", "<br/>Our fireteam will start on the western edge of the airfield."]];
player createDiaryRecord["Diary", ["Mission", "<br/>Our fireteam has to reach the <marker name='mkrFlagpole'>flagpole</marker> first."]];
player createDiaryRecord["Diary", ["Situation", "<br/>Never play truth or dare while drunk. You will only end up with silly dares involving live ammunition and long distances to run."]];

// Secondary Objective
tskWestObj2 = player createSimpleTask["Secondary: Stay Alive"]; 
tskWestObj2 setSimpleTaskDescription["Let's not take any risks. It's not worth going home in a box for this. Stay frosty!", "Avoid Casualties", "Avoid Casualties"];
//>---------------------------------------------------------<
// Primary Objective
tskWestObj1 = player createSimpleTask["Primary: Get to the flag first"]; 
tskWestObj1 setSimpleTaskDescription["Your fireteam starts <marker name='mkrWestStart'>here</marker>. Your task is to secure the <marker name='mkrFlagpole'>flagpole</marker> first.", "Secure The Flagpole", "Secure The Flagpole"];
tskWestObj1 setSimpleTaskDestination (getMarkerPos "mkrFlagpole");
player setCurrentTask tskWestObj1;
*/

// briefing entries

_log_briefing = player createDiaryRecord ["Diary", ["Fast Travel", "<br/>When near the LAV-HQ at the Airbase you can request a transfer to locations displayed in the menu.<br/>Destinations include:<br/>MHQ Ambulance / ReconHQ (humvee 240)<br/>3 FARP's / HMS-GITS Carrier <br/>Island / SW Dock.<br/><br/>You can also HALO from here."]];

_log_briefing = player createDiaryRecord ["Diary", ["MHQ & ReconHQ", "<br/>At Respawn HQ you can transfer to these two Mobile Headquarters (MHQ) in the field. <br/>The Ambulance respawns automatically once destroyed.  <br/>The Recon HQ humvee is created/ removed by the Commander and does not respawn automatically."]];

_log_briefing = player createDiaryRecord ["Diary", ["Enemy Radio Tower & HQ", "<br/>The Radio tower must be destroyed using C4 to prevent enemy reinforcements. <br/>Enemy reinforcements include armour arriving by road, airborne Spetsnaz troops and special MVD units by lorry. <br/>Destroying a radio tower will add 10 pts to all players in your squad."]];

_log_briefing = player createDiaryRecord ["Diary", ["Cleared City", "<br/>Once the enemy is cleared from the objective city you will receive a confirmation message from Crossroad. <br/>The objectives then move to the next city to capture. <br/>The M key will show you what city has to be freed next. <br/>There are 11 cities to be freed to complete the mission.<br/>Clearing a city will add 10 pts to all players in the city."]];

_log_briefing = player createDiaryRecord ["Diary", ["Officer", "<br/>Every City has an Officer who can be arrested. <br/>During the arrest there will be 10 points for each BluFor in a 10m radius. <br/>If the Officer gets shot accidentally 11 points will be removed.<br/>Capturing an officer alive will add 20 pts to all players in your squad."]];

_log_briefing = player createDiaryRecord ["Diary", ["Ammo Box", "<br/>Here you can equip yourself with weapons.  There is also a CDF weapon crate nearby.  <br/>Be sure to access the crate only when you have your primary weapon equipped and when you are in standing position - this will prevent loadout save bugs.  <br/>You will see Weapon Saves message if your loadout has saved correctly.  <br/>You will then respawn with this loadout."]];

_log_briefing = player createDiaryRecord ["Diary", ["Vehicles", "<br/>There are many vehicles and planes availible in your HQ and at FARP's as well as boats at the Dock, Carrier and Island.  <br/>You gain permission for using the planes and vehicles with your rank. <br/>If a vehicle is destroyed it will respawn in the field but will need repair with a repair truck and Engineer or Demolitions Expert making a FARP. <br/>Fuel can be obtained at FARP's, Gas Stations, and Pilots can build a Refuel Depot. <br/>Planes and vehicles respawn automatically at base after 10 minutes."]];

_log_briefing = player createDiaryRecord ["Diary", ["Vehicle List COLONEL", "<br/>COLONEL : 60 Points.<br/>Vehicles : AV8B2 CAS Harrier with FFARs/GBUs / A10 Warthog / AC130 Spooky Gunship"]];

_log_briefing = player createDiaryRecord ["Diary", ["Vehicle List MAJOR", "<br/>MAJOR : 50 Points.<br/>Vehicles : M1A2 TUSK Tank / AH64D Apache with Hellfires / AV8B Interdiction Harrier with AGMs/Mk82s"]];

_log_briefing = player createDiaryRecord ["Diary", ["Vehicle List CAPTAIN", "<br/>CAPTAIN : 40 Points.<br/>Vehicles : M1A1 Main Battle Tank / F35B Lightning Air Combat Fighter / AH64S Apache with sidewinders"]];

_log_briefing = player createDiaryRecord ["Diary", ["Vehicle List LIEUTENANT", "<br/>LIEUTENANT : 30 Points.<br/>Vehicles : AH1Z Cobra Attack Helicopter"]];

_log_briefing = player createDiaryRecord ["Diary", ["Vehicle List SERGEANT", "<br/>SERGEANT : 20 Points.<br/>Vehicles : LAV25 Light Armoured Vehicle / MV22 Osprey"]];

_log_briefing = player createDiaryRecord ["Diary", ["Vehicle List CORPORAL", "<br/>CORPORAL : 10 Points.<br/>Vehicles : AAV Armoured Personnel Carrier / LAV25HQ Light Armoured Vehicle with M240 / UH1Y Venom Helicopter"]];

_log_briefing = player createDiaryRecord ["Diary", ["Vehicle List PRIVATE", "Press T to activate the game mode menu. <br/>PRIVATE : 0 Points.<br/>Vehicles : MHQ / ReconHQ / M1030 / Any HMMWV / M119 cannon / MH60S Helicopter"]];

_log_briefing = player createDiaryRecord ["Diary", ["Build Special", "<br/>This menu action is different for each class of player:<br/>All - Build foxhole<br/>Commander - Recon HQ / Command Bunker / M252 Mortar<br/>Sniper - Ladder/Camo net<br/>Anti-Air - AAgun/Stinger/Igla Pod/ Kord<br/>Anti-Tank - TOW-pod/ M119 cannon / SPG9<br/>Spotter - Call in Tomahawk firemission<br/>Heavy Gunner - MG Nest M240/ M2/ Kord/ Dkshm<br/>Grenadier - Mk19 Grenade Launcher<br/>Engineer/Demolitions expert - FARP<br/>Medic/Corpsman - Field Hospital<br/>Pilot - Refuel Depot"]];

_log_briefing = player createDiaryRecord ["Diary", ["Assignments", "<br/>Select T menu Assignments to choose from a range of side-missions.<br/>Menu options and reward points vary with rank:<br/>Water Patrol - destroy enemy boats<br/>Land Patrol - locate and destroy enemy land forces<br/>Combat Air Patrol - locate and destroy enemy air forces<br/>Destory Armour - locate and destroy static enemy armour<br/>Destroy Convoy - locate and destroy mobile enemy convoy<br/>Destroy Troop Convoy - locate and destroy strong mobile convoy<br/>Search and Rescue - Rescue doctor/ pilot and return to Airbase<br/>Rescue Agent - Rescue Undercover Agent and return to Carrier<br/>Rendition - Capture enemy officer<br/>Defence - Protect CDF forces from an enemy assault<br/>Extermination - destroy armed and unarmed civilians holding WMD's<br/>Assassination - Kill enemy officer and his retinue<br/>Rescue Agent - Rescue a female agent from the enemy and exfil her to the Carrier"]];

_log_briefing = player createDiaryRecord ["Diary", ["Support Options", "<br/>Select T menu Support to choose from a range of support options.<br/>Menu options and points cost vary with rank:<br/>* ammo crate * marker smoke * inflatable boat * large area fire<br/>* smokescreen * illumination * precision strike <br/>* scout bike * MG station * small artillery<br/>* mortar station * build fortification * cluster bomb <br/>* armoured boat * AA battery * large artillery<br/>* artillery cannon * chemical strike * HALO extraction * ICBM"]];
