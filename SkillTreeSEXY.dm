var/list/SkillTreeList=list("Tier0"=list(),"BlastT1"=list(),"BlastT2"=list(),"BlastT3"=list(),"BlastT4"=list(),"SwordT1"=list(),"SwordT2"=list(),"SwordT3"=list(),"SwordT4"=list(),"BeamT1"=list(),"BeamT2"=list(),"BeamT3"=list(),"BeamT4"=list(),"BuffT1"=list(),"BuffT2"=list(),"BuffT3"=list(),"MiscT4"=list(),"UnarmedT1"=list(),"UnarmedT2"=list(),"UnarmedT3"=list(),"UnarmedT4"=list(),"Stances"=list(),"AdvStances"=list(),"SuperStances"=list(),"Passives"=list())
proc/MakeSkillTreeList()
	for(var/x in SkillTree)
		for(var/z in SkillTree[x])
			var/obj/SkillTreeObj/s = new
			var/namez=z
			if(copytext("[z]",1,2)=="/")
				var/pos = 1
				while(findtextEx(namez, "/", pos))
					namez=copytext(namez, pos+1)
			s.path=z
			s.cost=SkillTree[x][z]
			s.name="[namez] ([s.cost])"
			SkillTreeList[x]+=s
	/*for(var/x in SkillTree)
		for(var/i in SkillTree[x])
			var/obj/SkillTreeObj/B=new
			B.cost=SkillTree[x][i]
			var/namez=i
			if(copytext("[i]",1,2)=="/")
				var/path=text2path("[i]")
				var/obj/nameref=new path
				namez=nameref.name
				if(nameref:Magic==1)
					B.icon_state="Magic"
				spawn(3)del(nameref)
			B.path=i
			B.name="[namez] ([B.cost])"
			world << B
			SkillTreeList[x]+=B*/
mob/proc/fml2()
	usr<<"Your skills have been removed and your reward points have been reaccounted for, sorry! (not really I just didn't feel like making a new proc and needed to reset a few vars lol)"
	usr.fuckingzarkus=4
	if(usr.spentrp>500)
		usr.spentrp=500
	if(usr.TrainedRPP>1000)
		usr.TrainedRPP=1000
	/*for(var/obj/Skills/x in usr)
		for(var/q in SkillTree)
			if(q=="Stances")continue
			for(var/g in SkillTree[q])
				if(istype(x,text2path("[g]")))
					usr.RewardPoints+=SkillTree[q][g]
					if(usr.RewardPoints>300)
						usr.RewardPoints=300
						usr.TrainedRPP=300
						usr.spentrp=300
					del(x)*/

var/list/SkillTree=list(
"Tier0"=list("/obj/Skills/PowerControl"=10,"/obj/Skills/Rank/Zanzoken"=10,"/obj/Skills/Rank/AfterImageStrike"=100,"/obj/Skills/Rank/WildSense"=100,"/obj/Skills/MartialArts/Pursuit"=300),
"BlastT1"=list("/obj/Skills/Attacks/Blast"=50,"/obj/Skills/Attacks/Charge"=150),
"BlastT2"=list("/obj/Skills/Attacks/Sokidan"=100,"/obj/Skills/Attacks/Barrage"=150,"/obj/Skills/Attacks/Kienzan"=125),
"BlastT3"=list("/obj/Skills/Attacks/DragonNova"=250,"/obj/Skills/Attacks/JechtShot"=300, "/obj/Skills/Attacks/Makosen"=500),
"BlastT4"=list("/obj/Skills/Magic/LanzaDelRelampago"=500),
"SwordT1"=list("/obj/Skills/Swords/AirRender"=50,"/obj/Skills/Swords/Sweeping_Blade"=100),
"SwordT2"=list("/obj/Skills/Swords/Bladed_Flurry"=200,"/obj/Skills/Swords/ScarringBreeze"=150,"/obj/Skills/Swords/SpinAttack"=200,"/obj/Skills/Swords/Tipper"=250),//"/obj/Skills/Swords/SonicRaid"=250
"SwordT3"=list("/obj/Skills/Swords/TsunamiStrike"=500),
"SwordT4"=list(),
"BeamT1"=list("/obj/Skills/Feva/Beam/NormalBeam"=100),
"BeamT2"=list("/obj/Skills/Attacks/Beams/FireBreath"=200,"/obj/Skills/Attacks/Beams/TidalWave"=200),
"BeamT3"=list("/obj/Skills/Attacks/Beams/Ray"=400,"/obj/Skills/Attacks/Beams/Piercer"=400),
"BeamT4"=list("/obj/Skills/Attacks/Beams/CustomBeam"=500),
"BuffT1"=list("/obj/Skills/Buffs/KiBlade"=150,"/obj/Skills/Rank/Shield"=150,"/obj/Skills/Magic/SearingHeart"=400,"/obj/Skills/Magic/Stoneskin"=400,"/obj/Skills/Magic/ZephyrVision"=400,"/obj/Skills/Magic/OceanMind"=400),
"BuffT2"=list("/obj/Skills/Buffs/Expand"=500,"/obj/Skills/Buffs/Focus"=500,"/obj/Skills/Buffs/LightningAura"=500,"/obj/Skills/Buffs/BlazingWrath"=500,"/obj/Skills/Buffs/EarthenWall"=500,"/obj/Skills/Buffs/BoostingWinds"=500,"/obj/Skills/Buffs/MistVeil"=500),
"BuffT3"=list("/obj/Skills/Buffs/LightningArmor"=750,"/obj/Skills/Buffs/BloodArmor"=750,"/obj/Skills/Buffs/StormArmor"=750),
"MiscT4"=list("Sense"=100, "/obj/Skills/SuperExplosiveWave"=500, "/obj/Skills/Rank/Splitclone"=500),
"UnarmedT1"=list("/obj/Skills/MartialArts/AxeKick"=50, "/obj/Skills/MartialArts/WhirlwindStrike"=100),
"UnarmedT2"=list("/obj/Skills/MartialArts/Burning_Finger"=300,"/obj/Skills/MartialArts/Get_Dunked"=300,"/obj/Skills/Attacks/WolfFangFist"=300,"/obj/Skills/Feva/ThunderHands"=300, "/obj/Skills/MartialArts/Headbutt"=300),
"UnarmedT3"=list("/obj/Skills/MartialArts/Sweeping_Kick"=500),
"UnarmedT4"=list("/obj/Skills/MartialArts/Clothes_Line"=500),
"Stances"=list("Bat"=50,"Armadillo"=50,"Cheetah"=50,"Wolf"=50,"Turtle"=50,"Crane"=50),
"AdvStances"=list("FireFists"=250, "EarthFists"=250, "WindFists"=250),
"SuperStances"=list("Dragon"=750,"Tiger"=750,"Phoenix"=750,"Tortoise"=750),
"Passives"=list()
)

