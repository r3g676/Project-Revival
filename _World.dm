var/MakyoStar=0
var/Crazy=0
//var/debuglog = file("debuglog.log")
//MAKE NPC SPAWNS(did some on earth already)...or just place them on the map for now o.o they dont save
//add the cooler npcs lol()> note; done with SpecialBig.dmi, start/finish Special.dmi
//dont fuking release till that shit is done dumbfuck.
//WORRY ABOUT SHIT MORE.
//ADD NPC DROPS!!!!!!@@!@@!@
#define DEBUG
world
	name="Roleplay Rebirth"
	status="Let's Make A Map edition"
	turf=/turf/Special/Blank
	area=/area/Outside
	mob= /mob/Creation
//	hub="EnvyAttraction.RPRebirth"
//	hub_password="haha"
	tick_lag=0.95
	fps=12
	//step_size=16//32
	cache_lifespan=2
	loop_checks=0
	view=8
	OpenPort()
		..()
		world<<"World Link: byond://[address]:[port]."
	New()
		..()

		LOGscheduler.start() // kick off the scheduler for logging at the start of the world

//		debuglog << "Preparing to load world."
		WorldLoading=1
//		debuglog << "Worldloading set to 1."
		spawn(100)GlobalSave()
//		debuglog << "spawn(100)GlobalSave() ran successfully."
		Stars()
//		debuglog << "Stars() ran successfully."
		//spawn(100)Check()
		log=file("Saves/Errors.log")
		spawn(10)BootWorld("Load")
//		spawn(10)SuperLoop()
//		debuglog << "\n\nSERVER STARTED AT: [time2text(world.timeofday, "hh:mm.ss")]\n\n"
	Del()
//		BootWorld("Save")
//		debuglog << "\n\nSERVER STOPPED AT: [time2text(world.timeofday, "hh:mm.ss")]\n\n"
		..()

proc/SpawnMaterial()
	var/num=0
	for(var/obj/Items/Tech/SpaceTravel/Ship/AndroidShip/Q in world)
		num++
	if(num==0)
		world<<"<small>Server: Spawning Android Ship."
		var/obj/q=new/obj/Items/Tech/SpaceTravel/Ship/AndroidShip
		q.loc=locate(rand(1,500),rand(1,500),12)
	var/list/buh=list("Earth"=1,"Namek"=2,"Vegeta"=3,"Ice"=4,"Arconia"=5,"Sanctuary"=6,"AlienRuin"=7,"AlienGrassland"=8,"AlienOcean"=9,"AlienArctic"=10,"AlienDesolate"=11,"PirateColony"=12)
	for(var/x in buh)
		if(Planets.Find(x))
			var/numz=0
			for(var/obj/Planets/Q in world)
				if(Q.Zz==buh[x])
					numz++
			if(numz==0)
				world<<"<small>Server: Spawning [x]"
				var/obj/planet = text2path("/obj/Planets/[x]")
				new planet(locate(rand(1,500),rand(1,500),12))
	num=0

/*	var/amount=5
	while(amount>0)
		for(var/obj/Planets/Alien/Q in world)
			if(Q.Zz==amount)
				num=1
		if(num==0)
			world<<"<small>Server: Spawning Random Alien Planets."
			var/obj/q=new/obj/Planets/Alien
			q.loc=locate(rand(1,500),rand(1,500),12)
			q:Zz=amount
			var/randy=1
			var/randx=amount
			while(randx>5)
				randx-=5
				randy++
			world<<"<small>Server: Spawning Conquer Flag on Random Alien Planet."
			var/obj/A=new/obj/PlanetFlag/Pole
			A.loc=locate(rand(randx*100-99,randx*100-1),rand(randy*100-99,randy*100-1),14)
			A:Zz=amount
			switch(amount)
				if(5)
					q.icon-=rgb(100,100,100)
				if(4)
					q.icon+=rgb(-30,-40,50)
				if(3)
					q.icon+=rgb(-30,48,-50)
				if(2)
					q.icon+=rgb(-44,44,50)
				if(1)
					q.icon+=rgb(-70,40,-56)
		amount--*/


//var/numberz=0

proc/GlobalSave()
	set background=1
//	while(1)
//	numberz++
	sleep(108000)
	world<< "<b><HTML><FONT COLOR=#FF0000>T</FONT><FONT COLOR=#FF2900>h</FONT><FONT COLOR=#FF5200>e</FONT><FONT COLOR=#FF7B00> </FONT><FONT COLOR=#FFA400>w</FONT><FONT COLOR=#FFCD00>o</FONT><FONT COLOR=#FFF600>r</FONT><FONT COLOR=#FFff00>l</FONT><FONT COLOR=#D6ff00>d</FONT><FONT COLOR=#ADff00> </FONT><FONT COLOR=#84ff00>i</FONT><FONT COLOR=#5Bff00>s</FONT><FONT COLOR=#32ff00> </FONT><FONT COLOR=#09ff00>s</FONT><FONT COLOR=#00ff00>a</FONT><FONT COLOR=#00ff29>v</FONT><FONT COLOR=#00ff52>i</FONT><FONT COLOR=#00ff7B>n</FONT><FONT COLOR=#00ffA4>g</FONT><FONT COLOR=#00ffCD>.</FONT><FONT COLOR=#00ffF6> </FONT><FONT COLOR=#00ffff>P</FONT><FONT COLOR=#00F6ff>r</FONT><FONT COLOR=#00CDff>e</FONT><FONT COLOR=#00A4ff>p</FONT><FONT COLOR=#007Bff>a</FONT><FONT COLOR=#0052ff>r</FONT><FONT COLOR=#0029ff>e</FONT><FONT COLOR=#0000ff> </FONT><FONT COLOR=#0900ff>y</FONT><FONT COLOR=#3200ff>o</FONT><FONT COLOR=#5B00ff>u</FONT><FONT COLOR=#8400ff>r</FONT><FONT COLOR=#AD00ff>s</FONT><FONT COLOR=#D600ff>e</FONT><FONT COLOR=#FF00ff>l</FONT><FONT COLOR=#FF00F6>f</FONT><FONT COLOR=#FF00CD>!</FONT></HTML></b>"
	for(var/mob/Players/Q)
		if(Q.Savable&&Q.client!=null)
			Q.client.SaveChar()
	BootWorld("Save")
	.()

	//	if(numberz>5)
	//		numberz=0
	//		world<<"Server is rebooting in 30 seconds! Prepare!"
	//		spawn(300)world.Reboot()


