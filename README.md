

<u><b>Installing Database:</b></u>
============================

- You need to have MySQL version 5.5 and up.
- Import \sql\full.sql into your database
- Import \sql\full.sql into your database
- Import \sql\add_recommended_mysql_events.sql into your database
- Import \sql\add_lastupdated_to_existing_object_data

(NOTE: If your having issues installing the functions, and get a message saying you don't have permission to install, you must install the functions as a 'root' user)

<u><b>Installing Files: LAN</b></u>
============================

- Install the latest OA Beta Patch (http://www.arma2.com/beta-patch.php)
- Copy all files into your arma 2 directory into the same folder
- Edit the following file:<br>
--- \instance_11_Chernarus\HiveExt.ini<br>
change the mysql details to yours<br>
to start server run instance_11_Chernarus.bat<br>


<u><b>Enabling Admin Tools</b></u>
============================

open <b>/admintools/Activate.sqf</b> Look for:
<pre>if ((getPlayerUID player) in ["#######"]) then {
Change "#######" to your Player ID
</pre>

open <b>/admintools/AdminToolsMain.sqf</b> Look for:
<pre>if ((getPlayerUID player) in ["#######"]) then {
Change "#######" to your Player ID
</pre>

<u><b>Turn Addon/Script off</b></u>
============================
make sure your server and game are not running<br>
Run scriptcontrol.exe<br>

<u><b>Add-Ons</b></u>
============================
* AI bus route - Credits: axeman<br>
* take clothes - Credits: Zabn<br>
* Safezone Commander - Credits: AlienX<br>
* Sarg AI - Credits: Sarge<br>
* DayZ Mission System(chernarus) - Credits: lazyink (Original code by TheSzerdi, Falcyn and TAW_Tonic.)<br>
* Headshot Suicide - Credits: Grafzahl<br>
* house lights - Credits: axeman<br>
* street lights - Credits: axeman<br>
* tower lights - Credits: axeman<br>
* auto refuel - Credits: Seven<br>
* fast rope - Credits: BTC<br>
* nametags - Credits: Skaronator<br>
* snow - Credits: Audio Rejectz<br>
* night fog - Credfits: TorturedChunk - j0k3r5 - mmmyum<br>
* heli lift - Credits: R3F Team<br>
* towing - Credits: R3F Team<br>
* Airraid - Credits: mmmmyum<br>
* Admintools - Credits BluePheonix<br>
* Self bloodbag- Credits: Krixes<br>
* anti zombie emitter - Credits: Freaking Fred<br>
* Drink from water sources - Credits: Mamu1234<br>
* tent healing - Credits: Krixes<br>
* burn tents - Credits: Soul<br>
* Bottle Rain Water - Credits: BDC<br>
* Base Building 1.2 - Credits: daimyo21<br>
* Tame Dogs<br>
* Animated C130 Crashes<br>
* Animated heli Crashes<br>
* Debug Monitor - Credits: J0k3r5<br>
* Idestructable Bases - Credits:

