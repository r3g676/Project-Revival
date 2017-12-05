//ADD GIVE POWER TO KAIOSHIN AND SHIT
var/list/Rankz=list(\
"Basic"=list(/obj/Skills/Fly,/obj/Skills/Attacks/Blast,/obj/Skills/Attacks/Charge,/obj/Skills/Attacks/Beams/Beam,/obj/Skills/PowerControl,/obj/Skills/Rank/Zanzoken),

"Nine Arts Dragon"=list(/obj/Skills/DonateRPP,/obj/Skills/Attacks/GaleWindDestructionStrike,/obj/Skills/Rank/Walking,/obj/Skills/MartialArts/Set_Stance,/obj/Skills/MartialArts/Activate_Stance,/obj/Skills/MartialArts/Activate_Advanced_Stance,/obj/Skills/MartialArts/Set_Advanced_Stance,/obj/Skills/PowerControl,/obj/Skills/Attacks/Beams/ChaoticHeavensDestructionStrike,/obj/Skills/Rank/ForceStomp,/obj/Skills/TierS/BlackOriginThreshold),

"Guardian"=list(/obj/Skills/DonateRPP,/obj/Skills/Attacks/HomingFinisher,/obj/Skills/Heal,/obj/Skills/PowerControl,/obj/Skills/Materialization,/obj/Skills/Rank/Shield,/obj/Skills/Rank/UnlockPotential,/obj/Skills/Rank/Zanzoken,/obj/Skills/Buffs/Expand,/obj/Skills/Buffs/Focus,/obj/Skills/Telepathy,/obj/Skills/Attacks/Beams/Masenko,/obj/Skills/Attacks/Beams/Piercer,/obj/Skills/Attacks/Sokidan,/obj/Skills/Attacks/Makosen,/obj/Skills/Rank/Dragonballs,/obj/Skills/Rank/MakeSword,/obj/Skills/Rank/UpgradeSword,/*/obj/Skills/Magic/ZephyrVision,/obj/Skills/Magic/OceanMind,/obj/Skills/Magic/SearingHeart,/obj/Skills/Magic/Stoneskin*/),
"Assistant Guardian"=list(/obj/Skills/Heal,/obj/Skills/Rank/GivePower,/obj/Skills/Rank/Zanzoken,/obj/Skills/PowerControl),
"Turtle Hermit"=list(/obj/Skills/Attacks/Beams/Kamehameha,/obj/Skills/Rank/SpiritBurst,/obj/Skills/Attacks/HyperTornado,/obj/Skills/Feva/Beam/BusterBarrage,/obj/Skills/Rank/Zanzoken,/obj/Skills/Buffs/Expand,/obj/Skills/Buffs/Focus,/obj/Skills/Attacks/Beams/TyphoonCannon,/obj/Skills/SuperExplosiveWave),
"Crane Hermit"=list(/obj/Skills/Attacks/Beams/Dodompa,/obj/Skills/Rank/Taiyoken,/obj/Skills/Attacks/Kikoho,/obj/Skills/SelfDestruct,/obj/Skills/Rank/Splitclone,/obj/Skills/Feva/MassSplitform,/obj/Skills/Feva/Splitform,/obj/Skills/Rank/SuperGhostKamikaze,/obj/Skills/Rank/BurningShot),
"Earth Teacher"=list(/obj/Skills/Rank/Shield,/obj/Skills/Heal,/obj/Skills/Attacks/Sokidan,/obj/Skills/Rank/Kiai,/obj/Skills/Attacks/Kienzan),

"Sword Master"=list(/obj/Skills/TierS/WeaponSoul,/obj/Skills/Swords/AirRender,/obj/Skills/Swords/Sweeping_Blade,/obj/Skills/Swords/GreatDivide,/obj/Skills/Swords/TsunamiStrike,/obj/Skills/Swords/ScarringBreeze,/obj/Skills/Rank/MakeSword,/obj/Skills/Rank/UpgradeSword,/obj/Skills/Swords/Megiddo,/obj/Skills/Swords/Tipper,/obj/Skills/Swords/SpinAttack),
"Spirit Detective"=list(/obj/Skills/Attacks/SpiritGun,/obj/Skills/Rank/Kiai,/obj/Skills/Rank/Zanzoken,/obj/Skills/Buffs/Expand,/obj/Skills/Buffs/Focus,/obj/Skills/Buffs/SpiritWave,/obj/Skills/Rank/GivePower,/obj/Skills/Telepathy),

"Namekian Elder"=list(/obj/Skills/DonateRPP,/obj/Skills/PowerControl,/obj/Skills/Heal,/obj/Skills/Buffs/Focus,/obj/Skills/Materialization,/obj/Skills/Rank/Shield,/obj/Skills/Rank/UnlockPotential,/obj/Skills/Rank/GivePower,/obj/Skills/NamekianFusion,/obj/Skills/Rank/Dragonballs,/obj/Skills/Rank/Splitclone,/obj/Skills/Telepathy,/obj/Skills/Attacks/Beams/Masenko,/obj/Skills/Attacks/Beams/Piercer,/obj/Skills/Attacks/Sokidan,/obj/Skills/Attacks/Makosen),
"Namek Teacher"=list(/obj/Skills/Feva/Beam/HellzoneGrenade,/obj/Skills/Buffs/Focus,/obj/Skills/Attacks/Beams/Masenko,/obj/Skills/Attacks/Beams/Piercer,/obj/Skills/Attacks/Makosen,/obj/Skills/Buffs/Expand,/obj/Skills/Rank/Zanzoken,/obj/Skills/Attacks/Beams/Ray,/obj/Skills/Attacks/HomingFinisher,/obj/Skills/Attacks/Beams/ThunderFlash,/obj/Skills/Rank/Splitclone,),

"Vegeta Leader"=list(/obj/Skills/DonateRPP,/obj/Skills/Attacks/Beams/GalicGun,/obj/Skills/Attacks/Beams/FinalFlash,/obj/Skills/Buffs/Expand, /obj/Skills/Buffs/Focus,/obj/Skills/PowerControl,/obj/Skills/FalseMoon,/obj/Skills/ConquerorsHaki),
"Vegeta Teacher"=list(/obj/Skills/SelfDestruct,/obj/Skills/Buffs/Expand,/obj/Skills/SuperExplosiveWave,/obj/Skills/FalseMoon,/obj/Skills/Attacks/BigBang),

"Yardrat Master"=list(/obj/Skills/Rank/ShunkanIdo,/obj/Skills/Rank/Zanzoken,/obj/Skills/Attacks/Sokidan,/obj/Skills/Heal,/obj/Skills/Rank/Shield,/obj/Skills/Rank/Splitclone,/obj/Skills/Heal,/obj/Skills/PowerControl,/obj/Skills/Materialization),
"Arconia SM"=list(/obj/Skills/Rank/Splitclone,/obj/Skills/Attacks/Sokidan,/obj/Skills/PowerControl,/obj/Skills/Buffs/Expand,/obj/Skills/Attacks/Barrage,/obj/Skills/Buffs/Focus),

"Changeling Lord"=list(/obj/Skills/Attacks/Kienzan,/obj/Skills/PowerControl,/obj/Skills/Buffs/Expand,/obj/Skills/Attacks/Beams/Ray,/obj/Skills/Attacks/DeathBall,/obj/Skills/Attacks/Barrage,/obj/Skills/Buffs/Focus),
"Ice SM"=list(/obj/Skills/PowerControl,/obj/Skills/Rank/Shield,/obj/Skills/Buffs/Focus,/obj/Skills/Attacks/Sokidan,/obj/Skills/Buffs/Expand),

"Kaioshin"=list(/obj/Skills/DonateRPP,/obj/Skills/Attacks/Beams/SuperDragonFist,/obj/Skills/Buffs/Mystic,/obj/Skills/Rank/Mysticize,/obj/Skills/Rank/KaioTeleport,/obj/Skills/Attacks/HomingFinisher,/obj/Skills/PowerControl,/obj/Skills/Materialization,/obj/Skills/Rank/KaioRevive,/obj/Skills/Rank/KeepBody,/obj/Skills/Heal,/obj/Skills/Rank/Shield,/obj/Skills/Rank/UnlockPotential,/obj/Skills/Rank/RestoreYouth,/obj/Skills/Rank/Bind,/obj/Skills/Rank/Kiai,/obj/Skills/Attacks/Beams/MegaFlare,/obj/Skills/Telepathy,/obj/Skills/Observe,/obj/Skills/Rank/Splitclone,/obj/Skills/Rank/Kaioken,/obj/Skills/Attacks/SpiritBomb,/obj/Skills/Rank/MakeSword,/obj/Skills/Swords/ImproveSword,/obj/Skills/Swords/MakeUltima,/obj/Skills/Namekian/Telekinesis,/*/obj/Skills/Magic/ZephyrVision,/obj/Skills/Magic/OceanMind,/obj/Skills/Magic/SearingHeart,/obj/Skills/Magic/Stoneskin*/),
"North Kaio"=list(/obj/Skills/DonateRPP,/obj/Skills/Attacks/Sokidan,/obj/Skills/PowerControl,/obj/Skills/Buffs/Focus,/obj/Skills/Materialization,/obj/Skills/Rank/KaioRevive,/obj/Skills/Rank/KeepBody,/obj/Skills/Heal,/obj/Skills/Rank/Shield,/obj/Skills/Rank/Kaioken,/obj/Skills/Rank/GivePower,/obj/Skills/Attacks/SpiritBomb,/obj/Skills/Rank/KaioTeleport,/obj/Skills/Observe,/obj/Skills/Telepathy),
"South Kaio"=list(/obj/Skills/DonateRPP,/obj/Skills/Attacks/Sokidan,/obj/Skills/PowerControl,/obj/Skills/Buffs/Focus,/obj/Skills/Materialization,/obj/Skills/Rank/KaioRevive,/obj/Skills/Rank/KeepBody,/obj/Skills/Heal,/obj/Skills/Rank/Shield,/obj/Skills/Rank/Splitclone,/obj/Skills/Rank/GivePower,/obj/Skills/Attacks/Beams/SuperDragonFist,/obj/Skills/Rank/SpiritBurst,/obj/Skills/Rank/KaioTeleport,/obj/Skills/Observe,/obj/Skills/Telepathy),
"East Kaio"=list(/obj/Skills/DonateRPP,/obj/Skills/Attacks/Sokidan,/obj/Skills/PowerControl,/obj/Skills/Buffs/Focus,/obj/Skills/Materialization,/obj/Skills/Rank/KaioRevive,/obj/Skills/Rank/KeepBody,/obj/Skills/Heal,/obj/Skills/Rank/Shield,/obj/Skills/Buffs/Expand,/obj/Skills/Rank/GivePower,/obj/Skills/MetamoreanFusion,/obj/Skills/Attacks/HyperTornado,/obj/Skills/Rank/KaioTeleport,/obj/Skills/Observe,/obj/Skills/Telepathy),
"West Kaio"=list(/obj/Skills/DonateRPP,/obj/Skills/Attacks/Sokidan,/obj/Skills/PowerControl,/obj/Skills/Buffs/Focus,/obj/Skills/Materialization,/obj/Skills/Rank/KaioRevive,/obj/Skills/Rank/KeepBody,/obj/Skills/Heal,/obj/Skills/Rank/Shield,/obj/Skills/Rank/GivePower,/obj/Skills/SuperExplosiveWave,/obj/Skills/Attacks/Beams/ThunderFlash,/obj/Skills/SelfDestruct,/obj/Skills/Rank/KaioTeleport,/obj/Skills/Observe,/obj/Skills/Telepathy),

"Daimaou"=list(/obj/Skills/DonateRPP,/obj/Skills/Buffs/TitanForm,/obj/Skills/Rank/MakeSword,/obj/Skills/Swords/ImproveSword,/obj/Skills/Attacks/Beams/Piercer,/obj/Skills/Attacks/Beams/Ray,/obj/Skills/Buffs/Majin,/obj/Skills/Rank/KaioRevive,/obj/Skills/Rank/MakeAmulet,/obj/Skills/PowerControl,/obj/Skills/Rank/Majinize,/obj/Skills/Rank/KeepBody,/obj/Skills/Materialization,/obj/Skills/Rank/Imitation,/obj/Skills/Rank/RestoreYouth,/obj/Skills/Rank/Bind,/obj/Skills/Attacks/DeathBall,/obj/Skills/SuperExplosiveWave,/obj/Skills/Rank/Splitclone,/obj/Skills/Rank/UnlockPotential,/obj/Skills/Telepathy,/obj/Skills/Rank/Contractor,/obj/Skills/Rank/HeartlessAngel,/obj/Skills/SoultearStorm,/obj/Skills/Rank/Necromancy,/obj/Skills/Rank/Conjure,/obj/Skills/Rank/StarRevive,/obj/Skills/Rank/GiveJaganEye,/obj/Skills/Buffs/DarknessFlame,/obj/Skills/Attacks/Beams/BlackDragon,/obj/Skills/Attacks/Makosen),
"Hell SM"=list(/obj/Skills/Attacks/Kienzan,/obj/Skills/Attacks/Beams/Ray,/obj/Skills/Attacks/Sokidan,/obj/Skills/Buffs/Expand,/obj/Skills/Buffs/Majin,/obj/Skills/Materialization,/obj/Skills/SelfDestruct,/obj/Skills/Rank/Imitation,/obj/Skills/Attacks/Barrage,/obj/Skills/SuperExplosiveWave,/obj/Skills/Buffs/Focus,/obj/Skills/Rank/KeepBody,/obj/Skills/Rank/KaioRevive,/obj/Skills/Rank/Contractor,/obj/Skills/Rank/HeartlessAngel,/obj/Skills/Observe,/obj/Skills/Telepathy),
"Lower Hell Warden"=list(/obj/Skills/Attacks/Kienzan,/obj/Skills/Attacks/Beams/Ray,/obj/Skills/Attacks/Sokidan,/obj/Skills/Attacks/Barrage,/obj/Skills/SuperExplosiveWave,/obj/Skills/Buffs/Focus,/obj/Skills/Rank/KeepBody,/obj/Skills/Rank/HeartlessAngel,/obj/Skills/Buffs/Majin,/obj/Skills/Rank/SuperGhostKamikaze,/obj/Skills/Telepathy,/obj/Skills/Rank/StarRevive),
"Upper Hell Warden"=list(/obj/Skills/Buffs/Expand,/obj/Skills/Buffs/TitanForm,/obj/Skills/Rank/Splitclone,/obj/Skills/Buffs/Majin,/obj/Skills/Attacks/JechtShot,/obj/Skills/Telepathy,/obj/Skills/Rank/KeepBody,/obj/Skills/Swords/GreatDivide,/obj/Skills/SoultearStorm,/obj/Skills/Rank/StarRevive))