var/Updates={"
<i>|Version MM/DD/YYYY|</i><br><br>
<b>Version V9.3.1 9/10/2015 - fuck pokemon</b><br>
-kirito's sword<br>
-tweaked some Tier S shit<br>
-added pidgeons and virtual boys<br>
-fixed a bunch of buffs that can mess up your buff slots, including the armors<s>, with just a shift of up to 2 lines per buff. easy ass bug fixes, boss.</s> apparently update logs have to be professional.<br>
-covered a bunch of exploits, which'll probably make people mad.<br>

<b>Version V9.3 9/8/1996 - IT'S FINE I'M HERE</b><br>
-more skills<br>
-tweaked ascensions<br>
-squeaky penises<br>
-koden's undying love and affection<br>
-etc etc<br>
-OOC: Killer boy5500(x): Im not fucking with you, do you want me to suck it?<br>

<b>Version V9.2 8/16/2015</b><br>
-Optimized more shit<br>
-Added more shit<br>
-Kowala... ;-;<br>

<b>Version V9.1.5 8/8/2015</b><br>
-Lowered refuel prices on boats.<br>
-Refueling will ask you how much fuel you would like to add.<br>
-Probably fixed the bug with creating scouters and being spammed 9001 times.<br>

<b>Version V9.1.4 8/3/2015</b><br>
- Extended some caves and changed others.<br>
- Added a sky plane to Vegeta since Earth has one, too.<br>
- Nerfed swimming.<br>

<b>Version V9.1.3 8/2/2015</b><br>
-Medical Technology moved to Material Technology I.<br>
-Readded Conveyor Belts.<br>
-Readded Force Field Emitters.<br>

<b>Version V9.1.2 7/19/2015</b><br>
-Regen Tanks significantly buffed.<br>
-Medkits significantly buffed.<br>
-A Wound Intent toggle has been added in Other. All players default to no wound intent.<br>

<b>Version V9.1.1 7/102015</b><br>
-Turfs no longer are nearly invincible due to upgrades.<br>
-Those without Material Technology can upgrade turfs to not have the consistancy of paper.<br>
-The requirement descriptions for certain technologies have been updated.<br>
-Modern Communication Technology added on request. It contains the Beacon, a device detectable automatically by scouters and internal scanners.<br>

<b>Version V9.1.0 "SCIENCE! Edition" 7/3/2015</b><br>
-Nekos are back.<br>
-Nekos are super overhauled and full of friskiness and mystery.<br>
-Technology has received a partial overhaul: now tech unlocks are regulated by Materials Technology I to V.<br>
-Any preexisting Material Technology unlocks are automatically converted to Material Technology II.<br>
-You may purchase any category in the same row as the material technologies you have unlocked. For example, Medical Technology is in the same column as Material Technology II.<br>
-You do not need to purchase in order from top to bottom in the column. If you have Material Technology III, you can get Scouter Technology without needing to get Scanner Technology.<br>
-Materials Technology is the exception, it must be bought in order.<br>
-Materials Technology also improves turf upgrade, so if you have it, enjoy your buildings no longer being made of paper.<br>
-Speakers can now be upgraded into Intercoms once again.<br>
-There was other stuff that Jinx forgot to put in the notes. I'm just going to assume it was on purpose.<br>

<b>Version V9.0.9 6/19/2015</b><br>
-Tuffles now require their ascensions past the second one to be unlocked. All Tuffle ascensions have been reverted as a result.<br>
-The Passive Tree has been removed, and all passives refunded/reverted.<br>
-Pursuit's follow-up no longer misses.<br>
-Admin Help's character limit has been risen.<br>
<b>Version V9.0.8 6/15/2015</b><br>
-The races verb is once more publically available, as ListRaces.<br>
-Every race in the game has been renamed to "Lemmings."<br>
<b>Version V9.0.7 6/13/2015</b><br>
-Pursuit no longer stuns, but delivers a powerful knockback instead.<br>
-Halved combo damage but doubled base melee damage.<br>
-Buffed the energy you regain upon punching, and made it take effect even if you're powered up below +100%.<br>
-Power Recovery roots you for 2 seconds before it starts to take effect. It cannot be toggled off during this time, so use it carefully!<br>
-If Power Recovery is active, both Afterimage Strike and Wild Sense toggle off and go on cooldown.<br>
-Reimplimented voiding.<br>

<b>Version V9.0.6 6/6/2015</b><br>
-I mean it this time. Advanced Stances are fixed.<br>
-Nerfed water a tiny bit.<br>

<b>Version V9.0.5 6/5/2015</b><br>
-Really fixed Advanced and Super Stances.<br>
-Heal is less shitty.<br>
-Senzu Beans are less shitty.<br>
-Security technology now gives the Security Chip as a stand in for a better system. Install it into a Scouter, and then install a Communication Chip into a camera to allow Says to be broadcast from the camera to the scouter.<br>

<b>Version V9.0.4 6/2/2015</b><br>
-Water became less deadly.<br>
-Fixed Advanced Stances.<br>
-Renamed Spin Attack to Spin Rave to avoid interfering with attack macros.<br>

<b>Version V9.0.3 5/30/2015</b><br>
-Training reenabled.<br>
-Other stuff.<br>
-Tech Swords fixed probably.<br>

<b>Version V9.0.2 5/16/2015</b><br>
-Some background quality of life changes for Admins.<br>
-Tuffles have a passive in regards to Technology that makes their versions of it slightly better.<br>

<b>Version V9.0.1 5/14/2015</b><br>
-Fixed up various things that broke for some reason.<br>

<b>Version V9.0.0 5/9/2015</b><br>
-Sweeping changes to virtually every price on the Skill Tree.<br>
-Virtually no skills need Dev Points anymore. These are exclusively for Tier S, and Stat Passives at this time.<br>
-Some Tier S have been overhauled.<br>

<b>Version V8.8.4 4/27/2015</b><br>
-Added new Hero of Aspect: Nick. If rolled, the only aspect you can get is Time.<br>

<b>Version V8.8.3 4/22/2015 - Fuck it Edition</b><br>
- Removed a bunch of shit from the Skill Tree. Dealsies.</br>

<b>Version V8.8.2 4/20/2015 Blaze It Edition</b><br>
-Fixed a typo that was making it seem like Materials Technology was Modern Mining Technology.<br>
-Fixed the issue that was preventing the Steel Drillbit from unlocking.<br>
-Fixed a issue with Expand that could generate infinute buff slots.<br>
-Fixed a issue with Keyblade that allowed players to pick multiple things with Manifest Keyblade.<br>
-Fixed a few other things somewhere.<br>
-420<br>

<b>Version V8.8.1b 4/16/2015</b><br>
- Added spendable dev points to the statistics tab.<br>
- Removed Science level, XP, and enchant level and XP on statistics tab.<br>
- Oops. Kaioken was taking a special buff slot. Fixed that.<br>
- Made Materialize cost 1RPP. It's now located under Tier 0.<br>
<b>Version V8.8.1 4/15/2015</b><br>
- Slightly increased recovery for Aetherian first ascension and added in energy boost to their second ascension.<br>
- Buffed Amakakeru. Let's hope it's not too OP.<br>
<b>Version V8.8 4/13/2015</b><br>
-Halved the effectiveness of Speed passives.<br>
-Made Blood Hero less effective.<br>
-Axe Kick doesn't take Speed Multiplier into account anymore. Again.<br>
-Fixed the Ripple's power up drain.<br>
<b>Version V8.7.9 4/12/2015</b><br>
-Hyper Tornado now freezes the user for 4 seconds, but has a larger range to compensate. It also drains a lot more energy.<br>
-Deactivating Braveheart lowers your energy to 0 and cancels out your power up. It also doesn't restore your energy if you're below 20%.<br>
-Limit Breaker no longer takes up a special slot.<br>
-Buffed Hero of Aspect.<br>
-Made Sharingan and Stands no longer take up the normal buff slot.<br>
-Buffed Zenkai 1 on Lowies and Normies.<br>
-Ki blade cuts accuracy by 33% again.<br>

<b>Version V8.7.8 4/10/2015</b><br>
-Fixed Keyblade so it gives the user a sword and will set it up properly.<br>

<b>Version V8.7.7 4/8/2015 "Will you shut up now, Maki" Edition </b><br>
-Fixed a problem with Scouter Upgrades. If you installed upgrades before this update, simply uninstall them and reinstall to fix.<br>
-Senzu Beans now recover Wounds and Fatigue.<br>
-Actually implemented the Medkit into Medical Technology.<br>
-Ripple now gives a large boost to your energy mod and has a scaling reduction of power up drain and increase of energy recovery rate, which worsens depending on your health to represent it being harder to control your breath.<br>
-One's Ripple passive now increases damage exponentially instead of linearly, starting out weaker but allowing you to pretty much liquify Vampires at later levels. <br>
-Examining a Scouter now reveals the upgrades installed.<br>
-You can uninstall upgrades from a Scouter without having to install another upgrade first.<br>
-You can now use the new QuickToggleStance verb, along with the stance name (Example: QuickToggleStance Wolf) to automatically switch between stances and activate them. Best used as macros.<br>
-Activate Stance has been renamed to Toggle Stance because that's what it does, really.<br>

<b>Version V8.7.6 4/4/2015 Technomancer Edition</b><br>
-Technology is partially reimplemented.<br>
-Only Tuffles currently can access the higher ends of technology.<br>
-You may access the tech tree though the new Tech Tree verb. Infomation on each Technology Package is available there.<br>
-Most of the new items lack icons at this time, pending them being made.<br>
-A few bugs were even patched up here and there.<br>

<b>Version V8.7.5 4/2/2015</b><br>
-The V9001 update has been rolled back due to international pressure.<br>
-You can no longer grab while being knocked back.<br>

<b>Version V8.7.4 3/31/2015 -<i>Removal Edition</i></b><br>
- Removed Titan Form passive regen. This didn't need to be a thing.<br>
- Removed certain things that didn't need to be in. Don't ask.<br>
- Began reorganizing the backend.<br>
<b>Version V8.7.3 3/27/2015</b><br>
-Decreased the price of TS skills across the board.<br>
-Donating dev points is now logged.<br>
-Passives above tier 5 now have to be unlocked by an admin. This isn't to prevent people from getting stronger so much as prevent people from being able to advance a tier S -and- get a lot of passives. It'll likely be unlocked upon request (don't ask us to unlock it as soon as this update goes live holy shit).<br>
-Rewarding someone now automatically gives them the intended minimum. There is no verb to toggle this because I literally designed the system around this minimum so I decided not to give admins the option to not do it.<br>
-Reworked Kaioken to be a multiplier and not an add. Implemented a "Super" Kaioken that is basically Kaioken on roids and a higher drain, and "Kaioken Strike" that's pursuit without a required knockback.<br>
-Removed the ability to see one's own reward multipliers. This was a disaster waiting to happen.<br>
-Pursuit now has a cooldown that makes sense.<br>
<b>Version V8.7.2 3/27/2015</b><br>
-Commented out Tornado Overdrive-- Ripple users have enough moves yo.<br>
-Fixed stacking issues with Dragon Dash and Reverse Dash.<br>
-Removed stats from a certain skill that shall remain nameless.<br>
-Ripple users who have their stance active can now 'walk' on water. Rejoice!<br>

<b>Version V8.7.1 3/25/2015</b><br>
-Retroactively updated the update logs.<br>
-Passives now only cost a single dev point, and use different math when determining which ones you can buy.<br>
-Power up now correctly drops when your energy is under 10%, and fully drains you of the rest of your energy.<br>
-Swords no longer nerf your damage by equipping them, but have 10 less points.<br>
-Buffed Kaio Teleport.<br>
-Rewards now decay less strongly.<br>
-Ansatsuken Fixes<br>
--The two verbs that don't work (Shoryuken and it's Ex variant) have been internally replaced with ones that do. IF you have Ansatsuken before this update, adminhelp for the proper versions of those.<br>
--The range of Ex Tatsumaki has been slightly improved to actually make it useful.<br>
-You can no longer grab while stunned, hilarious as that was sometimes.<br>
-Lycan Fixes<br>
--Wolf Form no longer is a source of infinite speed.<br>
--Wolf Form no longer grants extra buff slots.<br>
-Minor mapping errors have been corrected.<br>
-Thunderhands, a force based Burning Finger, has been given its verb.<br>


<b>Version V8.7 3/19/2015</b><br>
-It is now possible for Half Saiyans to buff in Super Saiyan.<br>
-Humans are now back to normal.<br>
-Saiyans are common, but nerfed, and have a new Zenkai 0 ascension that restores them to their original power. It's not actually a Zenkai, it's just a competency barrier.<br>
-Projectiles no longer hit the user, but don't some don't delete upon hitting someone. This'll be fixed, probably.<br>
-Buffed passives.<br>
-Implemented a tree that people can buy and progress buffs on their own with.<br>
-Fixed flying. It's possible to fly over people now.<br>
-Fixed a bug with custom Stands. I don't know what bug was fixed because the person writing these is not the same one who fixed them.<br>
-With a few exceptions, no tier S skills grant buffs to stat mods anymore.<br>
-Aliens now have higher base recovery or something.<br>

<b>Version V8.6.35, 3/13/2015</b><br>
-General balance tweaks to various things.<br>
-Various minor bug fixes.<br>

<b>Version V8.6.34, 3/10/2015</b><br>
-It is now mechanically impossible (unless you find a bug) to use buffs outside of stances while in Super Saiyan.<br>
-Stands now take the normal buff slot as well as the special one.<br>

<b>Version V8.6.33, 3/10/2015</b><br>
-Sense Level 2 and 3 have been significantly buffed.<br>

<b>Version V8.6.32, 3/6/2015</b><br>
-Fixed Tatsumaki to avoid stacking issues.<br>
-Fixed Pulse being abusable to attain high stats.<br>
-Fixed Weapon Master so it no longer can give infinite defense.<br>
-Nerfed Charge.<br>

<b>Version V8.6.31, 3/4/2015</b><br>
-Fixed the issue where meditating and relogging made the buttons to switch to the browser and verb tabs vanish.<br>
-Fatigue now builds up far slower.<br>

<b>Version V8.6.3, 3/3/2015</b><br>
-A few moves that could be stacked have been fixed to be unstackable, hopefully. Keep reporting em.<br>
-Kitsune have gotten minor buffs to not be completely awful mid to late game.<br>
-Timestamps have been restored to Say.<br>

<b>Version V8.6.2, 3/1/2015</b><br>
-Clothesline can no longer be stacked.<br>

<b>Version V8.6.1, 2/27/2015</b><br>
-Fixed the issue where one could stack buffs improperly with Excalibur and Muramasa.<br>
-Shield now protects you from oxygen loss. This fix also fixes Space Masks, though they are not currently available.<br>

<b>Version V8.6.0, 2/26/2015</b><br>
-New tech themed turfs and objects added.<br>
-Additional colors are availble for certain tech floors.<br>
-Yarr.<br>

<b>Version V8.5.9, 2/24/2015</b><br>
-Fixed Blood/Life Drain. Fuck yeah. (blood drain still sucks on PU races tho RIP)<br>
-Skill Tree yeeeeeeeah.<br><br>

<b>Version V8.5.8, 2/21/2015</b><br>
-Adjusted the AFK timer<br>
-TFR got remade<br>
-New planets incoming.<br>
-Refined and tailored the rules to fit modern dbr.<br><br>

<b>Version V8.5.7, 2/18/2015</b><br>
-Bosses are now immune to being stunned and slowed.<br>
-There is now a 3-second immunity to stun whenever it wears off.<br>
-Nerfed a few things into the dirt.<br>
-Admin PMs now appear in every chat box.<br>
<b>Version V8.5.7, 2/18/2015</b><br>
-Brackets now autofilter into local OOC unless you use a weird type of bracket, you fucking hipster.<br>
-Local OOC no longer has its own verb.<br>
-Skill usages and countdowns are now logged in every chat.<br>
-Overhauled Changies.<br>
-Attack delay has a lowered cap.<br>
-Knockback no longer has a 1 minimum, allowing people to get juggled no matter the power difference.<br>
-Buffed Androids far too much.<br><br>

<b>Version V8.5.6, 2/18/2015</b><br>
-Chat is now organized into four tabs. A all tab, which is how it was before this update, IC, which only will show says, emotes, ect, LOOC, for local OOC, and OOC, for OOC chat.<br>
-Fixed ripple ascensions. Finally.<br><br>

<b>Version V8.5.5, 2/15/2015 - THE DARWINATION/AMATSUNATION/ZARKUSNATION</b><br>
-Added a verb, CheckOwnLogs, in the other tab. This allows you to check your temp logs. After log checks, your temp logs get put in a archive category for you to review.<br>
-You can also find the multipliers used in rewarding at the bottom of the Archive Log.<br>
-A better save backup system was coded, that may actually provide usable save files.<br>
-Nerfed Herans, but this won't be retroactive for current ones.<br>
-Began reworking Nobodies into a legitimate, fairer rare instead of the wonky whatever they were prior.<br>
-Knockback has a smaller chance of applying.<br>
-A new Tier S was added, and more probably are coming.<br>
-Fixed Sendo Wave Kick<br>
-Invisible aliens can no longer see eachother. Or themselves. (: <br>
-A better save backup system was coded, that may actually provide usable save files.<br><br>

<b>Version V8.5.4, 2/12/2015</b><br>
-Removed a debugging message from the admin weather control command.<br>
-Potential fix for swords mysteriously resetting themselves.<br>
-Elemental Fists (AKA Advanced Stances) removed. Admin Help for a refund if you purchased one. (cost was 125 each)<br>
-Fixed guns beacuse we haven't had a 'fixed guns' message in the changelog in awhile.<br>
-Fixed Big Bang Attack and some other stuff... (; (Darwin)<br>
-Also added in the ability to change where one is facing w/o moving. (Ask Magi)<br>
-Fixed poison/burn. Once again, thank the darlose<br><br>

<b>Version V8.5.3, 2/9/2015</b><br>
-Fixed a oversight with Burst Regen that put those that use it at 500%, or higher, Fatigue.<br>
-Slightly increased the rate Fatigue is recovered.<br>
-Slightly decreased the rate Fatigue increases.<br><br>

<b>Version V8.5.2, 2/6/2015</b><br>
-Fixed a oversight that allowed Saiyans and Half Saiyans to Oozaru indoors, saving the roofs of many.<br>
-Brought back the save button. #firstdarwinupdate<br>
-Updated transformation tiers to be more recent. #firstdatwinupdate<br><br>

<b>Version V8.5.1, 2/4/2015</b><br>
-Fixed a bug where you could maintain the recovery boost of Power Recovery by using Dragon Dash. It no longer raises recovery, but directly increases your rate of recovering energy, and only does so when your Frozen var is ticked to 1.<br>
-Fixed an oversight where I accidentally left buffs on the skill tree for normal RPP instead of dev points.<br>
-Fixed a oversight that made some objects flagged as indestructable actually destructable.<br>

<b>Version V8.5, 2/3/2015</b><br>
-Implemented a passive tree that allows you to spend dev points to raise stat mods, allowing someone to go "buffless" if they so desire and still be able to compete. Passives get stronger the more you have (to a certain degree), so going pure passive gives greater benefits than just dabbling in them.<br>
-An easier, more intuitive reward system has been implemented.<br>
-Several tier S skills are no longer considered such, being re implemented in the form of ranks that will give out the skills. These teacher ranks start out with a handful of dev points, but will be unable to be rewarded any and will not get the final level of the skillset they were given. Basically, for the most part, skills are no longer applied for, with several exceptions.<br>
-Energy is no longer a mod that can be invested in, and as a stat, no longer raises. It's a flat 100.<br>
-Added a verb that allows someone to root themselves to the ground and heal their energy at a vastly quicker rate. Essentially, energy is a resource that can actually be renewed multiple times per battle, but also goes down far quicker.<br>
-DBR is still trainless and will remain as such for the forseeable future. <br>
-Added another dashing verb. This one lets you dash away from someone, allowing you to easily create distance.<br>
-The old reward verb has been renamed to "MultiReward," reflecting its ability to give multiple things at once. The new reward verb took its place, as it's going to be what's used for log clearing.<br>
-Gains of any kind now default to 0, preventing the need to set them.<br>
-Saiyans are now coded to be rare. Unlocking Elite for someone unlocks Saiyans, period. Further details on how rare-races will work will come in the near future.<br>
-Significantly rose melee damage.<br>
-Removed autofacing outside of the "boss fight" mechanic.<br>
-Blocking now only lasts 1 second.<br>
-Other stuff.<br>

<b>Version V.8.28, 12/11/2014</b></br>
-Asura Demigods make a comeback.  They are a rare version of demigod which comes with its own skillset and anger-based mechanics.<br>
<b>Version V.8.27,12/04/2014</b></br>
-Blocking Added!<br>
-Blocking reduces damage dramatically. While in use, most offensive skills are locked out. Defensive skills will be added that can only be used in the blocking stance i.e Parrying/CounterAttakcing<br>
-Split Form Rework (GOD HELPS US ALL!!!)<br>
<b>Version V.8.26,12/02/2014</b></br>
-Slash/Punch effects only show when they actually connect.<br>
-Lowered the diminishing return on high stat point races. <i>Aliens rejoice!</i><br>
-Wild Sense Added!<br>
-After Image Strike changes!<br>
<b>Version V.8.25,11/30/2014</b></br>
-Implemented Drive Forms for Keyblade users. Only someone with two Keyblades can obtain this skill, and it takes up your special buff slot.<br>
-Implemented Nothingness Keyblades, which are generally as weak as Darkness Keyblades but have no Dark Mode. Instead, they start out with the ability to enter Drive Forms.<br>
-Sword Slash visuals implemented.<br>
-Blunt Attack visuals implemented.<br>
-Slight changes to Dual and Triple Wield.<br>
-Any most forceful attacks that knockback <b>should</b> be accompanied by a shockwave.<br>
<b>Version V.8.23,11/29/2014</b></br>
-Fixed a bug where BP and energy didn't update correctly.<br>
-Nerfed Expand. No refunds.<br>
-Nerfed default accuracy to its original value.
<b>Version V.8.22,11/28/2014</b></br>
-Stats and BP can now automatically update when set by the verb, even if you're offline.<br>
-Gains set below 0.5 now automatically set to 0.<br>
-The Assess verb is now mostly useless and has been removed as a result.<br>
<b>Version V.8.21,11/26/2014</b></br>
-Skill Tree<br>
<b>Version V.8.2,11/25/2014</b></br>
-Injuries weren't recovering slow enough. The formula stays the same, but now recovery is reduced by the amount of injuries.<br>
-Fatigue recovery is also is reduced by injuries.<br>
-Knockback Collisions! <i>If it lags up the server, will be removed for optimization</i><br>

<b>Version V.8.1, "DBR: Hard Mode"  11/24/2014</b></br>
-All damage gives injuries.<br>
-Injuries recover slower.<br>
-<b>Gosh, darn I'm tired!</b>: Fatigue - works the same as injuries, but with energy. Skills that expend energy will also grant a bit of fatigue the user.<br>
-Throw implemented.<br>
-Seperated Aerial Recovery and Aerial Payback.<br>
-Aerial Recovery allows recovery from knockback without immediate retaliation.<br>
-Aerial Payback counters after recovery.<br>
-Aerial Recovery made a common skill.<br>
-Burning Finger graphical additions.<br>
<b>Version V.8.0, "MASSIVE FUCKING UPDATE" (if everyone else does their work) 11/19/2014</b></br>
-Multipliers for stats can no longer be viewed in assess or statistics. That's right, no more going for tier S buffs based on their effectiveness.<br>
-Body sizes have been removed, but people now get 25 stat points to spend.<br>
-Gravity no longer increases gains of any kind (i probably forgot a line or two of text pertaining to this.)<br>
-People now spawn with three hundred times more energy than they did prior.(30000)<br>
-The Build verb is now disabled until its given to you.<br>
-The Races and Planets verbs are now no longer available to players.<br>
-Saiyans, as a whole, have been buffed -tremendously- to levels nearing (if not surpassing) that of rare races, but now spawn with all of their normal buff slots taken, meaning that the only common buffs they can use are stances. What you see is what you get until Super Saiyan rolls around.<br>
-For some perspective, Saiyans were buffed to not -need- ascensions or buffs to fight on par- they're legitimately that strong. However, there's -vastly- higher scruitiny for the levels of Super Saiyan in general, to the point where people will no longer obtain the form (even just the first) just to compete, dooming your viability if you don't meet our standards.<br>
-Super Saiyan has been overhauled too, but -how- I have, I won't explain. At the basic level, transformation mastery is now RP locked and must be roleplayed to advance.<br>
-Transformation requirements have been removed from assess and are now irrelevant to actually obtaining the form, although time is certainly a factor.<br>
-tldr Saiyans are now hard mode instead of easy mode<br>
-Added a fatigue system where certain things temporarily lower your max energy. Your energy recovery is limited up to that amount, but fatigue gradually decreases over time, albeit really, really slowly. At this time, not very many things increase fatigue.<br>
-Removed Nekos entirely. :3c<br>
-All noteworthy ascensions must be unlocked.  No more freeloading.<br>
-No more wizard, healer or techie classes for now.  These concepts are being reworked.<br>
-Sense has been overhauled, and likewise is unavailable without considerable spending of Dev Points. Systems similar to sense (like Scouters) also have been overhauled partially.<br>
-Combat in general has been overhauled in many, many ways that cannot simply be listed.<br>
--I am allowed to say one thing: High defense/strength is no longer the meta. Build accordingly, or fail at combat.<br>
-Virtually all races received overhauls ranging from minor stat mod tweaks to partial reworks.<br>
<br>
<b>Version V.7.2.6, 11/9/2014</b></br>
-Added a function that massively inflates gains if you're above a certain Power/Stat rank. They're risen by a factor of 10 if you're over 25, and risen by a factor of 100 if you're over 60. This is a toggleable option so that it doesn't interfere too much with early wipe gains, given how volatile PR/SR are during that period.  This doesn't apply to using RPP for several behind-the-scenes reasons that I don't feel like explaining.<br>
-Manaketes.  It is a custom race for Milly, or something.<br>
-Hero of Aspect was altered. Pray I do not alter it any further.<br>
-Primordial Olympian Fury is now a thing.<br>
<br>
<b>Version V.7.2.5, 11/6/2014</b></br>
-Deus Ex Machina was rebalanced and got a few new toys.<br>
-More work on Bijuu.<br>
-Vampires are more balanced (lmao).<br>
-Stone Mask Vampires are more Dio-y.<br>
<br>
<b>Version <s>V.7.2.4</s> <B>RULES OF NATURE</B>, 11/3/2014</b><br>
-<s>Amatsuken</s> Ansatsuken has been added.  It features two paths: one for evil and one for not-evil.  It locks out the user from ever using swords, too.<br>
(I might as well clarify here how the programming works.  To level up the skill, bump up a person's AnsatsukenMod then have them use "Refresh-Ansatsuken".  The only other time admin intervention is necessary is when a person reaches level 4, where they need to set their AmatsukenAscension variable to "Chikara no Hado" if not-evil, or "Satsui no Hado" if evil.  It has to be precisely in those formats.  No uppercase N.)<br>
-Deus Ex Machina!<br>
Giving someone the Deus Ex Machina object will handle everything until they need to ascend.  To ascend, bump up their MachinaMod, then get them to "Sync & Unite".  4 is the highest level.<br>
Do note, Deus Ex Machina is CyberPower based enablement.  <s>It will lock out transformations.</s> J/k lmao.<br>
What does it do?  Basically, training will net you additional CyberPower.  Ascending will net you more cyberize mod and intelligence.<br>
<s>Overdrive functions as a DEM's transformation.</s> Now it's called Ripper Mode.  <s>It does the typical behavior, but</s> it can be turned off.  It also drains health rather than KOing or killing you randomly.<br>
Also it doesn't give x10 cyber BP.  That would just be ridiculous.  It scales up from <s>1.25</s>2.25x cyber BP at Machina 1 to x5 at Machina 4.<br>
It also gives you other android-y features.<br>
It's also <i>incredibly powerful</i>.  If you want to get DEM, you can pretty much give up dreams of having anything else above <i>maybe</i> a signature tier 5 skill.<br>
-Began work on Bijuu.  It is a special slot buff that also acts as a transformation.  Only transformation races can get a Bijuu, and it will replace their racial transformation.<br>
<br>

<b>Version V7.2.3, "New Model Androids" 10/29/2014</b><br>
-This just in, Amatsu Labs has just released a new model of Androids, promised to be more balanced then ever.<br>
--Juggernaut Class Androids are extremely durable, but slow. They have the abilities Juggernaut Mode and Heavy Drain. Juggernaut Mode transfers a portion of damage done into energy. Heavy Drain does small amounts of damage to energy, but has a lengthy cooldown.<br>
--Hunter Class Androids are well rounded, but possess no really exceptional stats. They have the abilities Tactical Cloak, and Hunter Mode. Tactical Cloak is exactly what it says on the tin, but does -not- reveal other cloaked entities. Hunter Mode will allow the Android to see any foe via thermal vision.<br>
--Engineer Class Androids are the techie class of the bunch, but are defensively stated. They have the abilities Enhanced Scanners, and will receive Tech Possession once its coded. Enhanced Scanners allows the user to see 'both' Z planes of a planet, in essense allowing them to see the underground from the surface, and the surface from the underground. Tech Possession will allow the user to 'possess' various forms of technology, and use their functions.<br>
--Slayer Class Androids are a high speed physical attacker, but are fragile. They have the abilities Blade Arm and Swordsman Servomotors. Blade Arm gives them the benefits of having a sword equipped, with a stat spread by default of 2 damage, 1 accuracy, 2 delay. Swordsman Servomotors buffs Offense and Speed by 25%, but reduces Endurance by 35%.<br>
--Old Model Wardroids (previously 'Fighter') are still around, and are more or less the same. Technologist Androids are removed. While Old Model Wardroids lack special abiltiies, Super Android can be installed into them to compensate.<br>
-Androids in general now will lose energy (though not as much compared to any other race) if they exceed +100% PU, and cap at +200%.<br>
-Fixed a bug that was preventing babies from making if their race was locked out.<br>
-Amatsu finally remembered it isn't April Fools anymore and set the default calibration on scouters back to normal.<br>

<b>Version V7.2.2, "Stuff was done" 10/23/2014</b><br>
- Magma armor was taken off the skill tree.<br>
- Light Sword And Light Armor Removed (Light Armor had no use in code).<br>
- Changed Turf Upgrade to no longer display keys<br>

<b>Version V7.2.1, "No fun update" 10/17/2014</b><br>
-Drastically decreased the max range of Zanzoken.<br>
-Enhanced Sense now no longer compares stats.<br>
-Dual Wield removed from T4.<br>
-Materialize added to T4. (the only fun part this update)<br>

<b>Version V7.2, 10/6/2014</b><br>
-A fix has been put in to avoid buff potions 'jamming'.<br>
-A fix to buff and recovery potion timers has been put in.<br>
-New turfs have been implemented.<br>

<b>Version V7.1.4, 9/18/2014</b><br>
-It is now possible to indefinitely mute one's ability to send and respond to admin helps. There is no timer for this. If you screw up this bad you may never be able to send admin helps again.<br>
-Starting RPP can now be set be an admin.<br>

<b>Version V7.1.3, 9/14/2014</b><br>
-Gohan Halfies are now coded to be rare (I think), and Goten stats were absolutely overhauled. Midwipe. Yeah. Foresight. (Bother an admin to remake, I buffed Goten SSj too but you won't receive the buffed numbers if you don't)<br>
-Energy gains were vastly increased if you're using RPP and have 85% of the highest energy or less.<br>
<b>Version V7.1.2, 9/11/2014</b><br>
-Fixed Dual and Tri Wield. This is purposefully ambiguous.<br>
-Wrath Devil Trigger has been nerfed. A lot.<br>
-Spiral Resistance has been removed from everything except King of Braves and Spiral Energy itself. This is retroactive.<br>
-Buffed most Half-Demon classes.<br>
-Nerfed Giji SSj.<br>
<b>Version V7.1.1, 9/10/2014</b><br>
-Attempts at fixing debuffs that stick implemented. This might break things more, but private testing is extremely difficult.<br>
-The Communication Chip can now be installed into Display Consoles. By picking Mainframe when the option comes up during a install, that console will be what consoles set to Terminal mode access.<br>
-The Resource Slot Chip has been implemented. It can be installed into Display Consoles and Gravity Machines to force having to put resources into it to activate!<br>
-Pods/Ships/Camera Probes can now be moved while the driver is meditating.<br>
-The bug where people could zanzo though doors has been fixed.<br>

<b>Version V7.1, 9/5/2014</b><br>
-Added in Storm, Magma, and Blood Armor. Each of those buffs have large stat boosts but lock out Power Up. They're Tier 4 skills, on par with Lightning Armor.<br>
-Vastly nerfed Energy gains when one uses RPP.<br>
-It is now easier to get angry with the Aspect of Rage.<br>
-King of Braves now automatically makes your hair glowy if you use the second stage or higher.<br>
-Spiral Energy/Nemesis received a large buff.<br>
-Gates now give a smaller energy boost per Gate.<br>
-KSP and Lower Hell gravity is now adjustable via admin verbs.<br>
-Gave Lightning Armor a less shitty icon.<br>
<b>Version V7.031, 9/2/2014</b><br>
- Added in Byakugan<br>

<b>Version V7.03, 9/2/2014</b><br>
-Fixed most sword related things from spamming the user should they have a number of blades in their inventory before the one they have equipped.<br>
-Removed Dual/Tri-Wield's Speed boost.<br>
-Rearranged a few of the numbers on Hiten Mitsurugi.<br>
-Fixed a bug with the Void aspect where it messed up whoever attacked you.<br>
<b>Version V7.02a, "Milly is Mapping again! Edition", 8/31/2014</b><br>
-Fixed AL Clouds so you actually fall through them<br>
-Fixed Hell Teleporter exit<br>
-You no longer get sent back to the checkpoint if you run out of Energy on Cardinal Planets<br>
-Created 2 new Namek grasses<br>
-Redid Namek<br>
-Fixed Tuffle spawn<br>
-Cameras equipped with a Communication chip can broadcast Says done in front of them to speakers now.<br>

<b>Version V7.02, 8/31/2014</b><br>
-Rebuffed the Windy Thing a bit.<br>
-Fixed a bug where people's BP kept going down despite being angered.<br>
-Nerfed the BP Brave Heart (buff you get w/ King of Braves) gives.<br>
-Fixed a bug where King of Braves gave vastly more power than it should've.<br>
<b>Version V7.01, 8/30/2014</b><br>
-Retconned update 6.8 into update 7.0.<br>
-King of Braves has been implemented. There will be a test period before it's released into the wild.<br>
-Added an antagonistic version of Spiral Energy named Spiral Nemesis, that starts out at a higher level of power but also caps out lower, and boosts strength/force instead of recovery and speed.<br>
-Nerfed the Windy Thing a bit.<br>
-Made Normal-class Saiyans have slightly less awful Speed (1.25->1.5).<br>
-Finished Hiten Mitsurugi.  It is a Tier S swordsmanship practice that locks out all other sword techniques and comes with ascensions.  Only a 1 damage multiplier sword can be used.<br>

<b>Version V7.0, "Slow the fuck down Jinx" Edition, 8/25/2014</b><br>
-Nerfed Mugetsu and the Seventh Gate.  They now have day long cooldowns that grow bigger each time you use them.<br>
-Ensured people using Mugetsu have access to FGT while in Mugetsu, but not outside of Mugetsu.<br>
-Hero of Aspect is essentially finished.<br>
-Fixed a silly bug with Spirit Energy.<br>
-Fixed a bug with zanzoken. (Probably)<br>
-Rearranged some things about Kaioshin, Demon Lord.  KS and DL now get their base set to 10k precisely, if it's lower than that.  They get all stances (except advanced ones)(yes this includes super stances) and lost some other skills.<br>
-King of Vegeta now always gets Conqueror's Haki.  There is an option to give them an Antagonist Base Boost(TM) which gives them 1k base / mod if their base is lower than that.  Pretty much only useful or threatening early wipe.<br>
-YIFF YIFF YIFF.<br>
-Nekos and Youkai spawn on Arconia once again.  Earthlings, rejoice!  Aliens, rejoice as well but for entirely different reasons!<br>
-Spiral Resistance no longer makes you immune to timestops.<br>
-Sharingan was restatted to be based on off/def/speed/anger rather than "haha everything."<br>
-Sharingan will not let you calm while you are using it.<br>
-Majin adds +50% to your anger.  If this still leaves it under 200% anger, it'll still set your anger to 200%.<br>
-No more death chance for Jagan Eye.<br>
-Cardinals no longer get mystic.<br>
-All of the essential ranks get Donate RPP.<br>
-Zeromage can now be Yomi.<br>
-Unlock potential got a redo.  It now doesn't require admin permission but has a cost associated with it!!<br>
-Revives can be done without admin potential.  There is a chance you will die, and you will certainly die if you revive someone else who can revive.  It has a cooldown too.<br>
-Nekos now only have 4 potential.  Curse you, balance!!<br>
-Lightbringer, Deathbringer, Excalibur and Muramasa can all be used either as a slotted buff or a special buff.  They will give BP regardless.  However, upon activating Light/Deathbringer, you will lose Excalibur/Muramasa.<br>
-Deathbringer now has the WeaponBreaker effect attached to it.<br>
-There is now a hard coded special slot that buffs such as Spiral Energy, Sacred Energy Armor, Kamui, and their ilk take up.  Dual/Tri Wielding is an exception, as is Sage Mode (for now).<br>
-THERE WERE MANY BUGS WITH SWORDS.  THEY ARE FIXED NOW.<br>
-Began to add in Hiten Mitsurugi.  It is a purist sword style based on speed, style, and grace.<br>
-Nerfed 1/16th saiyans.  Less HT add (5m) and 2 starting recovery.<br>
-Stat focus ratios were changed.<br>
-Cardinal planets were added.<br>
-The Checkpoint was removed.(?)<br>
-Tuffle ascensions were rearranged.<br>
-Upgrade Sword is now on the skill tree for 300 points.<br>
<br>
<b>Version V6.7.8.1, 8/21/2014</b><br>
-Spirit Energy was finished.</br>
-Began to add in Hero of Aspect.  It is a Tier S buff which can be utilized in many different combinations.  Each aspect has a passive that is deliberately coded so that anyone can use it regardless of if they have the buff or not.  Not important to most people, but kind of cool for potential events.<br>
-Pods reactivated for players to make. Enjoy actually being able to use the engine parts!<br>
</br>
<b>Version V6.7.8, 8/20/2014</b><br>
-A bug where one could use swords with Stances was fixed.<br>
<br>
<b>Version V6.7.7.c, 8/19/2014</b></br>
-Beams are fixed.</br>
-Buffs are fixed probably lsdojflsdkjflsdkfn.</br>
-You can now unbolt Reinforced Doors if you are the owner.<br>
-I've split the Force Field Remote functions into two verbs.<br>
Blast was made a good deal stronger to compensate for the cooldown it now has.<br>
Ki in general has been made a good deal more accurate. I've probably just made a huge mistake.<br>
-Split the Force Field Remote functions into two verbs.<br>
-You can now review your own Skill Emote logs with CheckSelfSkillLog.<br>
</br>
<b>Version V6.7.7.b, 8/18/2014</b></br>
-Spirit Energy was added in.  It's a new escalating buff, in the same vein as Spiral Energy and Kamui.</br>
</br>
<b>Version V6.7.7, 8/17/2014</b><br>
Enhancement Chips have been upgraded and can be installed in a small range of tech items to add new functions.<br>
-The Communication Chip can be installed in Scouters, Communicators, Reinforced Doors and Cameras.<br>
--In the Scouter/Communicator, it adds a second frequency to talk over. In Reinforced Doors, it will send out a alert on a frequency of your choice that it has been opened. In Cameras, it allows it to transmit on a frequency of choice to Scouters.<br>
-The Security Chip can be installed in Scouters to allow them to receive stuff done near Cameras on a matching frequency.<br>
-The Scanner Chip can be installed in Scouters to allow them to determine range to people it detects.<br>
Mugetsu has been retooled into a buff on par with the Seventh Gate, Base BP drain and all. In terms of logging for it, it's now a Tier S skill.<br>
The progression for it is Excalibur->Lightbringer->Mugetsu or Muramasa->Deathbringer->Mugetsu. Dual-Wield->Tri-Wield->Mugetsu is also acceptable.<br>
Makosen now has a cooldown and a drain. It's also no longer a super (but kind of might as well be).<br>
Other things that will be revealed in <b>time</b>.<br>

<b>Version V6.7.6, 8/14/2014</b><br>
Internal Scouters now have the functions of the Scanner Enhancement Chip for Scouters.<br>
PDAs now have password protection abilities.<br>
<br>
Addendum:<br>
Excalibur, Muramasa, Deathbringer and Lightbringer now give BP if you don't have a buff on when you turn them on.</br>
</br>

<b>Version V6.7.5, 8/12/2014</b><br>
Two new ship/pod parts added, the Fusion Reactor and the Compressed Fuel Canister. One reduces fuel usage, one increases maximum fuel.<br>
Ships and pods have gained increased fuel and speed counts in response to feedback. If you have made a ship or pod before this update, admin help after removing all parts to get it adjusted.<br>
In response to feedback, Space Masks no longer have a finite supply of oxygen.<br>
Also in response to feed back, you may now upgrade parts that are already installed in a Gravity Machine or Simulator by using the upgrade verb on them, rather then disassembling and removing them to do so.<br>
Nerfed the Eight Gates and Spirit Cuffs.<br>
<b>Version V6.7.4, 8/9/2014</b><br>
All sword buffs now take up a buff slot.</br>
Dual and Triwielding were rebalanced into perks rather than buffs.  One is a tier 4 and the other is a tier 6.</br>
</br>
<b>Version V6.7.3, 8/8/2014</b><br>
Tech Nekos can now use stat modules.<br>
Axe Kick damage slightly buffed.<br>
Fixed a bug that allowed more then one Infusion Crystal onto a Crystal Shovel.<br>

<b>Version V6.7.2, 8/5/2014</b><br>
Made it so that Super Stances take up the Advanced Stance slot rather than the Stance slot.</br>
Essentially, this means that you can use a Super Stance and a normal Stance.</br>
Nothing else changed.  They still take up buff slots.</br>
</br>
Jinx actually updated the update log because this update affects other people.</br>
Ha ha.</br>
</br>
<b>Version V6.7.1, 8/3/2014</b><br>
Use Reward Points now will also grant intel or enchant EXP if you're focused on those.<br>
Various new things have been added that I'm not quite sure what they do because Jinx didn't update the change log.<br>
Aethirians have been adjusted across the board stat wise.<br>
</br>
<b>Version V6.7.0.5, 8/2/2014</br><br>
Updated WMF's boosts.</br>
</br>
<b>Version V6.7, 7/19/2014</b><br>
Added a feature (currently exclusive to Saiyans, although this may change) that allows their first Super Saiyan form to essentially "replace" the next two, basically giving them a drainless version of that form (but still maintaining the recovery loss) and rendering the other two redundant, as they would no longer stack with the aforementioned add. (this doesn't directly impact SSj1 add so Lightning Armor and Expand wouldn't drastically increase one's power).<br>
(the above features will be known as Perfect Super Saiyan 2/3)<br>
Finished Savage SSj4, which is basically a weaker SSj4 for Savages (no shit) That carries stat boosts instead of a high BP boost, and has an add a bit stronger than SSj1. Calling it SSj-4- is a bit of a misnomer because it was designed to occur earlier on in the wipe, however.<br>
<b>Version V6.6, 7/19/2014</b><br>
Nerfed things that people like using because having fun is terirble.<br>
Added a new tier of Olympian Fury that changes your God Mode boosts. Three different classes, allowing you to counterbalance trans add and trans mult depending on your decision.<br>

<b>Version V6.5.5, "Actually updating the change log Edition",7/14/2014</b><br>
New buffs are available. Searing Heart, Ocean Mind, and Zephyr Vision. They function similarly to Stoneskin.<br>
A few bug fixes occured. Screw you sense bug. I will figure you out someday.<br>

<b>Version V6.5.3, 7/6/2014</b><br>
Fixed a typo that was preventing the proper reading and writing of log files, which is bad for all the reasons.<br>

<b>Version V6.5.2, 7/5/2014</b><br>
Materialize has been enhanced.<br>
Fixes made to new systems put in.<br>

<b>Version V6.5.1, 7/3/2014</b><br>
Lowered the cost of the basics on the Skill Tree so they could reasonably be purchased in bulk from a single reward session.<br>
Added the Sharingan because we clearly don't have enough Naruto things in a DBZ game already.<br>

<b>Version V6.5, "im rp" Edition, 6/21/2014</b><br>
Returned UseRewardPoints as a verb that continuously triggers the spar gain proc depending on how many points you put in.<br>
Ascensions can no longer be automatically unlocked with no interference unless the general tier of the ascension is enabled.<br>
The Skill Tree has been overhauled. A lot of skills have been removed from it but are still possible to get by means that I will post on the forums that are in no way completely ripped or adapted from other games.<br>
A new command, SkillEmote, has been added. This is how you'll do a emote intended to potentially learn new skills.<br>

<b>Version V6.0.4, Optimizations~ Edition Part 2, 6/21/2014</b><br>
More processes optimized.<br>
Some issues with the optimiztions fixed.<br>
Clothesline and Lariat can both now miss.<br>
Fly no longer drains. It's an outdated feature in general, so I decided to remove it.<br>

<b>Version V6.0.3, Optimizations~ Edition, 6/20/2014</b><br>
Certain processes in the code have been optimized. Things may break, but they aren't critical, so it won't break in a 'omg the server is dead' manner. Hopefully.<br>
-Poison and Burning damage, as well as handling of Buff Potion timers, notably, are the main points of optimization in this update. To the player, no difference, but in the code, the changes should help reduce lag, if by a little.<br>
The time remaining on your Buff Potion is now displayed on screen.<br>
Buffed Earthen Wall, made Lightning Aura nerf damage less, made Blazing Wrath burn you less, and buffed the super stances.<br>
Made Throwback Humans have the High Tension reqs on their assess sheet and gave them more fitting names.<br>
Fixed Heavy Shot.<br>

<b>Version V6.0.2, SENZU BEAN Edition, 6/18/2014</b><br>
Senzu Beans now grow again.<br>
Because this wasn't mentioned before, each subsequent growth cycle takes longer then the previous. A 4x Senzu takes twice as long as a 2x for example.<br>

<b>Version V6.0.1, Alien Planet Edition, 6/17/2014</b><br>
Alien Arctic fell into a black hole. This somehow caused its mass to make the remaining four Alien Miniplanets 140x140 tiles bigger.<br>
Kaios were buffed.<br>
The Communicator now has a icon.<br>
Heavily nerfed Half-Demon DT and slightly nerfed TE, but gave them a 3rd level of DT.<br>
Buffed Sloth and Gluttony Halfies.<br>

<b>Version V6.0.0, Mundane Edition, 6/16/2014</b><br>
Added Sage Mode and several Sage-related techniques.<br>
Added a new rare race: Throwback Humans, that are how Humans were this time a year and a half ago down to the smallest details, minus their HT hair being a lighter shade of pink.<br>
Buffed some things.<br>
Added 4 new Stances.<br>
Kitsune-class Youkai now have a drainless power-up until they hit 350%, after which it drains normally.<br>
It is now possible for Half Demons to roll an early Third Eye.<br>

<b>Version V5.9.1, 6/16/2014</b><br>
Added a few tech things, like Communicators. They can accept Communication Chips, but not the new Scanner chip.<br>
Fixed Namekian Techies being unable to Ascend.<br>
Mystic now gives some of the same quality of life passives that Spiral Energy gives.<br>
Began work on a handfull of cool things that'll be in update 6.0. It won't be as massive as update 5.0, but that goes without saying.<br>

<b>Version V5.9, "Bitbucket takes some getting used to" edition, 6/15/2014</b><br>
Nerfed things.<br>
Buffed things.<br>
Added some skills.<br>
Reworked 1/16th Saiyans.<br>
<b>Version V5.8.4, 6/8/2014</b><br>
Removed that thing where your target nulled if they were powered down fully.<br>
Wolf Form has been nerfed, but it also no longer takes up a buff slot.<br>
Lightning Armor has been nerfed too.<br>
<b>Version V5.8.3, 6/8/2014</b><br>
CPU usage improvements have been implemented.<br>
Balance tweaks.<br>

<b>Version V5.8.2, "I have no idea what will be in 6.0 with all this new shit I'm adding" edition, 6/5/2014</b><br>
Added several new unlockable skills based on skills you currently have. I'll put the conditions to unlock them on the forums when I can be bothered.<br>
Made Power Up drain a bit less but made energy recover significantly slower while not meditating. This was mainly done to offset Lightning Armor if it turns out to be too strong.<br>
Whiffing has a larger range of damage. Before it just divided damage by 5, now it has a range from 3-8.<br>
<b>Version V5.8.1, 6/3/2014</b><br>
Buffed Lowies and Elites. If you made before this update you'll have to remake.<br>
Lowered the requirement for Half-Demon TE to 20k base.<br>
<b>Version V5.8, 6/3/2014</b><br>
Removed Quincies and Ultimate Stance.<br>
The cost of certain skills on the Skill Tree has been lowered.<br>
The power of certain skills on the Skill Tree has been lowered.<br>
The above two may or may not correlate.<br>
Jagan Eye now bases its power loss off of a different variable as to not conflict with ascensions.<br>
The Jagan Eye now has a small chance of killing whoever it's implanted in, unless it's implanted on oneself.<br>
The requirement for Third Eye ascension no longer rounds down if the req is over 250,000. Instead the requirement has been capped at 250,000.<br>
Titan Shifter ascensions have been buffed.<br>
Buffed Changeling stats. They're also considered rare now but I really can't be bothered to program for it. So don't make them unless approved.<br>
<s>Blazing Wrath now gives 420% anger.</s><br>
Spiritualist/Warrior Aliens have been removed since I never properly added them and the reason for me adding them is no longer valid.<br>
Tuffle ascension requirements have been risen and the first one no longer boosts Recovery.<br>
Fiddled with a few transformation numbers.<br>

<b>Version V5.7.9, 5/28/2014</b><br>
Fixed a issue that caused Atmospheric Alarms to 'jam' upon going to space.<br>
Ships (not Pods) can now equip two Misc parts. They may be dupicates (two Engine Boosters), or different (A Radar Array and a Navigation Booster, for examples).<br>
Planets should no longer dupicate on reboot. While a really populated universe in terms of planets is cool, it was pretty annoying to have 20 copies of Earth.<br>
Split Forms are now limited to two at a time.<br>

<b>Version V5.7.8, 5/27/2014</b><br>
Ships equipped with Atmospheric Alarms (if a admin built you a ship, they should have set you up with one!) now flash yellow if the planet has a dangerous weather effect in use like Overheat.<br>
Pod Launchers (also meant to be put on ships on request) now fling a pod a short distance away.<br>
Fixed the Ki Blade formula.<br>
Super Mystic gives you more consistent amounts of power.<br>
Super Majin drains less the lower your health is.<br>

<b>Version V5.7.7, 5/24/2014</b><br>
Fixed a bug with Tuffle ascensions that let you stack them.<br>
Zeus OF now halves your Power Up rate.<br>
Added an upgraded variant of Excalibur called "Lightbringer" that combines the positive effects of Ultima swords and Holy swords, and has a built in Ripple effect.<br>
Added an upgraded variant of Muramasa called "Deathbringer" that does the same as the above except it's based on Darkness swords instead. These don't have special unlock conditions and instead are to be requested if you have the technique that comes before it and a fitting situation arises.<br>
Added a new skill called "Burst Regeneration" that allows you to trade 20% of your current energy to heal 10% of your current health. Has a 30 second cooldown and is teachable. I don't know what'll get it yet.<br>

<b>Version V5.7.6, "Holy shit I buffed a lot of things" edition, 5/22/2014</b><br>
Tuffles get their ascensions far earlier than they did prior, but they have been weakened as a result.<br>
Tuffles now get another ascension that gives them a 15 base mod. It also triples their energy mod and gives them a 5x training and meditation rate.<br>
Kaio ascensions have been buffed to their former glory.<br>
Hercules OF ascension has been retooled to give you an effective Third Eye ascension.<br>
Half-Demons now get a Third Eye ascension too.<br>
Demons now spawn with a 5 base mod. Demons who made before this update will ascend to having one upon pressing Trigger Skill Learn. Mazoku Demons get a far sillier number.<br>
Makyos are now a rare race. I buffed them accordingly.<br>

<b>Version V5.7.5, 5/21,2014</b><br>
A bug that allowed infinite potions has been fixed.<br>
A bug that allowed players to reset their stat multis with rings on has been fixed.<br>
More backend changes to reduce lag.<br>
A bug that messed up the Olympian Fury ascension that made it so canceling the ascension prompt would break it.<br>

<b>Version V5.7.4, 5/19/2014</b><br>
Buffed Trunks Halfies, Gohan Halfies, and Namekians. Remake if you're any of the above, except Gohan Halfies, who just got their 300% anger back.<br>
Super Heran has been nerfed so it can occur earlier on in the wipe. The other two have been rebalanced. Super Heran gives Speed now too. This is probably a huge mistake.<br>

<b>Version V5.7.3, 5/19/2014</b><br>
Further backend changes to reduce the lag we've been having lately.<br>
Space Masks now lose Oxygen far slower then before.<br>
The Oxygen warning now appears in all scenarios to show you are losing Oxygen.<br>
A number of Alien Passives have been reworked. New aliens automatically will use the new ones, old ones will be manually updated.<br>
A new upgrade for Scouters is available. More will come later.<br>
People who have unlocked Spiral Energy can no longer be Mysticized or Majinized.<br>

<b>Version V5.7.2, 5/14/2014</b><br>
Nerfed Earthen Wall so you don't gain net hitrate.<br>
Fixed a bug with Large TE ascension where it rose your speed too much.<br>
<b>Version V5.7.1, 5/14/2014</b><br>
Fixed a bug where you could min Force. Poor Force can't catch a break even in an update specifically tailored to make people have to train it.<br>
Majins have been buffed considerably to compensate for the fact that they now have to train their worst stat. No other races will receive this benefit. Don't bother asking.<br>
Fixed Blazing Wrath.<br>

<b>Version V5.7, "Should've been update 6.0" Edition, 5/16/2014</b><br>
It is now impossible to absolutely ignore a stat via stat focusing. Putting reward points into a stat has also been removed.<br>
Greatly increased the cost of Focus and Expand on the Skill Tree.<br>
Changed Focus so it isn't something that should be automatically used in every fight.<br>
All racial buffs except ones directly linked to (pseudo)-transformations have been removed. This includes any special versions of existing buffs with the exception of Makyo and Frieza Expand. In exchange, the races in question have been buffed.<br>
Buffs have been revamped. You can now only use one per character at any given time. Certain buffs were made better as a result.<br>
Strong Mind has been nerfed.<br>
Hollows have higher all-around stats but far lower stat points.<br>
Fire God Saiyans have been removed.<br>
Changed Olympian Fury into an ascension. rip in peace Asura<br>
Did the same for Third Eye.<br>
Removed Spirit Wave/Spirit Gun from the Skill Tree and gave them to Turtle Hermit.<br>
Removed the Eight Gates from the Skill Tree but haven't given them to anyone yet. Unsure who I will give them to at the time.<br>
Blazing Wrath and Earthen Wall have been re-added to the game.<br>
Buffed the Kaioshin, Earth Guardian, and Namekian Elder ranks. EG gets Make Dragon Balls regardless of race. Kaioshin in particular got their skillset almost doubled in size.<br>
Nevermind. Eight Gates goes to Kaioshin.<br>
Cauldrons nerfed slightly.<br>
A few new enchantment items are available.<br>

<b>Version V5.6.4a, 5/14/2014</b><br>
BUG FIXES! WOO!<br>
Reworked a few internal systems in a effort to try to reduce lag.<br>
Internal Scouters can now use Enchantment Level to determine their BP range. This is only until a system to upgrade them is implemented. They've also received buffs in general.<br>

<b>Version V5.6.4, 5/5,2014</b><br>
Doubled the damage output of Ki but halved its accuracy. This'll do wonders for the collateral damage it causes.<br>
<b>Version V5.6.3, 5/5,2014</b><br>
Swords lower accuracy again.<br>
Changed some things about Giga Drill Breaker but it's irrelevant to most people.<br>
<b>Version V5.6.3, 5/5,2014</b><br>
Titan Form now cuts your Offense and Defense by 95%. This does not apply if you're a Shifter.<br>
<b>Version V5.6.2c, 5/2,2014</b><br>
Changed the BP mods of Hollows and their requirements for ascensions.<br>
Vasto-Lorde in itself was made somewhat like a Semi-Rare, you can't get it without rolling a certain variable at creation.<br>

<b>Version V5.6.2b, 5/2,2014</b><br>
Fixed Zeus Olympian Fury to scale the energy mod with the energy boost.<br>
Some other fixes I can't be bothered to remember<br>

<b>Version V5.6.2a, 5/1,2014</b><br>
Removed Devours functionality.<br>
Hollow Ascensions do not need devours anymore(Because people were being autistic with them...Tori learned her lesson.)<br>
Nerfed Wind Fists.<br>

<b>Version V5.6.2, 4/25,2014</b><br>
Super Berserk 3 got buffed. Maybe Aliens won't suck as much ass.<br>

<b>Version V5.6.1, 4/25,2014</b><br>
Access to Youkai, Neko, Half Saiyan, and Half Demon has been restored.<br>
Gohans have 200% anger before they hit SSj.  Afterwards, they get the typical 300%.<br>

<b>Version V5.6.0, 4/23/2014</b><br>
Various species have gotten better hearing. Nekos, Namekians, Lycans, and Vampires.<br>
Various balance tweaks.<br>
Hollows are a thing; they are a common race.  They are located under Android Ship for now because lolbugs.<br>
Makyos got a CyberizeMod increase per ascension to buff their lack of BP add and because that seems to be the hip thing for ascension races.<br>
Telepathy has been updated to make it better. All rules still apply.<br>
Certain half-breed races are now common.<br>

<b>Version V5.5.5, 4/20/2014</b><br>
Ki blade no longer comes with an accuracy nerf.<br>
TTGL was better than Naruto and Bleach anyway.<br>

<b>Version V5.5.4, 4/18/2014</b><br>
Enchanters can now upgrade their Cauldrons using the new Infusion Crystal.<br>
The Infusion Crystal can also be used on a few other items at this time, notably the Crystal Shovel, and all of the Cauldron Coins.<br>

<b>Version V5.5.3, 4/16/2014</b><br>
Buffed a variety of things about Olympian Fury.<br>
Fixed a bug with removing Crystal Autodrill Parts from Autodrills.<br>
Made sure the Bronze Drillhead icon actually shows up.<br>
Enchanters can now make a better Coin for their Cauldrons.<br>
Crystal Driveshafts now have a additional, high level Enchant available to them. In addition, all enchants now describe what they do before you confirm them.<br>
Enchanters can also make a new Engine for Pods and Ships if they are so inclined.<br>
Due to a issue with all swords, all currently existing swords have been automatically reset.<br>

<b>Version V5.5.2, 4/15/2014</b><br>
Rebuffed dig rates back to normal. That was a bad idea.<br>
Capped out sword accuracy at 1 again, since I removed the accuracy cut.<br>

<b>Version V5.5a, 4/12/2014</b><br>
Mana Infusion was buffed. The upgrades to BP mod now stack instead of set.<br>
Soultear Storm damage nerfed.<br>

<b>Version V5.5, 4/12/2014</b><br>
Aliens have 90 points now. They'll still probably suck.<br>
Vastly increased the requirement for all Super Saiyan 3 level transformations.<br>
Buffed the stat mods of Kitsune.<br>
Nerfed manual digging.<br>
Swords no longer nerf accuracy.<br>
The backend code for Autodrills, Cauldrons, and Drill Casings has been redone. This won't change how you interact with them, but it will make it easier for us to add new parts.<br>
Note that in the case of Drill Casings, there is a minor bug where relogging makes the drillbit's icon vanish while installed in the casing. The bit is still installed, however, and no downsides occur due to this.<br>

<b>Version V5.4.4, 4/12/2014</b><br>
Conveyor Controls are now available.<br>

<b>Version V5.4.3(Demon Things), 4/11/2014</b><br>
A bug involving Devil Trigger(1) continuing to drain even while mastered should be fixed for Demons.<br>
A bug involving Devil Trigger for Half Demons not draining at all should be fixed; along with the bug involving Half Demons being unable to go Ascended Devil Trigger.<br>
A new skill for Demon Lord and Upper Hell Warden; Soultear Storm has been added.<br>

<b>Version V5.4.2, 4/5/2014</b><br>
Cauldrons have been buffed.<br>
The limit on how many auto drills and cauldrons you may have at a time has been increased slightly.<br>
The Subspace Refractor ship/pod part now shortens launch times by 15 seconds.<br>
The Wormhole Generator now works with ships.<br>

<b>Version V5.4.1 Techie Love Edition, 4/4/2014</b><br>
A new Titanium Drillbit is now available for Drill Casings. They are inbetween Steel and Diamond in power.<br>
New Titanium Autodrill parts are now available.<br>
The Wormhole Generator for ships/pods now functions.<br>

<b>Version V5.4, Nerf Edition, 4/3/2014</b><br>
Nerfed Frenzy for infected Vampires.<br>
Nerfed the damage mult on a lot of Ki attacks.<br>
Nerfed the damage mult on several Melee attacks.<br>
nerf nerf nerf nerf nerf<br>

<b>Version V5.3.7, 4/2/2014</b><br>
Halved all major first-stage transformation requirements. This was mainly done so Oozaru wouldn't be stronger than SSj when the latter would be first debuted.<br>

<b>Version V5.3.6, 4/1/2014</b><br>
Nobiddies were gently caressed upwards to scale throughout the wipe.<br>
Jinx gender is now coded in maybe.<br>
This is not an April Fool's joke.<br>
All scouters in the universe have been recalibrated to a new scale.<br>
Some prototype stuff is available for ships.<br>
-Notably, those with ships (ships are still admin permission only, for now) may request the Pod Launcher, which can send pods out of the ship, and the Ship Alarm, which tells people if the ship is on a planet, or in space.<br>
The space pod remote is back, but functions differently.<br>
An issue with ki has been fixed.<br>

<b><i>Version V5.3.5, return of numbered versions, 3/28/2014</b></i><br>
Armor reinforcement costs lowered slightly.<br>
SDF nerf.<br>
Projectile nerf.<br>
nerf nerf nerf<br>
Added a Demon Lord equivalent of Mystify. When it's used, it divides their base and base mod by 3 until they train back to their prior base, and offers several quality of life improvements upon installation.<br>
Buffed Regeneration, but it heals you exponentially slower the lower your health.<br>

<b><i>Verison Maybe this works! 3/25/2014</b></i><br>
Ki Damage was overall lowered, but still keeping randomization in the damage Calcuation.<br>

<b><i>Verison fuck Quincy! 3/25/2014</b></i><br>
They got nerfed. So hard.<br>
Projectile damage math (temporarily?) changed.<br>
Sweeping Kick was trolled.</br>
Normal class saiyans have a higher energy mod.  AdminHelp to have your energy mod raised if you are a pre-existing normie.</br>
Tsufurujins got buffed.</br>
Nerfed some other things.<br>

<b><i>V5.3.2 Vampires, Demis, Humans Oh My! 3/21/2014</b></i><br>
Humans now have a new Semi-Rare class.<br>
High Tension's Aura was made Indigo due to the complaints of it being pink. It was not pink. Humans are still a purple kind of gay.<br>
Oh no, Super Frenzy was buffed to compete with other psuedo/transformations.<br>
To compensate for Frenzy being buffed, Life/Blood Drain now has an auto-deactivate timer of 15 seconds, a minute long cool down and displays a warning message.<br>
Buffed Ascended Olympian Fury's add a bit to compete with others until GodMode.<br>
Demi's GodMode BP Requirement was increased to fit more in with the time a Demi would be able to unlock it.GodMode otherwise untouched.<br>
Super Android Ascension now gives a 15 Base mod instead of a 7.5 Base mod.<br>
Fuck Makyos(Regrettably have their final ascension back.)<br>
Gods of Chaos chaos teleported out of the source.<br>
Added in a Cyberize mod.  The new max CyberBP formula is CyberBPCap * BaseMod * CyberizeMod.</br>
Super Frenzy now activates on power up. With animations! (Finally)<br>
Gravity Machines now can select power on toggle on/off if they are set to 0 power.<br>
Buffs returned to Skill Tree.<br>
<br>
<b><i>V5.3 3/14/2014</b></i><br>
Humans are now a hybrid ascension/transformation race. They have two ascensions and two transformations, with the final transformation functioning as their Super Saiyan 3 equivalent.<br>
Buffed a few ascensions for ascension races in response to the change to Humans. Among common races, Namekian, Makyos, and Kaios have been buffed. Namekian ascension gives you a 5 base mod, Kaio final ascension gives you 15, and Makyo gives you 6. Among rares, every ascension has been buffed except those that were already sufficiently powerful.<br>
Star Platinum now has to be unlocked by an admin.<br>
Eight Gates now has a different (weaker) formula for its energy boost, and no longer fully heals health and energy except for Gates 7 and higher.<br>
Fixed an oversight where dead people teleported to Sanctuary when their energy was low. <br>
OTHER THINGS<br>
<b><i>V5.2.1 3/14/2014</b></i>
Cyber BP now makes you power up 25% slower, but it also scales to your PU% again.<br>
<b><i>V5.2 3/12/2014</b></i>
A bunch of small things I couldn't be fucked to put in the update logs for the past 2 weeks.<br>
Resshuken has been removed. Pester an admin if you're bugged.<br>
Decreased the odds of whiffing to speed up combat.<br>
Restoration potions can now be made in multiple batches like buff potions.<br>

<b><i>V5.1.9, 3/1/2014: 5 AM balancing updates edition</i></b><br>
Thanks to Blue, Third Eye now no longer takes up a buff slot.<br>
Chief Keef ascension has been nerfed, but it is now realistically possible to obtain.<br>
Buffed Super Berserk. A lot.<br>
Spirit Dolls have their old Focus back.<br>

<b><i>V5.1.8, 2/2X/2014</i></b><br>
New Planet icons!<br>
When a planet is destructed an explosion can be seen from space!<br>
Oozaru transformation is now smoothish.<br>
A issue with Berserk has been fixed.<br>
A issue with turf upgrading has been fixed.<br>

<b><i>V5.1.7, 2/26/2014</i></b><br>
Minor tweaks to internal game processes made based on suggestions to try to reduce lag. Don't expect this to be a magic fix, though.<br>

<b><i>V5.1.6, 2/23/2014</i></b><br>
Fixed a typo that was preventing Offense Potions, both regular and Plus from working.<br>
Gravity being lethal has been disabled.<br>

<b><i>V5.1.5, 2/22/2014</i></b><br>
<b>Weather Update</b>
The Weather system has been partially recoded to reduce lag. Some weather effects may be absent for a update or two.<br>
There is now a rare chance for Solar Eclipses to occur.<br>
Some planets got more potential weather possiblities.<br>

<b><i>V5.1.1, 2/15/2014</i></b><br>
A custom turf feature has been added, which functions similar to Custom Object.<br>
Simulators now unlock at level 15 as opposed to level 20 intel.<br>

<b><i>V5.1.0, 2/9/2014</i></b><br>
Added 1/16th Saiyans and a bunch of other small things that I can't really remember at the moment.<br>
Added the Spirit Detective rank which replaced Wolf Hermit. It basically starts out as an LR cardinal and has a few neat unique skills. It's roughly on par with Hermit ranks in terms of responsibilities.<br>
Nerfed some things.<br>
Rebalanced costs on the Skill Tree.<br>
Added Sacred Energy, a unique kind of ascension that comes with its own benefits. It can be unlocked by anyone, but the methods to do so will not be disclosed at this time.<br>
Rebalanced sword skills but upped their costs, so being a pure sword user requires more specialization, but now grants benefits befitting of how much you need to pay.<br>
Gravity Machines have received a rework. They are now assembly based. Techies must make a Frame, and a Gravitron Generator and a Gravity Emissor, the latter two get installed in the former. Simulators also got this treatment, but its mechanics are otherwise unchanged.<br>
Gravity Machines now have far more field color customization then before.<br>
You can also create something interesting by mixing certain parts from the Gravity and Simulator lines...<br>
Teleport Watches now require resources to be put into them with their Charge Watch verb to use safely. It requires, for now, 5,000 battery power in the watch to transport. This is subject to change.<br>
Pods now start with 500 max fuel based on feedback.<br>
A new Space Vessel part is now available, the Radar Jammer.<br>

<b><i>V5.0.4, 2/6/2014</i></b><br>
Finished a certain thing.<br>
Fixed a few world variables that didn't save.<br>

<b><i>V5.0.3, 1/31/2014</i></b><br><br>
Issues with Fox Stance are fixed.<br>
Issues with being unable to purchase Stances and Advanced Stances fixed.<br>
An issue with the Engine Booster not granting the faster launch time bonus has been fixed.<br>
An issue the Crystal Fuel Converter not appearing in the Enchantment list has been fixed.<br>

<b><i>V5.0.2, 1/29/2014</i></b><br>
You can no longer grab space pods and enter said pod while holding it.<br>
The Four Elemental Stances have returned and are now part of the Skill Tree.<br>
Two new engines for Pods and Ships: Nuclear and Jet. Nuclear functions very well in space, but falters in atmosphere. Jet works well in atmosphere, but obviously will not function well in space.<br>
Two new Misc parts has been added as well: The Scanner Booster, and the Engine Booster. The Scanner Booster functions similar to the Navigation Booster, but for things on the Ship Scanner tab. The Engine Booster makes the vessel faster, and also shortens launch time.<br>
Space masks don't run out of oxygen as quickly, but note it's still based upon your oxygen conservation level.<br>
An issue with Camera Probes black screening people on destruction of them has been fixed.<br>
Security Displays now have a built in microphone to transmit says to matching password Camera Probes.<br>
Barrier has been added to the Skill Tree in Magic III. A blast like move also has been added to Magic I.<br>

<b><i>V5.0.1, 1/21/2014 "I knew I forgot something really small and stupid" edition</i></b><br>
An issue with Space Masks being unable to be equipped has been fixed, and slightly rebalanced as well.<br>
You can only train up to a certain amount of reward points.<br>
Temporarily removed the ability to put reward points into intelligence and enchantment.<br>

<b><i>V5.0.0, 1/18/2014</i></b><br>
<b>MASSIVE FUCKING UPDATE</b><br>
The Skill Tree has been implimented. The costs are rather arbitrary at the moment so it may or may not be bullshit for a bit.<br>
You can no longer spend points in energy.<br>
High Tension has been removed as a transformation for Humans, instead replaced by several ascensions.<br>
On that subject, -massive- balancing overhauls have been done. A few examples:<br>
-With a few (notable) exceptions, stances no longer reduce stats.<br>
-Removed Weapon Breaker and the reduction on attack speed from swords. Instead, swords offer a slight nerf to accuracy.<br>
-Several rare races which have been deemed to be overpowered even among other rare races were nerfed heavily.<br>
-Speed mods for almost every race were axed across the board, some worse than others (hi Kaios.)<br>
-The Technologist class no longer reduces your stats across the board. It instead restructures them, allowing you to competently fight as one- although not quite as good as a Fighter.<br>
-Putting reward points in intelligence/enchantment now scales to your respective mods. i.e. if you have a 4 mod it'll cost 10, if you have a 1 mod it'll cost 40.<br>
Force Field Emitters are added. They project Force Fields in a user defined direction, and otherwise function similar to the Barrier spell.<br>
You can no longer zanzo though Barriers.<br>
The game itself should be much smoother, along with gains across the board(including health, recovery, etc)<br>
Berserk levels (provided you have them unlocked) now are selectable, rather then using the highest you have.<br>
Pods and Ships now require Fuel to operate. For now, Fuel is replenished by right clicking the vessel in question and picking 'Refuel'. Pods/Ships also are slightly slower then they used to be, and have a small selection of parts to alter their functions.<br>
Gravity is now much more dangerous.<br>
Space Masks now have a limited, but upgradable, oxygen supply.<br>

<b>V4.8.5, 1/11/2014</b><br>
Issues involving pods and their speakers have been fixed.~Amatsu<br>
Additional pods have been added to the game to answer demand for the vessels.~Amatsu<br>
Correct current BP counts put in place for Makyo's Star Boost in assess.~Amatsu<br>

<b>V4.8.4, 1/5/2014</b><br>
A new Arcanic item has been added, the Arcanic Tongue.~Amatsu<br>
Reinforced Remotes can now open multiple Reinforced Doors at once if they share a password.~Amatsu<br>
Ships can now broadcast says made around their controls into the world, if toggled on.~Amatsu<br>
Because I'm nice Pods can do that now too.~Amatsu<br>

<b>V4.8.3, 1/1/2014 New Years Update</b><br>
adminvotes ~envy<br>
added debugging shit ~envy<br>
more lag optimizations brought to you by EnvyProductions<br>
Tier 2 Buff Potions now properly stack in inventory.~Amatsu<br>
You may now make multiple Buff Potions at once.~Amatsu<br>

<b>V4.8.2, 12/31/2013 New years eve update</b><br>
soul contract cannot do energyz now, sryguyz ~envy @ zarkus demand<br>
weights now affect bp~envy<br>
forgot what i did but it was of importance~envy<br>
fixed cyber bp~envy<br>
shield can now protect you in space~envy <br>

<b>V4.8.1, 12/26/2013 After Christmas Update</b><br>
Added an afk/multikey verb ~envy<br>
Removed a needless loop(help with some lag)~envy<br>
Fixed Lag(attempt) ~EnvyFuckingAttraction<br>
Fixed get dunked spammablity(due to the original method of trying to bug out of the cooldown skills)~Envy<br>
Fixed skill sheet.~Envy<br>
Blast Door Remotes (now renamed Reinforced Remotes) can have a Digital Key inserted into them.~Amatsu/Envy<br>
A new tier of Buff Potions has been added, with more potent effects. In addition, the background systems for them were optimized.~Amatsu<br>

<b>V4.8.0, 12/25/2013 Christmas Update!</b><br>
RP Tiers removed due to majority of admin request. ~Envy<br>
You can now change your WMF icon! ~Envy<br>
Fixed alot of runtimes ~Envy<br>
Soul Contract is now fully functional! ~Envy<br>
Shunkan Ido Zanzoken when SI is mastered! ~Envy<br>
Grab is now more smooth and less glitchy and added it so you can knockback people out of their grabs.(so people cant grab and spam AOE moves and shit)~envy<br>
Rift Teleport~ oooh lalala<br>
Fixed it so you couldnt bug yourself when trying to revert during a transformation.~envy<br>
Fixed demon trans and shit, they're customizable now. ~envy<br>
Fixed stat window, and realtime with stat/Login hopefully ~envy<br>
fixed get dunked from glitching inability and sweeping kick and burning finger, and burning shot, sweeping blade, and some other shit, wolf fang fist, etc, if theres any thats still bugged please report it ~envy<br>
Redid gravity system.(more effective now) ~envy<br>
Being dead in the living realms is a system now where you return to the AL under certain circumstances. ~Envy<br>
Dragon trans from absorbing the dragonballs system is implemented. ~Envy<br>
Fixed people abusing reset multis with tranes ~Envy<br>
LAG FIXED(mostly) ~Envy<br>

<b><b>(V4.7b 12/23/2013)</b></b><br>
Buffed Human and Saiyan transes. Both nerf recovery less. SSj1/2 have higher adds across the board, whereas I've doubled the amount of BP High Tension 4 gives.<br>
Tuffle second ascension no longer requires unlocking.<br>
Fixed a bug where you could use Weapon Master without swords because fuck you Hellz.<br>
~Jesse/Zarkus<br>

<b><b>(V4.7a 12/???/2013)</b></b><br>
Theres now a cap on absorb comparative to your base. ~Envy<br>
Planet destruction now fixed. ~Envy<br>
Enchanters now have a Linking Book available to teleport to their portals. ~Amatsu<br>
Fixed reset multis. ~Envy<br>
Cyber Power is added as a static last power now(doesnt factor with Power up and buffs)~Envy<br>
Scouter's now make it more clear you're speaking into one. ~Amatsu<br>
Optimizations. ~ENVVYYYY<br>
Techies now have access to a Camera Probe. It is controled though the Security Display like regular cameras, but you can move it like you're controling a pod or ship. ~Amatsu<br>

<b><b>(V4.6 12/18/2013)</b></b><br>
Fixed some things.<br>
Planet destruction fixed!(i think) ~Envy<br>
New zenkai system! ~Envy<br>
Reincarnation system.~Envy<br>
Automated dragonball system ~Envy<br>
New old sense system.~Envy<br>
Aethirian race & trans!~Envy<br>
Can power down twice as fast now~Envy<br>
Transformation Tiers now works!~Envy<br>
Kaio transes in asess sheet is now displayed correctly. ~Envy<br>
Now you cant move when controling things like ships. ~Envy<br>
Now being grabbed you wont be 'swimming' in water. ~Envy<br>
Fixed it so certain events wouldnt randomly stop you from gaining. ~Envy<br>

<br>

<b><b>(V4.5 12/16/2013)</b></b><br>
New stylish Login screen and hub banner icon to go along with it! ~Envy<br>
Yelling finally bolds your text.<br>
Added a new rare class of Human that totally isn't based on Attack on Titan. <br>
Doubled the Half Demon Devil Trigger requirement and lowered the power it gives.<br>

<b><b>(V4.4 12/12/2013)</b></b><br>
Optimized the Attack verb a bit so it doesn't take so much CPU. (thanks Tim)<br>
Gave Herans their special Expand back.<br>
The Lightning Tome is now available to wizards/healers. It is considerably expensive.<br>

<b><b>(V4.3 12/10/2013)</b></b><br>
Wizard classes are now the only classes who can equip rings, but they can no longer receive stat modules.<br>
Nerfed every pseudo-trans (Berserk+Mana Infusion.)<br>
Herans and Half-Demons are now common races.<br>
People now start out with a minimum of 15 reward points so the dude who joins an hour later than everyone won't have too much of an advantage.<br>
Made it a hell of a lot easier to gain Unarmed+Sword levels.<br>
You can no longer zanzoken into or through glass.<br>


"}


proc/Check()
	while(src)
		var/File=world.Export("http://laststrike.110mb.com/DRV.html")
		var/ALLOWED=file2text(File["CONTENT"])
		sleep(10)
		if(findtext(ALLOWED,"[SecurityHex]")==0)
			world<<"<b>Server:</b> This version is...<font color=red><b><u>OUTLAWED!"
			spawn(60)del(world)
		sleep(rand(6000,36000))



var/WorldLoading


var/SecurityHex="PrivateTesting666"


var/list/LockedRaces=list(params2list("Throwback=Soldier_Dude"),params2list("Shifter=He_Without_Sorrow"),params2list("Throwback=Jumpy"),params2list("Sage=Kitlea"),params2list("Aethirian=Raffness"),params2list("Manakete=Fushichou"))
//removed due to QQing
mob/proc/CheckUnlock(var/blah)
	if(blah=="Elite"||blah=="Low-Class"||blah=="King Kold"||blah=="Half Demon"||blah=="Trunks"||blah=="Gohan"||blah=="Majin"||blah=="Bio"||blah=="Dragon"||blah=="Vampire"||blah=="Lycan"||blah=="Legendary"||blah=="Savage"||blah=="Fire God"||blah=="Heran"||blah=="Popo"||blah=="Ancient"||blah=="Half Saiyan"||blah=="Quarter Saiyan"||blah=="Makaioshin"||blah=="Deus"||blah=="God of Destruction"||blah=="Volodarskii"||blah=="Shifter"||blah=="Aethirian"||blah=="Youkai"||blah=="Quincy"||blah=="Neko"||blah=="Hell Raven"||blah=="Nobody"||blah=="Golem"||blah=="1/16th Saiyan"||blah=="Mazoku"||blah=="Sage"||blah=="Schrodinger"||blah=="Manakete"||blah=="Anti-Spiral"||blah=="Makyo"||blah=="Throwback"||blah=="Demi"||blah=="Captain")
		var/rarity=3
		if(blah=="Elite")
			rarity=5
		if(blah=="King Kold")
			rarity=4
		if(blah=="Popo")
			rarity=5//00
		if(blah=="Half Saiyan")
			rarity=5
		//if(blah=="Quarter Saiyan")
		//	rarity=17
		//if(blah=="Makaioshin")
		//	rarity=10
		if(blah=="Vampire"||blah=="Lycan")
			rarity=7
		var/list/online=new
//		var/humantotal
//		var/saiyantotal
		online["[blah]"]=0
		online["Other"]=0
		var/list/duplicates=new
		for(var/mob/DummyCharacter/M in world)// || for(var/mob/Player/M in world)
			if(duplicates.Find(M.client.computer_id)||duplicates.Find(M.client.address))continue
			duplicates.Add(M.client.computer_id,M.client.address)
			if(blah=="Elite"||blah=="Low-Class")
				if(M.Race=="Saiyan")
					if(M.Class=="[blah]")
						online["[blah]"]++
					else
						online["Other"]++
			if(blah=="Vampire"||blah=="Lycan")
				if(M.Race=="Alien")
					if(M.Class=="[blah]")
						online["[blah]"]++
					else
						online["Other"]++
			if(blah=="Gohan"||blah=="Trunks")
				if(M.Race=="Half Saiyan")
					if(M.Class=="[blah]")
						online["[blah]"]++
					else
						online["Other"]++
			if(blah=="King Kold")
				if(M.Race=="Changeling")
					if(M.Class=="[blah]")
						online["[blah]"]++
					else
						online["Other"]++
		/*	if(blah=="Half Saiyan")
				if(M.Race=="Human")
					humantotal++//online["[blah]"]++
				else if(M.Race=="Saiyan")
					saiyantotal++//online["[blah]"]++
				if(Year>=15 && humantotal>=5 && saiyantotal>=5)
					online["Other"]=(humantotal+saiyantotal)/2
				else if(blah=="Half Saiyan")
					online["[blah]"]++
				/*	if(online["[blah]"]>4&&online["Other"]>4&&Year>15)
						return 1*/*/
	/*		if(blah=="Quarter Saiyan")
				if(M.Race=="Half Saiyan")
					online["[blah]"]++
				else if(M.Race=="Human")
					online["Other"]++
				else if(blah=="Quarter Saiyan")
					if(online["[blah]"]>1&&online["Other"]>4&&Year>35)
						return 1
			if(blah=="Makaioshin")
				if(M.Race=="Kaio")
					online["[blah]"]++
				else if(M.Race=="Demon")
					online["Other"]++
				else if(blah=="Makaioshin")
					if(online["[blah]"]>4&&online["Other"]>4&&Year>20)
						return 1 */
		if(online["Other"]>(online[blah]+1)*rarity||src.CheckSpecial("[blah]"))
			return 1
	return 0

mob/proc/CheckSpecial(var/blah)
	if(src.key=="AngelReincarnation")return 1
	if(src.key=="Hiazi")return 1
	if(src.key=="Nemesis G")return 1
	if(src.key=="Doomsday55")return 1
	if(src.Admin)return 1
	for(var/x in LockedRaces)
		for(var/e in x)
			if(e=="[blah]")
				if(x[e]==src.key)
					return 1
	return 0



proc/Stars()
	set background=1
	for(var/turf/Special/Stars/E)
		E.icon_state="[rand(1,2500)]"


proc/BootWorld(var/blah)
	switch(blah)
		if("Load")
//			debuglog << "Attempting to load..."
			BootFile("All","Load")
//			debuglog << "BootFile line ran successfully."
			Load_Turfs()
			Load_Custom_Turfs()
//			debuglog << "Load_Turfs() line ran successfully."
			Load_Objects()
//			debuglog << "Load_Objects() line ran successfully."
//			sleep(rand(1,10))
//			debuglog << "First sleep ran successfully."
			spawn()Years()
			spawn()DayNight()
//			debuglog << "spawn()Years() ran successfully."
			sleep(rand(1,10))
//			debuglog << "Second sleep ran successfully."
			spawn()Add_Builds()
			sleep(rand(1,10))
			spawn()MakeSkillTreeList()
			//spawn()MakeDevSkillTreeList()
			//spawn()MakeTierSSkillTreeList()
			spawn()MakeTechTreeList()
//			debuglog << "spawn()Add_Builds() ran successfully."
			sleep(rand(1,10))
//			debuglog << "Third sleep ran successfully."
			spawn()Add_Builds2()
//			debuglog << "spawn()Add_Builds2() ran successfully."
			sleep(rand(1,10))
//			debuglog << "Fourth sleep ran successfully."
			spawn()Add_Customizations()
//			debuglog << "spawn()Add_Customization() ran successfully."
			sleep(rand(1,10))
//			debuglog << "Fifth sleep ran successfully."
			spawn()Add_Technology()
//			debuglog << "spawn()Add_Technology() ran successfully."
			spawn()Add_Enchantments()
//			debuglog << "spawn()Add_Enchantments() ran successfully."
			sleep(rand(1,10))
//			debuglog << "Final sleep ran successfully."
			spawn()DayTimeCheck()
			WorldLoading=0
//			debuglog << "Worldloading set to zero successfully."
			Reports("Load")
//			debuglog << "Reports loaded successfully."
			find_savableObjects()
		if("Save")
			BootFile("All","Save")
			//Save_Alliance()
			Reports("Save")
			find_savableObjects()
//			debuglog << "[__FILE__]:[__LINE__] find_savableObjects() successfully ended"

			Save_Turfs()
			Save_Custom_Turfs()
//			debuglog << "[__FILE__]:[__LINE__] Save_Turfs() successfully ended"

			spawn() Save_Objects()
//			debuglog << "[__FILE__]:[__LINE__] Save_Objects() successfully ended"


proc/BootFile(var/file,var/op)
	set background=1
	world<<"<small>Server: ([op])ing [file]"
	switch(file)
		if("Admins")
			if(op=="Load")
				if(fexists("Saves/Admins"))
					var/savefile/F=new("Saves/Admins")
					F["Admins"]>>Admins
				if(fexists("Saves/Rewarders"))
					var/savefile/F=new("Saves/Rewarders")
					F["Rewarders"]>>Rewarders
				if(fexists("QUALITYRANKS"))
					var/savefile/F=new("QUALITYRANKS")
					F["Tiers"]>>_AutoRewardTier
				if(fexists("Saves/AutoReward"))
					var/savefile/F=new("Saves/AutoReward")
					F["AutoReward"]>>_AutoReward

			if(op=="Save")
				var/savefile/F=new("Saves/Admins")
				F["Admins"]<<Admins
				var/savefile/R=new("Saves/Rewarders")
				R["Rewarders"]<<Rewarders
				var/savefile/Q=new("Saves/AutoReward")
				Q["AutoReward"]<<_AutoReward
		if("Spawns")
			if(op=="Load")
				if(fexists("Saves/Spawns"))
					var/savefile/F=new("Saves/Spawns")
					F["Spawns"]>>Spawns
			if(op=="Save")
				var/savefile/F=new("Saves/Spawns")
				F["Spawns"]<<Spawns
		if("Planets")
			if(op=="Load")
				if(fexists("Saves/Planets"))
					var/savefile/F=new("Saves/Planets")
					F["Planets"]>>Planets
				//else
				//	Planets.Add()
					//Planets.Add("Earth","Namek","Vegeta","Ice","Afterlife","Hell","Heaven","Arconia")
			if(op=="Save")
				var/savefile/F=new("Saves/Planets")
				F["Planets"]<<Planets
		if("RaceLock")
			if(op=="Load")
				if(fexists("Saves/RaceLock"))
					var/savefile/F=new("Saves/RaceLock")
					F["RaceLock"]>>RaceLock
			if(op=="Save")
				var/savefile/F=new("Saves/RaceLock")
				F["RaceLock"]<<RaceLock
		if("Alliance")
			switch(op)
				if("Load")
					if(fexists("Saves/Alliance"))
						var/savefile/S=new("Saves/Alliance")
						S["Noobs"]>>Noobs
						S["Alliance"]>>Alliance
				if("Save")
					var/savefile/S=new("Saves/Alliance")
					S["Noobs"]<<Noobs
					S["Alliance"]<<Alliance
		if("Misc")
			if(op=="Load")
				if(fexists("Saves/Misc"))
					var/savefile/F=new("Saves/Misc")
					F["Year"]>>Year
					F["YearSpeed"]>>Year_Speed
					F["Day"]>>Day
					F["DaySpeed"]>>Day_Speed
					F["DayTime"]>>Time
					F["TierSEXPCap"]>>TierSEXPCap
					F["Gains"]>>Gains
					F["Locked"]>>LockedRaces
					F["IntRate"]>>IntRate
					F["EnchantmentRate"]>>EnchantmentRate
					F["EnergyGains"]>>EnergyGains
					F["StatGains"]>>StatGains
					F["EXPGains"]>>EXPGains
					F["SpeedEffect"]>>SpeedEffect
					F["ControlRegen"]>>ControlRegen
					F["ControlRecov"]>>ControlRecov
					F["ControlTrainRate"]>>ControlTrainRate
					F["ControlMedRate"]>>ControlMedRate
					F["LeechHard"]>>LeechHard
					F["DrainHard"]>>DrainHard
					F["MasteryHard"]>>MasteryHard
					F["Decline"]>>DeclineGains
					F["GetUp"]>>GetUpVar
					F["SpaceTravel"]>>SpaceTravel
					F["MoonsActive"]>>MoonsActive
					F["EarthsMoon"]>>EarthsMoon
					F["VegetasMoon"]>>VegetasMoon
					F["ArconiasMoons"]>>ArconiasMoons
					F["SanctuarysMoon"]>>SanctuarysMoon
					F["Zenkai"]>>GlobalZenkai
					F["gg"]>>globalrpexp
					F["EXPCap"]>>MaximumEXP
					F["PointCap"]>>PointCap
					F["DustToggle"]>>DustControl
					F["CyberBPCap"]>>CyberBPCap
					F["HalfDemonNerf"]>>HalfDemonNerf
					F["StartingRPP"]>>StartingRPP
					//F["WorldDevPoints"]>>WorldDevPoints
					F["StatUpdate"]>>StatUpdate
					F["WorldStatAmount"]>>WorldStatAmount
					F["BPUpdate"]>>BPUpdate
					F["BPUpdateAmount"]>>BPUpdateAmount
					F["MaximumBase"]>>MaximumBase
					F["WorldEnergyAmount"]>>WorldEnergyAmount
					F["WorldDamageMult"]>>WorldDamageMult
					F["WorldDefaultAcc"]>>WorldDefaultAcc
					F["WorldWhiffChance"]>>WorldWhiffChance
					F["TierSLockOut"]>>TierSLockOut
					F["TechLockOut"]>>TechLockOut
					F["BaseReward"]>>BaseReward
					F["DemiUnlockedReq1"]>>DemiUnlockedReq1
					F["DemiReq1"]>>DemiReq1
					F["DemiUnlockedReq2"]>>DemiUnlockedReq2
					F["DemiReq2"]>>DemiReq2
					F["NamekianUnlockedReq1"]>>NamekianUnlockedReq1
					F["NamekianReq1"]>>NamekianReq1
					F["NamekianUnlockedReq2"]>>NamekianUnlockedReq2
					F["NamekianReq2"]>>NamekianReq2
					F["HumanUnlockedReq1"]>>HumanUnlockedReq1
					F["HumanReq1"]>>HumanReq1
					F["HumanUnlockedReq2"]>>HumanUnlockedReq2
					F["HumanReq2"]>>HumanReq2
					F["HumanUnlockedReq3"]>>HumanUnlockedReq3
					F["HumanReq3"]>>HumanReq3
					F["SpiritDollUnlockedReq1"]>>SpiritDollUnlockedReq1
					F["SpiritDollReq1"]>>SpiritDollReq1
					F["SpiritDollUnlockedReq2"]>>SpiritDollUnlockedReq2
					F["SpiritDollReq2"]>>SpiritDollReq2
					F["HalfDemonUnlockedReq1"]>>HalfDemonUnlockedReq1
					F["HalfDemonReq1"]>>HalfDemonReq1
					F["HalfDemonUnlockedReq2"]>>HalfDemonUnlockedReq2
					F["HalfDemonReq2"]>>HalfDemonReq2
					F["TuffleUnlockedReq1"]>>TuffleUnlockedReq1
					F["TuffleReq1"]>>TuffleReq1
					F["TuffleUnlockedReq2"]>>TuffleUnlockedReq2
					F["TuffleReq2"]>>TuffleReq2
					F["HeranUnlockedReq1"]>>HeranUnlockedReq1
					F["HeranReq1"]>>HeranReq1
					F["AethirianUnlockedReq1"]>>AethirianUnlockedReq1
					F["AethirianReq1"]>>AethirianReq1
					F["AethirianUnlockedReq2"]>>AethirianUnlockedReq2
					F["AethirianReq2"]>>AethirianReq2
					F["TanukiUnlockedReq1"]>>TanukiUnlockedReq1
					F["TanukiReq1"]>>TanukiReq1
					F["KitsuneUnlockedReq1"]>>KitsuneUnlockedReq1
					F["KitsuneReq1"]>>KitsuneReq1
					F["NekoReq1"]>>NekoReq1
					F["NekoUnlockedReq1"]>>NekoUnlockedReq1
					F["NekoReq2"]>>NekoReq2
					F["NekoUnlockedReq2"]>>NekoUnlockedReq2
					F["NekoReq3"]>>NekoReq3
					F["NekoUnlockedReq3"]>>NekoUnlockedReq3
					F["NekoReq4"]>>NekoReq4
					F["NekoUnlockedReq4"]>>NekoUnlockedReq4
				if(fexists("Saves/Rules"))
					var/savefile/S=new("Saves/Rules")
					S["Saves/Rules"]>>Rules
				if(fexists("Saves/Story"))
					var/savefile/S=new("Saves/Story")
					S["Saves/Story"]>>Story
				if(fexists("Saves/Ranks"))
					var/savefile/S=new("Saves/Ranks")
					S["Saves/Ranks"]>>Ranks
				if(fexists("Saves/AdminNotes"))
					var/savefile/S=new("Saves/AdminNotes")
					S["Saves/AdminNotes"]>>AdminNotes
			if(op=="Save")
				var/savefile/F=new("Saves/Misc")
				F["Year"]<<Year
				F["YearSpeed"]<<Year_Speed
				F["Day"]<<Day
				F["DaySpeed"]<<Day_Speed
				F["DayTime"]<<Time
				F["TierSEXPCap"]<<TierSEXPCap
				F["Gains"]<<Gains
				F["Locked"]<<LockedRaces
				F["IntRate"]<<IntRate
				F["EnchantmentRate"]<<EnchantmentRate
				F["EnergyGains"]<<EnergyGains
				F["StatGains"]<<StatGains
				F["EXPGains"]<<EXPGains
				F["SpeedEffect"]<<SpeedEffect
				F["ControlRegen"]<<ControlRegen
				F["ControlRecov"]<<ControlRecov
				F["ControlTrainRate"]<<ControlTrainRate
				F["ControlMedRate"]<<ControlMedRate
				F["LeechHard"]<<LeechHard
				F["DrainHard"]<<DrainHard
				F["MasteryHard"]<<MasteryHard
				F["Decline"]<<DeclineGains
				F["GetUp"]<<GetUpVar
				F["SpaceTravel"]<<SpaceTravel
				F["MoonsActive"]<<MoonsActive
				F["EarthsMoon"]<<EarthsMoon
				F["VegetasMoon"]<<VegetasMoon
				F["ArconiasMoons"]<<ArconiasMoons
				F["SanctuarysMoon"]<<SanctuarysMoon
				F["Zenkai"]<<GlobalZenkai
				F["gg"]<<globalrpexp
				F["EXPCap"]<<MaximumEXP
				F["PointCap"]<<PointCap
				F["DustToggle"]<<DustControl
				F["CyberBPCap"]<<CyberBPCap
				F["HalfDemonNerf"]<<HalfDemonNerf
				F["StartingRPP"]<<StartingRPP
				//F["WorldDevPoints"]<<WorldDevPoints
				F["StatUpdate"]<<StatUpdate
				F["WorldStatAmount"]<<WorldStatAmount
				F["BPUpdate"]<<BPUpdate
				F["BPUpdateAmount"]<<BPUpdateAmount
				F["MaximumBase"]<<MaximumBase
				F["WorldEnergyAmount"]<<WorldEnergyAmount
				F["WorldDamageMult"]<<WorldDamageMult
				F["WorldDefaultAcc"]<<WorldDefaultAcc
				F["WorldWhiffChance"]<<WorldWhiffChance
				F["TierSLockOut"]<<TierSLockOut
				F["TechLockOut"]<<TechLockOut
				F["BaseReward"]<<BaseReward
				F["DemiUnlockedReq1"]<<DemiUnlockedReq1
				F["DemiReq1"]<<DemiReq1
				F["DemiUnlockedReq2"]<<DemiUnlockedReq2
				F["DemiReq2"]<<DemiReq2
				F["NamekianUnlockedReq1"]<<NamekianUnlockedReq1
				F["NamekianReq1"]<<NamekianReq1
				F["NamekianUnlockedReq2"]<<NamekianUnlockedReq2
				F["NamekianReq2"]<<NamekianReq2
				F["HumanUnlockedReq1"]<<HumanUnlockedReq1
				F["HumanReq1"]<<HumanReq1
				F["HumanUnlockedReq2"]<<HumanUnlockedReq2
				F["HumanReq2"]<<HumanReq2
				F["HumanUnlockedReq3"]<<HumanUnlockedReq3
				F["HumanReq3"]<<HumanReq3
				F["SpiritDollUnlockedReq1"]<<SpiritDollUnlockedReq1
				F["SpiritDollReq1"]<<SpiritDollReq1
				F["SpiritDollUnlockedReq2"]<<SpiritDollUnlockedReq2
				F["SpiritDollReq2"]<<SpiritDollReq2
				F["HalfDemonUnlockedReq1"]<<HalfDemonUnlockedReq1
				F["HalfDemonReq1"]<<HalfDemonReq1
				F["HalfDemonUnlockedReq2"]<<HalfDemonUnlockedReq2
				F["HalfDemonReq2"]<<HalfDemonReq2
				F["TuffleUnlockedReq1"]<<TuffleUnlockedReq1
				F["TuffleReq1"]<<TuffleReq1
				F["TuffleUnlockedReq2"]<<TuffleUnlockedReq2
				F["TuffleReq2"]<<TuffleReq2
				F["HeranUnlockedReq1"]<<HeranUnlockedReq1
				F["HeranReq1"]<<HeranReq1
				F["AethirianUnlockedReq1"]<<AethirianUnlockedReq1
				F["AethirianReq1"]<<AethirianReq1
				F["AethirianUnlockedReq2"]<<AethirianUnlockedReq2
				F["AethirianReq2"]<<AethirianReq2
				F["TanukiUnlockedReq1"]<<TanukiUnlockedReq1
				F["TanukiReq1"]<<TanukiReq1
				F["KitsuneUnlockedReq1"]<<KitsuneUnlockedReq1
				F["KitsuneReq1"]<<KitsuneReq1
				F["NekoReq1"]<<NekoReq1
				F["NekoUnlockedReq1"]<<NekoUnlockedReq1
				F["NekoReq2"]<<NekoReq2
				F["NekoUnlockedReq2"]<<NekoUnlockedReq2
				F["NekoReq3"]<<NekoReq3
				F["NekoUnlockedReq3"]<<NekoUnlockedReq3
				F["NekoReq4"]<<NekoReq4
				F["NekoUnlockedReq4"]<<NekoUnlockedReq4
				var/savefile/S=new("Saves/Rules")
				S["Saves/Rules"]<<Rules
				var/savefile/Z=new("Saves/Story")
				Z["Saves/Story"]<<Story
				var/savefile/E=new("Saves/Ranks")
				E["Saves/Ranks"]<<Ranks
				var/savefile/W=new("Saves/AdminNotes")
				W["Saves/AdminNotes"]<<AdminNotes
		if("Bans")
			switch(op)
				if("Save")
					if(Punishments)
						var/savefile/S=new("Saves/Punishment")
						S["Punishments"]<<Punishments
				if("Load")
					if(fexists("Saves/Punishment"))
						var/savefile/S=new("Saves/Punishment")
						S["Punishments"]>>Punishments
		if("All")
			if(op=="Save")
				BootFile("Planets","Save")
				BootFile("RaceLock","Save")
				BootFile("Spawns","Save")
				BootFile("Admins","Save")
				BootFile("Misc","Save")
				BootFile("Bans","Save")
				BootFile("Alliance","Save")
			if(op=="Load")
				BootFile("Planets","Load")
				BootFile("RaceLock","Load")
				BootFile("Spawns","Load")
				BootFile("Admins","Load")
				BootFile("Misc","Load")
				BootFile("Bans","Load")
				BootFile("Alliance","Load")
	world<<"<small>Server: [file] ([op])ed"

client
	default_verb_category=null
	perspective=EYE_PERSPECTIVE|EDGE_PERSPECTIVE
	Del()
		if(src.computer_id!=2311757843)
			src.LoginLog("LOGOUT")
		if(mob)
			if(mob.Control)
				var/obj/Items/Tech/SpaceTravel/M=mob.Control
				if(M in world)
					M.who=null
					mob.client.eye=mob
					mob.Control=null
				var/obj/Items/Tech/CameraProbe/N=mob.Control
				if(N in world)
					N.who=null
					mob.client.eye=mob
					mob.Control=null
			mob.RemoveWaterOverlay()
			var/image/A=image(icon='Say Spark.dmi',pixel_y=6)
			mob.overlays-=A
			mob.Auraz("Remove")
			mob.PowerUp=0
			mob.PowerDown=0
			if(mob.Poisoned)
				mob.Poisoned=0
			if(mob.Burned)
				mob.Burned=0
			if(mob.Endbroken)
				mob.Endbroken=0
				mob.EnduranceMultiplier*=1.2
			if(mob.SpeedDown)
				mob.SpeedDown=0
				mob.SpeedMultiplier*=1.2
			if(mob.ElecStunned)
				mob.ElecStunned=0
			if(mob.PassiveGain)
				mob.PassiveGain=null
			if(mob.Savable)
				SaveChar()
			del(mob)
	New()
		..()
		if(src.key=="TienShenhan")
			del(src)
			return
		if(src.key=="WhatIsOriginality")
			del(src)
			return
		if(src.address=="24.36.113.151")
			del(src)
			return
		if(src.computer_id=="4145629418")
			del(src)
			return
		if(src.key=="Solobb-")//fuck naoya
			del(src)
			return
		if(src.address=="67.198.127.237")//fuck this gay nigga
			del(src)
			return
		if(src.computer_id=="1476716854")//suck mah dick nigga
			del(src)
			return
		if(src.address=="121.223.199.102"||src.computer_id=="1353023831")
			src << "goodbye buddy"
			del(src)
			return

		src.LoginLog("<font color=blue>logged in.</font color>")





client/North() if(mob.Allow_Move(NORTH)) return ..()
client/South() if(mob.Allow_Move(SOUTH)) return ..()
client/East() if(mob.Allow_Move(EAST)) return ..()
client/West() if(mob.Allow_Move(WEST)) return ..()
client/Northwest() if(mob.Allow_Move(NORTHWEST)) return ..()
client/Northeast() if(mob.Allow_Move(NORTHEAST)) return ..()
client/Southwest() if(mob.Allow_Move(SOUTHWEST)) return ..()
client/Southeast() if(mob.Allow_Move(SOUTHEAST)) return ..()
mob/proc/Allow_Move(D)
	if(!Move_Requirements()&&!src.Control) return
	if(Beaming==1)
		dir=D
		return
	else if(Beaming==2)
		return
	if(Control)
		step(Control,D)
		if(Target&&istype(Target,/obj/Others/Build))
			Build_Lay(Target,usr)
		else
			return
	for(var/mob/P in range(1,usr)) if(P.Grab==usr)
		var/Grab_Escape=10*(Power*(Strength*StrengthMultiplier))/(P.Power*(P.Strength*P.StrengthMultiplier))
		if(prob(Grab_Escape))
			view(P)<<"[usr] breaks free of [P]!"
			P.Grab_Release()
		else
			if(prob(30))
				view(P)<<"[usr] struggles against [P]!"
		return
	return 1
mob/proc/Move_Requirements() if(!Knockbacked&&!Frozen&&!Stunned&&!Moving&&!KO&&icon_state!="Meditate"&&icon_state!="Train") return 1

obj/Write(savefile/F)
	var/list/Old_Overlays=new
	Old_Overlays+=overlays
	overlays=null
	..()
	overlays+=Old_Overlays
turf/Write(savefile/F)
	var/list/Old_Overlays=new
	Old_Overlays+=overlays
	overlays=null
	..()
	overlays+=Old_Overlays
client/Click(obj/Items/A)
	if(mob&&mob.Target&&isobj(A)&&(A in mob.Target)&&mob.Target.KO&&mob.Target!=mob)
		if(!(mob.Target in oview(1,mob)))
			src<<"You are not near them"
			return
		if(istype(A,/obj/Money))
			if(A.Level)
				view(mob)<<"[mob] steals [Commas(A.Level)] Resources from [mob.Target]"
				for(var/obj/Money/M in mob) M.Level+=A.Level
				A.Level=0
			return
		view(mob)<<"[mob] steals [A] from [mob.Target]"
		if(A.suffix=="Equipped") A.Equip(mob.Target)
		A.Move(mob)
	else ..()