obj/SkillTreeObj
	var/path
	var/cost
	icon='skilltree.dmi'
	layer=9999
	Click()
		if(copytext("[src.path]",1,2)!="/")
			if(src.path=="FireFists"||src.path=="WindFists"||src.path=="EarthFists"||src.path=="WaterFists")
				if(usr.vars["[src.path]Unlocked"])
					usr<<"You already have this Advanced Stance!"
					return
				else if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough points to buy this!"
					return
				else
					usr.RewardPoints-=src.cost
					usr.spentrp+=src.cost
					usr.vars["[src.path]Unlocked"]=1
					usr<<"You've unlocked [src.path]."
					if(!locate(/obj/Skills/MartialArts/Activate_Advanced_Stance,usr.contents))
						usr.contents+=new/obj/Skills/MartialArts/Activate_Advanced_Stance
						usr.contents+=new/obj/Skills/MartialArts/Set_Advanced_Stance
						usr<<"You may now access Advanced Stances."
			else if(src.path=="Dragon"||src.path=="Tiger"||src.path=="Phoenix"||src.path=="Tortoise")
				if(usr.vars["[src.path]Unlocked"])
					usr<<"You already have this Super Stance!"
					return
				else if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough Reward Points to buy this!"
					return
				else
					usr.RewardPoints-=src.cost
					usr.vars["[src.path]Unlocked"]=1
					usr<<"You've unlocked [src.path] Stance."
			else if(src.path=="ManaMax")
				if(usr.ManaMax>=300)
					usr<<"The current cap is 300 Mana. Sorry."
					return
				else if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough points to buy this!"
					return
				else
					usr.ManaMax+=25
					usr.RewardPoints-=src.cost
					usr.spentrp+=src.cost
					usr<<"Maximum mana increased by 25."
			else if(src.path=="Sense")
				if(usr.RewardPoints >= src.cost)
					if(usr.SenseUnlocked<1)
						usr.contents+=new/obj/Skills/Sense
						usr.RewardPoints-=src.cost
						usr.spentrp+=src.cost
						usr.SenseUnlocked=1
						usr << "You can now extend your senses to read power signatures."
						return
					if(usr.SenseUnlocked < 3)
						usr.SenseUnlocked++
						usr.RewardPoints-=src.cost
						usr.spentrp+=src.cost
						usr<<"Your ability to extend your senses increases."
						return
					if(usr.SenseUnlocked==3)
						usr << "You can't upgrade your ability to sense any higher from the skill tree!"
						return
				else
					usr << "You don't have enough points to buy this."
					return
			else
				if(usr.vars["[src.path]StanceUnlocked"])
					usr<<"You already have this stance!"
					return
				else if(usr.RewardPoints<src.cost)
					usr<<"You don't have enough points to buy this!"
					return
				else
					usr.RewardPoints-=src.cost
					usr.spentrp+=src.cost
					usr.vars["[src.path]StanceUnlocked"]=1
					usr<<"You've unlocked [src.path]."
					if(src.path=="Training")
						usr.contents+=new/obj/Skills/MartialArts/Set_Stance
						usr.contents+=new/obj/Skills/MartialArts/Activate_Stance
						usr<<"You may now access Basic Stances."



		else
			var/path=text2path("[src.path]")
			var/obj/s=new path

			if(locate(s,usr.contents))
				usr<< "You already know this skill!"
				del(s)
				return
			if(usr.RewardPoints<src.cost)
				usr<<"You don't have enough Reward Points to purchase this skill!"
				del(s)
				return
			if(usr.RewardPoints>=src.cost)
				usr.contents+=s
				usr.RewardPoints-=src.cost
				usr.spentrp+=src.cost
				usr<<"You bought [s] for [src.cost] points!"
		..()


mob/Players/verb
	SkillTree()
		set category="Other"
		if(src.ForceSensitive)
			src << "You don't need to see the skill tree because you can't get any skills!"
			return
		winshow(usr,"skilltree",1)
	skilltreez(var/z as text)
		set hidden=1//interface verb doesnt needa be found out
		winset(usr,"skilltreegrid","cells=0x0")//clears grid
		usr<<output("RPP:[usr.RewardPoints]","STRewardPoints")
		sleep(1)
		var/p=1//used as a positioning locator for rows/columns
		for(var/obj/SkillTreeObj/x in SkillTreeList[z])
			//p++
			usr<<output(x,"skilltreegrid:1,[p]")
			p++