var/Ranks={"<html><body>
<u>Guardian</u>
 <ul>
  <li>Earth</u>:
  <li>Namek</lu>:
 </ul>
<u>Assistant Guardian</u>
 <ul>
  <li>Earth</u>:
  <li>Namek</lu>:
 </ul>
<u>Supreme Teachers</u>
 <ul>
  <li>Yardrat:</li>
  <li>Turtle:</li>
  <li>Crane:</li>
 </ul>
<u>Minor Teachers</u>
 <ul>
  <li>Earth:</li> 0/2
  <li>Vegeta:</li> 0/2
  <li>Namek:</li> 0/2
 </ul>
<u>Leaders*</u>
 <ul>
  <li>Vegeta:</li>
  <li>Earth:</li>
  <li>Arconia:</li>
 </ul>
<u>Afterlife</u>
 <ul>
  <li>Kaioshin:</li>
  <li>North Kaio:</li>
  <li>South Kaio:</li>
  <li>East Kaio:</li>
  <li>West Kaio:</li>
  <li>Daimaous:</li>
  <li>Upper Warden:</li>
  <li>Lower Warden:</li>
 </ul>
*Since there's only one official leader skillset and that's normally reserved for Vegeta's KoV, you'll have to share skills or ask for others as a leader of another world.

</body><html>"}

var/AdminNotes={"<html><head><title>Admin Notes</title></head><body><body bgcolor="#000000"><font color="#FFFFFF">
</center>
<h2>DNR List.</h2>
<h4>Put the reason too</h4>
<ul>
<li></li>
<li></li>
<li></li>
<li></lli>
<li></li>
</ul>
<br />
<hr />

</body></html>
"}


var/Notes={"<html><head><title>Notes</title></head><body><body bgcolor="#000000">
<font color="#CCCCCC"><center><h1>Welcome!</h1></center>
Jump into the adventure with your very own character that you can constructvely roleplay! If you'd like to help the game out, you can donate at <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=LYLMWM7M5S7DA&lc=GB&item_name=Valekor%20shell%20server%20costs&item_number=Shell%20Server%20Donation&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHosted">this link</a> to support our server costs!
<br>
</nl>

</body></html>
"}


var/Story={"

"}
var/Rules={"<html>
<body>
<h1 id="Top">Rules</h1>
	<li><a href=http://pastebin.com/zedQEhJi>The Rules</a><br>

Based Darwin, our lord and savior. (with help from oxy and matt)


</body>
</html>

"}

var/Credits={"<html><head><title>Credits</title></head><body><body bgcolor="#000000"><br><br>
A listing of all known people that have provided assistance in some form or another to this game.<br>
<s>Overlord</s>A person of some description: EnvyAttraction<br>
Owner: AngelReincarnation<br>
Coders: AmatsuDarkfyre, Jinx, Fevablista, Raishii, Masterdarwin88<br>
Code Advice: Valekor, Kizutsukeru, Asellia, Fevablista, Jumpy<br>
Mapping: Fushichou, AmatsuDarkfyre, Masterdarwin88<br>
General Contributors: Artisani, Ichiban<br>
Icons: Rosevine
All past and present admins for their efforts.<br>
And You<br>
"}

var/TransTiers={"<html><ul>
	<li><i>Sub-SSJ</i>: Throwback High Tension, Tuffle First Ascension, Cooler Form 1/2/3, Frieza Form 1/2/3/4, Chilled Form 1, Super Berserk 1, Reincarnated Domestic Cat, Super Heran 1 (Unchained Mode.)</li>
	<li><i>SSJ</i>: Super Saiyan, High Tension, Kold Form 1, Chilled Form 2, God Mode, Half-Demon Devil Trigger, Mana Infusion 2, 1/16 High Tension.</li>
	<li><i>SSJ 1.5</i>: Namekian First Ascension, Super Frenzy*, Super Berserk 2, Super Heran 2, Tuffle Second Ascension, Balls of Iron, Three-Tails Ascension, It Won't Die.</li>
	<li><i>SSJ 1.75</i>: Red High Tension, Full Demon Devil Trigger, Mana Infusion 3, Why Won't It Die?, Kaio First Ascension, Mazoku Demon DT, Alpha Wolf, Throwback High Tension 2.</li>
	<li><i>SSJ 2</i>: Super Saiyan 2, Titan God Mode, Ascended King Kold, Half-Demon Devil Trigger 2, Schrodinger's Descendant, Six-Tails Ascension.	</li>
	<li><i>SSJ 2.25</i>: Mana Infusion 4, Super Heran 3, 1/16 SSJ, Makyo First Ascension, faggot cat, Namekian Second Ascension.</li>
	<li><i>SSJ 2.5</i>: Super Android, Super Frenzy 2, Perfect Bio-Android, Final Ascension Nobodies, 9-Tails Ascension.</li>
	<li><i>SSJ 2.75</i>: Throwback High Tension 3, Tuffle Third Ascension, Blue High Tension, True LSSJ, Demon ADT, SNJ, Lucky Cat.</li>
	<li><i>SSJ 3</i>: Super Saiyan Three**, Fake Heart of Darkness***, Second Ascension Kaio, Shadow Dragon, Super Berserk 3.</li>
	<li><i>SSJ 3.25</i>: Balls of Steel</li>
	<li><i>SSJ 3.5</i>: Super Saiyan Four****, Half Demon DT3, NO NO NO NO.</li>
	<li><i><font color="#ff0000">Unfuckablewith</font></i>: Blue Super High Tension, Alpha Wolf 2, Mazoku Human DT, Final Tuffle Ascension, LSSJ3, Gods of Destruction, heavy breathing, 1/16 Super Saiyan 2, Makyo Second Ascension, CSSJ4, Throwback High Tension 4*****.</li>
	<li><font color="#ff0000">Nightmare</font>: ASNJ, Mazoku Demon ADT, Super-Perfect Bio ANDROIDS, Omega Shadow Dragons, Lunar Wrath Final Ascension Nobodies, Mazoku Human ADT.</li>
	<li><b><font color="#ff0000">The End</font></b>: Super Spiral Mode, S-Class Demon, Heart of Darkness, Super Saiyan God, Kaioshin Ascension, World of Nothingess + Lunar Wrath Nobodies.</li>
	<li><font color="#ff69b4">gay: Nameless Pathfinder Transformation.</font></li>
	<li><i>Variable</i>: Super Mystic, Super Majin, Super Frenzy on anything -not- a Vampire, CSSJ, LSSJ1, Popo, Titan Form.</li>
</ul>
* - While SSJ1.5 on a Normal Vampire, SSJ1.75 on a Diopire. On anything not a natural Vampire, if stacked with their racial transformation/ascension, drastically more powerful than SSJ1.5.<br>
** - Mileage varies depending on class. Low-Class Saiyan, Normal-Class Saiyan, and Trunks Half-Saiyan have Super Saiyan Three comparable in might to their SSJ4, placeable within the SSJ3.5 tier. All SSJ3 are not born equal.<br>
*** - lol this shit is weird atm<br>
**** - Trunks SSJ4 is SSJ2.5. About any other SSJ4 belongs here.<br>
***** - Abysmal scaling decreases the tier to SSJ2.5 given a long enough time period for the add to become irrelevant. At endwipe pace, this equates to HT4 remaining in this tier for 2 or 3 days after the requirement is obtained before being bumped down.<br>

Note: The gap between Unfuckwithable and Nightmare is miniscule. Very miniscule. All of these things compete with one another...short of Mazoku Human ADT, which is in a whole 'nother league of bullshit.

Disclaimer: If you're inferior to your opponent at verb, or they possess bullshit amounts of enablement, they will still beat the brakes off your monkey ass, wholesale. If you think offense dump small Goten is a good build, no level of a trans will save you from that boomerang chop to the throat. Get good, scrub.
"}


mob/proc/Index(var/blah)
	var/htmlz={"<body bgcolor="#000000" text="#CCCCCC" link="aqua" vlink="green" alink="white">
<font face="Tahoma" style="font-size: 8pt"> <center><big><b>[blah]</b></big></center><br>"}
	switch(blah)
		if("Index")
			src<<browse({"[htmlz]
<b>Welcome to [world.name]!</b><br>
Click on the guide(s) pertaining to your curiousity.<br><br>
<font color=red>Be <i>SURE</i> to read the Rules and if you're new I suggest the Guide!<font color=white><br><br>
<a href=?src=\ref[usr];action=Updates>Updates</a><br><hr>
<a href=?src=\ref[usr];action=Rules>Rules</a><br><hr>
<a href=?src=\ref[usr];action=Story>Story</a><br><hr>
<a href=?src=\ref[usr];action=Ranks>Ranks</a><br><hr>
<a href=?src=\ref[usr];action=Guide>Guide</a><br><hr>
<a href=?src=\ref[usr];action=Credits>Credits</a><br><hr>
<a href=?src=\ref[usr];action=TransformationTiers>Transformation Tiers</a><br><hr><br>"})
		if("Story")
			src<<browse("[htmlz]<a href=?src=\ref[usr];action=Index>Return to Index</a><br><hr>[Story]<br><br>")
		if("Rules")
			src<<browse("[htmlz]<a href=?src=\ref[usr];action=Index>Return to Index</a><br><hr>[Rules]<br><br>")
		if("Ranks")
			src<<browse("[htmlz]<a href=?src=\ref[usr];action=Index>Return to Index</a><br><hr>[Ranks]<br><br>")
		if("Updates")
			src<<browse("[htmlz]<a href=?src=\ref[usr];action=Index>Return to Index</a><br><hr>[Updates]<br><br>")
		if("Guide")
			src<<browse("[htmlz]<a href=?src=\ref[usr];action=Index>Return to Index</a><br><hr>[Guide]<br><br>")
		if("Credits")
			src<<browse("[htmlz]<a href=?src=\ref[usr];action=Index>Return to Index</a><br><hr>[Credits]<br><br>")
		if("TransformationTiers")
			src<<browse("[htmlz]<a href=?src=\ref[usr];action=Index>Return to Index</a><br><hr>[TransTiers]<br><br>")

mob/Topic(A,B[])
	if(B["action"]!="edit"&&B["action"]!="magic")
		switch(B["action"])
			if("Index")
				usr.Index("Index")
			if("Guide")
				usr.Index("Guide")
			if("Story")
				usr.Index("Story")
			if("Rules")
				usr.Index("Rules")
			if("Ranks")
				usr.Index("Ranks")
			if("Updates")
				usr.Index("Updates")
			if("Credits")
				usr.Index("Credits")
			if("TransformationTiers")
				usr.Index("TransformationTiers")
	else
		..()


client/Topic(href,href_list[],hsrc)
	if(href_list["action"]=="MasterControl"&&href_list["do"]=="Vote"&&usr.Admin)
		usr:AdminVote(hsrc)
	else if(href_list["action"]=="MasterControl"&&ismob(hsrc))
		if(href_list["do"]=="PM")
			usr:PM(hsrc, href_list["ID"])
		if(href_list["do"]=="PM2")
			usr:PM2(hsrc)
		if(href_list["do"]=="TPM")
			usr:TwoWayTelepath(hsrc)
		if(href_list["do"]=="CTPM")
		{
			usr:CHAOSTwoWayTelepath(hsrc)
		}
		else
			if(usr:Admin)
				if(href_list["do"])
					switch(href_list["do"])
						if("Adminize")
							usr:Adminize(hsrc)
						if("Rewarderize")
							usr:Rewarderize(hsrc)
						if("Edit")
							usr:Edit(hsrc)
						if("Mute")
							usr:Mute(hsrc)
						if("Observe")
							usr:Observe_(hsrc)
						if("Heal")
							usr:AdminHeal(hsrc)
						if("Ban")
							usr:Ban(hsrc)
						if("Give")
							usr:MagicMaterialize(hsrc)
						if("Revive")
							usr:AdminRevive(hsrc)
						if("Summon")
							usr:Summon(hsrc)
						if("Teleport")
							usr:Teleport(hsrc)
						if("XYZTeleport")
							usr:XYZTeleport(hsrc)
						if("Log")
							usr:PlayerLog(hsrc)
						if("TempLog")
							usr:PlayerTempLog(hsrc)
						if("ArchiveLog")
							usr:PlayerArchiveLog(hsrc)
						if("SkillLog")
							usr:PlayerSkillLog(hsrc)
						if("Assess")
							usr<<browse(hsrc:GetAssess(),"window=Assess;size=275x650")
						if("Boot")
							usr:Delete(hsrc)
						if("KO")
							usr:AdminKO(hsrc)
						if("Kill")
							usr:AdminKill(hsrc)
						if("SendToSpawn")
							usr:SendToSpawnz(hsrc)
						if("Reward")
							usr:Reward(hsrc)
				else
					var/View={"<html><head><title>Player Control [hsrc:key]</title><body>
					<font size=3><font color=red>[hsrc:name]<hr><font size=2><font color=black>"}
					View+={"

					\[ <a href=?src=\ref[hsrc];action=MasterControl;do=Adminize>Promote/Demote</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Mute>Mute</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=PM>Admin PM</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Observe>Observe</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=SendToSpawn>Send to Spawn</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Assess>Assess | <a href=?src=\ref[hsrc];action=MasterControl;do=Give>Give</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Kill>Kill</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=KO>Knockout</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Heal>Heal<a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Revive>Revive</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Log>Check Log</a href>  | <a href=?src=\ref[hsrc];action=MasterControl;do=TempLog>Check Temp Log</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=ArchiveLog>Check Archive Log</a href> |<a href=?src=\ref[hsrc];action=MasterControl;do=SkillLog>Check Skill log</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Reward>Reward</a href>  | <a href=?src=\ref[hsrc];action=MasterControl;do=Edit>Edit</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Summon>Summon</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Teleport>Teleport to</a href>  | <a href=?src=\ref[hsrc];action=MasterControl;do=XYZTeleport>XYZ Teleport</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Boot>Boot</a href> | <a href=?src=\ref[hsrc];action=MasterControl;do=Ban>Ban</a href> \]
					"}
					src<<browse(View,"window=Person;size=500x135")
	else if(href_list["action"]=="RewardControl"&&ismob(hsrc))
		if(href_list["do"])
			switch(href_list["do"])
				if("Log")
					usr:RewarderPlayerLog(hsrc)
				if("TempLog")
					usr:RewarderPlayerTempLog(hsrc)
				if("ArchiveLog")
					usr:RewarderPlayerArchiveLog(hsrc)
				if("Reward")
					usr:RewardRPP(hsrc)
				if("ManualReward")
					usr:ManualReward(hsrc)
		else
			var/View={"<html><head><title>Reward Control [hsrc:key]</title><body>
			<font size=3><font color=red>[hsrc:name]<hr><font size=2><font color=black>"}
			View+={"
			\[ <a href=?src=\ref[hsrc];action=RewardControl;do=Log>Check Log</a href>  | <a href=?src=\ref[hsrc];action=RewardControl;do=TempLog>Check Temp Log</a href> | <a href=?src=\ref[hsrc];action=RewardControl;do=ArchiveLog>Check Archive Log</a href> | <a href=?src=\ref[hsrc];action=RewardControl;do=Reward>Reward</a href> | <a href=?src=\ref[hsrc];action=RewardControl;do=ManualReward>Manual Reward</a href> \]
			"}
			src<<browse(View,"window=RewardPerson;size=500x135")
	..()


var/Guide={"
<html>
<head><title>Guide</title></head>
<body><body bgcolor=black text=white>
<p>The guide isn't all done as you might contemplate, but its good

enough for now.</p>
 <h2>Roleplay</h2>
  <p>There is a roleplay game! Use the say verb and emote verb

frequenctly and often! Rewards in this game are based on roleplay! Sure

you could train all day and not roleplay but eventually rewards will

become more important and you will be left in the desert power-wise.</p>
<ul>
<li><b>Battle</b> Make it clear that you want to initiate battle with

someone, then allow them time to respond. DONT countdown like a panzy

unless its been awhile and you think they're stalling, its alright to

countdown then.</li>
<li><b>Stealing</b> Make your intention clear then countdown despite if

anyones around, if someone intervenes in stopping you, stop what you're

doing and reply to them, then countdown again.</li>
<li><b>Killing</b> Enter your roleplay, and if theres no one around,

kill them. However, if there is, you must hit countdown, and if anyone

intervenes you must stop what you're doing and reply to them and then

recountdown unless you make clear in your roleplay that you do not

intend to stop, in that case that person can react to you, and you can

react to the person you're trying to kill.
</ul>

 <h2>Training</h2>
  <p>There are a few ways of training: training skills, flying,

sparring, punching logs or punching bags. You can intensify and increase

the gain by using weights or using gravity!</p>
 <h2>Items</h2>
 <p>I spoon-fed you most of the skills but these you're going to have to

find out :)</p>
<h2>Mating/Breeding</h2>
 <p>I'll let you figure this one out too :)</p>
 <h2>Skills</h2>
 <p>Nearly all skills are masterable besides skills like self destruct

for obvious reasons. There are three ways to learn a skill: naturally,

observing, or being taught. After a skill is mastered 100% you may teach

it to someone using the teach verb, otherwise you can 'teach' them it be

continually using it in front of them, otherwise known as 'leeching'.

Some skills are more diffucult to leech then others, and some even have

energy reqs. before even considering if you can learn it.</p>
 <ul>
   <li><b>Beams</b>  A channeled beam of concentrated energy that

increases in distance, power, and speed when trained.
    <ol>
      <li>Basic - naturally learned</li>
      <li>Dodompa</li>
      <li>Final Flash</li>
      <li>Galic Gun - a multi-tiled beam.</li>
      <li>Kamehameha - a multi-tiled beam.</li>
      <li>Masenko</li>
      <li>Piercer</li>
      <li>Ray</li>
    </ol></li>
   <li><b>Blast</b> A basic skill, naturally learned by every race at a

certain energy req. Fires a single rapid blast that if trained can

lessen the delay for rapid fire action! </li>
   <li><b>Charge</b> A basic skill, naturally learned by every race at a

certain energy req. A single super charged ki blast. At first the blast

takes seemingly forever to charge but as its mastery increases the

tediousness decreases, a decent refire time for a well-worth charged

ball of energy!</li>
   <li><b>Expand</b> A muscle manipulation skill, allows the user to

sacrifice a bit of their recovery, skill, and speed for extra power,

strength, and endurance! Trainable up to 4 times expansion. </li>
   <li><b>Fly</b> A basic skill, naturally learned by every race at a

certain energy req. Circulates energy outward to levitate into the air

enabling flight over buildings, water, and the such. Drain is reduced

upon training.</li>
   <li><b>Focus</b> A mind enhancement skill, allows the user to

heighten their force, regeneration, speed, and power at the cost of a

steady drain! The drain lessens upon more mastery. </li>
   <li><b>Give Power</b> A power transfer skill, the user sacrifices

their well-being to give their power to another. The higher the mastery

the less percent of getting knocked out. </li>
   <li><b>Heal</b> A healing technique, the user sacrifices some of

their energy and power to restore the health of another person. The

higher the mastery the less consequence. </li>
   <li><b>Homing Finisher</b> A homing type of energy attack, creating

multiple concentrated balls of energy that target against a victim. The

higher the mastery, the more spheres and less delay. </li>
   <li><b>Invisibility</b> An invisibility rendering skill, unmasterable

at thsi time. </li>
   <li><b>Kaioken</b> A special skill devised by the North Kaio,

masterable up to 20x. </li>
   <li><b>Kienzan</b> A piercing disc of concentrated energy that will

slice through person after wall after wall after person. Trainable to

reduce charge time and delay. </li>
   <li><b>Kikoho</b> A multi-tiled huge sphere of concentrated energy,

takes a toll out of its user to use but the consequence can be lessened

upon mastery along with delay. </li>
   <li><b>Kiai</b> An energy explosion type of attack, damages people in

the area and sends them flying. Damage and distance multiplier can be

increased by mastery. </li>
   <li><b>Majinize</b> Used by the Daimaou to create servants. </li>
   <li><b>Majin</b> A buff type of skill that increases raw power but

grants servitude to the one who majinized you. </li>
   <li><b>Make Amulet</b> Used by the Daimaou to create Amulets to the

dead zone. </li>
   <li><b>Makosen</b> A series of blasts are combursted instantly. Delay

decreased and blasts increased upon mastery. </li>
   <li><b>Materialize</b> Materialize weights out of thin air! Weights

are used for training enhancements. </li>
   <li><b>Mysticize</b> Used by the kaioshin to purify their loyals.

</li>
   <li><b>Mystic</b> A buff type of skill that increases potential

rather than raw power, cancels anger. </li>
   <li><b>Namekian Fusion</b> Racial skill for namekians, pay the

ultimate price with their life, is it worth it for the power? Obviously

unmasterable.</li>
   <li><b>Observe</b> Used to observe people! Unmasterable. </li>
   <li><b>Planet Destruction</b> beh </li>
   <li><b>Power Control</b> Lower your higher your power, unmasterable

at thsi time but will change in the future. </li>
   <li><b>Regenerate</b> Namekian racial skill, unmasterable. Sacrifice

energy for increased health regeneration. </li>
   <li><b>Revive</b> Can be used to revive the dead! Unmasterable. </li>
   <li><b>Self Destruct</b> Pretty obvious, unmasterable. </li>
   <li><b>Shield</b> A skill used to lessen the severity of energy

attacks and the such- drains upon impact. Unmasterable. </li>
   <li><b>Shunkan Ido</b> A skill devised by the Master, can teleport to

any person if in their range of mastery specifications. </li>
   <li><b>Sokidan</b> A manipulation sphere of energy that you can

control by shifting your direction. Higher mastery means faster

reaction, less delay. </li>
   <li><b>Splitform</b> Can duplicate an exact replica of yourself,

clicking them gives control over their actions. Higher mastery means a

higher number of splitforms at one time. </li>
   <li><b>Taiyoken</b> A skill devised by the crane hermit, can blind

their victims. Range and severity increases upon mastery. </li>
   <li><b>Telepathy</b> Obtained by nearly everyone after a certain req,

allows communication between two people telepathically. </li>
   <li><b>Teleport</b> Used by supremacy rulers such as the kaioshin,

this is leechable as well so watch out! </li>
   <li><b>Third Eye</b> A racial skill for humans after a certain req. A

buff that increases regeneration, power, speed and the such at the

expense of lowered anger. </li>
   <li><b>Unlock Potential</b> A skill used by supremacy rulers and such

to unlock powers deep in an individual. Can only be used once on a

person. </li>
   <li><b>Zanzoken</b> Increases velocity to unimaginable heights, click

a turf to instantly 'zap' to it. Increasing mastery decreases drain.

</li>



 </ul>



</body>
</html>
"}