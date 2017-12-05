obj/Skills/proc/Cooldown()
	src.Using=1
	spawn(src.Cooldown*10)
		src.Using=0
		var/mob/m = src.loc
		if(src.Cooldown > 5)
			m << "[src] is off cooldown."
/*obj/Skills/proc/Cooldown()
	src.Using=world.time+(Cooldown*10)*/
var/list/RAGEsayings = list("FUCK YOU!", "GOD DAMMIT!", "FUCK THIS!", "FUCK EVERYTHING!", "THE LEGEND NEVER DIES!", "I AM DIAMONDS!",
"INVINCIBLE!", "SHITTY CUNT WAFFLE!", "BUTTERSCOTCH DINOSAUR PUSSY!", "THIS IS FOR YOU, MAKERZ!", "BLUUUUEEE!!!", "ZARKUUUSSS!!!",
"JUMPYYY!!!", "BOOONESSS!!!", "JIIINXXX!!!", "AUGH!", "FUCK.", "SHIT.", "CUNT.", "FUCK. AGAIN.", "I WILL DESTROY YOU!", "ANGER IS NOT MY STRONG SUIT!")

mob/var/tmp/Beaming //If true when a direction is pressed, do not move, but change directions.
mob/proc/CanBlast(Drain)
	if(Drain>Energy) return
	if(!Knockbacked&&!Frozen&&!Stunned&&!KO&&src.icon_state!="Meditate"&&src.icon_state!="Train"&&src.icon_state!="KO"&&src.icon_state!="KB") return 1
obj
	Taiyoken
		icon='Taiyoken.dmi'
		layer=999
	GravitySpell
		icon='Tech.dmi'
		layer=999
	Blizzard
		icon='Weather.dmi'
		layer=999
	AREffect
		icon='Weather.dmi'
		layer=999
obj
	Curse
	PlanetBind
mob/proc/Blind(var/duration=1000)
	var/obj/x=new/obj/Taiyoken
	x.screen_loc="1,1 to 20,20"
	src.client.screen+=x
	spawn(20)src.client.screen-=x
	spawn(30)src.client.screen-=x
	while(prob(90))
		x.icon_state=pick("1","2","3","4")
		if(prob(40))sleep(0.1)
	while(prob(80))
		x.icon_state=pick("5","6","7","8")
		if(prob(40))sleep(0.1)
	while(prob(70))
		x.icon_state=pick("9","10","11","12")
		if(prob(40))sleep(0.1)
	while(prob(80))
		x.icon_state=pick("13","14","15","16")
		if(prob(40))sleep(0.1)
	while(prob(90))
		x.icon_state=pick("17","18","19","20")
		if(prob(40))sleep(0.1)
	src.client.eye=null
	spawn(duration)src.client.eye=src


mob/proc/SkillLeech(obj/Skills/x)
	if(!x)return
	if(src.icon_state=="Train"||src.icon_state=="Meditate")return
	for(var/mob/Players/M in viewers(10,src))
		if(M==src)continue
		if(prob(100))
			if(!locate(x,M.contents))
				if(M.Class=="Blue Mage")
					M<<"You have learned [x.name]."
					var/obj/q=new x.type
					M.contents+=q
				/*
				else
					if(x.Learn["energyreq"])
						if(!(M.EnergyMax>text2num(x.Learn["energyreq"])/4))
							continue
					var/probz=1
					if(x.Learn["difficulty"])
						probz=text2num(x.Learn["difficulty"])
					var/chance=(sqrt(sqrt(EnergyMax)))/probz
					chance/=LeechHard
					chance=min(chance,75)

					if(prob(chance))
						M.OMessage(15,"[M] learned [x.name] from watching [src]!","[M]([M.key]) learned [x.name]([x.type]) from watching [src]([src.key])!")
						var/obj/q=new x.type
						M.contents+=q
				*/
mob/proc/Teach(obj/Skills/A)
	if(!A.Teachable)
		usr<<"Not teachable."
		return
	if(A.Level<100)
		usr<<"You must fully master this to teach it."
		return
	if(Energy<EnergyMax)
		usr<<"You need full energy to teach this."
		return
	var/list/Choices=new
	Choices+="Cancel"
	for(var/mob/Players/P in get_step(src,dir)) Choices+=P
	var/mob/Choice=input(src,"Teach who") in Choices
	if(Choice=="Cancel") return
	if(Energy<EnergyMax) return
	if(A.Learn["energyreq"]>Choice.EnergyMax)
		src<<"They dont have enough energy!"
		return
	Energy=0
	Choice.OMessage(15,"[src] psychically transfers the [A] skill to [Choice]!","[ExtractInfo(src)] psychically transfers the [A] skill to [ExtractInfo(Choice)]!")
	var/obj/q=new A.type
	Choice.contents+=q

mob/Players/verb
	/*Meditate()
		set category="Skills"
		usr.SkillX("Meditate",null,1)
	Meditate()
		set category="Skills"
		if(usr.icon_state == "KO" || usr.icon_state=="Train"|| usr.icon_state=="KB" || usr.icon_state=="Flight" ) return
		if(isnull(usr.meditation_event))
			generalEvent_id="[usr][world.realtime][rand()]"
			usr << "You begin meditating."
			icon_state = "Meditate"
			usr.dir=SOUTH
			usr.meditation_event = new(training_scheduler, usr, generalEvent_id)
			training_scheduler.schedule(usr.meditation_event, 50)
		else
			Cancel_Meditation()*/
	/*Train()
		set category="Skills"
		usr.SkillX("Train",null,1)
	Train()
		set category="Skills"
		if(usr.icon_state == "KO" || usr.icon_state=="Meditate"|| usr.icon_state=="KB" || usr.icon_state=="Flight" ) return
		if(isnull(usr.training_event))
			generalEvent_id="[usr][world.realtime][rand()]"
			usr << "You begin shadow boxing."
			icon_state = "Train"
			usr.dir=SOUTH
			usr.training_event = new(training_scheduler, usr, generalEvent_id)
			training_scheduler.schedule(usr.training_event, 50)
		else
			Cancel_Training()*/
	Attack()
		set category="Skills"
		set name="Normal Attack"
		if(Blocking)return
		usr.Melee()




	Grabz()
		set name="Grab"
		set category="Skills"
		if(Blocking)return
		usr.Grab()
/*	Dig()
		set category="Skills"
		usr.SkillX("Dig",null,1)*/
/*	Dig()
		// usr = the key
		// src = the mob

		set category="Skills"
		if(usr.icon_state == "KO" || usr.icon_state=="Train"|| usr.icon_state=="Meditate" || usr.icon_state=="Flight" ) return
		if(isnull(usr.digging_event))
			generalEvent_id="[usr][world.realtime][rand()]"
			usr << "You begin digging for resources."
			icon_state = "KB"
			usr.Frozen=1
			usr.digging_event = new(general_scheduler, usr, generalEvent_id)
			general_scheduler.schedule(usr.digging_event, 50)
/*			for(var/mob/Players/M in world)
				if (!M.client) continue
				if (usr != M && usr.client.address == M.client.address)
					M.Cancel_Digging()*/
		else
			usr.Frozen=0
			Cancel_Digging()*/

/*	Test()
		set category = "Debug"
		src << " Hiya! <br>\
		src = [src] [src.type]<br> \
		usr = [src] [usr.type]"*/
 // I hope that cleared some usr/src stuff up :P
 // So above there, in Dig(), both src and usr can be used? They're somewhat interchangable?
 // In this case yea. Because mob and usr refer to the same thing.
 // Because usr is implied you could even do this
 // But that gets really confusing
 // Indeed. I'd likely forget what it was doing

mob/proc/BlastX(var/Wut,var/obj/Skills/Z,var/bypass=0)
	if(Z)
		if(!locate(Z) in src)
			return
	if(src.Stunned)
		return
	var/ManaDrain=1
	var/StaffPower=1
//	var/Element=0
	for(var/obj/Items/Enchantment/Staff/N in src) if (N.suffix)
		ManaDrain=N.Mana_Drain
		StaffPower=N.Staff_Power
//		Element=N.Element
	if(bypass||Z)
		switch(Wut)

			if("InjuryRecovery")
				if(src.TotalInjury > 0 && src.TotalInjury < 60)
					src.OMessage(10, "[src] expends energy to heal all the wounds on their body.", "[src]([src.key]) used Injury Recovery.")
					src.TotalInjury=0
					src.TotalFatigue+=40
				else
					src << "Your body is not fit to perform this technique..."
					return
			if("ExtendAttack")
				if(src.KO||src.icon_state=="KB"||src.icon_state=="Train"||src.icon_state=="Flight"||src.Beaming||src.Attacking) return
				if(!Z.Using)
					var/obj/MysticArms/Head/H=new
					H.Owner=src
					H.Priority="Attack"
					H.dir=src.dir
					H.loc=src.loc
					H.Master=usr
					src.Beaming=2
					H.Initial_Loc=src.loc
					H.icon=Z.sicon
					step(H,src.dir,32)
					H.Max_Steps=8
					H.Chase_Target()
					Z.Cooldown()
			if("ExtendGrab")
				if(src.KO||src.icon_state=="KB"||src.icon_state=="Train"||src.icon_state=="Flight"||src.Beaming||src.Attacking) return
				if(!Z.Using)
					src.Grab=null
					var/obj/MysticArms/Head/H=new
					H.Owner=src
					H.Priority="Grab"
					H.dir=src.dir
					H.loc=src.loc
					H.Master=usr
					src.Beaming=2
					H.Initial_Loc=src.loc
					H.icon=Z.sicon
					step(H,src.dir,32)
					H.Max_Steps=8
					H.Chase_Target()
					Z.Cooldown()
			if("Telekinesis")
				if(src.KO||src.icon_state=="KB"||src.icon_state=="Train"||src.icon_state=="Flight"||src.Beaming||src.Attacking) return
				if(!Z.Using)
					var/mob/Tgt
					if(src.Target)
						Tgt=src.Target
					if(Tgt&&Tgt in oview())
						Tgt.Flying=1
						Tgt.Frozen=1
						Create_Shadow(Tgt)
						Flight(Tgt)
						Z.Cooldown()
						spawn(rand(20,30))
							Tgt.Frozen=0
							Tgt.Flying=0
							ForceDamage(src,Tgt,DamageMulti=2)
							Tgt.Knockback(10,Tgt,Direction=get_dir(src,Tgt))
//							Z.Cooldown()
			if("Meditate")
				if(src.KO||src.icon_state=="KB"||src.icon_state=="Train"||src.icon_state=="Flight"||src.Beaming||src.Attacking) return
				if(src.Berserkering)
					src<<"You cannot calm your inner, violent will..."
					return
				if(src.icon_state!="Meditate")
					src.LOLWUT()//ascensions n stuff.
					usr.OMessage(1,null,"[usr]([usr.key]) meditated!")
					src.dir=SOUTH
					src.icon_state="Meditate"
					Z.Using=1
					spawn(20)
						Z.Using=0
					spawn()src.Meditation()
//					MedGains.Add(src)

				else
					if(Z.Using==1)// Commenting this out to catch people who med stack.
						return
					//src.dir=SOUTH
					src.icon_state=""
//					MedGains.Remove(src)
			if("VoidNova")
				if(src.KO||Z.Using==1||src.Grab)return
				if(src.Alert("You sure you want to use this technique? It drains heavily."))
					src.Frozen=1
					if(Z.Using)
						return
					Z.Using=1
					spawn(300)
						if(src)
							Z.Using=0
							src<<"Void Nova CD finished."
					src.OMessage(20,"[src] begins gathering all the energy around them into thefdf234@#423rr....","[src]([src.key]) used Void Nova!")
					sleep(5)
					for(var/mob/Players/T in view(18))
						spawn()T.Quake(8)

					for(var/turf/T in Turf_Circle(src,8))
						spawn(rand(4,8)) VoidDestroy(T,5)
						for(var/mob/M in view(0,T))
							if(M!=src)
								M.Health-=src.ForVsRes(M, 50)
								if(M.Health<=5)
									M.client.SaveChar()
									M.Voided=1
									del M
					src.Energy*=0.75
				src.Frozen=0
				Z.Cooldown()
			if("KamuiRegen")
				if(!Z.Using)
					src.OMessage(10, "[src]'s body threads itself back together!!", "[src]([src.key]) used Kamui Regen.")
					var/Affinity=src.LifeFiberFusion
					while(Affinity)
						Affinity--
						src.Health+=5
					src.Health+=10
					if(src.Health > 100)
						src.Health=100
					Z.Cooldown()
			/*if("HeadRemoval")
				if(!Z.Using)
					(mob/A in world)
					if(!A.Dead)
					A.Death(null,"ADMIN")
					Log("Black Power","<font color=red>[ExtractInfo(usr)] decapitated [ExtractInfo(A)].")*/
			if("WetShot")
				if(Z.Using)
					return
				EXP+=(EXPGains/100)*0.00004
				var/Drain=25/Z.Efficiency/ManaDrain
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.Beaming) return
				if(src.ManaAmount<=5) return
				flick("Blast",src)
				if(!src.Manakete)
					src.ManaAmount-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=1
				spawn((src.Refire/Z.Speed*(0.85/sqrt(Z.Level*Z.Level))*100)+1) src.Attacking=0
				Z.Skill_Increase()
				if(Z.Level<100)
					Z.Level=100
				//if(!prob(Z.Level)) return
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
//				A.pixel_y=rand(-16,16)
//				A.pixel_x=rand(-16,16)
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=1.5*StaffPower
				A.Offense=(src.Offense*src.OffenseMultiplier)
				A.Elemental="Water"
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				for(var/mob/X in view(10,usr))
					if(X.MusicToggle=="On")
						X<<sound('kiblast.wav', repeat = 0, wait = 0, channel = 0, volume = 50)
				Z.Cooldown()

			if("FlickeringEmber")
				if(Z.Using)
					return
				EXP+=(EXPGains/100)*0.00004
				var/Drain=25/Z.Efficiency/ManaDrain
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.Beaming) return
				if(src.ManaAmount<=5) return
				flick("Blast",src)
				if(!src.Manakete)
					src.ManaAmount-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=1
				spawn((src.Refire/Z.Speed*(1.25/sqrt(Z.Level*Z.Level))*100)+1) src.Attacking=0
				Z.Skill_Increase()
				if(Z.Level<100)
					Z.Level=100
				//if(!prob(Z.Level)) return
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
//				A.pixel_y=rand(-16,16)
//				A.pixel_x=rand(-16,16)
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=0.8*StaffPower
				A.Offense=(src.Offense*src.OffenseMultiplier)
				A.Elemental="Fire"
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				for(var/mob/X in view(10,usr))
					if(X.MusicToggle=="On")
						X<<sound('kiblast.wav', repeat = 0, wait = 0, channel = 0, volume = 50)
				Z.Cooldown()



			if("StoneThrow")
				if(Z.Using)
					return
				EXP+=(EXPGains/100)*0.00004
				var/Drain=25/Z.Efficiency/ManaDrain
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.Beaming) return
				if(src.ManaAmount<=5) return
				flick("Blast",src)
				if(!src.Manakete)
					src.ManaAmount-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=1
				spawn((src.Refire/Z.Speed*(0.75/sqrt(Z.Level*Z.Level))*100)+1) src.Attacking=0
				Z.Skill_Increase()
				if(Z.Level<100)
					Z.Level=100
				//if(!prob(Z.Level)) return
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
//				A.pixel_y=rand(-16,16)
//				A.pixel_x=rand(-16,16)
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=1.75*StaffPower
				A.Offense=(src.Offense*src.OffenseMultiplier)
				A.Elemental="Earth"
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				for(var/mob/X in view(10,usr))
					if(X.MusicToggle=="On")
						X<<sound('kiblast.wav', repeat = 0, wait = 0, channel = 0, volume = 50)
				Z.Cooldown()

			if("Hadoken")
				if(Z.Using)
					return
				if(src.Attacking) return

				var/Distance=15
				if(src.AmatsukenPath=="Shoryuken")
					Distance-=5
				if(src.AmatsukenPath=="Tatsumaki")
					Distance-=8

				var/Drain=src.EnergyMax/75
				if(src.AmatsukenAscension=="Chikara no Hado")
					Drain=0
					Z.sicon='HadokenFlame.dmi'
				if(src.AmatsukenAscension=="Satsui no Hado")
					Drain*=0.5
					Z.sicon='HadokenSatsui.dmi'
				if(src.Energy < Drain)
					return
				src.Energy-=Drain

				flick("Blast",src)
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] yells: <b>HADOKEN!</b>"
				var/count=1
				if(src.SatsuiNoHado)
					count=2
				while(count)
					count--
					var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
					A.Distance=Distance
					A.dir=src.dir
					A.icon=Z.sicon
					A.icon_state=Z.sicon_state
					A.Owner=src
					A.Lethality=src.Lethal
					A.Damage_Multiplier=1.5
					A.Sekiha=1
					A.Hadoken=1
					A.Offense=(src.Offense*src.OffenseMultiplier)

					var/obj/Projectiles/Mystical/B=new(get_step(src,src.dir))
					B.Distance=Distance
					B.dir=src.dir
					B.icon=Z.sicon
					B.icon_state=Z.sicon_state
					B.Owner=src
					B.Lethality=src.Lethal
					B.Damage_Multiplier=1.5
					B.Sekiha=1
					B.Hadoken=1
					B.Offense=(src.Offense*src.OffenseMultiplier)

					var/obj/Projectiles/Mystical/C=new(get_step(src,src.dir))
					C.Distance=Distance
					C.dir=src.dir
					C.icon=Z.sicon
					C.icon_state=Z.sicon_state
					C.Owner=src
					C.Lethality=src.Lethal
					C.Damage_Multiplier=1.5
					C.Sekiha=1
					C.Hadoken=1
					C.Offense=(src.Offense*src.OffenseMultiplier)

					spawn
						if(B)
							step(B,turn(B.dir,90))
						if(C)
							step(C,turn(C.dir,-90))
						if(A)
							walk(A,A.dir)
							if(B)walk(B,A.dir)
							if(C)walk(C,A.dir)

				if(src.AmatsukenAscension=="Chikara no Hado")
					Z.Cooldown=10

				Z.Cooldown()

			if("ExHadoken")
				if(Z.Using)
					return
				if(src.Attacking) return

				var/Drain=(src.EnergyMax/75)*2
				if(src.AmatsukenAscension=="Chikara no Hado")
					Drain=0
					Z.sicon='HadokenFlame.dmi'
				if(src.AmatsukenAscension=="Satsui no Hado")
					Drain*=0.5
					Z.sicon='HadokenSatsui.dmi'
				if(src.Energy < Drain)
					return
				src.Energy-=Drain

				flick("Blast",src)
				var/Distance=30
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] yells: <b>EX-HADOKEN!</b>"
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=3
				A.Sekiha=1
				A.ExHadoken=1
				A.Offense=(src.Offense*src.OffenseMultiplier)

				var/obj/Projectiles/Mystical/B=new(get_step(src,src.dir))
				B.Distance=Distance
				B.dir=src.dir
				B.icon=Z.sicon
				B.icon_state=Z.sicon_state
				B.Owner=src
				B.Lethality=src.Lethal
				B.Damage_Multiplier=3
				B.Sekiha=1
				B.ExHadoken=1
				B.Offense=(src.Offense*src.OffenseMultiplier)

				var/obj/Projectiles/Mystical/C=new(get_step(src,src.dir))
				C.Distance=Distance
				C.dir=src.dir
				C.icon=Z.sicon
				C.icon_state=Z.sicon_state
				C.Owner=src
				C.Lethality=src.Lethal
				C.Damage_Multiplier=3
				C.Sekiha=1
				C.ExHadoken=1
				C.Offense=(src.Offense*src.OffenseMultiplier)

				spawn
					if(B)
						step(B,turn(B.dir,90))
					if(C)
						step(C,turn(C.dir,-90))
					if(A)
						walk(A,A.dir)
						if(B)walk(B,A.dir)
						if(C)walk(C,A.dir)

				if(src.AmatsukenAscension=="Chikara no Hado")
					Z.Cooldown=90

				Z.Cooldown()

			if("ShinkuHadoken")
				if(world.realtime < (Z:LastUse+(600*60*24)))
					src << "You cannot use this technique again yet."
					return
				if(src.Attacking) return

				var/Drain=(src.EnergyMax/75)*5
				if(src.AmatsukenAscension=="Chikara no Hado")
					Drain=0
					Z.sicon='HadokenFlame.dmi'
				if(src.AmatsukenAscension=="Satsui no Hado")
					Drain*=0.5
					Z.sicon='HadokenSatsui.dmi'
				if(src.Energy < Drain)
					return
				src.Energy-=Drain

				for(var/mob/m in view(12, src))
					m.Frozen=1

				var/icon/W=icon('Effects.dmi',"Shock")
				src.Shockwave(W, 2)
				spawn()DarknessFlash(src)

				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] yells: <b>SHINKU...</b>"
				src.Quake(16)
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] yells: <b>HADOOOOOOOOKEN!</b>"

				sleep(20)
				for(var/mob/m in view(12, src))
					m.Frozen=0

				flick("Blast",src)
				var/Distance=50


				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=5
				A.Sekiha=1
				A.ShinkuHadoken=1
				A.Offense=(src.Offense*src.OffenseMultiplier)

				var/obj/Projectiles/Mystical/B=new(get_step(src,src.dir))
				B.Distance=Distance
				B.dir=src.dir
				B.icon=Z.sicon
				B.icon_state=Z.sicon_state
				B.Owner=src
				B.Lethality=src.Lethal
				B.Damage_Multiplier=5
				B.Sekiha=1
				B.ShinkuHadoken=1
				B.Offense=(src.Offense*src.OffenseMultiplier)

				var/obj/Projectiles/Mystical/C=new(get_step(src,src.dir))
				C.Distance=Distance
				C.dir=src.dir
				C.icon=Z.sicon
				C.icon_state=Z.sicon_state
				C.Owner=src
				C.Lethality=src.Lethal
				C.Damage_Multiplier=5
				C.Sekiha=1
				C.ShinkuHadoken=1
				C.Offense=(src.Offense*src.OffenseMultiplier)

				spawn
					if(B)
						step(B,turn(B.dir,90))
					if(C)
						step(C,turn(C.dir,-90))
					if(A)
						walk(A,A.dir)
						if(B)walk(B,A.dir)
						if(C)walk(C,A.dir)

				Z:LastUse=world.realtime
			if("Shoryuken")
				if(Z.Using)
					return
				var/Drain = src.EnergyMax/20
				if(src.AmatsukenAscension=="Chikara no Hado")
					Drain=0
				if(src.AmatsukenAscension=="Satsui no Hado")
					Drain*=0.5
				if(src.Energy < Drain)
					return
				src.Energy-=Drain
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] yells: <b>SHORYUKEN!</b>"
				var/obj/o = new
				o.loc=src.loc
				o.dir = src.dir
				var
					ax=0
				while(ax<2)
					ax++
					step(o, o.dir)
					for(var/mob/m in o.loc)
						if(src==m)
							continue
						switch(src.AmatsukenPath)
							if("Hadoken")
								src.ShoryukenCount=rand(1,3)
							if("Shoryuken")
								src.ShoryukenCount=rand(1,5)
							if("Tatsumaki")
								src.ShoryukenCount=rand(1,4)
						src.Comboz(m)
						src.Melee(1,1)

				del o
				if(src.AmatsukenAscension=="Chikara no Hado")
					Z.Cooldown=20
				Z.Cooldown()
			if("ExShoryuken")
				if(Z.Using)
					return
				var/Drain = (src.EnergyMax/20)
				if(src.AmatsukenAscension=="Chikara no Hado")
					Drain=0
				if(src.AmatsukenAscension=="Satsui no Hado")
					Drain*=0.5
				if(src.Energy < Drain)
					return
				src.Energy-=Drain
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] yells: <b>EX-SHORYUKEN!</b>"
				var/obj/o = new
				o.loc=src.loc
				o.dir = src.dir
				var/x=0
				while(x<2)
					x++
					step(o, o.dir)
					for(var/mob/m in o.loc)
						if(src==o)
							continue
						src.ShoryukenCount=rand(2,7)
						src.ShoryukenBurn=1
						src.Comboz(m)
						src.Melee(1,1)
				del o

				src.ShoryukenBurn=0

				if(src.AmatsukenAscension=="Chikara no Hado")
					Z.Cooldown=90
				Z.Cooldown()
			if("Shoryureppa")
/*				Cooldown=120
				if(usr.Frozen||usr.Stunned||Using||usr.KO||usr.Knockbacked)
					return
				var
					ShoryukenHits=rand(7,12)

					DashDash=3
					mob/ShorTarget
					LockedDir=usr.dir
				Cooldown()
				while(DashDash>0)
					sleep(1)
					DashDash--
					step(usr,LockedDir)
					for(var/mob/P in get_step(usr,usr.dir))
						if(ShorTarget)
						else
							ShorTarget=P
							DashDash=0
				if(ShorTarget)
					var/Damage=0.90*(usr.Power*(usr.Strength*usr.StrengthMultiplier)*rand(5,30)/10)/(ShorTarget.Power*(ShorTarget.Endurance*ShorTarget.EnduranceMultiplier))

					Create_Shadow(usr)
					Create_Shadow(ShorTarget)
					var/matrix/State1=matrix()
					State1.Scale(0.85,0.425)
					animate(ShorTarget:Shadow,transform=State1,alpha=190)
					animate(usr:Shadow,transform=State1,alpha=190)
					var

						TargetZ=ShorTarget:pixel_z

						NewZ=TargetZ
					if(TargetZ>usr.pixel_z)
						usr.Frozen=1
						ShorTarget.Frozen=1
						usr.pixel_z=TargetZ-1
					var
						HitNum=1
						ShoryuDelay=1.5
					Stun(usr,0.8)
					Stun(ShorTarget,0.8)
				/*	for(var/mob/E in hearers(12,usr))
						for(var/obj/Communication/C in usr)
							E<<"<font color=[C.Text_Color]>[usr] yells: <b>SHO-</b>"*/
					usr:Quake(8)
					KenShockwave(ShorTarget,Size=2)
				/*	for(var/mob/E in hearers(12,usr))
						for(var/obj/Communication/C in usr)
							E<<"<font color=[C.Text_Color]>[usr] yells: <b>-RYUKEN!!!</b>"*/

					KenShockwave(ShorTarget,Size=2)
					var/obj/Effects/ShoryukenEffect/SE=new
					SE.loc=usr.loc
					animate(SE,alpha=0)
					animate(SE,alpha=255,time=1.5)
					flick("Appear",SE)
					while(ShoryukenHits>0)

						Damage=BlockDamage(ShorTarget,Damage)
						ShorTarget.Health-=Damage
						Injure(ShorTarget,Damage)
						animate(ShorTarget:Shadow,transform=State1/sqrt(HitNum),alpha=190/sqrt(HitNum),time=ShoryuDelay)
						animate(usr:Shadow,transform=State1/sqrt(HitNum),alpha=190/sqrt(HitNum),time=ShoryuDelay)

						animate(ShorTarget,pixel_z=NewZ+15,ShoryuDelay)
						animate(usr,pixel_z=NewZ+13,ShoryuDelay)
						animate(SE,pixel_z=NewZ,ShoryuDelay)
						Stun(usr,1)
						Stun(ShorTarget,2)
						HitEffect(ShorTarget)
						KenShockwave(ShorTarget,Size=0.5)
						sleep(ShoryuDelay)
						usr.dir=turn(usr.dir,90)
						NewZ=ShorTarget:pixel_z
						ShoryukenHits--
						HitNum++
					flick("Vanish",SE)
					animate(SE,alpha=0,time=1.5)
					spawn(1.5)
						del SE
					if(ShorTarget.Health<=0&&!ShorTarget.KO) ShorTarget.Unconscious(usr)
					animate(ShorTarget,pixel_z=NewZ+4,time=4)
					animate(usr,pixel_z=NewZ+2,time=4)
					sleep(4)
					animate(ShorTarget,pixel_z=1,time=7.5)
					animate(usr,pixel_z=1,time=5.5)
					spawn(2.5)
						usr.Frozen=0
						usr.Flying=0
						ShorTarget:Flying=0
						RemoveShadow(ShorTarget)
						RemoveShadow(usr)
*/


				var/Drain=src.EnergyMax/5
				if(src.AmatsukenAscension=="Chikara no Hado")
					Drain=0
				if(src.AmatsukenAscension=="Satsui no Hado")
					Drain*=0.5
				if(src.Energy < Drain)
					return
				src.Energy-=Drain
				if(world.realtime < (Z:LastUse+(600*60*24)))
					src << "You cannot use this technique again yet."
					return
				var/found=0
				var/mob/Trg

				var/obj/o = new(src.loc)
				step(o, src.dir)
				for(var/mob/m in o.loc)
					if(m==src)
						continue
					if(m)
						Trg=m
				if(!Trg)
					step(o, src.dir)
					for(var/mob/m in o.loc)
						if(m==src)
							continue
						if(m)
							Trg=m
				if(Trg)
					found=1
					src.ShoryukenCount=rand(1,5)
					src.ShoryukenQuake=1
					src.Comboz(Trg)
					src.Melee(1,1)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>SHO...</b>"
					sleep(10)
					src.ShoryukenCount=rand(2,7)
					src.ShoryukenBurn=1
					src.ShoryukenQuake=1
					src.Comboz(Trg)
					src.Melee(1,1)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>...RYU...</b>"
					sleep(10)
					src.ShoryukenCount=rand(4,8)
					src.ShoryukenBurn=1
					src.ShoryukenQuake=1
					src.Shoryureppa=1
					src.Comboz(Trg)
					src.Melee(1,1)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>...REPPAAAAAAAA!</b>"
					src.Shoryureppa=0
					src.ShoryukenQuake=0
					src.ShoryukenBurn=0

				if(found)
					Z:LastUse = world.realtime

			if("Tatsumaki")
				if(Z.Using)
					return
				var/found=0
				for(var/obj/Items/Sword/s in src)
					if(s.suffix)
						found=1
						break
				if(found)
					src << "You Tatsucan't Tatsumaki with a Tatsusword equipped."
					return
				spawn()Z.Cooldown()
				var/Drain=(src.EnergyMax/20)
				if(src.AmatsukenAscension=="Chikara no Hado")
					Drain=0
				if(src.AmatsukenAscension=="Satsui no Hado")
					Drain*=0.5
				if(src.Energy < Drain)
					return
				src.Energy-=Drain

				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] yells: <b>TATSUMAKI...</b>"

				var/triggered=0
				var/Distance
				switch(src.AmatsukenPath)
					if("Hadoken")
						Distance=3
					if("Shoryuken")
						Distance=3
					if("Tatsumaki")
						Distance=6
					else
						Distance=4
				while(Distance)
					if(src.AmatsukenAscension=="Chikara no Hado")
						for(var/mob/m in oview(5, src))
							var/Dir = get_dir(m, src)
							step(m, Dir)
					Distance--
					for(var/mob/P in view(src,1))
						var/Accuracy=(((src.Offense*src.OffenseMultiplier)*src.Power)/((P.Defense*P.DefenseMultiplier)*P.Power))*50
						if(P!=src)
							if(!triggered)
								triggered=1
								var/TatsumakiCount=rand(1,3)
								while(TatsumakiCount)
									TatsumakiCount--
									if(!prob(Accuracy_Formula(src,P,Accuracy)))
										Accuracy=0
									if(prob(Accuracy)&&!P.GER)
										P.Knockback(3,src)
										var/KnockbackDir=pick(-45,45)

										var/Damage=src.StrVsEnd(P, 3)
										if(!prob(Accuracy_Formula(src,P,10)))
											Damage/=rand(3,7)/5

										P.dir=turn(src.dir, KnockbackDir)
										if(src.DiplomaticImmunity || P.DiplomaticImmunity)
											Damage*=0
										if(src.AmatsukenPath && src.AmatsukenPath!="Tatsumaki")
											Damage*=0.9
										if(src.AmatsukenPath=="Tatsumaki")
											Damage*=1.1
										if(src.AmatsukenAscension=="Satsui no Hado")
											P.Burning+=0.1
											P.dir = turn(get_dir(P, src), 180)
										P.Health-=Damage
					step(src, src.dir)
					sleep(2.5)

				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] yells: <b>...SENPUKYAKU!!!</b>"

				if(src.AmatsukenAscension=="Chikara no Hado")
					Z.Cooldown=35
//				Z.Cooldown()
			if("ExTatsumaki")
				if(Z.Using)
					return
				spawn()Z.Cooldown()
				var/Drain=(src.EnergyMax/20)*2.5
				if(src.AmatsukenAscension=="Chikara no Hado")
					Drain=0
				if(src.AmatsukenAscension=="Satsui no Hado")
					Drain*=0.5
				if(src.Energy < Drain)
					return
				src.Energy-=Drain

				var/triggered=0
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] yells: <b>EX...</b>"

				for(var/mob/P in view(src,2))
					var/Accuracy=(((src.Offense*src.OffenseMultiplier)*src.Power)/((P.Defense*P.DefenseMultiplier)*P.Power))*50
					if(P!=src)
						if(!triggered)
							triggered=1
							var/TatsumakiCount=rand(3,5)
							while(TatsumakiCount)
								TatsumakiCount--

								if(!prob(Accuracy_Formula(src,P,Accuracy)))
									Accuracy=0
								if(prob(Accuracy)&&!P.GER)
									var/Damage=src.StrVsEnd(P, 5)
									if(!prob(Accuracy_Formula(src,P,10)))
										Damage/=rand(3,7)
									if(src.DiplomaticImmunity || P.DiplomaticImmunity)
										Damage*=0
									if(TatsumakiCount==0 && triggered)
										step_towards(P,src)
										sleep(1)
										var/KBDir=turn(src.dir, rand(45, -45))
										P.Knockback(6, KBDir)
									P.Health-=Damage

				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] yells: <b>...TATSUMAKI!!!</b>"

				if(src.AmatsukenAscension=="Chikara no Hado")
					Z.Cooldown=90
//				Z.Cooldown()

			if("ShinkuTatsumaki")
				if(world.realtime < (Z:LastUse+(600*60*24)))
					src << "You cannot use this technique again yet."
					return
				var/Drain=(src.EnergyMax/20)*5
				if(src.AmatsukenAscension=="Chikara no Hado")
					Drain=0
				if(src.AmatsukenAscension=="Satsui no Hado")
					Drain*=0.5
				if(src.Energy < Drain)
					return
				src.Energy-=Drain

				var/triggered=0
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] yells: <b>SHIN...</b>"
				sleep(2)
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] yells: <b>KU...</b>"
				sleep(2)
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] yells: <b>TAT...</b>"
				sleep(2)
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] yells: <b>SU...</b>"
				sleep(2)
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] yells: <b>MAKI---</b>"

				var/Distance=7
				while(Distance)
					if(src.AmatsukenAscension=="Chikara no Hado")
						for(var/mob/m in oview(5, src))
							var/Dir = get_dir(m, src)
							step(m, Dir)
					Distance--
					for(var/mob/P in view(src,1))
						if(P!=src)
							if(!triggered)
								triggered=1
								src.SunlightYellowOverdrive=30
								src.ShinkuTatsumaki=1
								src.dir=get_dir(src, P)
								src.Melee(1,1)
								break

					step(src, src.dir)
					sleep(1)

				Z:LastUse = world.realtime
			if("CleanseSatsui")
				var/list/options = list()
				for(var/mob/m in get_step(src, src.dir))
					options+=m
				var/mob/Choice = input("Who do you want to cleanse?", "Cleanse Satsui") in options
				if(Choice.KO)
					for(var/obj/Skills/Buffs/SatsuiCorruption/s in Choice)
						if(s.BuffUsing)
							Choice.BuffX("SatsuiCorruption", s)
						del s
					Choice << "You've been forcefully cleansed of your corruption."
				else
					var/choice = input(Choice, "Do you want to allow [src] to cleanse you of your Satsui Corruption?", "Cleanse Satsui") in list("Yes", "No")
					if(choice=="Yes")
						for(var/obj/Skills/Buffs/SatsuiCorruption/s in Choice)
							if(s.BuffUsing)
								Choice.BuffX("SatsuiCorruption", s)
							del s
						Choice << "You've been cleansed of your corruption."
					else
						src << "[Choice] has denied your offer."

			if("InfectSatsui")
				var/list/options = list()
				for(var/mob/m in get_step(src, src.dir))
					options+=m
				var/mob/Choice = input("Who do you want to infect?", "Infect Satsui") in options
				if(Choice.KO)
					Choice.contents+=new/obj/Skills/Buffs/SatsuiCorruption
					Choice << "You have been forcefully infected with the Satsui Corruption."
					Choice << "You find that victory is now the most important thing in life..."
					Choice << "In fact, it surpasses life itself!"
				else
					var/choice = input(Choice, "Do you want to relinquish everything and place victory above all in order for greater power?", "Satsui Corruption") in list("Yes", "No")
					if(choice=="Yes")
						Choice.contents+=new/obj/Skills/Buffs/SatsuiCorruption
						Choice << "You have been infected with the Satsui Corruption."
						Choice << "You find that victory is now the most important thing in life..."
						Choice << "In fact, it surpasses life itself!"
					else
						src << "[Choice] has denied your offer."
			if("RagingDemon")
				if(Z.Using)
					return

				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] yells: <b>Shun...</b>"

				for(var/mob/m in view(12, src))
					m.Frozen=1

				var/Distance=16
				while(Distance)
					Distance--
					step(src, src.dir)
					sleep(1)
					for(var/mob/m in view(1, src))
						if(m&&src!=m)
							for(var/mob/E in hearers(12,src))
								for(var/obj/Communication/C in src)
									E<<"<font color=[C.Text_Color]>[src] yells: <b>GOKU...</b>"
							var/obj/x=new/obj/Taiyoken
							for(var/turf/T in Turf_Circle(m,8))
								if(prob(1)) sleep(0.005)
								x.layer=MOB_LAYER+1
								x.icon_state=pick("1","2","3","4","5","6","7")
								T.overlays+=x
								spawn(rand(1,2))T.overlays+=x
								spawn(rand(2,3))T.overlays+=x
								spawn(rand(3,4))T.overlays+=x
								spawn(rand(1,2))T.overlays-=x
								spawn(rand(2,3))T.overlays-=x
								spawn(rand(3,4))T.overlays-=x
								spawn(rand(1,2))T.overlays-=x
								spawn(rand(3,4))T.overlays-=x
								spawn(rand(4,8)) Destroy(T,500)
							var/punches=16
							var/icon/W=icon('Effects.dmi',"Shock")
							var/turf/starting = src.loc
							var/Dir = get_dir(src, m)
							while(punches)
								punches--
								src.Comboz(m)
								flick("Attack", src)
								src.Shockwave(W, 16-punches)
								m.Health-=src.StrVsEnd(m,16-punches)
								sleep(1)
							var/obj/o = new(starting)
							step(o, Dir)
							step(o, Dir)
							src.loc = o.loc
							del o
							for(var/mob/E in hearers(12,src))
								for(var/obj/Communication/C in src)
									E<<"<font color=[C.Text_Color]>[src] yells: <b>SATSU!!!!</b>"
							if(m.KO)
								src.Anger+=m.AngerMax
							break
				for(var/mob/m in view(50, src))
					m.Frozen=0
				Z.Cooldown()
			if("ComboFinisher")
				if(Z.Using)
					return
				if(!src.Target)
					src << "You need a target for this skill."
					return
				if(src.ComboPlusNumber>=10)
					var/DamageMult=1+(ComboPlusNumber/20)
					DamageMult*=1+(0.1*(src.Target.Health%50))
					if(src.HasKeyblade("Light", 4)&&src.DiveWeapon=="Sword")
						DamageMult*=1.5
					if(src.HasKeyblade("Semi-Divine", 4))
						DamageMult*=1.75
					if(src.HasKeyblade("Divine", 4))
						DamageMult*=2
					src.Comboz(src.Target)
					src.Melee(DamageMult,1)
					src.ComboPlusNumber=0
				Z.Cooldown()
			if("CaptainPlanet")
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					var/image/Earth=image(icon='Planets.dmi', icon_state="Earth", pixel_x=96, pixel_y=96)
					var/image/Veget=image(icon='Planets.dmi', icon_state="Vegeta", pixel_x=128, pixel_y=-32)
					var/image/Arconia=image(icon='Planets.dmi', icon_state="Arconia", pixel_x=96, pixel_y=-160)
					var/image/Ice=image(icon='Planets.dmi', icon_state="Ice", pixel_x=-160, pixel_y=96)
					var/image/Namek=image(icon='Planets.dmi', icon_state="Namek", pixel_x=-192, pixel_y=-32)
					var/image/Sanctuary=image(icon='Planets.dmi', icon_state="Sanctuary", pixel_x=-160, pixel_y=-160)
					src.overlays+=Earth
					src.overlays+=Veget
					src.overlays+=Arconia
					src.overlays+=Ice
					src.overlays+=Namek
					src.overlays+=Sanctuary
				else
					Z.BuffUsing=0
					var/image/Earth=image(icon='Planets.dmi', icon_state="Earth", pixel_x=96, pixel_y=96)
					var/image/Veget=image(icon='Planets.dmi', icon_state="Vegeta", pixel_x=128, pixel_y=-32)
					var/image/Arconia=image(icon='Planets.dmi', icon_state="Arconia", pixel_x=96, pixel_y=-160)
					var/image/Ice=image(icon='Planets.dmi', icon_state="Ice", pixel_x=-160, pixel_y=96)
					var/image/Namek=image(icon='Planets.dmi', icon_state="Namek", pixel_x=-192, pixel_y=-32)
					var/image/Sanctuary=image(icon='Planets.dmi', icon_state="Sanctuary", pixel_x=-160, pixel_y=-160)
					src.overlays-=Earth
					src.overlays-=Veget
					src.overlays-=Arconia
					src.overlays-=Ice
					src.overlays-=Namek
					src.overlays-=Sanctuary

mob/proc/BuffX(var/Wut,var/obj/Skills/Z,var/bypass=0)
	if(Z)
		if(!locate(Z) in src)
			return
	if(src.Stunned)
		return
/*	var/ManaDrain=1
	var/StaffPower=1
	var/Element=0
	for(var/obj/Items/Enchantment/Staff/N in src) if (N.suffix)
		ManaDrain=N.Mana_Drain
		StaffPower=N.Staff_Power
		Element=N.Element*/
	if(bypass||Z)
		switch(Wut)
			if("Infuse")
				if(!Z.BuffUsing)
					if(Z.Level != 0)
						Z.Level=0
					var/list/options=list()
					options.Add("Cancel")
					if(src.GetTransUnlocked()>=1)
						options.Add("Pulse")
					if(src.GetTransUnlocked()>=2)
						options.Add("Enlightenment")
					if(src.GetTransUnlocked()>=3)
						options.Add("Nirvana")
					var/choice=input(src, "What level of Mana Infusion do you want to use?", "Infuse") in options
					if(choice=="Cancel")
						return
					Z.BuffUsing=1
					src.ManaInfusing=1
					if(choice=="Pulse")
						Z.Level=1
					if(choice=="Enlightenment")
						Z.Level=2
					if(choice=="Nirvana")
						Z.Level=3
					if(Z.Level==1)
						src.Ascend(src.BaseMod*2)
						src.ManaMax*=2
						src.ManaAmount*=2
						src.SpeedMultiplier*=1.1
						src.ForceMultiplier*=1.25
						src.ResistanceMultiplier*=1.25
						src.RecoveryMultiplier*=1.2
					if(Z.Level==2)
						src.Ascend(src.BaseMod*2.5)
						src.PlusPower+=7000000//7 mil
						src.ManaMax*=2
						src.ManaAmount*=2
						src.SpeedMultiplier*=1.15
						src.ForceMultiplier*=1.35
						src.ResistanceMultiplier*=1.35
						src.RecoveryMultiplier*=1.25
						src.Enlightenment=1
					if(Z.Level==3)
						src.Ascend(src.BaseMod*5)
						src.PlusPower+=30000000//30 mil
						src.ManaMax*=2
						src.ManaAmount*=2
						src.SpeedMultiplier*=1.25
						src.ForceMultiplier*=1.5
						src.ResistanceMultiplier*=1.5
						src.RecoveryMultiplier*=1.3
						src.Nirvana=1
				else
					Z.BuffUsing=0
					src.ManaInfusing=0
					if(Z.Level==1)
						src.Ascend(src.BaseMod/2)
						src.ManaMax/=2
						src.ManaAmount/=2
						src.SpeedMultiplier/=1.1
						src.ForceMultiplier/=1.25
						src.ResistanceMultiplier/=1.25
						src.RecoveryMultiplier/=1.2
					if(Z.Level==2)
						src.Ascend(src.BaseMod/2.5)
						src.PlusPower-=7000000//7 mil
						src.ManaMax/=2
						src.ManaAmount/=2
						src.SpeedMultiplier/=1.15
						src.ForceMultiplier/=1.35
						src.ResistanceMultiplier/=1.35
						src.RecoveryMultiplier/=1.25
						src.Enlightenment=0
					if(Z.Level==3)
						src.Ascend(src.BaseMod/5)
						src.PlusPower-=30000000//30 mil
						src.ManaMax/=2
						src.ManaAmount/=2
						src.SpeedMultiplier/=1.25
						src.ForceMultiplier/=1.5
						src.ResistanceMultiplier/=1.5
						src.RecoveryMultiplier/=1.3
						src.Nirvana=0
					Z.Level=0
			if("TimeAlter")
				if(!src.TimeAlter)
					var/choice=input(src, "What level of Time Magic would you like to use?", "Time Alter") in list("Cancel","Double Accel","Triple Accel","Square Accel")
					if(choice=="Cancel")
						return
					if(choice=="Double Accel")
						src.TimeAlter=1
						src.TimeAlterType="Double Accel"
						src.SpeedMultiplier*=2
						src.OffenseMultiplier*=2
						src.DefenseMultiplier*=2
					if(choice=="Triple Accel")
						src.TimeAlter=1
						src.TimeAlterType="Triple Accel"
						src.SpeedMultiplier*=3
						src.OffenseMultiplier*=3
						src.DefenseMultiplier*=3
					if(choice=="Square Accel")
						src.TimeAlter=1
						src.TimeAlterType="Square Accel"
						src.SpeedMultiplier*=4
						src.OffenseMultiplier*=4
						src.DefenseMultiplier*=4
				else
					if(src.TimeAlterType=="Double Accel")
						src.TimeAlter=0
						src.TimeAlterType=0
						src.SpeedMultiplier/=2
						src.OffenseMultiplier/=2
						src.DefenseMultiplier/=2
					if(src.TimeAlterType=="Triple Accel")
						src.TimeAlter=0
						src.TimeAlterType=0
						src.SpeedMultiplier/=3
						src.OffenseMultiplier/=3
						src.DefenseMultiplier/=3
					if(src.TimeAlterType=="Square Accel")
						src.TimeAlter=0
						src.TimeAlterType=0
						src.SpeedMultiplier/=4
						src.OffenseMultiplier/=4
						src.DefenseMultiplier/=4

			if("Forcepalm")
				if(!Z.Using)
					var/obj/Items/Sword/s
					for(var/obj/Items/Sword/z in src)
						if(z.suffix)
							s=z
					if(s)
						src << "You can't do this with a sword..."
						return
					src.Frozen=1
					src.OMessage(10, "[src] thrusts their body forward to slam into their opponent!", "[src]([src.key]) used Forcepalm.")
					spawn()new/obj/Tipper(src)
					src.Frozen=0
					Z.Cooldown=20
					Z.Cooldown()

			if("Headbutt")
				if(!Z.Using)
					var/found=0
					for(var/obj/Items/Sword/s in src)
						if(s.suffix)
							found=1
							break
					if(found)
						src << "Come on.  The sword doesn't even have a head."
						return
					src.Headbutt=1
					src << "Your next strike will be a headbutt."
					Z.Cooldown()
			if("WhirlwindStrike")
				if(!Z.Using)
					var/found=0
					for(var/obj/Items/Sword/s in src)
						if(s.suffix)
							found=1
							break
					if(found)
						src << "How can you possibly whirlwind strike with a sword in your hand?  It just doesn't make sense."
						return
					src.WhirlwindStrike=1
					src<<"Your next strike will cause a whirlwind."
					Z.Cooldown()
			if("SpinAttack")
				if(!Z.Using)
					var/obj/Items/Sword/s
					for(var/obj/Items/Sword/z in src)
						if(z.suffix)
							s=z
					if(!s)
						src << "You need a sword to spin to win."
						return
					Z.Cooldown()
					src.OMessage(10, "[src] holds their sword out as energy begins to charge within it...", "[src] started to use Spin Attack.")
					src.Frozen=1
					sleep(15)
					src.Frozen=0
					src.OMessage(10, "[src] unleashes a devestating circle of destruction!", "[src] completed Spin Attack.")
					SweepingBlade(src, 3)
					for(var/mob/m in oview(3,src))
						m.Health-=src.StrVsEnd(m, s.Damage_Multiplier*GoCrand(1, 5))
						m.Knockback(pick(1,3,5)*5, src)
			if("Tipper")
				if(!Z.Using)
					var/obj/Items/Sword/s
					for(var/obj/Items/Sword/z in src)
						if(z.suffix)
							s=z
					if(!s)
						src << "You need a sword equipped to poke."
						return
					src.Frozen=1
					src.OMessage(10, "[src] thrusts their sword forward to pierce their enemy!", "[src]([src.key]) used Tipper.")
					spawn()new/obj/Tipper(src)
					src.Frozen=0
					Z.Cooldown=20
					Z.Cooldown()
			if("SSjGrade2")
				if(!Z.BuffUsing)
					if(src.ssj["active"]!=1)
						src << "You have to be in SSj one to utilize this form."
						return
					if(src.SSjGrade3)
						src << "You can't use Grade 2 and Grade 3 at the same time."
						return
					Z.BuffUsing=1
					src.SSjGrade2=1
					src.BaseMod*=1.5
					src.Base*=1.5
					src.PlusPower*=1.5
					src << "You ascend to Super Saiyan Grade 2."
				else
					Z.BuffUsing=0
					src.SSjGrade2=0
					src.BaseMod/=1.5
					src.Base/=1.5
					src.PlusPower/=1.5
					src << "You revert to your original Super Saiyan state."
					if(src.ssj["active"]<1)
						src.PlusPower=0
			if("SSjGrade3")
				if(!Z.BuffUsing)
					if(src.ssj["active"]!=1)
						src << "You have to be in SSj one to utilize this form."
						return
					if(src.SSjGrade2)
						src << "You can't use Grade 2 and Grade 3 at the same time."
						return
					Z.BuffUsing=1
					src.SSjGrade3=1
					src.BaseMod*=2
					src.Base*=2
					src.PlusPower*=2
					src.StrengthMultiplier*=2
					src.EnduranceMultiplier*=2
					src.ResistanceMultiplier*=2
					src.SpeedMultiplier*=0.4
					src.OffenseMultiplier*=0.5
					src.DefenseMultiplier*=0.5
					src << "You ascend to Super Saiyan Grade 3."
				else
					Z.BuffUsing=0
					src.SSjGrade3=0
					src.BaseMod/=2
					src.Base/=2
					src.PlusPower/=2
					src.StrengthMultiplier/=2
					src.EnduranceMultiplier/=2
					src.ResistanceMultiplier/=2
					src.SpeedMultiplier/=0.4
					src.OffenseMultiplier/=0.5
					src.DefenseMultiplier/=0.5
					src << "You revert to your normal Super Saiyan state."
					if(src.ssj["active"]<1)
						src.PlusPower=0
			if("SixthSense")
				if(Z.BuffUsing)
					Z.BuffUsing=0
					src.sight=0
					src.OMessage(10,"[src]'s eyes revert to normal.","<font color=red>[src]([src.key]) deactivated Sixth Sense.")
				else
					Z.BuffUsing=1
					src.sight=666
					src.OMessage(10,"[src]'s pupils begin to pulsate with a strange, golden energy.","<font color=red>[src]([src.key]) activated Sixth Sense.")
			if("RefineUBW")
				if(src.UBWLevel > Z:LastMod)
					src << "You've advanced in your creation of blades."
					while(Z:LastMod<src.UBWLevel)
						Z:LastMod++
						if(Z:LastMod==1)
							src << "You are the bone of your sword."
							src << "Steel is your body, and fire is your blood."
							src.contents+=new/obj/Skills/Buffs/Reinforcement
							src.Recovery*=1.1
							src.ManaMax*=1.1
						if(Z:LastMod==2)
							src << "You have created over a thousand blades."
							src.contents+=new/obj/Skills/Buffs/Projection
							src.contents+=new/obj/Skills/Rank/MakeBlade
							src.Recovery*=1.1
							src.ManaMax*=1.1
						if(Z:LastMod==3)
							var/choice = input(src, "How do you view life?  Define yourself in a statement.", "UBW") in list("I'll never give up.", "I can only save the few people I care about.")
							if(choice=="I can only save the few people I care about.")
								src << "Unknown to death..."
								src << "Nor known to life."
								src.CounterGuardian=1
								src.StrengthMod*=1.5
								src.ForceMod*=1.5
								src.Recovery*=1.2
								src.ManaMax*=1.2
								src.contents+=new/obj/Skills/KakuyokuSanren
							if(choice=="I'll never give up.")
								src << "Unaware of loss..."
								src << "Nor aware of gain."
								src.MadeOfSwords=1
								src.EnduranceMod*=1.5
								src.ResistanceMod*=1.5
								src.Recovery*=1.2
								src.ManaMax*=1.2
						if(Z:LastMod==4)
							if(src.CounterGuardian)
								src << "Have withstood pain to create many weapons..."
								src << "Yet, those hands will never hold anything."
								src.contents+=new/obj/Skills/Buffs/BrokenPhantasm
								src.contents+=new/obj/Skills/RhoAias
								src.Recovery*=1.2
								src.ManaMax*=1.25
							if(src.MadeOfSwords)
								src << "Have withstood pain to create weapons..."
								src << "Waiting for one's arrival, I have no regrets."
								src.contents+=new/obj/Skills/RhoAias
								src.contents+=new/obj/Skills/Buffs/Avalon
								src.PerfectProjection=1
								src.Recovery*=1.2
								src.ManaMax*=1.25
						if(Z:LastMod==5)
							src << "You have fully realized Unlimited Blade Works..."
							src.contents+=new/obj/Skills/UnlimitedBladeWorks
							src.ManaMax*=1.5
							if(src.CounterGuardian)
								src.contents+=new/obj/Skills/Caladbolg
							if(src.MadeOfSwords)
								src.contents+=new/obj/Skills/NineLivesBladeWorks

				else
					src << "Your creation skills are still the same."
			if("Reinforcement")
				if(!Z.BuffUsing)
			//		if(src.ActiveBuffs)
			//			src << "You can't use this with other slotted buffs."
			//			return
					var/found=0
					for(var/obj/Items/Sword/s in src)
						if(s.suffix)
							found=1
							s.Damage_Multiplier+=(src.UBWLevel*0.2)
							s.Accuracy_Multiplier+=(src.UBWLevel*0.2)
							s.Delay_Multiplier+=(src.UBWLevel*0.2)
							s.ShatterTier=0
					if(!found)
						src << "You need a sword equipped to use this buff."
						return
			//		src.ActiveBuffs=3
					Z.BuffUsing=1
					src.Power_Multiplier+=0.2
					src.OMessage(10, "[src] feeds mana into their weapon to reinforce it!", "[src]([src.key]) used Reinforcement.")
				else
			//		src.ActiveBuffs=0
					Z.BuffUsing=0
					src.Power_Multiplier-=0.2
					src.OMessage(10, "[src] cuts off their flow of mana to their weapon.", "[src]([src.key]) deactivated Reinforcement.")
					for(var/obj/Items/Sword/s in src)
						if(s.suffix)
							s.Damage_Multiplier-=(src.UBWLevel*0.2)
							s.Accuracy_Multiplier-=(src.UBWLevel*0.2)
							s.Delay_Multiplier-=(src.UBWLevel*0.2)
							s.ShatterTier=5
			if("Projection")
				if(!Z.BuffUsing)
					if(Z:Lockout)
						src << "No spam pls."
						return
					var/obj/Items/Sword/found
					for(var/obj/Items/Sword/s in src)
						if(s.suffix)
							found=s
					if(!found)
						src << "You need to have a sword equipped to project a legendary technique onto."
						return
					Z:Lockout=1
					var/list/options = list("Cancel")
					if(src.ProjectDualWield)
						options+="Dual Wield"
					if(src.ProjectExcalibur)
						options+="Excalibur"
					if(src.ProjectMuramasa)
						options+="Muramasa"
					if(src.ProjectTriWield)
						options+="Triple Wield"
					if(src.ProjectLightbringer)
						options+="Lightbringer"
					if(src.ProjectDeathbringer)
						options+="Deathbringer"
					if(options.len > 1)
						var/choice=input(src, "What weapon do you want to project?", "Projection") in options
						switch(choice)
							if("Cancel")
								src << "Cancelled projection."
								if(options.len == 1)
									src << "You haven't seen any legendary techniques to project."
								Z:Lockout=0
								src.ActiveBuffs=0
								return
							if("Dual Wield")
								src.OMessage(10, "[src] manifests two curved blades, paired to form a yin-yang.", "[src]([src.key]) used Projection (Dual Wield).")
								src.DualWield=1
								Z:Projection="Dual Wield"
							if("Excalibur")
								if(src.ActiveBuffs)
									if(src.SpecialSlot)
										src << "Your buff slots are completely full."
										Z:Lockout=0
										return
									else
										Z:UsedSpecial=1
										src.SpecialSlot=1
								else
									Z:UsedNormal=1
									src.ActiveBuffs=3
								src.OMessage(10, "[src] projects the golden sword of the victorious!", "[src]([src.key]) used Projection (Excalibur).")
								Z:Projection="Excalibur"
								if(!src.PerfectProjection)
									src.Power_Multiplier+=(0.75*0.8)
								else
									src.Power_Multiplier+=0.75
								Z:PreviousElement=found.EnchantType
								found.EnchantType="Holy"
								found.ShatterTier=0
							if("Muramasa")
								if(src.ActiveBuffs)
									if(src.SpecialSlot)
										src << "Your buff slots are completely full."
										Z:Lockout=0
										return
									else
										Z:UsedSpecial=1
										src.SpecialSlot=1
								else
									Z:UsedNormal=1
									src.ActiveBuffs=3
								src.OMessage(10, "[src] calls to hand the bane of blades!", "[src]([src.key]) used Projection (Muramasa).")
								Z:Projection="Muramasa"
								if(!src.PerfectProjection)
									src.Power_Multiplier+=(0.75*0.8)
								else
									src.Power_Multiplier+=0.75
								Z:PreviousElement=found.EnchantType
								found.EnchantType="Abyssal"
								found.ShatterTier=0
							if("Triple Wield")
								src.OMessage(10, "[src] manifests the three katanas of the world's greatest swordsman.", "[src]([src.key]) used Projection (Triple Wield).")
								src.TripleWield=1
								Z:Projection="Triple Wield"
							if("Lightbringer")
								if(src.ActiveBuffs)
									if(src.SpecialSlot)
										src << "Your buff slots are completely full."
										Z:Lockout=0
										return
									else
										Z:UsedSpecial=1
										src.SpecialSlot=1
								else
									Z:UsedNormal=1
									src.ActiveBuffs=3
								src.OMessage(10, "[src] projects the sword of promised victory!", "[src]([src.key]) used Projection (Lightbringer).")
								Z:Projection="Lightbringer"
								src.Power_Multiplier+=0.75
								Z:PreviousElement=found.EnchantType
								found.EnchantType="Ultima-Holy"
								found.ShatterTier=0
							if("Deathbringer")
								if(src.ActiveBuffs)
									if(src.SpecialSlot)
										src << "Your buff slots are completely full."
										Z:Lockout=0
										return
									else
										Z:UsedSpecial=1
										src.SpecialSlot=1
								else
									Z:UsedNormal=1
									src.ActiveBuffs=3
								src.OMessage(10, "[src] calls to hand the edge of life's end.", "[src]([src.key]) used Projection (Deathbringer).")
								Z:Projection="Deathbringer"
								src.Power_Multiplier+=0.75
								Z:PreviousElement=found.EnchantType
								found.EnchantType="Ultima-Darkness"
								found.ShatterTier=0
						Z:Lockout=0
						Z.BuffUsing=1
						if(src.CounterGuardian)
							found.Damage_Multiplier+=(src.UBWLevel*0.2)
							found.Delay_Multiplier+=(src.UBWLevel*0.2)
							found.Accuracy_Multiplier+=(src.UBWLevel*0.2)
					else
						src << "You haven't knowledge of any legendary weapons to project."
						Z:Lockout=0
						return
				else
					Z:BuffUsing=0
					var/obj/Items/Sword/found
					for(var/obj/Items/Sword/s in src)
						if(s.suffix)
							found=s
					switch(Z:Projection)
						if("Dual Wield")
							src.OMessage(10, "[src]'s twin blades fade away into onyx and ivory dust...", "[src]([src.key]) deactivated Projection (Dual Wield).")
							src.DualWield=0
						if("Excalibur")
							src.OMessage(10, "[src] casts away the golden sword of the victorious!", "[src]([src.key]) deactivated Projection (Excalibur).");
							if(Z:UsedSpecial)
								Z:UsedSpecial=0
								src.SpecialSlot=0
							else if(Z:UsedNormal)
								Z:UsedNormal=0
								src.ActiveBuffs=0
							if(!src.PerfectProjection)
								src.Power_Multiplier-=(0.75*0.8)
							else
								src.Power_Multiplier-=0.75
							found.EnchantType=Z:PreviousElement
							found.ShatterTier=10
						if("Muramasa")
							src.OMessage(10, "[src] discards the bane of blades.", "[src]([src.key]) deactivated Projection (Muramasa).");
							if(Z:UsedSpecial)
								Z:UsedSpecial=0
								src.SpecialSlot=0
							else if(Z:UsedNormal)
								Z:UsedNormal=0
								src.ActiveBuffs=0
							if(!src.PerfectProjection)
								src.Power_Multiplier-=(0.75*0.8)
							else
								src.Power_Multiplier-=0.75
							found.EnchantType=Z:PreviousElement
							found.ShatterTier=10
						if("Triple Wield")
							src.OMessage(10, "[src]'s set of three blades turn to dust and vanish upon the breeze.", "[src]([src.key]) deactivated Projection (Triple Wield).");
							src.TripleWield=0
						if("Lightbringer")
							src.OMessage(10, "[src] casts away the sword of certain victory!", "[src]([src.key]) deactivated Projection (Lightbringer).")
							if(Z:UsedSpecial)
								Z:UsedSpecial=0
								src.SpecialSlot=0
							else if(Z:UsedNormal)
								Z:UsedNormal=0
								src.ActiveBuffs=0
							src.Power_Multiplier-=0.75
							found.EnchantType=Z:PreviousElement
							found.ShatterTier=10
						if("Deathbringer")
							src.OMessage(10, "[src] discards the edge of life's end.", "[src]([src.key]) deactivated Projection (Deathbringer).")
							if(Z:UsedSpecial)
								Z:UsedSpecial=0
								src.SpecialSlot=0
							else if(Z:UsedNormal)
								Z:UsedNormal=0
								src.ActiveBuffs=0
							src.Power_Multiplier-=0.75
							found.EnchantType=Z:PreviousElement
							found.ShatterTier=10
					Z:Projection=null
					if(src.CounterGuardian)
						found.Damage_Multiplier-=(src.UBWLevel*0.2)
						found.Delay_Multiplier-=(src.UBWLevel*0.2)
						found.Accuracy_Multiplier-=(src.UBWLevel*0.2)


	/*		if("IonioiHetairoi")
				if(!src.InIH)
					if(!src.KingOfConquerors)
						src << "You do not have what it takes to make a reality marble..."
						return
					if(src.Alert("Are you sure you want to summon your loyal army?"))
						src.InIH=1
						for(var/turf/T in Turf_Circle(src,52))
							for(var/mob/M in view(0,T))
								if(M!=src)
									M<<"Your entire body is filled with a strange sensation as [src] begins speaking from their heart!"
									M.IHTarget=1
						var/icon/W=icon('Effects.dmi',"Shock")
						src.Shockwave(W, 3)
						Quake(10)
						src.Frozen=1
						sleep(5)
						src.IonioiChant()
						sleep(300)
						while(src.InIH)
							src.LOLWUT()
							sleep(30)
				else
					for(var/mob/M in world)
						if(M.IHTarget==1)
							M << "[src]'s reality marble crumbles before your very eyes...!?"
							sleep(10)
							M.loc = locate(M.PrevX, M.PrevY, M.PrevZ)
							M.PrevX=null
							M.PrevY=null
							M.PrevZ=null
							M.IHTarget=0
					src << "Ionioi Hetairoi cracks apart...!?"
					sleep(10)
					src.loc = locate(src.PrevX, src.PrevY, src.PrevZ)
					src.PrevX=null
					src.PrevY=null
					src.PrevZ=null
					src.InIH=0
					src.InIH2=0

			if("UnlimitedBladeWorks")
				if(!src.InUBW)
					if(!src.CounterGuardian&&!src.MadeOfSwords)
						src << "You do not have what it takes to make a reality marble..."
						return
					if(src.Alert("You sure you want to cast Unlimited Blade Works?"))
						src.InUBW=1
						for(var/turf/T in Turf_Circle(src,52))
							for(var/mob/M in view(0,T))
								if(M!=src)
									M<<"Your soul recoils from the massive outpour of mana radiating from [src]!"
									M.UBWTarget=1
						var/icon/W=icon('Effects.dmi',"Shock")
						src.Shockwave(W, 3)
						Quake(10)
						src.Frozen=1
						sleep(5)
						src.UBWChant()
						sleep(300)
						if(locate(/obj/Skills/Buffs/GatesOfBabylon,src.Target))
							src.UnlimitedBladeWorks(Z,Target)
					/*	else
							src.TrueUBW(Z)*/
						while(src.InUBW)
							src.LOLWUT()
							sleep(30)
				else
			/*		for(var/turf/T in Turf_Circle(src,150))
						for(var/mob/M in view(0,T))
							src.OMessage(100, "[src]'s reality marble crumbles before your very eyes, returning you to your previous location...", "[src]([src.key]) deactivated Unlimited Blade Works.")*/
					for(var/mob/M in world)
						if(M.UBWTarget==1)
							M << "[src]'s reality marble crumbles before your very eyes...!?"
							sleep(10)
							M.loc = locate(M.PrevX, M.PrevY, M.PrevZ)
							M.PrevX=null
							M.PrevY=null
							M.PrevZ=null
							M.UBWTarget=0
					src << "Unlimited Blade Works cracks apart...!?"
					sleep(10)
					src.loc = locate(src.PrevX, src.PrevY, src.PrevZ)
					src.PrevX=null
					src.PrevY=null
					src.PrevZ=null
					src.InUBW=0
					src.InUBW2=0 */

	/*		if("Caladbolg")
				if(Z.Using)
					return
				var/Drain=100/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.ManaAmount<=50) return
				Z.Using=1
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(5)
				src.Chargez("Remove")
				src.Attacking=0
				src.Beaming=0
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=99
				A.Explosive=1
				A.Deflectable=0
				A.Knockback=1
				A.Pushing=1
				A.Pierce=0
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.SuperExplosive=1
				A.Damage_Multiplier=75
				A.Offense=(src.Offense*src.OffenseMultiplier)*15
				spawn if(A) walk(A,A.dir)
				if(!src.Manakete)
					src.ManaAmount-=40
				Z.Cooldown()*/

			if("HeraclesFury")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs)
						src << "You can't use this with other slotted buffs active."
						return
					src.ActiveBuffs=3
					Z.BuffUsing=1
					src.overlays+=image(icon='Glowing Electricity.dmi')
					switch(src.AscensionsUnlocked)
						if(2)
							src.Ascend(src.BaseMod*3)
						if(3)
							src.Ascend(src.BaseMod*4)
						if(4)
							src.Ascend(src.BaseMod*5)
						if(5)
							src.Ascend(src.BaseMod*7.5)
						if(6)
							src.Ascend(src.BaseMod*10)
						if(7)
							src.Ascend(src.BaseMod*15)
				else
					src.ActiveBuffs=0
					Z.BuffUsing=0
					src.overlays-=image(icon='Glowing Electricity.dmi')
					switch(src.AscensionsUnlocked)
						if(2)
							src.Ascend(src.BaseMod/3)
						if(3)
							src.Ascend(src.BaseMod/4)
						if(4)
							src.Ascend(src.BaseMod/5)
						if(5)
							src.Ascend(src.BaseMod/7.5)
						if(6)
							src.Ascend(src.BaseMod/10)
						if(7)
							src.Ascend(src.BaseMod/15)
			if("Stand")
				if(!src.StandCry&&!StandAction&&!StandName)
					src << "You have to use StandCustom before this."
					return
				if(!Z.BuffUsing)
					if(src.SpecialSlot)
						src << "You're already using a special buff."
						return

					src.SpecialSlot=1
					Z.BuffUsing=1

					//src.Power_Multiplier+=0.5+((src.StandLevel-1)*0.25)
					src.StrengthMultiplier*=(1+(src.StandStrength*0.4))
					src.EnduranceMultiplier*=(1+(src.StandEndurance*0.4))
					src.SpeedMultiplier*=(1+(src.StandSpeed*0.4))
					src.ForceMultiplier*=(1+(src.StandForce*0.4))
					src.ResistanceMultiplier*=(1+(src.StandResistance*0.4))
					src.OffenseMultiplier*=(1+(src.StandOffense*0.4))
					src.DefenseMultiplier*=(1+(src.StandDefense*0.4))

					src.StandActive=1

					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] calls: [src.StandName]!"
					src.OMessage(10, "[src.StandAction]", "[src]([src.key]) used Stand.")

				else
					src.SpecialSlot=0
					Z.BuffUsing=0

					//src.Power_Multiplier-=0.5+((src.StandLevel-1)*0.25)
					src.StrengthMultiplier/=(1+(src.StandStrength*0.4))
					src.EnduranceMultiplier/=(1+(src.StandEndurance*0.4))
					src.SpeedMultiplier/=(1+(src.StandSpeed*0.4))
					src.ForceMultiplier/=(1+(src.StandForce*0.4))
					src.ResistanceMultiplier/=(1+(src.StandResistance*0.4))
					src.OffenseMultiplier/=(1+(src.StandOffense*0.4))
					src.DefenseMultiplier/=(1+(src.StandDefense*0.4))

					src.StandActive=0

					src.OMessage(10, "[src]'s ghostly spirit fades away...", "[src]([src.key]) deactivated Stand.")
			if("StandCustom")
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					src.StandName = input(src, "What is the name of your Stand?", "Stand Custom") as text
					src.StandCry = input(src, "What does your Stand yell when it's doing a punch flurry? (This is transcribed literally; a cry for \"ORA ORA ORA\" would need to be \"ORA ORA ORA\" rather than just \"ORA\".  Essentially, the game doesn't do the shout in triplicate for you.", "Stand Custom") as text
					src.StandAction = input(src, "What does your Stand do when you call it? (This is another literal line.  There's nothing set here normally, so just write whatever text you want to see when you turn on your stand.)", "Stand Custom") as text
					src << "Distributing points..."
					var/list/s = list("Strength", "Endurance", "Speed", "Force", "Resistance", "Offense", "Defense")
//					var/list/Stats = list()
					var/Stats1=pick(s)
					var/Stats2=pick("Strength", "Endurance", "Speed", "Force", "Resistance", "Offense", "Defense")
					switch(Stats1)
						if("Strength")
							src.StandStrength+=1
						if("Endurance")
							src.StandEndurance+=1
						if("Speed")
							src.StandSpeed+=1
						if("Force")
							src.StandForce+=1
						if("Resistance")
							src.StandResistance+=1
						if("Offense")
							src.StandOffense+=1
						if("Defense")
							src.StandDefense+=1
					switch(Stats2)
						if("Strength")
							src.StandStrength+=1
						if("Endurance")
							src.StandEndurance+=1
						if("Speed")
							src.StandSpeed+=1
						if("Force")
							src.StandForce+=1
						if("Resistance")
							src.StandResistance+=1
						if("Offense")
							src.StandOffense+=1
						if("Defense")
							src.StandDefense+=1
					src << "Done."
					src << "You can now use the Stand verb to summon your spirit!"
					src << "Use StandCustom to check what your Stand does, and level it up after being granted a new Stand level."
					src.contents+=new/obj/Skills/Buffs/Stand
				else//checking stand functionality
					if(src.StandLevel > src.StandLevelTriggered)
						while(src.StandLevel > src.StandLevelTriggered)
							src.StandLevelTriggered++
							src << "Level up triggered.  Distributing..."
//							var/list/s = list("Strength", "Endurance", "Speed", "Force", "Resistance", "Offense", "Defense")
//							var/list/Stats = list()
							var/Stats1=pick("Strength", "Endurance", "Speed", "Force", "Resistance", "Offense", "Defense")
							switch(Stats1)
								if("Strength")
									src.StandStrength+=1
								if("Endurance")
									src.StandEndurance+=1
								if("Speed")
									src.StandSpeed+=1
								if("Force")
									src.StandForce+=1
								if("Resistance")
									src.StandResistance+=1
								if("Offense")
									src.StandOffense+=1
								if("Defense")
									src.StandDefense+=1
							src << "Done."
			if("VitalicBurst")
				if(!Z.Using)
					if(Z:LastUse)
						if(world.realtime < Z:LastUse+(600*60*24))
							src << "You can only use this technique [Z.Level] times per day."
							return
						else
							Z:Uses=0
					if(Z:Uses >= Z.Level)
						src << "You have already used this [Z:Uses] times today.  You can't use it again yet."
						return
					if(Z:Uses>=Z.Level)
						Z:LastUse=world.realtime
					src.Anger+=((src.AngerMax-1)/2)
					if(src.Anger > src.AngerMax)
						src.Anger=src.AngerMax
					src.OMessage(10, "[src] bursts with primeval rage, skyrocketing their power!!", "[src]([src.key]) used Vitalic Burst.")
					Z:Uses++
					Z.Cooldown()
			if("WrathArmor")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs)
						src << "You're already using a slotted buff."
						return
					Z.BuffUsing=1
					src.ActiveBuffs=3
					src.WrathArmor=1
					src.Power_Multiplier+=1
					src.EnduranceMultiplier*=1.5
					src.ResistanceMultiplier*=1.5
					src.OffenseMultiplier*=1.5
					src.DefenseMultiplier*=0.5
					src.OMessage(10, "[src]'s form writhes with soul blackening rage!", "[src]([src.key]) used Wrath Armor.")
				else
					src.ActiveBuffs=0
					Z.BuffUsing=0
					src.WrathArmor=0
					src.Power_Multiplier-=1
					src.EnduranceMultiplier/=1.5
					src.ResistanceMultiplier/=1.5
					src.OffenseMultiplier/=1.5
					src.DefenseMultiplier/=0.5
					src.OMessage(10, "[src]'s body stops twitching with anger...", "[src]([src.key]) deactivated Wrath Armor.")
			if("WrathShield")
				if(!Z.BuffUsing)
					if(src.SpecialSlot)
						src << "You're already using a special buff."
						return
					src.SpecialSlot=1
					Z.BuffUsing=1
					src.WrathShield=1
					src.OMessage(10, "[src] emits an ominous red light!", "[src]([src.key]) used Wrath Shield.")
				else
					src.SpecialSlot=0
					Z.BuffUsing=0
					src.WrathShield=0
					src.OMessage(10, "[src]'s furious glow dies off...", "[src]([src.key]) deactivated Wrath Shield.")
			if("WrathBlade")
				if(!Z.BuffUsing)
					if(src.SpecialSlot)
						src << "You're already using a special buff."
						return
					src.SpecialSlot=1
					Z.BuffUsing=1
					src.WrathBlade=1
					src.OMessage(10, "[src] manifests their fury as a weapon!", "[src]([src.key]) used Wrath Blade.")
				else
					src.SpecialSlot=0
					Z.BuffUsing=0
					src.WrathBlade=0
					src.OMessage(10, "[src] disperses the blade of their fury...", "[src]([src.key]) deactivated Wrath Blade.")
			if("MantraArms")
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					src.MantraArms=1
					src.Power_Multiplier+=1
					src.StrengthMultiplier*=1.5
					src.OMessage(10, "<font color='#FF0000'>A metal coating spreads across [src]'s arms!</font color>", "[src]([src.key]) used Mantra Arms.")
				else
					Z.BuffUsing=0
					src.MantraArms=0
					src.Power_Multiplier-=1
					src.StrengthMultiplier/=1.5
					src.OMessage(10, "<font color='#FF0000'>[src]'s metallic arms crack before shattering to pieces!</font color>", "[src]([src.key]) deactivated Mantra Arms.")
			if("ShutThemUp")
				if(!Z.Using)
					if(src.Anger < 1.5)
						src << "You aren't angry enough to make [src.Target] shut up."
						return
					if(!src.Target)
						src << "You don't have a target to shut up."
						return
					src.OMessage(10, "<font color='#FF0000'>[src] suddenly spikes towards [src.Target], one fist cocked back!</font color>", "[src]([src.key]) used Shut Them Up.")
					src.ShutUp=1
					src.HeavyShot=1
					src.Comboz(src.Target)
					src.Melee(1,1)
					src.Anger-=0.5
					Z.Cooldown()
			if("StrongFlurry")
				if(!Z.Using)
					if(src.Anger < 2)
						src << "You aren't angry enough to use a strong flurry."
						return
					if(!src.Target)
						src << "You don't have a target."
						return
					if(!(src.Target in oview(15, src)))
						return
					var/flurry = 3
					while(flurry)
						flurry--
						src.HeavyShot=1
						src.AttackHardness=2
						src.Comboz(src.Target)
						src.Melee(1,1)
						sleep(10)
					src.Anger-=1
					Z.Cooldown()
			if("WrathOfDeva")
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					src.WrathOfDeva=1
					src.Power_Multiplier+=1
					src.SpeedMultiplier*=1.5
					src.OMessage(10, "<font color='#FF0000'>With immense anger, [src] throws their arms apart.  Two more sets erupt from above and below their shoulders!!</font color>", "[src]([src.key]) used Wrath Of Deva.")
				else
					Z.BuffUsing=0
					src.WrathOfDeva=0
					src.Power_Multiplier-=1
					src.SpeedMultiplier/=1.5
					src.OMessage(10, "<font color='#FF0000'>[src]'s additional arms are covered in rust, only to blow away as ash carried by a stiff breeze...</font color>", "[src]([src.key]) deactivated Wrath Of Deva.")

			if("Bojack")
				if(!src.Bojack)
					if(!src.ActiveBuffs)
						src << "You need to be using a buff for this to work, oxydickhole."
						return
					if(src.Race!="Heran")
						src << "Stop trying to abuse the system admin shitlords..."
						return
					src.Bojack=1
					if(src.StrengthMultiplier<=0.99)
						src.StrengthMultiplier*=1.1
					if(src.EnduranceMultiplier<=0.99)
						src.EnduranceMultiplier*=1.1
					if(src.SpeedMultiplier<=0.99)
						src.SpeedMultiplier*=1.1
					if(src.ForceMultiplier<=0.99)
						src.ForceMultiplier*=1.1
					if(src.ResistanceMultiplier<=0.99)
						ResistanceMultiplier*=1.1
					if(src.OffenseMultiplier<=0.99)
						src.OffenseMultiplier*=1.1
					if(src.DefenseMultiplier<=0.99)
						src.DefenseMultiplier*=1.1
					if(src.RecoveryMultiplier<=0.99)
						src.RecoveryMultiplier*=1.1
					if(src.RegenerationMultiplier<=0.99)
						src.RegenerationMultiplier*=1.1
					if(!src.StrengthMultiplier<=0.99&&!src.EnduranceMultiplier<=0.99&&!src.SpeedMultiplier<=0.99&&!src.ForceMultiplier<=0.99&&!src.ResistanceMultiplier<=0.99&&!src.OffenseMultiplier<=0.99&&!src.DefenseMultiplier<=0.99&&!src.RecoveryMultiplier<=0.99&&!src.RegenerationMultiplier<=0.99)
						if(src.StrengthMultiplier>=1.001)
							src.StrengthMultiplier*=1.1
						if(src.EnduranceMultiplier>=1.001)
							src.EnduranceMultiplier*=1.1
						if(src.SpeedMultiplier>=1.001)
							src.SpeedMultiplier*=1.1
						if(src.ForceMultiplier>=1.001)
							src.ForceMultiplier*=1.1
						if(src.ResistanceMultiplier>=1.001)
							ResistanceMultiplier*=1.1
						if(src.OffenseMultiplier>=1.001)
							src.OffenseMultiplier*=1.1
						if(src.DefenseMultiplier>=1.001)
							src.DefenseMultiplier*=1.1
						if(src.RecoveryMultiplier>=1.001)
							src.RecoveryMultiplier*=1.1
						if(src.RegenerationMultiplier>=1.001)
							src.RegenerationMultiplier*=1.1
					src.OMessage(10, "[src] is basked in a sinister Od..!", "[src]([src.key]) used Bojack Mode.")
				else
					if(src.ActiveBuffs)
						src << "Turn off your buffs you rabid dickmuncher."
						return
					src.Bojack=0
					if(src.StrengthMultiplier>=1.001)
						src.StrengthMultiplier/=1.1
					if(src.EnduranceMultiplier>=1.001)
						src.EnduranceMultiplier/=1.1
					if(src.SpeedMultiplier>=1.001)
						src.SpeedMultiplier/=1.1
					if(src.ForceMultiplier>=1.001)
						src.ForceMultiplier/=1.1
					if(src.ResistanceMultiplier>=1.001)
						ResistanceMultiplier/=1.1
					if(src.OffenseMultiplier>=1.001)
						src.OffenseMultiplier/=1.1
					if(src.DefenseMultiplier>=1.001)
						src.DefenseMultiplier/=1.1
					if(src.RecoveryMultiplier>=1.001)
						src.RecoveryMultiplier/=1.1
					if(src.RegenerationMultiplier>=1.001)
						src.RegenerationMultiplier/=1.1
					src.OMessage(10, "[src] returns to their usual Od...", "[src]([src.key]) abandoned Bojack Mode.")


			if("Rebirth")
				if(!src.WarriorLevel)
					var/choice = input(src, "You embark on the path of a Hero... but which Hero you become remains to be seen. Will you simply choose to be the strongest or defy everything for victory?", "") in list("I'm the best and I know it. I have to be.", "I'll do whatever it takes. Losing isn't an option.")
					if(choice=="I'm the best and I know it. I have to be.")
						src << "You won't give them the chance to strike. You begin your journey to forge a Legend..."
						src.StrengthMod*=1.1
						src.SpeedMod*=1.2
						src.Recovery*=1.1
						src.WarriorLevel=1
						src.WarriorType="Blue"
						src.Willpower=1
					if(choice=="I'll do whatever it takes. Losing isn't an option.")
						src << "You'll bleed, but that only makes you stronger. You set out to defy all expectations..."
						src.EnduranceMod*=1.1
						src.ResistanceMod*=1.1
						src.AngerMax+=0.25
						src.WarriorLevel=1
						src.WarriorType="Red"
						src.Willpower=1
					src.contents+=new/obj/Skills/Taunt
					src.contents+=new/obj/Skills/Resolve
					src.contents+=new/obj/Skills/Spirit
				if(src.WarriorLevel>Z:LastMod)
					src<<"You look up to the sky..."
					while(Z:LastMod<src.WarriorLevel)
						Z:LastMod++
						if(Z:LastMod==2)
							if(src.WarriorType=="Blue")
								src <<"You travel further down the path to glory. Impossible is only a word to you."
								src.StrengthMod*=1.1
								src.SpeedMod*=1.2
								src.Recovery*=1.2
								src.WarriorLevel=2
								src.Willpower=2
							if(src.WarriorType=="Red")
								src <<"You've become hardened by your experience. Show them the fire that burns in your soul."
								src.EnduranceMod*=1.2
								src.ResistanceMod*=1.2
								src.AngerMax+=0.25
								src.WarriorLevel=2
								src.Willpower=2
							src.contents+=new/obj/Skills/Showstopper
							src.contents+=new/obj/Skills/SecondWind
							src.contents+=new/obj/Skills/Fearless
						if(Z:LastMod==3)
							if(src.WarriorType=="Blue")
								src <<"You travel further down the path to glory. Your Legend lies just on the horizon.."
								src.StrengthMod*=1.2
								src.SpeedMod*=1.25
								src.Recovery*=1.25
								src.WarriorLevel=3
								src.Willpower=3
							if(src.WarriorType=="Red")
								src <<"Hardened by battle, you demonstrate the meaning of defiance. What hurts you only makes you stronger."
								src.EnduranceMod*=1.3
								src.ResistanceMod*=1.3
								src.AngerMax+=0.25
								src.WarriorLevel=3
								src.Willpower=3
							src.contents+=new/obj/Skills/Martyr
							src.contents+=new/obj/Skills/Defiance
							src.contents+=new/obj/Skills/StrengthOfWill
						if(Z:LastMod==4)
							if(src.WarriorType=="Blue")
								src <<"You are He of Legend; Hail the Crownless King."
								src.OMessage(30,"[src] becomes a Legendary Fighter with no equal, able to keep up with anyone who stands against them.","")
								src.StrengthMod*=1.25
								src.SpeedMod*=1.25
								src.Recovery*=1.25
								src.WarriorLevel=4
								src.Willpower=4
								src.contents+=new/obj/Skills/HeroSoul
							if(src.WarriorType=="Red")
								src <<"You are defiance incarnate; Hail the Comeback King."
								src.OMessage(30,"[src] becomes the personification of defiance, resisting everything thrown at them and getting stronger by enduring hardship.","")
								src.EnduranceMod*=1.4
								src.ResistanceMod*=1.4
								src.AngerMax+=0.25
								src.WarriorLevel=4
								src.Willpower=4
								src.contents+=new/obj/Skills/HeroHeart
			if("Defiance")
				if(!Z.Using)
					if(src.Health>=25) return
					if(Z:Uses >= Z.Level)
						src << "Sorry, you can't defy fate just yet."
						return
					if(Z:LastUse)
						if(world.realtime < Z:LastUse+(600*60*24*5))
							src << "You can only use this technique once per 5 days."
							return
						else
							Z:Uses=0
					if(Z:Uses>=Z.Level)
						Z:LastUse=world.realtime
					src.OMessage(30, "<b>[src] abandons their weakness, and breaks the chains of fate.</b>","[src]([src.key]) used Defiance.")
					src.Defiance=1
					src.Health+=100
					src.Energy=src.EnergyMax
				if(Z.Using)
					src.Defiance=0
					src.Health=0
					src.Energy=1

			if("Resolve")
				if(!Z.BuffUsing)
					src.OMessage(30, "<b>[src] isn't going to go down easily!</b>","[src]([src.key]) used Resolve.")
					Z.BuffUsing=1
					src.Resolve=1
			//		src.LastBreath=1
				else
					src.OMessage(30, "[src] loses some of their grit.","[src]([src.key]) deactivated Resolve.")
					Z.BuffUsing=0
					src.Resolve=0
			//		src.LastBreath=0
			if("Believe")
				for(var/mob/M in world)
					if(M.BeliefRequest==1)
						if(src.Alert("Do you believe in [M]?"))
							M.BelievePower+=1
							M.Power_Multiplier+=0.5
							src.OMessage(30,"[src] believes in [M]!","<font color=red>[src]([src.key]) believes in [M].</font>")

			if("Hope")
				if(!Z.Using)
					var/Plea
				//	var/PleaDistance=20
					Plea=input(src,"Plea","How it will appear: [src] [Plea]" ,Plea) as text
			//		src.BeliefRequest=1
					BeliefRequest(src,60)
				/*	for(var/mob/m in view(PleaDistance))
						m<<"[Plea]"
						if(m!=src)
							src.contents+=new/obj/Skills/Believe*/
					Z.Cooldown()
			if("Taunt")
				if(!Z.Using)
					src.Energy+=(src.EnergyMax/10)
					src.TotalFatigue-=10
					src.OMessage(30,"[src] yells:<b>[Z:Kamina]</b>","<font color=red>[src]([src.key]) talked shit.</font>")
					Z.Cooldown()

			if("Spirit")
				var/WearableList
				if(src.Spirit)
					src<<"It's only possible to imbue your spirit into one item..."
					return
				if(!Z.Using)
					if(!src.Spirit)
						for(var/obj/Items/Wearables/A in src)
							if(!A.Spirited)
								WearableList+=A
						var/obj/Items/Wearables/selection=input("Select a item to imbue with your heroic spirit.") in WearableList
						selection.Spirited=1
						src.OMessage(30,"[src] embues [selection] with their heroic spirit!","")
						src.Spirit=1

			if("SecondWind")
				if(!Z.Using)
					src.Health-=5
					src.TotalInjury+=5
					src.Energy+=(src.EnergyMax/5)
					src.TotalFatigue-=20
					src.OMessage(30,"[src] draws from their boundless will to win!","[src]([src.key]) used Second Wind!")
					Z.Cooldown()

			if("StrengthOfWill")
				if(Darlose)return
				if(src.KO||Z.Using||src.Blocking)return
				src.StrengthOfWill=1
				usr<< "You place the strength of your will into your next attack.."
				Z.Cooldown()

			if("Emotion")
				if(Z:LastMod < src.BerserkerMod)
					if(!locate(/obj/Skills/TierS/BerserkerArmor, src))
						src.contents+=new/obj/Skills/TierS/BerserkerArmor
						src << "You become able to put on the feared creation of the dwarves..."
					while(Z:LastMod < src.BerserkerMod)
						Z:LastMod++
						if(Z:LastMod==1)
							src << "You begin to think about those dearest to you..."
							src << "... as potential enemies..."
							if(src.AngerMax < 1.5)
								src.AngerMax=1.5
							else
								src.AngerMax*=1.05
						if(Z:LastMod==2)
							src << "Everything makes you flinch..."
							src << "... maybe you should seclude yourself..."
							src << "... before someone dies..."
							src.AngerMax*=1.05
							if(src.Regeneration < 3)
								src.Regeneration=3
						if(Z:LastMod==3)
							src << "it hurts it hurts it hurts"
							src << "why... why is it biting into your bones...!?"
							src.AngerMax*=1.1
							src.Regeneration*=1.25
						if(Z:LastMod==4)
							src << "ansjddKillddsjdndsEveryonekanksdnaAndakjsndkeaEverythingldalidesmda"
							src.AngerMax*=1.25
							src.Regeneration*=1.5

			if("RefineRipple")
				if(src.RippleMod==0)
					src.RippleMod=1
					return
				if(src.RippleMod > Z:LastMod)
					src << "The sun shines brightly upon you!"
					while(Z:LastMod<src.RippleMod)
						Z:LastMod++
						if(Z:LastMod==1)
							src << "You learn how to infuse your martial arts with the Ripple!"
							src.RipplePassive=1
							src.contents+=new/obj/Skills/RebuffOverdrive
							src << "You learn to charge your Ripple into a single destructive elbow!"
							src.contents+=new/obj/Skills/ZoomPunch
							src << "You learn to lengthen your arm for a surprise punch!"
						if(Z:LastMod==2)
							src.contents+=new/obj/Skills/HealingRipple
							src << "You learn to heal another's body with the power of the Ripple!"
							src.contents+=new/obj/Skills/HamonHairAttack
							src << "You learn to charge your Ripple into your hair itself, vastly increasing its defensive properties!...for a time."
						if(Z:LastMod==3)
							src.RipplePassive=2
							src << "Your Ripple powers become increasingly damaging to the forces of darkness!"
							src.contents+=new/obj/Skills/TimelyCounter
							src << "You learn to get inside of your enemy's mind and predict their moves!"
							src.contents+=new/obj/Skills/OverdriveBarrage
							src << "Your fluency at using Overdrives has increased to the point where you can launch a combo of them!"
							src.contents+=new/obj/Skills/SendoWaveKick
							src << "You learn the Sendo Wave Kick!"
						if(Z:LastMod==4)
							src.contents+=new/obj/Skills/UltimateDeepPassOverdrive
							src << "You learn to transfer all of your knowledge to another via the Ripple!"
						if(Z:LastMod==5)
							src.contents+=new/obj/Skills/MartialArts/SunlightYellowOverdrive
							src << "You learn to unleash the most powerful Ripple Overdrive of all: Sunlight Yellow!"
						if(Z:LastMod==6)
							src.contents+=new/obj/Skills/FinalRipple
							src << "From the sacrifice of another Ripple warrior..."
							src << "For the cost of your soul itself..."
							src << "You can now make a final stand against all that is dark and evil."

			if("RebuffOverdrive")
				if(!Z.Using)
					src.OMessage(10, "[src] charges their arms with Ripple energy!", "[src]([src.key]) used Rebuff Overdrive.")
					src.RebuffOverdrive=1
					Z.Cooldown()
			if("ZoomPunch")
				if(!Z.Using)
					if(!src.Target)
						src << "You need a target to use this skill."
						return
					var/found=0
					for(var/mob/m in view(3))
						if(m==src.Target)
							found=1
					if(!found)
						src << "Your target is too far away..."
						return
					src.OMessage(10, "[src]'s arm extends, striking their opponent in the face from range!", "[src]([src.key]) used Zoom Punch.")
					src.Comboz(src.Target)
					src.Melee(1.5, 1)
					Z.Cooldown()
			if("HealingRipple")
				if(!Z.Using)
					src.HealingRipple=1
					src.OMessage(10, "[src] is suffused with calming Hamon energy.", "[src]([src.key]) used Healing Ripple.")
					src << "All of your attacks will heal for 30 seconds.  Use this verb again to turn off the healing effect."
					spawn(300)
						if(src.HealingRipple)
							src.HealingRipple=0
							src.OMessage(10, "[src]'s calming aura dies down.", "[src]([src.key]) de-activated Healing Ripple.")
					Z.Cooldown()
				else
					if(src.HealingRipple)
						src.HealingRipple=0
						src << "You turn off the Healing Ripple."
			if("HamonHairAttack")
				if(!Z.Using)
					src.EnduranceMultiplier*=3
					src.ResistanceMultiplier*=3
					src.OMessage(10, "[src] hardens their hair with Hamon, granting it magnificent resiliance!", "[src]([src.key]) used Hamon Hair Attack.")
					spawn(100)
						src.EnduranceMultiplier/=3
						src.ResistanceMultiplier/=3
						src.OMessage(10, "[src]'s hair returns to its normal hardness.", "[src]([src.key]) deactivated Hamon Hair Attack.")
					Z.Cooldown()
			if("TimelyCounter")
				if(!Z.Using)
					src.OMessage(10, "[src] gets a shrewd look in their eye...!", "[src]([src.key]) used Timely Counter.")
					src.TimelyCounter=1
					Z.Cooldown()
			if("OverdriveBarrage")
				if(!Z.Using)
					src.OMessage(10, "[src]'s fists begin to glow with ridiculous amounts of Ripple energy!!!", "[src]([src.key]) used Overdrive Barrage.")
					src.OverdriveBarrage=5
					Z.Cooldown()
			if("SendoWaveKick")
				if(!Z.Using)
					src << "Your next attack will be a Sendo Wave Kick."
					src.SendoWaveKick=1
					Z.Cooldown()
			if("UltimateDeepPassOverdrive")
				var/list/choices = list("Cancel")
				for(var/mob/m in oview(12))
					choices+=m
				var/mob/choice = input(src, "Who will you transfer your Ripple energy to?!", "Ultimate Deep Pass Overdrive") in choices
				if("Cancel"||src==choice)
					return
				if(choice.RippleMod==5)
					choice.RippleMod=6
				if(choice!=src&&choice.RippleMod<5)//else
					choice.RippleMod=src.RippleMod
					src.RippleMod=0
					src.OMessage(10, "[src] gives all of their Ripple energy to [choice]!", "[src]([src.key]) used Ultimate Deep Pass Overdrive.")
					src.DeleteAllRippleSkills()
				else
					return
		//	if("TornadoOverdrive")
		//		if(!Z.Using)
		//			src.OMessage(10, "[src] ascends into the air, spinning like a tornado!!!", "[src]([src.key]) used Tornado Overdrive.")
		//			sleep(5)
		//			var/Distance=10
		//			while(Distance)
		//				Distance--
		//				for(var/mob/P in view(1))
		//					if(P==src)
		//						continue
		//					var/Accuracy=(((src.Offense*src.OffenseMultiplier)*src.Power)/((P.Defense*P.DefenseMultiplier)*P.Power))*200
		//					if(prob(Accuracy)&&!P.GER)
		//						P.Knockback(3,src)
		//						var/KnockbackDir=pick(-45,45)
		//						var/Damage=(((usr.Strength*usr.StrengthMultiplier)*usr.Power)/((P.Endurance*P.EnduranceMultiplier)*P.Power)*2)
		//						P.dir=turn(src.dir, KnockbackDir)
		//						if(src.DiplomaticImmunity || P.DiplomaticImmunity)
		//							Damage*=0
		//						P.Health-=Damage
		//				step(src, src.dir)
		//				sleep(1)
		//			Z.Cooldown()
			if("FinalRipple")
				if(!Z.BuffUsing)
					src.OMessage(30, "[src] becomes a radiant display of Ripple energy, vastly increasing their prowess!", "[src]([src.key]) used Final Ripple.")
					src.RipplePassive=3
					src.LastBreath=1
					Z.BuffUsing=1
				else
					src.OMessage(30, "All light fades from [src] as they relinquish their Ripple energy...as well as their life.", "[src]([src.key]) deactivated Final Ripple.")
					Z.BuffUsing=0
					src.RipplePassive=0
					src.LastBreath=0
					src.RippleMod=0
					src.DeleteAllRippleSkills()
					src.Death(null, null)

/*			if("TheZone")
				if(src.TheZoneLevel==0) return
				if(!Z.BuffUsing)
					if(src.SpecialSlot)
						src << "You're already using a special buff."
						return
					src.OMessage(10,"[src] proceeds to give it their all...","[src]([src.key]) entered The Zone.")
					src.Anger=1
					if(src.TheZoneLevel==1)
						src.Power_Multiplier+=(src.AngerMax*1.25)
						src.SpeedMultiplier*=1.5
						src.RecoveryMultiplier*=1.25
					if(src.TheZoneLevel==2)
						src.Power_Multiplier+=(src.AngerMax*2)
						src.SpeedMultiplier*=2
						src.RecoveryMultiplier*=1.5
					src.AngerMax/=5
					src.SpecialSlot=1
					Z.BuffUsing=1
				else
					src.OMessage(10,"[src] allows distractions to enter their mind again...","[src]([src.key]) abandoned The Zone.")
					src.AngerMax*=5
					if(src.TheZoneLevel==1)
						src.Power_Multiplier-=(src.AngerMax*1.25)
						src.SpeedMultiplier/=1.5
						src.RecoveryMultiplier/=1.25
					if(src.TheZoneLevel==2)
						src.Power_Multiplier-=(src.AngerMax*2)
						src.SpeedMultiplier/=2
						src.RecoveryMultiplier/=1.5
					src.SpecialSlot=0
					Z.BuffUsing=0*/


			if("Bijuu")
				if(!src.JinEnergyChange)
					src << "A sacred beast rests within you, changing your energy..."
					src.JinEnergyChange=1
					src.Recovery*=0.75
					src.EnergyMod*=3
					src.EnergyMax*=3
					src.Energy*=3
				if(!src.JinAngerAmp&&src.JinchLevel>=1)
					src.AngerMax*=1.5
					src.JinAngerAmp=1
				if(src.TailedBeast=="Kurama"&&src.JinchLevel>=4&&!locate(/obj/Skills/Buffs/KyuubiControlledMode, src))
					src << "You can now access the Kyuubi Controlled Mode!"
					src.contents+=new/obj/Skills/Buffs/KyuubiControlledMode
				if(!Z.BuffUsing)
					if(src.SpecialSlot)
						src << "Bijuu takes up your special slot."
						return
					if(!src.JinchLevel)
						return
					src.BijuuActive=1
					src.SpecialSlot=1
					src.overlays+=image(icon='BijuuInitial.dmi', pixel_x=-32, pixel_y=-32)
					Z.BuffUsing=1
					Z:PreviousEnergy=src.Energy
					src.Energy=(2*src.EnergyMax)
					src.OMessage(10,"[src] begins to channel the power of the tailed beast within them...","[src]([src.key]) used Bijuu.")

					switch(src.TailedBeast)
						if("Ichibi")
							src.StrengthMultiplier*=1.1
							src.EnduranceMultiplier*=1.5
							src.SpeedMultiplier*=1.05
							src.ForceMultiplier*=1.1
							src.ResistanceMultiplier*=1.5
							src.OffenseMultiplier*=1.1
							src.DefenseMultiplier*=1.1

							src.contents+=new/obj/Skills/SandCoffin
						if("Nibi")
							src.StrengthMultiplier*=1.1
							src.EnduranceMultiplier*=1.1
							src.SpeedMultiplier*=1.25
							src.ForceMultiplier*=1.1
							src.ResistanceMultiplier*=1.1
							src.OffenseMultiplier*=1.1
							src.DefenseMultiplier*=1.5
						if("Sanbi")
							src.StrengthMultiplier*=1.1
							src.EnduranceMultiplier*=1.1
							src.SpeedMultiplier*=1.1
							src.ForceMultiplier*=1.5
							src.ResistanceMultiplier*=1.5
							src.OffenseMultiplier*=1.1
							src.DefenseMultiplier*=1.1
						if("Yonbi")
							src.StrengthMultiplier*=1.35
							src.EnduranceMultiplier*=1.3
							src.SpeedMultiplier*=1.1
							src.ForceMultiplier*=1.3
							src.ResistanceMultiplier*=1.1
							src.OffenseMultiplier*=1.1
							src.DefenseMultiplier*=1.1
						if("Gobi")
							src.StrengthMultiplier*=1.35
							src.EnduranceMultiplier*=1.1
							src.SpeedMultiplier*=1.15
							src.ForceMultiplier*=1.1
							src.ResistanceMultiplier*=1.1
							src.OffenseMultiplier*=1.3
							src.DefenseMultiplier*=1.1
						if("Rokubi")
							src.StrengthMultiplier*=1.1
							src.EnduranceMultiplier*=1.5
							src.SpeedMultiplier*=1.1
							src.ForceMultiplier*=1.5
							src.ResistanceMultiplier*=1.1
							src.OffenseMultiplier*=1.1
							src.DefenseMultiplier*=1.1
						if("Chomei")
							src.StrengthMultiplier*=1.1
							src.EnduranceMultiplier*=1.1
							src.SpeedMultiplier*=1.1
							src.ForceMultiplier*=1.5
							src.ResistanceMultiplier*=1.1
							src.OffenseMultiplier*=1.1
							src.DefenseMultiplier*=1.5
						if("Gyuki")
							src.StrengthMultiplier*=1.35
							src.EnduranceMultiplier*=1.35
							src.SpeedMultiplier*=1.1
							src.ForceMultiplier*=1.35
							src.ResistanceMultiplier*=1.1
							src.OffenseMultiplier*=1.35
							src.DefenseMultiplier*=1.1
						if("Kurama")
							src.StrengthMultiplier*=1.25
							src.EnduranceMultiplier*=1.25
							src.SpeedMultiplier*=1.25
							src.ForceMultiplier*=1.25
							src.ResistanceMultiplier*=1.25
							src.OffenseMultiplier*=1.25
							src.DefenseMultiplier*=1.25
							src.Energy=(src.EnergyMax*2.5)

				else
					if(src.JinVersionOne||src.JinVersionTwo||src.JinFullTrans)
						src << "how u gonna stop channelin yo tailed monster when you are that tailed monster nigga..."
						return
					src.SpecialSlot=0
					src.BijuuActive=0
					Z.BuffUsing=0
					src.overlays-=image(icon='BijuuInitial.dmi', pixel_x=-32, pixel_y=-32)
					//src.Energy=Z:PreviousEnergy
					src.Energy=0
					src.OMessage(10,"[src] releases the power of their tailed beast...","[src]([src.key]) deactivated Bijuu.")

					switch(src.TailedBeast)
						if("Ichibi")
							src.StrengthMultiplier/=1.1
							src.EnduranceMultiplier/=1.5
							src.SpeedMultiplier/=1.05
							src.ForceMultiplier/=1.1
							src.ResistanceMultiplier/=1.5
							src.OffenseMultiplier/=1.1
							src.DefenseMultiplier/=1.1

							for(var/obj/Skills/SandCoffin/c in src)
								del c
						if("Nibi")
							src.StrengthMultiplier/=1.1
							src.EnduranceMultiplier/=1.1
							src.SpeedMultiplier/=1.25
							src.ForceMultiplier/=1.1
							src.ResistanceMultiplier/=1.1
							src.OffenseMultiplier/=1.1
							src.DefenseMultiplier/=1.5
						if("Sanbi")
							src.StrengthMultiplier/=1.1
							src.EnduranceMultiplier/=1.1
							src.SpeedMultiplier/=1.1
							src.ForceMultiplier/=1.5
							src.ResistanceMultiplier/=1.5
							src.OffenseMultiplier/=1.1
							src.DefenseMultiplier/=1.1
						if("Yonbi")
							src.StrengthMultiplier/=1.35
							src.EnduranceMultiplier/=1.3
							src.SpeedMultiplier/=1.1
							src.ForceMultiplier/=1.3
							src.ResistanceMultiplier/=1.1
							src.OffenseMultiplier/=1.1
							src.DefenseMultiplier/=1.1
						if("Gobi")
							src.StrengthMultiplier/=1.35
							src.EnduranceMultiplier/=1.1
							src.SpeedMultiplier/=1.15
							src.ForceMultiplier/=1.1
							src.ResistanceMultiplier/=1.1
							src.OffenseMultiplier/=1.3
							src.DefenseMultiplier/=1.1
						if("Rokubi")
							src.StrengthMultiplier/=1.1
							src.EnduranceMultiplier/=1.5
							src.SpeedMultiplier/=1.1
							src.ForceMultiplier/=1.5
							src.ResistanceMultiplier/=1.1
							src.OffenseMultiplier/=1.1
							src.DefenseMultiplier/=1.1
						if("Chomei")
							src.StrengthMultiplier/=1.1
							src.EnduranceMultiplier/=1.1
							src.SpeedMultiplier/=1.1
							src.ForceMultiplier/=1.5
							src.ResistanceMultiplier/=1.1
							src.OffenseMultiplier/=1.1
							src.DefenseMultiplier/=1.5
						if("Gyuki")
							src.StrengthMultiplier/=1.35
							src.EnduranceMultiplier/=1.35
							src.SpeedMultiplier/=1.1
							src.ForceMultiplier/=1.35
							src.ResistanceMultiplier/=1.1
							src.OffenseMultiplier/=1.35
							src.DefenseMultiplier/=1.1
						if("Kurama")
							src.StrengthMultiplier/=1.25
							src.EnduranceMultiplier/=1.25
							src.SpeedMultiplier/=1.25
							src.ForceMultiplier/=1.25
							src.ResistanceMultiplier/=1.25
							src.OffenseMultiplier/=1.25
							src.DefenseMultiplier/=1.25
			if("KyuubiControlledMode")
				if(!Z.BuffUsing)
					if(src.SpecialSlot)
						src << "Kyuubi Controlled Mode takes up the special slot."
						return
					Z.BuffUsing=1
					src.SpecialSlot=1
					src.BaseMod*=5
					src.Base*=5
					src.EnergyMod*=5
					src.EnergyMax*=5
					src.Energy*=5
					src.StrengthMultiplier*=1.5
					src.EnduranceMultiplier*=1.5
					src.SpeedMultiplier*=1.5
					src.ForceMultiplier*=1.5
					src.ResistanceMultiplier*=1.5
					src.OffenseMultiplier*=1.5
					src.DefenseMultiplier*=1.5
					src << "You enter the Kyuubi Controlled Mode."
				else
					Z.BuffUsing=0
					src.SpecialSlot=0
					src.BaseMod/=5
					src.Base/=5
					src.EnergyMod/=5
					src.EnergyMax/=5
					src.Energy/=5
					src.StrengthMultiplier/=1.5
					src.EnduranceMultiplier/=1.5
					src.SpeedMultiplier/=1.5
					src.ForceMultiplier/=1.5
					src.ResistanceMultiplier/=1.5
					src.OffenseMultiplier/=1.5
					src.DefenseMultiplier/=1.5
					src << "You exit the Kyuubi Controlled Mode."
			if("DeusExMachina")
				if(Z:LastMod < src.MachinaMod)
					if(!locate(/obj/Skills/Ripper, src))
						src.contents+=new/obj/Skills/Ripper
						src << "You learn to overclock your systems nonfatally."
					while(Z:LastMod < src.MachinaMod)
						Z:LastMod++
						if(Z:LastMod==1)
							src << "You offer your soul as tribute to the God of Machines..."
							src << "You develop perfect synchronization with nanomachines."
							src.CyberizeMod*=1.25
							if(src.Intelligence < 3)
								src.Intelligence=3
							else
								src.Intelligence+=1
						if(Z:LastMod==2)
							src << "The nanomachines within you extend their control further."
							src << "You are more machine than (wo)man."
							src.CyberizeMod*=1.25
							if(src.Intelligence < 4)
								src.Intelligence=4
						if(Z:LastMod==3)
							src << "Only one last shred of humanity has not been offered to Deus Ex Machina."
							src << "You're not sure how to feel about that."
							src << "(get it?  because machines don't feel.)"
							src.CyberizeMod*=1.25
							src.Intelligence*=1.1
						if(Z:LastMod==4)
							src << "You have become a machine from God."
							src.Divine=1
							src.CyberizeMod*=1.25
							src.Intelligence*=1.1
							src.AngerMax*=1.5
				else
					src << "There is no upload of new nanomachines to your soul.  You guess this is the best version of yourself that you're going to get for now?"
			if("Ansatsuken")
				for(var/obj/Items/Sword/S in src)
					if(S.suffix)
						src<<"You probably don't want to do this with a sword on..."
						return
				if(Z:LastMod < src.AnsatsukenMod)
					src << "Over the course of your numerous fights, your martial arts have improved!"
					while(src.AnsatsukenMod > Z:LastMod)
						Z:LastMod++
						if(Z:LastMod==1)
							src << "You learn how to project a destructive energy attack: <b>Hadoken!</b>"
							src.contents+=new/obj/Skills/MartialArts/Hadoken
							src << "You learn how to launch a devastating uppercut: <b>Shoryuken!</b>"
							src.contents+=new/obj/Skills/Feva/Shoryuken
							src << "You learn how to lash out with a decimating series of whirlwind kicks: <b>Tatsumaki!</b>"
							src.contents+=new/obj/Skills/MartialArts/Tatsumaki
							src.AnsatsukenUnlocked=1
							src << "All this knowledge put together has granted you the specialized Ansatsuken Stance. It's power will grow with yours."
						if(Z:LastMod==2)
							var/choice = input(src, "You have honed your martial arts...but what have you perfected?", "Ansatsuken") in list("Hadoken!", "Shoryuken!", "Tatsumaki!")
							switch(choice)
								if("Hadoken!")
									src.AmatsukenPath="Hadoken"
									src << "You refine your Hadoken technique and expound upon it into the new energy blast: <b>Ex-Hadoken!</b>"
									src.contents+=new/obj/Skills/MartialArts/ExHadoken
								if("Shoryuken!")
									src.AmatsukenPath="Shoryuken"
									src << "You refine your Shoryuken technique and add divinity to your fist with: <b>Ex-Shoryuken!</b>"
									src.contents+=new/obj/Skills/Feva/ExShoryuken
								if("Tatsumaki!")
									src.AmatsukenPath="Tatsumaki"
									src << "You refine your Tatsumaki technique and develop a neutral jing by making: <b>Ex-Tatsumaki!</b>"
									src.contents+=new/obj/Skills/MartialArts/ExTatsumaki
						if(Z:LastMod==3)
							switch(src.AmatsukenPath)
								if("Hadoken")
									src << "Your Hadoken technique is as strong as a mortal is capable of projecting.  You have developed...<b>Shinku Hadoken!</b>"
									src.contents+=new/obj/Skills/MartialArts/ShinkuHadoken
								if("Shoryuken")
									src << "Your Shoryuken technique is potent enough to wrangle the gods themselves.  You have developed...<b>Shoryureppa!</b>"
									src.contents+=new/obj/Skills/MartialArts/Shoryureppa
								if("Tatsumaki")
									src << "Your Tatsumaki technique becomes imbued with the infinite thoughtlife of Hatsune Miku.  You have developed...<b>Shinku Tatsumaki!</b>"
									src.contents+=new/obj/Skills/MartialArts/ShinkuTatsumaki
						if(Z:LastMod==4)
							var/choice=input(src, "Have you gotten an admin to set your Amatsuken Ascension variable?  Answer honestly.  If it isn't set, then you're going to cause problems.", "Ansatsuken") in list("Yes!", "No!")
							switch(choice)
								if("Yes!")
									if(src.AmatsukenAscension=="Chikara no Hado")
										src << "You have cast aside your killing intent and detached yourself from all emotion and personal ties.  Naturally, this has progressed your martial arts to a nearly unprecedented level.  You have developed...<b>Chikara no Hado!</b>"
									if(src.AmatsukenAscension=="Satsui no Hado")
										src << "You have thrown everything you are and everything you have into the fires of victory!  Naturally, this has progressed your martial arts to a near unprecedented level.  You have developed...<b>Satsui no Hado!</b>"
										src.contents+=new/obj/Skills/Buffs/Satsui_no_Hado
								if("No!")
									src << "Ok.  Adminhelp for that to be done, then use the Refresh Ansatsuken verb again."
									Z:LastMod=3
									break
						if(Z:LastMod==5)
							if(src.AmatsukenAscension=="Chikara no Hado")
								src << "Your willpower has fully overcome the thin line between madness and sanity that the <b>Chikara no Hado</b> walks.  <b>You are one.</b>"
								src << "You have developed the <b>Empty Fist</b> stance, rendering you capable of sustaining yourself by merely fighting."
								src.EmptyFistUnlocked=1
								src << "You are capable of projecting your willpower itself in a massive beam of power: the <b>Gou Hadoken!</b>"
								src.contents+=new/obj/Skills/Attacks/Beams/GouHadoken
								src << "You can <b>cleanse the corruption</b> that those of the Satsui no Hado spread...Though this power does not allow you to change the soul of one who has committed themselves fully to hard, brutal victory."
								src.contents+=new/obj/Skills/MartialArts/CleanseSatsui
							if(src.AmatsukenAscension=="Satsui no Hado")
								src << "You have cast the last shred of humanity you have into the furnace of victory within your soul.  You have fully mastered and <b>become the Satsui no Hado...</b>"
								src.SatsuiNoHadoMastered=1
								src << "You have developed the <b>Shun Goku Satsu</b>.  To know this technique is to understand horror and not turn ones eyes away."
								src.contents+=new/obj/Skills/MartialArts/ShunGokuSatsu
								src << "Your soul has so thoroughly been corrupted that you can <b>spread this corruption</b> to massively augment their powers..."
								src.contents+=new/obj/Skills/MartialArts/InfectSatsui


						//these stat boosts take place at all levels.
						//not anymore they don't
				else
					src << "Tapping gently on the surface of the fourth wall, you confirm that your martial arts are at the same level as they were the last time you used this verb."

			if("SatsuiNoHado")
				if(!Z.BuffUsing)
					if(src.SatsuiNoHadoMastered)
						src.SatsuiFist=1
						src.OMessage(10, "[src]'s energy takes on a deadly edge...!", "[src]([src.key]) used Satsui no Hado (Mastered)")
					else
						src.Health=100
						src.Energy=src.EnergyMax*2
						src.OMessage(30, "[src]'s power pours out as they commit themselves fully to victory!", "[src]([src.key]) used Satsui no Hado.")
					src.SpeedMultiplier*=1.5
					src.BaseMod*=2
					src.Base*=2
					src.SatsuiNoHado=1
					src.overlays+=image(icon='SatsuiAura.dmi')
					Z.BuffUsing=1
				else
					src.SpeedMultiplier/=1.5
					src.BaseMod/=2
					src.Base/=2
					src.SatsuiNoHado=0
					src.overlays-=image(icon='SatsuiAura.dmi')
					if(src.SatsuiNoHadoMastered)
						src.SatsuiFist=0
						src.OMessage(10, "[src] dissipates their dangerous aura...", "[src]([src.key]) deactivated Satsui no Hado (Mastered)");
					else
						src.Health=-50
						src.Energy=-50
						src.Unconscious(null, "the strain of their rampage")
						src.KO=1
					Z.BuffUsing=0

			if("SatsuiCorruption")
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					src.BaseMod*=2
					src.Base*=2
					src.SpeedMod*=1.5
					src.overlays+=image(icon='SatsuiAura.dmi')
					src.OMessage(10, "[src] focuses only on their urge to win, and this grants them extra power!", "[src]([src.key]) used Satsui Corruption.");
				else
					Z.BuffUsing=0
					src.BaseMod/=2
					src.Base/=2
					src.SpeedMod/=1.5
					src.overlays-=image(icon='SatsuiAura.dmi')
					src.OMessage(10, "[src] gives up their urge to win, and their power sinks.", "[src]([src.key]) deactivates Satsui Corruption.");

			if("HitenMitsurugi")
				if(Z:LastSord < src.HitenMitsurugi)
					src << "Your swordsmanship has advanced to the next level."
					while(Z:LastSord < src.HitenMitsurugi)
						Z:LastSord++
						switch(Z:LastSord)
							if(1)
								src << "You have acquired the power of HITEN MITSURUGI."
								src << "You learn some incredibly flashy sword moves."
								src.DefenseMod*=1.5
								src.Defense*=1.5
								src.SpeedMod*=1.35
								if(!locate(/obj/Skills/Swords/Ryutsuisen, src))
									src.contents+=new/obj/Skills/Swords/Ryutsuisen
									src << "Technique One: Ryutsuisen!  Bring your sword down with twice as much force!"
								if(!locate(/obj/Skills/Swords/Ryukansen, src))
									src.contents+=new/obj/Skills/Swords/Ryukansen
									src << "Technique Two: Ryukansen!  Turn your foes momentum against them with a counter!"
								if(!locate(/obj/Skills/Swords/Ryushosen, src))
									src.contents+=new/obj/Skills/Swords/Ryushosen
									src << "Technique Three: Ryushosen!  Utilize the secret weapon of all swords: The pommel!"
								if(!locate(/obj/Skills/Swords/Doryusen, src))
									src.contents+=new/obj/Skills/Swords/Doryusen
									src << "Technique Four: Doryusen!  Kick debris at your opponent and weaken them!"
							if(2)
								src.ChooseRRKTech()
							if(3)
								src.ChooseRRKTech()
							if(4)
								src.ChooseRRKTech()
							if(5)
								src.SpeedMod*=1.15
								src << "Your full mastery of the Hiten Mitsurugi style grants you inhuman speed."
								src.contents+=new/obj/Skills/Swords/Amakakeru_Ryu_no_Hirameki
								src.HitenMitsurugi=6
							if(6)
								src.SpeedMod*=2
								src.OffenseMod/=2
								src.Offense/=2
								src.DefenseMod/=2
								src.Defense/=2
				else
					src << "You have not subconsciously grasped the next technique of Hiten Mitsurugi."
			if("Ryutsuisen")
				if(src.RRKVars())
					src << "You cannot stack sword techniques."
					return
				if(!Z.Using)
					var/SORD=0
					for(var/obj/Items/Sword/s in src)
						if(s.suffix && s.Damage_Multiplier <1.1)
							SORD=1
							break
						if(s.suffix && src.HitenMitsurugi>=6 && s.Damage_Multiplier < 1.6)
							SORD = 1
							break
					if(!SORD)
						src << "You need to have a light(er) sword to use this technique."
						return
					src.Ryutsuisen=1
					src << "Your next attack will do twice as much damage."
					Z.Cooldown()
			if("Ryukansen")
				if(src.RRKVars())
					src << "You cannot stack sword techniques."
					return
				if(!Z.Using)
					var/SORD=0
					for(var/obj/Items/Sword/s in src)
						if(s.suffix && s.Damage_Multiplier <1.1)
							SORD=1
							break
						if(s.suffix && src.HitenMitsurugi>=6 && s.Damage_Multiplier < 1.6)
							SORD = 1
							break
					if(!SORD)
						src << "You need to have a light(er) sword to use this technique."
						return
					src.Ryukansen=1
					src << "You will dodge the next attack and counter."
					Z.Cooldown()
			if("Ryushosen")
				if(src.RRKVars())
					src << "You cannot stack sword techniques."
					return
				if(!Z.Using)
					var/SORD=0
					for(var/obj/Items/Sword/s in src)
						if(s.suffix && s.Damage_Multiplier <1.1)
							SORD=1
							break
						if(s.suffix && src.HitenMitsurugi>=6 && s.Damage_Multiplier < 1.6)
							SORD = 1
							break
					if(!SORD)
						src << "You need to have a light(er) sword to use this technique."
						return
					src.Ryushosen=1
					src << "Your next attack will knockback and stun."
					if(Z.Cooldown!=120)
						Z.Cooldown=120
					Z.Cooldown()
			if("Doryusen")
				if(src.RRKVars())
					src << "You cannot stack sword techniques."
					return
				if(!Z.Using)
					var/SORD=0
					for(var/obj/Items/Sword/s in src)
						if(s.suffix && s.Damage_Multiplier <1.1)
							SORD=1
							break
						if(s.suffix && src.HitenMitsurugi>=6 && s.Damage_Multiplier < 1.6)
							SORD = 1
							break
					if(!SORD)
						src << "You need to have a light(er) sword to use this technique."
						return
					if(src.Attacking) return
					flick("Attack",src)
					src.Attacking=1
					spawn((src.Refire/Z.Speed*(1/sqrt(Z.Level*Z.Level))*100)+1) src.Attacking=0
					var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
					A.Distance=Distance
					A.pixel_y=rand(-16,16)
					A.pixel_x=rand(-16,16)
					A.dir=src.dir
					A.icon=Z.sicon
					A.icon_state=Z.sicon_state
					A.Owner=src
					A.Lethality=src.Lethal
					A.Physical=1
					A.Elemental="Earth"
					A.Damage_Multiplier=0.25
					A.Offense=(src.Offense*src.OffenseMultiplier)
					Z.Cooldown()
			if("Kuzuryusen")
				if(src.RRKVars())
					src << "You cannot stack sword techniques."
					return
				if(!Z.Using)
					var/SORD=0
					for(var/obj/Items/Sword/s in src)
						if(s.suffix && s.Damage_Multiplier <1.1)
							SORD=1
							break
						if(s.suffix && src.HitenMitsurugi>=6 && s.Damage_Multiplier < 1.6)
							SORD = 1
							break
					if(!SORD)
						src << "You need to have a light(er) sword to use this technique."
						return
					src.Kuzuryusen=1
					src << "Your next attack will unleash a nine hit combo."
					Z.Cooldown()
			if("Soryusen")
				if(src.RRKVars())
					src << "You cannot stack sword techniques."
					return
				if(!Z.Using)
					var/SORD=0
					for(var/obj/Items/Sword/s in src)
						if(s.suffix && s.Damage_Multiplier <1.1)
							SORD=1
							break
						if(s.suffix && src.HitenMitsurugi>=6 && s.Damage_Multiplier < 1.6)
							SORD = 1
							break
					if(!SORD)
						src << "You need to have a light(er) sword to use this technique."
						return
					src.Soryusen=1
					src << "Your next attack will do a two hit combo."
					Z.Cooldown()
			if("Ryumeisen")
				if(src.RRKVars())
					src << "You cannot stack sword techniques."
					return
				if(!Z.Using)
					var/SORD=0
					for(var/obj/Items/Sword/s in src)
						if(s.suffix && s.Damage_Multiplier <1.1)
							SORD=1
							break
						if(s.suffix && src.HitenMitsurugi>=6 && s.Damage_Multiplier < 1.6)
							SORD = 1
							break
					if(!SORD)
						src << "You need to have a light(er) sword to use this technique."
						return
					src.OMessage(20, "[src] sheathes their sword with a force that creates a sonic boom!", "[src]([src.key]) used Ryumeisen.")
					Z.Cooldown()
					for(var/mob/m in view(20, src))
						if(m == src)
							continue
						Stun(m,3)
						m << "You feel frozen from [src]'s shockwave!"
						spawn(30)
							m << "You regain your composure."
			if("DemonEnergyShield")
				if(!Z.Using)
					src.OMessage(10, "[src] glows with a demonic light!", "[src]([src.key]) used Demon Energy Shield.")
					src.DemonEnergyShield=1
					src.Frozen=1
					Z.Cooldown()
					spawn(50)
						src.DemonEnergyShield=0
						src.Frozen=0
						view(10, src) << "The light fades away from [src]."
			if("DonateRPP")
				var/list/people=list("Cancel")
				var/CurrentRPP=src.SkillPoints
				for(var/mob/Players/M in view(5))
					people.Add(M)
				var/mob/Choice=input("Give RPP Points to who?")in people
				if(Choice=="Cancel")return
				var/RPPamount=input("Choose amount of RPPs to donate","(1-[CurrentRPP])")as num
				RPPamount=round(RPPamount)
				if(RPPamount<1)return
				else if(RPPamount>CurrentRPP)return
				else
					src.SkillPoints-=RPPamount //Here too
					Choice.SkillPoints+=RPPamount //Also here
			/*if("GrantDevPoints")
				var/list/people=list("Cancel")
//				var/CurrentRPP=src.SkillPoints
				for(var/mob/Players/M in view(5))
					people.Add(M)
				var/mob/Choice=input("Give Dev Points to who?")in people
				if(Choice=="Cancel")return
				var/RPPamount=input("Choose amount of Dev Points to donate","(1-[DevPointBank])")as num
				var/DevPointAmount=round(RPPamount)
				if(RPPamount<1)return
				else if(RPPamount>src.DevPointBank)return
				else
					src.DevPointBank-=RPPamount //Here too
					Choice.SpendableDevPoints+=DevPointAmount //Also here
					Choice.TotalDevPoints+=DevPointAmount
					Choice.DonatedDevPoints+=DevPointAmount
					Log("Admin","[src] has granted [DevPointAmount] dev points to [ExtractInfo(Choice)].")*/
			if("AetherTransfiguration")
				if(!Z.BuffUsing)
					OMessage(10, "[src] contorts with the power of Aether!", "[src]([src.key]) activated Aether Transfiguration.")
					Z.BuffUsing=1
					Z.CustomBPadd = src.BaseMod * 10000000
					if(src.trans["unlocked"] >= 2)
						Z.CustomBPadd*=5
					src.PlusPower+=Z.CustomBPadd
					src.StrengthMultiplier*=(1+(Z.CustomStr/10))
					src.EnduranceMultiplier*=(1+(Z.CustomDura/10))
					src.ForceMultiplier*=(1+(Z.CustomForce/10))
					src.ResistanceMultiplier*=(1+(Z.CustomRes/10))
					src.OffenseMultiplier*=(1+(Z.CustomOff/10))
					src.DefenseMultiplier*=(1+(Z.CustomDef/10))
					src.RecoveryMultiplier*=(1+(Z.CustomRecov/10))
					var/icon/W=icon('Effects.dmi',"Shock")
					src.Shockwave(W, 1)
					Quake(10)
					if(src.BaseMod > 2)
						src.Shockwave(W, 2)
						Quake(20)
					if(src.BaseMod > 4.5)
						src.Shockwave(W, 3)
						Quake(30)
					if(src.BaseMod > 7.5)
						src.Shockwave(W, 4)
						Quake(40)
					src.BaseMod*=2
					src.Base*=2
					Z:OldBody = src.icon
					var/icon/i = src.Hair_Base
					i+=src.Hair_Color
					Z:OldHair=i
					src.overlays -= i
					src.overlays += Z:NewHair
					src.overlays += image(icon=Z:NewAura, pixel_x=Z:auraX, pixel_y=Z:auraY)
					src.icon = Z:NewBody

				else
					Z.BuffUsing=0
					src.PlusPower -= Z.CustomBPadd
					src.StrengthMultiplier/=(1+(Z.CustomStr/10))
					src.EnduranceMultiplier/=(1+(Z.CustomDura/10))
					src.ForceMultiplier/=(1+(Z.CustomForce/10))
					src.ResistanceMultiplier/=(1+(Z.CustomRes/10))
					src.OffenseMultiplier/=(1+(Z.CustomOff/10))
					src.DefenseMultiplier/=(1+(Z.CustomDef/10))
					src.RecoveryMultiplier/=(1+(Z.CustomRecov/10))
					src.BaseMod/=2
					src.Base/=2
					src.icon = Z:OldBody
					src.overlays-=Z:NewHair
					src.overlays+=Z:OldHair
					src.overlays-=image(icon=Z:NewAura, pixel_x=Z:auraX, pixel_y=Z:auraY)
					OMessage(10, "[src]'s Aether receeds...", "[src]([src.key]) deactivated Aether Transfiguration.")
			if("ManifestKeyblade")
				for(var/obj/Items/Sword/S in src) if(S.suffix)
					src.KeybladeLevel=1
					S.Accuracy_Multiplier=1.5
					S.Damage_Multiplier=1.5
					S.Delay_Multiplier=1.5
					S.KeybladeOwner="[src.key]"
					S.Keyblade=1
					S.Explosive=0
					S.Homing=0
					S.Points=0
					S.PointsAssigned=1
					S.Enchanted=1
					S.EnchantType="None"
					var/choice = input(src, "Do you wish to wield light or darkness?", "Permanent choice.") in list("Light", "Dark","Nothingness")
					if(choice=="Light")
						src.KeybladeElement="Light"
						src.overlays-=S.icon
						S.icon='Kingdom Key.dmi'
						src.overlays+=S.icon
					if(choice=="Dark")
						src.KeybladeElement="Dark"
						src.overlays-=S.icon
						S.icon='Soul Eater.dmi'
						src.overlays+=S.icon
					if(choice=="Nothingness")
						src.KeybladeElement="Nothingness"
						src.overlays-=S.icon
						S.icon='KingdomKeyD.dmi'
						src.overlays+=S.icon
						/*if(!locate(/obj/Skills/Buffs/DriveForm,src.contents))
							src.contents += new/obj/Skills/Buffs/DriveForm*/
					src.PrevX=src.x
					src.PrevY=src.y
					src.PrevZ=src.z
					src.Frozen=1
					src << "Keyblade...Keyblade..."
					src << "Power sleeps within you."
					sleep(5)
					src.OMessage(10, "[src] vanishes in a flash of light!", "[src]([src.key]) used Dive into the Heart.")
					src.loc = locate(223, 400, 13)
					src << "Decide what door to open."
					sleep(5)
					src << "To the left lies the shield - The power of the guardian.  Kindness to aid friends...A shield to repel all."
					sleep(5)
					src << "To the right lies the staff - The power of the mystic.  Inner strength...A staff of wonder and ruin."
					sleep(5)
					src << "And below lies the sword - The power of the warrior. Invincible courage...A sword of terrible destruction."
					sleep(5)
					src << "You may choose only one.  Which do you choose? (Click while next to it to choose)"
					src.Frozen=0

				//for(var/obj/Skills/Keyblade/ManifestKeyblade/hm in src)
				//	del hm
			if("CallKeyblade")
				spawn()src.KeybladeAscensions()
				for(var/obj/Items/Sword/S in src) if(S.suffix)
					S.Accuracy_Multiplier=1.5
					S.Damage_Multiplier=1.5
					S.Delay_Multiplier=1.5
					S.Keyblade=1
					S.Explosive=0
					S.Homing=0
					S.Points=0
					S.PointsAssigned=1
					S.Enchanted=1
					S.EnchantType="None"
					if(src.KeybladeElement=="Light")
						src.overlays-=S.icon
						S.icon='Kingdom Key.dmi'
						src.overlays+=S.icon
						src.OMessage(10, "[src] calls forth their Keyblade with a flash of light!", "[src]([src.key]) used Call Keyblade.")
					if(src.KeybladeElement=="Dark")
						src.overlays-=S.icon
						S.icon='Soul Eater.dmi'
						src.overlays+=S.icon
						src.OMessage(10, "[src] calls forth their Keyblade with a burst of darkness!", "[src]([src.key]) used Call Keyblade.")
			if("BestowKeyblade")
				var/list/choices=list("Cancel")
				for(var/mob/m in oview(12))
					choices+=m
				var/mob/choice = input(src, "Who do you want to give your Keyblade to?", "Bestow Keyblade") in choices
				if(choice=="Cancel"||choice==src)
					return
				choice.KeybladeLevel=src.KeybladeLevel
				src.KeybladeLevel=0
				choice.KeybladeElement=src.KeybladeElement
				src.KeybladeElement=null
				if(choice.KeybladeElement=="Light")
					src.OMessage(30, "[src]'s Keyblade vanishes in a burst of light!", "[src]([src.key]) used Bestow Keyblade on [choice].")
				if(choice.KeybladeElement=="Dark")
					src.OMessage(30, "[src]'s Keyblade vanishes in a flash of darkness!", "[src]([src.key]) used Bestow Keyblade on [choice].")
			if("DriveForm")
				if(!Z.BuffUsing)
					if(src.DriveCounter<=30)
						src<<"You need to wait before Driving again."
						return
					if(src.SpecialSlot) return
					if(Z:SpamLockout==1)
						usr<<"Stop spamming Drive!"
						return
					src.SpecialSlot=1
					Z.BuffUsing=1
					if(src.Energy<src.EnergyMax/10)return
					Z:SpamLockout=1
					var/list/ChosenKeybladeLevel=list("Valor")
					if(src.KeybladeLevel>=1)
						ChosenKeybladeLevel.Add("Wisdom")
					if(src.KeybladeLevel>=3)
						ChosenKeybladeLevel.Add("Master")
					if(src.KeybladeLevel>=4)
						ChosenKeybladeLevel.Add("Final")
					ChosenKeybladeLevel.Add("Cancel")
					Z:KeybladeLevelSelected=input("Pick a Drive level!") in ChosenKeybladeLevel
					if(Z:KeybladeLevelSelected=="Cancel")
						Z:SpamLockout=0
						src.SpecialSlot=0
						return
					if(prob(AntiFormCounter))
						Z:KeybladeLevelSelected="Anti"
					if(Z:KeybladeLevelSelected=="Valor")
						if(src.HasKeyblade("Nothingness", 1))
							src.Power_Multiplier+=0.25
						src.Power_Multiplier+=0.5
						src.OffenseMultiplier*=1.55
						src.StrengthMultiplier*=1.55
						src.DriveType="Valor"
						src.DriveCounter=180
						src.AntiFormCounter+=15
						src.overlays+='ValorFormElec.dmi'
						src.OMessage(30,"[src] surrounded themselves in a red aura, increasing their physical might!","<font color=red>[src]([src.key]) activated Valor Form.")
					else if(Z:KeybladeLevelSelected=="Wisdom")
						if(src.HasKeyblade("Nothingness", 1))
							src.Power_Multiplier+=0.25
						src.Power_Multiplier+=0.5
						src.SpeedMultiplier*=1.25
						src.ForceMultiplier*=1.55
						src.AntiFormCounter+=15
						src.DriveType="Wisdom"
						src.overlays+='WisdomFormElec.dmi'
						src.OMessage(30,"[src] surrounded themselves in a blue aura, increasing their spiritual might!","<font color=red>[src]([src.key]) activated Wisdom Form.")
					else if(Z:KeybladeLevelSelected=="Master")
						if(src.HasKeyblade("Nothingness", 1))
							src.Power_Multiplier+=0.5
						src.Power_Multiplier+=0.5
						src.SpeedMultiplier*=1.45
						src.StrengthMultiplier*=1.45
						src.ForceMultiplier*=1.45
						src.AntiFormCounter+=15
						src.DriveType="Master"
						src.DriveCounter=105
						src.overlays+='MasterFormElec.dmi'
						src.OMessage(30,"[src] surrounded themselves in a yellow aura, bringing their physical and spiritual might to its apex!","<font color=red>[src]([src.key]) activated Master Form.")
					else if(Z:KeybladeLevelSelected=="Final")
						if(src.HasKeyblade("Nothingness", 1))
							src.Power_Multiplier+=0.5
						src.Power_Multiplier+=1
						src.SpeedMultiplier*=2
						src.OffenseMultiplier*=1.5
						src.StrengthMultiplier*=1.75
						src.ForceMultiplier*=1.75
						src.DriveType="Final"
						src.AntiFormCounter=0
						src.DriveCounter=60
						src.overlays+=image('FinalFormAura.dmi',pixel_x=-32)
						src.OMessage(30,"[src] surrounded themselves in a silver aura, commanding the full power of light and darkness!","<font color=red>[src]([src.key]) activated Final Form.")
					else if(Z:KeybladeLevelSelected=="Anti")
						if(src.HasKeyblade("Nothingness", 1))
							src.Power_Multiplier+=0.25
						src.Power_Multiplier+=0.5
						src.SpeedMultiplier*=2
						src.OffenseMultiplier*=1.5
						src.StrengthMultiplier*=0.5
						src.EnduranceMultiplier*=0.75
						src.DriveType="Anti"
						src.AntiFormCounter=0
						src.DriveCounter=60
						src.overlays+='blackflameaura.dmi'
						src<<"Once you attack, you'll ruthlessly pursue your opponent with no end."
						src.OMessage(30,"[src] loses control of their power, bringing forth their innermost darkness!","<font color=red>[src]([src.key]) activated Anti-Form.")

					src.DriveActive=1
					Z:SpamLockout=0
				else
					if(src.DriveType=="Anti" && src.DriveCounter>=11)
						src<<"You cannot revert from Anti-Form yet."
						return
					src.DriveActive=0
					src.SpecialSlot=0
					Z.BuffUsing=0
					src.OMessage(30,"[src] deactivates their Drive Form!","<font color=red>[src]([src.key]) deactivated Drive.")
					if(Z:KeybladeLevelSelected=="Valor")
						if(src.HasKeyblade("Nothingness", 1))
							src.Power_Multiplier-=0.25
						src.Power_Multiplier-=0.5
						src.OffenseMultiplier/=1.55
						src.StrengthMultiplier/=1.55
						src.DriveType="None"
						src.overlays-='ValorFormElec.dmi'
					else if(Z:KeybladeLevelSelected=="Wisdom")
						if(src.HasKeyblade("Nothingness", 1))
							src.Power_Multiplier-=0.25
						src.Power_Multiplier-=0.5
						src.SpeedMultiplier/=1.25
						src.ForceMultiplier/=1.55
						src.DriveType="None"
						src.overlays-='WisdomFormElec.dmi'
					else if(Z:KeybladeLevelSelected=="Master")
						if(src.HasKeyblade("Nothingness", 1))
							src.Power_Multiplier-=0.5
						src.Power_Multiplier-=0.5
						src.SpeedMultiplier/=1.45
						src.StrengthMultiplier/=1.45
						src.ForceMultiplier/=1.45
						src.DriveType="None"
						src.DriveCounter=0
						src.overlays-='MasterFormElec.dmi'
					else if(Z:KeybladeLevelSelected=="Final")
						if(src.HasKeyblade("Nothingness", 1))
							src.Power_Multiplier-=0.5
						src.Power_Multiplier-=1
						src.SpeedMultiplier/=2
						src.OffenseMultiplier/=1.5
						src.StrengthMultiplier/=1.75
						src.ForceMultiplier/=1.75
						src.DriveType="None"
						src.AntiFormCounter=0
						src.DriveCounter=0
						src.overlays-=image('FinalFormAura.dmi',pixel_x=-32)
					else if(Z:KeybladeLevelSelected=="Anti")
						if(src.HasKeyblade("Nothingness", 1))
							src.Power_Multiplier-=0.25
						src.Power_Multiplier-=0.5
						src.SpeedMultiplier/=2
						src.OffenseMultiplier/=1.5
						src.StrengthMultiplier/=0.5
						src.EnduranceMultiplier/=0.75
						src.DriveType="None"
						src.AntiFormCounter=0
						src.DriveCounter=0
						src.overlays-='blackflameaura.dmi'
			if("DarkMode")
				if(src.DarkMode) return
				if(src.DarkModeCD) return
				if(src.Alert("You sure you want to use Dark Mode?"))
					src.DarkMode=3000
					src.OMessage(10, "[src] encases themselves in a bodysuit of darkness!", "[src]([src.key]) used Dark Mode!")
					src.overlays+='blackflameaura.dmi'
					spawn(3000)
						src.overlays-='blackflameaura.dmi'
						src.DarkMode=0
						src.OMessage(10, "[src]'s dark bodysuit disperses...","[src]([src.key])'s Dark Mode wore off...")
						if(src.KeybladeLevel < 3)
							src.Anger=0
						src.DarkModeCD=1
						spawn(3000)
							src << "You can use Dark Mode again."
							src.DarkModeCD=0
			if("WeaponMaster")
				if(!Z.BuffUsing)
					var/SwordCheck=0
					for(var/obj/Items/Sword/S in usr)
						if(S.suffix)
							SwordCheck=1
							if(src.ActiveBuffs)
								src << "Too many buffs."
								return
							src.ActiveBuffs+=3
							Z.BuffUsing=1
							src.Power_Multiplier+=0.75
							src.StrengthMultiplier*=2
							src.SpeedMultiplier*=1.25
							src.OffenseMultiplier*=1.5
							//src.DefenseMultiplier*=0.8
							src.overlays-=image(icon=Z.sicon,pixel_x=Z.pixel_x,pixel_y=Z.pixel_y)
							src.overlays+=image(icon=Z.sicon,pixel_x=Z.pixel_x,pixel_y=Z.pixel_y)
							src<<"You are now tapping into the fury of a skilled Weapon Master."
							src.OMessage(10,null,"[src]([src.key]) has a raging aura form around them!")
//						else if(!S.suffix && !Z.BuffUsing)
//							src<<"You can't use this without a sword equiped!"
					if(!SwordCheck)
						src<<"You can't use this without a sword equiped!"
						return
				else
					src.ActiveBuffs=0
					src.Power_Multiplier-=0.75
					src.StrengthMultiplier/=2
					src.SpeedMultiplier/=1.25
					src.OffenseMultiplier/=1.5
//					src.DefenseMultiplier/=0.8
					src<<"You stop using your furious power."
					src.OMessage(10,null,"[src]([src.key])'s raging aura fades!")
					src.overlays-=image(icon=Z.sicon,pixel_x=Z.pixel_x,pixel_y=Z.pixel_y)
					Z.BuffUsing=0
				sleep(20)

			if("RedHenshin")
				if(!locate(/obj/Items/RedVWatch, src))
					return
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1)
						src<<"You're using too many buffs!"
						return
					if(src.SpecialSlot)
						src << "You can't channel your inner Oxywaddle with other special powers!"
						return
					src.SpecialSlot=1
					Z.BuffUsing=1
					src<<"GET IN THERE! ACTION!"
					src.OMessage(10,"[src] is enveloped in a light that slowly dims to reveal a red suit has materialized on their body!")
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>HENSHIN-A-GO-GO, BABY!</b>"
					if(src.WatchType=="Muscle")
						src.StrengthMultiplier*=1.5
					if(src.WatchType=="Skin")
						src.EnduranceMultiplier*=1.35
						src.ResistanceMultiplier*=1.35
					if(src.WatchType=="Eyes")
						src.OffenseMultiplier*=1.35
						src.DefenseMultiplier*=1.35
					if(src.WatchType=="Ki")
						src.ForceMultiplier*=1.5
					if(src.WatchLevel==0)
						src.Power_Multiplier+=0.25
					if(src.WatchLevel==1)
						src.Power_Multiplier+=0.5
						if(!locate(/obj/Skills/Buffs/Slow, src))
							src.contents+=new/obj/Skills/Buffs/Slow
						if(!locate(/obj/Skills/Rank/RedKick,src))
							src.contents+=new/obj/Skills/Rank/RedKick
					if(src.WatchLevel==2)
						src.Power_Multiplier+=0.75
						if(!locate(/obj/Skills/Buffs/Fast, src))
							src.contents+=new/obj/Skills/Buffs/Fast
						if(!locate(/obj/Skills/Rank/RedHotOneHundred,src))
							src.contents+=new/obj/Skills/Rank/RedHotOneHundred
					if(src.WatchLevel==3)
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)
								E<<"<font color=[C.Text_Color]>[src] yells: <b>My kinda' juice!</b>"
						src.Power_Multiplier+=1
						if(!locate(/obj/Skills/Buffs/Mach, src))
							src.contents+=new/obj/Skills/Buffs/Mach
				else
					if(src.WatchType=="Muscle")
						src.StrengthMultiplier/=1.5
					if(src.WatchType=="Skin")
						src.EnduranceMultiplier/=1.35
						src.ResistanceMultiplier/=1.35
					if(src.WatchType=="Eyes")
						src.OffenseMultiplier/=1.35
						src.DefenseMultiplier/=1.35
					if(src.WatchType=="Ki")
						src.ForceMultiplier/=1.5
					if(src.WatchLevel==0)
						src.Power_Multiplier-=0.25
					if(src.WatchLevel==1)
						src.Power_Multiplier-=0.5
					if(src.WatchLevel==2)
						src.Power_Multiplier-=0.75
					if(src.WatchLevel==3)
						src.Power_Multiplier-=1
					src<<"Calm down, bro!"
					src.OMessage(10,"[src] watches as their red suit fades into oblivion!")
					src.SpecialSlot=0
					Z.BuffUsing=0

			if("BlueHenshin")
				if(!locate(/obj/Items/BlueVWatch, src))
					return
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1)
						src<<"You're using too many buffs!"
						return
					if(src.SpecialSlot)
						src << "You can't channel your inner Oxywaddle with other special powers!"
						return
					src.SpecialSlot=1
					Z.BuffUsing=1
					src<<"GET IN THERE! ACTION!"
					src.OMessage(10,"[src] is enveloped in a light that slowly dims to reveal a blue suit has materialized on their body!")
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>Henshin..!</b>"
					if(src.WatchType=="Power")
						src.StrengthMultiplier*=1.35
						src.EnduranceMultiplier*=1.35
					if(src.WatchType=="Accuracy")
						src.OffenseMultiplier*=1.5
					if(src.WatchLevel==0)
						src.Power_Multiplier+=0.5
					if(src.WatchLevel==1)
						src.Power_Multiplier+=0.75
					if(src.WatchLevel==2)
						src.Power_Multiplier+=1.5
						if(!locate(/obj/Skills/Buffs/DirectorsCut, src))
							src.contents+=new/obj/Skills/Buffs/DirectorsCut
				else
					if(src.WatchType=="Power")
						src.StrengthMultiplier/=1.35
						src.EnduranceMultiplier/=1.35
					if(src.WatchType=="Accuracy")
						src.OffenseMultiplier/=1.5
					if(src.WatchLevel==0)
						src.Power_Multiplier-=0.5
					if(src.WatchLevel==1)
						src.Power_Multiplier-=0.75
					if(src.WatchLevel==2)
						src.Power_Multiplier-=1.5
					src<<"Calm down, bro!"
					src.OMessage(10,"[src] watches as their blue suit fades into oblivion!")
					src.SpecialSlot=0
					Z.BuffUsing=0

			if("BlackHenshin")
				if(!locate(/obj/Items/BlackVWatch, src))
					return
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1)
						src<<"You're using too many buffs!"
						return
					if(src.SpecialSlot)
						src << "You can't channel your inner Oxywaddle with other special powers!"
						return
					src.SpecialSlot=1
					Z.BuffUsing=1
					src<<"GET IN THERE! ACTION!"
					src.OMessage(10,"[src] is enveloped in a light that slowly dims to reveal a black suit has materialized on their body!")
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>Henshin..!</b>"
					if(src.WatchType=="Muscle")
						src.StrengthMultiplier*=1.5
					if(src.WatchType=="Skin")
						src.EnduranceMultiplier*=1.35
						src.ResistanceMultiplier*=1.35
					if(src.WatchType=="Eyes")
						src.OffenseMultiplier*=1.35
						src.DefenseMultiplier*=1.35
					if(src.WatchType=="Ki")
						src.ForceMultiplier*=1.5
					if(src.WatchLevel==0)
						src.Power_Multiplier+=0.35
					if(src.WatchLevel==1)
						src.Power_Multiplier+=0.65
					if(src.WatchLevel==2)
						src.Power_Multiplier+=0.95
						if(!locate(/obj/Skills/Rank/JetSlash, src))
							src.contents+=new/obj/Skills/Rank/JetSlash
					if(src.WatchLevel==3)
						src.Power_Multiplier+=1.5
						if(!locate(/obj/Skills/Buffs/DarkHero, src))
							src.contents+=new/obj/Skills/Buffs/DarkHero
				else
					if(src.WatchType=="Muscle")
						src.StrengthMultiplier/=1.5
					if(src.WatchType=="Skin")
						src.EnduranceMultiplier/=1.35
						src.ResistanceMultiplier/=1.35
					if(src.WatchType=="Eyes")
						src.OffenseMultiplier/=1.35
						src.DefenseMultiplier/=1.35
					if(src.WatchType=="Ki")
						src.ForceMultiplier/=1.5
					if(src.WatchLevel==0)
						src.Power_Multiplier-=0.35
					if(src.WatchLevel==1)
						src.Power_Multiplier-=0.65
					if(src.WatchLevel==2)
						src.Power_Multiplier-=0.95
					if(src.WatchLevel==3)
						src.Power_Multiplier-=1.5
					src<<"Calm down, bro!"
					src.OMessage(10,"[src] watches as their black suit fades into oblivion!")
					src.SpecialSlot=0
					Z.BuffUsing=0

			if("Fast")
				if(!Z.BuffUsing)
					if(!locate(/obj/Items/RedVWatch, src)) return
					if(src.ActiveBuffs>=2) return
					src.ActiveBuffs+=3
					SpeedMultiplier*=1.35
					src<<"Gotta go fast!"
					Z.BuffUsing=1
				else
					SpeedMultiplier/=1.35
					src.ActiveBuffs-=3
					src<<"Gotta go slow!"
					Z.BuffUsing=0

			if("Slow")
				if(!Z.BuffUsing)
					if(!locate(/obj/Items/RedVWatch, src)) return
					if(src.ActiveBuffs>=2) return
					src.ActiveBuffs+=3
					SpeedMultiplier/=2
					StrengthMultiplier*=1.25
					EnduranceMultiplier*=1.25
					ResistanceMultiplier*=1.25
					ForceMultiplier*=1.25
					src<<"Gotta speed down!"
					Z.BuffUsing=1
				else
					SpeedMultiplier*=2
					StrengthMultiplier/=1.25
					EnduranceMultiplier/=1.25
					ResistanceMultiplier/=1.25
					ForceMultiplier/=1.25
					src<<"Gotta' speed up!"
					src.ActiveBuffs-=3
					Z.BuffUsing=0

			if("Mach")
				if(!Z.BuffUsing)
					if(!locate(/obj/Items/RedVWatch, src)) return
					if(src.ActiveBuffs>=2) return
					src.ActiveBuffs+=3
					SpeedMultiplier*=2
					StrengthMultiplier*=0.85
					EnduranceMultiplier*=0.85
					ResistanceMultiplier*=0.85
					ForceMultiplier*=0.85
					src<<"Gotta go EVEN FASTER, OH BOY!"
					Z.BuffUsing=1
				else
					SpeedMultiplier/=2
					StrengthMultiplier/=0.85
					EnduranceMultiplier/=0.85
					ResistanceMultiplier/=0.85
					ForceMultiplier/=0.85
					src.ActiveBuffs-=3
					src<<"Gotta take a break... ):"
					Z.BuffUsing=0

			if("DarkHero")
				if(!Z.BuffUsing)
					if(!locate(/obj/Items/BlackVWatch, src)) return
					StrengthMultiplier*=1.25
					SpeedMultiplier*=1.35
					OffenseMultiplier*=1.15
					DefenseMultiplier*=1.15
					src<<"You embrace your dark nature."
					Z.BuffUsing=1
				else
					StrengthMultiplier/=1.25
					SpeedMultiplier/=1.35
					OffenseMultiplier/=1.15
					DefenseMultiplier/=1.15
					src<<"You return to a neutral state."
					Z.BuffUsing=0

			if("DirectorsCut")
				if(!Z.BuffUsing)
					if(!locate(/obj/Items/BlueVWatch, src)) return
					if(src.ActiveBuffs>2) return
					src.ActiveBuffs+=3
					SpeedMultiplier*=3
					src.Anger=src.AngerMax
					src<<"Paint the scene with blood!"
					Z.BuffUsing=1
				else
					src.ActiveBuffs-=3
					SpeedMultiplier/=3
					src.Anger=1
					src<<"Put your damn brush down. Like, damn."
					Z.BuffUsing=0

			if("SpiritEnergyRevamp")
				if(!Z.BuffUsing)
					if(src.SpecialSlot)
						src << "You can't use Spirit Energy with other special buffs."
						return
					src.SpecialSlot=1
					Z.BuffUsing=1
					var/list/SpiritLevelSelect=new("Cancel")
					if(src.SpiritLevel>=0)
						SpiritLevelSelect+="Level One"
					if(src.SpiritLevel>=1)
						SpiritLevelSelect+="Level Two"
					if(src.SpiritLevel>=2)
						SpiritLevelSelect+="Level Three"
					if(src.SpiritLevel>=3)
						SpiritLevelSelect+="Level Four"
					if(src.SpiritLevel>=4&&src.SpiritWeaponChosen!="Style")
						SpiritLevelSelect+="Level Five"
					Z.CustomBPmod=input("Select the level of Spirit Energy you'd like to use.")in SpiritLevelSelect
					if(Z.CustomBPmod=="Level One")
						Z.CustomBPmod=0
					else if(Z.CustomBPmod=="Level Two")
						Z.CustomBPmod=1
					else if(Z.CustomBPmod=="Level Three")
						Z.CustomBPmod=2
					else if(Z.CustomBPmod=="Level Four")
						Z.CustomBPmod=3
					else if(Z.CustomBPmod=="Level Five")
						Z.CustomBPmod=4
					if(!Z.CustomBPmod)
						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src] begins to emit a dark glow of energy.","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.Base*=1.45
							src.BaseMod*=1.45
						else
							src.OMessage(10,"[src] begins to emit a light glow of energy.","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.StrengthMultiplier*=1.15
							src.EnduranceMultiplier*=1.15
							src.ForceMultiplier*=1.15
							src.ResistanceMultiplier*=1.15
							src.OffenseMultiplier*=1.15
							src.DefenseMultiplier*=1.15
							src.Base*=1.15
							src.BaseMod*=1.15

					if(Z.CustomBPmod==1)

						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src] forces an aura to permeate menacingly.","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.Base*=1.45
							src.BaseMod*=1.45
							src.StrengthMultiplier*=1.15
							src.EnduranceMultiplier*=1.15
							src.ForceMultiplier*=1.15
							src.ResistanceMultiplier*=1.15
							src.OffenseMultiplier*=1.15
							src.DefenseMultiplier*=1.15

						else
							src.OMessage(10,"[src]'s body is bathed in a gentle illumination.","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.StrengthMultiplier*=1.25
							src.EnduranceMultiplier*=1.25
							src.ForceMultiplier*=1.25
							src.ResistanceMultiplier*=1.25
							src.OffenseMultiplier*=1.25
							src.DefenseMultiplier*=1.25
							src.Base*=1.2
							src.BaseMod*=1.2

					if(Z.CustomBPmod==2)
						if(!src.SpiritWeaponChosen)
							src.SpiritWeaponChosen=1
							var/list/spiritenergylist
							if(src.Race=="Demon"||src.Race=="Half Demon")
								spiritenergylist=list("Muscle","Demon Gun","Slicer")
							else
								spiritenergylist=list("Spirit Gun","Spirit Sword")
								if(src.SpiritStyleUnlocked)
									spiritenergylist+="Spirit Style"
							var/choice = input(src, "How do you want to hone your Spirit Energy?", "Spirit Weapon") in spiritenergylist
							if(choice=="Spirit Gun")
								src.contents+=new/obj/Skills/Attacks/SpiritGun
								src << "The ability to fire blasts composed of your energy...the Spirit Gun."
							if(choice=="Spirit Sword")
								src.contents+=new/obj/Skills/Attacks/SpiritSword
								src << "The ability to call upon a sword constructed from your energy...the Spirit Sword."
							if(choice=="Spirit Style")
								src.ResshukenUnlocked=1
								src << "The ability to access enhanced fighting styles...the Resshuken."
							if(choice=="Muscle")
								src << "The ability to swell your muscles to unbelievable levels...at the cost of your Demon Energy."
								src.contents-=/obj/Skills/Buffs/SpiritEnergy
								src.contents+=new/obj/Skills/Buffs/PercentagePower
								src.SpecialSlot=0
								return
							if(choice=="Demon Gun")
								src.contents+=new/obj/Skills/Attacks/SpiritGun
								src << "The ability to fire blasts composed of your energy...the Demon Gun."
							if(choice=="Slicer")
								src << "lol Jesse probably has to actually do this one."
								return

							src.SpiritWeaponChosen=choice

						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src]'s aura becomes suffoatingly powerful!","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.Base*=1.6
							src.BaseMod*=1.6
							src.StrengthMultiplier*=1.20
							src.EnduranceMultiplier*=1.20
							src.ForceMultiplier*=1.20
							src.ResistanceMultiplier*=1.20
							src.OffenseMultiplier*=1.20
							src.DefenseMultiplier*=1.20


						else
							src.OMessage(10,"[src] gleams with a brilliant light!","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.StrengthMultiplier*=1.35
							src.EnduranceMultiplier*=1.35
							src.ForceMultiplier*=1.35
							src.ResistanceMultiplier*=1.35
							src.OffenseMultiplier*=1.35
							src.DefenseMultiplier*=1.35
							src.Base*=1.3
							src.BaseMod*=1.3

					if(Z.CustomBPmod==3)
						spawn()
							Quake(10)
							Quake(20)
							Quake(30)
						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src] releases a flare that causes the ground to tremble!","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.Base*=1.75
							src.BaseMod*=1.75
							src.StrengthMultiplier*=1.2
							src.EnduranceMultiplier*=1.2
							src.ForceMultiplier*=1.2
							src.ResistanceMultiplier*=1.2
							src.OffenseMultiplier*=1.2
							src.DefenseMultiplier*=1.2
						else
							src.OMessage(10,"[src] releases a vibrant radiance!","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.StrengthMultiplier*=1.4
							src.EnduranceMultiplier*=1.4
							src.ForceMultiplier*=1.4
							src.ResistanceMultiplier*=1.4
							src.OffenseMultiplier*=1.4
							src.DefenseMultiplier*=1.4
							src.Base*=1.4
							src.BaseMod*=1.4

					if(Z.CustomBPmod==4)
						spawn()
							Quake(15)
							Quake(30)
							Quake(45)
						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src]'s crushing aura causes the ground itself to wail!","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.Base*=2
							src.BaseMod*=2
							src.StrengthMultiplier*=1.325
							src.EnduranceMultiplier*=1.325
							src.ForceMultiplier*=1.325
							src.ResistanceMultiplier*=1.325
							src.OffenseMultiplier*=1.325
							src.DefenseMultiplier*=1.325
						else
							src.OMessage(10,"[src] is surging with the utmost brilliance!","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.StrengthMultiplier*=1.75
							src.EnduranceMultiplier*=1.75
							src.ForceMultiplier*=1.75
							src.ResistanceMultiplier*=1.75
							src.OffenseMultiplier*=1.75
							src.DefenseMultiplier*=1.75
							src.Base*=1.5
							src.BaseMod*=1.5


				else
					Z.BuffUsing=0
					src.SpecialSlot=0
					if(!Z.CustomBPmod)
						if(src.Race!="Demon"&&src.Race!="Half Demon")
							src.StrengthMultiplier/=1.15
							src.EnduranceMultiplier/=1.15
							src.ForceMultiplier/=1.15
							src.ResistanceMultiplier/=1.15
							src.OffenseMultiplier/=1.15
							src.DefenseMultiplier/=1.15
							src.BaseMod/=1.15
							src.Base/=1.15
						else
							src.Base/=1.45
							src.BaseMod/=1.45
						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src]'s crimson glow fades away...","<font color=red>[src]([src.key]) activated Spirit Energy.")
						else
							src.OMessage(10,"[src]'s cerulean glow fades away...","<font color=red>[src]([src.key]) activated Spirit Energy.")
					if(Z.CustomBPmod==1)
						if(src.Race!="Demon"&&src.Race!="Half Demon")
							src.StrengthMultiplier/=1.25
							src.EnduranceMultiplier/=1.25
							src.ForceMultiplier/=1.25
							src.ResistanceMultiplier/=1.25
							src.OffenseMultiplier/=1.25
							src.DefenseMultiplier/=1.25
							src.Base/=1.2
							src.BaseMod/=1.2
						else
							src.Base/=1.45
							src.BaseMod/=1.45
							src.StrengthMultiplier/=1.15
							src.EnduranceMultiplier/=1.15
							src.ForceMultiplier/=1.15
							src.ResistanceMultiplier/=1.15
							src.OffenseMultiplier/=1.15
							src.DefenseMultiplier/=1.15
						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src]'s oppressive aura dies down slowly...","<font color=red>[src]([src.key]) activated Spirit Energy.")
						else
							src.OMessage(10,"[src]'s brilliance declines gently...","<font color=red>[src]([src.key]) activated Spirit Energy.")
					if(Z.CustomBPmod==2)
						if(src.Race=="Demon"||src.Race=="Half Demon")
							src.Base/=1.6
							src.StrengthMultiplier/=1.2
							src.EnduranceMultiplier/=1.2
							src.ForceMultiplier/=1.2
							src.ResistanceMultiplier/=1.2
							src.OffenseMultiplier/=1.2
							src.DefenseMultiplier/=1.2

						else
							src.StrengthMultiplier/=1.35
							src.EnduranceMultiplier/=1.35
							src.ForceMultiplier/=1.35
							src.ResistanceMultiplier/=1.35
							src.OffenseMultiplier/=1.35
							src.DefenseMultiplier/=1.35
							src.Base/=1.3
							src.BaseMod/=1.3
						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src]'s air of terror receeds...","<font color=red>[src]([src.key]) activated Spirit Energy.")
						else
							src.OMessage(10,"[src] seems to lose their luster...","<font color=red>[src]([src.key]) activated Spirit Energy.")
					if(Z.CustomBPmod==3)
						if(src.Race=="Demon"||src.Race=="Half Demon")
							src.Base/=1.75
							src.BaseMod/=1.75
							src.StrengthMultiplier/=1.2
							src.EnduranceMultiplier/=1.2
							src.ForceMultiplier/=1.2
							src.ResistanceMultiplier/=1.2
							src.OffenseMultiplier/=1.2
							src.DefenseMultiplier/=1.2


						else
							src.StrengthMultiplier/=1.5
							src.EnduranceMultiplier/=1.5
							src.ForceMultiplier/=1.5
							src.ResistanceMultiplier/=1.5
							src.OffenseMultiplier/=1.5
							src.DefenseMultiplier/=1.5
							src.Base/=1.4
							src.BaseMod/=1.4
						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src] sets aside their ungodly mantle...","<font color=red>[src]([src.key]) activated Spirit Energy.")
						else
							src.OMessage(10,"[src] resumes their mortal power...","<font color=red>[src]([src.key]) activated Spirit Energy.")

					if(Z.CustomBPmod==4)
						if(src.Race=="Demon"||src.Race=="Half Demon")
							src.Base/=2
							src.BaseMod/=2
							src.StrengthMultiplier/=1.325
							src.EnduranceMultiplier/=1.325
							src.ForceMultiplier/=1.325
							src.ResistanceMultiplier/=1.325
							src.OffenseMultiplier/=1.325
							src.DefenseMultiplier/=1.325

						else
							src.StrengthMultiplier/=1.75
							src.EnduranceMultiplier/=1.75
							src.ForceMultiplier/=1.75
							src.ResistanceMultiplier/=1.75
							src.OffenseMultiplier/=1.75
							src.DefenseMultiplier/=1.75
							src.Base/=1.5
							src.BaseMod/=1.5
						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src] sets aside their ungodly mantle...","<font color=red>[src]([src.key]) activated Spirit Energy.")
						else
							src.OMessage(10,"[src] resumes their mortal power...","<font color=red>[src]([src.key]) activated Spirit Energy.")

			if("PercentagePower")
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					Z.CustomBPmod=input("How much power would you like to unleash?")in list("Twenty Percent","Fourty Percent","Sixty Percent","Eighty Percent","One Hundred Percent")
					if(Z.CustomBPmod=="Twenty Percent")
						src.Base*=1.5
						src.BaseMod*=1.5
						src.StrengthMultiplier*=1.4
						src.EnduranceMultiplier*=1.4
						src.ResistanceMultiplier*=1.4
						src.OffenseMultiplier*=0.95
						src.DefenseMultiplier*=0.95
						src.SpeedMultiplier*=0.95
						src.PercentagePower=1

					if(Z.CustomBPmod=="Fourty Percent")
						src.Base*=1.75
						src.BaseMod*=1.75
						src.StrengthMultiplier*=1.8
						src.EnduranceMultiplier*=1.8
						src.ResistanceMultiplier*=1.8
						src.OffenseMultiplier*=0.9
						src.DefenseMultiplier*=0.9
						src.SpeedMultiplier*=0.9
						src.PercentagePower=2

					if(Z.CustomBPmod=="Sixty Percent")
						src.Base*=2
						src.BaseMod*=2
						src.StrengthMultiplier*=2.2
						src.EnduranceMultiplier*=2.2
						src.ResistanceMultiplier*=2.2
						src.OffenseMultiplier*=0.85
						src.DefenseMultiplier*=0.85
						src.SpeedMultiplier*=0.85
						src.PercentagePower=3

					if(Z.CustomBPmod=="Eighty Percent")
						src.Base*=2.25
						src.BaseMod*=2.25
						src.StrengthMultiplier*=2.6
						src.EnduranceMultiplier*=2.6
						src.ResistanceMultiplier*=2.6
						src.OffenseMultiplier*=0.8
						src.DefenseMultiplier*=0.8
						src.SpeedMultiplier*=0.8
						src.PercentagePower=4

					if(Z.CustomBPmod=="One Hundred Percent")
						src.Base*=2.5
						src.BaseMod*=2.5
						src.StrengthMultiplier*=3
						src.EnduranceMultiplier*=3
						src.ResistanceMultiplier*=3
						src.OffenseMultiplier*=0.75
						src.DefenseMultiplier*=0.75
						src.SpeedMultiplier*=0.75
						src.PercentagePower=5
					src.OMessage(10,"[src]'s muscles swell unnaturally!","<font color=red>[src]([src.key]) activated Percentage Power.")
				else
					if(Z.CustomBPmod=="Twenty Percent")
						src.Base*=1.5
						src.BaseMod*=1.5
						src.StrengthMultiplier*=1.4
						src.EnduranceMultiplier*=1.4
						src.ResistanceMultiplier*=1.4
						src.OffenseMultiplier*=0.95
						src.DefenseMultiplier*=0.95
						src.SpeedMultiplier*=0.95

					if(Z.CustomBPmod=="Fourty Percent")
						src.Base*=1.75
						src.BaseMod*=1.75
						src.StrengthMultiplier*=1.8
						src.EnduranceMultiplier*=1.8
						src.ResistanceMultiplier*=1.8
						src.OffenseMultiplier*=0.9
						src.DefenseMultiplier*=0.9
						src.SpeedMultiplier*=0.9

					if(Z.CustomBPmod=="Sixty Percent")
						src.Base*=2
						src.BaseMod*=2
						src.StrengthMultiplier*=2.2
						src.EnduranceMultiplier*=2.2
						src.ResistanceMultiplier*=2.2
						src.OffenseMultiplier*=0.85
						src.DefenseMultiplier*=0.85
						src.SpeedMultiplier*=0.85

					if(Z.CustomBPmod=="Eighty Percent")
						src.Base*=2.25
						src.BaseMod*=2.25
						src.StrengthMultiplier*=2.6
						src.EnduranceMultiplier*=2.6
						src.ResistanceMultiplier*=2.6
						src.OffenseMultiplier*=0.8
						src.DefenseMultiplier*=0.8
						src.SpeedMultiplier*=0.8

					if(Z.CustomBPmod=="One Hundred Percent")
						src.Base*=2.5
						src.BaseMod*=2.5
						src.StrengthMultiplier*=3
						src.EnduranceMultiplier*=3
						src.ResistanceMultiplier*=3
						src.OffenseMultiplier*=0.75
						src.DefenseMultiplier*=0.75
						src.SpeedMultiplier*=0.75
					Z.BuffUsing=0
					src.OMessage(10,"[src]'s muscles return to normal.","<font color=red>[src]([src.key]) deactivated Percentage Power.")


			if("SpiritEnergy")
				if(!Z.BuffUsing)
					if(src.SpecialSlot)
						src << "You can't use Spirit Energy with other special buffs."
						return
					src.SpecialSlot=1
					Z.BuffUsing=1
					var/list/SpiritLevelSelect=new("Cancel")
					if(src.SpiritLevel>=0)
						SpiritLevelSelect+="Level One"
					if(src.SpiritLevel>=1)
						SpiritLevelSelect+="Level Two"
					if(src.SpiritLevel>=2)
						SpiritLevelSelect+="Level Three"
					if(src.SpiritLevel>=3)
						SpiritLevelSelect+="Level Four"
//					Z.CustomBPmod=src.SpiritLevel//just a way to keep track of what level of spirit energy was used.
					Z.CustomBPmod=input("Select the level of Spirit Energy you'd like to use.")in SpiritLevelSelect
					if(Z.CustomBPmod=="Level One")
						Z.CustomBPmod=0
					else if(Z.CustomBPmod=="Level Two")
						Z.CustomBPmod=1
					else if(Z.CustomBPmod=="Level Three")
						Z.CustomBPmod=2
					else if(Z.CustomBPmod=="Level Four")
						Z.CustomBPmod=3
					if(!Z.CustomBPmod)
						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src] begins to emit a dark red glow of energy.","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.RPPower*=1.56
						else
							src.OMessage(10,"[src] begins to emit a light blue glow of energy.","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.StrengthMultiplier*=1.25
							src.EnduranceMultiplier*=1.25
							src.ForceMultiplier*=1.25
							src.ResistanceMultiplier*=1.25
							src.OffenseMultiplier*=1.25
							src.DefenseMultiplier*=1.25
							src.Base*=1.25
							src.BaseMod*=1.25

					if(Z.CustomBPmod==1)
						src.SpiritStance=1
						if(!src.SpiritWeaponChosen)
							src.SpiritWeaponChosen=1
							var/choice = input(src, "How do you want to hone your Spirit Energy?", "Spirit Weapon") in list("Gun", "Sword")
							if(choice=="Gun")
								src.contents+=new/obj/Skills/Attacks/SpiritGun
							if(choice=="Sword")
								src.contents+=new/obj/Skills/Attacks/SpiritSword
							//choose between gun or sword
						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src]'s aura becomes suffocatingly powerful...","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.RPPower*=2
							src.StrengthMultiplier*=1.15
							src.EnduranceMultiplier*=1.15
							src.ForceMultiplier*=1.15
							src.ResistanceMultiplier*=1.15
							src.OffenseMultiplier*=1.15
							src.DefenseMultiplier*=1.15

						else
							src.OMessage(10,"[src] gleams with a brilliant blue light!","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.StrengthMultiplier*=1.75
							src.EnduranceMultiplier*=1.75
							src.ForceMultiplier*=1.75
							src.ResistanceMultiplier*=1.75
							src.OffenseMultiplier*=1.75
							src.DefenseMultiplier*=1.75
							src.Base*=1.5
							src.BaseMod*=1.5

					if(Z.CustomBPmod==2)
						src.SpiritStance=1


						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src]'s crushing aura causes the ground itself to wail!.","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.RPPower*=2.5
							src.StrengthMultiplier*=1.25
							src.EnduranceMultiplier*=1.25
							src.ForceMultiplier*=1.25
							src.ResistanceMultiplier*=1.25
							src.OffenseMultiplier*=1.25
							src.DefenseMultiplier*=1.25


						else
							src.OMessage(10,"[src] bursts with a divine golden power!","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.StrengthMultiplier*=1.9
							src.EnduranceMultiplier*=1.9
							src.ForceMultiplier*=1.9
							src.ResistanceMultiplier*=1.9
							src.OffenseMultiplier*=1.9
							src.DefenseMultiplier*=1.9
							src.Base*=1.75
							src.BaseMod*=1.75

					if(Z.CustomBPmod==3)
						src.Divine=1
						src.SacredEnergyUnlocked=1
						src.SpiritStance=1
						spawn()
							Quake(10)
							Quake(20)
							Quake(30)
						/*if(!locate(/obj/Skills/Buffs/SacredEnergyArmorNu, src))
							src.ResshukenUnlocked=1
							src.contents+=new/obj/Skills/Buffs/SacredEnergyArmorNu
							src << "You have grasped the power to change the world.  Your energy is Sacred."
							src << "4.25"*/
						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src]'s crushing aura causes the ground itself to wail!.","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.RPPower*=2.5
							src.StrengthMultiplier*=1.25
							src.EnduranceMultiplier*=1.25
							src.ForceMultiplier*=1.25
							src.ResistanceMultiplier*=1.25
							src.OffenseMultiplier*=1.25
							src.DefenseMultiplier*=1.25


						else
							src.OMessage(10,"[src] bursts with a divine golden power!","<font color=red>[src]([src.key]) activated Spirit Energy.")
							src.StrengthMultiplier*=1.9
							src.EnduranceMultiplier*=1.9
							src.ForceMultiplier*=1.9
							src.ResistanceMultiplier*=1.9
							src.OffenseMultiplier*=1.9
							src.DefenseMultiplier*=1.9
							src.Base*=1.75
							src.BaseMod*=1.75

				else
					Z.BuffUsing=0
					src.SpecialSlot=0
					if(!Z.CustomBPmod)
						if(src.Race!="Demon"&&src.Race!="Half Demon")
							src.StrengthMultiplier/=1.25
							src.EnduranceMultiplier/=1.25
							src.ForceMultiplier/=1.25
							src.ResistanceMultiplier/=1.25
							src.OffenseMultiplier/=1.25
							src.DefenseMultiplier/=1.25
							src.BaseMod/=1.25
							src.Base/=1.25
						else
							src.RPPower/=1.56
						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src]'s crimson glow fades away...","<font color=red>[src]([src.key]) activated Spirit Energy.")
						else
							src.OMessage(10,"[src]'s cerulean glow fades away...","<font color=red>[src]([src.key]) activated Spirit Energy.")
					if(Z.CustomBPmod==1)
						src.SpiritStance=0
						if(src.Race!="Demon"&&src.Race!="Half Demon")
							src.StrengthMultiplier/=1.75
							src.EnduranceMultiplier/=1.75
							src.ForceMultiplier/=1.75
							src.ResistanceMultiplier/=1.75
							src.OffenseMultiplier/=1.75
							src.DefenseMultiplier/=1.75
							src.Base/=1.5
							src.BaseMod/=1.5
						else
							src.RPPower/=2
							src.StrengthMultiplier/=1.15
							src.EnduranceMultiplier/=1.15
							src.ForceMultiplier/=1.15
							src.ResistanceMultiplier/=1.15
							src.OffenseMultiplier/=1.15
							src.DefenseMultiplier/=1.15
						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src]'s oppressive aura dies down slowly...","<font color=red>[src]([src.key]) activated Spirit Energy.")
						else
							src.OMessage(10,"[src]'s brilliance declines gently...","<font color=red>[src]([src.key]) activated Spirit Energy.")
					if(Z.CustomBPmod==2)
						src.SpiritStance=0
						if(src.Race=="Demon"||src.Race=="Half Demon")
							src.RPPower/=2.5
							src.StrengthMultiplier/=1.25
							src.EnduranceMultiplier/=1.25
							src.ForceMultiplier/=1.25
							src.ResistanceMultiplier/=1.25
							src.OffenseMultiplier/=1.25
							src.DefenseMultiplier/=1.25



						else
							src.StrengthMultiplier/=1.9
							src.EnduranceMultiplier/=1.9
							src.ForceMultiplier/=1.9
							src.ResistanceMultiplier/=1.9
							src.OffenseMultiplier/=1.9
							src.DefenseMultiplier/=1.9
							src.Base/=1.75
							src.BaseMod/=1.75
						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src]'s air of terror receeds...","<font color=red>[src]([src.key]) activated Spirit Energy.")
						else
							src.OMessage(10,"[src] seems to lose their luster...","<font color=red>[src]([src.key]) activated Spirit Energy.")
					if(Z.CustomBPmod==3)
						src.Divine=0
						src.SacredEnergyUnlocked=0
						src.SpiritStance=0
						if(src.Race=="Demon"||src.Race=="Half Demon")
							src.RPPower/=2.5
							src.StrengthMultiplier/=1.25
							src.EnduranceMultiplier/=1.25
							src.ForceMultiplier/=1.25
							src.ResistanceMultiplier/=1.25
							src.OffenseMultiplier/=1.25
							src.DefenseMultiplier/=1.25


						else
							src.StrengthMultiplier/=1.9
							src.EnduranceMultiplier/=1.9
							src.ForceMultiplier/=1.9
							src.ResistanceMultiplier/=1.9
							src.OffenseMultiplier/=1.9
							src.DefenseMultiplier/=1.9
							src.Base/=1.75
							src.BaseMod/=1.75
						if(src.Race == "Demon" || src.Race == "Half Demon")
							src.OMessage(10,"[src] sets aside their ungodly mantle...","<font color=red>[src]([src.key]) activated Spirit Energy.")
						else
							src.OMessage(10,"[src] resumes their mortal power...","<font color=red>[src]([src.key]) activated Spirit Energy.")
			if("SacredEnergyArmorNu")
				if(!Z.BuffUsing)
					if(!src.ActiveBuffs)
						src.ActiveBuffs=3
						Z:UsingBuffs=1
					else if(!src.SpecialSlot)
						src.SpecialSlot=1
						Z:UsingSpecial=1
					else
						src << "You have no slots open."
						return
					Z.BuffUsing=1
					Z.CustomBPmod = input(src, "What do you want your armor to focus on?", "Sacred Energy Armor") in list("Offense", "Defense")
					if(Z.CustomBPmod == "Offense")
						if(Z:UsingBuffs)src.Power_Multiplier+=0.5
						src.EnergyMod*=1.5
						src.EnergyMax*=1.5
						src.Energy*=1.5
						src.StrengthMultiplier*=1.5
						src.ForceMultiplier*=1.5
						src.SpeedMultiplier*=1.45
						//add in icon
					else
						if(Z:UsingBuffs)src.Power_Multiplier+=0.5
						src.EnergyMod*=1.5
						src.EnergyMax*=1.5
						src.Energy*=1.5
						src.StrengthMultiplier*=1.25
						src.EnduranceMultiplier*=1.75
						src.ForceMultiplier*=1.25
						src.ResistanceMultiplier*=1.75
						//add in icon
					src.OMessage(10, "[src] materializes their Sacred Energy in the form of armor!  It seems to be focused on [Z.CustomBPmod].", "[src]([src.key]) used Sacred Energy Armor [Z.CustomBPmod]");
				else
					Z.BuffUsing=0
					if(Z.CustomBPmod=="Offense")
						if(Z:UsingBuffs)src.Power_Multiplier-=0.5
						src.EnergyMod/=1.5
						src.EnergyMax/=1.5
						src.Energy/=1.5
						src.StrengthMultiplier/=1.5
						src.ForceMultiplier/=1.5
						src.SpeedMultiplier/=1.45
					else
						if(Z:UsingBuffs)src.Power_Multiplier-=0.5
						src.EnergyMod/=1.5
						src.EnergyMax/=1.5
						src.Energy/=1.5
						src.StrengthMultiplier/=1.25
						src.EnduranceMultiplier/=1.75
						src.ForceMultiplier/=1.25
						src.ResistanceMultiplier/=1.75
					if(Z:UsingSpecial)
						src.SpecialSlot=0
						Z:UsingSpecial=0
					else if(Z:UsingBuffs)
						src.ActiveBuffs=0
						Z:UsingBuffs=0
					src.OMessage(10, "[src] dispells their Sacred Energy Armor.", "[src]([src.key]) deactivated Sacred Energy Armor [Z.CustomBPmod]");
			if("HeroOfAspect")
				if(!Z.BuffUsing)
					if(src.SpecialSlot)
						src << "You're already using a special buff."
						return
					src.SpecialSlot=1

					if(src.HeroLevel < 1)
						src.HeroLevel=1

					Z.BuffUsing=1

					Z.strmult=1
					Z.endmult=1
					Z.speedmult=1
					Z.forcemult=1
					Z.resmult=1
					Z.offmult=1
					Z.defmult=1
					Z.bpmult=1

					if(src.HeroLevel==1||src.HeroLevel==2)
						Z.bpmult=1
						switch(src.HeroTitle)
							if("Maid")
								Z.endmult=1.0625
								Z.resmult=1.0625
								Z.defmult=1.125
							if("Page")
								Z.strmult=1.0625
								Z.endmult=1.0625
								Z.offmult=1.125
							if("Mage")
								Z.forcemult=1.125
								Z.offmult=1.125
							if("Knight")
								Z.endmult=1.125
								Z.offmult=1.125
							if("Rogue")
								Z.offmult=1.125
								Z.defmult=1.125
							if("Sylph")
								Z.resmult=1.125
								Z.defmult=1.125
							if("Seer")
								Z.resmult=1.125
								Z.offmult=1.125
							if("Thief")
								Z.strmult=1.125
								Z.defmult=1.125
							if("Heir")
								Z.endmult=1.125
								Z.defmult=1.125
							if("Bard")
								var/stat1 = pick("Strength", "Endurance", "Speed", "Force", "Resistance", "Offense", "Defense")
								var/stat2 = pick("Strength", "Endurance", "Speed", "Force", "Resistance", "Offense", "Defense")
								if(stat1 == "Strength" || stat2 == "Strength")
									Z.strmult=1.125
									if(stat1 == "Strength" && stat2=="Strength")
										Z.strmult=1.25
								if(stat1 == "Endurance" || stat2 == "Endurance")
									Z.endmult=1.125
									if(stat1 == "Endurance" && stat2=="Endurance")
										Z.endmult=1.25
								if(stat1 == "Speed" || stat2 == "Speed")
									Z.speedmult=1.125
									if(stat1 == "Speed" && stat2=="Speed")
										Z.speedmult=1.25
								if(stat1 == "Force" || stat2 == "Force")
									Z.forcemult=1.125
									if(stat1 == "Force" && stat2=="Force")
										Z.forcemult=1.25
								if(stat1 == "Resistance" || stat2 == "Resistance")
									Z.resmult=1.125
									if(stat1 == "Resistance" && stat2=="Resistance")
										Z.resmult=1.25
								if(stat1 == "Offense" || stat2 == "Offense")
									Z.offmult=1.125
									if(stat1 == "Offense" && stat2=="Offense")
										Z.offmult=1.25
								if(stat1 == "Defense" || stat2 == "Defense")
									Z.defmult=1.125
									if(stat1 == "Defense" && stat2=="Defense")
										Z.defmult=1.25
							if("Prince")
								Z.strmult=1.125
								Z.offmult=1.125
							if("Witch")
								Z.forcemult=1.125
								Z.defmult=1.125
							if("Lord")
								Z.strmult=1.0625
								Z.forcemult=1.0625
								Z.speedmult=1.125
							if("Muse")
								Z.endmult=1.0625
								Z.resmult=1.0625
								Z.speedmult=1.125
							if("Nick")
								Z.offmult=1.125
								Z.defmult=1.125
					if(src.HeroLevel==2)
						Z.bpmult=1.25
					if(src.HeroLevel==3||src.HeroLevel==4||src.GodTier)
						Z.bpmult=1.5
						switch(src.HeroTitle)
							if("Maid")
								Z.endmult=1.125
								Z.resmult=1.125
								Z.defmult=1.25
							if("Page")
								Z.strmult=1.125
								Z.endmult=1.125
								Z.offmult=1.25
							if("Mage")
								Z.forcemult=1.25
								Z.offmult=1.25
							if("Knight")
								Z.endmult=1.25
								Z.offmult=1.25
							if("Rogue")
								Z.offmult=1.25
								Z.defmult=1.25
							if("Sylph")
								Z.resmult=1.25
								Z.defmult=1.25
							if("Seer")
								Z.resmult=1.25
								Z.offmult=1.25
							if("Thief")
								Z.strmult=1.25
								Z.defmult=1.25
							if("Heir")
								Z.endmult=1.25
								Z.defmult=1.25
							if("Bard")
								var/stat1 = pick("Strength", "Endurance", "Speed", "Force", "Resistance", "Offense", "Defense")
								var/stat2 = pick("Strength", "Endurance", "Speed", "Force", "Resistance", "Offense", "Defense")
								if(stat1 == "Strength" || stat2 == "Strength")
									Z.strmult=1.25
									if(stat1 == "Strength" && stat2=="Strength")
										Z.strmult=1.5
								if(stat1 == "Endurance" || stat2 == "Endurance")
									Z.endmult=1.25
									if(stat1 == "Endurance" && stat2=="Endurance")
										Z.endmult=1.5
								if(stat1 == "Speed" || stat2 == "Speed")
									Z.speedmult=1.25
									if(stat1 == "Speed" && stat2=="Speed")
										Z.speedmult=1.5
								if(stat1 == "Force" || stat2 == "Force")
									Z.forcemult=1.25
									if(stat1 == "Force" && stat2=="Force")
										Z.forcemult=1.5
								if(stat1 == "Resistance" || stat2 == "Resistance")
									Z.resmult=1.25
									if(stat1 == "Resistance" && stat2=="Resistance")
										Z.resmult=1.5
								if(stat1 == "Offense" || stat2 == "Offense")
									Z.offmult=1.25
									if(stat1 == "Offense" && stat2=="Offense")
										Z.offmult=1.5
								if(stat1 == "Defense" || stat2 == "Defense")
									Z.defmult=1.25
									if(stat1 == "Defense" && stat2=="Defense")
										Z.defmult=1.5
							if("Prince")
								Z.strmult=1.25
								Z.offmult=1.25
							if("Witch")
								Z.forcemult=1.25
								Z.defmult=1.25
							if("Lord")
								Z.strmult=1.125
								Z.forcemult=1.125
								Z.speedmult=1.25
							if("Muse")
								Z.endmult=1.125
								Z.resmult=1.125
								Z.speedmult=1.25
							if("Nick")
								Z.offmult=1.25
								Z.defmult=1.25
					if(src.HeroLevel==4)
						Z.bpmult=1.75
					if(src.GodTier)
						Z.bpmult=2
						switch(src.HeroTitle)
							if("Maid")
								Z.endmult=1.25
								Z.resmult=1.25
								Z.defmult=1.5
							if("Page")
								Z.strmult=1.25
								Z.endmult=1.25
								Z.offmult=1.5
							if("Mage")
								Z.forcemult=1.5
								Z.offmult=1.5
							if("Knight")
								Z.endmult=1.5
								Z.offmult=1.5
							if("Rogue")
								Z.offmult=1.5
								Z.defmult=1.5
							if("Sylph")
								Z.resmult=1.5
								Z.defmult=1.5
							if("Seer")
								Z.resmult=1.5
								Z.offmult=1.5
							if("Thief")
								Z.strmult=1.5
								Z.defmult=1.5
							if("Heir")
								Z.endmult=1.5
								Z.defmult=1.5
							if("Bard")
								var/stat1 = pick("Strength", "Endurance", "Speed", "Force", "Resistance", "Offense", "Defense")
								var/stat2 = pick("Strength", "Endurance", "Speed", "Force", "Resistance", "Offense", "Defense")
								if(stat1 == "Strength" || stat2 == "Strength")
									Z.strmult=1.5
									if(stat1 == "Strength" && stat2=="Strength")
										Z.strmult=2
								if(stat1 == "Endurance" || stat2 == "Endurance")
									Z.endmult=1.5
									if(stat1 == "Endurance" && stat2=="Endurance")
										Z.endmult=2
								if(stat1 == "Speed" || stat2 == "Speed")
									Z.speedmult=1.5
									if(stat1 == "Speed" && stat2=="Speed")
										Z.speedmult=2
								if(stat1 == "Force" || stat2 == "Force")
									Z.forcemult=1.5
									if(stat1 == "Force" && stat2=="Force")
										Z.forcemult=2
								if(stat1 == "Resistance" || stat2 == "Resistance")
									Z.resmult=1.5
									if(stat1 == "Resistance" && stat2=="Resistance")
										Z.resmult=2
								if(stat1 == "Offense" || stat2 == "Offense")
									Z.offmult=1.5
									if(stat1 == "Offense" && stat2=="Offense")
										Z.offmult=2
								if(stat1 == "Defense" || stat2 == "Defense")
									Z.defmult=1.5
									if(stat1 == "Defense" && stat2=="Defense")
										Z.defmult=2
							if("Prince")
								Z.strmult=1.5
								Z.offmult=1.5
							if("Witch")
								Z.forcemult=1.5
								Z.defmult=1.5
							if("Lord")
								Z.strmult=1.25
								Z.forcemult=1.25
								Z.speedmult=1.5
							if("Muse")
								Z.endmult=1.25
								Z.resmult=1.25
								Z.speedmult=1.5

					switch(src.AspectTitle)
						if("Time")
							src.TimeHero=1
							src.TimeHits=0
							if(!locate(/obj/Skills/TimeFuck, src))
								src.contents+=new/obj/Skills/TimeFuck
								src << "You learn how to fuck with timelines."
						if("Breath")
							src.BreathHero=1
							if(!locate(/obj/Skills/WindyThing, src))
								src.contents+=new/obj/Skills/WindyThing
								src << "You learn some measure of controlling the wind."
						if("Doom")
							src.DoomHero=1
							if(!locate(/obj/Skills/DeathTolls, src))
								src.contents+=new/obj/Skills/DeathTolls
								src << "You learn how to augment your attacks with inevitability."
						if("Blood")
							src.BloodHero=1
							if(!locate(/obj/Skills/BloodSport, src))
								src.contents+=new/obj/Skills/BloodSport
								src << "You learn to heal your wounds with blood."
						if("Heart")
							src.HeartHero=1
							//idk something really stupid or cool
						if("Space")
							src.SpaceHero=1
							src.SpaceHits=0
							src.SpaceDamage=0
							if(!locate(/obj/Skills/SpaceFuck, src))
								src.contents+=new/obj/Skills/SpaceFuck
								src << "You learn how to fuck with space...lines...?"
						if("Mind")
							src.MindHero=1
							src.MindHits=0
							src.MindDodges=0
							if(!locate(/obj/Skills/ThoughtSurge, src))
								src.contents+=new/obj/Skills/ThoughtSurge
								src << "You learn to predict the thoughts of others."
						if("Light")
							src.LightHero=1
							src.LightLuck=100
							if(!locate(/obj/Skills/LuckCheck, src))
								src.contents+=new/obj/Skills/LuckCheck
								src << "You learn to check your luck...somehow."
							if(src.HeroLevel > 1)
								if(!locate(/obj/Skills/LuckCleanse, src))
									src.contents+=new/obj/Skills/LuckCleanse
									src << "You learn to cleanse your luck.  This makes even less sense than before!"
						if("Void")
							src.VoidHero=1
							src.VoidPain=100
							if(!locate(/obj/Skills/VoidCheck, src))
								src.contents+=new/obj/Skills/VoidCheck
								src << "You learn about calculating nothing."
							if(src.HeroLevel > 1)
								if(!locate(/obj/Skills/VoidCleanse, src))
									src.contents+=new/obj/Skills/VoidCleanse
									src << "You learn to cleanse your nothing.  This makes sense."
						if("Rage")
							src.RageHero=1
							Z.CustomAnger=src.AngerMax
							src.RageMax=1+((src.AngerMax-1)*2)
							src.AngerMax=1.05
							src.Anger=src.AngerMax
							if(!locate(/obj/Skills/RAGE, src))
								src.contents+=new/obj/Skills/RAGE
								src << "You learn how to shout random profanities from a list."
						if("Hope")
							src.HopeHero=1
							if(!locate(/obj/Skills/HopeHarpoon, src))
								src.contents+=new/obj/Skills/HopeHarpoon
								src << "You learn how to imbue your attacks with hope."
						if("Life")
							src.LifeHero=1
							if(!locate(/obj/Skills/LifeBurst, src))
								src.contents+=new/obj/Skills/LifeBurst
								src << "You learn how to bring life where there is little."

					src.StrengthMultiplier*=Z.strmult
					src.EnduranceMultiplier*=Z.endmult
					src.SpeedMultiplier*=Z.speedmult
					src.ForceMultiplier*=Z.forcemult
					src.ResistanceMultiplier*=Z.resmult
					src.OffenseMultiplier*=Z.offmult
					src.DefenseMultiplier*=Z.defmult
					src.Power_Multiplier+=(Z.bpmult-1)

					if(!src.GodTier)
						src.OMessage(10, "[src] becomes the [src.HeroTitle] of [src.AspectTitle]!", "[src]([src.key]) activated Hero ([src.HeroTitle]) of Aspect ([src.AspectTitle])")
					else
						src.Divine=1
						src.OMessage(10, "[src] ascends to Godhood as the [src.HeroTitle] of [src.AspectTitle]!", "[src]([src.key]) activated Hero ([src.HeroTitle]) of Aspect ([src.AspectTitle])")

				else
					src.SpecialSlot=0
					Z.BuffUsing=0

					switch(src.AspectTitle)
						if("Time")
							src.TimeHero=0
							src.TimeHits=0
						if("Breath")
							src.BreathHero=0
						if("Doom")
							src.DoomHero=0
						if("Blood")
							src.BloodHero=0
						if("Heart")
							src.HeartHero=0
						if("Space")
							src.SpaceHero=0
							src.SpaceHits=0
							src.SpaceDamage=0
						if("Mind")
							src.MindHero=0
							src.MindHits=0
							src.MindDodges=0
						if("Light")
							src.LightHero=0
							src.LightLuck=100
						if("Void")
							src.VoidHero=0
							src.VoidPain=100
						if("Rage")
							src.AngerMax=Z.CustomAnger
							src.Anger=0
							src.RageHero=0
							src.RageMax=0
						if("Hope")
							src.HopeHero=0
						if("Life")
							src.LifeHero=0

					src.StrengthMultiplier/=Z.strmult
					src.EnduranceMultiplier/=Z.endmult
					src.SpeedMultiplier/=Z.speedmult
					src.ForceMultiplier/=Z.forcemult
					src.ResistanceMultiplier/=Z.resmult
					src.OffenseMultiplier/=Z.offmult
					src.DefenseMultiplier/=Z.defmult
					src.Power_Multiplier-=(Z.bpmult-1)

					if(!src.GodTier)
						src.OMessage(10, "[src] discards their mantle of [src.HeroTitle] of [src.AspectTitle].", "[src]([src.key]) deactivated Hero ([src.HeroTitle]) of Aspect ([src.AspectTitle])")
					else
						src.Divine=0
						src.OMessage(10, "[src] takes off their Godhood as the [src.HeroTitle] of [src.AspectTitle].", "[src]([src.key]) deactivated Hero ([src.HeroTitle]) of Aspect ([src.AspectTitle])")
			if("TimeFuck")
				var/choice = input(src, "How do you want to fuck with time?", "Timefuckery!") in list("Recall", "Set Point", "Cancel")
				if(choice=="Recall")
					src.loc = locate(src.TimeLoc["x"], src.TimeLoc["y"], src.TimeLoc["z"])
					src.OMessage(10, "[src] arrives from an alternate timeline!", "[src]([src.key]) used Timefuck.  It's super effective. ([src.x], [src.y], [src.z])")
				if(choice=="Set Point")
					src.TimeLoc["x"] = src.x
					src.TimeLoc["y"] = src.y
					src.TimeLoc["z"] = src.z
					src << "Point set."
			if("SpaceFuck")
				var/x = input(src, "What X are you teleporting through space to?", "Spacefuckery! (X)") as num
				var/y = input(src, "What Y are you teleporting through space to?", "Spacefuckery! (Y)") as num
				if(x > 0 && x < 501)
					if(y > 0 && 7 < 501)
						src.loc = locate(x, y, src.z)
						src.OMessage(10, "[src] suddenly teleports into view!", "[src]([src.key]) used Spacefuck.  It's super effective. ([src.x], [src.y], [src.z])")
			if("WindyThing")
				if(!Z.Using)
					src.OMessage(10, "[src] whips up a gale around them!  Their movements become incredibly fast!", "[src]([src.key]) used the Windy Thing.")
					src.WindyThing=1
					Z.Cooldown()
					spawn(50)
						src.WindyThing=0
						view(10, src) << "[src]'s gale dies down..."
			if("DeathTolls")
				if(!Z.Using)
					src.OMessage(10, "[src]'s aura becomes filled with inevitability...!!", "[src]([src.key]) used Death Tolls.")
					src.DeathTolls=1
					Z.Cooldown()
					spawn(50)
						src.DeathTolls=0
						view(10, src) << "[src]'s aura fades away..."

			if("ThoughtSurge")
				if(!Z.Using)
					src << "You can predict the next movements of your enemy."
					src.MindHits=7
					src.MindDodges=7
					Z.Cooldown()
			if("RAGE")
				if(!Z.Using)
					if(src.Anger >= src.AngerMax)//they have to already be angry
						if(src.Anger < src.RageMax)
							src.Anger+=(src.RageMax/(5/src.HeroLevel))
						if(src.Anger > src.RageMax)
							src.Anger=src.RageMax
						//var/thing = pick(RAGEsayings)
						var/obj/Communication/c
						for(var/obj/Communication/C in src)
							c=C
						src.OMessage(20, "<b><font color=[c.Text_Color]>[src] roars with rage!</b>", "[src]([src.key]) used RAGE.")
						Z.Cooldown()
			if("HopeHarpoon")
				if(!Z.Using)
					src.OMessage(10, "[src] begins to give off a brilliant, gleaming, and hopeful light!", "[src]([src.key]) used Hope Harpoon.")
					src.HopeHarpoon=1
					Z.Cooldown()
					spawn(50)
						view(10, src) << "[src]'s hopeful light fades away.  That's kind of ominous."
						src.HopeHarpoon=0
			if("LifeBurst")
				if(!Z.Using)
					src.OMessage(10, "[src] bursts with life!!", "[src]([src.key]) used Life Burst.")
					var/gain=10
					gain+=(src.HeroLevel*3)
					gain*=(src.Health)/100
					if(gain<10)
						gain=10
					src.HealHealth(gain)
					Z.Cooldown()
			if("WillOfChaos")
				if(!Z.BuffUsing)
				{
					Z.strmult=1
					Z.endmult=1
					Z.speedmult=1
					Z.forcemult=1
					Z.resmult=1
					Z.offmult=1
					Z.defmult=1

					var/choice= input(src, "What class?", "Will of Chaos") in list("Maid", "Page", "Mage", "Knight", "Rogue", "Sylph", "Seer", "Thief", "Heir", "Bard", "Prince", "Witch")
					switch(choice)
						if("Maid")
							Z.endmult*=1.3
							Z.resmult*=1.3
							Z.defmult*=1.3
						if("Page")
							Z.strmult*=1.3
							Z.endmult*=1.3
							Z.speedmult*=1.3
						if("Mage")
							Z.forcemult*=1.5
							Z.offmult*=1.3
						if("Knight")
							Z.strmult*=1.3
							Z.speedmult*=1.15
							Z.defmult*=1.3
						if("Rogue")
							Z.offmult*=1.3
							Z.speedmult*=1.15
							Z.defmult*=1.3
						if("Sylph")
							Z.forcemult*=1.3
							Z.resmult*=1.3
							Z.defmult*=1.3
						if("Seer")
							Z.offmult*=1.5
							Z.strmult*=1.15
							Z.forcemult*=1.15
						if("Thief")
							Z.defmult*=1.5
							Z.strmult*=1.3
						if("Heir")
							Z.strmult*=1.3
							Z.endmult*=1.3
							Z.defmult*=1.3
						if("Bard")
							Z.speedmult*=1.5
						if("Prince")
							Z.strmult*=1.3
							Z.forcemult*=1.3
							Z.offmult*=1.3
						if("Witch")
							Z.forcemult*=1.3
							Z.offmult*=1.5

					var/choice2= input(src, "What aspect?", "Will of Chaos") in list("Time", "Breath", "Doom", "Blood", "Heart", "Space", "Mind", "Light", "Void", "Rage", "Hope", "Life")
					switch(choice2)
						if("Time")
							Z.speedmult*=1.5
						if("Breath")
							Z.speedmult*=1.15
							Z.offmult*=1.3
							Z.defmult*=1.3
						if("Doom")
							Z.defmult*=1.5
							Z.offmult*=1.3
						if("Blood")
							Z.strmult*=1.3
							Z.endmult*=1.3
							Z.resmult*=1.3
						if("Heart")
							Z.strmult*=1.5
							Z.endmult*=0.8
							Z.forcemult*=1.5
							Z.resmult*=0.8
						if("Space")
							Z.defmult*=2
							Z.offmult*=2
							Z.speedmult*=0.75
						if("Mind")
							Z.offmult*=1.5
							Z.defmult*=1.3
						if("Light")
							Z.endmult*=1.3
							Z.resmult*=1.3
							Z.defmult*=1.3
						if("Void")
							Z.strmult*=1.3
							Z.forcemult*=1.3
							Z.offmult*=1.3
						if("Rage")
							Z.strmult*=1.5
							Z.offmult*=1.3
						if("Hope")
							Z.forcemult*=1.5
							Z.offmult*=1.3
						if("Life")
							Z.forcemult*=1.3
							Z.resmult*=1.3
							Z.defmult*=1.3

					var/pointsLeft = 10
					while(pointsLeft > 0)
						var/list/stats = list("Strength", "Endurance", "Speed", "Force", "Resistance", "Offense", "Defense")
						while(stats.len > 0 && pointsLeft > 0)
							var/stat=pick(stats)
							var/val=GoCrand(1.1, 2.5)
							switch(stat)
								if("Strength") Z.strmult*=val
								if("Endurance") Z.endmult*=val
								if("Speed") Z.speedmult*=val
								if("Force") Z.forcemult*=val
								if("Resistance") Z.resmult*=val
								if("Offense") Z.offmult*=val
								if("Defense") Z.defmult*=val
							pointsLeft-=(val-1)
							stats-=stat

					if(src.RedAscension)
						src.Energy+=(src.EnergyMax/5)*1.5
						if(src.Regeneration < 2)
							src.Regeneration=2
					if(src.OrangeAscension)
						src.Energy+=(src.EnergyMax/5)*2
						if(src.Regeneration < 3)
							src.Regeneration=3
					if(src.YellowAscension)
						src.Energy+=(src.EnergyMax/5)*2.5
						if(src.Regeneration < 4)
							src.Regeneration = 4
					Z.CustomBPadd = 0
					if(src.GreenAscension)
						Z.CustomBPadd=20000000
						src.Energy+=(src.EnergyMax/5)*3
						if(src.Regeneration < 5)
							src.Regeneration = 5
					if(src.BlueAscension)
						Z.CustomBPadd=50000000
						src.Energy+=(src.EnergyMax/5)*3.5
						if(src.Regeneration < 6)
							src.Regeneration = 6
					if(src.IndigoAscension)
						Z.CustomBPadd=100000000
						src.Energy+=(src.EnergyMax/5)*4
						if(src.Regeneration < 7)
							src.Regeneration = 7
					if(src.VioletAscension)
						Z.CustomBPadd=200000000
						src.Energy+=(src.EnergyMax/5)*4.5
						src.Anger=src.AngerMax
						if(src.Regeneration < 8)
							src.Regeneration = 8
					if(src.GodOfChaosAscension)
						Z.CustomBPadd=500000000
						src.Energy+=src.EnergyMax

					src.StrengthMultiplier *= Z.strmult
					src.EnduranceMultiplier*= Z.endmult
					src.SpeedMultiplier *= Z.speedmult
					src.ForceMultiplier *= Z.forcemult
					src.ResistanceMultiplier *= Z.resmult
					src.OffenseMultiplier*=Z.offmult
					src.DefenseMultiplier*=Z.defmult
					src.PlusPower+=Z.CustomBPadd;
					src.BaseMod*=Z.CustomBPmod
					src.Base*=Z.CustomBPmod

					src << "Your power suddenly changes!"
					//src.OMessage(10,"[src]'s power chaotically fluctuates!","<font color=red>[src]([src.key]) activated Will of Chaos.")
					Z.BuffUsing=1
				}
				else
				{

					src.StrengthMultiplier /= Z.strmult
					src.EnduranceMultiplier/= Z.endmult
					src.SpeedMultiplier /= Z.speedmult
					src.ForceMultiplier /= Z.forcemult
					src.ResistanceMultiplier /= Z.resmult
					src.OffenseMultiplier/=Z.offmult
					src.DefenseMultiplier/=Z.defmult
					src.PlusPower -=Z.CustomBPadd

					src << "Your power returns to normal."
					//src.OMessage(10,"[src]'s power stops fluctuating.","<font color=red>[src]([src.key]) de-activated Will of Chaos.")
					Z.BuffUsing=0
				}
			if("Hammertime")
				if(!Z.Using)
					src << "You are now immune to damage for ten seconds!  But you can't hurt anyone."
					src.DiplomaticImmunity=1
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: STOP..."
					sleep(30)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: HAMMERTIME!"
					spawn(100)
						src.DiplomaticImmunity=0
					Z.Cooldown()
			if("ShareThePain")
				if(Z.Using)
					return
				var/list/people=list("Cancel")
				for(var/mob/M in oview(12,usr))
					people.Add(M)
				var/mob/Choice=input("Share pain with whom?")in people
				if(Choice=="Cancel")return

				var/val = input(src, "How much pain are you going to take?", "Share The Pain") as num
				if(val > 100)
					Choice.Health=-1
					src.Death(null, "sacrificing themselves to knock out [Choice]!")
				Choice.Health-=(val/2)
				src.Health-=val
				Z.Cooldown()
			if("DiplomaticImmunity")
				if(Z.Using)
					return
				if(src.DiplomaticImmunity)
					src.DiplomaticImmunity=0
					src << "You can now be damaged and damage others."
				else
					src.DiplomaticImmunity=1
					src << "You are now immune to being damaged.  You cannot damage others, either."
				Z.Cooldown()
			if("MarkOfEnergy")
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					src << "You begin to trade mana for power."
					src.SageActive=1
				else
					Z.BuffUsing=0
					src << "You stop trading mana for power."
					src.SageActive=0
			if("PriceOfSafety")
				if(Z.Using)
					return
				if(!src.PriceOfSafety)
					var/val = input(src, "What percent of your base are you willing to sacrifice? (0 to cancel)", "Price Of Safety") as num
					if(val <= 0)
						return
					if(val > 99)
						val=99
					src.Base/=(100/val)
					src.SafeRPPower=(val/10)
					src.PriceOfSafety=1
					src.RPPower+=src.SafeRPPower
					Z.Cooldown()


			if("Lariat")
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(src.Clothesline)
					src << "Fuck you, Adam."
					return
				var/Distance=10
				if(src.Energy>EnergyMax/8)
					src.OMessage(10,"[src] held their arms out and began dashing forward, lightning enveloping their body!","<font color=red>[src]([src.key]) used Lariat.")
					src.Frozen=1
					src.Clothesline=1
					Z.Using=1
					sleep(10)
					while(Z.Using&&Distance)
						step(src,src.dir)
						for(var/mob/P in view(src,1))
							var/Accuracy=(((src.Offense*src.OffenseMultiplier)*src.Power)/((P.Defense*P.DefenseMultiplier)*P.Power))*50
							if(P!=src)
								if(prob(Accuracy)&&!P.GER)
									P.Knockback(10,src)
									var/KnockbackDir=pick(-45,45)
									var/Damage=src.StrVsEnd(P,10)
									P.dir=turn(src.dir, KnockbackDir)
							/*	if(!prob(Accuracy_Formula(src,P,20)))
									Damage/=8*/
									if(src.DiplomaticImmunity || P.DiplomaticImmunity)
										Damage*=0
									P.Health-=Damage
									if(prob(25) && Distance>1)
										Distance=1
						Distance-=1
						sleep(1)
					if(Distance<=0)
						Z.Using=0
						src.Frozen=0
						src.Clothesline=0
					Z.Cooldown()


			if("SpiralEnergySeal")
				var/Seal=0
				var/SealMax=1
				if(src.Class=="Scout")
					SealMax=2
				if(src.Class=="Destroyer")
					SealMax=3
				if(src.Class=="King")
					SealMax=6
				var/list/people=list("Cancel")
				for(var/mob/M in oview(12,usr))
					people.Add(M)
				var/mob/Choice=input("Seal who's Spiral Energy?")in people
				if(Choice=="Cancel")return
				Seal=input("Choose which level to seal.","(1-[SealMax])")as num
				for(var/obj/Skills/Buffs/SpiralEnergy/x in Choice)
					if(x.BuffUsing)
						Choice.FirstSpiralSeal=1
						Choice.BuffX("SpiralEnergy",x)
				Choice.SpiralSeal=Seal
			if("SageExpand")
				var/expand=0
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1)
						src<<"You're using too many buffs!"
						return
					src.ActiveBuffs+=3
					if(!src.SageActive) return
					var/expandmax=max(1,round(Z.Level/25))
					expand=input("Choose an expand level","(1-[expandmax])")as num
					if(expand==0)return
					expand=max(min(expand,expandmax),1)
					if(src.Race!="Changeling"&&src.Race!="Lycan")
						src.NormalIcon=src.icon
						src.icon=src.ExpandIcon

					if(src.Race in list("Namekian"))
						Z:Iconz=src.icon
						if(src.overlays)Z:Overlayz.Add(src.overlays)
						src.overlays-=src.overlays
						var/icon/Heh=new(src.icon)
						src.icon=null
						if(src.Hair)Heh.Blend(Hair,ICON_OVERLAY)
						var/lolol=2*expand*expand+32
						Heh.Scale(lolol,lolol)
						src.overlays+=image(Heh,pixel_x=-(lolol-32)/2,pixel_y=-(lolol-32)/2)
				else
					if(src.Race!="Changeling"&&src.Race!="Lycan")
						src.icon=src.NormalIcon
					if(src.Race in list("Namekian"))
						src.overlays-=src.overlays
						src.icon=Z:Iconz
						src.overlays.Add(Z:Overlayz)
						Z:Iconz=null
						Z:Overlayz-=Z:Overlayz
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
				if(Z.BuffUsing>expand)
					src.OMessage(10,"[src] slinks back down to size as their power lessens.","<font color=red>[src]([src.key]) deactivated Sage Expand.")
					while(Z.BuffUsing>expand)
//						Z.BuffUsing--
						if(usr.Race=="Makyo")
							usr.Power_Multiplier-=0.35
							usr.StrengthMultiplier/=1.32
							usr.EnduranceMultiplier/=1.32
							usr.SpeedMultiplier/=0.95
						else if(usr.FreezaExpand && src.Class=="Frieza")
							usr.BaseMod/=1.25
							usr.Base/=1.25
							usr.PlusPower-=1500000
							usr.RegenerationMultiplier/=0.25
							usr.RecoveryMultiplier/=0.25
							usr.FreezaExpand-=1
						else if(usr.FreezaExpand && src.Class=="Ascended Frieza")
							usr.BaseMod/=1.5
							usr.Base/=1.5
							usr.PlusPower-=15000000
							usr.RegenerationMultiplier/=0.25
							usr.RecoveryMultiplier/=0.25
							usr.FreezaExpand-=1
						else
							usr.Power_Multiplier-=0.25
							usr.StrengthMultiplier/=1.2
							usr.EnduranceMultiplier/=1.2
							usr.SpeedMultiplier/=0.9
						//if(usr.Race=="Hollow")
								//if(usr.trans["active"]==1)
									//usr.PlusPower+=usr.trans["1give"]/4 */
						if(src.BojackUnlocked && !src.InBojack)
							src.BaseMod*=1.5
							src.Base*=1.5
							src.PlusPower+=3000000
							src.InBojack=0
						Z.BuffUsing--
				else if(Z.BuffUsing<expand)
					src.OMessage(10,"[src] expands their muscles as their veins protrude to the surface, natural energy flowing through their veins!([expand]x)","<font color=red>[src]([src.key]) activated Sage Expand([expand]x).")
					while(Z.BuffUsing<expand)
//						Z.Using++
						if(usr.Race=="Makyo")
							usr.Power_Multiplier+=0.35
							usr.StrengthMultiplier*=1.32
							usr.EnduranceMultiplier*=1.32
							usr.SpeedMultiplier*=0.95
							usr.RegenerationMultiplier*=0.6
						else if(usr.Class=="Frieza" && usr.trans["active"]==3)
							usr.BaseMod*=1.25
							usr.Base*=1.25
							usr.PlusPower+=1500000
							usr.RegenerationMultiplier*=0.25
							usr.RecoveryMultiplier*=0.25
							usr.FreezaExpand+=1
						else if(usr.Class=="Ascended Frieza" && usr.trans["active"]==3)
							usr.BaseMod*=1.5
							usr.Base*=1.5
							usr.PlusPower+=15000000
							usr.RegenerationMultiplier*=0.25
							usr.RecoveryMultiplier*=0.25
							usr.FreezaExpand+=1
						else
							usr.Power_Multiplier+=0.25
							usr.StrengthMultiplier*=1.2
							usr.EnduranceMultiplier*=1.2
							usr.SpeedMultiplier*=0.9
							if(usr.Race=="Hollow")
								if(usr.trans["active"]==1)
									usr.PlusPower+=usr.trans["1give"]/4
						Z.BuffUsing++

			if("Expand")
				var/expand=0
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1)
						src<<"You're using too many buffs!"
						return
					var/expandmax=max(1,round(Z.Level/25))
					expand=input("Choose an expand level","(1-[expandmax])")as num
					if(expand==0)
						return
					expand=max(min(expand,expandmax),1)
					if(src.Race!="Changeling"&&src.Race!="Lycan")
						src.NormalIcon=src.icon
						src.icon=src.ExpandIcon

					if(src.Race in list("Namekian"))
						Z:Iconz=src.icon
						if(src.overlays)Z:Overlayz.Add(src.overlays)
						src.overlays-=src.overlays
						var/icon/Heh=new(src.icon)
						src.icon=null
						if(src.Hair)Heh.Blend(Hair,ICON_OVERLAY)
						var/lolol=2*expand*expand+32
						Heh.Scale(lolol,lolol)
						src.overlays+=image(Heh,pixel_x=-(lolol-32)/2,pixel_y=-(lolol-32)/2)
				else
					if(src.Race!="Changeling"&&src.Race!="Lycan")
						src.icon=src.NormalIcon
					if(src.Race in list("Namekian"))
						src.overlays-=src.overlays
						src.icon=Z:Iconz
						src.overlays.Add(Z:Overlayz)
						Z:Iconz=null
						Z:Overlayz-=Z:Overlayz
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
				if(Z.BuffUsing>expand)
					src.OMessage(10,"[src] slinks back down to size as their power lessens.","<font color=red>[src]([src.key]) deactivated Expand.")
					while(Z.BuffUsing>expand)
//						Z.Using--
						if(usr.Race=="Makyo")
							usr.Power_Multiplier-=0.35
							usr.StrengthMultiplier/=1.32
							usr.EnduranceMultiplier/=1.32
							usr.SpeedMultiplier/=0.95
							usr.RegenerationMultiplier/=0.6
							usr.OffenseMultiplier/=0.85
							usr.DefenseMultiplier/=0.85
						else if(usr.FreezaExpand && src.Class=="Frieza")
							usr.BaseMod/=1.25
							usr.Base/=1.25
							usr.PlusPower-=1500000
							usr.RegenerationMultiplier/=0.25
							usr.RecoveryMultiplier/=0.25
							usr.FreezaExpand-=1
						else if(usr.FreezaExpand && src.Class=="Ascended Frieza")
							usr.BaseMod/=1.5
							usr.Base/=1.5
							usr.PlusPower-=15000000
							usr.RegenerationMultiplier/=0.25
							usr.RecoveryMultiplier/=0.25
							usr.FreezaExpand-=1
						else
							usr.Power_Multiplier-=0.125
							usr.StrengthMultiplier/=1.2
							usr.EnduranceMultiplier/=1.2
							usr.SpeedMultiplier/=0.9
							usr.RegenerationMultiplier/=0.8
							usr.OffenseMultiplier/=0.8
							usr.DefenseMultiplier/=0.8
							if(usr.UltraSSJ)
								usr.PlusPower-=usr.ssj["1give"]/4
								usr.UltraSSJ-=1
						//if(usr.Race=="Hollow")
								//if(usr.trans["active"]==1)
									//usr.PlusPower+=usr.trans["1give"]/4
						if(src.BojackUnlocked && !src.InBojack)
							src.BaseMod*=1.5
							src.Base*=1.5
							src.PlusPower+=3000000
							src.InBojack=0
						Z.BuffUsing--
				else if(Z.BuffUsing<expand)
					if(src.ActiveBuffs)
						src<<"You're trying to glitch Expand and get free buff slots. Bad [src.name]. BAD."
						return
					src.OMessage(10,"[src] expands their muscles as their veins protrude to the surface.([expand]x)","<font color=red>[src]([src.key]) activated Expand([expand]x).")
					while(Z.BuffUsing<expand)
//						Z.Using++
						if(usr.Race=="Makyo")
							usr.Power_Multiplier+=0.35
							usr.StrengthMultiplier*=1.32
							usr.EnduranceMultiplier*=1.32
							usr.SpeedMultiplier*=0.95
							usr.RegenerationMultiplier*=0.6
							usr.OffenseMultiplier*=0.85
							usr.DefenseMultiplier*=0.85
						else if(usr.Class=="Frieza" && usr.trans["active"]==3)
							usr.BaseMod*=1.25
							usr.Base*=1.25
							usr.PlusPower+=1500000
							usr.RegenerationMultiplier*=0.25
							usr.RecoveryMultiplier*=0.25
							usr.FreezaExpand+=1
						else if(usr.Class=="Ascended Frieza" && usr.trans["active"]==3)
							usr.BaseMod*=1.5
							usr.Base*=1.5
							usr.PlusPower+=15000000
							usr.RegenerationMultiplier*=0.25
							usr.RecoveryMultiplier*=0.25
							usr.FreezaExpand+=1
						else
							usr.Power_Multiplier+=0.125
							usr.StrengthMultiplier*=1.2
							usr.EnduranceMultiplier*=1.2
							usr.SpeedMultiplier*=0.9
							usr.RegenerationMultiplier*=0.8
							usr.OffenseMultiplier*=0.8
							usr.DefenseMultiplier*=0.8
							if(usr.Race=="Saiyan"||usr.Race=="Half Saiyan"||usr.Race=="Quarter Saiyan")
								if(usr.ssj["active"]==1)
									usr.PlusPower+=usr.ssj["1give"]/4
									usr.UltraSSJ+=1
							if(usr.Race=="Hollow")
								if(usr.trans["active"]==1)
									usr.PlusPower+=usr.trans["1give"]/4
						Z.BuffUsing++
						src.ActiveBuffs=3
			if("SageFocus")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1)
						src <<"You have too many buffs active!"
						return
					if(src.Energy<src.EnergyMax/10)return
					if(!src.SageActive) return
					src.ActiveBuffs+=3
					if(src.Race=="no")
						src.Power_Multiplier+=0.45
						src.RegenerationMultiplier*=1.15
						src.RecoveryMultiplier*=1.25
						src.ForceMultiplier*=1.75
						src.SpeedMultiplier*=1.35
						src.StrengthMultiplier*=0.85
						src.EnduranceMultiplier*=0.85
						if(src.BojackUnlocked)
							src.Power_Multiplier+=0.15
							src.RecoveryMultiplier*=1.15
							src.ForceMultiplier*=1.15
					else
						src.Power_Multiplier+=1
						src.RegenerationMultiplier*=1.15
						src.ForceMultiplier*=1.5
						src.SpeedMultiplier*=1.15
						src.StrengthMultiplier*=0.85
						src.EnduranceMultiplier*=0.85
						src.ResistanceMultiplier*=1.5
						/*if(usr.Race=="Hollow")
								if(usr.trans["active"]==1)
									usr.PlusPower+=usr.trans["1give"]/10*3.5*/
					src.OMessage(10,"[src] heightens their senses and alertness to focus their natural energy.","<font color=red>[src]([src.key]) activated Sage Focus.")
					Z.BuffUsing=1
/*					src.focus_event = new(skills_scheduler, src)
					skills_scheduler.schedule(src.focus_event, 50)*/
				else
					if(src.Race=="no")
						src.Power_Multiplier-=0.45
						src.RegenerationMultiplier/=1.15
						src.RecoveryMultiplier/=1.25
						src.ForceMultiplier/=1.75
						src.SpeedMultiplier/=1.35
						src.StrengthMultiplier/=0.85
						src.EnduranceMultiplier/=0.85
						if(src.BojackUnlocked)
							src.Power_Multiplier-=0.15
							src.RecoveryMultiplier/=1.15
							src.ForceMultiplier/=1.15
					if(src.BojackUnlocked && ! src.InBojack)
						src.BaseMod/=1.5
						src.Base/=1.5
						src.PlusPower-=3000000
						src.InBojack=0
					else
						src.Power_Multiplier-=1
						src.RegenerationMultiplier/=1.15
						src.ForceMultiplier/=1.5
						src.SpeedMultiplier/=1.15
						src.StrengthMultiplier/=0.85
						src.EnduranceMultiplier/=0.85
						src.ResistanceMultiplier/=1.5
						//if(usr.Race=="Hollow")
								//if(usr.trans["active"]==1)
									//usr.PlusPower-=usr.trans["1give"]/10*3.5
					src.OMessage(10,"[src] begins to relax as their focus returns to normal..","<font color=red>[src]([src.key]) deactivated Sage Focus.")
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					Z.BuffUsing=0
				sleep(10)
			if("SageMode")
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					src.Power_Multiplier+=1.25
					src.EnergyMax*=2
					src.EnergyMod*=2
					src.SageActive=1
					//src.Zenkai_Rate = 50
					src.overlays-=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.overlays+=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					if(locate(/obj/Skills/Buffs/Rinnegan,src.contents)&&src.SixPathUnlocked)
						src.OMessage(10,"[src] erupts with a tremendous amount of natural energy!", "[src] used Six Path Sage Mode.")
						src.AngerMax*=2
						src.Anger=src.AngerMax
						src.ManaAmount*=2
						src.ManaMax*=2
						src.PlusPower+=8000000
					//src.Hairz("Remove")
					//src.Hairz("Add")
					src<<"You are now in Sage Mode."
					Z.BuffUsing=1
				else
					src<<"You stop using your Sage power."
					src.overlays-=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					Z.BuffUsing=0
					if(locate(/obj/Skills/Buffs/Rinnegan,src.contents)&&src.SixPathUnlocked)
						src.OMessage(10,"[src] supresses the power.", "[src] deactivated Six Path Sage Mode.")
						src.PlusPower-=8000000
						src.AngerMax/=2
						src.Anger=0
						src.ManaAmount/=2
						src.ManaMax/=2
					src.SageActive=0
					src.EnergyMax/=2
					src.EnergyMod/=2
					src.Power_Multiplier-=1.25
				sleep(20)
			if("SageKikoho")
				if(Z.Using)
					return
				var/Drain=100/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(15)
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Health-=20
				if(!src.Manakete)
					src.ManaAmount-=50
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(3)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.Radius=1
				A.Explosive=1
				A.Deflectable=1
				A.Knockback=1
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=30
				A.Offense=(src.Offense*src.OffenseMultiplier)
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
			if("Ripper")
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					src.CyberizeMod*=1+(1.25*src.MachinaMod)
					src.Ripper=1
					src.StrengthMultiplier*=1.25
					src.SpeedMultiplier*=1.5
					src.ForceMultiplier*=1.75
					src.overlays+=image(icon='RipperAura.dmi')
					src.OMessage(10, "[src]'s cybernetics kick into overdrive as their body burns with power!", "[src]([src.key]) used Overdrive.")
				else
					Z.BuffUsing=0
					src.CyberizeMod/=1+(1.25*src.MachinaMod)
					src.Ripper=0
					src.StrengthMultiplier/=1.25
					src.SpeedMultiplier/=1.5
					src.ForceMultiplier/=1.75
					src.overlays-=image(icon='RipperAura.dmi')
					src << "You stop overclocking your systems."
			if("NinjaRun")
			if("Overdrive")
				if(src.Alert("You sure you want to use Overdrive?"))
					if(!src.Overdrive)
						if(src.Class =="Spiral")
						{
							Z.BuffUsing=1
							src.CyberPower*=10
							src.overlays+=image(icon='SpiralAura.dmi',icon_state="",pixel_x=-32)
							src.Overdrive=1
							OMessage(10,"[src] becomes the embodiment of manliness!", "[src] used Overdrive as a Spiral Warrior.");
							src.contents+=new/obj/Skills/Attacks/GigaDrillBreaker
						}
						else
							Z.BuffUsing=1
							if(src.Race!="Android")
								src.CyberPower*=10
							src<<"Your cybernetic energy begins to overload!"
							src.overlays+=image(icon='AurasBig.dmi',icon_state="Kaioken",pixel_x=-32)
							src.Overdrive=1
					else
						return
					sleep(20)
			if("Susanoo")
				if(!Z.BuffUsing)
					if(src.SpecialSlot)
						src << "You're already using a special buff."
						return
					src.SpecialSlot=1
					src.DefenseMultiplier*=0.1
					src.StrengthMultiplier*=(5/src.StrengthMod)+1
					src.EnduranceMultiplier*=(5/src.EnduranceMod)+1
					src.ResistanceMultiplier*=(5/src.ResistanceMod)+1
					src.PlusPower+=src.Base*100
					src.SusanooActive=1
					src.ControlPower=100
					if(src.EternalSusanoo&&src.SusanooCount>=1)
						src.OffenseMod/=0.95
						src.Offense/=0.95
						src.DefenseMod/=0.95
						src.Defense/=0.95
						src.SusanooCount-=1
					if(!locate(/obj/Skills/Buffs/Sharingan,src.contents))
						src.contents += new/obj/Skills/Buffs/Sharingan
						src.SharinganUnlocked=4
					src.OMessage(10,"[src] envelops their body in a massive armor of energy!","<font color=red>[src]([src.key]) activated Susano'o")
					src.overlays+=image('Susano.dmi',pixel_x=-32,pixel_y=-32)
					Z.BuffUsing=1
				else
					src.SpecialSlot=0
					src.StrengthMultiplier/=(5/src.StrengthMod)+1
					src.EnduranceMultiplier/=(5/src.EnduranceMod)+1
					src.ResistanceMultiplier/=(5/src.ResistanceMod)+1
					src.DefenseMultiplier/=0.1
					src.PlusPower=0
					src.SusanooActive=0
					src.overlays-=image('Susano.dmi',pixel_x=-32,pixel_y=-32)
					if(prob(1000/src.Health) && !src.EternalSusanoo)
						src.OffenseMod*=0.95
						src.Offense*=0.95
						src.DefenseMod*=0.95
						src.Defense*=0.95
						src.SusanooCount+=1
					if(src.EternalSusanoo&&src.SusanooCount>=1)
						src.OffenseMod/=0.95
						src.Offense/=0.95
						src.DefenseMod/=0.95
						src.Defense/=0.95
						src.SusanooCount-=1
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					src.OMessage(10,"[src] deactivates the armor.","<font color=red>[src]([src.key]) deactivated Susano'o")
					Z.BuffUsing=0
			if("GiveJagan")///copypaste OP
			{
				var/list/choices = list();
				for(var/mob/m in oview(1, src))
				{
					if(m.client)
					{
						choices+=m;
					}
				}
				choices+=src
				var/mob/choice = input("Who do you want to give the Jagan to?", "Give Jagan") in choices
				var/confirm = alert("Are you sure you want to give [choice] the Jagan? It'll render them a shadow of their former self for a time.", "Give Jagan", "Yes", "No")
				if(confirm=="Yes")
				{
					if(choice.JaganEye) return
					//if(choice!=src)
						//if(prob(35))
							//choice.Death(null, "complications from implanting the Jagan Eye!")

					choice.JaganEyeReq=choice.Base*3
					choice.RPPower/=3
					choice.JaganEye=1
					choice.EnergyMod*=1.25
					if(choice.IronLung!=1)
						choice.IronLung=1
						choice.MaxOxygen*=5
					if(choice.TrainModule!=1)
						choice.Training_Rate*=1.5
						choice.TrainModule=1
					if(choice.MeditateModule!=1)
						choice.Meditation_Rate*=1.5
						choice.MeditateModule=1
					//if(choice.Zenkai_Rate>=10)
					//	choice.Zenkai_Rate*=1.5
					//if(choice.Zenkai_Rate<10)
					//	choice.Zenkai_Rate*=3
					//if(!locate(/obj/Skills/Telepathy,choice.contents))
					//	choice.contents+=new/obj/Skills/Telepathy
				}
			}
			if("GiveSpiritCuffs")
				var/list/choices = list();
				for(var/mob/m in oview(1, src))
				{
					if(m.client)
					{
						choices+=m;
					}
				}
				choices+=src
				var/mob/choice = input("Who do you want to give Spirit Cuffs to?", "Give Spirit Cuffs") in choices
				var/confirm = alert("Are you sure you want to give [choice] a pair of Spirit Cuffs? It'll weaken their base gain", "Give Spirit Cuffs", "Yes", "No")
				if(confirm=="Yes")
					if(choice.SpiritCuffsGiven)
						src<<"They have already been given Spirit Cuffs!"
						return
					var/cuffsword = input("Select a word to use.") as text
					choice.SpiritCuffs=1
					choice.SpiritCuffsGiven=1
					choice.SpiritCuffsWord=cuffsword
					choice.contents+=new/obj/Skills/Rank/BreakSpiritCuffs
			if("SpiralEnergy")
			{
				if(!Z.BuffUsing)
				{

					if(src.SpiralSeal>src.UnlockSpiral)
						src << "Your spiral energy is sealed."


					if(src.SpecialSlot)
						src << "You're already using a special buff."
						return
					src.SpecialSlot=1
					Z.BuffUsing = 1
					if(src.Race=="Human")
						src.Class="Spiral"
					src.Zenkai_Rate = 50

					src.CheckForSpiralAscensions();
					Z.RevNum = src.GetRevNum();

					Z.RevNum = src.GetRevNum();

					if(Z.RevNum>=1)
						src.RecoveryMultiplier*=1.5
						src.SpeedMultiplier*=1.25
					if(!Z.RevNum)
					{
						src.Base*=1.5
						src.BaseMod*=1.5
						if(src.Regeneration < 2)
						{
							src.Regeneration = 2
						}
						src.OMessage(10,"<font color='#00FF00'>[src] begins to glow with an unknown green energy!</font color>","<font color=red>[src]([src.key]) activated Spiral Energy.")
					}
					if(Z.RevNum == 1)
					{
						src.Base*=1.75
						src.BaseMod*=1.75
						if(src.Regeneration < 4)
						{
							src.Regeneration = 4
						}
						src.overlays += icon('SpiralMajin.dmi')
						src.OMessage(10,"<font color='#00FF00'>[src]'s form is cloaked in neon green power!!</font color>","<font color=red>[src]([src.key]) activated Spiral Energy.")
					}
					if(Z.RevNum == 2)
					{
						src.Base*=2
						src.BaseMod*=2
						src.CyberizeMod=2
						if(src.Regeneration < 5)
						{
							src.Regeneration = 5
						}
						src.overlays += icon('SpiralMystic.dmi')
						src.OMessage(10,"<font color='#00FF00'>[src]'s flourescent energy crackles with reckless, manly abandon!!!</font color>","<font color=red>[src]([src.key]) activated Spiral Energy.")
					}
					if(Z.RevNum == 3)
					{
						src.Base*=2.25
						src.BaseMod*=2.25
						src.CyberizeMod=3
						if(src.Regeneration < 6)
						{
							src.Regeneration = 6
						}
						src.overlays += image(icon='SpiralBigAura.dmi', icon_state="", pixel_x=-32);
						src.OMessage(10,"<font color='#00FF00'>[src] explodes with Spiral Energy!!!!</font color>","<font color=red>[src]([src.key]) activated Spiral Energy.")
		/*				if(src.AngerMax < 2)
						{
							src.AngerMax = 2
						}*/
					}
					if(Z.RevNum == 4)
					{
						src.Base*=2.5
						src.BaseMod*=2.5
						src.CyberizeMod=4
						if(src.Regeneration < 8)
						{
							src.Regeneration = 8
						}
						src.overlays +=image(icon='SpiralAura.dmi', icon_state="", pixel_x=-32);
						src.OMessage(10,"<font color='#00FF00'>[src]'s Spiral Energy is limitless!!!!!</font color>","<font color=red>[src]([src.key]) activated Spiral Energy.")
					}
					if(Z.RevNum == 5)
					{
						src.Base*=3
						src.BaseMod*=3
						src.CyberizeMod=8
						if(src.Regeneration < 10)
						{
							src.Regeneration = 10
						}
						src.OMessage(10,"<font color='#00FF00'>[src]'s eyes assume a spiral pattern.</font color>","<font color=red>[src]([src.key]) activated Spiral Energy.")

					}
	/*				var/highestCyberBP = 0
					for(var/mob/m in world)
					{
						var/eCBP = m.CyberPower / m.BaseMod / m.CyberizeMod
						if(eCBP > highestCyberBP)
						{
							highestCyberBP = eCBP
						}
					}*/
				//	src.CyberPower = highestCyberBP * src.BaseMod * src.CyberizeMod
					src.SpiralEnergyEnabled = 1
				}
				else
				{
					if(src.FirstSpiralSeal)
						src << "Your spiral energy has been sealed!"
						src.FirstSpiralSeal=0
					src.SpecialSlot=0
					Z.BuffUsing = 0
					if(Z.RevNum>=1)
						src.RecoveryMultiplier/=1.5
						src.SpeedMultiplier/=1.25
					if(!Z.RevNum)
					{
						src.Base/=1.5
						src.BaseMod/=1.5
					}
					if(Z.RevNum == 1)
					{
						src.Base/=1.75
						src.BaseMod/=1.75
						src.overlays -= icon('SpiralMajin.dmi')
					}
					if(Z.RevNum == 2)
					{
						src.Base/=2
						src.BaseMod/=2
						src.overlays -= icon('SpiralMystic.dmi')
					}
					if(Z.RevNum == 3)
					{
						src.Base/=2.25
						src.BaseMod/=2.25
						src.overlays -= image(icon='SpiralBigAura.dmi', icon_state="", pixel_x=-32);
					}
					if(Z.RevNum == 4)
					{
						src.Base/=2.5
						src.BaseMod/=2.5
						src.overlays -= image(icon='SpiralAura.dmi', icon_state="", pixel_x=-32);
					}
					if(Z.RevNum == 5)
					{
						src.Base/=3
						src.BaseMod/=3
					}
	//				src.CyberPower = 0
					src.SpiralEnergyEnabled = 0
					src.OMessage(10,"<font color='#00FF00'>[src]'s Spiral Energy fades away...</font color>","<font color=red>[src]([src.key]) deactivated Spiral Energy.")
				}
			}
			if("SpiralNemesis")
			{
				if(!Z.BuffUsing)
				{
					if(src.SpiralSeal>src.UnlockSpiral)
						src << "Your spiral energy is sealed."

					if(src.SpecialSlot)
						src << "You're already using a special buff."
						return
					src.SpecialSlot=1
					Z.BuffUsing = 1
					if(src.Race=="Human")
						src.Class="Spiral"
					//src.Zenkai_Rate = 50

					src.CheckForSpiralAscensions();

					Z.RevNum = src.GetRevNum();

					if(Z.RevNum>=1)
						src.ForceMultiplier*=1.75
						src.StrengthMultiplier*=1.75
					if(!Z.RevNum)
					{
						src.Base*=1.75
						src.BaseMod*=1.75
						if(src.Regeneration < 2)
						{
							src.Regeneration = 2
						}
						src.OMessage(10,"<font color='#FF0000'>[src] begins to glow with an unknown red energy!</font color>","<font color=red>[src]([src.key]) activated Spiral Energy.")
					}
					if(Z.RevNum == 1)
					{
						src.Base*=2
						src.BaseMod*=2
						if(src.Regeneration < 4)
						{
							src.Regeneration = 4
						}
						src.overlays += icon('SpiralNemesisMajin.dmi')
						src.OMessage(10,"<font color='#FF0000'>[src]'s form is cloaked in crimson red power!!</font color>","<font color=red>[src]([src.key]) activated Spiral Energy.")
					}
					if(Z.RevNum == 2)
					{
						src.Base*=2.25
						src.BaseMod*=2.25
						src.CyberizeMod=2
						if(src.Regeneration < 5)
						{
							src.Regeneration = 5
						}
						src.overlays += icon('SpiralNemesisMystic.dmi')
						src.OMessage(10,"<font color='#FF0000'>[src]'s flourescent energy crackles with reckless, destructive abandon!!!</font color>","<font color=red>[src]([src.key]) activated Spiral Energy.")
					}
					if(Z.RevNum == 3)
					{
						src.Base*=2.4
						src.BaseMod*=2.4
						src.CyberizeMod=3
						if(src.Regeneration < 6)
						{
							src.Regeneration = 6
						}
						src.overlays += image(icon='SpiralNemesisBigAura.dmi', icon_state="", pixel_x=-32);
						src.OMessage(10,"<font color='#FF0000'>[src] explodes with red Spiral Energy!!!!</font color>","<font color=red>[src]([src.key]) activated Spiral Energy.")
		/*				if(src.AngerMax < 2)
						{
							src.AngerMax = 2
						}*/
					}
					if(Z.RevNum == 4)
					{
						src.Base*=2.65
						src.BaseMod*=2.65
						src.CyberizeMod=4
						if(src.Regeneration < 8)
						{
							src.Regeneration = 8
						}
						src.overlays +=image(icon='SpiralNemesisAura.dmi', icon_state="", pixel_x=-32);
						src.OMessage(10,"<font color='#FF0000'>[src]'s Spiral Energy is limitless!!!!!</font color>","<font color=red>[src]([src.key]) activated Spiral Energy.")
					}
					if(Z.RevNum == 5)
					{
						src.Base*=2.8
						src.BaseMod*=2.8
						src.CyberizeMod=8
						if(src.Regeneration < 10)
						{
							src.Regeneration = 10
						}
						src.OMessage(10,"<font color='#FF0000'>[src]'s eyes assume a red spiral pattern.</font color>","<font color=red>[src]([src.key]) activated Spiral Energy.")

					}
	/*				var/highestCyberBP = 0
					for(var/mob/m in world)
					{
						var/eCBP = m.CyberPower / m.BaseMod / m.CyberizeMod
						if(eCBP > highestCyberBP)
						{
							highestCyberBP = eCBP
						}
					}*/
				//	src.CyberPower = highestCyberBP * src.BaseMod * src.CyberizeMod
					src.SpiralEnergyEnabled = 1
				}
				else
				{
					if(src.FirstSpiralSeal)
						src << "Your spiral energy has been sealed!"
						src.FirstSpiralSeal=0
					src.SpecialSlot=0
					Z.BuffUsing = 0
					if(Z.RevNum>=1)
						src.ForceMultiplier/=1.75
						src.StrengthMultiplier/=1.75
					if(!Z.RevNum)
					{
						src.Base/=1.75
						src.BaseMod/=1.75
					}
					if(Z.RevNum == 1)
					{
						src.Base/=2
						src.BaseMod/=2
						src.overlays -= icon('SpiralNemesisMajin.dmi')
					}
					if(Z.RevNum == 2)
					{
						src.Base/=2.25
						src.BaseMod/=2.25
						src.overlays -= icon('SpiralNemesisMystic.dmi')
					}
					if(Z.RevNum == 3)
					{
						src.Base/=2.4
						src.BaseMod/=2.4
						src.overlays -= image(icon='SpiralNemesisBigAura.dmi', icon_state="", pixel_x=-32);
					}
					if(Z.RevNum == 4)
					{
						src.Base/=2.65
						src.BaseMod/=2.65
						src.overlays -= image(icon='SpiralNemesisAura.dmi', icon_state="", pixel_x=-32);
					}
					if(Z.RevNum == 5)
					{
						src.Base/=2.8
						src.BaseMod/=2.8
					}
	//				src.CyberPower = 0
					src.SpiralEnergyEnabled = 0
					src.OMessage(10,"<font color='#FF0000'>[src]'s red Spiral Energy fades away...</font color>","<font color=red>[src]([src.key]) deactivated Spiral Energy.")
				}
			}

			if("DarknessBuff")
				if(!Z.BuffUsing)
					if(!src.ActiveBuffs)
						src.ActiveBuffs=3
						Z:UsingBuffs=1
					else if(!src.SpecialSlot)
						src.SpecialSlot=1
						Z:UsingSpecial=1
					else
						src << "You have no slots open."
						return
					Z.BuffUsing=1
					src.Anger=src.AngerMax
					if(Z:UsingBuffs)
						src.Power_Multiplier+=1
					src.SpeedMultiplier*=1.5
					src.overlays-=Z.sicon
					src.overlays+=Z.sicon
					src.OMessage(10,null,"[src]([src.key]) has a black aura form around them!")
					Z.BuffUsing=1
				else
					if(Z:UsingBuffs)
						src.Power_Multiplier-=1
					src.SpeedMultiplier/=1.5
					src.Anger=0
					src.OMessage(10,null,"[src]([src.key])'s black aura fades!")
					src.overlays-=Z.sicon
					Z.BuffUsing=0
					if(Z:UsingSpecial)
						src.SpecialSlot=0
						Z:UsingSpecial=0
					else if(Z:UsingBuffs)
						src.ActiveBuffs=0
						Z:UsingBuffs=0
				sleep(20)
			if("TranceForm")
				if(!Z.BuffUsing)
					if(src.TranceCounter<=3) return
					if(src.ActiveBuffs>=1) return
					if(!src.TranceObtained)
						src.TranceObtained=1
					if(src.Energy<src.EnergyMax/10)return
					src.ActiveBuffs+=3
					src.Power_Multiplier+=2
					src.SpeedMultiplier*=1.5
					src.ManaMax*=3
					src.ManaAmount*=3
					src.TranceForm=1
					src.OMessage(10,"[src] explodes with magical energy!","<font color=red>[src]([src.key]) activated Trance Form.")
					Z.BuffUsing=1
				else
					src.Power_Multiplier-=2
					src.SpeedMultiplier/=1.5
					src.OMessage(10,"[src] deactivates Trance Form.","<font color=red>[src]([src.key]) deactivated Trance Form.")
					src.ActiveBuffs-=3
					src.ManaMax/=3
					src.ManaAmount/=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					src.TranceForm=0
					Z.BuffUsing=0
				sleep(10)
			if("LightningArmor")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1) return
					if(src.ControlPower>100) return
					if(src.Energy<src.EnergyMax/10)return
					src.ActiveBuffs+=3
					src.Power_Multiplier+=0.5
					src.StrengthMultiplier*=1.5
					src.SpeedMultiplier*=2
					src.DefenseMultiplier*=1.25
					src.LightningArmor=1
					src.overlays+='ElecAura1.dmi'
					src.OMessage(10,"[src] surrounded their body in an armor of electricity!","<font color=red>[src]([src.key]) activated Lightning Armor.")
					if(src.Race=="Saiyan"||src.Race=="Half Saiyan"||src.Race=="Quarter Saiyan")
						if(src.ssj["active"]==1)
							src.PlusPower+=src.ssj["1give"]/2
							src.UltraSSJ+=1
					Z.BuffUsing=1
				else
					src.Power_Multiplier-=0.5
					src.OMessage(10,"[src] deactivates the electricity.","<font color=red>[src]([src.key]) deactivated Lightning Armor.")
					src.StrengthMultiplier/=1.5
					src.DefenseMultiplier/=1.25
					src.SpeedMultiplier/=2
					src.ActiveBuffs-=3
					src.overlays-='ElecAura1.dmi'
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					if(src.UltraSSJ)
						src.PlusPower-=src.ssj["1give"]/2
						src.UltraSSJ-=1
					src.LightningArmor=0
					Z.BuffUsing=0
				sleep(10)
			if("StormArmor")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1) return
					if(src.ControlPower>100) return
					if(src.Energy<src.EnergyMax/10)return
					src.ActiveBuffs+=3
					src.Power_Multiplier+=0.5
					src.StrengthMultiplier*=2
					src.ForceMultiplier*=2
					src.DefenseMultiplier*=1.25
					src.OffenseMultiplier*=1.5
					src.StormArmor=1
					src.OMessage(10,"[src] surrounded their body in an armor of pulsating, destructive Ki!","<font color=red>[src]([src.key]) activated Storm Armor.")
					if(src.Race=="Saiyan"||src.Race=="Half Saiyan"||src.Race=="Quarter Saiyan")
						if(src.ssj["active"]==1)
							src.PlusPower+=src.ssj["1give"]/2
							src.UltraSSJ+=1
					Z.BuffUsing=1
				else
					src.Power_Multiplier-=0.5
					src.OMessage(10,"[src] deactivates the destructive aura.","<font color=red>[src]([src.key]) deactivated Storm Armor.")
					src.StrengthMultiplier/=2
					src.ForceMultiplier/=2
					src.DefenseMultiplier/=1.25
					src.OffenseMultiplier/=1.5
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					if(src.UltraSSJ)
						src.PlusPower-=src.ssj["1give"]/2
						src.UltraSSJ-=1
					src.StormArmor=0
					Z.BuffUsing=0
				sleep(10)
			if("BloodArmor")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1) return
					if(src.ControlPower>100) return
					if(src.Energy<src.EnergyMax/10)return
					src.ActiveBuffs+=3
					src.Power_Multiplier+=0.5
					src.StrengthMultiplier*=1.5
					src.EnduranceMultiplier*=1.25
					src.DefenseMultiplier*=1.75
					src.OffenseMultiplier*=2.25
					src.BloodArmor=1
					src.OMessage(10,"[src]'s body became a faint shade of red, as the flow of their blood vastly increased!","<font color=red>[src]([src.key]) activated Blood Armor.")
					if(src.Race=="Saiyan"||src.Race=="Half Saiyan"||src.Race=="Quarter Saiyan")
						if(src.ssj["active"]==1)
							src.PlusPower+=src.ssj["1give"]/2
							src.UltraSSJ+=1
					Z.BuffUsing=1
				else
					src.Power_Multiplier-=0.5
					src.OMessage(10,"[src] deactivates the red aura, as their blood flow turns to normal.","<font color=red>[src]([src.key]) deactivated Blood Armor.")
					src.StrengthMultiplier/=1.5
					src.EnduranceMultiplier/=1.25
					src.DefenseMultiplier/=1.75
					src.OffenseMultiplier/=2.25
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					if(src.UltraSSJ)
						src.PlusPower-=src.ssj["1give"]/2
						src.UltraSSJ-=1
					src.BloodArmor=0
					Z.BuffUsing=0
				sleep(10)
			if("MagmaArmor")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1) return
					if(src.ControlPower>100) return
					if(src.Energy<src.EnergyMax/10)return
					src.ActiveBuffs+=3
					src.Power_Multiplier+=0.5
					src.StrengthMultiplier*=1.25
					src.EnduranceMultiplier*=2
					src.ResistanceMultiplier*=2
					src.MagmaArmor=1
					src.OMessage(10,"[src] calls Magma forth from the ground, and surrounds their body in it!","<font color=red>[src]([src.key]) activated Magma Armor.")
					if(src.Race=="Saiyan"||src.Race=="Half Saiyan"||src.Race=="Quarter Saiyan")
						if(src.ssj["active"]==1)
							src.PlusPower+=src.ssj["1give"]/2
							src.UltraSSJ+=1
					Z.BuffUsing=1
				else
					src.Power_Multiplier-=0.5
					src.OMessage(10,"[src] deactivates the Magma Armor..","<font color=red>[src]([src.key]) deactivated Blood Armor.")
					src.StrengthMultiplier/=1.25
					src.EnduranceMultiplier/=2
					src.ResistanceMultiplier/=2
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					if(src.UltraSSJ)
						src.PlusPower-=src.ssj["1give"]/2
						src.UltraSSJ-=1
					src.MagmaArmor=0
					Z.BuffUsing=0
				sleep(10)

			if("SummonStar")
				if(!MakyoStar)
					if(src.Alert("You sure you want to use this? It's irreversible until you die."))
						if(src.Dead) return
						world<<"<b><font color=red>The Makyo Star approaches...!</b>"
						MakyoStar=1
				else
					src.Power_Multiplier-=0.5
					src.SpeedMultiplier/=1.25
					src.Anger=1
					src.OMessage(10,null,"[src]([src.key])'s black aura fades!")
					src.overlays-=Z.sicon
					Z.Using=0
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
				sleep(20)
			if("SunlightSpear")
				if(Z.Using)
					return
				var/Drain=100/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.ManaAmount<=99) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(20)
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Health-=10/(sqrt(Z.Level)/3)
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(3)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=99
				A.Deflectable=0
				A.Knockback=0
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.SuperExplosive=1
				A.Damage_Multiplier=50
				A.Offense=(src.Offense*src.OffenseMultiplier)*5
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				if(!src.Manakete)
					src.ManaAmount-=100
				Z.Cooldown()
			/*if("Lightbringer")
				if(!Z.BuffUsing)
					for(var/obj/Items/Sword/S in usr)
						if(S.suffix)
							Z.CustomBPmod=0

							//prevents stacking of excalibur and lightbringer
							if(locate(/obj/Skills/Swords/Excalibur, src))
								for(var/obj/Skills/Swords/Excalibur/e in src)
									if(e.BuffUsing)
										src.SkillX("Excalibur", e)
									src << "Your blade transforms from Excalibur into the Lightbringer!"
									del e

							Z.NormalEnchant=S.EnchantType
							if(src.ActiveBuffs)//if it has buff on
								if(src.SpecialSlot)//if it has special on
									src << "You are already using a special buff and a normal buff."
									return//it wont do it
								src.SpecialSlot=1//but if there is no special, it will turn the special slot on.
								Z:UsedSpecial=1
							else
								src.ActiveBuffs=3//if there are no buffs, it'll give buff to slotted slot.
								Z:UsedNormal=1
							src.Power_Multiplier+=0.75
							src.RecoveryMultiplier*=1.75
							S.EnchantType="Ultima-Holy"
							src.overlays+=image('AurasBig.dmi',"Demi",pixel_x=-32)
							src.OMessage(10,"[src] surrounded their blade in a radiant divine light!","<font color=red>[src]([src.key]) activated Lightbringer.")
							for(var/mob/m in view(12))
								if(m.PerfectProjection&&!m.ProjectLightbringer)
									m.ProjectLightbringer=1
									m << "You learn to project Lightbringer!"
							Z.BuffUsing=1
					//	else if(!S.suffix && !Z.Using)
					//		src<<"You can't use this without a sword equiped!"
				else
					src.RecoveryMultiplier/=1.75
					src.Power_Multiplier-=0.75
					if(Z:UsedSpecial)
						Z:UsedSpecial=0
						src.SpecialSlot=0
					if(Z:UsedNormal)
						Z:UsedNormal=0
						src.ActiveBuffs=0
					for(var/obj/Items/Sword/S in usr)
						if(S.suffix)
							S.EnchantType=Z.NormalEnchant
					src.OMessage(10,"[src] dispelled the light.","<font color=red>[src]([src.key]) deactivated Lightbringer.")
					src.overlays-=image('AurasBig.dmi',"Demi",pixel_x=-32)
					Z.BuffUsing=0
				sleep(10)*/
			/*(if("Deathbringer")
				if(!Z.BuffUsing)
					for(var/obj/Items/Sword/S in usr)
						if(S.suffix)

							//prevents stacking of excalibur and lightbringer
							if(locate(/obj/Skills/Swords/Muramasa, src))
								for(var/obj/Skills/Swords/Muramasa/m in src)
									if(m.BuffUsing)
										src.SkillX("Muramasa", m)
									src << "Your blade transforms from Muramasa into the Deathbringer!"
									del m

							Z.NormalEnchant=S.EnchantType
							if(src.ActiveBuffs)
								if(src.SpecialSlot)
									src << "You have a normal buff and a special buff already active."
									return
								src.SpecialSlot=1
								Z:UsedSpecial=1
							else
								src.ActiveBuffs=3
								Z:UsedNormal=1
							src.Power_Multiplier+=0.75
							//src.WeaponBreaker=1
							S.EnchantType="Ultima-Darkness"
							src.overlays+=image('AurasBig.dmi',pixel_x=-32)
							if(src.key=="Exman33")
								src.OMessage(10, "Batman triggurs de powah ov he Deathbringe...", "<font color=red>[src]([src.key]) made a typo once and I'll never let him live it down.")
							else
								src.OMessage(10,"[src] surrounded their blade in a radiant crushing darkness!","<font color=red>[src]([src.key]) activated Deathbringer.")
							for(var/mob/m in view(12))
								if(m.PerfectProjection&&!m.ProjectDeathbringer)
									m.ProjectDeathbringer=1
									m << "You learn to project Deathbringer!"
							Z.BuffUsing=1
					//	else if(!S.suffix && !Z.Using)
					//		src<<"You can't use this without a sword equiped!"
				else
					for(var/obj/Items/Sword/S in usr)
						if(S.suffix)
							S.EnchantType=Z.NormalEnchant
					if(Z:UsedSpecial)
						Z:UsedSpecial=0
						src.SpecialSlot=0
					if(Z:UsedNormal)
						Z:UsedNormal=0
						src.ActiveBuffs=0
					src.Power_Multiplier-=0.75
					//src.WeaponBreaker=0
					if(src.key=="Exman33")
						src.OMessage(10, "Batman let he Deathbringe go...Deathbringe sad...", "[src]([src.key]) cannot catch a break.")
					else
						src.OMessage(10,"[src] dispelled the light.","<font color=red>[src]([src.key]) deactivated Lightbringer.")
					src.overlays-=image('AurasBig.dmi',pixel_x=-32)
					Z.BuffUsing=0
				sleep(10)*/
			if("ChaosRegen")
				if(src.KO||Z.Using||src.Blocking)return
				if(src.Health>=85) return
				var/intensity = GoCrand(0.5,2.5)
				Z.Using=1
				src.Health+=10*intensity
				src.Health*=1.1*intensity
				if(intensity < 1)
					src.Energy *= 0.9
				if(intensity > 1 && intensity < 2)
					src.Energy *= 0.8
				if(intensity > 2)
					src.Energy *= 0.7
				src.OMessage(10,"[src]'s power drops as their wounds heal!","<font color=red>[src]([src.key]) used Burst Regeneration.")
				Z.Cooldown()
			if("SixPathsOfJumpy")
				if(!Z.BuffUsing)
					var/list/PathType=list("Luck","Safety","Sacrifice","Rejuvenation")
					if(src.trans["unlocked"]>=1)
						PathType.Add("Death")
						PathType.Add("Life")
					PathType.Add("Cancel")
					var/obj/selection=input("")in PathType
					if(selection=="Cancel")
						return
					if(selection=="Luck")
						src.PathType="Luck"
					if(selection=="Safety")
						src.PathType="Safety"
					if(selection=="Sacrifice")
						src.PathType="Sacrifice"
					if(selection=="Rejuvenation")
						src.PathType="Rejuvenation"
					if(selection=="Death")
						src.PathType="Death"
					if(selection=="Life")
						src.PathType="Life"
					src.overlays-=Z.sicon
					src.overlays+=Z.sicon
					Z.BuffUsing=1
					//src.ActiveBuffs-=1
					src.SetVars()
					if(src.PathType=="Death")
						src.LastBreath=1
					src.OMessage(10,"[src] releases the wrath of their inner Jumpy!","<font color=red>[src]([src.key]) activated Olympian Jumpy.")
				else
					if(src.PathType=="Death")
						src.Death(null, "strain from the path of Death!")
					if(src.PathType=="Life")
						src.Savable=0
						fdel("Saves/Players/[src.ckey]")
						Log("Admin","<font color=blue>[ExtractInfo(usr)] SAVE DELETED [ExtractInfo(src)] for using the Path of Life.")
						src.OMessage(10,"[src]'s soul vanishes!","<font color=red>[src]([src.key]) faded from existence..")
						del(usr)
					src.PathType="None"
					src.overlays-=Z.sicon
					src.OMessage(10,"[src] calms their Jumpy down.","<font color=red>[src]([src.key]) deactivated Olympian Jumpy.")
					Z.BuffUsing=0
				sleep(10)
			if("PathFind")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1) return
					if(src.PathType=="None") return
					//src.ActiveBuffs+=3
					//now a racial like everything else.
					src.Base*=2
					src.BaseMod*=2
					if(src.PathType=="Safety")
						src.EnduranceMultiplier*=1.5
						src.ResistanceMultiplier*=1.5
						src.StrengthMultiplier*=1.2
						src.ForceMultiplier*=1.2
						src.contents+=new/obj/Skills/Buffs/EarthenWall
						src.contents+=new/obj/Skills/Buffs/DiplomaticImmunity
						if(src.trans["unlocked"]>=1)
							src.contents+=new/obj/Skills/Buffs/PriceOfSafety
					if(src.PathType=="Luck")
						src.Energy=src.EnergyMax*rand(0.1,3)
						src.Health=rand(30,200)
						src.contents+=new/obj/Skills/Buffs/BoostingWinds
						src.AngerMax=GoCrand(1, 2)
						src.Anger=src.AngerMax
						src<<"You can't back out of a gamble without severe consequences."
					if(src.PathType=="Sacrifice")
						src.StrengthMultiplier*=1.75
						src.DefenseMultiplier*=0.5
						src.contents+=new/obj/Skills/Buffs/BlazingWrath
						src.contents+=new/obj/Skills/Buffs/ShareThePain
					if(src.PathType=="Rejuvenation")
						src.RegenerationMultiplier*=1.5
						src.RecoveryMultiplier*=1.5
						src.contents+=new/obj/Skills/Buffs/MistVeil
						src.contents+=new/obj/Skills/Buffs/MarkOfEnergy
						if(src.trans["unlocked"]>=1)
							src.contents+=new/obj/Skills/Buffs/Hammertime
					if(src.PathType=="Death")
						src.BaseMod*=5
						src.Base*=5
						src.Anger=src.AngerMax
					if(src.PathType=="Life")
						src.Power_Multiplier+=100
					Z.BuffUsing=1
					src.OMessage(10,"[src] tapped into the Path of [src.PathType].","<font color=red>[src]([src.key]) activated Pathfind.")
				else
					src.Base/=2
					src.BaseMod/=2

					if(src.PathType=="Safety")
						src.EnduranceMultiplier/=1.5
						src.ResistanceMultiplier/=1.5
						src.StrengthMultiplier/=1.2
						src.ForceMultiplier/=1.2
						src.PriceOfSafety=0
						src.RPPower-=src.SafeRPPower
						src.SafeRPPower=0
						for(var/obj/Skills/Buffs/PriceOfSafety/e in src)
							del e
						for(var/obj/Skills/Buffs/DiplomaticImmunity/e in src)
							if(src.DiplomaticImmunity==1)
								src.DiplomaticImmunity=0
							del e
						for(var/obj/Skills/Buffs/EarthenWall/e in src)
							if(e.BuffUsing)
								e.EarthenWall("EarthenWall",e)
							del e
					if(src.PathType=="Luck")
						src.Energy=1
						src.Health=1
						src.AngerMax=1.5
						src.Anger=0
						for(var/obj/Skills/Buffs/BoostingWinds/e in src)
							if(e.BuffUsing)
								e.BoostingWinds("BoostingWinds",e)
							del e
					if(src.PathType=="Sacrifice")
						src.StrengthMultiplier/=1.75
						src.DefenseMultiplier/=0.5
						for(var/obj/Skills/Buffs/ShareThePain/e in src)
							del e
						for(var/obj/Skills/Buffs/BlazingWrath/e in src)
							if(e.BuffUsing)
								e.BlazingWrath("BlazingWrath",e)
							del e
					if(src.PathType=="Rejuvenation")
						src.RegenerationMultiplier/=1.5
						src.RecoveryMultiplier/=1.5
						for(var/obj/Skills/Buffs/MarkOfEnergy/e in src)
							if(e.BuffUsing)
								e.MarkOfEnergy("MarkOfEnergy", e)
							del e
						for(var/obj/Skills/Buffs/MistVeil/e in src)
							if(e.BuffUsing)
								e.MistVeil("MistVeil",e)
							del e
						for(var/obj/Skills/Buffs/Hammertime/e in src)
							del e
					if(src.PathType=="Death")
						src.BaseMod/=5
						src.Base/=5
						src.Anger=0
					//src.ActiveBuffs-=3
					//if(src.ActiveBuffs<=-1)
					//	src.ActiveBuffs=0
					src.overlays-=Z.sicon
					src.OMessage(10,"[src] deactivated their path.","<font color=red>[src]([src.key]) deactivated PathFind.")
					Z.BuffUsing=0
				sleep(10)
			if("UJW")
				if(src.KO) return
				if(!Z.Using)
					if(src.Alert("You sure you want to use this?"))
						var/list/people=list("Cancel")
						for(var/mob/M in oview(12,src))
							people.Add(M)
						var/mob/Choice=input("Challenge who?")in people
						if(Choice=="Cancel")return
						if(src.Health<=5||Choice.KO) return
						Z.Using=1
						src.OMessage(0,"[src] challenges [Choice] to a duel!","<font color=red>[src]([src.key]) activated Unlimited Jumpy Works.")
						src.PrevX=src.x
						src.PrevY=src.y
						src.PrevZ=src.z
						Choice.PrevX=Choice.x
						Choice.PrevY=Choice.y
						Choice.PrevZ=Choice.z
						src.Target = Choice
						Choice.Target = src
						src.loc=locate(277,280,13)
						if(Choice!=src)
							Choice.loc=locate(277,275,13)
						src.UnlimitedJumpyWorks(Z,Choice)
				else
					src.OMessage(0,"[src] deactivated Unlimited Jumpy Works.","<font color=red>[src]([src.key]) deactivated Unlimited Jumpy Works.")
					src.Energy=1
					src.x=src.PrevX
					src.y=src.PrevY
					src.z=src.PrevZ
					src.Target.x = src.Target.PrevX
					src.Target.y = src.Target.PrevY
					src.Target.z = src.Target.PrevZ
					Z.Using=0
				sleep(10)
			if("EveningElephant")
				if(src.KO||Z.Using||src.Blocking)return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						return
				src.EveningElephant=1
				Z.Using=1
				usr<< "Attack now...!"
				//spawn(100) src.GetDunked=0
				spawn(3000)
					if(src)
						Z.Using=0
						src<<"You can now proceed to dunk once again."
			if("SunlightYellowOverdrive")
				if(src.KO||Z.Using||src.Blocking)return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						return
				src.SunlightYellowOverdrive=10
				Z.Using=1
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: My heart resonates... heat enough to burn!"
				sleep(10)
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: My blood's beat is razor sharp!"
				sleep(10)
				src.SunlightYellowOverdrive=30
				sleep(20)
				if(!src.Frozen)
					src.SunlightYellowOverdrive=0
					src<<"Your ripple has been somewhat extinguished...!"
				//spawn(100) src.GetDunked=0
				src.TotalFatigue+=30
			if("NightGuy")
				if(src.KO||Blocking)return
				if(src.GigaDrillBreaking) return
				var/Distance=15
				var/Distance2
				var/icon/W=icon('Effects.dmi',"Shock")
			//	var/O='Silver Sword SlashTornado Beam.dmi'
				if(src.Energy>EnergyMax/8)
					src.GDBDamage=500
					src.Frozen=1
					src.GigaDrillBreaking=1
					if(src.dir==NORTH)
						src.dir=EAST
					if(src.dir==SOUTH)
						src.dir=WEST
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: Seki..."
					LightningFlash(src)
					spawn()Shockwave(W,1)
					src.overlays+=image('DragonAura.dmi', pixel_x=-32)
					src.OMessage(10,"[src] is surrounded by an aura of a roaring dragon!!!","<font color=red>[src]([src.key]) used Night Guy.")
					for(var/turf/T in Turf_Circle(src,8))
				//		spawn(rand(4,8)) Destroy(T)
						for(var/mob/M in view(0,T))
							if(M!=src)
								M.Frozen=1
								M.TimeFrozen=1
								sleep(10)
					sleep(20)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: <b>RYU!</b>"
					src.overlays-=image('DragonAura.dmi', pixel_x=-32)
					while(src.GigaDrillBreaking&&Distance)
				//		src.Frozen=1
						step(src,src.dir)//,50)
				//		flick("KB",src)
						for(var/mob/P in view(src,1))
							if(P!=src)
								if(!P.GigaDrillBreaking)
									//P.Knockback(1,src)
									P.NightGuyTarget=1
								else if(P.GigaDrillBreaking)
									src.GigaDrillClash=1
									P.GigaDrillClash=1
								Distance=0

								if(Distance==1)
									if(src.dir==WEST)
										P.x=(src.x-1)
									else if(src.dir==EAST)
										P.x=(src.x+1)
						for(var/turf/T in Turf_Circle(src,2))
							Destroy(T,500)
						if(Distance>0)
							Distance-=1
						sleep(2)
					if(Distance==0 && src.GigaDrillClash)
						while(src.GigaDrillClash==1)
							for(var/mob/P in view(src,2))
								if(P.GigaDrillClash)
									P.Health-=src.ForVsEnd(P, 5)
									sleep(10)
									if(prob(25))
										spawn()Shockwave(W,1)
									if(prob(25))
										Quake(10)
									if(P.Health<=10)
										src.GigaDrillClash=0
										P.GigaDrillClash=0
										P.Health=1
					if(Distance==0 && !src.GigaDrillClash)
						spawn()Shockwave(W,1)
						Quake(10)
						Distance2=90
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)
								E<<"<font color=[C.Text_Color]>[src] says: <b>NIGHT GUY!!!!!!</b>"
						src.overlays+=image('Fire Tornado Beam.dmi', "end",pixel_x=-32, pixel_y=-16)
						if(src.dir==WEST)
							src.overlays+=image('Fire Tornado Beam.dmi', "tail",pixel_x=64, pixel_y=-16)
							src.overlays+=image('Fire Tornado Beam.dmi', "head",pixel_x=128, pixel_y=-16)
						if(src.dir==EAST)
							src.overlays+=image('Fire Tornado Beam.dmi', "tail",pixel_x=-128, pixel_y=-16)
							src.overlays+=image('Fire Tornado Beam.dmi', "head",pixel_x=-192, pixel_y=-16)
						for(var/mob/M in world)
							if(M.NightGuyTarget)
								M.Knockback(100,src)
								M.Tengenkotsued=1
					while(Distance2)
						step(src,src.dir)
						for(var/mob/P in view(src,2))
							if(P!=src)
								P.Health-=src.ForVsEnd(P, 50)
						Distance2-=1
						sleep(1)
					if(Distance2==0)
						for(var/mob/M in world)
							if(M.TimeFrozen)
								M.Frozen=0
								M.TimeFrozen=0
						src.overlays-=image('Fire Tornado Beam.dmi', "end",pixel_x=-32, pixel_y=-16)
						if(src.dir==WEST)
							src.overlays-=image('Fire Tornado Beam.dmi', "tail",pixel_x=64, pixel_y=-16)
							src.overlays-=image('Fire Tornado Beam.dmi', "head",pixel_x=128, pixel_y=-16)
						if(src.dir==EAST)
							src.overlays-=image('Fire Tornado Beam.dmi', "tail",pixel_x=-128, pixel_y=-16)
							src.overlays-=image('Fire Tornado Beam.dmi', "head",pixel_x=-192, pixel_y=-16)
						src.Frozen=0
						src.GigaDrillBreaking=0
						src.Energy=1
						src.Health=1
			if("GigaDrillBreaker")
				if(src.KO||Blocking)return
				if(src.GigaDrillBreaking) return
				var/Distance=15
				var/icon/W=icon('Effects.dmi',"Shock")
			//	var/O='Silver Sword SlashTornado Beam.dmi'
				if(src.Energy>EnergyMax/8)
					src.GDBDamage=500
					src.Frozen=1
					src.GigaDrillBreaking=1
					if(src.dir==NORTH)
						src.dir=EAST
					if(src.dir==SOUTH)
						src.dir=WEST
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: FINISHING MOVE!"
					LightningFlash(src)
					spawn()Shockwave(W,1)
					src.overlays+=image('SpiralAura.dmi', pixel_x=-32)
					for(var/turf/T in Turf_Circle(src,8))
				//		spawn(rand(4,8)) Destroy(T)
						for(var/mob/M in view(0,T))
							if(M!=src)
								M.Frozen=1
								M.TimeFrozen=1
								sleep(10)
					sleep(20)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: GIGA..."
					sleep(20)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: <b>DRILL...!</b>"
					sleep(20)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: <i><b>BREEEEEEEEEEEEEAAAAAAAAAAAAAAAAAAAAKAAAAAAAAAAAAAAAAAA!</b></i>"
					src.overlays-=image('SpiralAura.dmi', pixel_x=-32)
					src.overlays+=image('Silver Sword SlashTornado Beam.dmi', "end",pixel_x=-32, pixel_y=-16)
					if(src.dir==WEST)
						src.overlays+=image('Silver Sword SlashTornado Beam.dmi', "tail",pixel_x=64, pixel_y=-16)
						src.overlays+=image('Silver Sword SlashTornado Beam.dmi', "head",pixel_x=128, pixel_y=-16)
					if(src.dir==EAST)
						src.overlays+=image('Silver Sword SlashTornado Beam.dmi', "tail",pixel_x=-128, pixel_y=-16)
						src.overlays+=image('Silver Sword SlashTornado Beam.dmi', "head",pixel_x=-192, pixel_y=-16)
					while(src.GigaDrillBreaking&&Distance)
				//		src.Frozen=1
						step(src,src.dir)//,50)
				//		flick("KB",src)
						for(var/mob/P in view(src,2))
							if(P!=src)
								if(!P.GigaDrillBreaking)
									P.Knockback(1,src)
									P.GigaDrillBroken=1
								else if(P.GigaDrillBreaking)
									src.GigaDrillClash=1
									P.GigaDrillClash=1

								if(Distance==1)
									if(src.dir==WEST)
										P.x=(src.x-1)
									else if(src.dir==EAST)
										P.x=(src.x+1)
						for(var/turf/T in Turf_Circle(src,2))
							Destroy(T,500)
						Distance-=1
						sleep(2)
					if(Distance==0 && src.GigaDrillClash)
						while(src.GigaDrillClash==1)
							for(var/mob/P in view(src,2))
								if(P.GigaDrillClash)
									P.Health-=src.StrVsRes(P, 5)
									sleep(10)
									if(prob(25))
										spawn()Shockwave(W,1)
									if(prob(25))
										Quake(10)
									if(P.Health<=10)
										src.GigaDrillClash=0
										P.GigaDrillClash=0
										P.Health=1
					if(Distance==0 && !src.GigaDrillClash)
						spawn()Shockwave(W,1)
						sleep(20)
						spawn()Shockwave(W,1)
						sleep(15)
						spawn()Shockwave(W,1)
						sleep(10)
						spawn()Shockwave(W,1)
						LightningFlash(src)
						sleep(5)
						spawn()Shockwave(W,1)
						LightningFlash(src)
						sleep(5)
						spawn()Shockwave(W,1)
						LightningFlash(src)
						sleep(5)
						for(var/turf/A in oview(src,5))
							new/obj/Effects/Explosion(A)
						LightningFlash(src)
						Quake(10)
						if(src.dir==WEST)
							src.x-=5
						if(src.dir==EAST)
							src.x+=5
						src.GigaDrillBreaking=0
						src.Frozen=0
						var/obj/x=new/obj/Taiyoken
						for(var/mob/M in world)
							if(M.TimeFrozen)
								M.Frozen=0
								M.TimeFrozen=0
						for(var/mob/P in view(src,6)) if (P.GigaDrillBroken && P!=src)
							for(var/turf/T in Turf_Circle(P,8))
								if(prob(1)) sleep(0.005)
								x.layer=MOB_LAYER+1
								x.icon_state=pick("1","2","3","4","5","6","7")
								T.overlays+=x
								spawn(rand(1,2))T.overlays+=x
								spawn(rand(2,3))T.overlays+=x
								spawn(rand(3,4))T.overlays+=x
								spawn(rand(1,2))T.overlays-=x
								spawn(rand(2,3))T.overlays-=x
								spawn(rand(3,4))T.overlays-=x
								spawn(rand(1,2))T.overlays-=x
								spawn(rand(3,4))T.overlays-=x
								//spawn(rand(4,8)) new/turf/Dirt(locate(T.x,T.y,T.z))
								spawn(rand(4,8)) Destroy(T,500)
						//		if(prob(10))sleep(0.1)
								for(var/mob/M in view(0,T))
									if(M!=src)
										P.GigaDrillBroken=0
										M.Health-=src.StrVsRes(P, 500)
						src.overlays-=image('Silver Sword SlashTornado Beam.dmi', "end",pixel_x=-32, pixel_y=-16)
						if(src.dir==WEST)
							src.overlays-=image('Silver Sword SlashTornado Beam.dmi', "tail",pixel_x=64, pixel_y=-16)
							src.overlays-=image('Silver Sword SlashTornado Beam.dmi', "head",pixel_x=128, pixel_y=-16)
						if(src.dir==EAST)
							src.overlays-=image('Silver Sword SlashTornado Beam.dmi', "tail",pixel_x=-128, pixel_y=-16)
							src.overlays-=image('Silver Sword SlashTornado Beam.dmi', "head",pixel_x=-192, pixel_y=-16)
						src.Energy=0
						if(src.Health<=3)
							src.Health=-500
			if("DualWield")
				if(!Z.BuffUsing)
					var/SwordCheck=0
					for(var/obj/Items/Sword/S in usr)
						if(S.suffix)
							SwordCheck=1
							if(S.Delay_Multiplier<1||S.Damage_Multiplier>2.5)
								src<<"This sword is too heavy to dual-wield!"
								return
							//if(src.ActiveBuffs>=1) return
							//src.ActiveBuffs+=3
							if(src.Energy<src.EnergyMax/10)return
							//src.Power_Multiplier+=0.5
							src.DualWield=1
							src.OMessage(10,"[src] wields a second blade!","<font color=red>[src]([src.key]) activated Dual-Wield.")
							for(var/mob/m in view(12))
								if(m.UBWLevel>=2&&!m.ProjectDualWield)
									m.ProjectDualWield=1
									m << "You learn to project two swords!"
							Z.BuffUsing=1
//						else if(!S.suffix && !Z.BuffUsing)
//							src<<"You can't use this without a sword equiped!"
					if(!SwordCheck)
						src<<"You can't use this without a sword equiped!"
						return
				else
					if(src.TripleWield)
						src << "Stop triple wielding first."
						return
					//src.Power_Multiplier-=0.5
					src.DualWield=0
					src.OMessage(10,"[src] puts the second blade away!","<font color=red>[src]([src.key]) deactivated Dual-Wield.")
					//src.ActiveBuffs-=3
					//if(src.ActiveBuffs<=-1)
					//	src.ActiveBuffs=0
					Z.BuffUsing=0
				sleep(10)
			if("TripleWield")
				if(!Z.BuffUsing)
					var/SwordCheck=0
					for(var/obj/Items/Sword/S in usr)
						if(S.suffix)
							SwordCheck=1
							if(S.Delay_Multiplier<1||S.Damage_Multiplier>2.5)
								src<<"This sword is too heavy to triple-wield!"
								return
							if(!src.DualWield)return
							if(src.Energy<src.EnergyMax/10)return
							//src.Power_Multiplier+=0.5
							src.TripleWield=1
							src.OMessage(10,"[src] wields a third blade!!!","<font color=red>[src]([src.key]) activated Triple Wield.")
							for(var/mob/m in view(12))
								if(m.PerfectProjection&&!m.ProjectTriWield)
									m.ProjectTriWield=1
									m << "You learn to project three swords!"
							Z.BuffUsing=1
//						else if(!S.suffix && !Z.BuffUsing)
//							src<<"You can't use this without a sword equiped!"
					if(!SwordCheck)
						src<<"You can't use this without a sword equiped!"
						return
				else
					//src.Power_Multiplier-=0.5
					src.TripleWield=0
					src.OMessage(10,"[src] puts the third blade away!","<font color=red>[src]([src.key]) deactivated Triple Wield.")
					Z.BuffUsing=0
				sleep(10)

			if("Sharingan")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs)
						src << "You're already using a slotted buff."
						return

					if(src.Energy<src.EnergyMax/10)return
					if(Z:SpamLockout==1)
						usr<<"Stop spamming Sharingan!"
						return
					Z:SpamLockout=1
					var/list/ChosenSharinganLevel=list("Sharingan")
					if(src.SharinganUnlocked>=1)
						ChosenSharinganLevel.Add("Sharingan 2 Tomoe")
					if(src.SharinganUnlocked>=2)
						ChosenSharinganLevel.Add("Sharingan 3 Tomoe")
					if(src.SharinganUnlocked>=3)
						ChosenSharinganLevel.Add("Mangekyo Sharingan")
					ChosenSharinganLevel.Add("Cancel")
					Z:SharinganLevelSelected=input("Pick a Sharingan Level!") in ChosenSharinganLevel
					if(Z:SharinganLevelSelected=="Cancel")
						Z:SpamLockout=0
						return
					if(Z:SharinganLevelSelected=="Sharingan")
						src.ActiveBuffs=3
						src.Power_Multiplier+=0.5
						src.SpeedMultiplier*=1.2
						src.OffenseMultiplier*=1.4
						src.DefenseMultiplier*=1.4
						src.Anger=src.AngerMax
						src.SharinganLevel=1
						src.OMessage(30,"[src]'s eyes become red, assuming a single tomoe! The meme has begun!","<font color=red>[src]([src.key]) activated Sharingan.")
					else if(Z:SharinganLevelSelected=="Sharingan 2 Tomoe")
						src.ActiveBuffs=3
						src.Power_Multiplier+=0.5
						src.SpeedMultiplier*=1.2
						src.OffenseMultiplier*=1.6
						src.DefenseMultiplier*=1.6
						src.Anger=src.AngerMax
						src.SharinganLevel=2
						src.OMessage(30,"[src]'s eyes become red, assuming two tomoe! It's getting stronk!","<font color=red>[src]([src.key]) activated Sharingan.")
					else if(Z:SharinganLevelSelected=="Sharingan 3 Tomoe")
						src.ActiveBuffs=3
						src.Power_Multiplier+=0.5
						src.SpeedMultiplier*=1.2
						src.OffenseMultiplier*=1.75
						src.DefenseMultiplier*=1.75
						src.Anger=src.AngerMax+0.5
						src.SharinganLevel=3
						src.OMessage(30,"[src]'s eyes become red, assuming three tomoe! How many forms does this damn Sharringan have?!","<font color=red>[src]([src.key]) activated Sharingan.")
					else if(Z:SharinganLevelSelected=="Mangekyo Sharingan")
						src.ActiveBuffs=3
						src.Power_Multiplier+=1
						src.SpeedMultiplier*=1.3
						src.OffenseMultiplier*=1.9
						src.DefenseMultiplier*=1.9
						src.Anger=src.AngerMax+0.75
						src.SharinganLevel=4
						src.OMessage(30,"[src]'s eyes assume a kaleidoscope pattern! The meme evolved.","<font color=red>[src]([src.key]) activated Sharingan.")
					Z.BuffUsing=1
					src.SharinganActive=1
					src.overlays-=Z.sicon
					src.overlays-=Z.sicon
					src.overlays+=Z.sicon
					Z:SpamLockout=0
				else
					src.SharinganActive=0
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					if(Z:SharinganLevelSelected=="Sharingan")
						src.Power_Multiplier-=0.5
						src.SpeedMultiplier/=1.2
						src.OffenseMultiplier/=1.4
						src.DefenseMultiplier/=1.4
						src.Anger=0
						src.SharinganLevel=0
						src.OMessage(30,"[src]'s eyes return to normal... The meme ended.","<font color=red>[src]([src.key]) deactivated Sharingan.")

					else if(Z:SharinganLevelSelected=="Sharingan 2 Tomoe")
						src.Power_Multiplier-=0.5
						src.SpeedMultiplier/=1.2
						src.OffenseMultiplier/=1.6
						src.DefenseMultiplier/=1.6
						src.Anger=0
						src.SharinganLevel=0
						src.OMessage(30,"[src]'s eyes return to normal.... Thank god.","<font color=red>[src]([src.key]) deactivated Sharingan(T1).")
					else if(Z:SharinganLevelSelected=="Sharingan 3 Tomoe")
						src.Power_Multiplier-=0.5
						src.SpeedMultiplier/=1.2
						src.OffenseMultiplier/=1.75
						src.DefenseMultiplier/=1.75
						src.Anger=0
						src.SharinganLevel=0
						src.OMessage(30,"[src]'s eyes return to normal... Where's Naruto when you need him?","<font color=red>[src]([src.key]) deactivated Sharingan(T2).")
					else if(Z:SharinganLevelSelected=="Mangekyo Sharingan")
						src.Power_Multiplier-=1
						src.SpeedMultiplier/=1.3
						src.OffenseMultiplier/=1.9
						src.DefenseMultiplier/=1.9
						src.Anger=0
						src.SharinganLevel=0
						src.OMessage(30,"[src]'s eyes return to normal... Thier powerlevel was over 9000.","<font color=red>[src]([src.key]) deactivated Mangekyo Sharingan.")
					Z.BuffUsing=0
					src.overlays-=Z.sicon
				sleep(10)
			if("Byakugan")
				if(!Z.BuffUsing)
					if(src.Energy<src.EnergyMax/10)return
					Z:ByakuganSelected=input("Select the type of Byakugan.") in list("Byakugan")
					if(src.ActiveBuffs>=1) return
					src.ActiveBuffs+=3
					if(Z:ByakuganSelected=="Byakugan")
						Z.BuffUsing=1
						src.Byakugan=1
						src.Power_Multiplier+=0.6
						src.SpeedMod*=1.25
						src.Recovery*=1.25
						client.view="32x32"
						src.OMessage(30,"[src] uses Byakugan!")
				else
					src.OMessage(30,"[src] has stopped using Byakugan...")
					src.Byakugan=0
					src.Power_Multiplier-=0.6
					src.SpeedMod/=1.25
					src.Recovery/=1.25
					Z.BuffUsing=0
					src.ActiveBuffs-=3
			if("CreatorWings")
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					if(src.SpecialSlot)
						src <<"I'm going to pretend this is meant to be balanced and deny your usage because you already have something in your special slot.  Please don't kill me Zark."
						return
					src.SpecialSlot=1
					src.RecoveryMultiplier*=2
					src.SpeedMultiplier*=1.5
					src.BaseMod*=5
					src.Base*=5
					//src.Zenkai_Rate = 50
					src.SpiralResistance=1
					src.overlays-=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.overlays+=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.overlays+='Angel Mode Wings.dmi'
					src.OMessage(30,"[src] sprouted two angelic wings and exploded with a tremendous amount of energy!","<font color=red>[src]([src.key]) activated the Wings of the Creator.")
				else
					src.overlays-=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.SpecialSlot=0
					Z.BuffUsing=0
					src.SpeedMultiplier/=1.5
					src.RecoveryMultiplier/=2
					src.BaseMod/=5
					src.Base/=5
					src.overlays-='Angel Mode Wings.dmi'
					src.OMessage(30,"[src] caused the wings to disappear!","<font color=red>[src]([src.key]) deactivated the Wings of the Creator.")
					src.overlays-=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
				sleep(20)
			if("DestroyerWings")
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					if(src.SpecialSlot)
						src << "I'm going to pretend that these are meant to be balanced and deny you usage because your special slot is already filled.  Please don't kill me Zark."
						return
					src.SpecialSlot=1
					src.StrengthMultiplier*=1.75
					src.ForceMultiplier*=1.75
					src.BaseMod*=5
					src.Base*=5
					//src.Zenkai_Rate = 50
					src.SpiralResistance=1
					src.overlays-=image(icon='Auras.dmi',icon_state="Majin",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.overlays+=image(icon='Auras.dmi',icon_state="Majin",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.overlays+='Sephiroth Wing.dmi'
					src.OMessage(30,"[src] sprouted one demonic wing and exploded with a tremendous amount of energy!","<font color=red>[src]([src.key]) activated the Wing of the Destroyer.")
				else
					src.overlays-=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					Z.BuffUsing=0
					src.StrengthMultiplier/=1.75
					src.ForceMultiplier/=1.75
					src.BaseMod/=5
					src.Base/=5
					src.overlays-='Sephiroth Wing.dmi'
					src.OMessage(30,"[src] caused the wings to disappear!","<font color=red>[src]([src.key]) deactivated the Wing of the Destroyer.")
					src.overlays-=image(icon='Auras.dmi',icon_state="Majin",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
				sleep(20)
			if("BuffGetsu")
				if(!Z.BuffUsing && world.realtime > Z:LockedUntil)
					if(src.ActiveBuffs>=1) return
					if(src.SpecialSlot)
						src << "You have to have your buff slots and your special slot to use Mugetsu.  It's ridiculously strong."
						return
					src.ActiveBuffs+=3
					src.SpecialSlot=1
					if(!locate(/obj/Skills/Swords/Mugetsu, src))
						src.contents+=new/obj/Skills/Swords/Mugetsu
						src << "You comprehend the ultimate sword slash."
					Z:Uses++
					Z.BuffUsing=1
					src.StrengthMultiplier*=2.5
					src.SpeedMultiplier*=1.75
					src.Power_Multiplier+=5
					src.InMugetsu=1
					src.overlays+=image('Aurasbig.dmi',"SSJ4",pixel_x=-32)
					src.overlays+='blackflameaura.dmi'
					src.OMessage(30,"[src] surrounded themselves in a dark aura and exploded with a tremendous amount of energy, as their power slowly began to whittle away...!","<font color=red>[src]([src.key]) activated Mugetsu.")
				else
													//minutes//hours//times used
					Z:LockedUntil = world.realtime+((600*60)*24)*Z:Uses
					for(var/obj/Skills/Swords/Mugetsu/m in src)
						src << "You fail to comprehend the ultimate sword slash any longer."
						del m
					src.overlays-=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					Z.BuffUsing=0
					src.StrengthMultiplier/=2.5
					src.SpeedMultiplier/=1.75
					src.Power_Multiplier-=5
					src.InMugetsu=0
					src.ActiveBuffs-=3
					src.SpecialSlot=0
					src.overlays-=image('Aurasbig.dmi',"SSJ4",pixel_x=-32)
					src.overlays-='blackflameaura.dmi'
					src.OMessage(30,"[src] released their tremendous power.","<font color=red>[src]([src.key]) deactivated Mugetsu.")
				if(world.realtime < Z:LockedUntil)
					src << "Your soul is still recovering from the last time you used Mugetsu..."
				sleep(20)

			if("ClockworkWings")
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					if(src.SpecialSlot)
						src << "no amatsu"
						return
					src.SpecialSlot=1
					src.RecoveryMultiplier*=1.25
					src.SpeedMultiplier*=1.75
					src.StrengthMultiplier*=1.1
					src.ForceMultiplier*=1.1
					src.EnduranceMultiplier*=1.1
					src.ResistanceMultiplier*=1.1
					src.BaseMod*=3
					src.Base*=3
					//src.Zenkai_Rate = 30
					src.SpiralResistance=1
					src.overlays-=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.overlays+=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.overlays+='Angel Mode Wings.dmi'
					src.OMessage(30,"[src] sprouted two wings made of clockwork and exploded with a tremendous amount of energy!","<font color=red>[src]([src.key]) activated the Wings of the Creator.")
				else
					src.overlays-=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					Z.BuffUsing=0
					src.SpecialSlot=0
					src.SpeedMultiplier/=1.5
					src.RecoveryMultiplier/=2
					src.BaseMod/=5
					src.Base/=5
					src.overlays-='Angel Mode Wings.dmi'
					src.OMessage(30,"[src] caused the wings to disappear!","<font color=red>[src]([src.key]) deactivated the Wings of the Creator.")
					src.overlays-=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
				sleep(20)
			if("Block:Counter")
				if(src.KO||Z.Using||!src.Blocking)return
				src<<"You'll attempt to counter the next attack within 3 seconds."
				src.CounterBlock=1
				spawn(3)src.CounterBlock=0
				Z.Cooldown()
			if("Block:Parry")
				if(src.KO||Z.Using||!src.Blocking)return
				src<<"You'll attempt to parry the next attack within 3 seconds."
				src.CounterParry=1
				spawn(3)src.CounterParry=0
				Z.Cooldown()
			if("SonicSway")
				if(src.KO||Z.Using||!src.Blocking)return
				//src.OMessage(10,"[src] lowers thier defenses slightly...","<font color=red>[src]([src.key]) preps a Sonic Sway.")
				src<<"You'll Sonic Sway the next attack within the 3 seconds."
				src.SonicSway=1
				spawn(3)src.SonicSway=0
				Z.Cooldown()
			if("EZSonicSway")
				if(src.KO||Z.Using||!src.Blocking)return
				//src.OMessage(10,"[src] lowers thier defenses slightly...","<font color=red>[src]([src.key]) preps a Sonic Sway.")
				src<<"You'll Sonic Sway the next attack."
				src.SonicSway=1
				Z.Cooldown()
			if("Omnislash")
				if(src.KO||Z.Using||src.Blocking)return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						Z.Using=1
						sleep(10)
						src.Omnislash=15
						src.OMessage(30,"[src] surges with the fury of a powerful blade!","<font color=red>[src]([src.key]) used Omnislash.")
						sleep(70)
						if(!src.Frozen)
							src.Omnislash=0
							src<<"Your fury has run out!"
						Z.Cooldown()
					else
						return
		    /*if("TrueEightGates")
				if(src.EightGates)
					src<<"You stop using the Eight Gates."
					if(src.GateNumber)
						if(src.GateNumber>=1)
							src.StrengthMultiplier/=1.2
							src.ForceMultiplier/=1.2
							src.Power_Multiplier-=0.5
						if(src.GateNumber>=2)
							src.Power_Multiplier-=0.1
						if(src.GateNumber>=3)
							src.Power_Multiplier-=0.1
							src.SpeedMultiplier/=1.2
						if(src.GateNumber>=4)
							src.Power_Multiplier-=0.2
							src.EnduranceMultiplier/=1.3
							src.ResistanceMultiplier/=1.3
						if(src.GateNumber>=5)
							src.Power_Multiplier-=0.3
							src.StrengthMultiplier/=1.5
							src.ForceMultiplier/=1.5
						if(src.GateNumber>=6)
							src.SpecialSlot=0
							src.Power_Multiplier-=0.5
							src.SpeedMultiplier/=1.25
						if(src.GateNumber>=7)
							Z:LockedUntil = world.realtime+(((600*60)*24)*Z:Uses)
							src.Power_Multiplier-=1.5
							src.SpeedMultiplier/=1.25
							src.Base-=src.GatesBaseLost
							src.GatesBaseLost=0
						if(src.GateNumber==8)
							src.RPPower/=50
							src.Energy=100
					src.EightGates=0
					if(src.GateNumber>=8)
						src.Death(null, "strain from the final gate!")
					src.Energy/=src.GateNumber
					src.Energy=min(src.Energy,src.EnergyMax)
					src.GateNumber=0
					src.ActiveBuffs-=3
				else if(!src.EightGates&&!src.KO)
					var/amount=input(src,"Which gate do you want to unlock?") as num
					if(amount<1) amount=1
					amount=round(amount)
					if(amount>=8)
						amount=8
					if(amount==7 && world.realtime < Z:LockedUntil)
						src << "Your body is too worn out from the last time you used the Seventh Gate to use it again yet."
						return
					if(amount>=6 && src.SpecialSlot)
						src << "You can't stack Gates and a special slot buff."
						return
					if(!usr.EightGates)
						view(src)<<"[src]'s power spikes upwards at a rapid rate, multiplying their energy many times over!"
						if(src.ActiveBuffs>=1) return
						src.ActiveBuffs+=3
						src.EightGates=1
						src.GateNumber=amount
						if(src.GateNumber>=src.GatesUnlocked)
							src.GateNumber=src.GatesUnlocked
						if(src.GateNumber>=1)
							src.StrengthMultiplier*=1.2
							src.ForceMultiplier*=1.2
							src.Power_Multiplier+=0.5
							src.Energy+=src.EnergyMax/4
						if(src.GateNumber>=2)
							src.Energy+=src.EnergyMax/4
							src.Power_Multiplier+=0.1
						if(src.GateNumber>=3)
							src.Energy+=src.EnergyMax/4
							src.Power_Multiplier+=0.1
							src.SpeedMultiplier*=1.2
						if(src.GateNumber>=4)
							src.Energy+=src.EnergyMax/4
							src.Power_Multiplier+=0.2
							src.EnduranceMultiplier*=1.3
							src.ResistanceMultiplier*=1.3
						if(src.GateNumber>=5)
							src.Energy+=src.EnergyMax/4
							src.Power_Multiplier+=0.3
							src.StrengthMultiplier*=1.5
							src.ForceMultiplier*=1.5
						if(src.GateNumber>=6)
							src.SpecialSlot=1
							src.Energy+=src.EnergyMax/4
							src.Power_Multiplier+=0.5
							src.SpeedMultiplier*=1.25
						if(src.GateNumber>=7)
							if(src.GateNumber==7)
								Z:Uses++
							src.Health=100
							src.Power_Multiplier+=1.5
							src.Energy+=src.EnergyMax/4
							src.SpeedMultiplier*=1.25
						if(src.GateNumber==8)
							src.Health=100
							src.Energy=src.EnergyMax*20
							src.RPPower*=50
							if(!locate(/obj/Skills/MartialArts/EveningElephant,src.contents))
								src.contents += new/obj/Skills/MartialArts/EveningElephant
						src.OMessage(15,null,"<font color=red>[src]([src.key]) uses the Eight Gates.")*/


			if("TrueEightGates")
				if(!usr.EightGates)
					src<<"You stop using the Eight Gates."
					if(src.GateNumber)
						if(src.GateNumber==1)
							src.StrengthMultiplier/=1.75
							src.SpeedMultiplier/=1.5
							src.Power_Multiplier-=0.75
							src.OMessage(15,null,"<font color=red>[src]([src.key]) closes The Gate of Opening.")
						if(src.GateNumber==2)
							src.StrengthMultiplier/=1.75
							src.SpeedMultiplier/=1.5
							src.RecoveryMultiplier/=1.5
							src.Power_Multiplier-=0.75
							src.OMessage(15,null,"<font color=red>[src]([src.key]) closes The Gate of Healing.")
						if(src.GateNumber==3)
							src.StrengthMultiplier/=1.75
							src.SpeedMultiplier/=1.5
							src.RecoveryMultiplier/=1.75
							src.Power_Multiplier-=1.25
							src.OMessage(15,null,"<font color=red>[src]([src.key]) closes The Gate of Life.")
						if(src.GateNumber==4)
							src.StrengthMultiplier/=2.25
							src.SpeedMultiplier/=1.75
							src.RecoveryMultiplier/=1.75
							src.Power_Multiplier-=1.25
							src.OMessage(15,null,"<font color=red>[src]([src.key]) closes The Gate of Pain.")
						if(src.GateNumber==5)
							src.StrengthMultiplier/=2.5
							src.SpeedMultiplier/=2
							src.RecoveryMultiplier/=1.75
							src.Power_Multiplier-=1.5
							src.OMessage(15,null,"<font color=red>[src]([src.key]) closes The Gate of Limit.")
						if(src.GateNumber==6)
							src.StrengthMultiplier/=3
							src.SpeedMultiplier/=2.5
							src.RecoveryMultiplier/=2
							src.Power_Multiplier-=2
							src.OMessage(15,null,"<font color=red>[src]([src.key]) closes The Gate of View.")
						if(src.GateNumber==7)
							src.overlays -= image(icon='SpiralAura.dmi', icon_state="", pixel_x=-32);
							src.StrengthMultiplier/=3
							src.SpeedMultiplier/=3
							src.RecoveryMultiplier/=2
							src.Power_Multiplier-=3
							src.OMessage(15,null,"<font color=red>[src]([src.key]) closes The Gate of Wonder.")
						if(src.GateNumber==8)
							src.overlays -= image(icon='SpiralNemesisAura.dmi', icon_state="", pixel_x=-32);
							src.StrengthMultiplier/=19
							src.SpeedMultiplier/=3
							src.RecoveryMultiplier/=3
							src.OffenseMultiplier/=2
							src.DefenseMultiplier/=2
							src.Power_Multiplier-=4
							src.OMessage(15,null,"<font color=red>[src]([src.key]) closes The Gate of Death...")
					src.EightGates=0
					if(src.GateNumber>=8)
						src.Death(null, "strain from the final gate!")
					else
						view(src)<<"[src]'s power returns to normal, albeit simmered down..."
					src.Energy/=src.GateNumber
					src.Energy=min(src.Energy,src.EnergyMax)
					src.TotalInjury+=10*(src.GateNumber/2)
					src.GatesNerf+=src.GateNumber*500
					src.GatesNerfPerc=src.GateNumber+1
					src.GateNumber=0
					src.Warp=0
					src.ActiveBuffs-=3
					src.SpecialSlot=0
				else if(!src.EightGates&&!src.KO)
					for(var/obj/Items/Sword/S in src)
						if(S.suffix)
							src << "Makito wish you would, nigger... wish you would use Gates with a sword..."
							return
					var/amount=input(src,"Which gate do you want to unlock?") as num
					if(amount<1) amount=1
					amount=round(amount)
					if(amount>=8)
						amount=8
		/*			if(amount==0)
						src << "Nigger..."
						return*/
					if(src.SpecialSlot)
						src << "You can't stack Gates and a special slot buff."
						return
					if(src.ActiveBuffs>=1)
						src << "You need your buff slots to be able to open your inner gates..."
						return
					if(!usr.EightGates)
						view(src)<<"[src]'s power spikes upwards at a rapid rate, multiplying their energy many times over!"
						src.EightGates=1
						src.ActiveBuffs+=3
						src.SpecialSlot=1
						sleep(10)
						src.GatesNerfPerc=0
						src.GateNumber=amount
						if(src.GateNumber>=src.GatesUnlocked)
							src.GateNumber=src.GatesUnlocked
						if(src.GateNumber==1)
							src.StrengthMultiplier*=1.75
							src.SpeedMultiplier*=1.5
							src.Power_Multiplier+=0.75
							if(!locate(/obj/Skills/MartialArts/FrontLotus,src.contents))
								src.contents += new/obj/Skills/MartialArts/FrontLotus
							src.OMessage(15,null,"<font color=red>[src]([src.key]) opens The Gate of Opening.")
						if(src.GateNumber==2)
							src.StrengthMultiplier*=1.75
							src.SpeedMultiplier*=1.5
							src.RecoveryMultiplier*=1.5
							src.Power_Multiplier+=0.75
							src.TotalFatigue=0
							src.Energy=src.EnergyMax
							if(!locate(/obj/Skills/MartialArts/FrontLotus,src.contents))
								src.contents += new/obj/Skills/MartialArts/FrontLotus
							src.OMessage(15,null,"<font color=red>[src]([src.key]) opens The Gate of Healing.")
						if(src.GateNumber==3)
							src.TotalFatigue=0
							src.Energy=src.EnergyMax
							src.StrengthMultiplier*=1.75
							src.SpeedMultiplier*=1.5
							src.RecoveryMultiplier*=1.75
							src.Power_Multiplier+=1.25
							if(!locate(/obj/Skills/MartialArts/ReverseLotus,src.contents))
								src.contents += new/obj/Skills/MartialArts/ReverseLotus
							src.OMessage(15,null,"<font color=red>[src]([src.key]) opens The Gate of Life.")
						if(src.GateNumber==4)
							src.TotalFatigue=0
							src.Energy=src.EnergyMax
							src.StrengthMultiplier*=2.25
							src.SpeedMultiplier*=1.75
							src.RecoveryMultiplier*=1.75
							src.Power_Multiplier+=1.25
							if(!locate(/obj/Skills/MartialArts/ReverseLotus,src.contents))
								src.contents += new/obj/Skills/MartialArts/ReverseLotus
							src.OMessage(15,null,"<font color=red>[src]([src.key]) opens The Gate of Pain.")
						if(src.GateNumber==5)
							Quake(10)
							var/icon/E=icon('Effects.dmi',"Shock")
							spawn()for(var/turf/e in range(1,usr))
							spawn()usr.Shockwave(E,1)
							sleep(5)
							spawn()Crater(usr)
							src.Warp=3
							src.TotalFatigue=0
							src.Energy=src.EnergyMax
							src.StrengthMultiplier*=2.5
							src.SpeedMultiplier*=2
							src.RecoveryMultiplier*=1.75
							src.Power_Multiplier+=1.5
							src.OMessage(15,null,"<font color=red>[src]([src.key]) opens The Gate of Limit.")
							if(!locate(/obj/Skills/MartialArts/AsaKujaku,src.contents))
								src.contents += new/obj/Skills/MartialArts/AsaKujaku
						if(src.GateNumber==6)
							src.Frozen=1
							Quake(10)
							var/icon/E=icon('Effects.dmi',"Shock")
							spawn()for(var/turf/e in range(1,usr))
							spawn()usr.Shockwave(E,1)
							sleep(5)
							KenShockwave(src,icon='fevKiai.dmi',Size=4)
							KenShockwave(src,icon='fevKiai.dmi',Size=2)
							KenShockwave(src,icon='fevKiai.dmi',Size=0.5)
							Quake(10)
							sleep(10)
							spawn()Crater(usr)
							Quake(10)
							src.Warp=3
							src.TotalFatigue=0
							src.Energy=src.EnergyMax*2
							src.StrengthMultiplier*=3
							src.SpeedMultiplier*=2.5
							src.RecoveryMultiplier*=2
							src.Power_Multiplier+=2
							src.Frozen=0
							src.OMessage(15,null,"<font color=red>[src]([src.key]) opens The Gate of View.")
							if(!locate(/obj/Skills/MartialArts/AsaKujaku,src.contents))
								src.contents += new/obj/Skills/MartialArts/AsaKujaku
						if(src.GateNumber==7)
							src.Frozen=1
							Quake(10)
							var/icon/E=icon('Effects.dmi',"Shock")
							spawn()for(var/turf/e in range(1,usr))
							spawn()usr.Shockwave(E,2)
							sleep(5)
							KenShockwave(src,icon='fevKiai.dmi',Size=4)
							KenShockwave(src,icon='fevKiai.dmi',Size=2)
							KenShockwave(src,icon='fevKiai.dmi',Size=0.5)
							Quake(20)
							sleep(10)
							spawn()Crater(usr)
							Quake(20)
							src.Warp=3
							src.overlays += image(icon='SpiralAura.dmi', icon_state="", pixel_x=-32);
							src.TotalFatigue=0
							src.Energy=src.EnergyMax*4
							src.StrengthMultiplier*=3
							src.SpeedMultiplier*=3
							src.RecoveryMultiplier*=2
							src.Power_Multiplier+=3
							src.Frozen=0
							src.OMessage(15,null,"<font color=red>[src]([src.key]) opens The Gate of Wonder.")
							if(!locate(/obj/Skills/Attacks/Beams/DaytimeTiger,src.contents))
								src.contents += new/obj/Skills/Attacks/Beams/DaytimeTiger
						if(src.GateNumber==8)
							src.Frozen=1
							var/icon/E=icon('Effects.dmi',"Shock")
							spawn()for(var/turf/e in range(1,usr))
							spawn()usr.Shockwave(E,1)
							spawn()LightningFlash(src)
							spawn()usr.Shockwave(E,1)
							sleep(20)
							KenShockwave(src,icon='fevKiai.dmi',Size=4)
							KenShockwave(src,icon='fevKiai.dmi',Size=2)
							KenShockwave(src,icon='fevKiai.dmi',Size=0.5)
							Quake(20)
							sleep(20)
							spawn()usr.Shockwave(E,2)
							spawn()LightningFlash(src)
							sleep(10)
							KenShockwave(src,icon='fevKiai.dmi',Size=4)
							KenShockwave(src,icon='fevKiai.dmi',Size=2)
							KenShockwave(src,icon='fevKiai.dmi',Size=0.5)
							Quake(30)
							sleep(10)
							spawn()usr.Shockwave(E,3)
							Quake(50)
							spawn()Crater(usr)
							src.overlays += image(icon='SpiralNemesisAura.dmi', icon_state="", pixel_x=-32);
							src.GatesNerf=0
							src.GatesNerfPerc=0
							src.TotalInjury=0
							src.Health=100
							src.TotalFatigue=0
							src.Warp=3
							src.Energy=src.EnergyMax*30
							src.StrengthMultiplier*=5
							src.SpeedMultiplier*=3
							src.RecoveryMultiplier*=3
							src.OffenseMultiplier*=2
							src.DefenseMultiplier*=2
							src.Power_Multiplier+=19
							src.Frozen=0
							if(!locate(/obj/Skills/MartialArts/NightGuy,src.contents))
								src.contents += new/obj/Skills/MartialArts/NightGuy
							if(!locate(/obj/Skills/MartialArts/EveningElephant,src.contents))
								src.contents += new/obj/Skills/MartialArts/EveningElephant
							src.OMessage(15,null,"<font color=red>[src]([src.key]) opens The Gate of Death...")


			if("KingofBraves")
				if(!Z.BuffUsing)
					if(src.SpecialSlot)return
					var/list/KingofBraves=list("Defense","Offense")
					KingofBraves.Add("Cancel")
					var/obj/selection=input("")in KingofBraves
					if(selection=="Defense")
						src.BraveType="Defense"
					if(selection=="Offense")
						src.BraveType="Offense"
					if(selection=="Cancel") return
					src.Power_Multiplier+=0.25
					src.SpecialSlot=1
					if(src.BraveType=="Defense")
						src.EnduranceMultiplier*=1.25
						src.ResistanceMultiplier*=1.25
						src.DefenseMultiplier*=1.25
					if(src.BraveType=="Offense")
						src.StrengthMultiplier*=1.25
						src.ForceMultiplier*=1.25
						src.OffenseMultiplier*=1.25
					//if(src.Zenkai<50)
					//	src.Zenkai=50
					if(src.BraveLevel>=1 && !src.SpiralResistance2)
						src.SpiralResistance2=1
					if(src.BraveLevel>=3)
						src.Anger=src.AngerMax
					Z.BuffUsing=1
					if(src.BraveLevel<=1)
						src.OMessage(10,"[src] surrounded their body in a faint green aura!.","<font color=red>[src]([src.key]) activated King of Braves.")
						if(!locate(/obj/Skills/Attacks/BrokenMagnum,src.contents))
							src.contents += new/obj/Skills/Attacks/BrokenMagnum
						if(!locate(/obj/Skills/ProtectShade,src.contents))
							src.contents += new/obj/Skills/ProtectShade
						src.overlays +='SpiralMajin.dmi'
						if(!locate(/obj/Skills/Buffs/BraveHeart,src.contents))
							src.contents += new/obj/Skills/Buffs/BraveHeart
						if(src.BraveLevel==1)
							if(!locate(/obj/Skills/PlasmaHold,src.contents))
								src.contents += new/obj/Skills/PlasmaHold
							if(!locate(/obj/Skills/Attacks/BrokenPhantom,src.contents))
								src.contents += new/obj/Skills/Attacks/BrokenPhantom


					if(src.BraveLevel>=2&&src.BraveLevel<4)
						if(!locate(/obj/Skills/Attacks/DrillKnee,src.contents))
							src.contents += new/obj/Skills/Attacks/DrillKnee
						src.OMessage(10,"[src] draws power from their courage, as they begin pulsating with a green glow!","<font color=red>[src]([src.key]) activated King of Braves.")
						src.overlays+='Genesic.dmi'
						src.overlays +='SpiralMajin.dmi'
						src.overlays+=src.KingofBravesHair
						src.Power_Multiplier+=0.25
					if(src.BraveLevel>=4)
						src.Power_Multiplier+=0.25
						src.OMessage(10,"[src] roars with the ferocity of a lion, and becomes the embodiment of true courage!","<font color=red>[src]([src.key]) activated King of Braves.")
						src.overlays+='Genesic.dmi'
						src.overlays +='SpiralMajin.dmi'
						src.overlays+=src.KingofBravesHair
				else

					src.Power_Multiplier-=0.25
					if(src.BraveType=="Defense")
						src.EnduranceMultiplier/=1.25
						src.ResistanceMultiplier/=1.25
						src.DefenseMultiplier/=1.25
					if(src.BraveType=="Offense")
						src.StrengthMultiplier/=1.25
						src.ForceMultiplier/=1.25
						src.OffenseMultiplier/=1.25
					if(src.BraveLevel>=2)
						src.Power_Multiplier-=0.25
					src.BraveType="None"
					src.overlays-='Genesic.dmi'
					src.overlays-='SpiralMajin.dmi'
					src.overlays-=src.KingofBravesHair
					src.OMessage(10,"[src] deactivated the green energy.","<font color=red>[src]([src.key]) deactivated King of Braves.")
					src.SpecialSlot=0
					Z.BuffUsing=0
				sleep(10)
			if("ProtectShade")
				if(!Z.Using)
					if(src.BraveType=="Offense"||src.BraveType=="None")
						src<<"This cannot be used unless you are fighting defensively."
						return
					src.OMessage(10, "[src] projects an unbreakable barrier!", "[src]([src.key]) used Protect Shade.")
					src.ProtectShade=1
					src.overlays+='Legendary Shield Aura.dmi'
					Z.Cooldown()
					spawn(50)
						src.ProtectShade=0
						src.overlays-='Legendary Shield Aura.dmi'
						view(10, src) << "The light fades away from [src]."

			if("PlasmaHold")
				if(!Z.Using)
					if(src.BraveType=="Offense"||src.BraveType=="None")
						src<<"This cannot be used unless you are fighting defensively."
						return
					src.OMessage(10, "[src] fires crackling plasma towards [src.Target]!", "[src]([src.key]) used Plasma Hold.")
					var/mob/P=src.Target
					if(P.z==src.z)
						var/t=abs(src.x-P.x)+abs(src.y-P.y)
						if(t<5&&t>2)
							Stun(P,1.5)
							var/Damage=src.StrVsEnd(P, 0.3)
							P.Health-=Damage
						else if(t==1)
							Stun(P,2)
							var/Damage=src.StrVsEnd(P, 0.5)
							P.Health-=Damage
						else
							src<<"You miss your Plasma Hold, they're too far away!"
					Z.Cooldown()

			if("DividingDriver")
				if(!Z.Using)
					if(src.BraveType=="Offense"||src.BraveType=="None")
						src<<"This cannot be used unless you are fighting defensively."
						return


			if("Braveheart")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1) return
					if(src.BraveType=="Defense"||src.BraveType=="None")
						src<<"This cannot be used unless you are fighting offensively."
						return
					if(src.Health>75)
						src<<"Bitch you ain't brave. Sit the fuck down."
						return
					Z.BuffUsing=1
					src.ActiveBuffs+=3
					if(src.Health<=75 && src.Health>50)
						src.RPPower*=1.5
						src.BraveheartBP=1.5
					if(src.Health<=50 && src.Health>30)
						src.RPPower*=2
						src.BraveheartBP=2
					if(src.Health<=30 && src.Health>15)
						src.RPPower*=2.25
						src.BraveheartBP=2.25
					if(src.Health<=15)
						src.RPPower*=3.25
						src.BraveheartBP=3.25
						if(src.Energy>=src.EnergyMax/5)
							src.Energy=src.EnergyMax
					src.OMessage(10,"[src] explodes with the power of true courage!!!!","<font color=red>[src]([src.key]) activated Brave Heart.")
				else
					Z.BuffUsing=0
					src.RPPower/=src.BraveheartBP
					src.ActiveBuffs-=3
					src.Energy=1
					src.ControlPower=100
					src.OMessage(10,"[src] deactivated the energy they drew from courage.","<font color=red>[src]([src.key]) deactivated Brave Heart.")


			if("DrillKnee")
				if(Z.Using)
					return
				spawn()Z.Cooldown()
				if(src.BraveType=="None")
					src<<"This cannot be used unless you are fighting with the power of courage."
					return
				src.Melee(damagemulti=3,speedmulti=1.25,AccurMulti=1.1)
				src.OMessage(10,"[src] rams a knee mounted drill forward!","<font color=red>[src]([src.key]) used Drill Knee.")



			if("HypersonicCombo")
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(!src.Target)return
				if(src.Knockbacked)return
				if(src.Beaming)return
				if(src.TimeFrozen)return
				var/Distance=10
				if(src.Energy>EnergyMax/8)
					src.OMessage(10,"[src] dashed towards [src.Target]!","<font color=red>[src]([src.key]) used Hypersonic Combo.")
					src.Frozen=1
					src.Pursuiting=1
					Z.Using=1

					while(Z.Using&&Distance>0)
						flick("Flight",src)
						step(src,src.dir)
						src.dir=get_dir(src,src.Target)
						for(var/mob/P in view(src,1))
							var/Accuracy=(((src.Offense*src.OffenseMultiplier)*src.Power)/((P.Defense*P.DefenseMultiplier)*P.Power))*25
							if(P==src.Target)
								//Distance=2
								if(prob(Accuracy)&&!P.GER||P.Frozen||P.icon_state=="KB")
									P.Frozen=1
									if(!P.HypersonicVictim)
										Distance=200
									P.HypersonicVictim=1
									src.Pursuiting=0
									src.Attacking=0
									src.AttackHardness=4
									src.Frozen=0
									spawn(30)P.Frozen=0
						Distance-=1
						sleep(1)
					if(Distance<=0)
						src.Frozen=0
						for(var/mob/P in view(src,50))
							if(P.HypersonicVictim)
								P.HypersonicVictim=0
						src.AttackHardness=2
						if(src.Pursuiting==1)
							src<<"Your pursuit missed!"
							src.Pursuiting=0
							src.Frozen=1
							spawn(20)src.Frozen=0
						Z.Cooldown()
			if("NormalDash")
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(!(src.InUBW&&src.MadeOfSwords))
					Z.Cooldown()
				if(!src.Target)return
				if(src.Beaming)return
				if(src.TimeFrozen)return
				if(src.Knockbacked)return
				var/Distance=5
				var/XX=pick(-45,45,90,-90)
				if(src.Energy>src.EnergyMax/8)
					if(src.Stance=="Crane")
						src.OMessage(10,"[src] slowly backflips away from [src.Target]!","<font color=red>[src]([src.key]) used  Dash Avoid.")
					else
						src.OMessage(10,"[src] dashes away from [src.Target]!","<font color=red>[src]([src.key]) used  Dash Avoid.")
					src.Frozen=1
					Using=1
					while(Using&&Distance>0)
						DashImage(src)
						flick("Flight",src)
						if(src.Target:Knockbacked)
							walk_to(src,get_step(src.Target,turn(src:Target:Knockbacked,XX)))
							if(usr.loc==get_step(src:Target,turn(src:Target:Knockbacked,XX)))
								src:Target:Knockbacked=0
								src.dir=get_dir(src,src.Target)

								Distance=0
						else
							walk_away(src,src.Target)

							if(get_dist(src,src.Target)==1)
								Distance=0


						/*
						step(usr,usr.dir)
						usr.dir=get_dir(usr,usr.Target)*/

						Distance-=1
						sleep(1)
					src.Frozen=0
					walk(src,0)
					src.Attacking=0
			if("Pursuit")
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(!src.Target)return
				if(src.Knockbacked)return
				if(src.TimeFrozen)return
				if(Darlose)return

				var/Distance=25
				if(src.Energy>src.EnergyMax/8&&src.Target.Knockbacked)
					//src.DragonDashes--
					src.OMessage(10,"[src] kicks off the ground, charging in pursuit!","<font color=red>[src]([src.key]) used Pursuit.")
					src.Frozen=1
					//src.Pursuiting=0
					Z.Using=1
					var/mob/P=src.Target
					var/XX=pick(-45,45,90,-90)
					while(Distance>0)
						flick("Flight",src)
						DashImage(src)
						if(P.Knockbacked)
							walk_to(src,get_step(P,turn(P:Knockbacked,XX)))
							if(usr.loc==get_step(P,turn(P:Knockbacked,XX)))
								src:Target:Knockbacked=0
								src.dir=get_dir(src,P)

								Distance=0

						else
							walk_to(src,P)
							if(get_dist(src,P)==1)
								Distance=0


						/*
						step(usr,usr.dir)
						usr.dir=get_dir(usr,usr.Target)*/

						Distance-=1
						sleep(1)

				//	Stun(P,2)
					src.AttackHardness=2
					src.Pursuiting=1
					src.Melee(2,1)
					src.Pursuiting=0
					src.Frozen=0
					walk(src,0)
					src.Attacking=0
			//		src.AttackHardness=1
					if(src.EarthAndHeaven)
						Z.Using=0
						return
					else
						Z.Cooldown()
			if("KaiokenPursuit")
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(!src.Target)return
				if(src.Knockbacked)return
				if(src.TimeFrozen)return
				if(Darlose)return
				if(!src.KaiokenActive||!src.SuperKaioken)return

				var/Distance=25
				if(src.Energy>src.EnergyMax/8)
					//src.DragonDashes--
					src.OMessage(10,"[src] kicks off the ground, charging in pursuit while their red aura flares up!","<font color=red>[src]([src.key]) used Kaioken Pursuit.")
					src.Frozen=1
					src.Pursuiting=0
					Z.Using=1
					var/mob/P=src.Target
					var/XX=pick(-45,45,90,-90)
					while(Z.Using&&Distance>0)
						flick("Flight",src)
						DashImage(src)
						if(P.Knockbacked)
							walk_to(src,get_step(P,turn(P:Knockbacked,XX)))
							if(usr.loc==get_step(P,turn(P:Knockbacked,XX)))
								src:Target:Knockbacked=0
								src.dir=get_dir(src,P)
								Distance=0

						else
							walk_to(src,P)
							if(get_dist(src,P)==1)
								Distance=0


						/*
						step(usr,usr.dir)
						usr.dir=get_dir(usr,usr.Target)*/

						Distance-=1
						sleep(1)

					Stun(P,2)
					src.Frozen=0
					walk(src,0)
					src.Attacking=0
					src.AttackHardness=1
					Z.Using=0



			if("DistanceBreaker")
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(!(src.InUBW&&src.MadeOfSwords))
					spawn()Z.Cooldown()
				if(!src.Target)return
				if(src.Beaming)return
				if(src.TimeFrozen)return
				if(src.Knockbacked)return
				//if(src.DragonDashes<1)return
				var/Distance=25
				var/XX=pick(-45,45,90,-90)
				if(src.Energy>src.EnergyMax/8)
					src.OMessage(10,"[src] dashed towards [src.Target]!","<font color=red>[src]([src.key]) used  Dragon Dash.")
					src.Frozen=1
					Using=1
					while(Using&&Distance>0)
						DashImage(src)
						flick("Flight",src)
						if(src.Target:Knockbacked)
							walk_to(src,get_step(src.Target,turn(src:Target:Knockbacked,XX)))
							if(usr.loc==get_step(src:Target,turn(src:Target:Knockbacked,XX)))
								src:Target:Knockbacked=0
								src.dir=get_dir(src,src.Target)

								Distance=0
						else
							walk_to(src,src.Target)

							if(get_dist(src,src.Target)==1)
								Distance=0


						/*
						step(usr,usr.dir)
						usr.dir=get_dir(usr,usr.Target)*/

						Distance-=1
						sleep(1)
					src.Frozen=0
					walk(src,0)
					src.Attacking=0
					src.AttackHardness=2
					src.HeavyShot=1
					spawn(20)
						src.HeavyShot=0

			/*if("SwordsmanServomotors")
				if(!Z.BuffUsing)
					src.OffenseMultiplier*=1.25
					src.SpeedMultiplier*=1.25
					src.EnduranceMultiplier*=0.65
					src.OMessage(10,"[src] arm and leg motors start whirring loudly!","<font color=red>[src]([src.key]) activated Swordsman Servomotors.")
					Z.BuffUsing=1
				else
					src.OMessage(10,"[src] deactivates the destructive aura.","<font color=red>[src]([src.key]) deactivated Swordsman Servomotors.")
					src.OffenseMultiplier/=1.25
					src.SpeedMultiplier/=1.25
					src.EnduranceMultiplier/=0.65
					Z.BuffUsing=0
				sleep(10)*/

			if("EightArms")
				if(src.KO||Blocking)return
				for(var/obj/Items/Sword/S in src) if(S.suffix) return
				if(Z.Using) return
				src.EightArms=1
				src.DefenseMultiplier*=1.2
				src.OMessage(10,"[src] seems to sprout multiple arms as they swing with ferocity!","<font color=red>[src]([src.key]) Activates Eight Arms.")
				Z.Cooldown()
				spawn(100)
					src.EightArms=0
					src.DefenseMultiplier/=1.2
					src.OMessage(10,"[src] arms seem to disappear completely as if they were never there","<font color=red>[src]([src.key]) Eight Arms Stopping")
			if("OneHundredArms")
				if(src.KO||Blocking)return
				for(var/obj/Items/Sword/S in src) if(S.suffix) return
				if(Z.Using) return
				src.OneHundredArms=1
				src.DefenseMultiplier*=1.2
				src.OMessage(10,"[src] begins to flurry their arms with extreme speed! There must be hundreds of arms!","<font color=red>[src]([src.key]) Activates One Hundred Arms Arms.")
				Z.Cooldown()
				spawn(100)
					src.OneHundredArms=0
					src.DefenseMultiplier/=1.2
					src.OMessage(10,"[src] slows down their flurry, their hundreds of arms seemingly vanishing","<font color=red>[src]([src.key]) One Hundred Arms Stopping")




mob/proc/SkillX(var/Wut,var/obj/Skills/Z,var/bypass=0)//var/_isSkillActive
	if(Z)
		if(!locate(Z) in src)
			return
	if(src.Stunned)
		if(Wut!="After Image Strike"||Wut!="Wild Sense")
			return
	var/ManaDrain=1
	var/StaffPower=1
	var/Element=0
	for(var/obj/Items/Enchantment/Staff/N in src) if (N.suffix)
		ManaDrain=N.Mana_Drain
		StaffPower=N.Staff_Power
		Element=N.Element
	if(bypass||Z)
		switch(Wut)
			if("ConquerorsHaki")
				if(Z.Using)
					return
				var/Immune=0
				spawn()LightningFlash(src)
				KenShockwave(src,icon='fevKiai.dmi',Size=4)
				KenShockwave(src,icon='fevKiai.dmi',Size=2)
				KenShockwave(src,icon='fevKiai.dmi',Size=0.5)
				Quake(10)
				for(var/mob/M in view(15))
					for(var/obj/Skills/ConquerorsHaki/CH in M)
						Immune=1
					if(Immune==0)
						if(M.Resolve==1)
							return
						if(M.DevilFruitType=="Ex")
							return
						if(3*M.Power<src.Power)
							if(prob(75))
								spawn()M.Unconscious(null,"extreme willpower!")
						if(M.Power>src.Power)
							M.Health*=0.8
							M<<"You feel suffocated by [src]'s extreme willpower!"
						if(M.Power<src.Power&&3*M.Power>src.Power)
							M.Health*=0.6
							M<<"You feel suffocated by [src]'s extreme willpower!"
						if(M.Power>src.Power*3&&M.Power<src.Power*10)
							if(prob(0))
								spawn()M.Unconscious(null,"extreme willpower!")
						if(M.Power>src.Power*10)
							if(prob(0))
								spawn()M.Unconscious(null,"extreme willpower!")
					Immune=0
				Z.Cooldown()
			if("WolfFangFist")
				if(Z.Using||src.Attacking)return
				//var/image/LOL=image('WolfFangFist.dmi',dir=src.dir)
				WolfFangFist(src,Direc=src.dir)
				src.Melee(10,2,,1,WFF=1)
				Z.Cooldown()
				//mob/proc/Melee(var/damagemulti,var/speedmulti,var/iconoverlay,1)


			if("GETDUNKED")
				if(Darlose)
					return
				if(src.KO||Z.Using||src.Blocking)
					return
				if(src.GetDunked)
					return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						usr<< "Dunking cannot be done with a sword, plebeian."
						return
				src.GetDunked=1
				usr<< "The next melee move will do the dunking."
				//spawn(100) src.GetDunked=0
				Z.Cooldown()
			//	src.Melee(1.25,1.25,0,0)
			//	src.HeavyShot=0
			if("SuperHumanDrug")
				if(src.KO||src.SuperHumanDrug)return
				src.SuperHumanDrug=1
				src<< "You withdraw the deadly mixture from your pocket..."
				sleep(100)
				src<< "You put away the solution... for now!"
				src.SuperHumanDrug=0
				Z.Cooldown()
			if("TheKnee")
				if(!Z.Using)
					if(src.KO||src.TheKnee)return
					Z.Using=1
					src.TheKnee=1
					src<< "Your knee is ready..."
					sleep(10)
					src.TheKnee=0
					src<< "Your knee is no longer ready!"
					Z.Cooldown()
			if("HeavyShot")
				if(src.KO||Z.Using||src.Blocking)return
				Z.Using=1
				src.AttackHardness=2
				src.HeavyShot=1
				src.Melee(1,1,0,0)
				spawn(50) src.HeavyShot=0
				Z.Cooldown()
			if("HeavyDrain")
				if(src.KO||Z.Using||src.Blocking)return
				src.HeavyDrain=1
				spawn(50) src.HeavyDrain=0
				Z.Cooldown()
			if("Megiddo")
				if(src.KO||Z.Using||src.Blocking)return
				if(!Z.Using)
					for(var/obj/Items/Sword/S in usr)
						if(S.suffix)
							src.Megiddo=1
							src.OMessage(10,"[src]'s [S] lets out a furious howl!","<font color=red>[src]([src.key]) used Megiddo.")
							spawn(30)
								src.Megiddo=0
							src.TotalFatigue+=5
							Z.Cooldown()
			if("Throw")
				if(!Z.Using)
					if(src.Grab)
						var
							mob/P=src.Grab
							ThrowDir=src.dir
						src.Grab=null
						if(P)
							P.Knockback((src.Power*src.Strength*src.StrengthMultiplier)/(P.Power*P.Endurance*P.EnduranceMultiplier)+5,P,Direction=ThrowDir)
						Z.Cooldown()
			if("SoultearStorm")
				if(src.KO||Z.Using||src.Blocking)return
				if(!Z.Using)
					src.Soultear=1
					src.OMessage(10,"[src]'s body begins to glow with an ethereal, sinister energy!","<font color=red>[src]([src.key]) used Soultear Storm.")
					spawn(30)
						if(!src.Frozen)
							src.Soultear=0
					Z.Cooldown()
			if("HyperTornado")
				if(Z.Using)
					return
				if(src.KO||Blocking)return
				if(src.Energy>EnergyMax/8)
					src.OMessage(10,"[src] spins around, causing a tornado to erupt from them!","<font color=red>[src]([src.key]) used Hyper Tornado.")
					for(var/mob/P in view(1)) //Does this govern move range? Fuck if I know.
						var/Damage=src.StrVsEnd(P, 5)
						var/Knock_Distance=25
						if(P!=src)
							if(src.DiplomaticImmunity || P.DiplomaticImmunity)
								Damage*=0
							P.Health-=Damage
							P.Knockback(Knock_Distance,src)
					src.Energy*=0.8
					Z.Skill_Increase(1.75)
					Stun(src,amount=2)
					Z.Cooldown()





			//Visored mask shit go, still needs balancing but the basic stuff will be here.
					/*if("MaskForm")
						if(src.InVisored==0)
							if(src.MaskMastery<50 || src.Anger<100)
								src<<"Your Mask's mastery is to low to use it without being angry!"
								return
							else if(src.MaskMastery>50&&src.MaskMastery<100)
								src.MaskDuration=MaskMastery*20
								src.InVisored=1
								if(src.MaskType=="Resolve")
									src.Base*=2
									src.BaseMod*=2
									src.EnduranceMultiplier*=1.35
									src.ResistanceMultiplier*=1.35
									src.overlays+=image('IchigoMask.dmi')
								if(src.MaskType=="Pursuit")
									src.Base*=1.5
									src.BaseMod*=1.5
									src.StrengthMultiplier*=1.25
									src.SpeedMultiplier*=1.5
									src.OffenseMultiplier*=1.25
									src.overlays+=image('LisaMask.dmi')
								if(src.MaskType=="Zeal")
									src.Base*=1.65
									src.BaseMod*=1.65
									src.StrengthMultiplier*=1.5
									src.ForceMultiplier*=1.5
									src.overlays+=image('MashiroMask.dmi')
								if(src.MaskType=="Strength")
									src.Base*=1.5
									src.BaseMod*=1.5
									src.StrengthMultiplier*=2
									src.EnduranceMultiplier*=1.25
									src.overlays+=image('KenseiMask.dmi')
							//Jesse told me to so I did
								if(src.MaskType=="Conductor")
									src.Base*=1.75
									src.BaseMod*=1.75
									src.StrengthMultiplier*=1.25
									src.EnduranceMultiplier*=1.25
									src.ForceMultiplier*=1.25
									src.SpeedMultiplier*=1.25
									src.ResistanceMultiplier*=1.25
									src.OffenseMultiplier*=1.25
									src.DefenseMultiplier*=1.25
									src.overlays+=image('ConductorMask.dmi')

						if(src.InVisored==1)*/




			if("Clothesline")
				if(src.Darlose)return
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(src.Clothesline)
					src << "Fuck you, Adam."
					return
				var/Distance=10
				var/DistanceCounter=0
				if(src.Energy>EnergyMax/8)
					src.Clothesline=1
					Z.Using=1
					src.OMessage(10,"[src] held their arms out and began dashing forward!","<font color=red>[src]([src.key]) used Clothesline.")
					sleep(10)
					src.Frozen=1
					while(Z.Using&&Distance)
						step(src,src.dir)
						for(var/mob/P in view(src,1))
							var/Accuracy=(((src.Offense*src.OffenseMultiplier)*src.Power)/((P.Defense*P.DefenseMultiplier)*P.Power))*150
							if(P!=src)
								if(prob(Accuracy)&&!P.GER)
									P.Knockback(3,src)
									var/KnockbackDir=pick(-45,45)

									var/Damage=src.StrVsEnd(P, 2)
									P.dir=turn(src.dir, KnockbackDir)
							/*	if(!prob(Accuracy_Formula(src,P,20)))
									Damage/=8*/
									if(src.DiplomaticImmunity || P.DiplomaticImmunity)
										Damage*=0
									P.Health-=Damage
									if(prob(75+DistanceCounter))
										DistanceCounter+=2
									if(prob(10) && Distance>1)
										Distance-=1
									if(prob(30+DistanceCounter) && Distance>1)
										Distance=1
						Distance-=1
						DistanceCounter+=2
						sleep(3)
					if(Distance<=0)
						src.Frozen=0
						src.Clothesline=0
					Z.Cooldown()

			if("LimitBreaker")
//				if(src.Alert("You sure you want to use/deactivate LimitBreaker?"))
				if(!src.LimitBreaker)
					if(Z.Using)
						return
					src.Base*=2
					src.BaseMod*=2
					src.PlusPower*=2
					src.RecoveryMultiplier*=1.5
					src.RegenerationMultiplier*=1.5
					src<<"Your body's power and stress increases!"
					src.overlays+=image(icon='AurasBig.dmi',icon_state="Demi",pixel_x=-32)
					src.LimitBreaker=60
					if(src.KO)
						src.KO=0
						src.Health=15
						src.TotalInjury=85
						src.LimitBreaker=10
				else
					src.Base/=2
					src.BaseMod/=2
					src.PlusPower/=2
					src.RecoveryMultiplier/=1.5
					src.RegenerationMultiplier/=1.5
					src.LimitBreaker=0
					src.TotalInjury+=(100-src.TotalInjury)/2
					src<<"You return to normal! You won't be able to break your limit again for 30 seconds, though!"
					src.overlays-=image(icon='AurasBig.dmi',icon_state="Demi",pixel_x=-32)
					Z.Cooldown()
				sleep(20)
			if("Tengenkotsu")
				if(Z.Using||src.Attacking)return
				src << "TENGENKOTSU WARNING!!"
				src.Tengenkotsu=1
				src.Melee(1,1,0,1)
				Z.Using=1
				sleep(20)
				Z.Cooldown()
			if("StrengthOfWill")
				if(Z.Using||src.Attacking)return
				src.StrengthOfWill=1
				src.Melee(1,1,0,1)
			if("DragonFist")
				if(Z.Using||src.Attacking)return
				src.GokuDragonFist=1
				src.Melee(1,1,0,1)
			if("VAbsorb")
				if(src.Package["Vampire"]==1)
					src.Package["Vampire"]=null
					src<<"Disabled Vampire absorb."
					src.StrengthMultiplier/=0.75
				else
					src.Package["Vampire"]=1
					src<<"Enabled Vampire Absorb."
					src.StrengthMultiplier*=0.75
			if("TheWorld")
				if(Z.Using)
					src.TheWorld=0
					Z.Using=0
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: Let the flow of time return to normal."
					for(var/mob/B in world)
						if(B.TimeFrozen)
							B.TimeFrozen=0
							B.Frozen=0
				else
					if(src.ManaAmount<=10) return
					Z.Using=1
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: Za..."
					sleep(15)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>...WARUDO!</b>"
					for(var/mob/M in view(20,src))
						if(M!=src&&M.WorldImmune==0)//&&M.SpiralResistance==0)
							M.Frozen=1
							M.TimeFrozen=1
					sleep(15)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: Time is now frozen."
					src.TheWorld=1
			if("TheWorldRequiem")
				if(Z.Using)
					src.TheWorldRequiem=0
					Z.Using=0
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: Let the flow of time return to normal."
					for(var/mob/B in world)
						if(B.TimeFrozen)
							B.TimeFrozen=0
							B.Frozen=0
				else
					if(src.ManaAmount<=10) return
					Z.Using=1
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: The Universe..."
					sleep(15)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>...IS FROZEN!!!</b>"
					for(var/mob/M in view(20,src))
						if(M!=src&&M.WorldImmune<2)
							M.Frozen=1
							M.TimeFrozen=1
					src.TheWorldRequiem=1
			if("Epitaph")
				if(Z.Using)
					Z.Using=0
					src.Epitaph=0
				else
					if(src.ManaAmount<=10) return
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: The Universe..."
					sleep(15)
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>...PROTECTS ME!</b>"
					Z.Using=1
					src.Epitaph=1

			if("GER")
				if(Z.Using)
					Z.Using=0
					src.GER=0
				else
					if(src.ManaAmount<=10) return
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: Gold Experience Requiem."
					Z.Using=1
					src.GER=1
					src.Frozen=0
					src.TimeFrozen=0
			if("RER")
				if(Z.Using)
					Z.Using=0
					src.BER=0
					src.Base*=10000
					src.BaseMod*=10000
					src.AngerMax/=10000
					src.Anger=src.AngerMax
				else
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: <b>I'M RED OUTTA TEN.</b>."
					Z.Using=1
					src.BER=1
					src.Base/=10000
					src.BaseMod/=10000
					src.AngerMax*=10000
					src.Anger=0
			if("BER")
				if(Z.Using)
					Z.Using=0
					src.BER=0
					src.SpeedMultiplier/=20
					src.OffenseMultiplier/=0.05
					src.DefenseMultiplier/=0.05
				else
					if(src.ManaAmount<=10) return
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: Blue Experience Requiem."
					Z.Using=1
					src.BER=1
					src.SpeedMultiplier*=20
					src.OffenseMultiplier*=0.05
					src.DefenseMultiplier*=0.05
					src.Frozen=0
					src.TimeFrozen=0
			if("KingCrimson")
				if(src.ManaAmount<=10) return
				src.ManaAmount-=30
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						if(prob(30))
							E<<"<font color=[C.Text_Color]>[src] says: King Crimson."
				Z.Using=1
				src.KingCrimson=1
				sleep(50)
				src.KingCrimson=0
				Z.Using=0
			if("StarPlatinum")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1) return
					src.ActiveBuffs+=3
					src.Power_Multiplier+=1
					src.SpeedMultiplier*=2
					src.DefenseMultiplier*=0.5
					src.OffenseMultiplier*=0.7
					src.StrengthMultiplier*=1.5
					src.StarPlatinum=1
					src.OMessage(10,"[src] summons a ghostly spirit behind them!","<font color=red>[src]([src.key]) activated Star Platinum.")
			/*		for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] says: <b>ORAORAORAORAORA!</b>"*/
					Z.BuffUsing=1
				else
					src.SpeedMultiplier/=2
					src.DefenseMultiplier/=0.5
					src.OffenseMultiplier/=0.7
					src.StrengthMultiplier/=1.5
					src.ActiveBuffs-=3
					src.Power_Multiplier-=1
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					src.StarPlatinum=0
					src.OMessage(10,"[src] represses the power of their fighting spirit.","<font color=red>[src]([src.key]) deactivated Star Platinum")
					Z.BuffUsing=0

			if("VoloFrenzy")
				if(Z.BuffUsing)
					Z.BuffUsing=0
					if(src.Race=="Vampire")
						src.Base/=1.5
						src.BaseMod/=1.5
					else
						src.Power_Multiplier-=0.5
					//src.ResistanceMultiplier/=0.85
					//src.EnduranceMultiplier/=0.85
					src.StrengthMultiplier/=2
					src.SpeedMultiplier/=1.25
					src.OMessage(10,"[src] returns to normal as their frenzy ends.","<font color=red>[src]([src.key]) de-activated Vampire Frenzy.")


				else
					Z.BuffUsing=1
					if(src.Race=="Vampire")
						src.Base*=1.5
						src.BaseMod*=1.5
					else
						src.Power_Multiplier+=0.5
					if(src.AngerMax>1)
						src.Anger=src.AngerMax
					//src.ResistanceMultiplier*=0.85
					//src.EnduranceMultiplier*=0.85
					src.StrengthMultiplier*=2
					src.SpeedMultiplier*=1.25
					src.OMessage(10,"[src] begins to thirst for blood, as they let out an ear-piercing scream!","<font color=red>[src]([src.key]) activated Vampire Frenzy.")
					for(var/mob/E in hearers(12,src))
						for(var/obj/Communication/C in src)
							E<<"<font color=[C.Text_Color]>[src] yells: <b>WRRRRRRRRRRRRRRRRRRRRRYYYYYYYYYYYYY!</b>"
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
			if("NuclearFusion")
				if(Z.BuffUsing)
					Z.BuffUsing=0
					src.BaseMod/=2
					src.Base/=2
					src.RecoveryMultiplier/=0.5
					src.DefenseMultiplier/=0.01
					src.Anger=0
					src.overlays-=image(icon='NuclearFusion.dmi',icon_state="",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.OMessage(10,"[src] stops drawing on the power of Nuclear Fusion.","<font color=red>[src]([src.key]) de-activated Nuclear Fusion.")
					/*src.ActiveBuffs-=1
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0*/
				else
					/*if(src.ActiveBuffs>=3) return
					src.ActiveBuffs+=1*/
					Z.BuffUsing=1
					if(src.AngerMax>1)
						src.Anger=src.AngerMax
					src.BaseMod*=2
					src.Base*=2
					src.RecoveryMultiplier*=0.5
					src.DefenseMultiplier*=0.01
					src.overlays+=image(icon='NuclearFusion.dmi',icon_state="",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.OMessage(10,"[src] draws on the power of Nuclear Fusion!","<font color=red>[src]([src.key]) activated Nuclear Fusion.")
					/*if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0*/

			if("NuclearFission")
				if(Z.BuffUsing)
					Z.BuffUsing=0
					src.BaseMod/=1.25
					src.Base/=1.25
					src.RecoveryMultiplier/=1.5
					src.SpeedMultiplier/=1.5
					src.StrengthMultiplier/=0.5
					src.EnduranceMultiplier/=0.75
					src.ForceMultiplier/=0.5
					src.ResistanceMultiplier/=0.75
					src.Anger=0
					src.overlays-=image(icon='NuclearFission.dmi',icon_state="",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.OMessage(10,"[src] stops drawing on the power of Nuclear Fission.","<font color=red>[src]([src.key]) de-activated Nuclear Fusion.")
					/*src.ActiveBuffs-=1
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0*/
				else
					/*if(src.ActiveBuffs>=3) return
					src.ActiveBuffs+=1*/
					Z.BuffUsing=1
					src.BaseMod*=1.25
					src.Base*=1.25
					src.RecoveryMultiplier*=1.5
					src.SpeedMultiplier*=1.5
					src.StrengthMultiplier*=0.5
					src.EnduranceMultiplier*=0.75
					src.ForceMultiplier*=0.5
					src.ResistanceMultiplier*=0.75
					src.Anger=0
					src.overlays+=image(icon='NuclearFission.dmi',icon_state="",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.OMessage(10,"[src] draws on the power of Nuclear Fission!","<font color=red>[src]([src.key]) activated Nuclear Fusion.")
					/*if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0*/

			if("VFrenzy")
				if(Z.BuffUsing)
					Z.BuffUsing=0
					if(src.Race=="Vampire"||src.Class=="Dhampir"||src.Class=="Vampire")
						src.Base/=1.5
						src.BaseMod/=1.5
						src.SpeedMultiplier/=1.5
						src.ResistanceMultiplier/=0.85
						src.EnduranceMultiplier/=0.85
						src.StrengthMultiplier/=1.5
						src.ForceMultiplier/=1.5
					else
						src.Power_Multiplier-=0.5
						src.SpeedMultiplier/=1.25
						src.ResistanceMultiplier/=0.85
						src.EnduranceMultiplier/=0.85
						src.StrengthMultiplier/=1.25
						src.ForceMultiplier/=1.25
					src.Anger=0
					src.OMessage(10,"[src] returns to normal as their frenzy ends.","<font color=red>[src]([src.key]) de-activated Vampire Frenzy.")
		//			src.icon=Z:oldicon
					Z:oldicon=null
				else
					Z.BuffUsing=1
					if(src.Race=="Vampire"||src.Class=="Dhampir"||src.Class=="Vampire")
						src.Base*=1.5
						src.BaseMod*=1.5
						src.SpeedMultiplier*=1.5
						src.ResistanceMultiplier*=0.85
						src.EnduranceMultiplier*=0.85
						src.StrengthMultiplier*=1.5
						src.ForceMultiplier*=1.5
						/*var/list/SuperFrenzy=list("Basic","Cancel")
						*/
					else
						src.Power_Multiplier+=0.5
						src.SpeedMultiplier*=1.25
						src.ResistanceMultiplier*=0.85
						src.EnduranceMultiplier*=0.85
						src.StrengthMultiplier*=1.25
						src.ForceMultiplier*=1.25
					if(src.AngerMax>1)
						src.Anger=src.AngerMax
					src.OMessage(10,"[src] begins to thirst for blood, as their skin tone becomes paler!","<font color=red>[src]([src.key]) activated Vampire Frenzy.")
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
		//			Z:oldicon=src.icon
		//			var/icon/Heh=new(src.icon)
		//			Heh.Blend(rgb(25,25,25,200),ICON_ADD)
		//			src.icon=Heh

			if("Dig")
				if(src.KO||src.icon_state=="Meditate"||src.icon_state=="Train"||src.icon_state=="Flight"||src.Beaming||src.Attacking) return
				if(src.icon_state!="KB")
					usr.OMessage(1,null,"[usr]([usr.key]) dug!")
					src.Digging=1
					src.icon_state="KB"
					src.Frozen=1
					Z.Using=1
					spawn(20)
						Z.Using=0
					src.Digging()
				else
					if(Z.Using==1)return
					src.icon_state=""
					src.Digging=0
					src.Frozen=0

			if("Train")
				if(src.KO||src.icon_state=="KB"||src.icon_state=="Meditate"||src.icon_state=="Flight"||src.Beaming||src.Attacking) return
				if(src.icon_state!="Train")
					usr.OMessage(1,null,"[usr]([usr.key]) trained!")
					src.icon_state="Train"
					src.Training()
//					TrainGains.Add(src)
					Z.Using=1
					spawn(20)
						Z.Using=0
				else
					if(Z.Using==1)
						return
					src.icon_state=""
//					TrainGains.Remove(src)
			if("Heal")
				if(Z.Using)
					return
				if(src.KO||Blocking)return
				for(var/mob/Players/P in get_step(src,src.dir))
					view(src)<<"[src] heals [P]"
					if(src.Class!="Healer")
						src.Health-=100/(1+(Z.Level*0.02))
					src.Energy-=100/(1+(Z.Level*0.02))
					Z.Level++
					if(P.KO) P.Conscious()
					P.Health=100
					P.TotalInjury-=25*(1+(Z.Level*0.01))
					if(P.TotalInjury < 0)
						P.TotalInjury=0
					P.Energy=P.EnergyMax
					src.SkillLeech(Z)
					return
				Z.Cooldown()
			if("Fly")
				if(src.KO||src.icon_state=="Meditate"||src.icon_state=="Train"||src.icon_state=="KB") return
				if(src.Flying)
					if(Z.Using==1)//See: Meditate
						return
//					FlyGains.Remove(src)
					src.Flying=0
					src.icon_state=""
				else if(src.Energy>(src.EnergyMax/Level/src.Efficiency/10))
					src.Flying=1
					usr.OMessage(1,null,"[usr]([usr.key]) flew!")
//					FlyGains.Remove(src)
//					FlyGains.Add(src)
					src.icon_state="Flight"
					Create_Shadow(src) // Creates a shadow to give the appearance of floating above ground
					Flight(src)	// Handles shadow's opacity; makes player bob up and down while flying
					Z.Using=1
					spawn(20)
						Z.Using=0
					src.Fly()

				else
					src<<"You do not have enough energy to fly."
			if("ChaosObserve")
			{
				if(src.Observing == 1)
				{
					Observify(src, src);
					src.Observing = 0;
				}
				else
				{
					var/list/People=new;
					for(var/mob/m in world)
					{
						if(m.client)
						{
							People+=m;
						}
					}
					var/mob/choice = People[rand(1, People.len)];
					Observify(src, choice)
					src.Observing=1
				}
			}
			if("Observe")
				var/list/PeopleX=new
				for(var/mob/M in world)
					if(M.client)
						PeopleX+=M
				var/mob/A=input(src,"Observe who?") in PeopleX||null
				if(A)
					Observify(src,A)
					if(A==src)
						src.Observing=0
					if(A!=src && A.z==21 || A!=src && A.z==10)
						src<<"For some reason, you cannot observe them."
						return
					else
						src.Observing=1
						Log(src.ChatLog(),"<font color=red>[src]([src.key]) used Observe on [A]([A.key]).")
			if("Makosen")
				var/Drain=5/Z.Efficiency
				if(Z.Using) return
				if(!src.CanBlast(Drain)) return
				if(src.Attacking)return
				src.Attacking=1
				spawn((src.Refire/Z.Speed*10)+1) src.Attacking=0
				var/Blasts=rand(2*sqrt(Z.Level),5*sqrt(Z.Level))
				Z.Skill_Increase(3)
				src.Energy*=0.95
				Z.Using=1
				while(Blasts>1)
					Blasts-=1
					if(!src.CanBlast(Drain)) return
					flick("Blast",src)
					src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
					var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
					A.Distance=Distance
					A.pixel_y=rand(-24,24)
					A.pixel_x=rand(-24,24)
					A.x+=rand(-1,1)
					A.y+=rand(-1,1)
					A.dir=src.dir
					A.icon=Z.sicon
					A.icon_state=Z.sicon_state
					A.Owner=src
					A.Damage_Multiplier=0.5
					A.Lethality=src.Lethal
					A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill
					spawn if(A) walk(A,A.dir)
				Z.Cooldown()
				src.SkillLeech(Z)
			if("Kienzan")
				if(Z.Using)
					return
				var/Drain=100/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.overlays+=image(icon=Z.sicon,icon_state=Z.sicon_state,pixel_y=28)
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/15)))
				src.overlays-=image(icon=Z.sicon,icon_state=Z.sicon_state,pixel_y=28)
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)+(src.EnergyMax/25)
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(5)
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.dir=src.dir
				A.icon=Z.sicon
				A.Pierce=1
				A.Slicing=1
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=5
				A.Deflectable=0
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				Z.Cooldown()
			if("SlicingWind")
				if(Z.Using)
					return
				var/Drain=100/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
			//	src.overlays+=image(icon=Z.sicon,icon_state=Z.sicon_state,pixel_y=28)
			//	src.overlays-=image(icon=Z.sicon,icon_state=Z.sicon_state,pixel_y=28)
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)+(src.EnergyMax/25)
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(2.15)
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=100//Distance
				A.dir=src.dir
				A.icon=Z.sicon
				A.Pierce=1
				A.Slicing=1
				A.Elemental="Wind"
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=5
				A.Deflectable=0
				A.SlicingW=1
				Z.Using=1
			//	spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				Z.Cooldown()
			if("Mugetsu")
				if(Z.Using)
					return
				if(src.Attacking) return
				if(src.Dead) return
				if(src.Alert("You sure you want to use the Final Getsuuga Tenshou?"))
					for(var/turf/T in Turf_Circle(src,18))
						for(var/mob/M in view(0,T))
							if(M!=src)
								M.Frozen=1
								M<<"You feel crushed by the massive outpour of energy radiating from [src]!"
					src.Attacking=1
					src.Beaming=1
					src.Attacking=0
					src.Beaming=0
					src.overlays+=image('Aurasbig.dmi',"SSJ4",pixel_x=-32)
					src.overlays+='blackflameaura.dmi'
					spawn()DarknessFlash(src)
					sleep(100)
					flick("Blast",src)
					var/obj/Projectiles/Mystical/A=new(get_step(src,turn(src.dir,180)))
					A.Radius=2
					A.Slicing=1
					A.Mugetsu=1
					A.Distance=90
					A.dir=src.dir
					A.icon=Z.sicon
					A.Pierce=1
					A.icon_state=Z.sicon_state
					A.Owner=src
					A.Damage_Multiplier=2000
					A.Deflectable=0
					A.Lethality=src.Lethal
					src.overlays-='blackflameaura.dmi'
					src.overlays-=image('Aurasbig.dmi',"SSJ4",pixel_x=-32)
					spawn if(A) walk(A,A.dir)
					for(var/turf/T in Turf_Circle(src,18))
						for(var/mob/M in view(0,T))
							if(M!=src)
								M.Frozen=0
					sleep(100)
					src.Base=1
					src.Energy=20
					src.Death(null, "pouring their entire soul into one final attack!")
			if("Charge")
				if(Z.Using)
					return
				var/Drain=50/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/20)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(2.5)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				Create_Projectile(usr,/obj/Projectiles/fevProjectile/Charge,Icon=Z.sicon)
				src.SkillLeech(Z)
				Z.Cooldown()

			if("Fire_Shot")
				if(Z.Using)
					return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix&&!GunKata)
						return
				EXP+=(EXPGains/100)*0.00004
				var/Drain=0.5
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.Beaming) return
				if(src.ManaAmount<=20) return
				src.ManaAmount-=Drain/src.Efficiency*100*(1/Z.Level)
				Z.Skill_Increase()
				var/Bullet_Chance=100
				while(round(Bullet_Chance))
					if(prob(Bullet_Chance))
						flick("Blast",src)
						Create_Projectile(usr,/obj/Projectiles/fevProjectile/Bullet,Icon=Z.sicon)//short and sweet procedure to handle projectile creation
						Bullet_Chance*=0.25
						for(var/mob/X in view(10,usr))
							if(X.MusicToggle=="On")
								X<<sound('kiblast.wav', repeat = 0, wait = 0, channel = 0, volume = 50)
					else
						Bullet_Chance=0
				if(Z.Level<100)
					Z.Level=100

			if("SekihaTenkyoken")
				if(Z.Using)
					return
				var/Drain=50/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/20)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*200*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(2.5)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.Explosive=1
				A.Knockback=1
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Sekiha=1
				A.Radius=1
				A.Lethality=src.Lethal
				A.Damage_Multiplier=10
				A.Elemental=Element
				A.Offense=(src.Offense*src.OffenseMultiplier)/3//*(Skill/50)
				spawn if(A) walk(A,A.dir)
				Z.Cooldown()
			if("SekihaLoveLoveTenkyoken")
				if(Z.Using)
					return
				var/Partner
				for(var/mob/SLLTCheck in view(1,src))
					if(SLLTCheck!=src)
						for(var/obj/Skills/Attacks/SekihaLoveLoveTenkyoken/HasSLLT in SLLTCheck)
							Partner=SLLTCheck
				if(Partner==null)
					src<<"You have to have a partner who knows Sekiha Love Love Tenkyoken for this! There's no other way!"
					return
				var/Drain=50/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/20)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*200*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(2.5)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.Explosive=1
				A.Knockback=1
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Partner=Partner
				A.Sekiha=2
				A.Deflectable=0
				A.Pierce=1
				A.Radius=1
				A.Lethality=src.Lethal
				A.Damage_Multiplier=20
				A.Elemental=Element
				A.Offense=(src.Offense*src.OffenseMultiplier)/3//*(Skill/50)
				spawn if(A) walk(A,A.dir)
				Z.Cooldown()
			if("IceCoffin")
				if(Z.Using)
					return
				var/Drain=50/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/20)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(2.5)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=20
				A.Explosive=0
				A.Knockback=0
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=0//src.Lethal
				A.Damage_Multiplier=1
				A.Elemental="IceEncase"
				A.Offense=(src.Offense*src.OffenseMultiplier)/3//*(Skill/50)
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				src.TotalFatigue+=5
				Z.Cooldown()

			if("Fireball")
				if(Z.Using)
					return
				var/Drain=55/Z.Efficiency
				if(src.ManaAmount<=10) return
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/19)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(2.5)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.Explosive=1
				A.Knockback=3
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=3*StaffPower
				A.Offense=(src.Offense*src.OffenseMultiplier)*(Skill/10)/2
				A.Elemental="Fire"
//				A.Burning=1
				if(!src.Manakete)
					src.ManaAmount-=(10/ManaDrain)
				spawn if(A) walk(A,A.dir)
				Z.Cooldown()

			if("PoisonBolt")
				if(Z.Using)
					return
				var/Drain=55/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.ManaAmount<2) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/21)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(2.5)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.Explosive=1
				A.Knockback=3
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.icon+=rgb(10,150,10)
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=3*StaffPower
				A.Offense=(src.Offense*src.OffenseMultiplier)*(Skill/10)/2
				A.Poisoning=1
				if(!src.Manakete)
					src.ManaAmount-=(10/ManaDrain)
				spawn if(A) walk(A,A.dir)
				Z.Cooldown()

			if("PoisonGas")
				if(Z.Using)
					return
				var/Drain=55/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.ManaAmount<2) return
				Z.Skill_Increase(2.5)
				if(Z.Level<100)
					Z.Level=100
				if(!src.Manakete)
					src.ManaAmount-=(15/ManaDrain)
				var/obj/Effects/PoisonGas/A=new(locate(src.x-2,src.y,src.z))
				var/obj/Effects/PoisonGas/B=new(locate(src.x+2,src.y,src.z))
				var/obj/Effects/PoisonGas/C=new(locate(src.x,src.y-2,src.z))
				var/obj/Effects/PoisonGas/D=new(locate(src.x,src.y+2,src.z))
				A.Owner=src
				B.Owner=src
				C.Owner=src
				D.Owner=src
				Z.Cooldown()

			if("BlackHole")
				if(Z.Using)
					return
				var/Drain=55/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.ManaAmount<2) return
				Z.Skill_Increase(2.5)
				if(Z.Level<100)
					Z.Level=100
				if(!src.Manakete)
					src.ManaAmount-=(15/ManaDrain)
				var/obj/Effects/Blackhole/A=new(locate(src.x,src.y-6,src.z))
				A.Owner=src
				Z.Cooldown()

/*			if("ChargeDeathBall")
				var/DeathBallLevel=1
				src.Attacking=1
				src.Beaming=1
				src<<"The power within your hands grew!"
				DeathBallLevel+=1
				Z.sicon='DeathBallMed.dmi'
				src<<"The power within your hands grew once more, reaching its peak!"
				DeathBallLevel+=1
				Z.sicon='DeathBallStrong.dmi'*/
			if("DeathBall")
				if(Z.Using)
					return
				var/Drain=500/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)+(src.EnergyMax/10)
				Z.Skill_Increase(10)
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,turn(src.dir,180)))
				A.y=min(A.y+2,500)
				A.Distance=sqrt(Z.Level)*10
				animate(A, transform = matrix()*0.5, time = 0)
				A.dir=src.dir
				A.icon=Z.sicon
				A.Radius=1
				A.Explosive=1
				A.Deflectable=0
				A.Knockback=1
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=50
				A.Offense=(src.Offense*src.OffenseMultiplier)*2//*(src.Skill/3)
				//src.SkillLeech(Z)
				spawn animate(A, transform = matrix()*1, time = 20)
				sleep(20)
				while(A)
					if(!src)break
					step(A,src.dir)
					sleep(10/(sqrt(Z.Level)*sqrt(Z.Level)))
				src.Attacking=0
				src.Beaming=0
				Z.Cooldown()
			if("VoidDeathBall")
				if(Z.Using)
					return
				var/Drain=500/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)+(src.EnergyMax/10)
				Z.Skill_Increase(10)
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,turn(src.dir,180)))
				A.Distance=sqrt(Z.Level)*4
				A.dir=src.dir
				A.icon=Z.sicon
				A.Radius=1
				A.Explosive=1
				A.Deflectable=1
				A.Knockback=1
				A.VoidProj=1
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=100
				A.Offense=(src.Offense*src.OffenseMultiplier)*15
				src.SkillLeech(Z)
				sleep(20)
				src.Control=A
				while(A)
					if(!src)break
					step(A,src.dir)
					sleep((100/(sqrt(Z.Level)*sqrt(Z.Level)))/src.SpeedMod)
				src.Attacking=0
				src.Beaming=0
				Z.Cooldown()
			if("OmegaBlaster")
				if(Z.Using)
					return
				var/Drain=500/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				src.overlays+='Legendary Shield Aura.dmi'
				sleep(20)
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)+(src.EnergyMax/10)
				src.overlays-='Legendary Shield Aura.dmi'
				src.Chargez("Remove")
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,turn(src.dir,180)))
		//		Z.DragonFist=1
				A.Distance=100
				A.dir=src.dir
				A.icon=Z.sicon
				A.Radius=1
				A.Pushing=1
				A.Pierce=1
			//	A.Explosive=1
				A.Deflectable=0
				A.Knockback=1
				A.Omega=1
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=5
				A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*5000
				src.SkillLeech(Z)
				src.Control=A
				spawn if(A) walk(A,A.dir)
				src.Attacking=0
				src.Beaming=0
				src.TotalFatigue+=5
				Z.Cooldown()

			if("SpiritBomb")
				if(Z.Using)
					return
				var/Drain=500/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)+(src.EnergyMax/10)
				Z.Skill_Increase(10)
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,turn(src.dir,180)))
				A.y=min(A.y+4,500)
				A.Distance=sqrt(Z.Level)*10
				animate(A, transform = matrix()*0.5, time = 0)
				A.dir=src.dir
				A.icon=Z.sicon
				A.Radius=2
				A.Explosive=1
				A.Deflectable=0
				A.Knockback=1
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=30
				A.Offense=(src.Offense*src.OffenseMultiplier)*2//*(src.Skill/3)
				//src.SkillLeech(Z)
				spawn animate(A, transform = matrix()*2, time = 40)
				sleep(40)
				while(A)
					if(!src)break
					step(A,src.dir)
					sleep(10/(sqrt(Z.Level)*sqrt(Z.Level)))
				src.Attacking=0
				src.Beaming=0
				Z.Cooldown()
			if("TsunamiStrike")
				if(Z.Using)
					return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						var/Drain=500/Z.Efficiency
						if(src.Attacking) return
						if(!src.CanBlast(Drain)) return
						src.Attacking=1
						src.Beaming=1
						src.OMessage(20,"[src] unleashes a wave of water!","[src]([src.key]) used Tsunami Strike!")
						flick("Blast",src)
						var/obj/Projectiles/Mystical/A=new(get_step(src,turn(src.dir,180)))
						A.Distance=30
						A.dir=src.dir
						A.icon=Z.sicon
						A.Radius=1
						A.Deflectable=1
						A.Physical=1
						A.icon_state=Z.sicon_state
						A.Owner=src
						A.Lethality=src.Lethal
						A.Elemental="Water"
						A.Damage_Multiplier=10
						//make puddle
						A.Offense=(src.Offense*src.OffenseMultiplier)
						src.SkillLeech(Z)
						//src.Control=A
						src.Energy*=0.75
						spawn if(A) walk(A,A.dir)
						src.Attacking=0
						src.Beaming=0
						Z.Cooldown()
			//		else if(!S.suffix)
				//		src<<"You can't use this without a sword equiped!"
			//			return
			if("GreatDivide")
				if(Z.Using)
					return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						var/Drain=500/Z.Efficiency
						if(src.Attacking) return
						if(!src.CanBlast(Drain)) return
						src.Attacking=1
						src.Beaming=1
						src.Frozen=1
						src.OMessage(20,"[src] swung their blade down with supreme force, parting the ground in front of them!","[src]([src.key]) used Great Divide!")
						flick("Blast",src)
						sleep(20)
						var/obj/Projectiles/Mystical/A=new(get_step(src,turn(src.dir,180)))
						A.Distance=30
						A.dir=src.dir
						A.icon=null
						A.Radius=1
						A.Pierce=1
						A.Deflectable=1
						A.Physical=1
						A.Divide=1
						A.icon_state=Z.sicon_state
						A.Owner=src
						A.Lethality=src.Lethal
						A.Damage_Multiplier=30
						src.Energy*=0.75
						src.Frozen=0
						A.Offense=(src.Offense*src.OffenseMultiplier)*5
						src.SkillLeech(Z)
						//src.Control=A
						spawn if(A) walk(A,A.dir)
						src.Attacking=0
						src.Beaming=0
						src.TotalFatigue+=5
						Z.Cooldown()
				/*	else if(!S.suffix)
						src<<"You can't use this without a sword equiped!"
						return*/
			if("ScarringBreeze")
				if(Z.Using)
					return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						var/Drain=500/Z.Efficiency
						if(src.Attacking) return
						if(!src.CanBlast(Drain)) return
						src.Attacking=1
						src.Beaming=1
						src.overlays+='blackflameaura.dmi'
						sleep(5)
						src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)+(src.EnergyMax/50)
						src.overlays-='blackflameaura.dmi'
						Z.Skill_Increase(10)
						flick("Blast",src)
						var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
						A.Distance=sqrt(Z.Level)*2
						A.icon=Z.sicon
						A.dir=src.dir
						A.Radius=2
						A.Pushing=1
						A.Explosive=0
						A.Physical=1
						A.Deflectable=1
						A.Knockback=1
						A.icon_state=Z.sicon_state
						A.Owner=src
						A.Lethality=src.Lethal
						A.Damage_Multiplier=12
						A.Offense=src.Offense*src.OffenseMultiplier*20
						spawn if(A) walk(A,A.dir)
			/*			while(A)
							if(!src)break
							step(A,src.dir)
							sleep(10/(sqrt(Z.Level)*sqrt(Z.Level)))*/
						src.Attacking=0
						src.Beaming=0
						return
						Z.Cooldown()
			/*		else if(!S.suffix)
						src<<"You can't use this without a sword equiped!"
						return*/
			if("Sokidan")
				if(Z.Using)
					return
				var/Drain=75/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)+(src.EnergyMax/10)
				Z.Skill_Increase(1.75)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,turn(src.dir,180)))
				A.Distance=sqrt(Z.Level)*3
				A.dir=src.dir
				A.icon=Z.sicon
				A.Explosive=1
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=10
				A.Offense=(src.Offense*src.OffenseMultiplier)*(Skill/50)
				A.Elemental=Element
				src.SkillLeech(Z)
				src.Control=A
				while(A)
					if(!src)break
					step(A,src.dir)
					if(prob(20))src.SkillLeech(Z)
					sleep(10/(sqrt(Z.Level)*sqrt(Z.Level)))
				src.Attacking=0
				src.Beaming=0
				Z.Cooldown()
			if("JechtShot")
				if(Z.Using)
					return
				var/Drain=75/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				Z.Skill_Increase(1.75)
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,turn(src.dir,180)))
				A.Distance=100
				A.dir=src.dir
				A.icon=Z.sicon
				A.Physical=1
				A.JechtShot=1
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=6
				A.Offense=(src.Offense*src.OffenseMultiplier)*(Skill/50)
				src.SkillLeech(Z)
				src.Control=A
				while(A)
					if(!src)break
					step(A,src.dir)
					if(prob(20))src.SkillLeech(Z)
					sleep(10/(sqrt(Z.Level)*sqrt(Z.Level)))
				src.Attacking=0
				src.Beaming=0
				src.Energy*=0.85
				Z.Cooldown()
			if("SpiritGun")
				if(Z.Using)
					return
				var/Drain=100/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/10)))
				src.Chargez("Remove")
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(3)
//				src.Energy*=0.95
				/*if(src.SpiritLevel==2)
					src.ManaAmount-=50
				else if(src.SpiritLevel>2)
					src.ManaAmount-=25*/
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.Radius=1
				A.Explosive=1
				A.Deflectable=1
				A.Knockback=1
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=25
				if(src.SpiritWeaponChosen=="Demon Gun")
					A.Elemental="Fire"
				A.Offense=(src.Offense*src.OffenseMultiplier)*2
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				src.TotalFatigue+=20
				src.Energy-=(src.EnergyMax*0.2)
				/*if(src.SpiritLevel<=1)
					src.TotalFatigue+=50
					src.Energy-=(src.EnergyMax*0.5)
				if(src.SpiritLevel==2)
					src.TotalFatigue+=20
					src.Energy-=(src.EnergyMax*0.2)
				if(src.SpiritLevel==3)
					src.TotalFatigue+=10
					src.Energy-=(src.EnergyMax*0.1)
				if(src.SpiritLevel==4)
					src.TotalFatigue+=5
					src.Energy-=(src.EnergyMax*0.05)*/
				Z.Cooldown()
			if("Kikoho")
				if(Z.Using)
					return
				var/Drain=100/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/10)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)

				src.Health-=10
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(3)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.Radius=1
				A.Explosive=1
				A.Deflectable=0
				A.Knockback=1
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=25
				A.Offense=(src.Offense*src.OffenseMultiplier)
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				Z.Cooldown()

			if("ShinKikoho")
				if(Z.Using)
					return
				var/Drain=100/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/10)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)

				src.Health-=20
				src.Base-=src.Base/10
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(3)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.Radius=1
				A.Explosive=1
				A.Deflectable=0
				A.Knockback=1
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=50
				A.Offense=(src.Offense*src.OffenseMultiplier)*2
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				Z.Cooldown()

			if("GigaFlare")
				if(Z.Using)
					return
				var/Drain=50/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/10)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)

				src.Health-=12/(sqrt(Z.Level)/3)
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(3)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.Radius=1
				A.Explosive=1
				A.Deflectable=1
				A.Knockback=1
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=15
				A.Offense=(src.Offense*src.OffenseMultiplier) * 3
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				Z.Cooldown()
			if("DragonNova")
				if(Z.Using)
					return
	//			if(Z.Using) return
				var/Drain=100/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/10)))
				src.Chargez("Remove")
				src.Energy*=0.95
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(3)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.Radius=1
				A.Explosive=1
				A.Deflectable=1
				A.Knockback=1
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=4
				A.Offense=(src.Offense*src.OffenseMultiplier)
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				Z.Cooldown()
			if("LanzaDelRelampago")
				if(Z.Using)
					return
				var/Drain=100/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.ManaAmount<=50) return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/10)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Health-=10/(sqrt(Z.Level)/3)
				src.Attacking=0
				src.Beaming=0
				Z.Skill_Increase(3)
				if(Z.Level<100)
					Z.Level=100
				flick("Blast",src)
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=99
				A.Deflectable=1
				A.Knockback=0
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.SuperExplosive=1
				A.Damage_Multiplier=20
				A.Offense=(src.Offense*src.OffenseMultiplier)*5
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				if(!src.Manakete)
					src.ManaAmount-=40
				Z.Cooldown()
			if("ChaosBlast")
				if(Z.Using)
					return
				var/Drain=7.5/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.Beaming) return
				flick("Blast",src)
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=1
				spawn((src.Refire/Z.Speed*(1/sqrt(Z.Level*Z.Level))*100)+1) src.Attacking=0
				Z.Skill_Increase()
				if(Z.Level<100)
					Z.Level=100
				//if(!prob(Z.Level)) return
				var/numBlasts = 1
				if(prob(66))
				{
					numBlasts++
				}
				if(prob(33))
				{
					numBlasts++
				}
				while(numBlasts)
				{
					var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
					A.Distance=Distance
					A.pixel_y=rand(-16,16)
					A.pixel_x=rand(-16,16)
					A.dir=src.dir
					A.icon=Z.sicon
					A.icon_state=Z.sicon_state
					A.Owner=src
					A.Lethality=src.Lethal
					var/damMult = GoCrand(0.5, 2);
					A.Damage_Multiplier=1 * damMult
					var/offMult = GoCrand(0.5, 2);
					A.Offense=(src.Offense*src.OffenseMultiplier*offMult)
					A.Elemental=Element
					spawn if(A) walk(A,A.dir)
					numBlasts--
				}
				Z.Cooldown()

			if("MagiBolt")
				if(Z.Using)
					return
				EXP+=(EXPGains/100)*0.00004
				var/Drain=5/Z.Efficiency
				if(src.Attacking) return
				if(src.ManaAmount<5) return
				if(src.Beaming) return
				flick("Blast",src)
				src.ManaAmount-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=1
				spawn((src.Refire/Z.Speed*(1/sqrt(Z.Level*Z.Level))*100)+1) src.Attacking=0
				Z.Skill_Increase()
				if(Z.Level<100)
					Z.Level=100
				//if(!prob(Z.Level)) return
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
				A.pixel_y=rand(-16,16)
				A.pixel_x=rand(-16,16)
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=0.3*StaffPower
				A.Offense=(src.Offense*src.OffenseMultiplier)
				A.Elemental=Element
				spawn if(A) walk(A,A.dir)
				src.SkillLeech(Z)
				for(var/mob/X in view(10,usr))
					if(X.MusicToggle=="On")
						X<<sound('kiblast.wav', repeat = 0, wait = 0, channel = 0, volume = 50)
				Z.Cooldown()

			if("Tri-Shot")
				if(Z.Using)
					return
				EXP+=(EXPGains/100)*0.00004
				var/Drain=5/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				flick("Blast",src)
				src.Energy-=Drain/src.Efficiency*300*(1/Z.Level)
				src.Attacking=1
//				Z.Using=1
				spawn((src.Refire/Z.Speed*(1/sqrt(Z.Level*Z.Level))*100)+1) src.Attacking=0
//				spawn(10) Z.Using=0
				Z.Skill_Increase()
				if(Z.Level<100)
					Z.Level=100
				//if(!prob(Z.Level)) return
				var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
				A.Distance=Distance
//				A.pixel_y=rand(-10,10)
//				A.pixel_x=rand(-10,10)
				A.dir=src.dir
				A.icon=Z.sicon
				A.icon_state=Z.sicon_state
				A.Owner=src
				A.Lethality=src.Lethal
				A.Damage_Multiplier=0.5
				A.Offense=(src.Offense*src.OffenseMultiplier)*(src.Skill/2)
				A.Elemental=Element
				var/obj/Projectiles/Mystical/B=new(get_step(src,src.dir))
				B.Distance=Distance
//				B.pixel_y=rand(-10,10)
//				B.pixel_x=rand(-10,10)
				B.dir=turn(src.dir, 135)
				B.icon=Z.sicon
				B.icon_state=Z.sicon_state
				B.Owner=src
				B.Lethality=src.Lethal
				B.Damage_Multiplier=0.5
				B.Offense=(src.Offense*src.OffenseMultiplier)*(src.Skill/2)
				B.Elemental=Element
				var/obj/Projectiles/Mystical/C=new(get_step(src,src.dir))
				C.Distance=Distance
//				C.pixel_y=rand(-10,10)
//				C.pixel_x=rand(-10,10)
				C.dir=turn(src.dir, -135)
				C.icon=Z.sicon
				C.icon_state=Z.sicon_state
				C.Owner=src
				C.Lethality=src.Lethal
				C.Damage_Multiplier=0.5
				C.Offense=(src.Offense*src.OffenseMultiplier)*(src.Skill/2)
				C.Elemental=Element
				spawn
					if(B)
						step(B,turn(B.dir,90))
					if(C)
						step(C,turn(C.dir,-90))
						//step(B,A.dir)
						//step(D,A.dir)
					if(A)
						walk(A,A.dir)
						if(B)walk(B,turn(A.dir, 45))
						if(C)walk(C,turn(A.dir, -45))
				src.SkillLeech(Z)
				Z.Cooldown()
			if("Beam")
				if(src.KO||Blocking)return
				if(Z.Using)
					return
				var/Drain=5/Z.Efficiency
				if(!src.CanBlast(Drain)) return
				if(!Z:Charging&&!Z.BeamUsing&&!src.Attacking)
					src.Beam_Charge(Z)
				else if(Z:Charging&&!Z.BeamUsing)
					src.Beam_Go(Z)
				else if(Z.BeamUsing)
					src.Beam_Stop(Z)
					Z.Cooldown();
				if(Z.Level<100)
					Z.Level=100
			if("Taiyoken")
				if(Z.Using)
					return
				if(src.KO||Blocking)return
				if(src.Energy>=min(src.EnergyMax*(25/sqrt(Z.Level)*sqrt(Z.Level)),src.EnergyMax))
					src.Energy-=min(src.EnergyMax*(25/(sqrt(Z.Level)*sqrt(Z.Level))),src.EnergyMax)
					Z.Skill_Increase(2.5)
					src.SkillLeech(Z)
					var/obj/x=new /obj/Taiyoken
					Z.Cooldown()


					for(var/turf/M in Turf_Circle(src,max(sqrt(Z.Level)*sqrt(Z.Level)/15,1)))
						if(prob(20))continue
						x.icon_state="4"
						M.overlays+=x
						for(var/mob/Q in view(0,M))
							if(Q==src)continue
							Q<<"You are blinded!"
							var/duration=sqrt(src.EnergyMax)/sqrt(Q.EnergyMax)+(sqrt(src.Power)/sqrt(Q.Power))
							duration=max(min(duration,2000),1)
							spawn Q.Blind(duration*sqrt(Z.Level))
						spawn(rand(1,2))M.overlays+=x
						spawn(rand(2,3))M.overlays+=x
						spawn(rand(3,4))M.overlays+=x
						spawn(rand(4,5))M.overlays-=x
						spawn(rand(5,6))M.overlays-=x
						spawn(rand(6,7))M.overlays-=x
						spawn(rand(7,8))M.overlays-=x
						spawn(rand(9,10))M.overlays-=x
						if(prob(10))sleep(0.1)

			if("ChaosTelepath")
			{
				var/list/People=new;
				for(var/mob/Players/m in world)
				{
					if(m.client)
					{
						People += m;
					}
				}
				var/mob/receiver = People[rand(1, People.len)]
				src.CHAOSTwoWayTelepath(receiver);
			}
			if("Telepath")
				var/list/PeopleX=list("Cancel")
				for(var/mob/Players/M in world)
					if(M.client)
						PeopleX+=M
				var/mob/A=input(src,"Telepath who?") in PeopleX||null
				if(A=="Cancel")return
				var/message=input(src,"What do you want to telepath?") as text|null
				if(message==null)
					return
				message=copytext(message,1,500)
				if(A)
					A<<"<font face=Old English Text MT><font color=red>[src] says in telepathy, '[html_encode(message)]'"
					A.OMessage(0,null,"<font color=purple>[A]([A.key]) received the telepath '[html_encode(message)]' from [src]([src.key])")
				if(src)
					src<<"<font face=Old English Text MT><font color=red>You telepathed [A], '[html_encode(message)]'"
					src.OMessage(0,null,"<font color=purple>[src]([src.key]) telepathed '[html_encode(message)]' to [A]([A.key])")
			if("PowerUp")
				if(src.KO)return
				if(src.PowerUp)
					src.Transform()
					if(src.FrenzyLevel>2 && FrenzySuper==2)
						spawn()DarknessFlash(src)
				/*		spawn()for(var/turf/e in range(20,src))
							if(prob(60))continue
							if(prob(5))spawn()new/obj/Effects/RedLightning(e)
							if(prob(50))sleep(0.3)
							Quake(10)
							Quake(20)
							spawn()Crater(src)*/
						src.Base*=2
						src.BaseMod*=2
						src.PlusPower+=50000000
						src.OMessage(15,"[src] enters a extremely frenzied state!","<font color=red>[src]([src.key]) Activates Super Frenzy 3.")
						//sleep(10)
						src.FrenzySuper=3


					else if(src.FrenzyLevel>1 && FrenzySuper==1)
						spawn()DarknessFlash(src)
			/*			spawn()for(var/turf/e in range(20,src))
							if(prob(60))continue
							if(prob(5))spawn()new/obj/Effects/RedLightning(e)
							if(prob(50))sleep(0.3)*/
						src.Base*=1.5
						src.BaseMod*=1.5
						src.PlusPower+=35000000
						src.OMessage(15,"[src] enters a severely frenzied state!","<font color=red>[src]([src.key]) Activates Super Frenzy 2.")
						//sleep(10)
						src.FrenzySuper=2

					else if(src.FrenzyLevel>0 && FrenzySuper==0)//SUPER FRENZY SHIT HERE
						spawn()DarknessFlash(src)
						src.Base*=1.5
						src.BaseMod*=1.5
						src.PlusPower+=15000000
						src.OMessage(15,"[src] enters a highly frenzied state!","<font color=red>[src]([src.key]) Activates Super Frenzy.")
						//sleep(10)
						src.FrenzySuper=1
					return
				if(!src.PowerUp&&!src.PowerDown)
					src.PowerUp=1
					src<<"You begin powering up."
					for(var/mob/X in view(10,usr))
						if(X.MusicToggle=="On")
							X<<sound('aura.wav', repeat = 0, wait = 0, channel = 0, volume = 50)
					src.Auraz("Add")
				if(src.PowerDown&&!src.PowerUp)
					src<<"You stop powering down."
					src.Auraz("Remove")
					src.PowerDown=0
			if("PowerDown")
				if(src.KO)return
				if(src.PowerDown)
					src.Revert()
					src.Auraz("Add")
					if(src.FrenzyLevel>0 && FrenzySuper==1)//SUPER FRENZY SHIT HERE
						src.Base/=1.5
						src.BaseMod/=1.5
						src.PlusPower-=15000000
						src.OMessage(15,"[src] drops to a mildly frenzied state.","<font color=red>[src]([src.key]) Deactivates Super Frenzy.")
						//sleep(10)
						src.FrenzySuper=0

					if(src.FrenzyLevel>1 && FrenzySuper==2)
						src.FrenzySuper=1
						src.Base/=1.5
						src.BaseMod/=1.5
						src.PlusPower-=35000000
						src.OMessage(15,"[src] drops to a highly frenzied state.","<font color=red>[src]([src.key]) Deactivates Super Frenzy 2.")
						//sleep(10)
						src.FrenzySuper=1

					if(src.FrenzyLevel>2 && FrenzySuper==3)
						src.Base/=2
						src.BaseMod/=2
						src.PlusPower-=50000000
						src.OMessage(15,"[src] drops to a severely frenzied state.","<font color=red>[src]([src.key]) Deactivates Super Frenzy 3.")
						sleep(10)
						src.FrenzySuper=2
					return
				if(!src.PowerDown&&!src.PowerUp)
					src.PowerDown=1
					src<<"You begin powering down."
					for(var/mob/X in view(10,usr))
						if(X.MusicToggle=="On")
							X<<sound('powerup.wav', repeat = 0, wait = 0, channel = 0, volume = 50)
					src.Auraz("Add")
				if(src.PowerUp)
					src.PowerUp=0
					src<<"You stop powering up."
					src.Auraz("Remove")
			if("PowerRecovery")
				if(!src.PowerRecovery)
					if(src.ControlPower>=101)return
					src.Frozen=1
					if(src.AfterImageStrike>0)
						src.AfterImageStrike=0
						for(var/obj/Skills/Rank/AfterImageStrike/AIS in src.contents)
							AIS.Cooldown()
					if(src.WildSense)
						src.WildSense=0
						for(var/obj/Skills/Rank/WildSense/WS in src.contents)
							WS.Cooldown()
					sleep(20)
					src.PowerRecovery=1
					src.Auraz("Remove")
					src.Auraz("Add")
			//		src.Recovery*=4
					src<<"You begin recovering your energy."
				else
					src.Auraz("Remove")
			//		src.Recovery/=4
					src.Frozen=0
					src.PowerRecovery=0
					src<<"You stop recovering your energy."

			if("RestoreYouth")
				var/list/PeopleX=new
				for(var/mob/Players/M in get_step(src,dir))
					PeopleX+=M
				var/mob/A=input(src,"Restore the Youth of who?") in PeopleX||null
				if(A)
					var/amount=input(src,"To what age?","(0-20)")as num
					amount=max(min(amount,20),0.1)
					A.Age=amount
					src.OMessage(10,"[src] restored the youth of [A].","<font color=red>[src]([src.key]) restored the youth of [A]([A.key]) to [amount]")
			if("Reincarnate")
				var/list/PeopleX=new
				for(var/mob/Players/M in get_step(src,dir))
					PeopleX+=M
				var/mob/A=input(src,"Reincarnate who?") in PeopleX||null
				if(A)
					src.OMessage(10,"[src] reincarnated [A].","<font color=red>[src]([src.key]) REINCARNATED [A]([A.key])")
					var/obj/Reincarnate/x=new
					x.Rein=A.key
					x.RBase=(A.Base/A.BaseMod) * 0.8
					x.REnergy=(A.EnergyMax/A.EnergyMod) * 0.8
					x.loc=locate(1,1,13)
					A<<"Relog quickly to reincarnate!"

					spawn()del(A)

			if("Revive")
				if(src.KO||Blocking)return
				if(Z:LockedUntil > world.realtime)
					src << "You cannot use this yet."
					return
				var/list/PeopleX= list("Cancel")
				for(var/mob/Players/M in get_step(src,dir))
					if(M.Dead)
						PeopleX+=M
				var/mob/A=input(src,"Revive who?") in PeopleX||null
				if(A)
					Z:Uses++
					Z:LockedUntil=world.realtime+3*(((600 * 60) * 24)*Z:Uses)
					src.OMessage(10,"[A] was revived by [src].","<font color=red>[src]([src.key]) revived [A]([A.key])")
					src.Energy=1
					A.Dead=0
					A.overlays-='Halo.dmi'
					if(prob(50))
						src.Death(src)
					if(locate(/obj/Skills/Rank/KaioRevive, A))
						src.Death(src)
			if("StarRevive")
				if(MakyoStar)
					if(src.KO||Blocking)return
					var/list/PeopleX=new
					for(var/mob/Players/M in get_step(src,dir))
						if(M.Dead)
							PeopleX+=M
					var/mob/A=input(src,"Revive who?") in PeopleX||null
					if(A)
						Z:LastTime=Year
						src.OMessage(10,"[A] was revived by [src].","<font color=red>[src]([src.key]) revived [A]([A.key])")
						A.Dead=0
						A.overlays-='Halo.dmi'
				else
					src<<"You can only use this during the Makyo Star!"
					return

/*			if("RedHotOneHundred")
				if(src.KO||Z.Using||src.Blocking)return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						return
				Z.Using=1
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] yells: <b>RED HOT... ONE HUNDRED!!!</b>"
				sleep(10)
				src.AsaKujaku=30
				sleep(20)
				if(!src.Frozen)
					src.AsaKujaku=0
					src<<"Your hands burn red..."
				//spawn(100) src.GetDunked=0
				src.TotalFatigue+=5
				Z.Cooldown()

			if("RedKick")
				if(!locate(/obj/Items/RedVWatch, src))
					return
				if(src.KO||Z.Using==1||src.Frozen)return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						usr<< "Hitting with the blunt side of a sword would probably break it."
						return
				if(src.Energy>EnergyMax/10)
					Z.Using=1
					var/wait = rand(200, 800)
					spawn(wait)
						if(src)
							Z.Using=0
							src<<"360 Kick CD finished."
					SweepingKick(src)
					src.OMessage(20,"[src] sweeps their foot around them!","[src]([src.key]) performs a wide kick!")
					for(var/mob/P in view(2))
						var/Damage=(src.Power*(src.Strength*src.StrengthMultiplier))/(P.Power*(P.Endurance*P.EnduranceMultiplier)/2)
						var/Accuracy=((src.Offense*src.OffenseMultiplier)/(P.Defense*P.DefenseMultiplier))*75
						if(P!=src)
							if(prob(Accuracy)&&!P.GER)
								HitEffect(P)
								if(src.DiplomaticImmunity || P.DiplomaticImmunity)
									Damage*=0
								P.Health-=Damage
								P.Knockback(1,src)
								Stun(P,amount=3)
							src.Energy-=src.EnergyMax/50
					sleep(50)

			if("JetSlash")
				if(Z.Using)
					return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						var/Drain=500/Z.Efficiency
						if(src.Attacking) return
						if(!src.CanBlast(Drain)) return
						src.Attacking=1
						src.Beaming=1
						src.overlays+='blackflameaura.dmi'
						sleep(10)
						src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)+(src.EnergyMax/50)
						src.overlays-='blackflameaura.dmi'
						Z.Skill_Increase(10)
						flick("Blast",src)
						var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
						A.Distance=sqrt(Z.Level)*2
						A.icon=Z.sicon
						A.dir=src.dir
						A.Radius=1
						A.Pushing=1
						A.Explosive=0
						A.Physical=1
						A.Deflectable=1
						A.Knockback=1
						A.icon_state=Z.sicon_state
						A.Owner=src
						A.Lethality=src.Lethal
						A.Damage_Multiplier=20
						A.Offense=src.Offense*src.OffenseMultiplier*5
						spawn if(A) walk(A,A.dir)
			/*			while(A)
							if(!src)break
							step(A,src.dir)
							sleep(10/(sqrt(Z.Level)*sqrt(Z.Level)))*/
						src.Attacking=0
						src.Beaming=0
						return
						Z.Cooldown()*/

			if("UnBind")
				if(Z:LastTime)
					if(Day<Z:LastTime+3)
						src<<"You cannot use this until day [Z:LastTime+3]."
						return

				var/list/PeopleX=new
				for(var/mob/Players/M in get_step(src,dir))
					PeopleX+=M
				var/mob/A=input(src,"UnBind who?") in PeopleX||null
				if(A)
					for(var/obj/Curse/Q in A)
						Z:LastTime=Year
						Q.Power-=src.Power*src.Energy
						if(Q.Power<=0)
							src.OMessage(10,"[A] was unbinded from hell by [src].","<font color=red>[src]([src.key]) unbinded(broke bind) [A]([A.key])")
							del(Q)
						else
							src.OMessage(10,"[src] was lessened the bind on [A].","<font color=red>[src]([src.key]) unbinded(failed, lessened) [A]([A.key])")
						src.Energy=1

			if("Bind")
				var/list/PeopleX=new
				for(var/mob/Players/M in get_step(src,dir))
					PeopleX+=M
				var/mob/A=input(src,"Bind who?") in PeopleX||null
				if(A)
					if(src.Power*src.Energy<A.Power*A.Energy)
						src.OMessage(10,"[A] deflected [src]'s bind!","<font color=red>[src]([src.key]) bind was failed and deflecte by [A]([A.key])")
						return
					for(var/obj/Curse/Q in A)
						Q.Power+=src.Power*src.Energy
						src.OMessage(10,"[src] increased the power of the current bind on [A].","<font color=red>[src]([src.key]) binded(to hell strengethened) [A]([A.key])")
						src.Energy=1
						return
					src.OMessage(10,"[A] was binded to hell by [src].","<font color=red>[src]([src.key]) binded(to hell) [A]([A.key])")
					var/obj/Curse/L=new
					L.Power=src.Power*src.Energy
					A.contents+=L
					src.Energy=1

			/*if("BindToPlanet")
				var/list/PeopleX=new
				for(var/mob/Players/M in get_step(src,dir))
					PeopleX+=M
				var/mob/A=input(src,"Bind who?") in PeopleX||null
				if(A)
					var/zz
					var/Where=input(src,"Choose Destination", "", text) in list ("Earth", "Namek", "Vegeta", "Ice", "Arconia","Nevermind")
					switch(Where)
						if("Earth")
							zz=6
						if("Dead Zone")
							zz=3
						if("Nigeria")
							zz=5
						if("Space Paranoids")
							zz=7
						if("North Pole")
							zz=4
						if("Nevermind") return
					src.OMessage(10,"[A] was binded to hell by [src].","<font color=red>[src]([src.key]) binded(to hell) [A]([A.key])")
					var/obj/PlanetBind/L=new
					L.YearUsed=Year
					L.Planet=zz
					A.contents+=L*/
			if("FalseMoon")
				if(Z.Using)
					return
				if(src.KO||Blocking)return
				src.OMessage(10,"[src] conjures up a ball of energy into his palm and chucks it into the sky!.","[src]([src.key]) made a false moon!")
				var/obj/ProjectionMoon/Q=new(src.loc)
				Q.Skill=15000
				Z.Cooldown()
			if("Shield")
				if(src.KO||Blocking)return
				if(!Z.BuffUsing)
					src.overlays+=image(icon='Shield.dmi',pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					Z.BuffUsing=1
				else if(Z.BuffUsing)
					src.overlays-=image(icon='Shield.dmi',pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					Z.BuffUsing=0
			if("Zanzoken")
				if(!Z.Using)
					//src<<"gata go fas"
					if(src.Blocking||!src.Target)
						src.ActiveZanzo=3 //3 additional steps take
					else
						if(src.Target in oview(15,src))
							if(src.Target:Knockbacked)
								var/KBdir=src.Target:Knockbacked
								src.Target:Knockbacked=0
								AfterImage(src)
								src.Move(get_step(src.Target,KBdir))
								src.dir=get_dir(src,src.Target)
								src.Attacking=0
								src.AttackHardness=2
								src.HeavyShot=1
								spawn(20)
									src.HeavyShot=0

							else
								src.Move(get_step(src.Target,turn(src.Target:dir,180)))
					Z.Cooldown()

			if("Walking")
				if(!Z.Using)
					Z.Using=1
					src << "You concentrate ki into your legs and feet..."
					return
				else
					Z.Using=0
					src << "You stop concentrating ki into your legs and feet."
					return

			if("Wild Sense")
				if(src.KO||Blocking)return
				if(Z.Using) return
				if(src.TimeFrozen)return
					//src<<"gata go fas"
				Z.Using=1
				src.WildSense=1
				src<<"Wild Sense Active"
			if("GunKata")
				if(!Z.BuffUsing)
					for(var/obj/Items/Sword/S in usr)
						if(!S.suffix)
							return
					if(src.ActiveBuffs>=2) return
					src.ActiveBuffs+=3
					src.GunKata=1
					src<<"Gun Kata is enabled."
					src.OMessage(10,"[src] brandished a gun to go along with their sword!","[src]([src.key]) began using Gun Kata")
					src.Power_Multiplier+=0.35
					Z.BuffUsing=1
				else
					src.ActiveBuffs-=3
					src.GunKata=0
					src<<"Gun Kata is disabled."
					src.OMessage(10,"[src] holstered and sheathed their weapons!","[src]([src.key]) stopped using Gun Kata")
					src.Power_Multiplier-=0.35
					Z.BuffUsing=0
			if("Mysticize")
				var/list/PeopleX=new
				for(var/mob/M in get_step(src,dir))
					if(src.Race=="Makaioshin")
						if(!M.Mystic)
							PeopleX+=M
					else
						if(!M.Majin&&!M.Mystic)
							PeopleX+=M
				var/mob/A=input(src,"Mystize who?") in PeopleX||null
				if(A)
					if(A.Class=="Spiral")
						src.OMessage(10,"[A] deflected [src]'s attempted Mystification!..","<font color=red>[src]([src.key]) couldn't Mysticize [A]([A.key])")
						return
					if(A.CursedAlpha||A.CursedBeta)
						src.OMessage(10,"[A] screams as the mysticization tears them apart!..","<font color=red>[src]([src.key]) couldn't Mysticize [A]([A.key])")
						A.Health-=80
						return
					src.OMessage(10,"[A] was Mysticized by [src]..","<font color=red>[src]([src.key]) Mysticized [A]([A.key])")
					A.Mystic=1
					A.contents+=new/obj/Skills/Buffs/Mystic
			if("Majinize")
				var/list/PeopleX=new
				for(var/mob/M in get_step(src,dir))
					if(src.Race=="Makaioshin")
						if(!M.Majin)
							PeopleX+=M
					else
						if(!M.Majin&&!M.Mystic)
							PeopleX+=M
				var/mob/A=input(src,"Majinize who?") in PeopleX||null
				if(A)
					if(A.Class=="Spiral")
						src.OMessage(10,"[A] deflected [src]'s attempted Majinization!..","<font color=red>[src]([src.key]) couldn't Majinize [A]([A.key])")
						return
					if(A.CursedAlpha||A.CursedBeta)
						src << "They are already cursed..."
						return
					src.OMessage(10,"[A] was Majinized by [src]..","<font color=red>[src]([src.key]) Majinized [A]([A.key])")
					A.Majin=1
					A.contents+=new/obj/Skills/Buffs/Majin
			if("MakeAmulet")
				if(src.Energy>src.EnergyMax/10)
					var/obj/A=new/obj/Items/Amulet
					src.contents+=A
					src.OMessage(10,"[src] made an Amulet.","<font color=red>[src]([src.key]) made an Amulet.")
					src.Energy-=src.EnergyMax/10
			if("SacredEnergyArmor")
				if(!Z.BuffUsing)
					for(var/obj/Items/Sword/S in usr)
						if(S.suffix)
							usr<< "Can't use this with a sword."
							return
					src.see_invisible=1
					if(src.ActiveBuffs>=2) return
					src.ActiveBuffs+=3
					var/list/SacredEnergyArmor=list("Defense","Offense")
					SacredEnergyArmor.Add("Cancel")
					var/obj/selection=input("")in SacredEnergyArmor
					if(selection=="Cancel")
						src.ActiveBuffs-=3
						return
					if(selection=="Defense")
						src.SacredEnergy="Defense"
					if(selection=="Offense")
						src.SacredEnergy="Offense"
					src.Power_Multiplier+=0.5
					if(src.SacredEnergy=="Defense")
						src.EnduranceMultiplier*=1.75
						src.ResistanceMultiplier*=1.75
						src.StrengthMultiplier*=1.25
						src.ForceMultiplier*=1.25
					if(src.SacredEnergy=="Offense")
						src.StrengthMultiplier*=1.75
						src.ForceMultiplier*=1.75
						src.SpeedMultiplier*=1.35
					src.overlays-=Z.sicon
					src.overlays+=Z.sicon
					Z.BuffUsing=1
					src.ActiveBuffs-=1
					src.OMessage(10,"[src] surrounded their body in an armor consisting of an unknown energy! The armor seems to be based on [src.SacredEnergy].","<font color=red>[src]([src.key]) activated Sacred Energy Armor.")
				else

					src.Power_Multiplier-=0.5
					if(src.SacredEnergy=="Defense")
						src.EnduranceMultiplier/=1.75
						src.ResistanceMultiplier/=1.75
						src.StrengthMultiplier/=1.25
						src.ForceMultiplier/=1.25
					if(src.SacredEnergy=="Offense")
						src.StrengthMultiplier/=1.75
						src.ForceMultiplier/=1.75
						src.SpeedMultiplier/=1.35
					src.ActiveBuffs-=2
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					src.overlays-=Z.sicon
					src.OMessage(10,"[src] deactivated the armor.","<font color=red>[src]([src.key]) deactivated Sacred Energy Armor.")
					Z.BuffUsing=0
				sleep(10)

			if("OlympianFury")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=2) return
					src.ActiveBuffs+=3
					var/list/OFClass=list("Zeus","Hercules","Hades")
					if(src.trans["unlocked"]>=2)
						OFClass.Add("Mantra")
					OFClass.Add("Cancel")
					var/obj/selection=input("")in OFClass
			//		switch(input("Please select a new style. Zeus boosts your Force, Recovery, and Defense, but costs you much of your anger, much like a Kaio. Hercules boosts one's physical offensive stats at the cost of making you more frail, causing you to become more human-esque. Hades offers a higher BP boost than the other classes and raises your regeneration. Asura boosts your defensive stats and anger.") in list("Zeus", "Hercules", "Hades", "Asura"))
			//			src.DemiType==src.Class
					if(selection=="Cancel")
						src.ActiveBuffs-=3
						return
					if(selection=="Zeus")
						src.Class="Zeus"
					if(selection=="Hercules")
						src.Class="Hercules"
					if(selection=="Hades")
						src.Class="Hades"
					if(selection=="Asura")
						src.Class="Asura"
					if(selection=="Mantra")
						src.Class="Mantra"
					src.BaseMod*=2
					src.Base*=2
					if(src.Base>=17500*src.BaseMod && src.OFUnlocked)
						src.PlusPower+=10000000
					if(src.Class=="Zeus")
						src.ForceMultiplier*=2.3
						src.RecoveryMultiplier*=2.3
						src.EnergyMax *= 2
						src.Energy *= 2
						src.EnergyMod*=2
					if(src.Class=="Hercules")
						src.StrengthMultiplier*=2
						src.OffenseMultiplier*=1.25
						src.DefenseMultiplier*=1.25
						src.Power_Multiplier += 0.5
					if(src.Class=="Hades")
						src.Power_Multiplier+=0.75
						src.Regeneration*=1.5
						src.EnduranceMultiplier*=1.3
						src.ResistanceMultiplier*=1.3
					if(src.Class=="Asura")
						src.AngerMax=1.05
						src.Anger=src.AngerMax
					if(src.Class=="Mantra")
						src.ForceMultiplier*=2
						src.RecoveryMultiplier*=1.5
						src.EnduranceMultiplier*=1.2
						src.ResistanceMultiplier*=1.2
						src.StrengthMultiplier*=1.5
						src.SpeedMultiplier*=1.25
						src.EnergyMax*=1.25
						src.Energy*=1.25
						src.EnergyMod*=1.25
						src.Power_Multiplier+=0.25
					src.overlays-=Z.sicon
					src.overlays+=Z.sicon
					Z.BuffUsing=1
					src.ActiveBuffs-=1
					src.SetVars()
					src.see_invisible=1
					src.OMessage(10,"[src] releases the wrath of their inner god!","<font color=red>[src]([src.key]) activated Olympian Fury.")
				else
					src.BaseMod/=2
					src.Base/=2
					if(src.Base>=17500*src.BaseMod  && src.OFUnlocked)
						src.PlusPower-=10000000
					if(src.Class=="Zeus")
						src.ForceMultiplier/=2.3
						src.RecoveryMultiplier/=2.3
						src.EnergyMax/=2
						src.Energy/=2
						src.EnergyMod/=2
					if(src.Class=="Hercules")
						src.StrengthMultiplier/=2
						src.OffenseMultiplier/=1.25
						src.DefenseMultiplier/=1.25
						src.Power_Multiplier-=0.5
					if(src.Class=="Hades")
						src.Power_Multiplier-=0.75
						src.Regeneration/=1.5
						src.EnduranceMultiplier/=1.3
						src.ResistanceMultiplier/=1.3
					if(src.Class=="Asura")
						src.AngerMax=1.5
						src.Anger=0
					if(src.Class=="Mantra")
						src.ForceMultiplier/=2
						src.RecoveryMultiplier/=1.5
						src.EnduranceMultiplier/=1.2
						src.ResistanceMultiplier/=1.2
						src.StrengthMultiplier/=1.5
						src.SpeedMultiplier/=1.25
						src.Power_Multiplier-=0.25
						src.EnergyMax/=1.25
						src.Energy/=1.25
						src.EnergyMod/=1.25
					src.ActiveBuffs-=2
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					src.overlays-=Z.sicon
					src.see_invisible=0
					src.OMessage(10,"[src] calms their fury down.","<font color=red>[src]([src.key]) deactivated Olympian Fury.")
					Z.BuffUsing=0
				sleep(10)
			if("Stance")
				if(!Z.BuffUsing)
					/*for(var/obj/Skills/Swords/WeaponMaster/P in src) if(P.BuffUsing)
						src<< "Stances and sword buffs cannot be used together."
						return
					for(var/obj/Skills/Buffs/WeaponSoul/P in src) if(P.BuffUsing)
						src<< "Stances and sword buffs cannot be used together."
						return*/
					if(src.StanceLock==1)
						src<<"You're trying to set a stance at the same time as activating one. Don't do that."
						return
					src.BuffCalc=1.5
					if(locate(/obj/Skills/TierS/SpiritEnergyNu,src)&&src.SpiritWeaponChosen!="Style")
						src.BuffCalc*=1.1
					if(src.SpiritWeaponChosen=="Style"&&src.SpiritLevel<4)
						src.BuffCalc*=1.2
					if(src.SpiritWeaponChosen=="Style"&&src.SpiritLevel>=4)
						src.BuffCalc*=1.25
					if(locate(/obj/Skills/TierS/DemonEnergy,src)&&src.SpiritLevel>=2)
						src.BuffCalc*=1.15
					for(var/obj/Items/Sword/S in usr)
						if(S.suffix)
							src<<"Stances are more for punching people in the face, not stabbing them. No swords allowed."
							return
					if(src.Stance in list("Dragon","Tiger","Phoenix","Tortoise","DrunkenFist"))
						if(src.ActiveBuffs>=1)
							return
					if(src.Stance=="Turtle")
						src.EnduranceMultiplier*=src.BuffCalc
						src.ResistanceMultiplier*=src.BuffCalc
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src] switches to Turtle Stance!","<font color=red>[src]([src.key]) activated Stance (Turtle).")
					else if(src.Stance=="Training")
						src.StrengthMultiplier*=0.01
						src.OffenseMultiplier*=0.01
						src.ForceMultiplier*=0.01
						src.SpeedMultiplier*=3
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src] switches to a more relaxed stance ideal for training.","<font color=red>[src]([src.key]) activated Stance (Training).")

					else if(src.Stance=="Cheetah")
						src.StrengthMultiplier*=src.BuffCalc
						src.SpeedMultiplier*=src.BuffCalc
						if(src.Race!="Neko"&&src.Race!="Throwback")
							src.OffenseMultiplier*=0.50
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src] switches to Cheetah Stance! Meow.","<font color=red>[src]([src.key]) activated Stance (Cheetah).")
					else if(src.Stance=="Horse")
						src.SpeedMultiplier*=5
						src.OffenseMultiplier*=2
						src.DefenseMultiplier*=2
						src.StrengthMultiplier*=0.01
						src.ForceMultiplier*=0.01
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src] suddenly grows a giant penis as they enter The Horse Stance!","<font color=red>[src]([src.key]) activated Stance (Horse).")
					else if(src.Stance=="Bat")
						src.ForceMultiplier*=src.BuffCalc
						src.StrengthMultiplier*=src.BuffCalc
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src] switches to Bat Stance!","<font color=red>[src]([src.key]) activated Stance (Bat).")
					else if(src.Stance=="Ripple")
						src.DefenseMultiplier*=src.BuffCalc
						src.OffenseMultiplier*=src.BuffCalc
						src.SpeedMultiplier*=(src.BuffCalc/2)
						src.EnergyMod*=1.5
						src.EnergyMax*=1.5
						src.Energy*=1.5
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src] strikes a pose, activating the Ripple!","<font color=red>[src]([src.key]) activated Stance (Ripple).")

					else if(src.Stance=="BlackLeg")
						src.StrengthMultiplier*=src.BuffCalc
						src.OffenseMultiplier*=src.BuffCalc
						src.EnduranceMultiplier*=1.25
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src] starts kicking like a pimp!","<font color=red>[src]([src.key]) activated Stance (Black Leg).")

					else if(src.Stance=="Circulation")
						src.ResistanceMultiplier*=2
						src.SpeedMultiplier*=src.BuffCalc
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src]'s ki steams visibly from their fists!","<font color=red>[src]([src.key]) activated Stance (Circulation).")

					else if(src.Stance=="Southpaw")
						src.EnduranceMultiplier*=src.BuffCalc
						src.OffenseMultiplier*=src.BuffCalc
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src] puts their fists up infront of their face..!?","<font color=red>[src]([src.key]) activated Stance (Southpaw).")

					else if(src.Stance=="StrongFist")
						src << "Stop trying so hard, Bonga."
						src.EnduranceMultiplier*=src.BuffCalc
						src.StrengthMultiplier*=src.BuffCalc
						src.SpeedMultiplier*=1.25
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src] clenches their fists tightly, holding one out towards their opponent while keeping the other down by their side...?","<font color=red>[src]([src.key]) activated Stance (Strong Fist).")

					else if(src.Stance=="Crane")
						src.ForceMultiplier*=src.BuffCalc
						src.OffenseMultiplier*=src.BuffCalc
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src] switches to Crane Stance!","<font color=red>[src]([src.key]) activated Stance (Crane).")

					/*else if(src.Stance=="Breaker")
						src.WeaponBreaker=1
						src.StrengthMultiplier*=1.15
						src.OffenseMultiplier*=0.8
						src.DefenseMultiplier*=1.15
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src] switches to the Weapon Breaker stance!","<font color=red>[src]([src.key]) activated Stance (Breaker).")
					*/
					else if(src.Stance=="Wolf")
						src.StrengthMultiplier*=src.BuffCalc
						src.OffenseMultiplier*=src.BuffCalc
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src] switches to Wolf Stance!","<font color=red>[src]([src.key]) activated Stance (Wolf).")
					else if(src.Stance=="Armadillo")
						src.DefenseMultiplier*=src.BuffCalc
						src.EnduranceMultiplier*=src.BuffCalc
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src] switches to Armadillo Stance!","<font color=red>[src]([src.key]) activated Stance (Armadillo).")
					else if(src.Stance=="Resshuken")
						if(src.SpiritWeaponChosen=="Style"&&src.SpiritLevel<4)
							src.StrengthMultiplier*=1.56
							src.EnduranceMultiplier*=1.56
							src.ForceMultiplier*=1.56
							src.ResistanceMultiplier*=1.56
							src.OffenseMultiplier*=1.56
							src.DefenseMultiplier*=1.56
						else if(src.SpiritWeaponChosen=="Style"&&src.SpiritLevel>=4)
							src.StrengthMultiplier*=1.625
							src.EnduranceMultiplier*=1.625
							src.ForceMultiplier*=1.625
							src.ResistanceMultiplier*=1.625
							src.OffenseMultiplier*=1.625
							src.DefenseMultiplier*=1.625
						src.StanceActive=1
						Z.BuffUsing=1
						src.OMessage(10,"[src] switches to Resshuken Stance!","<font color=red>[src]([src.key]) activated Stance (Resshuken).")
					else if(src.Stance=="Fox")
					{
						src.ForceMultiplier*=2
						src.OffenseMultiplier*=1.25
						src.DefenseMultiplier*=1.25
						src.StanceActive=1
						Z.BuffUsing=1
						src.OMessage(10,"[src] switches to Fox Stance! Kyoon.","<font color=red>[src]([src.key]) activated Stance (Fox).")
					}
					else if(src.Stance=="Dragon")
						if(src.ActiveBuffs>0)
							src << "Turn off your buffs first."
							return
						src.ActiveBuffs+=3
						src.Power_Multiplier+=0.75
						src.ForceMultiplier*=1.4
						src.StrengthMultiplier*=1.5
						src.EnduranceMultiplier*=1.25
						src.ResistanceMultiplier*=1.25
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src] switches to Azure Dragon Stance!","<font color=red>[src]([src.key]) activated Stance (Dragon).")
					else if(src.Stance=="Tortoise")
						if(src.ActiveBuffs>0)
							src << "Turn off your buffs first."
							return
						src.ActiveBuffs+=3
						src.Power_Multiplier+=0.75
						src.StrengthMultiplier*=1.25
						src.EnduranceMultiplier*=1.75
						src.ResistanceMultiplier*=1.75
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src] switches to Black Tortoise Stance!","<font color=red>[src]([src.key]) activated Stance (Tortoise).")
					else if(src.Stance=="Tiger")
						if(src.ActiveBuffs>0)
							src << "Turn off your buffs first."
							return
						src.ActiveBuffs+=3
						src.Power_Multiplier+=0.5
						src.SpeedMultiplier*=1.25
						src.StrengthMultiplier*=1.75
						src.ForceMultiplier*=1.25
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src] switches to White Tiger Stance!","<font color=red>[src]([src.key]) activated Stance (Tiger).")
					else if(src.Stance=="Phoenix")
						if(src.ActiveBuffs>0)
							src << "Turn off your buffs first."
							return
						src.ActiveBuffs+=3
						src.Power_Multiplier+=0.75
						src.RecoveryMultiplier*=1.75
						Z.BuffUsing=1
						src.StanceActive=1
						src.OMessage(10,"[src] switches to Vermillion Bird Stance!","<font color=red>[src]([src.key]) activated Stance (Phoenix).")
					else if(src.Stance=="DrunkenFist")
						if(src.ActiveBuffs)
							src << "Fuck off you English cunt, buffs and all..."
							return
						src.ActiveBuffs+=3
						src.Power_Multiplier+=0.75
						src.StrengthMultiplier*=1.5
						src.SpeedMultiplier*=1.25
						src.DefenseMultiplier*=1.75
						Z.BuffUsing=1
						src.StanceActive=1
						src.BerserkerInsanity=1
						spawn(1) src.Pippin()
						src.OMessage(10,"[src] switches to Drunken Fist Stance!","<font color=red>[src]([src.key]) activated Stance (Drunken Fist).")
					else if(src.Stance=="Ansatsuken")
						if(src.ActiveBuffs)
							src << "You can't use Ansatsuken with a buff on."
							return
						src.ActiveBuffs+=3
						src.StanceActive=1
						Z.BuffUsing=1
						if(src.AnsatsukenMod==1)
							src.Power_Multiplier+=0.5
							src.StrengthMultiplier*=1.3
							src.EnduranceMultiplier*=1.25
							src.ForceMultiplier*=1.3
							src.SpeedMultiplier*=1.05
							src.OffenseMultiplier*=1.3
							src.DefenseMultiplier*=1.3
							src.OMessage(10,"[src] switches to Ansatsuken Stance!","<font color=red>[src]([src.key]) activated Stance (Ansatsuken T1).")
						if(src.AnsatsukenMod==2)
							src.Power_Multiplier+=0.6
							src.StrengthMultiplier*=1.4
							src.EnduranceMultiplier*=1.3
							src.ForceMultiplier*=1.4
							src.ResistanceMultiplier*=1.15
							src.SpeedMultiplier*=1.05
							src.OffenseMultiplier*=1.4
							src.DefenseMultiplier*=1.4
							src.OMessage(10,"[src] switches to Ansatsuken Stance!","<font color=red>[src]([src.key]) activated Stance (Ansatsuken T2).")
						if(src.AnsatsukenMod==3)
							src.Power_Multiplier+=0.65
							src.StrengthMultiplier*=1.45
							src.EnduranceMultiplier*=1.35
							src.ForceMultiplier*=1.45
							src.ResistanceMultiplier*=1.25
							src.SpeedMultiplier*=1.1
							src.OffenseMultiplier*=1.45
							src.DefenseMultiplier*=1.45
							src.OMessage(10,"[src] switches to Ansatsuken Stance!","<font color=red>[src]([src.key]) activated Stance (Ansatsuken T3).")
						if(src.AnsatsukenMod>3)
							if(src.AmatsukenAscension=="Chikara no Hado")
								src.Power_Multiplier+=0.75
								src.StrengthMultiplier*=1.5
								src.EnduranceMultiplier*=1.4
								src.ForceMultiplier*=1.5
								src.ResistanceMultiplier*=1.4
								src.SpeedMultiplier*=1.15
								src.OffenseMultiplier*=1.5
								src.DefenseMultiplier*=1.5
								src.OMessage(10,"[src] switches to Chikara Stance!","<font color=red>[src]([src.key]) activated Stance (Ansatsuken T4).")

							if(src.AmatsukenAscension=="Satsui no Hado")
								src.Power_Multiplier+=0.75
								src.StrengthMultiplier*=1.6
								src.EnduranceMultiplier*=1.35
								src.ForceMultiplier*=1.6
								src.ResistanceMultiplier*=1.25
								src.SpeedMultiplier*=1.15
								src.OffenseMultiplier*=1.6
								src.DefenseMultiplier*=1.45
								src.OMessage(10,"[src] switches to Satsui Stance!","<font color=red>[src]([src.key]) activated Stance (Ansatsuken T4).")


					else
						src<<"You need to select a Stance!"
						return
				else
					if(src.Stance=="Turtle")
						src.EnduranceMultiplier/=src.BuffCalc
						src.ResistanceMultiplier/=src.BuffCalc
						Z.BuffUsing=0
						src.StanceActive=0
						src.OMessage(10,"[src] drops their Turtle Stance!","<font color=red>[src]([src.key]) deactivated Stance (Turtle).")
					else if(src.Stance=="Training")
						src.StrengthMultiplier/=0.01
						src.OffenseMultiplier/=0.01
						src.ForceMultiplier/=0.01
						src.SpeedMultiplier/=3
						Z.BuffUsing=0
						src.StanceActive=0
						src.OMessage(10,"[src] drops their Training Stance.","<font color=red>[src]([src.key]) deactivated Stance (Training).")
					else if(src.Stance=="Cheetah")
						src.StrengthMultiplier/=src.BuffCalc
						src.SpeedMultiplier/=src.BuffCalc
						if(src.Race!="Neko"&&src.Race!="Throwback")
							src.OffenseMultiplier/=0.50
						Z.BuffUsing=0
						src.StanceActive=0
						src.OMessage(10,"[src] drops their Cheetah Stance!","<font color=red>[src]([src.key]) deactivated Stance (Cheetah).")

					else if(src.Stance=="Horse")
						src.SpeedMultiplier/=5
						src.OffenseMultiplier/=2
						src.DefenseMultiplier/=2
						src.StrengthMultiplier/=0.01
						src.ForceMultiplier/=0.01
						Z.BuffUsing=0
						src.StanceActive=0
						src.OMessage(10,"[src] abandons their newfound masculinity as they relinquish the horse mask...","<font color=red>[src]([src.key]) deactivated Stance (Horse).")

					else if(src.Stance=="Crane")
						src.ForceMultiplier/=src.BuffCalc
						src.OffenseMultiplier/=src.BuffCalc
						Z.BuffUsing=0
						src.StanceActive=0
						src.OMessage(10,"[src] drops their Crane Stance!","<font color=red>[src]([src.key]) deactivated Stance (Crane).")

					else if(src.Stance=="Bat")
						src.ForceMultiplier/=src.BuffCalc
						src.StrengthMultiplier/=src.BuffCalc
						Z.BuffUsing=0
						src.StanceActive=0
						src.OMessage(10,"[src] drops their Bat Stance!","<font color=red>[src]([src.key]) deactivated Stance (Bat).")
					else if(src.Stance=="Ripple")
						src.DefenseMultiplier/=src.BuffCalc
						src.OffenseMultiplier/=src.BuffCalc
						src.SpeedMultiplier/=(src.BuffCalc/2)
						src.EnergyMod/=1.5
						src.EnergyMax/=1.5
						src.Energy/=1.5
						Z.BuffUsing=0
						src.StanceActive=0
						src.OMessage(10,"[src] drops their Ripple Stance!","<font color=red>[src]([src.key]) deactivated Stance (Ripple).")

					else if(src.Stance=="BlackLeg")
						src.StrengthMultiplier/=src.BuffCalc
						src.OffenseMultiplier/=src.BuffCalc
						src.EnduranceMultiplier/=1.25
						Z.BuffUsing=0
						src.StanceActive=0
						src.OMessage(10,"[src] puts their feet down slowly...","<font color=red>[src]([src.key]) deactivated Stance (Black Leg).")

					else if(src.Stance=="Circulation")
						src.ResistanceMultiplier/=2
						src.SpeedMultiplier/=src.BuffCalc
						Z.BuffUsing=0
						src.StanceActive=0
						src.OMessage(10,"[src]'s ki dissipates visibly!","<font color=red>[src]([src.key]) deactivated Stance (Circulation).")

					else if(src.Stance=="Southpaw")
						src.EnduranceMultiplier/=src.BuffCalc
						src.OffenseMultiplier/=src.BuffCalc
						Z.BuffUsing=0
						src.StanceActive=0
						src.OMessage(10,"[src] puts their fists down...","<font color=red>[src]([src.key]) deactivated Stance (Southpaw).")

					else if(src.Stance=="StrongFist")
						src << "But no really shoutout to Bonga, Kwaj, etc"
						src.EnduranceMultiplier/=src.BuffCalc
						src.StrengthMultiplier/=src.BuffCalc
						src.SpeedMultiplier/=1.25
						Z.BuffUsing=0
						src.StanceActive=0
						src.OMessage(10,"[src] relaxes their fists, hands falling to their sides.","<font color=red>[src]([src.key]) deactivated Stance (Strong Fist).")

					else if(src.Stance=="Wolf")
						src.StrengthMultiplier/=src.BuffCalc
						src.OffenseMultiplier/=src.BuffCalc
						Z.BuffUsing=0
						src.StanceActive=0
						src.OMessage(10,"[src] dropped their Wolf Stance!","<font color=red>[src]([src.key]) deactivated Stance (Wolf).")
					else if(src.Stance=="Armadillo")
						src.DefenseMultiplier/=src.BuffCalc
						src.EnduranceMultiplier/=src.BuffCalc
						Z.BuffUsing=0
						src.StanceActive=0
						src.OMessage(10,"[src] drops their Armadillo Stance!","<font color=red>[src]([src.key]) deactivated Stance (Armadillo).")
					/*else if(src.Stance=="Breaker")
						src.WeaponBreaker=0
						src.StrengthMultiplier/=1.15
						src.OffenseMultiplier/=0.8
						src.DefenseMultiplier/=1.15
						Z.BuffUsing=0
						src.StanceActive=0
						src.OMessage(10,"[src] drops their Weapon Breaker stance!","<font color=red>[src]([src.key]) deactivated Stance (Breaker).")
					*/
					else if(src.Stance=="Resshuken")
						if(src.SpiritWeaponChosen=="Style"&&src.SpiritLevel<4)
							src.StrengthMultiplier/=1.56
							src.EnduranceMultiplier/=1.56
							src.ForceMultiplier/=1.56
							src.ResistanceMultiplier/=1.56
							src.OffenseMultiplier/=1.56
							src.DefenseMultiplier/=1.56
						else if(src.SpiritWeaponChosen=="Style"&&src.SpiritLevel>=4)
							src.StrengthMultiplier/=1.625
							src.EnduranceMultiplier/=1.625
							src.ForceMultiplier/=1.625
							src.ResistanceMultiplier/=1.625
							src.OffenseMultiplier/=1.625
							src.DefenseMultiplier/=1.625
						src.StanceActive=0
						Z.BuffUsing=0
						src.OMessage(10,"[src] drops their Resshuken Stance!","<font color=red>[src]([src.key]) deactivated Stance (Resshuken).")
					else if(src.Stance == "Fox")
					{
						src.ForceMultiplier /= 2
						src.OffenseMultiplier /= 1.25
						src.DefenseMultiplier /= 1.25
						src.StanceActive=0
						Z.BuffUsing=0
						src.OMessage(10,"[src] drops their Fox Stance!  Pyon.","<font color=red>[src]([src.key]) deactivated Stance (Fox).")
					}
					else if(src.Stance=="Dragon")
						src.ActiveBuffs-=3
						src.Power_Multiplier-=0.75
						src.ForceMultiplier/=1.4
						src.StrengthMultiplier/=1.5
						src.EnduranceMultiplier/=1.25
						src.ResistanceMultiplier/=1.25
						src.StanceActive=0
						Z.BuffUsing=0
						src.OMessage(10,"[src] drops their Dragon Stance!","<font color=red>[src]([src.key]) deactivated Stance (Dragon).")
					else if(src.Stance=="Tortoise")
						src.ActiveBuffs-=3
						src.Power_Multiplier-=0.75
						src.StrengthMultiplier/=1.25
						src.EnduranceMultiplier/=1.75
						src.ResistanceMultiplier/=1.75
						src.StanceActive=0
						Z.BuffUsing=0
						src.OMessage(10,"[src] drops their Tortoise Stance!","<font color=red>[src]([src.key]) deactivated Stance (Tortoise).")

					else if(src.Stance=="Tiger")
						src.ActiveBuffs-=3
						src.Power_Multiplier-=0.5
						src.SpeedMultiplier/=1.25
						src.StrengthMultiplier/=1.75
						src.ForceMultiplier/=1.25
						src.StanceActive=0
						Z.BuffUsing=0
						src.OMessage(10,"[src] drops their Tiger Stance!","<font color=red>[src]([src.key]) deactivated Stance (Tiger).")

					else if(src.Stance=="Phoenix")
						src.ActiveBuffs-=3
						src.Power_Multiplier-=0.75
						src.RecoveryMultiplier/=1.75
						src.StanceActive=0
						Z.BuffUsing=0
						src.OMessage(10,"[src] drops their Phoenix Stance!","<font color=red>[src]([src.key]) deactivated Stance (Phoenix).")

					else if(src.Stance=="DrunkenFist")
						src.ActiveBuffs-=3
						src.Power_Multiplier-=0.75
						src.StrengthMultiplier/=1.5
						src.SpeedMultiplier/=1.25
						src.DefenseMultiplier/=1.75
						Z.BuffUsing=0
						src.StanceActive=0
						src.BerserkerInsanity=0
						src.OMessage(10,"[src] drops their Drunken Fist Stance!","<font color=red>[src]([src.key]) deactivated Stance (Drunken Fist).")

					else if(src.Stance=="Ansatsuken")
						src.ActiveBuffs-=3
						src.StanceActive=0
						Z.BuffUsing=0
						if(src.AnsatsukenMod==1)
							src.Power_Multiplier-=0.5
							src.StrengthMultiplier/=1.3
							src.EnduranceMultiplier/=1.25
							src.ForceMultiplier/=1.3
							src.SpeedMultiplier/=1.05
							src.OffenseMultiplier/=1.3
							src.DefenseMultiplier/=1.3
							src.OMessage(10,"[src] drops their Ansatsuken Stance!","<font color=red>[src]([src.key]) deactivated Stance (Ansatsuken T1).")
						if(src.AnsatsukenMod==2)
							src.Power_Multiplier-=0.6
							src.StrengthMultiplier/=1.4
							src.EnduranceMultiplier/=1.3
							src.ForceMultiplier/=1.4
							src.ResistanceMultiplier/=1.15
							src.SpeedMultiplier/=1.05
							src.OffenseMultiplier/=1.4
							src.DefenseMultiplier/=1.4
							src.OMessage(10,"[src] drops their Ansatsuken Stance!","<font color=red>[src]([src.key]) deactivated Stance (Ansatsuken T2).")
						if(src.AnsatsukenMod==3)
							src.Power_Multiplier-=0.65
							src.StrengthMultiplier/=1.45
							src.EnduranceMultiplier/=1.35
							src.ForceMultiplier/=1.45
							src.ResistanceMultiplier/=1.25
							src.SpeedMultiplier/=1.1
							src.OffenseMultiplier/=1.45
							src.DefenseMultiplier/=1.45
							src.OMessage(10,"[src] drops their Ansatsuken Stance!","<font color=red>[src]([src.key]) deactivated Stance (Ansatsuken T3).")
						if(src.AnsatsukenMod>3)
							if(src.AmatsukenAscension=="Chikara no Hado")
								src.Power_Multiplier-=0.75
								src.StrengthMultiplier/=1.5
								src.EnduranceMultiplier/=1.4
								src.ForceMultiplier/=1.5
								src.ResistanceMultiplier/=1.4
								src.SpeedMultiplier/=1.15
								src.OffenseMultiplier/=1.5
								src.DefenseMultiplier/=1.5
								src.OMessage(10,"[src] drops their Chikara Stance!","<font color=red>[src]([src.key]) deactivated Stance (Ansatsuken T4).")

							if(src.AmatsukenAscension=="Satsui no Hado")
								src.Power_Multiplier-=0.75
								src.StrengthMultiplier/=1.6
								src.EnduranceMultiplier/=1.35
								src.ForceMultiplier/=1.6
								src.ResistanceMultiplier/=1.25
								src.SpeedMultiplier/=1.15
								src.OffenseMultiplier/=1.6
								src.DefenseMultiplier/=1.45
								src.OMessage(10,"[src] drops their Satsui Stance!","<font color=red>[src]([src.key]) deactivated Stance (Ansatsuken T4).")

			if("FuryOfNature")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=3) return
					src.ActiveBuffs+=1
					src.StrengthMultiplier*=1.25
					src.EnduranceMultiplier*=1.25
					src.OffenseMultiplier*=1.25
					src.Anger = src.AngerMax
					src<<"You draw in the fury of nature!"
	//				src.OMessage(10,"[src] concentrates on the power of their mind and unlock their third eye power.","<font color=red>[src]([src.key]) activated Third-Eye.")
					Z.BuffUsing=1
				else
					src.StrengthMultiplier/=1.25
					src.EnduranceMultiplier/=1.25
					src.OffenseMultiplier/=1.25
					src.Anger = 0
					src.ActiveBuffs-=1
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					src<<"You relinquish the fury of nature."
				//	src.OMessage(10,"[src] represses the power of their third eye.","<font color=red>[src]([src.key]) deactivated Third-Eye.")
					Z.BuffUsing=0
			if("SpiritOfEarth")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=3) return
					src.ActiveBuffs+=1
					src.SpeedMultiplier*=1.3
					src.DefenseMultiplier*=1.5
					src.OffenseMultiplier*=0.4
					src.StrengthMultiplier*=0.7
					src.ResistanceMultiplier*=0.7
					src.Base*=1.5
					src.BaseMod*=1.5
					src<<"You harden your skin with the spirit of the earth!"
	//				src.OMessage(10,"[src] concentrates on the power of their mind and unlock their third eye power.","<font color=red>[src]([src.key]) activated Third-Eye.")
					Z.BuffUsing=1
				else
					src.SpeedMultiplier/=1.3
					src.DefenseMultiplier/=1.5
					src.OffenseMultiplier/=0.4
					src.StrengthMultiplier/=0.7
					src.ResistanceMultiplier/=0.7
					src.Base/=1.5
					src.BaseMod/=1.5
					src.ActiveBuffs-=1
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					src<<"You relinquish the spirit of the earth."
				//	src.OMessage(10,"[src] represses the power of their third eye.","<font color=red>[src]([src.key]) deactivated Third-Eye.")
					Z.BuffUsing=0
			if("SpiritOfWisdom")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=3) return
					src.ActiveBuffs+=1
					src.SpeedMultiplier*=0.8
					src.DefenseMultiplier*=0.75
					src.OffenseMultiplier*=1.5
					src.ForceMultiplier*=1.3
					src.ResistanceMultiplier*=0.7
					src.Base*=1.5
					src.BaseMod*=1.5
					src<<"You strengthen your mind with the spirit of wisdom!"
	//				src.OMessage(10,"[src] concentrates on the power of their mind and unlock their third eye power.","<font color=red>[src]([src.key]) activated Third-Eye.")
					Z.BuffUsing=1
				else
					src.SpeedMultiplier/=0.8
					src.DefenseMultiplier/=0.75
					src.OffenseMultiplier/=1.5
					src.ForceMultiplier/=1.3
					src.ResistanceMultiplier/=0.7
					src.Base/=1.5
					src.BaseMod/=1.5
					src.ActiveBuffs-=1
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					src<<"You relinquish the spirit of wisdom."
				//	src.OMessage(10,"[src] represses the power of their third eye.","<font color=red>[src]([src.key]) deactivated Third-Eye.")
					Z.BuffUsing=0
			if("SpiritWave")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1) return
					src.ActiveBuffs+=3
					src.RecoveryMultiplier*=1.5
					src.RegenerationMultiplier*=1.5
					src.Energy*=1.5
					src.EnergyMax*=1.5
					src.EnergyMod*=1.5
					src.SpiritWave=1
					if(src.Race=="Half Demon"||src.Race=="Demon")
						src.OMessage(10,"[src] surrounded their body with a red aura of demonic energy.","<font color=red>[src]([src.key]) activated Spirit Wave.")
					else if(src.SacredEnergy)
						src.OMessage(10,"[src] surrounded their body with a golden aura of an unknown energy.","<font color=red>[src]([src.key]) activated Spirit Wave.")
					else
						src.OMessage(10,"[src] surrounded their body with a blue aura of spirit energy.","<font color=red>[src]([src.key]) activated Spirit Wave.")
					Z.BuffUsing=1
				else
					src.RecoveryMultiplier/=1.5
					src.RegenerationMultiplier/=1.5
					src.Energy/=1.5
					src.EnergyMax/=1.5
					src.EnergyMod/=1.5
					src.SpiritWave=0
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					src.OMessage(10,"[src] represses the aura.","<font color=red>[src]([src.key]) deactivated Spirit Wave.")
					Z.BuffUsing=0
			if("ThirdEye")
				if(!Z.BuffUsing)
					if(src.SanreiActive==0)
						src.see_invisible=1
						src.RecoveryMultiplier*=1.35
						src.SpeedMultiplier*=1.25
						src.Base*=1.25
						src.BaseMod*=1.25
						src.AngerMax*=0.85
						//src.overlays-=Z.sicon
						//src.overlays+=Z.sicon
						src.overlays -= image(Z.sicon,Z.sicon_state,pixel_x=Z.pixel_x,pixel_y=Z.pixel_y)
						src.overlays += image(Z.sicon,Z.sicon_state,pixel_x=Z.pixel_x,pixel_y=Z.pixel_y)
						if(src.BodyType=="Small")
							src.StrengthMultiplier*=2.3
							src.EnduranceMultiplier*=2.3
							src.ResistanceMultiplier*=2.3
						else if (src.BodyType=="Large")
							src.OffenseMultiplier*=2.5
							src.DefenseMultiplier*=2.5
						else if (src.BodyType=="Medium")
							src.StrengthMultiplier*=1.3
							src.EnduranceMultiplier*=1.3
							src.SpeedMultiplier*=1.69
							src.ForceMultiplier*=1.3
							src.ResistanceMultiplier*=1.3
						src<<"You are now tapping into the power of your third eye."
	//					src.OMessage(10,"[src] concentrates on the power of their mind and unlock their third eye power.","<font color=red>[src]([src.key]) activated Third-Eye.")
						Z.BuffUsing=1
				else
					src.RecoveryMultiplier/=1.35
					src.SpeedMultiplier/=1.25
					src.Base/=1.25
					src.BaseMod/=1.25
					src.AngerMax/=0.85
					//src.overlays-=Z.sicon
					src.overlays -= image(Z.sicon,Z.sicon_state,pixel_x=Z.pixel_x,pixel_y=Z.pixel_y)
					if(src.BodyType=="Small")
						src.StrengthMultiplier/=2.3
						src.EnduranceMultiplier/=2.3
						src.ResistanceMultiplier/=2.3
					else if (src.BodyType=="Large")
						src.OffenseMultiplier/=2.5
						src.DefenseMultiplier/=2.5
					else if (src.BodyType=="Medium")
						src.StrengthMultiplier/=1.3
						src.EnduranceMultiplier/=1.3
						src.SpeedMultiplier/=1.69
						src.ForceMultiplier/=1.3
						src.ResistanceMultiplier/=1.3
					src.see_invisible=0
					src.overlays-='Third Eye.dmi'
					src<<"You are no longer tapping into the power of your third eye."
				//	src.OMessage(10,"[src] represses the power of their third eye.","<font color=red>[src]([src.key]) deactivated Third-Eye.")
					Z.BuffUsing=0
				sleep(10)
			if("Rinnegan")
			{
				if(!Z.BuffUsing)
				{
					if(src.ActiveBuffs > 0)
					{
						src << "Rinnegan OP.  It takes 3 buff slots."
						return
					}
					src.ActiveBuffs+=3
					Z.BuffUsing=1

					Z.CustomBPmod = 1.5
					Z.CustomBPadd = 0
					Z.CustomStr = 1.25
					Z.CustomDura = 1.25
					Z.CustomSpeed = 1
					Z.CustomForce = 1.25
					Z.CustomRes = 1.25
					Z.CustomOff = 1.25
					Z.CustomDef = 1.25
					Z.CustomRegen = 1.25
					Z.CustomRecov = 1.25
					Z.CustomAnger = 0

			//		if(1 < src.CountRinneganAscensions()) // 2 or more ascensions
			//		{
			//			Z.CustomBPadd+= (src.CountRinneganAscensions() - 1) * 10000000;
			//		}
					if(src.DevaUnlocked)
					{
						Z.CustomBPmod+=1
					}
					if(src.PretaUnlocked)
					{
						Z.CustomStr+=0.15
						Z.CustomDura+=0.15
						Z.CustomSpeed+=0.15
						Z.CustomForce+=0.15
						Z.CustomRes+=0.15
						Z.CustomOff+=0.15
						Z.CustomDef+=0.15
						Z.CustomRegen+=0.15
						Z.CustomRecov+=0.15
					}
					if(src.HumanUnlocked)
					{
						Z.CustomRecov+=0.5
						Z.CustomOff+=0.25
						Z.CustomDef+=0.25
					}
					if(src.AsuraUnlocked)
					{
						Z.CustomBPadd+=CyberBPCap*src.BaseMod*src.CyberizeMod
					}
					if(src.NarakaUnlocked)
					{
						Z.CustomRegen+=0.5
						Z.CustomSpeed+=0.25
					}
					if(src.AnimalUnlocked)
					{
						Z.CustomDura+=0.5
						Z.CustomRes+=0.5
					}
					if(src.SharinneganUnlocked)
						Z.CustomBPmod*=2.5
						Z.CustomBPadd+=15000000
					if(src.OuterUnlocked)
					{
						Z.CustomBPmod*=2
						Z.CustomBPadd*=2
						Z.CustomStr*=2
						Z.CustomDura*=2
						Z.CustomSpeed*=2
						Z.CustomForce*=2
						Z.CustomRes*=2
						Z.CustomOff*=2
						Z.CustomDef*=2
						Z.CustomRegen*=2
						Z.CustomRecov*=2
						Z.CustomAnger+=0.5

						Z.CustomBPadd += (src.Base * 50)
					}

					src.BaseMod *= Z.CustomBPmod
					src.Base*=Z.CustomBPmod
					src.PlusPower += Z.CustomBPadd
					src.StrengthMultiplier *= Z.CustomStr
					src.EnduranceMultiplier *= Z.CustomDura
					src.SpeedMultiplier *= Z.CustomSpeed
					src.ForceMultiplier *= Z.CustomForce
					src.ResistanceMultiplier *= Z.CustomRes
					src.OffenseMultiplier *= Z.CustomOff
					src.DefenseMultiplier *= Z.CustomDef
					src.RegenerationMultiplier *= Z.CustomRegen
					src.RecoveryMultiplier *= Z.CustomRecov
					src.AngerMax += Z.CustomAnger


					if(!src.OuterUnlocked)//if its not endwipe
						src.OMessage(10, "[src]'s eyes assume a ripple pattern.","<font color='red'>[src]([src.key]) activated Rinnegan.</font color>")
					else
					{
						world << "[src] draws the power of the universe into their body."
					}
				}
				else
				{
					Z.BuffUsing=0

					src.ActiveBuffs-=3

					src.BaseMod /= Z.CustomBPmod
					src.Base/=Z.CustomBPmod
					src.PlusPower -= Z.CustomBPadd
					src.StrengthMultiplier /= Z.CustomStr
					src.EnduranceMultiplier /= Z.CustomDura
					src.SpeedMultiplier /= Z.CustomSpeed
					src.ForceMultiplier /= Z.CustomForce
					src.ResistanceMultiplier /= Z.CustomRes
					src.OffenseMultiplier /= Z.CustomOff
					src.DefenseMultiplier /= Z.CustomDef
					src.RegenerationMultiplier /= Z.CustomRegen
					src.RecoveryMultiplier /= Z.CustomRecov
					src.AngerMax -= Z.CustomAnger
					src.Anger=0

					src.OMessage(10, "[src]'s eyes return to normal.","<font color='red'>[src]([src.key]) de-activated Rinnegan.</font color>")
				}
			}
			if("GiveRinnegan")
			{
				var/list/choices = list();
				for(var/mob/m in oview(1, src))
				{
					if(m.client)
					{
						choices+=m;
					}
				}
				var/mob/choice = input("Who do you want to give your Rinnegan to?", "Give Rinnegan") in choices
				var/confirm = alert("Are you sure you want to give [choice] your Rinnegan?", "Give Rinnegan", "Yes", "No")
				if(confirm=="Yes")
				{
					src.GiveRinnegan(choice)
				}
			}
			if("Focus")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1)
						src <<"You have too many buffs active!"
						return
					if(src.Energy<src.EnergyMax/10)return
					src.ActiveBuffs+=3
					if(src.Race=="no")
						src.Power_Multiplier+=0.45
						src.RegenerationMultiplier*=1.15
						src.RecoveryMultiplier*=1.25
						src.ForceMultiplier*=1.75
						src.SpeedMultiplier*=1.35
						src.StrengthMultiplier*=0.85
						src.EnduranceMultiplier*=0.85
						if(src.BojackUnlocked)
							src.Power_Multiplier+=0.15
							src.RecoveryMultiplier*=1.15
							src.ForceMultiplier*=1.15
					else
						src.Power_Multiplier+=0.5
						src.RegenerationMultiplier*=1.15
						src.ForceMultiplier*=1.5
						src.SpeedMultiplier*=1.15
						src.StrengthMultiplier*=0.5
						src.ResistanceMultiplier*=1.5
					/*	if(usr.Race=="Hollow")
								if(usr.trans["active"]==1)
									usr.PlusPower+=usr.trans["1give"]/10*3.5*/
					src.OMessage(10,"[src] heightens their senses and alertness to focus.","<font color=red>[src]([src.key]) activated Focus.")
					Z.BuffUsing=1
/*					src.focus_event = new(skills_scheduler, src)
					skills_scheduler.schedule(src.focus_event, 50)*/
				else
					if(src.Race=="no")
						src.Power_Multiplier-=0.45
						src.RegenerationMultiplier/=1.15
						src.RecoveryMultiplier/=1.25
						src.ForceMultiplier/=1.75
						src.SpeedMultiplier/=1.35
						src.StrengthMultiplier/=0.85
						src.EnduranceMultiplier/=0.85
						if(src.BojackUnlocked)
							src.Power_Multiplier-=0.15
							src.RecoveryMultiplier/=1.15
							src.ForceMultiplier/=1.15
/*					if(src.BojackUnlocked && ! src.InBojack)
						src.BaseMod/=1.5
						src.Base/=1.5
						src.PlusPower-=3000000
						src.InBojack=0*/
					else
						src.Power_Multiplier-=0.5
						src.RegenerationMultiplier/=1.15
						src.ForceMultiplier/=1.5
						src.SpeedMultiplier/=1.15
						src.StrengthMultiplier/=0.5
						src.ResistanceMultiplier/=1.5
					/*	if(usr.Race=="Hollow")
								if(usr.trans["active"]==1)
									usr.PlusPower-=usr.trans["1give"]/10*3.5*/
					src.OMessage(10,"[src] begins to relax as their focus returns to normal..","<font color=red>[src]([src.key]) deactivated Focus.")
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					Z.BuffUsing=0
				sleep(10)
			if("Berserk")
				var/obj/Skills/Buffs/Berserk/ZZ=Z
				if(!Z.BuffUsing)
					if(src.Energy<src.EnergyMax/10)return
					if(ZZ.SpamLockout==1)
						usr<<"Stop spamming Berserk!"
						return
					ZZ.SpamLockout=1
					var/list/BerserkLevel=list("Berserk")
					if(src.trans["unlocked"]>=1)
						BerserkLevel.Add("Super Berserk")
					if(src.trans["unlocked"]>=2)
						BerserkLevel.Add("Super Berserk 2")
					if(src.trans["unlocked"]>=3)
						BerserkLevel.Add("Super Berserk 3")
					BerserkLevel.Add("Cancel")
					ZZ.BerserkLevelSelected=input("Pick a Berserk Level!") in BerserkLevel
					if(ZZ.BerserkLevelSelected=="Cancel")
						ZZ.SpamLockout=0
						return
					if(ZZ.BerserkLevelSelected!="Berserk"&&!src.KeepBody&&src.Dead)
						src << "You can't use your transformation while dead without a body."
						return
					src.Anger=src.AngerMax
					if(ZZ.BerserkLevelSelected=="Berserk")
						src.SpeedMultiplier*=1.1
						src.EnduranceMultiplier*=1.1
						src.StrengthMultiplier*=1.1
						src.ForceMultiplier*=1.1
						src.ResistanceMultiplier*=1.1
						src.OffenseMultiplier*=1.1
						src.DefenseMultiplier*=1.1
						src.RecoveryMultiplier*=0.85
						src.OMessage(30,"[src] [Z:Form1Trans]","<font color=red>[src]([src.key]) activated Berserk.")
					else if(ZZ.BerserkLevelSelected=="Super Berserk")
						src.PlusPower+= 3000000
						src.Base*=2
						src.BaseMod*=2
						src.SpeedMultiplier*=1.15
						src.EnduranceMultiplier*=1.15
						src.StrengthMultiplier*=1.15
						src.ForceMultiplier*=1.15
						src.ResistanceMultiplier*=1.15
						src.OffenseMultiplier*=1.15
						src.DefenseMultiplier*=1.15
						src.RecoveryMultiplier*=0.85
						src.OMessage(30,"[src] [Z:Form2Trans]","<font color=red>[src]([src.key]) activated Berserk.")
					else if(ZZ.BerserkLevelSelected=="Super Berserk 2")
						src.PlusPower+= 15000000
						src.Base*=4
						src.BaseMod*=4
						src.SpeedMultiplier*=1.2
						src.EnduranceMultiplier*=1.2
						src.StrengthMultiplier*=1.2
						src.ForceMultiplier*=1.2
						src.ResistanceMultiplier*=1.2
						src.OffenseMultiplier*=1.2
						src.DefenseMultiplier*=1.2
						src.RecoveryMultiplier*=0.8
						src.OMessage(30,"[src] [Z:Form3Trans]","<font color=red>[src]([src.key]) activated Berserk.")
					else if(ZZ.BerserkLevelSelected=="Super Berserk 3")
						src.PlusPower+= 50000000
						src.Base*=10
						src.BaseMod*=10
						src.SpeedMultiplier*=1.25
						src.EnduranceMultiplier*=1.25
						src.StrengthMultiplier*=1.25
						src.ForceMultiplier*=1.25
						src.ResistanceMultiplier*=1.25
						src.OffenseMultiplier*=1.25
						src.DefenseMultiplier*=1.25
						src.RecoveryMultiplier*=0.65
						src.RegenerationMultiplier*=0.75
						src.OMessage(30,"[src] [Z:Form4Trans]","<font color=red>[src]([src.key]) activated Berserk.")
					Z.BuffUsing=1
					src.overlays-=Z.sicon
					src.overlays-=Z.sicon
					src.overlays+=Z.sicon
					ZZ.SpamLockout=0
				else
					if(ZZ.BerserkLevelSelected=="Berserk")
						src.SpeedMultiplier/=1.1
						src.EnduranceMultiplier/=1.1
						src.StrengthMultiplier/=1.1
						src.ForceMultiplier/=1.1
						src.ResistanceMultiplier/=1.1
						src.OffenseMultiplier/=1.1
						src.DefenseMultiplier/=1.1
						src.RecoveryMultiplier/=0.85
						src.Anger=0
						src.OMessage(30,"[src] [Z:FormRevert]","<font color=red>[src]([src.key]) deactivated Berserk.")

					else if(ZZ.BerserkLevelSelected=="Super Berserk")
						src.PlusPower-= 3000000
						src.Base/=2
						src.BaseMod/=2
						src.SpeedMultiplier/=1.15
						src.EnduranceMultiplier/=1.15
						src.StrengthMultiplier/=1.15
						src.ForceMultiplier/=1.15
						src.ResistanceMultiplier/=1.15
						src.OffenseMultiplier/=1.15
						src.DefenseMultiplier/=1.15
						src.RecoveryMultiplier/=0.85
						src.OMessage(30,"[src] [Z:FormRevert]","<font color=red>[src]([src.key]) deactivated Berserk(T1).")
					else if(ZZ.BerserkLevelSelected=="Super Berserk 2")
						src.PlusPower-= 15000000
						src.Base/=4
						src.BaseMod/=4
						src.SpeedMultiplier/=1.2
						src.EnduranceMultiplier/=1.2
						src.StrengthMultiplier/=1.2
						src.ForceMultiplier/=1.2
						src.ResistanceMultiplier/=1.2
						src.OffenseMultiplier/=1.2
						src.DefenseMultiplier/=1.2
						src.RecoveryMultiplier/=0.8
						src.OMessage(30,"[src] [Z:FormRevert]","<font color=red>[src]([src.key]) deactivated Berserk(T2).")
					else if(ZZ.BerserkLevelSelected=="Super Berserk 3")
						src.PlusPower-= 50000000
						src.Base/=10
						src.BaseMod/=10
						src.SpeedMultiplier/=1.25
						src.EnduranceMultiplier/=1.25
						src.StrengthMultiplier/=1.25
						src.ForceMultiplier/=1.25
						src.ResistanceMultiplier/=1.25
						src.OffenseMultiplier/=1.25
						src.DefenseMultiplier/=1.25
						src.RecoveryMultiplier/=0.65
						src.RegenerationMultiplier/=0.75
						src.OMessage(30,"[src] [Z:FormRevert]","<font color=red>[src]([src.key]) deactivated Berserk(T3).")
					Z.BuffUsing=0
					src.overlays-=Z.sicon
				sleep(10)
			if("Pulse")
				if(!src.KeepBody&&src.Dead)
					src << "You can't use this while dead without a body."
					return
				if(!Z.BuffUsing)
					Z:LevelUsed=src.AscensionsAcquired
					if(Z:LevelUsed==null)
						Z:LevelUsed=0
					if(src.AscensionsAcquired<2)
						src.SpeedMultiplier*=1.15
						src.ForceMultiplier*=1.5
						src.ResistanceMultiplier*=1.5
						src.RecoveryMultiplier*=1.15
						src.OMessage(10,"[src] draws from their surroundings, a dim glow beginning to surround their form!","<font color=red>[src]([src.key]) activated Pulse. (T1)")
					if(src.AscensionsAcquired==2)
						src.PlusPower+=7000000
						src.SpeedMultiplier*=1.2
						src.ForceMultiplier*=1.75
						src.ResistanceMultiplier*=1.75
						src.RecoveryMultiplier*=1.2
						src.OMessage(10,"[src] takes from the world around them, eyes emitting an ethereal glow as they're cloaked in mana...","<font color=red>[src]([src.key]) activated Pulse. (T2)")
					if(src.AscensionsAcquired>=3)
						src.PlusPower+=40000000
						src.SpeedMultiplier*=1.25
						src.ForceMultiplier*=2
						src.ResistanceMultiplier*=2
						src.RecoveryMultiplier*=1.25
						src.OMessage(10,"[src]'s eyes snap open, body pulsing with mana as their eyes take on a hellish glow!","<font color=red>[src]([src.key]) activated Pulse (T3).")
					src.BaseMod*=2
					src.Base*=2
					Z.BuffUsing=1
					src.ManaInfusing=1
					src.overlays-=Z.sicon
					src.overlays-=Z.sicon
					src.overlays+=Z.sicon
				else
					if(Z:LevelUsed==null)
						Z:LevelUsed=0
					switch(Z:LevelUsed)
						if(0)
							src.SpeedMultiplier/=1.15
							src.ForceMultiplier/=1.5
							src.ResistanceMultiplier/=1.5
							src.RecoveryMultiplier/=1.15
							src.OMessage(10,"[src] releases their hold on their supernatural energy.","<font color=red>[src]([src.key]) de-activated Pulse. (T1)")
						if(1)
							src.SpeedMultiplier/=1.15
							src.ForceMultiplier/=1.5
							src.ResistanceMultiplier/=1.5
							src.RecoveryMultiplier/=1.15
							src.OMessage(10,"[src] releases their hold on their supernatural energy.","<font color=red>[src]([src.key]) de-activated Pulse. (T1)")
						if(2)
							src.PlusPower-=7000000
							src.SpeedMultiplier/=1.2
							src.ForceMultiplier/=1.75
							src.ResistanceMultiplier/=1.75
							src.RecoveryMultiplier/=1.2
							src.OMessage(10,"[src] stops draining the world around them of its mana.","<font color=red>[src]([src.key]) de-activated Pulse. (T2)")
						if(3)
							src.PlusPower-=40000000
							src.SpeedMultiplier/=1.25
							src.ForceMultiplier/=2
							src.ResistanceMultiplier/=2
							src.RecoveryMultiplier/=1.25
							src.OMessage(10,"The hellish glow fades from [src]'s eyes.","<font color=red>[src]([src.key]) activated Pulse (T3).")
						if(4)
							src.PlusPower-=40000000
							src.SpeedMultiplier/=1.25
							src.ForceMultiplier/=2
							src.ResistanceMultiplier/=2
							src.RecoveryMultiplier/=1.25
							src.OMessage(10,"The hellish glow fades from [src]'s eyes.","<font color=red>[src]([src.key]) activated Pulse (T3).")

					src.BaseMod/=2
					src.Base/=2
					Z.BuffUsing=0
					src.ManaInfusing=0
					Z:LevelUsed=0
					src.overlays-=Z.sicon
				sleep(10)
			if("Excalibur")
				if(!Z.BuffUsing)
					for(var/obj/Items/Sword/S in usr)
						if(S.suffix)
							Z.NormalEnchant=S.EnchantType
							src.RecoveryMultiplier*=1.25
							S.EnchantType="Holy"
							src.overlays+=image('AurasBig.dmi',"Demi",pixel_x=-32)
							if(src.ActiveBuffs)
								if(src.SpecialSlot)
									src << "You're already using a slotted and special buff."
									return
								src.SpecialSlot=1
								Z:UsedSpecial=1
							else
								src.ActiveBuffs=3
								Z:UsedNormal=1
								src.Power_Multiplier+=0.75
							src.OMessage(10,"[src] surrounded their blade in a holy light!","<font color=red>[src]([src.key]) activated Excalibur.")
							for(var/mob/m in view(12))
								if(m.UBWLevel>=2&&!m.ProjectExcalibur)
									m.ProjectExcalibur=1
									m << "You learn to project Excalibur!"
							Z.BuffUsing=1
					//	else if(!S.suffix && !Z.BuffUsing)
					//		src<<"You can't use this without a sword equiped!"
				else
					src.RecoveryMultiplier/=1.25
					if(Z:UsedSpecial)
						Z:UsedSpecial=0
						src.SpecialSlot=0
					if(Z:UsedNormal)
						Z:UsedNormal=0
						src.ActiveBuffs=0
						src.Power_Multiplier-=0.75
					for(var/obj/Items/Sword/S in usr)
						if(S.suffix)
							S.EnchantType=Z.NormalEnchant
					src.OMessage(10,"[src] dispelled the light.","<font color=red>[src]([src.key]) deactivated Excalibur.")
					src.overlays-=image('AurasBig.dmi',"Demi",pixel_x=-32)
					Z.BuffUsing=0
				sleep(10)
			if("Muramasa")
				if(!Z.BuffUsing)
					for(var/obj/Items/Sword/S in usr)
						if(S.suffix)
							Z.NormalEnchant=S.EnchantType
							//src.WeaponBreaker=1
							S.EnchantType="Abyssal"
							if(src.ActiveBuffs)
								if(src.SpecialSlot)
									src << "You're already using a slotted buff and a special buff."
									return
								src.SpecialSlot=1
								Z:UsedSpecial=1
							else
								src.ActiveBuffs=3
								Z:UsedNormal=1
								src.Power_Multiplier+=0.75
							src.OMessage(10,"[src] surrounded their blade in an infernal darkness!","<font color=red>[src]([src.key]) activated Excalibur.")
							for(var/mob/m in view(12))
								if(m.UBWLevel>=2&&!m.ProjectMuramasa)
									m.ProjectMuramasa=1
									m << "You learn to project Muramasa!"
							Z.BuffUsing=1
					//	else if(!S.suffix && !Z.Using)
					//		src<<"You can't use this without a sword equiped!"
				else
					//src.WeaponBreaker=0
					if(Z:UsedSpecial)
						src.SpecialSlot=0
						Z:UsedSpecial=0
					if(Z:UsedNormal)
						src.ActiveBuffs=0
						Z:UsedNormal=0
						src.Power_Multiplier-=0.75
					for(var/obj/Items/Sword/S in usr)
						if(S.suffix)
							S.EnchantType=Z.NormalEnchant
					src.OMessage(10,"[src] dispelled the darkness.","<font color=red>[src]([src.key]) deactivated Excalibur.")
					src.overlays-=image('AurasBig.dmi',"Demi",pixel_x=-32)
					Z.BuffUsing=0
				sleep(10)
			if("BladedFlurry")
				if(!Z.BuffUsing)
					var/SwordCheck=0
					for(var/obj/Items/Sword/S in usr)
						if(S.suffix)
							SwordCheck=1
							if(src.ActiveBuffs>=1) return
							if(src.Energy<src.EnergyMax/10)return
							src.ActiveBuffs+=3
							src.Power_Multiplier+=0.5
							src.StrengthMultiplier*=0.75
							src.SpeedMultiplier*=1.5
							src.OMessage(10,"[src] is now swinging their blade in a flurry!","<font color=red>[src]([src.key]) activated Bladed Flurry.")
							Z.BuffUsing=1
//						else if(!S.suffix && !Z.BuffUsing)
//							src<<"You can't use this without a sword equiped!"
					if(SwordCheck==0)
						src<<"You can't use this without a sword equipped!"
						return
				else
					src.Power_Multiplier-=0.5
					src.StrengthMultiplier/=0.75
					src.SpeedMultiplier/=1.5
					src.OMessage(10,"[src] stops swinging their blade rapidly!","<font color=red>[src]([src.key]) deactivated Bladed Flurry.")
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					Z.BuffUsing=0
				sleep(10)
			if("BoostingWinds")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs)
						return
					if(src.Energy<src.EnergyMax/10)return
					src.ActiveBuffs=3
					src.Power_Multiplier+=0.5
					src.SpeedMultiplier*=1.5
					src.StrengthMultiplier*=1.2
					src.OffenseMultiplier*=0.7
					src.ForceMultiplier*=0.8
					src.DefenseMultiplier*=0.7
					src.OMessage(10,"[src] uses Wind Magic to boost their speed!","<font color=red>[src]([src.key]) activated Boosting Winds.")
					Z.BuffUsing=1
				else
					src.Power_Multiplier-=0.5
					src.SpeedMultiplier/=1.5
					src.StrengthMultiplier/=1.2
					src.OffenseMultiplier/=0.7
					src.ForceMultiplier/=0.8
					src.DefenseMultiplier/=0.7
					src.OMessage(10,"[src] lets the winds die down!","<font color=red>[src]([src.key]) deactivated Boosting Winds.")
					src.ActiveBuffs=0
					Z.BuffUsing=0
				sleep(10)
			if("BlazingWrath")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1) return
					if(src.Energy<src.EnergyMax/10)return
					src.ActiveBuffs+=3
					src.Anger=3
					src.BlazingWrath=1
					src.Burning+=0.1
					spawn()src.Burning_Check()
					src.overlays+=image('FireAuraBurst.dmi',,pixel_x=-48)
					src.OMessage(10,"[src] envelops themself in a raging flame!","<font color=red>[src]([src.key]) activated Blazing Wrath.")
					Z.BuffUsing=1
				else
					src.Anger=0
					src.OMessage(10,"[src] deactivates the flames.","<font color=red>[src]([src.key]) deactivated Blazing Wrath.")
					src.ActiveBuffs-=3
					src.overlays-=image('FireAuraBurst.dmi',,pixel_x=-48)
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					src.BlazingWrath=0
					src.Burning+=1
					spawn()src.Burning_Check()
					Z.BuffUsing=0
				sleep(10)
			if("LightningAura")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1) return
					if(src.Energy<src.EnergyMax/10)return
					src.ActiveBuffs+=3
					src.Power_Multiplier+=0.5
					src.StrengthMultiplier*=1.5
					src.SpeedMultiplier*=1.5
					src.OffenseMultiplier*=0.85
					src.DefenseMultiplier*=0.85
					src.LightningAura=1
					src.Warp=0
					src.overlays+='LightningAura.dmi'
					src.OMessage(10,"[src] beings crackling with electricity!","<font color=red>[src]([src.key]) activated Lightning Aura.")
					Z.BuffUsing=1
				else
					src.Power_Multiplier-=0.5
					src.OMessage(10,"[src] deactivates the electricity.","<font color=red>[src]([src.key]) deactivated Lightning Aura.")
					src.StrengthMultiplier/=1.5
					src.SpeedMultiplier/=1.5
					src.OffenseMultiplier/=0.85
					src.DefenseMultiplier/=0.85
					src.ActiveBuffs-=3
					src.overlays-='LightningAura.dmi'
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					src.LightningAura=0
					Z.BuffUsing=0
				sleep(10)
			if("KiBlade")
				if(src.lockon)return
				if(!Z.BuffUsing)
					if(src.Energy<src.EnergyMax/10)return
					src.kiblade=1
					src.overlays-=image(icon=Z.icon)
					src.overlays+=image(icon=Z.icon)
					var/Swode=0
					for(var/obj/Items/Sword/S in src.contents)
						if(S.suffix)
							Swode=S
					if(Swode)
						src.OMessage(10,"[src] forms a blade of energy around [Swode]!","<font color=red>[src]([src.key]) activated Ki Blade.")
					else
						src.OMessage(10,"[src] forms a blade of energy around their hand!","<font color=red>[src]([src.key]) activated Ki Blade.")
					Z.BuffUsing=1
/*					src.kiblade_event = new(skills_scheduler, src)
					skills_scheduler.schedule(src.kiblade_event, 50)*/
				else
					src.kiblade=0
					src.OMessage(10,"[src] lets the blade fade!","<font color=red>[src]([src.key]) deactivated Ki Blade.")
					src.overlays-=image(icon=Z.icon)
					Z.BuffUsing=0
				sleep(10)
			if("LockOn")
				if(src.kiblade)return
				if(!Z.BuffUsing)
					if(src.Energy<src.EnergyMax/10)return
					src.lockon=1
					src.overlays-=image(icon=Z.icon)
					src.overlays+=image(icon=Z.icon)
					var/Swode=0
					for(var/obj/Items/Sword/S in src.contents)
						if(S.suffix)
							Swode=S
					if(Swode)
						src.OMessage(10,"[src] manifests a shadow around [Swode]!","<font color=red>[src]([src.key]) activated Lock-On.")
					else
						src.OMessage(10,"[src] manifests a shadow around their hand!","<font color=red>[src]([src.key]) activated Lock-On.")
					Z.BuffUsing=1
				else
					src.lockon=0
					src.OMessage(10,"[src] lets the shade fade!","<font color=red>[src]([src.key]) deactivated Lock-On.")
					src.overlays-=image(icon=Z.icon)
					Z.BuffUsing=0
				sleep(10)
			if("EarthenWall")
				if(!Z.BuffUsing)
					if(src.Energy<src.EnergyMax/10)return
					if(src.ActiveBuffs>=1) return
					src.ActiveBuffs+=3
					src.Power_Multiplier+=0.5
					src.SpeedMultiplier*=0.7
					src.EnduranceMultiplier*=1.85
					src.ResistanceMultiplier*=1.85
					src.OMessage(10,"[src] uses Earth Magic to boost their endurance!","<font color=red>[src]([src.key]) activated Earthen Wall.")
					Z.BuffUsing=1
				else
					src.Power_Multiplier-=0.5
					src.SpeedMultiplier/=0.7
					src.EnduranceMultiplier/=1.85
					src.ResistanceMultiplier/=1.85
					src.OMessage(10,"[src] dispels their Earthen Wall!","<font color=red>[src]([src.key]) deactivated Earthen Wall.")
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					Z.BuffUsing=0
				sleep(10)
			if("MistVeil")
				if(!Z.BuffUsing)
					if(src.Energy<src.EnergyMax/10)return
					if(src.ActiveBuffs>=1) return
					src.ActiveBuffs+=3
					src.Power_Multiplier+=0.5
					src.OffenseMultiplier*=0.80
					src.DefenseMultiplier*=1.25
					src.ForceMultiplier*=1.25
					src.RegenerationMultiplier*=1.5
					src.RecoveryMultiplier*=1.15
					src.OMessage(10,"[src] uses Water Magic to boost their evasion!","<font color=red>[src]([src.key]) activated Mist Veil.")
					Z.BuffUsing=1
				else
					src.Power_Multiplier-=0.5
					src.OffenseMultiplier/=0.80
					src.DefenseMultiplier/=1.25
					src.ForceMultiplier/=1.25
					src.RegenerationMultiplier/=1.5
					src.RecoveryMultiplier/=1.15
					src.OMessage(10,"[src] dispels their Mist Veil!","<font color=red>[src]([src.key]) deactivated Mist Veil.")
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					Z.BuffUsing=0
				sleep(10)
			if("StoneWall")
				if(src.ActiveBuffs>=3) return
				src.ActiveBuffs+=3
				if(!Z.BuffUsing)
					src.Power_Multiplier+=0.5
					src.SpeedMultiplier*=0.5
					src.EnduranceMultiplier*=2
					src.ResistanceMultiplier*=2
					src.DefenseMultiplier*=0.5
					src.RecoveryMultiplier*=0.5
					src.RegenerationMultiplier*=0.5
					src.OMessage(10,"[src] stands their ground, prepared to receive any attack!","<font color=red>[src]([src.key]) activated Stone Wall.")
					Z.BuffUsing=1
				else
					src.Power_Multiplier-=0.5
					src.SpeedMultiplier/=0.5
					src.EnduranceMultiplier/=2
					src.ResistanceMultiplier/=2
					src.DefenseMultiplier/=0.5
					src.RecoveryMultiplier/=0.5
					src.RegenerationMultiplier/=0.5
					src.OMessage(10,"[src] relaxes their defenses back to normal!","<font color=red>[src]([src.key]) deactivated Stone Wall.")
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					Z.BuffUsing=0
				sleep(10)
			if("MoonBerserker")
				if(!Z.BuffUsing)
					if(src.LunarWrathCD)
						src << "Lunar Wrath is still on cooldown."
						return
					src.Anger = src.AngerMax*3
					if(src.Anger < 3)
						src.Anger=3
					src.OMessage(10,"[src] glows with the power of the moon!!","<font color=red>[src]([src.key]) activated Lunar Wrath.")
					src.LunarWrath=1
					Z.BuffUsing=1
				else
					src.OMessage(10, "[src] relinquishes the power of the moon...","[src]([src.key]) deactivated Lunar Wrath.")
					src.Anger=0;
					src.LoseEnergy(src.Energy/2)
					Z.BuffUsing=0
					src.LunarWrath=0
					src.LunarWrathCD=1
					spawn(3000)
						src.LunarWrathCD=0
				sleep(10)
			if("GiantForm")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1) return
					src.ActiveBuffs+=3
					Z:Iconz=src.icon
					if(src.overlays)Z:Overlayz.Add(src.overlays)
					src.overlays-=src.overlays
					var/icon/Heh=new(src.icon)
					src.icon=null
					if(src.Hair)Heh.Blend(Hair,ICON_OVERLAY)
					var/lolol=2*4*4+32
					Heh.Scale(lolol,lolol)
					src.overlays+=image(Heh,pixel_x=-(lolol-32)/2,pixel_y=-(lolol-32)/2)
					if(src.Class=="Shifter")
						if(src.BaseMod==1.25)
							src.PlusPower+=40000000
						if(src.BaseMod==1.5)
							src.PlusPower+=100000000
					src.Base*=5
					src.BaseMod*=5
					src.EnduranceMultiplier*=3
					src.ResistanceMultiplier*=1.5
					src.StrengthMultiplier*=2
					src.Regeneration*=3
					src.Recovery/=2
					src.ControlPower=100
					src.TitanForm=1
					src.Anger=src.AngerMax
					if(src.Class!="Shifter")
						src.DefenseMultiplier*=0.5
						src.OffenseMultiplier*=0.5
					src.OMessage(10,"[src] greatly increases in size!","<font color=red>[src]([src.key]) activated Titan Form.")
					Z.BuffUsing=1
				else
					src.Base/=5
					src.BaseMod/=5
					src.EnduranceMultiplier/=3
					src.ResistanceMultiplier/=1.5
					src.StrengthMultiplier/=2
					src.Regeneration/=3
					src.Recovery*=2
					src.TitanForm=0
					if(src.Class!="Shifter")
						src.DefenseMultiplier/=0.5
						src.OffenseMultiplier/=0.5
					if(src.Class=="Shifter")
						if(src.BaseMod==4)
							src.PlusPower-=40000000
						if(src.BaseMod==8)
							src.PlusPower-=100000000
					src.OMessage(10,"[src] decreases in size.","<font color=red>[src]([src.key]) deactivated Titan Form.")
					src.overlays-=src.overlays
					src.icon=Z:Iconz
					src.overlays.Add(Z:Overlayz)
					Z:Iconz=null
					Z:Overlayz-=Z:Overlayz
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					Z.BuffUsing=0
				sleep(10)

			if("Clear Mind")
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					src.AngerStorage=src.AngerMax
					src.Anger=0
					src.AngerMax=1
					src.Power_Multiplier+=0.75
					src.RecoveryMultiplier*=1.5
					src.EnergyMax*=1.5
					src.EnergyMod*=1.5
					src.Energy*=1.5
					src.OMessage(10,"[src] clears all anger from their mind.","<font color=red>[src]([src.key]) activated Clear Mind.")
				else
					Z.BuffUsing=0
					src.AngerMax=AngerStorage
					src.AngerStorage=0
					src.Power_Multiplier-=0.75
					src.RecoveryMultiplier/=1.5
					src.EnergyMax/=1.5
					src.EnergyMod/=1.5
					src.Energy/=1.5
					src.OMessage(10,"[src] allows anger to exist in their mind once more.","<font color=red>[src]([src.key]) deactivated Clear Mind.")
				sleep(10)
			if("FallenMystic")
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					src.EnergyMax*=1.5
					src.EnergyMod*=1.5
					src.RecoveryMultiplier*=1.5
					src.EnduranceMultiplier*=3
					src.ResistanceMultiplier*=3
					if(src.Race!="Human")
						src.Power_Multiplier+=(AngerMax-1)*1.1
						src.PlusPower*=AngerMax*1.1
					else
						src.Power_Multiplier+=0.55
						src.PlusPower*=0.55
					src.AngerMax/=3
					src.Anger=0
					src.overlays-=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.overlays+=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.Mystic=1
					src.FallenMystic=1
					//src.Hairz("Remove")
					//src.Hairz("Add")
					src<<"You are now in Fallen Mystic."
				//	src.BuffUsingbuff=1
				else
					src<<"You stop using your Fallen Mystic power, and the energy drawn from it forcibly leaves your body, rendering you exhausted!"
					src.overlays-=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					Z.BuffUsing=0
					src.EnergyMax/=1.5
					src.EnergyMod/=1.5
					src.EnduranceMultiplier/=3
					src.ResistanceMultiplier/=3
					src.RecoveryMultiplier/=1.5
					src.AngerMax*=3
					src.FallenMystic=0
					src.Health/=2
					src.Energy/=2
					if(src.Race!="Human")
						src.Power_Multiplier-=(AngerMax-1)*1.1
					else
						src.Power_Multiplier-=0.55
					/*for(var/obj/Skills/Buffs/OlympianFury/x in src)
						if(x.BuffUsing)
							src.SkillX("OlympianFury",x)*/
					src.PlusPower=0
					src.Revert()
					if(src.PlusPower<=0)
						src.PlusPower=0
						src.Revert()
					if(src.MysticTrans)
						src.RevertMystic()
				sleep(20)
			if("Mystic")
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					src.EnergyMax*=1.5
					src.EnergyMod*=1.5
					src.RecoveryMultiplier*=1.5
					src.SpeedMultiplier*=1.25
					//src.Zenkai_Rate = 50
					if(src.Race!="Human")
						src.Power_Multiplier+=(AngerMax-1)*1.1
						src.PlusPower*=AngerMax*1.1
					else
						src.Power_Multiplier+=0.55
						src.PlusPower*=0.55
					src.AngerMax/=3
					src.Anger=0
					src.overlays-=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.overlays+=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.Mystic=1
					//src.Hairz("Remove")
					//src.Hairz("Add")
					src<<"You are now in Mystic."
				//	src.BuffUsingbuff=1
				else
					src<<"You stop using your Mystic power."
					src.overlays-=image(icon='Auras.dmi',icon_state="Mystic",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					Z.BuffUsing=0
					src.EnergyMax/=1.5
					src.EnergyMod/=1.5
					src.SpeedMultiplier/=1.25
					src.RecoveryMultiplier/=1.5
					src.AngerMax*=3
					if(src.Race!="Human")
						src.Power_Multiplier-=(AngerMax-1)*1.1
					else
						src.Power_Multiplier-=0.55
					/*for(var/obj/Skills/Buffs/OlympianFury/x in src)
						if(x.BuffUsing)
							src.SkillX("OlympianFury",x)*/
					src.PlusPower=0
					src.Revert()
					if(src.PlusPower<=0)
						src.PlusPower=0
						src.Revert()
					if(src.MysticTrans)
						src.RevertMystic()
				sleep(20)
			if("Majin")
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					src.Anger=0
					src.Anger=src.AngerMax+0.5
					if(src.AngerMax<2)
						src.Anger=2
					else if(src.AngerMax<=1)
						src.Anger=0
					src.overlays-=image(icon='Auras.dmi',icon_state="Majin",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.overlays+=image(icon='Auras.dmi',icon_state="Majin",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src<<"You are now in Majin."
				else
					src.Anger=0
					src<<"You stop using your Majin power."
					src.overlays-=image(icon='Auras.dmi',icon_state="Majin",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					Z.BuffUsing=0
					src.usingbuff=0
					if(src.MajinTrans==1)
						src.RevertDT()
				sleep(20)
			if("WON")
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=3) return
					if(src.Energy<src.EnergyMax/10)return
					if(src.Health<=10)return
					src.ActiveBuffs+=3
					Z.BuffUsing=1
					src.BaseMod*=1.5
					src.Base*=1.5
					src.StrengthMultiplier*=1.25
					src.OffenseMultiplier*=1.25
					src.ForceMultiplier*=1.25
					src.EnduranceMultiplier*=1.25
					src.DefenseMultiplier*=1.25
					src.ResistanceMultiplier*=1.25
					src.overlays-=image(icon='Auras.dmi',icon_state="SDj",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.overlays+=image(icon='Auras.dmi',icon_state="SDj",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src<<"You activate your Will of Nothingness."
				else
					src.usingbuff=0
					src.BaseMod/=1.5
					src.Base/=1.5
					src.StrengthMultiplier/=1.25
					src.OffenseMultiplier/=1.25
					src.ForceMultiplier/=1.25
					src.EnduranceMultiplier/=1.25
					src.DefenseMultiplier/=1.25
					src.ResistanceMultiplier/=1.25
					src<<"You stop BuffUsing your Will of Nothingnes."
					src.overlays-=image(icon='Auras.dmi',icon_state="SDj",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					Z.BuffUsing=0
				sleep(20)

			if("DemonicWill")
				if(!Z.BuffUsing)
					var/choice=alert(src, "Are you sure you want to use Demonic Will?  You can only use it once!", "Demonic Will", "Fire it up", "Nah, let's hold off")
					if(choice!="Fire it up")
						return
					Z.BuffUsing=1
					src.OMessage(10, "[src] succumbs to their demonic impulses...", "[src]([src.key]) used Demonic Will.")
					src.BaseMod*=1.75
					src.Base*=1.75
					src.StrengthMultiplier*=1.75
					src.ForceMultiplier*=1.75
					src.OffenseMultiplier*=1.75
					src.SpeedMultiplier*=1.25
					src.TotalInjury=0
					src.TotalFatigue=0
					src.Health=100
					src.Energy=src.EnergyMax
					src.SatsuiNoHado=1
				else
					src.BaseMod/=1.75
					src.Base/=1.75
					src.StrengthMultiplier/=1.75
					src.ForceMultiplier/=1.75
					src.OffenseMultiplier/=1.75
					src.SpeedMultiplier/=1.25
					src.Health=-10
					src.Energy=1
					src.SatsuiNoHado=0
					Z.BuffUsing=0
					for(var/obj/Skills/Buffs/DemonicWill/dw in src)
						del dw
				sleep(20)

			if("DivineBlessing")//Gogo Kaio Racial
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1) return
					if(src.Energy<src.EnergyMax/10)return
					if(src.Health<=10)return
					src.ActiveBuffs+=3
					Z.BuffUsing=1
					src.BaseMod*=1.5
					src.Base*=1.5
					src.EnduranceMultiplier*=1.4
					src.DefenseMultiplier*=1.4
					src.ResistanceMultiplier*=1.4
					src.see_invisible=1
					//src.RecoveryMultiplier/=1.2 Because jesse said nerfs on kaios are bad, mkay
					src.overlays-=image(icon='Auras.dmi',icon_state="DB",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.overlays+=image(icon='Auras.dmi',icon_state="DB",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src<<"You are now using your blessed power."
				else
					src.usingbuff=0
					src.BaseMod/=1.5
					src.Base/=1.5
					src.EnduranceMultiplier/=1.4
					src.DefenseMultiplier/=1.4
					src.ResistanceMultiplier/=1.4
					src.see_invisible=0
					//src.RecoveryMultiplier*=1.2
					src<<"You stop using your blessed power."
					src.overlays-=image(icon='Auras.dmi',icon_state="DB",pixel_x=src.pixel_x,pixel_y=src.pixel_y)
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
					Z.BuffUsing=0
				sleep(20)

			if("CursedBlade")
				var/found=0
				for(var/obj/Items/Sword/S in src)
					if(S.suffix)
						found=1
				if(!found)
					src << "Equip a sword first."
					return
				if(src.StanceActive==1) return
				if(!Z.BuffUsing)
					if(src.ActiveBuffs>=1) return
					src.ActiveBuffs+=3
					src.Power_Multiplier+=0.5
					src.StrengthMultiplier*=1.25
					src.SpeedMultiplier*=1.35
					src.OffenseMultiplier*=1.25
				//	src.Recovery/=1.5
					src.overlays-=Z.sicon
					src.overlays+=Z.sicon
					src<<"You are now tapping into the power you've gained from wielding a blade."
					src.OMessage(10,null,"[src]([src.key]) has a black aura form around them!")
					Z.BuffUsing=1
				else
					src.Power_Multiplier-=0.5
					src.StrengthMultiplier/=1.25
					src.SpeedMultiplier/=1.35
					src.OffenseMultiplier/=1.25
			//		src.Recovery*=1.5
					src<<"You stop using your blade's power."
					src.OMessage(10,null,"[src]([src.key])'s black aura fades!")
					src.overlays-=Z.sicon
					Z.BuffUsing=0
					src.ActiveBuffs-=3
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
				sleep(20)

			if("BloodDrain")
				if(Z.Using)return
				if(!src.BloodDrain)
					src.BloodDrain=1
					src.OffenseMultiplier*=0.75
					src.StrengthMultiplier*=0.75
					src<<"You'll feed on anyone you grab ahold of!"
					src.OMessage(15,"[src]'s looks hungry!","<font color=red>[src]([src.key]) activated Blood Drain.")
					Z.Using=1
					sleep(150)
					if(src.BloodDrain)
						src.BloodDrain=0
						src.OffenseMultiplier/=0.75
						src.StrengthMultiplier/=0.75
						src<<"You stop feeding."
						src.OMessage(15,"[src] no longer hungers!","<font color=red>[src]([src.key]) deactivated Blood Drain.")
						sleep(600)
						src<<"Blood Drain CD is over!"
						Z.Using=0

				else
					src.BloodDrain=0
					src.OffenseMultiplier/=0.75
					src.StrengthMultiplier/=0.75
					src<<"You stop feeding."
					src.OMessage(15,"[src] no longer hungers!","<font color=red>[src]([src.key]) deactivated Blood Drain.")
					sleep(600)
					src<<"Blood Drain CD is over!"
					Z.Using=0
				sleep(10)

			if("LifeDrain")
				if(Z.Using)return
				if(src.BloodDrain==0)
					src.BloodDrain=1
					src.LifeDrain=1
					src.OffenseMultiplier*=0.85
					src.StrengthMultiplier*=0.85
					src<<"You'll feed on anyone you grab ahold of!"
					src.OMessage(15,"[src]'s looks hungry!","<font color=red>[src]([src.key]) activated Blood Drain.")
					Z.Using=1
					sleep(150)
					if(src.BloodDrain)
						src.BloodDrain=0
						src.LifeDrain=0
						src.OffenseMultiplier/=0.85
						src.StrengthMultiplier/=0.85
						src<<"You stop feeding."
						src.OMessage(15,"[src] no longer hungers!","<font color=red>[src]([src.key]) deactivated Blood Drain.")
						sleep(600)
						src<<"Life Drain CD is over!"
						Z.Using=0

				else
					src.BloodDrain=0
					src.LifeDrain=0
					src.OffenseMultiplier/=0.85
					src.StrengthMultiplier/=0.85
					src<<"You stop feeding."
					src.OMessage(15,"[src] no longer hungers!","<font color=red>[src]([src.key]) deactivated Blood Drain.")
					sleep(600)
					src<<"Life Drain CD is over!"
					Z.Using=0
				sleep(10)
			if("Meteor")
				if(!Z.Using)
					if(src.ManaAmount<=0)
						src<<"You don't have enough Mana to start casting this."
						return
					if(src.Alert("You sure you want to cast this?"))
						src.OMessage(20,"[src] began chanting as flames enveloped their body!","[src]([src.key]) started to cast Meteor!")
						sleep(25)
						src.OMessage(20,"Meteors begin descending from the heavens.","<font color=red>[src]([src.key]) activated Meteor.")
						Z.Using=1
						src.Meteor_Shower(Z)
						if(src.ManaAmount<=0) Z.Using=0
				else
					src.OMessage(0,"[src] ceases the stream of meteors.","<font color=red>[src]([src.key]) deactivated Meteor")
					Z.Using=0
				sleep(10)
				Z.Cooldown()
			if("UBW")
				if(src.KO) return
				if(!Z.Using)
					if(src.Alert("You sure you want to use this?"))
						var/list/people=list("Cancel")
						for(var/mob/M in oview(12,src))
							people.Add(M)
						var/mob/Choice=input("Home onto who?")in people
						if(Choice=="Cancel")return
						if(src.Health<=5||Choice.KO) return
						src.UBWChant()
						Z.Using=1
						src.PrevX=src.x
						src.PrevY=src.y
						src.PrevZ=src.z
						Choice.PrevX=Choice.x
						Choice.PrevY=Choice.y
						Choice.PrevZ=Choice.z
						src.loc=locate(277,280,13)
						Choice.loc=locate(277,275,13)
						src.UBWUser=1
						src.UBWTarget=1
						src.UnlimitedBladeWorks(Z,Choice)
				else
					src.OMessage(0,"[src] deactivated Unlimited Blade Works.","<font color=red>[src]([src.key]) deactivated Unlimited Blade Works.")
					src.Energy=1
					Z.Using=0
					src.TotalFatigue+=30
				sleep(10)

			/*if("EnchantedCursedBlade") //go go concept
				if(!Z.Using)
					Z.Using=1
					src.ForceMultiplier*=1.25
					src.RegenerationMultiplier/=1.5
					src.RecoveryMultiplier*=1.5
					src.overlays-=Z.sicon
					src.overlays+=Z.sicon
					src<<"You are now tapping into the true power you've gained from wielding a cursed blade."
					src.OMessage(10,null,"[src]([src.key]) has a black aura form around them!")
				else
					src.ForceMultiplier/=1.25
					src.RegenerationMultiplier*=1.5
					src.RecoveryMultiplier/=1.5
					src<<"You stop using your cursed power."
					src.OMessage(10,null,"[src]([src.key])'s black aura fades!")
					src.overlays-=image(Z.sicon,Z.pixel_x=Z.pixel_x,Z.pixel_y=Z.pixel_y)
					Z.Using=0
					src.ActiveBuffs-=1
					if(src.ActiveBuffs<=-1)
						src.ActiveBuffs=0
				sleep(20)*/
			if("CustomBuff")
				if(!Z.BuffUsing)
					if(src.Energy<src.EnergyMax/10)return
					src.Power_Multiplier+=Z.CustomBPmod
					src.PlusPower+=Z.CustomBPadd
					src.StrengthMultiplier*=Z.CustomStr
					src.ForceMultiplier*=Z.CustomForce
					src.EnduranceMultiplier*=Z.CustomDura
					src.ResistanceMultiplier*=Z.CustomRes
					src.OffenseMultiplier*=Z.CustomOff
					src.DefenseMultiplier*=Z.CustomDef
					src.SpeedMultiplier*=Z.CustomSpeed
					src.RecoveryMultiplier*=Z.CustomRecov
					src.RegenerationMultiplier*=Z.CustomRegen
					src.AngerMax*=Z.CustomAnger
					src.overlays+=Z.sicon
					Z.BuffUsing=1
				else
					src.Power_Multiplier-=Z.CustomBPmod
					src.PlusPower-=Z.CustomBPadd
					src.StrengthMultiplier/=Z.CustomStr
					src.ForceMultiplier/=Z.CustomForce
					src.EnduranceMultiplier/=Z.CustomDura
					src.ResistanceMultiplier/=Z.CustomRes
					src.OffenseMultiplier/=Z.CustomOff
					src.DefenseMultiplier/=Z.CustomDef
					src.SpeedMultiplier/=Z.CustomSpeed
					src.RecoveryMultiplier/=Z.CustomRecov
					src.RegenerationMultiplier/=Z.CustomRegen
					src.AngerMax/=Z.CustomAnger
					src.overlays-=Z.sicon
					Z.BuffUsing=0
				sleep(10)
			if("KeepBody")
				for(var/mob/Players/P in get_step(src,dir))
					if(P.KeepBody)
						if(!P.KO) return
						P.KeepBody=0
						src.OMessage(10,"[src] takes [P]'s body","[src]([src.key]) took [P]([P.key]) 's body")

					else
						P.KeepBody=1
						src.OMessage(10,"[src] gives [P]'s their body.","[src]([src.key]) gave [P]([P.key]) their body.")
					break
			if("GivePower")
				if(Z.Using)
					return
				if(!src.KO)
					if(Energy>EnergyMax/2)
						for(var/mob/P in get_step(src,dir))
							if(!prob(Z.Level/5))
								src.Unconscious(null,"giving power to [P]!")
							src.Health=1
							src.Energy=1
							P.Energy+=src.EnergyMax
							src.OMessage(10,null,"[src]([src.key]) gave power to [P]([P.key])")
							Z.Skill_Increase(3)
							src.SkillLeech(Z)
							return
					Z.Cooldown()



			if("KaioTeleport")
				if(!src.KO&&src.Energy>=src.EnergyMax)
					src.OMessage(10,"[src] seems to be concentrating..")
					var/zz
					var/Where=input(src,"Choose Destination", "", text) in list ("Midland", "Death Valley", "Nigeria", "The North Pole", "TRON", "The Grand Line", "Kaioshin", "Moltres", "Anti-Earth", "Demon Realm", "Tavern", "Sanctuary", "Nevermind")
					switch(Where)
						if("Midland")
							zz=6
						if("Death Valley")
							zz=3
						if("Nigeria")
							zz=5
						if("TRON")
							zz=7
						if("The North Pole")
							zz=4
						if("Moltres")
							zz=26
						if("Anti-Earth")
							zz=27
						if("Sanctuary")
							zz=18
						if("Demon Realm")
							zz=21
						if("Tavern")
							zz=13
						if("The Grand Line")
							zz=15
						if("Nevermind") return
					if(!src.KO&&src.Energy>=src.EnergyMax/2)
						src.Energy/=2
			//			src.SkillLeech(Z)
						src.OMessage(10,"[src] suddenly vanishes!","<font color=aqua>[src]([src.key]) KaioTeleported to [Where].")
						for(var/mob/V in view(1,src.client.eye))
							if(V.client&&V!=src)
								spawn(20)V.loc=locate(usr.x,usr.y,usr.z)
								V.x-=1

								V<<"[usr] brings you with them using teleportation."
								V.ChatLog("<font color=aqua>[src]([src.key]) KaioTeleported to [Where] with [V]([V.key]).")
								src.ChatLog("<font color=aqua>[src]([src.key]) KaioTeleported to [Where] with [V]([V.key]).")
						if(Where=="Kaioshin")
							src.x=267
							src.y=318
							src.z=10
/*				else if(Where=="Midland")
							src.x=265
							src.y=260
							src.z=6
						else if(Where=="Death Valley")
							src.x=92
							src.y=390
							src.z=3
						else if(Where=="Nigeria")
							src.x=290
							src.y=250
							src.z=5
						else if(Where=="The North Pole")
							src.x=250
							src.y=250
							src.z=4
						else if(Where=="TRON")
							src.x=246
							src.y=215
							src.z=7
						else if(Where=="Moltres")
							src.x=240
							src.y=240
							src.z=26*/
						else if(Where=="Anti-Earth")
							src.x=126
							src.y=434
							src.z=27
						else if(Where=="Sanctuary")
							src.x=235
							src.y=132
							src.z=18
						else if(Where=="Demon Realm")
							src.x=106
							src.y=354
							src.z=21
						else if(Where=="Tavern")
							src.x=441
							src.y=467
							src.z=13
						else
							src.x=rand(1,500)
							src.y=rand(1,500)
							src.z=zz
					else src<<"You need more ki to use this."
				else src<<"You need full ki to use this."
			if("Kiai")
				if(Z.Using)
					return
				if(src.KO)return
				if(src.Energy>EnergyMax/20)
					Z.Cooldown()
					src.Energy-=src.EnergyMax/20
					Z.Skill_Increase(1.75)
					src.SkillLeech(Z)
					KenShockwave(src,icon='fevKiai.dmi',Size=4)

					KenShockwave(src,icon='fevKiai.dmi',Size=2)

					KenShockwave(src,icon='fevKiai.dmi',Size=0.5)
					for(var/mob/P in oview(7,src))
						var/Damage=src.ForVsRes(P, 2)
						var/Knock_Distance=12-get_dist(src,P)//round((src.Power*(src.Force*src.ForceMultiplier))/(P.Power*(P.Resistance*P.ResistanceMultiplier))*rand(sqrt(Z.Level)/10,sqrt(Z.Level)/5))
						if(src.DiplomaticImmunity || P.DiplomaticImmunity)
							Damage*=0
						P.Health-=Damage
						P.Knockback(Knock_Distance,src)
/*					if(src.Class=="Bones")
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)*/
					sleep(5)
			if("SweepingBlade")
				if(src.KO||Z.Using==1)return
				if(src.Energy>EnergyMax/10)
					for(var/obj/Items/Sword/S in usr)
						if(S.suffix)
							Z.Cooldown()
							SweepingBlade(src)
							src.OMessage(20,"[src] sweeps their blade wildly around them!","[src]([src.key]) used Sweeping Blade!")
							for(var/mob/P in oview(1))

								var/Damage=src.StrVsEnd(P, 3)
								var/Accuracy=((src.Offense*src.OffenseMultiplier)/(P.Defense*P.DefenseMultiplier))*50
								if(P!=src)
									if(prob(Accuracy)&&!P.GER)
										if(src.DiplomaticImmunity || P.DiplomaticImmunity)
											Damage*=0
										P.Health-=Damage*2
										Slow(P, 10, 50)
										Slash(P)
										P.Knockback(3,src)
									src.Energy-=src.EnergyMax/50
								Z.Skill_Increase(5)
							sleep(50)
						else if(!S.suffix && !Z.Using)
							src<<"You can't use this without a sword equiped!"
			if("SweepingKick")
				if(src.KO||Z.Using==1||src.Frozen)return
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						usr<< "Hitting with the blunt side of a sword would probably break it."
						return
				if(src.Energy>EnergyMax/10)
					Z.Using=1
					var/wait = rand(200, 800)
					spawn(wait)
						if(src)
							Z.Using=0
							src<<"Sweeping Kick CD finished."
					SweepingKick(src)
					src.OMessage(20,"[src] sweeps their foot around them!","[src]([src.key]) used Sweeping Kick!")
					for(var/mob/P in view(1))

						var/Damage=src.StrVsEnd(P)
						var/Accuracy=((src.Offense*src.OffenseMultiplier)/(P.Defense*P.DefenseMultiplier))*75
						if(P!=src)
							if(prob(Accuracy)&&!P.GER)
								HitEffect(P)
								if(src.DiplomaticImmunity || P.DiplomaticImmunity)
									Damage*=0
								P.Health-=Damage
								P.Knockback(1,src)
								Stun(P,amount=3)
							src.Energy-=src.EnergyMax/50
					sleep(50)
			if("Magnet")
				if(src.KO||Blocking)return
				if(src.Energy>EnergyMax/8)
					for(var/mob/P in oview(src))
						var/Damage=(src.Power*(src.Force*src.ForceMultiplier))/(P.Power*(P.Resistance*P.ResistanceMultiplier))*rand(sqrt(Z.Level)/10,sqrt(Z.Level)/5)
						var/Knock_Distance=round((src.Power*(src.Force*src.ForceMultiplier))/(P.Power*(P.Resistance*P.ResistanceMultiplier))*rand(sqrt(Z.Level)/10,sqrt(Z.Level)/5))
						Knock_Distance+=(Knock_Distance*-2)
						if(src.DiplomaticImmunity || P.DiplomaticImmunity)
							Damage*=0
						P.Health-=Damage
						P.Knockback(Knock_Distance,src)
						src.Energy-=src.EnergyMax/8
						Z.Skill_Increase(1.75)
						Z.Cooldown()
//						src.SkillLeech(Z)
					sleep(50)
			if("Invisible")
				if(!src.invisibility)
					src.invisibility=1
/*					src.see_invisible=1*/
					src<<"You are now invisible."
					src.OMessage(10,null,"<font color=red>[src]([src.key]) turns invisible.")
				else
					src.invisibility=0
/*					src.see_invisible=0*/
					src<<"You are now visible."
					src.OMessage(10,null,"<font color=red>[src]([src.key]) turns visible.")

			if("DesoInvisible")
				if(!src.invisibility)
					src.invisibility=70
					src.see_invisible=60
					src<<"You are now invisible."
					src.OMessage(10,null,"<font color=red>[src]([src.key]) turns invisible.")
				else
					src.invisibility=0
					src.see_invisible=0
					src<<"You are now visible."
					src.OMessage(10,null,"<font color=red>[src]([src.key]) turns visible.")

			if("BurningShot")
				if(!Z.BuffUsing)
					if(src.KO)return
					if(src.ActiveBuffs)
						src << "You can't use this with another normal buff."
						return
//					Z.Using=1
					Z.BuffUsing=1
					src.ActiveBuffs=3
					var/choice=input(src, "What level of Burning Shot do you want to use?", "Burning Shot") in list("1.5", "2", "3", "Nevermind")
					if(choice=="Nevermind")
						Z.BuffUsing=0
						src.ActiveBuffs=0
						return
					src.overlays+=image('Burning Shot.dmi',pixel_x=-32)
					view(src)<<"[src] envelops their body in a raging inferno!"
					Z:num=text2num(choice)
					src.Power_Multiplier+=0.25
					src.StrengthMultiplier*=Z:num
					src.EnduranceMultiplier*=Z:num
					src.ForceMultiplier*=Z:num
					src.ResistanceMultiplier*=Z:num
					src.OffenseMultiplier*=Z:num
					src.DefenseMultiplier*=Z:num
					Z.Using=0
					if(Z:num==1.5)
						spawn(10*60*5)
							for(var/obj/Skills/Rank/BurningShot/bs)
								src.SkillX("BurningShot", bs)
					if(Z:num==2)
						spawn(10*60*2)
							for(var/obj/Skills/Rank/BurningShot/bs)
								src.SkillX("BurningShot", bs)
					if(Z:num==3)
						spawn(10*90)
							for(var/obj/Skills/Rank/BurningShot/bs)
								src.SkillX("BurningShot", bs)

					/*if(src.SpecialSlot)
						src << "You're already using a special buff."
						return
					src.SpecialSlot=1
					Z.BuffUsing=1
					var/amount=input(src,"How high do you want to raise your stats? Minimum is 1.25x, max is 2x") as num

					if(amount<=1.25)
						amount=1.25
					if(amount>=2)
						amount=2
					src.overlays+=image('Burning Shot.dmi',pixel_x=-32)
					view(src)<<"[src] envelops their body in a raging inferno!"
					src.StrengthMultiplier*=amount
					src.EnduranceMultiplier*=amount
					src.ForceMultiplier*=amount
					src.ResistanceMultiplier*=amount
					src.OffenseMultiplier*=amount
					src.DefenseMultiplier*=amount
					src.BurningShot=amount
					src.Burning+=0.025*amount
					spawn()src.Burning_Check()
//					src.burningShot_loop(Z) // pass along object reference
*/
				else
					if(Z.Using)
						src << "Don't spam this."
						return
					Z.BuffUsing=0
					src.ActiveBuffs=0
					src.Power_Multiplier-=0.25
					src.StrengthMultiplier/=Z:num
					src.EnduranceMultiplier/=Z:num
					src.ForceMultiplier/=Z:num
					src.ResistanceMultiplier/=Z:num
					src.OffenseMultiplier/=Z:num
					src.DefenseMultiplier/=Z:num
					if(Z:num==1.5)
						src.Burning+=5
					if(Z:num==2)
						src.Burning+=10
					if(Z:num==3)
						src.Burning+=20
					Z:num=0
					src.overlays-=image('Burning Shot.dmi',pixel_x=-32)
					src << "You stop being on fire."
					src.Burning_Check()

					/*src.SpecialSlot=0
					src.StrengthMultiplier/=src.BurningShot
					src.EnduranceMultiplier/=src.BurningShot
					src.ForceMultiplier/=src.BurningShot
					src.ResistanceMultiplier/=src.BurningShot
					src.OffenseMultiplier/=src.BurningShot
					src.DefenseMultiplier/=src.BurningShot
					src.Energy*=0.8
					src.BurningShot=0
					src.overlays-=image('Burning Shot.dmi',pixel_x=-32)
					src << "You stop being on fire."
					Z.BuffUsing=0*/

/*				if(src.BurningShot>0||src.KO)
					return
				else if(!src.BurningShot&&!src.KO)
					var/Select=input("Which level of power do you want to use? The higher the power the quicker it deactivates!") in list ("Normal", "High", "Highest", "Cancel")
					switch(Select)
						if("Cancel")return
						if("Normal")
							src.StrengthMultiplier*=1.5
							src.EnduranceMultiplier*=1.5
							src.ForceMultiplier*=1.5
							src.ResistanceMultiplier*=1.5
							src.OffenseMultiplier*=1.5
							src.DefenseMultiplier*=1.5
							src.BurningShot=1
							src<<"You have activated Burning Shot!"
							src.overlays+=image('Burning Shot.dmi',pixel_x=-32)
							view(src)<<"[src]'s body seems to be on fire!"
							sleep(30*Z.Level)
							if(src.BurningShot=1)
								src.overlays-=image(icon='Burning Shot.dmi',pixel_x=-32)
								src.StrengthMultiplier/=1.5
								src.EnduranceMultiplier/=1.5
								src.ForceMultiplier/=1.5
								src.ResistanceMultiplier/=1.5
								src.OffenseMultiplier/=1.5
								src.DefenseMultiplier/=1.5
								src.RecoveryMultiplier/=10
								src<<"Your Burning Shot clocks out, your energy and power crash!"
								view(src)<<"[src]'s power crashes as their flames clock out!"
								src.Energy/=2
								src.BurningShotBP=0
								sleep(3000/Body)
								src.BurningShot=0
								src.RecoveryMultiplier*=10
								src<<"Burning Shot cooldown is over!"
								Z.Skill_Increase(10)
						if("High")
							src.StrengthMultiplier*=2.25
							src.EnduranceMultiplier*=2.25
							src.ForceMultiplier*=2.25
							src.ResistanceMultiplier*=2.25
							src.OffenseMultiplier*=2.25
							src.DefenseMultiplier*=2.25
							src.BurningShot=1
							src<<"You have activated Second Degree Burning Shot!"
							src.overlays+=image('Burning Shot.dmi',pixel_x=-32)
							view(src)<<"[src]'s body seems to be on fire!"
							sleep(20*Z.Level)
							if(src.BurningShot=1)
								src.overlays-=image(icon='Burning Shot.dmi',pixel_x=-32)
								src.StrengthMultiplier/=2.25
								src.EnduranceMultiplier/=2.25
								src.ForceMultiplier/=2.25
								src.ResistanceMultiplier/=2.25
								src.OffenseMultiplier/=2.25
								src.DefenseMultiplier/=2.25
								src.RecoveryMultiplier/=10
								src<<"Your Burning Shot clocks out, your energy and power crash!"
								view(src)<<"[src]'s power crashes as their flames clock out!"
								src.Energy/=4
								src.BurningShotBP=0
								sleep(3000/Body*3)
								src.BurningShot=0
								src.RecoveryMultiplier*=10
								src<<"Burning Shot cooldown is over!"
								Z.Skill_Increase(10)
						if("Highest")
							src.StrengthMultiplier*=3.375
							src.EnduranceMultiplier*=3.375
							src.ForceMultiplier*=3.375
							src.ResistanceMultiplier*=3.375
							src.OffenseMultiplier*=3.375
							src.DefenseMultiplier*=3.375
							src.BurningShot=1
							src<<"You have activated Third Degree Burning Shot!"
							src.overlays+=image('Burning Shot.dmi',pixel_x=-32)
							view(src)<<"[src]'s body seems to be on fire!"
							sleep(10*Z.Level)
							if(src.BurningShot=1)
								src.overlays-=image(icon='Burning Shot.dmi',pixel_x=-32)
								src.StrengthMultiplier/=3.375
								src.EnduranceMultiplier/=3.375
								src.ForceMultiplier/=3.375
								src.ResistanceMultiplier/=3.375
								src.OffenseMultiplier/=3.375
								src.DefenseMultiplier/=3.375
								src.RecoveryMultiplier/=10
								src<<"Your Burning Shot clocks out, your energy and power crash!"
								view(src)<<"[src]'s power crashes as their flames clock out!"
								src.Energy/=6
								src.BurningShotBP=0
								sleep(3000/Body*5)
								src.BurningShot=0
								src.RecoveryMultiplier*=10
								src.<<"Burning Shot cooldown is over!"
								Z.Skill_Increase(10)*/
			if("SpiritBurst")
				if(src.SpiritBurst)
					src.SpecialSlot=0
					src<<"You stop using Spirit Burst."
					src.SpiritBurst=0
					if(src.PowerUp)
						src.PowerUp=0
						src.Auraz("Remove")
					src.Energy=1
				else if(!src.SpiritBurst&&!src.KO)
					if(src.SpecialSlot)
						src << "You're already using a special buff."
						return
					src.SpecialSlot=1
					var/amount=input(src,"How high do you want to power up?") as num
					if(amount<100) amount=101
					amount=round(amount)
					if(amount>=300)
						amount=300
					if(usr.Race=="Android"&&amount>=250)
						amount=250
					if(!usr.SpiritBurst)
						if(src.PowerDown&&!src.PowerUp)
							src.Auraz("Remove")
							src.PowerDown=0
						view(src)<<"[src]'s power spikes upwards at a rapid rate!"
						src.ControlPower=amount
						if(!src.PowerUp&&!src.PowerDown)
							src.PowerUp=1
							src.Auraz("Add")
						src.SpiritBurst=1
						src.OMessage(15,null,"<font color=red>[src]([src.key]) uses Spirit Burst.")
				return
			if("EightGates")
				if(src.EightGates)
					src<<"You stop using the Eight Gates."
					src.EightGates=0
					if(src.GateNumber>=8)
						src.Death(null, "strain from the final gate!")
					src.Energy/=src.GateNumber
					src.Energy=min(src.Energy,src.EnergyMax)
					src.GateNumber=0
				else if(!src.EightGates&&!src.KO)
					var/amount=input(src,"Which gate do you want to unlock?") as num
					if(amount<1) amount=1
					amount=round(amount)
					if(amount>=8)
						amount=8
					if(!usr.EightGates)
						view(src)<<"[src]'s power spikes upwards at a rapid rate, multiplying their energy many times over!"
						src.EightGates=1
						src.GateNumber=amount
						if(src.GateNumber>=7)
							src.Health=100
							src.Energy=src.EnergyMax
						src.Energy*=(amount/2)+1
						if(src.GateNumber==8)
							src.Health=100
							src.Energy=src.EnergyMax*20
							if(!locate(/obj/Skills/MartialArts/EveningElephant,src.contents))
								src.contents += new/obj/Skills/MartialArts/EveningElephant
						src.OMessage(15,null,"<font color=red>[src]([src.key]) uses the Eight Gates.")
				return
			if("SuperKaioken")
				if(src.SuperKaioken)
					src<<"You stop using Kaioken."
					src.SuperKaioken=0
					src.RPPower/=5
					src.SpeedMultiplier/=5
					src.overlays-=image(icon='AurasBig.dmi',icon_state="Kaioken",pixel_x=-32)
				else if(!src.SuperKaioken&&!src.KO&&!src.KaiokenActive)
					if(!src.SuperKaiokenUnlocked)
						src << "You do not have this technique unlocked..."
						return
					if(!src.SuperKaioken)
						src.overlays+=image(icon='AurasBig.dmi',icon_state="Kaioken",pixel_x=-32)
						view(src)<<"An explosive red aura bursts all around [src]!!!"
						src.SuperKaioken=1
						src.RPPower*=5
						src.SpeedMultiplier*=5
						src.OMessage(15,null,"<font color=red>[src]([src.key]) uses Super Kaioken.")
			if("Kaioken")
				if(src.KaiokenActive)
				//	src.SpecialSlot=0
					src<<"You stop using Kaioken."
					src.KaiokenActive=0
					src.RPPower/=1+(src.KaiokenLevel/10)
					src.KaiokenLevel=0
					src.SuperKaioken=0
					src.overlays-=image(icon='AurasBig.dmi',icon_state="Kaioken",pixel_x=-32)
				else if(!src.KaiokenActive&&!src.KO&&!src.SuperKaioken)
				//	src << "You're already using a special buff."
				//	return
				//	src.SpecialSlot=1
					var/amount=input(src,"Kaioken multiple. (You have Kaioken x[src.KaiokenMastery] mastered)") as num
					if(amount<1) amount=1
					amount=round(amount)
					if(amount>=20)
						amount=20
					if(!usr.KaiokenActive)
						src.overlays+=image(icon='AurasBig.dmi',icon_state="Kaioken",pixel_x=-32)
						view(src)<<"A bright red aura bursts all around [src]."
					/*	if(amount>=20)
							amount=20*/
						if(amount>=31)
							src.SuperKaioken=1
							amount=30
						src.KaiokenActive=1
						src.KaiokenLevel=amount
						src.RPPower*=1+(src.KaiokenLevel/10)
						src.OMessage(15,null,"<font color=red>[src]([src.key]) uses Kaioken x[amount].")
			if("ChaosImitate")
			{
				if(src.KO||Blocking)return
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					Z:imitatorname=src.name
					Z:imitatoroverlays.Add(src.overlays)
					Z:imitatoricon=src.icon
					var/list/People=new/list
					for(var/mob/A in world) if(A.client) People.Add(A)
					var/mob/Choice=People[rand(1, People.len)];
					if(Choice)
						src.icon=Choice.icon
						src.overlays.Remove(src.overlays)
						src.overlays.Add(Choice.overlays)
						src.name=Choice.name
				else
					Z.BuffUsing=0
					src.name=Z:imitatorname
					src.overlays.Remove(src.overlays)
					src.overlays.Add(Z:imitatoroverlays)
					src.icon=Z:imitatoricon
					Z:imitatoroverlays.Remove(Z:imitatoroverlays)
			}
			if("Imitate")
				if(src.KO||Blocking)return
				if(!Z.BuffUsing)
					Z.BuffUsing=1
					Z:imitatorname=src.name
					Z:imitatoroverlays.Add(src.overlays)
					Z:imitatoricon=src.icon
					var/list/People=new/list
					for(var/mob/A in oview(src)) if(A.client) People.Add(A)
					var/mob/Choice=input(src,"Imitate who?") in People
					if(Choice)
						src.icon=Choice.icon
						src.overlays.Remove(src.overlays)
						src.overlays.Add(Choice.overlays)
						src.name=Choice.name
						src.OMessage(15,null,"<font color=red>[src]([src.key]) imitates [Choice]([Choice.key])")
					//	src.SkillLeech(Z)
				else
					Z.BuffUsing=0
					src.name=Z:imitatorname
					src.overlays.Remove(src.overlays)
					src.overlays.Add(Z:imitatoroverlays)
					src.icon=Z:imitatoricon
					Z:imitatoroverlays.Remove(Z:imitatoroverlays)
					src.OMessage(15,null,"<font color=aqua>[src]([src.key]) stops imitating.")
		/*	if("Infect")
				if(src.KO||Blocking)return
				var/list/Choices=new
				Choices+=Cancel
				for(var/mob/players/P in get_step(src,dir)) Choices+=P
				var/mob/Choice=input(src,"Infect who?") in Choices
				if(Choice=="Cancel") return
				if(Choice.Health>=2) return
					if(Choice&&src)
						src.Base=Choice.Base
						src.Strength=Choice.Strength
						src.Force=Choice.Force
						src.Endurance=Choice.Endurance
						src.Resistance=Choice.Resistance
						src.Speed=Choice.Speed
						src.Offense=Choice.Offense
						src.Defense=Choice.Defense
						src.Race=Choice.Race
						src.Class=Choice.Class*/



			if("NamekianFusion")
				if(src.KO||Blocking)return
				var/list/Choices=new
				Choices+="Cancel"
				for(var/mob/Players/P in get_step(src,dir)) Choices+=P
				var/mob/Choice=input(src,"Fuse with who?") in Choices
				if(Choice=="Cancel") return
				if(Choice.Race=="Namekian")
					var/answer=input(Choice,"[src] wants to fuse with you, do you accept?")in list("Yes","No")
					if(answer=="Yes")
						if(Choice&&src)
							Choice.Base+=src.Base
							Choice.EnergyMax+=src.EnergyMax/2
							Choice.FlySkill+=10000
							Choice.ZanzokenSkill+=10000
							Choice.Decline+=100
							src.Death(null,"fusing with [Choice]!")
							src.OMessage(10,"[src] fused with [Choice]!","<font color=red>[src]([src.key]) FUSED with [Choice]([Choice.key])")
							Log("Admin","[src] has fused with [Choice]. Please investigate if this was unauthorized.")
			/*if("PotaraFusion")
				src.PFuse()
				if(src.KO||Blocking)return
				var/list/Choices=new
				Choices+="Cancel"
				for(var/mob/Players/P in get_step(src,dir)) Choices+=P
				var/mob/Choice=input(src,"Fuse with who?") in Choices
				if(Choice=="Cancel") return
				if(Choice.Race==src.Race)
					var/answer=input(Choice,"[src] wants to fuse with you, do you accept?")in list("Yes","No")
					if(answer=="Yes")
						if(Choice&&src)
							Choice.Base+=src.Base
							Choice.EnergyMax+=src.EnergyMax/4
							Choice.FlySkill+=10000
							Choice.ZanzokenSkill+=10000
							Choice.Decline+=100
							src.Death(null,"fusing with [Choice]!")
							src.OMessage(10,"[src] fused with [Choice]!","<font color=red>[src]([src.key]) FUSED with [Choice]([Choice.key])")

				if(src.KO||Blocking)return
			//	var/list/Choices=new
			//	Choices+="Cancel"
				for(var/mob/P in world) //Choices+=P
					var/mob/Choice=input(src,"Fuse with who? This will automatically reincarnate you.") in P
					if(Choice=="Cancel") return
					var/answer=input(Choice,"[src] wants to fuse with you, do you accept?")in list("Yes","No")
					if(answer=="Yes")
						if(Choice&&src)
							Choice.Base=(Choice.Base+src.Base)*2
							Choice.EnergyMax+=src.EnergyMax/4
							Choice.FlySkill+=10000
							Choice.ZanzokenSkill+=10000
							Choice.Decline+=100
							src.Death(null,"fusing with [Choice]!")
							fdel("Saves/Players/[src.ckey]")
							//src.Reincarnation()
							src.OMessage(10,"[src] fused with [Choice]!","<font color=red>[src]([src.key]) FUSED with [Choice]([Choice.key])")*/
			if("UnlockPotential")
				if(src.KO||Blocking)return
				var/list/Choices=new
				Choices+="Cancel"
				for(var/mob/Players/P in get_step(src,dir)) Choices+=P
				var/mob/Choice=input(src,"Unlock the Potential of who?") in Choices
				if(Choice=="Cancel") return
				if(Choice.Potential)
					var/tempuses=0
					if(Z:Uses < 1)
						tempuses=1
					if(tempuses)
						if(src.EnergyMax < src.EnergyMod * 100 * (0.25 * tempuses))
							src<<"You don't have enough energy to use this."
							return
					else
						if(src.EnergyMax < src.EnergyMod * 100 * (0.25 * Z:Uses))
							src<<"You don't have enough energy to use this."
							return
					Z:Uses++
					if(Choice.Race=="Pathless")
						Choice.Potential=20
						world << "<font color='#FF00FF': )</font color>"
					if(Choice.Race=="Popo")
						spawn(rand(0,100)) for(var/mob/P in world) P<<sound('PopoLaugh.wav')
						Choice.Potential=10
					if(Choice.Race=="Neko")
					{
						world << "Your heart fills with dread as the scent of cat covers the universe..."
						Choice.Potential=4
					}
					if(Choice.Race=="Manakete")
					{
						Choice.Potential=2
					}
					if(Choice.Class=="Spiral")
						Choice.Potential = 1
					var/Xpotential = Choice.Potential
					if(Choice.Race=="Kurama")
						Choice.trans["1give"]+=Choice.Base*((1+(Choice.Potential * 0.25))*20)
					Choice.BaseMod*=1+(Choice.Potential * 0.05)
					Choice.EnergyMax*=1+(Choice.Potential * 0.25)
					Choice.Potential=0
					src.EnergyMax -= (src.EnergyMod * 100000 * (0.25 * Z:Uses))
					if(Choice.Class=="Spiral")
					{
						Choice.Potential = Xpotential * 2;
						Choice.OriginalPotential=Choice.Potential;
					}
					src.OMessage(10,"[src] unlocked [Choice]'s Potential.","<font color=red>[src]([src.key]) UNLOCKED THE Potential of [Choice]([Choice.key])")
					Log("Admin","[src] has unlocked [Choice]'s Potential. Please investigate if this was unauthorized.")
			if("Regenerate")
				if(!src.Regenerate&&!src.KO&&src.Energy>src.EnergyMax/10&&!Z.Using)
					if(src.Regeneration<4)
						src.Regeneration=4
					src.Regenerate=1
					Z.Using=1
					src.OMessage(10,"[src] starts Regenerating.")
					spawn(450)
						if(src)
							Z.Using=0
							src<<"Regenerate CD finished."
			/*		if(Dead==1)
						src.Regenerate(src)
						src.Dead==0*/

				else
					if(src.Regenerate)
						src.Regenerate=0
						src.OMessage(10,"[src] stops Regenerating.")
						sleep(30)
			if("Materialize")
				var/mob/selection
				var/wordneeded
				if(src.EnergyMax<25000*src.SenseReq)
					selection=src
					wordneeded="You"
				else
					var/mob/peoplesnearby=list("Cancel")
					for(var/mob/Players/A in view(5,usr))
						peoplesnearby+=A
					selection=input("Pick a person, and it'll tell you their max lift.")in peoplesnearby
					if(selection=="Cancel")
						return
					else
						wordneeded="They"
				var/weights=input(src,"How heavy? Between 1 and [Commas(src.WeightFormula(2))] pounds. [wordneeded] can lift [Commas(selection.WeightFormula(2))] Pounds.") as num
				if(weights>src.WeightFormula(2)) weights=src.WeightFormula(2)
				if(weights<1) weights=1
				weights=round(weights)
				var/obj/Items/A=new/obj/Items/Weights
				A.Level=weights
				A.name="Weighted Material([weights] pounds)"
				A.icon='Clothes20.dmi'
				var/colorit=input("Would you like to color this weight?") in list("Yes","No")
				if(colorit=="Yes")
					var/colorz=input("Choose color") as color
					if(colorz)
						A.icon+=colorz
				src.contents+=A
			if("SelfDestruct")
				if(src.Dead)return
				if(src.Alert("You sure you want to Self Destruct?"))
					src.Frozen=1
					src.OMessage(20,"[src] begins gathering all the energy around them into their body!","[src]([src.key]) used self destruct!")
					sleep(1)
					src.OMessage(20,"The ground begins to shake fiercely around [src]!",null)
					sleep(5)
					src.OMessage(20,"A huge explosion eminates from [src] and surrounds the area!")
					if(src.Class=="Butch")
						src.OMessage(20,"[src] cannot die until they defeat Kelvin!")
			//		src.SkillLeech(Z)
					var/obj/x=new/obj/Taiyoken
					for(var/mob/Players/T in view(18))
						spawn()T.Quake(50)

					for(var/turf/T in Turf_Circle(src,36))
						if(prob(2)) sleep(0.005)
						x.layer=MOB_LAYER+1
						x.icon_state=pick("1","2","3","4","5","6","7")
					//	T.overlays+=x
					//	spawn(rand(1,2))T.overlays+=x
					//	spawn(rand(2,3))T.overlays+=x
					//	spawn(rand(3,4))T.overlays+=x
					//	spawn(rand(1,2))T.overlays-=x
					//	spawn(rand(2,3))T.overlays-=x
					//	spawn(rand(3,4))T.overlays-=x
					//	spawn(rand(1,2))T.overlays-=x
					//	spawn(rand(3,4))T.overlays-=x
						//spawn(rand(4,8)) new/turf/Dirt(locate(T.x,T.y,T.z))
						spawn(6) Destroy(T,1000)
				//		if(prob(10))sleep(0.1)
						for(var/mob/M in view(0,T))
							if(M!=src)
								M.Health-=src.ForVsRes(M, 1000)
								if(M.Health<=-2)
									spawn M.Death(src)
					if(src.Class!="Butch")
						if(prob(99)) spawn src.Death(src)
					src.SelfDestructed=1
				usr.Frozen=0
			if("KuroHitsugi")
				if(Z.Using)
					return
				var/Select=input("Select how you wish to use the technique. Chanted takes a while to cast but is guaranteed to hit your target unless you're knocked out. Unchanted causes the coffin to form around you, damaging everyone surrounding you.") in list ("Chanted", "Unchanted", "Cancel")
				switch(Select)
					if("Chanted")
						src.Frozen=1
						var/list/people=list("Cancel")
						for(var/mob/M in oview(12,src))
							people.Add(M)
						var/mob/Choice=input("Home onto who?")in people
						if(Choice=="Cancel")return
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)
								E<<"<font color=[C.Text_Color]>[src] says: The oozing crest of corruption. The arrogant vessel of madness!"
						sleep(20)
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)
								E<<"<font color=[C.Text_Color]>[src] says: Deny the seething urge to let things stun and flicker! Disrupt the sleep!"
						sleep(20)
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)
								E<<"<font color=[C.Text_Color]>[src] says: The crawling princess of iron! The eternally self-destructing doll of mud!"
						sleep(20)
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)
								E<<"<font color=[C.Text_Color]>[src] says: Unite!"
						sleep(10)
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)
								E<<"<font color=[C.Text_Color]>[src] says: Repulse!"
						sleep(15)
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)
								E<<"<font color=[C.Text_Color]>[src] says: Fill the earth and know your own powerlessness!"
						sleep(15)
						for(var/mob/E in hearers(12,src))
							for(var/obj/Communication/C in src)
								E<<"<font color=[C.Text_Color]>[src] says: Demonic Art... <b>Kuro Hitsugi!</b>"
						sleep(10)
						if(src.Health<=10)
							src.Frozen=0
							return
						Choice.Frozen=1
						Choice<<"You are crushed under the immense gravity, unable to move!"
						spawn for(var/turf/T in Turf_Circle(Choice,6))
							var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
							if(prob(5)) sleep(0.005)
						//	Choice.overlays+=W
							spawn(rand(4,8))T.overlays+=W
						sleep(30)
						Choice.Health-=src.ForVsRes(Choice, 200)
						spawn for(var/turf/T in Turf_Circle(Choice,6))
							if(prob(10)) sleep(0.005)
							spawn(rand(2,4))Destroy(T,200)
							if(prob(10))KenShockwave(T,icon='fevKiai.dmi',Size=4)
							if(prob(10))KenShockwave(T,icon='fevKiai.dmi',Size=2)
							if(prob(10))KenShockwave(T,icon='fevKiai.dmi',Size=0.5)
						for(var/mob/M in Turf_Circle(Choice,6))
							if(M!=src)
								M.Health-=src.ForVsRes(M, 30)
						sleep(30)
						spawn for(var/turf/T in Turf_Circle(Choice,6))
							var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
							T.overlays-=W
						if(src.Lethal)
							Choice.Death(null, "being crushed by enough gravity to warp time and space!")
						Choice.Frozen=0
						src.Frozen=0
						Z.Cooldown()
					if("Unchanted")
						spawn for(var/turf/T in Turf_Circle(src,3))
							var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
							T.overlays+=W
						sleep(10)
						for(var/mob/M in view(8))
							M.Health-=src.ForVsRes(M, 3)
						spawn for(var/turf/T in Turf_Circle(src,3))
							var/image/W=image(icon='Night.dmi',layer=MOB_LAYER+1)
							T.overlays-=W
							Destroy(T,30)
						Z.Cooldown()
					if("Neither")
						return



			if("Explode")
				src.Frozen=1
			//		src.SkillLeech(Z)
				src.Death(src)
				usr.Frozen=0
			if("EventcharSelfDestruct")
				if(src.Dead)return
				if(src.Alert("You sure you want to Self Destruct?"))
					src.Frozen=1
					src.OMessage(20,"[src] begins gathering all the energy around them into their body!","[src]([src.key]) used self destruct!")
					sleep(20)
					src.OMessage(20,"The ground begins to shake fiercely around [src]!",null)
					sleep(30)
					src.OMessage(20,"A huge explosion eminates from [src] and surrounds the area!")
			//		src.SkillLeech(Z)
					var/obj/x=new/obj/Taiyoken
					for(var/mob/Players/T in view(18))
						spawn()T.Quake(50)

					for(var/turf/T in Turf_Circle(src,36))
						if(prob(1)) sleep(0.005)
						x.layer=MOB_LAYER+1
						x.icon_state=pick("1","2","3","4","5","6","7")
						T.overlays+=x
						spawn(rand(1,2))T.overlays+=x
						spawn(rand(2,3))T.overlays+=x
						spawn(rand(3,4))T.overlays+=x
						spawn(rand(1,2))T.overlays-=x
						spawn(rand(2,3))T.overlays-=x
						spawn(rand(3,4))T.overlays-=x
						spawn(rand(1,2))T.overlays-=x
						spawn(rand(3,4))T.overlays-=x
						//spawn(rand(4,8)) new/turf/Dirt(locate(T.x,T.y,T.z))
						spawn(rand(4,8)) Destroy(T,1000)
				//		if(prob(10))sleep(0.1)
						for(var/mob/M in view(0,T))
							if(M!=src)
								M.Health-=src.ForVsRes(M, 1000)
					if(prob(99)) spawn src.Death(src)
				usr.Frozen=0
			if("Red Miles")
				if(src.Dead)return
				if(src.Alert("You sure you want to use this move?"))
					var/icon/E=icon('Effects.dmi',"Shock")
					LightningFlash(src)
					spawn()Shockwave(E,1)
					sleep(10)
					spawn()Shockwave(E,1)
					Quake(30)
					spawn()Shockwave(E,1)
			//		src.SkillLeech(Z)
					var/obj/x=new/obj/Taiyoken
					for(var/mob/Players/T in view(18))
						spawn()T.Quake(50)

					for(var/turf/T in Turf_Circle(src,36))
						if(prob(2)) sleep(0.005)
						x.layer=MOB_LAYER+1
						x.icon_state=pick("1","2","3","4","5","6","7")
						T.overlays+=x
						spawn(rand(1,2))T.overlays+=x
						spawn(rand(2,3))T.overlays+=x
						spawn(rand(3,4))T.overlays+=x
						spawn(rand(1,2))T.overlays-=x
						spawn(rand(2,3))T.overlays-=x
						spawn(rand(3,4))T.overlays-=x
						spawn(rand(1,2))T.overlays-=x
						spawn(rand(3,4))T.overlays-=x
						//spawn(rand(4,8)) new/turf/Dirt(locate(T.x,T.y,T.z))
						spawn(rand(4,8)) Destroy(T,1000)
				//		if(prob(10))sleep(0.1)
						for(var/mob/M in view(0,T))
							if(M!=src)
								M.Health-=src.ForVsRes(M, 1000)
			if("SuperExplosiveWave")
				if(src.KO||Z.Using==1||src.Grab)return
				if(src.Alert("You sure you want to use this technique? It drains heavily."))
					src.Frozen=1
					if(Z.Using)
						return
					Z.Using=1
					Z.Cooldown()
				//	src.Frozen=1
					src.OMessage(20,"[src] begins gathering all the energy around them into their body!","[src]([src.key]) used Super Explosive Wave!")
					sleep(25)
			//		src.SkillLeech(Z)
					if(src.Grab)
						src.OMessage(20,"[src] lost their concentration, as energy they gathered backfired!","[src]([src.key]) failed Super Explosive Wave!")
						src.Energy=1
						src.Health=-1
						return
					var/obj/x=new/obj/Taiyoken
					for(var/mob/Players/T in view(18))
						spawn()T.Quake(8)

					for(var/turf/T in Turf_Circle(src,8))
						if(prob(2)) sleep(0.005)
						x.layer=MOB_LAYER+1
						x.icon_state=pick("1","2","3","4","5","6","7")
				//		T.overlays+=x
				//		spawn(rand(1,2))T.overlays+=x
				//		spawn(rand(2,3))T.overlays+=x
				//		spawn(rand(3,4))T.overlays+=x
				//		spawn(rand(1,2))T.overlays-=x
				//		spawn(rand(2,3))T.overlays-=x
				//		spawn(rand(3,4))T.overlays-=x
				//		spawn(rand(1,2))T.overlays-=x
				//		spawn(rand(3,4))T.overlays-=x
				//		//spawn(rand(4,8)) new/turf/Dirt(locate(T.x,T.y,T.z))
						spawn(rand(4,8)) Destroy(T,5)
				//		if(prob(10))sleep(0.1)
						for(var/mob/M in view(0,T))
							if(M!=src)
								M.Health-=src.ForVsRes(M, 5)
					usr.Energy-=(Energy/EnergyMax)*75*rand(0.5,1.5)
				src.Frozen=0
			if("Nova")
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						return
				if(src.StanceActive==1) return
				if(src.KO||Z.Using==1)return
				if(src.ManaAmount<=30) return
				if(src.Alert("You sure you want to use this technique? It drains heavily."))
					src.Frozen=1
					if(Z.Using)
						return
					Z.Using=1
					spawn(300)
						if(src)
							Z.Using=0
							src<<"Nova CD finished."
				//	src.Frozen=1
					src.OMessage(20,"[src] began chanting as flames enveloped their body!","[src]([src.key]) used Nova!")
					sleep(25)
				//	var/icon/S=icon('Shoen_Final.dmi',"Shoen")
					for(var/mob/Players/T in view(18))
						spawn()T.Quake(8)

					for(var/turf/T in Turf_Circle(src,8))
						if(prob(2)) sleep(0.005)
						if(prob(15))
							spawn(rand(4,8)) ReplaceLava(T)
				//		if(prob(10))sleep(0.1)
						for(var/mob/M in view(0,T))
							M.Health-=src.ForVsRes(M, 5*StaffPower)
					if(!src.Manakete)
						src.ManaAmount-=(30/ManaDrain)
					sleep(50)
				src.Frozen=0
				Z.Using=0
				Z.Cooldown()
			if("CASTFIST")
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						return
				if(src.KO||Z.Using==1)return
				if(src.ManaAmount<=50) return
				if(src.Alert("You sure you want to use this technique? It drains heavily."))
					if(Z.Using)
						return
					Z.Using=1
					spawn(300)
						if(src)
							Z.Using=0
							src<<"Cast Fist finished."
				//	src.Frozen=1
					src.OMessage(20,"[src] rose their fist up as energy began focusing around them!","[src]([src.key]) casted Fist!")
					sleep(25)
					src.OMessage(20,"[src] thrust their fist into the ground with incredible force!","[src]([src.key]) casted Fist!")
					for(var/mob/Players/T in view(18))
						spawn()T.Quake(8)
					sleep(10)
					src.OMessage(20,"Lava erupted from the ground around [src]!")
					for(var/turf/T in Turf_Circle(src,6))
						if(prob(2)) sleep(1)
						if(prob(70))
							spawn(rand(4,8)) ReplaceLava(T)

				//		if(prob(10))sleep(0.1)
						for(var/mob/M in view(0,T))
							if(M!=src)
								M.Health-=src.StrVsEnd(7.5)
					if(!src.Manakete)
						src.ManaAmount-=50
				Z.Using=0
				Z.Cooldown()
			if("Flare")
				if(src.KO || Z.Using==1)return
				if(src.ManaAmount<=45)return
				if(src.Alert("Are you sure you wish to use this?"))
					src.Frozen=1
					if(Z.Using)
						return
					Z.Using=1
					src.OMessage(20,"[src] allowed a flash of fire to gather around them, blinding their opponents momentarily!","[src]([src.key]) used Flare!")
					sleep(25)
					var/obj/x=new /obj/Taiyoken
					for(var/turf/M in Turf_Circle(src,max(sqrt(Z.Level)*sqrt(Z.Level)/15,1)))
						if(prob(20))continue
						x.icon_state="4"
						M.overlays+=x
						for(var/mob/Q in view(0,M))
							if(Q==src)continue
							Q<<"You are blinded!"
							var/duration=sqrt(src.EnergyMax)/sqrt(Q.EnergyMax)+(sqrt(src.Power)/sqrt(Q.Power))
							duration=max(min(duration,2000),1)
							spawn Q.Blind(duration*sqrt(Z.Level))
						spawn(rand(1,2))M.overlays+=x
						spawn(rand(2,3))M.overlays+=x
						spawn(rand(3,4))M.overlays+=x
						spawn(rand(4,5))M.overlays-=x
						spawn(rand(5,6))M.overlays-=x
						spawn(rand(6,7))M.overlays-=x
						spawn(rand(7,8))M.overlays-=x
						spawn(rand(9,10))M.overlays-=x
						if(prob(10))sleep(0.1)
						src.Frozen= 0
					Z.Cooldown()

			if("Hurricane")
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						return
				if(src.StanceActive==1) return
				if(src.KO||Z.Using==1)return
				if(src.ManaAmount<=10) return
				if(src.Alert("You sure you want to use this technique? It drains heavily."))
					src.Frozen=1
					if(Z.Using)
						return
					Z.Using=1
					spawn(300)
						if(src)
							Z.Using=0
							src<<"Hurricane CD finished."
					src.OMessage(20,"[src] began chanting as wind enveloped their body!","[src]([src.key]) used Nova!")
					sleep(10)
				//	var/icon/S=icon('Shoen_Final.dmi',"Shoen")
					for(var/mob/Players/T in view(18))
						spawn()T.Quake(8)

					for(var/turf/T in Turf_Circle(src,8))
						if(prob(1)) sleep(0.005)
						for(var/mob/M in view(0,T))
							if(M!=src)
								var/FlyMult=1
								if(M.Flying)
									FlyMult=10
								M.Health-=src.ForVsRes(M, 1*FlyMult*StaffPower)
					if(!src.Manakete)
						src.ManaAmount-=(20/ManaDrain)
					sleep(50)
				src.Frozen=0
				Z.Using=0
				Z.Cooldown()
			if("Gravity")
				if(src.KO||Z.Using||src.Blocking)return
				if(src.Alert("You sure you want to use this technique? It will damage everyone around you."))
					if(Z.Using)
						return
				//	src.Frozen=1
					Z.Using=1
					spawn(50)
						if(src)
							Z.Using=0
							src<<"Gravity CD finished."
					src.OMessage(20,"[src] begins creating a gravity wave!","[src]([src.key]) used Gravity!")
					sleep(5)
			//		src.SkillLeech(Z)
					var/obj/x=new/obj/GravitySpell
					for(var/mob/Players/T in view(12))
						spawn()T.Quake(8)

					for(var/turf/T in Turf_Circle(src,4))
						if(prob(1)) sleep(0.005)
						x.layer=MOB_LAYER+1
						x.icon_state="Black"
						T.overlays+=x
						spawn(1)T.overlays+=x
						spawn(2)T.overlays+=x
						spawn(3)T.overlays+=x
						spawn(4)T.overlays-=x
						spawn(5)T.overlays-=x
						spawn(6)T.overlays-=x
						spawn(7)T.overlays-=x
						spawn(8)T.overlays-=x
						for(var/mob/M in view(0,T))
							M.Health-=(src.GravityMastered/10)*(src.Power/M.Power)
					usr.Energy-=(Energy/EnergyMax)*20
				usr.Frozen=0
			if("Blizzard")
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						return
				if(src.StanceActive==1) return
				if(src.KO||Z.Using||src.Blocking)return
				if(src.ManaAmount<=10) return
				if(src.Alert("You sure you want to use this technique? It will damage and inflict slow down on everyone around you."))
					if(Z.Using)
						return
				//	src.Frozen=1
					Z.Using=1
					spawn(40)
						if(src)
							Z.Using=0
							src<<"Blizzard CD finished."
					src.OMessage(20,"[src] begins creating a mighty snowstorm!","[src]([src.key]) used Blizzard!")
					sleep(5)
			//		src.SkillLeech(Z)
					var/obj/x=new/obj/Blizzard
					for(var/mob/Players/T in view(12))
						spawn()T.Quake(8)

					for(var/turf/T in Turf_Circle(src,6))
						if(prob(1)) sleep(0.005)
						x.layer=MOB_LAYER+1
						x.icon_state="Blizzard"
						T.overlays+=x
						spawn(1)T.overlays+=x
						spawn(3)T.overlays+=x
						spawn(5)T.overlays+=x
						spawn(7)T.overlays-=x
						spawn(9)T.overlays-=x
						spawn(11)T.overlays-=x
						spawn(13)T.overlays-=x
						spawn(15)T.overlays-=x
						for(var/mob/M in view(0,T))
							if(M!=src)
								if(prob(25))
									M.Chilled=1.5
									spawn()M.Chilled_Check()
								M.Health-=src.ForVsRes(M, 3*StaffPower)
					usr.Energy-=(Energy/EnergyMax)*20
					if(!src.Manakete)
						usr.ManaAmount-=(10/ManaDrain)
				usr.Frozen=0
				Z.Cooldown()
			if("DireWinter")
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						return
				if(src.StanceActive==1) return
				if(src.KO||Z.Using||src.Blocking)return
				if(src.ManaAmount<=10) return
				if(src.Alert("You sure you want to use this technique? It will damage all around you, and lower their Temperature."))
					if(Z.Using)
						return
				//	src.Frozen=1
					Z.Using=1
					spawn(80)
						if(src)
							Z.Using=0
							src<<"Dire Winter CD finished."
					src.OMessage(20,"[src] begins dramatically lowering the temperature around them!","[src]([src.key]) used Dire Winter!")
					sleep(5)
			//		src.SkillLeech(Z)
					var/obj/x=new/obj/Blizzard
					for(var/mob/Players/T in view(8))
						spawn()T.Quake(12)

					for(var/turf/T in Turf_Circle(src,4))
						x.layer=MOB_LAYER+1
						x.icon_state="Night Snow"
						T.overlays+=x
						spawn(20)T.overlays-=x
						for(var/mob/M in view(0,T))
							if(M!=src)
								if(prob(50))
									M.TemperatureLock=4
									M.Temperature=7.5
								M.Health-=src.ForVsRes(M, 4*StaffPower)
					usr.Energy-=(Energy/EnergyMax)*20
					if(!src.Manakete)
						usr.ManaAmount-=(10/ManaDrain)
				usr.Frozen=0
				Z.Cooldown()
			if("GrandThunderStorm")
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						return
				if(src.StanceActive==1) return
				if(src.KO||Z.Using||src.Blocking)return
				if(src.ManaAmount<=40) return
				if(src.Alert("You sure you want to use this technique? It will damage all around you."))
					if(Z.Using)
						return
				//	src.Frozen=1
					Z.Using=1
					spawn(80)
						if(src)
							Z.Using=0
							src<<"Grand Thunderstorm CD finished."
					src.OMessage(20,"Clouds began gathering around [src]!","[src]([src.key]) used Grand Thunderstorm!")
					sleep(15)
			//		src.SkillLeech(Z)
					var/obj/x=new/obj/Blizzard
					for(var/mob/Players/T in view(8))
						spawn()T.Quake(12)

					for(var/turf/T in Turf_Circle(src,8))
						x.layer=MOB_LAYER+1
						x.icon_state="Storm"
						T.overlays+=x
						spawn(40)T.overlays-=x
						for(var/mob/M in view(0,T))
				//			if(M!=src)
							M.Health-=src.ForVsRes(M, 5)
							if(!src.Manakete)
								src.ManaAmount-=(40/ManaDrain)
					usr.Energy-=(Energy/EnergyMax)*20
				//	usr.ManaAmount-=(30/ManaDrain)
				usr.Frozen=0
				Z.Cooldown()
			if("Terra-Graviton")
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						return
				if(src.StanceActive==1) return
				if(src.KO||Z.Using||src.Blocking)return
				if(src.ManaAmount<=30) return
				if(src.Alert("You sure you want to use this technique? It will damage everyone around you."))
					if(Z.Using)
						return
				//	src.Frozen=1
					Z.Using=1
					spawn(500)
						if(src)
							Z.Using=0
							src<<"Terra-Graviton CD finished."
					src.OMessage(20,"[src] begins creating a massive gravity wave!","[src]([src.key]) used Terra-Graviton!")
					sleep(5)
			//		src.SkillLeech(Z)
					var/obj/x=new/obj/GravitySpell
					for(var/mob/Players/T in view(12))
						spawn()T.Quake(8)

					for(var/turf/T in Turf_Circle(src,8))
						if(prob(1)) sleep(0.005)
						x.layer=MOB_LAYER+1
						x.icon_state="Black"
						T.overlays+=x
						spawn(1)T.overlays+=x
						spawn(2)T.overlays+=x
						spawn(3)T.overlays+=x
						spawn(4)T.overlays-=x
						spawn(5)T.overlays-=x
						spawn(6)T.overlays-=x
						spawn(7)T.overlays-=x
						spawn(8)T.overlays-=x
						for(var/mob/M in view(0,T))
							M.Health*=0.5
					src.Energy-=(Energy/EnergyMax)*20
					if(!src.Manakete)
						src.ManaAmount-=45/ManaDrain
				usr.Frozen=0
				Z.Cooldown()
			if("Inferno")
				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						return
				if(src.StanceActive==1) return
				if(src.KO||Z.Using||src.Blocking)return
				if(src.ManaAmount<=40) return
				if(src.Alert("You sure you want to use this technique? It will damage all around you."))
					if(Z.Using)
						return
				//	src.Frozen=1
					Z.Using=1
					spawn(80)
						if(src)
							Z.Using=0
							src<<"Your hands simmer with heat..."
					src.OMessage(20,"Flames spew from [src]'s hands and envelope the area!","[src]([src.key]) used Axel Style!")
					sleep(10)
			//		src.SkillLeech(Z)
					var/obj/x=new/obj/Blizzard
					for(var/mob/Players/T in view(9))
						spawn()T.Quake(12)

					for(var/turf/T in Turf_Circle(src,9))
						x.layer=MOB_LAYER+1
						x.icon_state="Firestorm"
						T.overlays+=x
						spawn(40)T.overlays-=x
						for(var/mob/M in view(0,T))
							if(M!=src)
								M.Health-=src.ForVsRes(M, 10)
								M.Burning+=0.2
								spawn()M:Burning_Check()
							if(!src.Manakete)
								src.ManaAmount-=(40/ManaDrain)
					usr.Energy-=(Energy/EnergyMax)*20
				//	usr.ManaAmount-=(30/ManaDrain)
				usr.Frozen=0
				Z.Cooldown()
			if("SandCoffin")
				if(src.ManaAmount<=10) return
				var/Drain=5/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(Z.Using) return
				Z.Using=1
				var/list/people=list("Cancel")
				for(var/mob/M in oview(12,src))
					people.Add(M)
				var/mob/Choice=input("Home onto who?")in people
				if(Choice=="Cancel")
					Z.Using=0
					return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/10)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				var/blasts=0
				var/maxblasts=3//sqrt(Z.Level)*sqrt(Z.Level)
				src.SkillLeech(Z)
				while(blasts<maxblasts && src.ManaAmount>=10)
					Z.Skill_Increase()
					blasts++
					flick("Blast",src)
					for(var/turf/T in Turf_Circle(src,6))
						if(T.SecondaryTurfType=="Sand")
							var/obj/Projectiles/Mystical/A=new(locate(T.x,T.y,T.z))
							maxblasts++
							A.Distance=Distance
							A.Explosive=1
							A.Knockback=1
							A.dir=rand(1,8)
							A.icon=T.icon
							A.icon_state=T.icon_state
							A.Owner=src
							A.Lethality=src.Lethal
							A.Damage_Multiplier=1*StaffPower
							A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill
							A.Elemental="Earth"
							if(!(A in view(20,src)))
								spawn del(A)
								continue
							spawn(30) if(A) spawn()Homing(A,Choice)
							if(prob(50))sleep(0.1)
							else if(prob(20))sleep(1)
							spawn(rand(4,8)) Destroy(T,1*StaffPower)
						else
							return
				Z.Cooldown()
			if("WaterCoffin")
				if(src.ManaAmount<=10) return
				var/Drain=5/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(Z.Using)return
				Z.Using=1
				var/list/people=list("Cancel")
				for(var/mob/M in oview(12,src))
					people.Add(M)
				var/mob/Choice=input("Home onto who?")in people
				if(Choice=="Cancel")
					Z.Using=0
					return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/10)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				var/blasts=0
				var/maxblasts=3//sqrt(Z.Level)*sqrt(Z.Level)
				src.SkillLeech(Z)
				while(blasts<maxblasts && src.ManaAmount>=10)
					Z.Skill_Increase()
					blasts++
					flick("Blast",src)
					for(var/turf/Waters/T in Turf_Circle(src,4))
						var/obj/Projectiles/Mystical/A=new(locate(T.x,T.y,T.z))
						maxblasts++
						A.Distance=Distance
						A.Explosive=1
						A.Knockback=1
						A.dir=rand(1,8)
						A.icon=T.icon
						A.icon_state=T.icon_state
						A.Owner=src
						A.Lethality=src.Lethal
						A.Damage_Multiplier=1*StaffPower
						A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill
						A.Elemental="Water"
						if(!(A in view(20,src)))
							spawn del(A)
							continue
						spawn(30) if(A) spawn()Homing(A,Choice)
						if(prob(50))sleep(0.1)
						else if(prob(20))sleep(1)
						spawn(rand(4,8)) Destroy(T,1*StaffPower)
					if(!src.Manakete)
						src.ManaAmount-=(2/ManaDrain)
				Z.Cooldown()
			if("Checkmate")
				if(Z.Using)
					return
				var/Drain=5/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				Z.Using=1
				var/list/people=list("Cancel")
				for(var/mob/M in oview(12,src))
					people.Add(M)
				var/mob/Choice=input("Home onto who?")in people
				if(Choice=="Cancel")
					Z.Using=0
					return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/10)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				var/blasts=0
				var/maxblasts=sqrt(Z.Level)*sqrt(Z.Level)
				src.SkillLeech(Z)
				while(blasts<maxblasts)
					Z.Skill_Increase()
					blasts++
					flick("Blast",src)
					var/obj/Projectiles/Mystical/A=new(locate(min(max(Choice.x+rand(-10,10),1),500),min(max(Choice.y+rand(-10,10),1),500),Choice.z))
					A.Distance=Distance
					A.Explosive=1
					A.Knockback=1
					A.dir=rand(1,8)
					A.icon=Z.sicon
					A.icon_state=Z.sicon_state
					A.Owner=src
					A.Physical=1
					A.Lethality=src.Lethal
					A.Damage_Multiplier=3
					A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*45
					A.Elemental=Element
					if(!(A in view(20,src)))
						spawn del(A)
						continue
					spawn(30) if(A) spawn()Homing(A,Choice)
					if(prob(50))sleep(0.1)
					else if(prob(20))sleep(1)
				src.TotalFatigue+=5
				Z.Cooldown()
			if("HomingFinisher")
				if(Z.Using)
					return
				var/Drain=5/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				Z.Using=1
				var/list/people=list("Cancel")
				for(var/mob/M in oview(12,src))
					people.Add(M)
				var/mob/Choice=input("Home onto who?")in people
				if(Choice=="Cancel")
					Z.Using=0
					return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/10)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				var/blasts=0
				var/maxblasts=sqrt(Z.Level / 2)*sqrt(Z.Level)
				src.SkillLeech(Z)
				while(blasts<maxblasts)
					Z.Skill_Increase()
					blasts++
					flick("Blast",src)
					var/obj/Projectiles/Mystical/A=new(locate(min(max(Choice.x+rand(-10,10),1),500),min(max(Choice.y+rand(-10,10),1),500),Choice.z))
					A.Distance=Distance
					A.Explosive=1
					A.Knockback=1
					A.dir=rand(1,8)
					A.icon=Z.sicon
					A.icon_state=Z.sicon_state
					A.Owner=src
					A.Lethality=src.Lethal
					A.Damage_Multiplier=5
					A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*2
					A.Elemental=Element
					if(!(A in view(20,src)))
						spawn del(A)
						continue
					spawn(30) if(A) spawn()Homing(A,Choice)
					if(prob(50))sleep(0.1)
					else if(prob(20))sleep(1)
				src.TotalFatigue+=5
				Z.Cooldown()
		/*	if("MagicBullet")
				if(Z.Using)
					return
				var/Drain=5/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				var/list/people=list("Cancel")
				for(var/mob/M in oview(12,src))
					people.Add(M)
				var/mob/Choice=input("Home onto who?")in people
				if(Choice=="Cancel")return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/10)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				var/blasts=0
				var/maxblasts=1
				src.SkillLeech(Z)
				while(blasts<maxblasts)
					Z.Skill_Increase()
					blasts++
					flick("Blast",src)
					var/obj/Projectiles/Mystical/A=new(locate(min(max(Choice.x+rand(-10,10),1),500),min(max(Choice.y+rand(-10,10),1),500),Choice.z))
					A.Distance=Distance
					A.Explosive=1
					A.Knockback=1
					A.dir=rand(1,8)
					A.icon=Z.sicon
					A.icon_state=Z.sicon_state
					A.Owner=src
					A.Lethality=src.Lethal
					A.Damage_Multiplier=200
					A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*5
					A.Elemental=Element
					if(!(A in view(20,src)))
						spawn del(A)
						continue
					spawn(30) if(A) spawn()Homing(A,Choice)
					if(prob(50))sleep(0.1)
					else if(prob(20))sleep(1)
				src.TotalFatigue+=20
				Z.Cooldown()*/
			if("OmegaHomingFinisher")
				if(Z.Using)
					return
				var/Drain=5/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				Z.Using=1
				var/list/people=list("Cancel")
				for(var/mob/M in oview(12,src))
					people.Add(M)
				var/mob/Choice=input("Home onto who?")in people
				if(Choice=="Cancel")
					Z.Using=0
					return
				src.Attacking=1
				src.Beaming=1
				src.Chargez("Add")
				sleep(src.Refire/(Z.Speed*(sqrt(Z.Level)/10)))
				src.Chargez("Remove")
				src.Energy-=Drain/src.Efficiency*100*(1/Z.Level)
				src.Attacking=0
				src.Beaming=0
				var/blasts=0
				var/maxblasts=sqrt(Z.Level / 2)*sqrt(Z.Level)
				src.SkillLeech(Z)
				while(blasts<maxblasts)
					Z.Skill_Increase()
					blasts++
					flick("Blast",src)
					var/obj/Projectiles/Mystical/A=new(locate(min(max(Choice.x+rand(-10,10),1),500),min(max(Choice.y+rand(-10,10),1),500),Choice.z))
					A.Distance=99//Distance
					A.dir=rand(1,8)
					A.icon=Z.sicon
					A.icon_state=Z.sicon_state
					A.Owner=src
					A.Lethality=src.Lethal
					A.Damage_Multiplier=5
					A.Radius=1
					A.Pushing=1
					A.Pierce=1
					A.Deflectable=0
		//			A.Knockback=1
					A.Omega=1
					A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*45
					A.Elemental=Element
					if(!(A in view(20,src)))
						spawn del(A)
						continue
					spawn(30) if(A) spawn()Homing(A,Choice)
					if(prob(50))sleep(0.1)
					else if(prob(20))sleep(1)
				Z.Cooldown()
			if("Splitclone")
				if(Z.Using)
					return
				var/Drain=src.EnergyMax*(1/sqrt(Z.Level))
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				var/SplitAmount=0
				for(var/mob/Split/e in world)
					if(e.Owner==src.key)
						SplitAmount++
				if(SplitAmount>2)
					src<<"You cannot create anymore splitforms!"
					return
				SplitAmount++
				src.Energy-=Drain
				var/mob/Split/x=new
				x.icon=src.icon
				x.overlays=src.overlays
				x.underlays=x.underlays
				x.Power=src.Power
				x.Base=src.Base
				x.Strength=src.Strength*src.StrengthMultiplier/2
				x.Endurance=src.Endurance*src.EnduranceMultiplier/2
				x.SpeedMod=src.SpeedMod
				x.Offense=src.Offense/2
				x.Defense=src.Defense/3
				x.Force=src.Force/4
				x.Resistance=src.Resistance/2
				x.name="-[src.name]-([SplitAmount])"
				x.Owner=src.key
				x.loc=src.loc
				x.Warp=0
				spawn()step(x,SOUTH)
				src.SkillLeech(Z)
				Z.Skill_Increase()
				Z.Cooldown()

			if("Barrier")
				if(src.Attacking||src.KO||src.ManaAmount<20||Z.Using) return
				src.ManaAmount-=20/ManaDrain
				Z.Using=1
				src.Frozen=1
				spawn(1200)
					Z.Using=0
					src<<"Barrier CD ended."
				var/obj/Effects/Barrier/a=new
				a.x=(src.x-3)
				a.y=(src.y-3)
				a.z=(src.z)
				a.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				a.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/b=new
				b.x=(src.x-2)
				b.y=(src.y-3)
				b.z=(src.z)
				b.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				b.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/c=new
				c.x=(src.x-1)
				c.y=(src.y-3)
				c.z=(src.z)
				c.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				c.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/d=new
				d.x=(src.x)
				d.y=(src.y-3)
				d.z=(src.z)
				d.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				d.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/e=new
				e.x=(src.x+1)
				e.y=(src.y-3)
				e.z=(src.z)
				e.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				e.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/f=new
				f.x=(src.x+2)
				f.y=(src.y-3)
				f.z=(src.z)
				f.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				f.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/g=new
				g.x=(src.x+3)
				g.y=(src.y-3)
				g.z=(src.z)
				g.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				g.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/h=new
				h.x=(src.x+3)
				h.y=(src.y-2)
				h.z=(src.z)
				h.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				h.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/i=new
				i.x=(src.x+3)
				i.y=(src.y-1)
				i.z=(src.z)
				i.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				i.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/j=new
				j.x=(src.x+3)
				j.y=(src.y)
				j.z=(src.z)
				j.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				j.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/k=new
				k.x=(src.x+3)
				k.y=(src.y+1)
				k.z=(src.z)
				k.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				k.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/l=new
				l.x=(src.x+3)
				l.y=(src.y+2)
				l.z=(src.z)
				l.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				l.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/m=new
				m.x=(src.x+3)
				m.y=(src.y+3)
				m.z=(src.z)
				m.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				m.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/n=new
				n.x=(src.x+2)
				n.y=(src.y+3)
				n.z=(src.z)
				n.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				n.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/o=new
				o.x=(src.x+1)
				o.y=(src.y+3)
				o.z=(src.z)
				o.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				o.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/p=new
				p.x=(src.x)
				p.y=(src.y+3)
				p.z=(src.z)
				p.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				p.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/q=new
				q.x=(src.x-1)
				q.y=(src.y+3)
				q.z=(src.z)
				q.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				q.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/r=new
				r.x=(src.x-2)
				r.y=(src.y+3)
				r.z=(src.z)
				r.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				r.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/s=new
				s.x=(src.x-3)
				s.y=(src.y+3)
				s.z=(src.z)
				s.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				s.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/t=new
				t.x=(src.x-3)
				t.y=(src.y+2)
				t.z=(src.z)
				t.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				t.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/u=new
				u.x=(src.x-3)
				u.y=(src.y+1)
				u.z=(src.z)
				u.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				u.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/v=new
				v.x=(src.x-3)
				v.y=(src.y)
				v.z=(src.z)
				v.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				v.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/w=new
				w.x=(src.x-3)
				w.y=(src.y-1)
				w.z=(src.z)
				w.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				w.LogPEndurance=(Z.Level*4)

				var/obj/Effects/Barrier/x=new
				x.x=(src.x-3)
				x.y=(src.y-2)
				x.z=(src.z)
				x.Health=((src.Endurance*src.EnduranceMultiplier)*(src.Resistance*src.ResistanceMultiplier)*src.Power)
				x.LogPEndurance=(Z.Level*4)
				src.Frozen=0
//				src.SkillLeech(Z)
				Z.Skill_Increase(10)
				Z.Cooldown()

			if("ShunkanIdo")
				if(Z.Using)
					return
				var/Drain=5/Z.Efficiency
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				var/list/people=list("Cancel")
				for(var/mob/Players/M in world)
					var/distance=abs(src.x-M.x)+abs(src.y-M.y)
					if(distance<=Z.Level*sqrt(Z.Level))
						if(M.z!=src.z&&Z.Level<99)
							continue
						people.Add(M)
				var/mob/Choice=input("Shunkan Ido to who?")in people
				if(Choice=="Cancel")return
				src.OMessage(5,"[src] begins to concentrate...","[src]([src.key]) used SI to [Choice]([Choice.key])!")
				//src.SkillLeech(Z)
				sleep(1000/(sqrt(Z.Level)*sqrt(Z.Level)*sqrt(Z.Level)))
				if(Choice)
					if(Choice.Divine)
						src<<"NOPE."
						return
					if(Choice.Race=="Android")
						src<<"NOPE."
						return
					if(src.ControlPower<2)
						src<<"NOPE."
						return
					else
						src.loc=Choice.loc
						usr<<"You appear at [Choice]!"
						Z.Skill_Increase()
						src.SkillLeech(Z)

			if("Stoneskin")
/*				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						return
				if(src.StanceActive==1) return*/
				if(src.Attacking) return
				if(Z.Using==1) return
				var/list/people=list("Cancel")
				for(var/mob/Players/M in view(5))
					people.Add(M)
				var/mob/Choice=input("Cast Stoneskin on who?")in people
				if(Choice=="Cancel")return
				Z.Using=1
				src.OMessage(5,"[src] begins to cast a spell...","[src]([src.key]) used Stoneskin on [Choice]([Choice.key])!")
				sleep(35)
				if(Choice)
					if(Choice.Stoneskin>0)
						src<<"They already have a Support Buff."
						return
					Choice.Stoneskin=300
					Choice.EnduranceMultiplier*=1.2
					Choice.Stoneskinned="Stoneskin"
					src<<"You cast Stoneskin on [Choice]!"
					Choice<<"You feel your skin harden!"
					Z.Skill_Increase()
					if(!src.Manakete)
						src.ManaAmount-=15/ManaDrain
				Z.Cooldown()

			if("SearingHeart")
/*				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						return
				if(src.StanceActive==1) return*/
				if(src.Attacking) return
				if(Z.Using==1) return
				var/list/people=list("Cancel")
				for(var/mob/Players/M in view(5))
					people.Add(M)
				var/mob/Choice=input("Cast Searing Heart on who?")in people
				if(Choice=="Cancel")return
				Z.Using=1
				src.OMessage(5,"[src] begins to cast a spell...","[src]([src.key]) used Searing Heart on [Choice]([Choice.key])!")
				sleep(35)
				if(Choice)
					if(Choice.Stoneskin>0)
						src<<"They already have a Support Buff."
						return
					Choice.Stoneskin=300
					Choice.StrengthMultiplier*=1.2
					Choice.Stoneskinned="SearingHeart"
					src<<"You cast Searing Heart on [Choice]!"
					Choice<<"You feel your heart burn with strength!"
					Z.Skill_Increase()
					if(!src.Manakete)
						src.ManaAmount-=15/ManaDrain
				Z.Cooldown()

			if("OceanMind")
/*				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						return
				if(src.StanceActive==1) return*/
				if(src.Attacking) return
				if(Z.Using==1) return
				var/list/people=list("Cancel")
				for(var/mob/Players/M in view(5))
					people.Add(M)
				var/mob/Choice=input("Cast Ocean Mind on who?")in people
				if(Choice=="Cancel")return
				Z.Using=1
				src.OMessage(5,"[src] begins to cast a spell...","[src]([src.key]) used Ocean Mind on [Choice]([Choice.key])!")
				sleep(35)
				if(Choice)
					if(Choice.Stoneskin>0)
						src<<"They already have a Support Buff."
						return
					Choice.Stoneskin=300
					Choice.ForceMultiplier*=1.2
					Choice.Stoneskinned="OceanMind"
					src<<"You cast Ocean Mind on [Choice]!"
					Choice<<"You feel your mind become calm and clear!"
					Z.Skill_Increase()
					if(!src.Manakete)
						src.ManaAmount-=15/ManaDrain
				Z.Cooldown()

			if("ZephyrVision")
/*				for(var/obj/Items/Sword/S in usr)
					if(S.suffix)
						return
				if(src.StanceActive==1) return*/
				if(src.Attacking) return
				if(Z.Using==1) return
				var/list/people=list("Cancel")
				for(var/mob/Players/M in view(5))
					people.Add(M)
				var/mob/Choice=input("Cast Zephyr Vision on who?")in people
				if(Choice=="Cancel")return
				Z.Using=1
				src.OMessage(5,"[src] begins to cast a spell...","[src]([src.key]) used Zephyr Vision on [Choice]([Choice.key])!")
				sleep(35)
				if(Choice)
					if(Choice.Stoneskin>0)
						src<<"They already have a Support Buff."
						return
					Choice.Stoneskin=300
					Choice.OffenseMultiplier*=1.2
					Choice.DefenseMultiplier*=1.2
					Choice.Stoneskinned="ZephyrVision"
					src<<"You cast Zephyr Vision on [Choice]!"
					Choice<<"You can see far better then before, better able to react to the actions of others!"
					Z.Skill_Increase()
					if(!src.Manakete)
						src.ManaAmount-=15/ManaDrain
				Z.Cooldown()



			if("HeartlessAngel")
				if(Z.Using)
					return
				if(src.Attacking) return
				if(src.HeartlessAngel) return
				src.HeartlessAngel=1
				var/list/people=list("Cancel")
				for(var/mob/Players/M in view(5))
					people.Add(M)
				var/mob/Choice=input("Cast Heartless Angel on who?")in people
				if(Choice=="Cancel")return
		//		Z.Using=1
				src.Frozen=1
				src.OMessage(5,"[src] begins to cast a spell...","[src]([src.key]) used Stoneskin on [Choice]([Choice.key])!")
				sleep(5)
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: Descend..."
				sleep(20)
				for(var/mob/E in hearers(12,src))
					for(var/obj/Communication/C in src)
						E<<"<font color=[C.Text_Color]>[src] says: <b>...Heartless Angel.</b>"
				sleep(15)
				src.Frozen=0
				if(Choice && src.HeartlessAngel)
					Choice.Health-=src.ForVsRes(Choice, 40)
					if(Choice.Health<=50)
						Choice.Health=1
						Choice.Energy=1
						Choice.ManaAmount=1
					Choice<<"The angel of death descends upon you."
					src.HeartlessAngel=0
				else
					src.HeartlessAngel=0
					src<< "Casting failed!"
					return
				Z.Cooldown()
				src.HeartlessAngel=0



			if("DBSMake")
				for(var/A in typesof(/obj/Dragonballs))
					var/obj/Dragonballs/C=new A(src.loc)
					if(C.type==/obj/Dragonballs)
						del(C)
						continue
					for(var/obj/Dragonballs/W in world)
						if(C!=W)
							if(C.type==W.type||C.passcode==src.key)
								del(C)
					if(C)
						C.icon_state="Ei"
						C.passcode=src.key
				src.OMessage(10,"Materialized up a set of mysterious balls..","[ExtractInfo(src)] created the dragonballs!")
			if("DBSScatter")
				for(var/obj/Dragonballs/Q in src.loc)
					Q.icon_state="E[copytext(Q.name,lentext(Q.name))]"
					Q.active=1
					Q.power=src.EnergyMax*src.Base/src.BaseMod
					sleep(10)
					Q.loc=locate(rand(100,500),rand(100,500),Q.z)
				src.OMessage(10,"Attempted to scatter the dragonballs beneath them....","[ExtractInfo(src)] scattered the dragonballs!")
			/*if("Splitform2")
				var/Drain=0
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				var/mob/DummyCharacter/x=new
				x.icon=src.icon
				x.overlays=src.overlays
				x.underlays=x.underlays
				x.Power=src.Power
				x.Base=src.Base
				x.Strength=src.Strength
				x.Endurance=src.Endurance
				x.Speed=src.SpeedMod
				x.SpeedMod=src.SpeedMod
				x.Offense=src.Offense
				x.Defense=src.Defense
				x.Force=src.Force
				x.Resistance=src.Resistance
				x.Race=src.Race
				x.Class=src.Class
				x.name="[src.name] Simulation"
				x.Owner=src.key
				x.loc=src.loc
				spawn()step(x,SOUTH)*/
			if("SageSplit")
				if(Z.Using)
					return
				var/Drain=0
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.ManaAmount<100) return
				var/mob/SageSplit/x=new
				src.ManaAmount-=100
				src.SageBunshin+=1
				x.SageSplit=1
				x.icon=src.icon
				x.overlays=src.overlays
				x.underlays=x.underlays
				x.Power=src.Power
				x.Base=src.Base
				x.Strength=src.Strength
				x.Endurance=src.Endurance
				x.Speed=src.SpeedMod
				x.SpeedMod=src.SpeedMod
				x.Offense=src.Offense
				x.Defense=src.Defense
				x.Force=src.Force
				x.Resistance=src.Resistance
				x.Race=src.Race
				x.Class=src.Class
				x.name="[src.name] Clone"
				x.Owner=src.key
				x.loc=src.loc
				x.Warp=src.Warp
				spawn()step(x,SOUTH)
				Z.Cooldown()
			if("KyokaSuigetsuClone")
				var/Drain=0
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.AizenClone) return
				src.invisibility=98
				src.see_invisible=99
				var/mob/AizenSplit/x=new
				src.AizenClone=1
				x.AizenSplit=1
				x.icon=src.icon
				x.overlays=src.overlays
				x.underlays=x.underlays
				x.Power=src.Power
				x.Base=src.Base
				x.Strength=src.Strength
				x.Endurance=src.Endurance
				x.Speed=src.SpeedMod
				x.SpeedMod=src.SpeedMod
				x.Offense=src.Offense
				x.Defense=src.Defense
				x.Force=src.Force
				x.Resistance=src.Resistance
				x.Energy=src.Energy
				x.EnergyMax=src.EnergyMax
				x.Race=src.Race
				x.Class=src.Class
				x.name="[src.name]"
				x.Owner=src.key
				x.loc=src.loc
				x.Health=9999
				x.Warp=src.Warp
				spawn()step(x,SOUTH)
				x.contents+=new/obj/Skills/Rank/Kiai
				Z.Cooldown()
				/*for(var/mob/Players/m in world)
				if(m.Target==src)
					//m<<"Your target has been swapped from [src]([src.type]) to [x]([x.type])"
					m.Target=x*/
			if("SGKA")
				if(Z.Using)
					return
				var/Drain=0
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				src.Energy*=0.85
				var/mob/SuperGhost/x=new
				x.icon=src.icon
				x.overlays=src.overlays
				x.underlays=x.underlays
				x.Power=src.Power
				x.Base=src.Base
				x.Strength=src.Strength
				x.Endurance=src.Endurance
				x.Speed=src.SpeedMod
				x.SpeedMod=src.SpeedMod
				x.Offense=src.Offense
				x.Defense=src.Defense/4
				x.Force=src.Force
				x.Resistance=src.Resistance
				x.Race=src.Race
				x.Class=src.Class
				x.Health=10
				x.name="[src.name] Ghost"
				x.Owner=src.key
				x.loc=src.loc
				src.SageBunshin+=1
				x.SageSplit=1
				spawn()step(x,SOUTH)
				Z.Cooldown()
		/*	if("LosLobos")
				if(Z.Using)
					return
				var/Drain=0
				if(src.Attacking) return
				if(!src.CanBlast(Drain)) return
				if(src.JohnTheWolf>=12)
					src<<"Your pack is too large to form more wolves!"
					return
				src.Energy*=0.90
				var/mob/JohnWolf/x=new
				x.icon='Wolf.dmi'
				x.Power=src.Power
				x.Base=src.Base
				x.Strength=src.Strength
				x.Endurance=src.Endurance
				x.Speed=src.SpeedMod
				x.SpeedMod=src.SpeedMod
				x.Offense=src.Offense*2
				x.Defense=src.Defense/3
				x.Force=src.Force
				x.Resistance=src.Resistance
				x.Race=src.Race
				x.Class=src.Class
				x.Health=25
				x.name="[src.name]'s Spirit Animal"
				x.Owner=src.key
				x.loc=src.loc
				src.JohnTheWolf+=1
				x.JohnWolf=1
				spawn()step(x,SOUTH)
				Z.Cooldown()*/

mob/Servant
	density=1
	Bump(mob/A)
		if(istype(A,/mob))if(src.target!=A)return
		Melee()
	var/acting
	var/subacting
	var/specialv
	var/target
	var/strike

	proc
		AttackTarget()
			set background=1
			src.acting="attacktarget"
			while(src.acting=="attacktarget")
				if(!src.target in world)
					src.acting=null
					break
				//if(Health<=0&&!KO) Unconscious(null,"?!?!")
				if(src.KO)
					src.acting=null
					src.OMessage(15, "[src]'s body fades into the sand...")
					sleep(10)
					del(src)
					break
				var/atom/O
				for(O in get_step(src,dir)) if(O.density&&!ismob(O)) break
				if(!src.Knockbacked)
					if(!O)
						step_towards(src,src.target)
				sleep(2)
		AttackNearest()
			set background=1
			src.acting="attacknearest"
			while(src.acting=="attacknearest")
				//if(Health<=0&&!KO) Unconscious(null,"?!?!")
				if(src.KO)
					src.acting=null
					src.OMessage(15, "[src]'s body fades into the sand...")
					sleep(10)
					del(src)
					break
				var/mob/Players/P
				for(P in oview(Sight_Range,src)) break
				var/atom/O
				for(O in get_step(src,dir)) if(O.density&&!ismob(O)) break
				if(!src.Knockbacked)
					if(P&&!O)
						if(P.key!=src.Owner)
							src.target=P
							step_towards(src,P)
				sleep(rand(1,4))
		Follow()
			set background=1
			src.target=null
			src.acting="follow"
			var/mob/x
			for(var/mob/Players/M in world)
				if(src.Owner==M.key)
					x=M
			if(!x)return
			while(src.acting=="follow")
				if(src.KO)
					src.acting=null
					del(src)
					break
				if(x)
					step_towards(src,x)
					sleep(10)
				else
					sleep(100)
/*		Javelin()
			set background=1
			src.subacting="javelin"
			while(src.subacting=="javelin")
				var/mob/Players/P
				for(P in oview(Sight_Range,src)) break
				var/mob/Players/M
				while(M in view(5,src))
					if(!src.Knockbacked)
						if(P&&M)
							if(prob(40))
								strike=rand(1,10)
								if(strike==3)
									src.specialv=1
									src.Frozen=1
									sleep(10)
									flick("Blast",src)
									var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
									A.Distance=20
									A.Knockback=1
									A.dir=rand(1,8)
									A.icon='Spear.dmi'
									A.Owner=src
									A.Damage_Multiplier=2
									A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*5
									if(A&&target) spawn()Homing(A,target)
									else if(A) spawn()Butch(A)
									if(prob(50))sleep(30)
									else if(prob(20))sleep(20)
									src.Frozen=0
									strike=0
								else
									sleep(2)
		Heavy()
			set background=1
			src.subacting="heavy"
			while(src.subacting=="heavy")
				var/mob/Players/P
				for(P in oview(Sight_Range,src)) break
				var/mob/Players/M
				while(M in view(1,src))
					if(!src.Knockbacked)
						if(P&&M)
							if(prob(20))
								strike=rand(1,10)
								if(strike==3)
									Melee(2,2)
									strike=0
									src.Frozen=1
									sleep(10)
									src.Frozen=0
								else
									sleep(2)
		Lightning()
			set background=1
			src.subacting="lightning"
			while(src.subacting=="lightning")
				var/mob/Players/P
				for(P in oview(Sight_Range,src)) break
				var/mob/Players/M
				while(M in view(7,src))
					if(!src.Knockbacked)
						if(P&&M)
							if(prob(10))
								strike=rand(1,20)
								if(strike==7)
									src.specialv=1
									src.Frozen=1
									sleep(20)
									flick("Blast",src)
									var/obj/Projectiles/Mystical/A=new(get_step(src,src.dir))
									A.Distance=30
									A.Explosive=1
									A.dir=rand(1,8)
									A.icon='LightStrike.dmi'
									A.Owner=src
									A.Damage_Multiplier=5
									A.Offense=(src.Offense*src.OffenseMultiplier)*src.Skill*10
									if(A&&target) spawn()Homing(A,target)
									else if(A) spawn()Butch(A)
									if(prob(50))sleep(30)
									else if(prob(20))sleep(20)
									src.Frozen=0
									strike=0
								else
									sleep(2)
*/


mob/SuperGhost
	Bump(mob/A)
		if(istype(A,/mob))if(src.target!=A)return
//		Melee()
		for(var/turf/T in Turf_Circle(src,3))
			if(prob(2)) sleep(0.005)
			spawn(rand(4,8)) Destroy(T,5)
			if(prob(50))
				new/obj/Effects/Explosion(T)
			for(var/mob/M in view(0,T))
				if(M!=src.Owner)
					M.Health-=src.ForVsRes(M, 2.5)
		sleep(5)
		for(var/mob/Players/M in world)
			if(src.Owner==M.key)
				M.SageBunshin-=1
		del src
	var/acting
	var/target
	Click()
		if(usr.key==src.Owner)
			var/blah=input(usr,"Command your split.","[src]") in list("Nevermind","Stop","Attack Nearest","Attack Target","Destroy","Follow")
			switch(blah)
				if("Nevermind")
					return
				if("Attack Nearest")
					spawn src.AttackNearest()
				if("Stop")
					src.acting=null
				if("Attack Target")
					var/list/e=list("Cancel")
					for(var/mob/q in oview(12,src))
						e.Add(q)
					var/mob/b=input(usr,"Attack who?","[src]") in e
					if(b!="Cancel")
						src.target=b
						src.AttackTarget()
				if("Destroy")
					src.acting=null
					for(var/mob/Players/M in world)
						if(src.Owner==M.key)
							src.invisibility=0
							src.see_invisible=0
							M.SageBunshin-=1
					del(src)
				if("Follow")
					spawn src.Follow()
	proc
		AttackTarget()
			set background=1
			src.acting="attacktarget"
			while(src.acting=="attacktarget")
				if(!src.target in world)
					src.acting=null
					break
				//if(Health<=0&&!KO) Unconscious(null,"?!?!")
				if(src.KO)break
				var/atom/O
				for(O in get_step(src,dir)) if(O.density&&!ismob(O)) break
				if(!src.Knockbacked)
					if(!O)
						step_towards(src,src.target)
				sleep((10/src.SpeedMod)/10)


		AttackNearest()
			set background=1
			src.acting="attacknearest"
			while(src.acting=="attacknearest")
				//if(Health<=0&&!KO) Unconscious(null,"?!?!")
				if(src.KO)
					src.acting=null
					break
				var/mob/Players/P
				for(P in oview(Sight_Range,src)) break
				var/atom/O
				for(O in get_step(src,dir)) if(O.density&&!ismob(O)) break
				if(!src.Knockbacked)
					if(P&&!O)
						src.target=P
						step_towards(src,P)
				sleep((10/src.SpeedMod)/2)
		Follow()
			set background=1
			src.target=null
			src.acting="follow"
			var/mob/x
			for(var/mob/Players/M in world)
				if(src.Owner==M.key)
					x=M
			if(!x)return
			while(src.acting=="follow")
				if(src.KO)break
				if(x)
					step_towards(src,x)
					sleep(10)
				else
					sleep(100)

mob/JohnWolf
	Bump(mob/A)
		if(istype(A,/mob))if(src.target!=A)return
//		Melee()
		for(var/turf/T in Turf_Circle(src,3))
			if(prob(2)) sleep(0.005)
			spawn(rand(4,8)) Destroy(T,5)
			if(prob(50))
				new/obj/Effects/Explosion(T)
			for(var/mob/M in view(0,T))
				if(M!=src.Owner)
					M.Health-=src.ForVsRes(M, 7.5)
		sleep(5)
		for(var/mob/Players/M in world)
			if(src.Owner==M.key)
				M.JohnTheWolf-=1
		del src
	var/acting
	var/target
	Click()
		if(usr.key==src.Owner)
			var/blah=input(usr,"Command your pack.","[src]") in list("Nevermind","Stop","Attack Nearest","Attack Target","Destroy","Follow")
			switch(blah)
				if("Nevermind")
					return
				if("Attack Nearest")
					for(var/mob/JohnWolf/M in view(20))
						spawn src.AttackNearest()
				if("Stop")
					src.acting=null
				if("Attack Target")
					var/list/e=list("Cancel")
					for(var/mob/q in oview(12,src))
						e.Add(q)
					var/mob/b=input(usr,"Attack who?","[src]") in e
					if(b!="Cancel")
						src.target=b
						src.AttackTarget()
				if("Destroy")
					src.acting=null
					for(var/mob/Players/M in world)
						if(src.Owner==M.key)
							M.JohnTheWolf-=1
					del(src)
				if("Follow")
					spawn src.Follow()
	proc
		AttackTarget()
			set background=1
			src.acting="attacktarget"
			while(src.acting=="attacktarget")
				if(!src.target in world)
					src.acting=null
					break
				//if(Health<=0&&!KO) Unconscious(null,"?!?!")
				if(src.KO)break
				var/atom/O
				for(O in get_step(src,dir)) if(O.density&&!ismob(O)) break
				if(!src.Knockbacked)
					if(!O)
						step_towards(src,src.target)
				sleep(5/src.SpeedMod)
		AttackNearest()
			set background=1
			src.acting="attacknearest"
			while(src.acting=="attacknearest")
				//if(Health<=0&&!KO) Unconscious(null,"?!?!")
				if(src.KO)
					src.acting=null
					break
				var/mob/Players/P
				for(P in oview(Sight_Range,src)) break
				var/atom/O
				for(O in get_step(src,dir)) if(O.density&&!ismob(O)) break
				if(!src.Knockbacked&&src.Owner!=P.key)
					if(P&&!O)
						src.target=P
						step_towards(src,P)
				sleep(4/src.SpeedMod)
		Follow()
			set background=1
			src.target=null
			src.acting="follow"
			var/mob/x
			for(var/mob/Players/M in world)
				if(src.Owner==M.key)
					x=M
			if(!x)return
			while(src.acting=="follow")
				if(src.KO)break
				if(x)
					step_towards(src,x)
					sleep(10/src.SpeedMod)
				else
					sleep(100)

mob/SageSplit
	Bump(mob/A)
		if(istype(A,/mob))if(src.target!=A)return
		Melee()
	var/acting
	var/target
	Click()
		if(usr.key==src.Owner)
			var/blah=input(usr,"Command your split.","[src]") in list("Nevermind","Stop","Attack Nearest","Attack Target","Destroy","Follow", "Summon")
			switch(blah)
				if("Nevermind")
					return
				if("Attack Nearest")
					spawn src.AttackNearest()
				if("Stop")
					src.acting=null
				if("Attack Target")
					var/list/e=list("Cancel")
					for(var/mob/q in oview(12,src))
						e.Add(q)
					var/mob/b=input(usr,"Attack who?","[src]") in e
					if(b!="Cancel")
						src.target=b
						src.AttackTarget()
				if("Destroy")
					src.acting=null
					for(var/mob/Players/M in world)
						if(src.Owner==M.key)
							M.SageBunshin-=1
							M.ManaAmount+=100
							if(M.ManaAmount>=M.ManaMax)
								M.ManaAmount=M.ManaMax
					del(src)
				if("Follow")
					spawn src.Follow()
				if("Summon")
					for(var/mob/Players/M in world)
						if(src.Owner==M.key)
							src.loc=M.loc
	proc
		AttackTarget()
			set background=1
			src.acting="attacktarget"
			while(src.acting=="attacktarget")
				if(!src.target in world)
					src.acting=null
					break
				//if(Health<=0&&!KO) Unconscious(null,"?!?!")
				if(src.KO)break
				var/atom/O
				for(O in get_step(src,dir)) if(O.density&&!ismob(O)) break
				if(!src.Knockbacked)
					if(!O)
						step_towards(src,src.target)
				sleep((10/src.SpeedMod)/2)


		AttackNearest()
			set background=1
			src.acting="attacknearest"
			while(src.acting=="attacknearest")
				//if(Health<=0&&!KO) Unconscious(null,"?!?!")
				if(src.KO)
					src.acting=null
					break
				var/mob/Players/P
				for(P in oview(Sight_Range,src)) break
				var/atom/O
				for(O in get_step(src,dir)) if(O.density&&!ismob(O)) break
				if(!src.Knockbacked)
					if(P&&!O)
						src.target=P
						step_towards(src,P)
				sleep((10/src.SpeedMod)/2)
		Follow()
			set background=1
			src.target=null
			src.acting="follow"
			var/mob/x
			for(var/mob/Players/M in world)
				if(src.Owner==M.key)
					x=M
			if(!x)return
			while(src.acting=="follow")
				if(src.KO)break
				if(x)
					step_towards(src,x)
					sleep(10)
				else
					sleep(100)
mob/AizenSplit
	Bump(mob/A)
		if(istype(A,/mob))if(src.target!=A)return
		Melee()
	var/acting
	var/target
	Click()
		if(usr.key==src.Owner)
			var/blah=input(usr,"Command your clone.","[src]") in list("Nevermind","Stop","Attack Nearest","Attack Target","Destroy","Follow", "Summon")
			switch(blah)
				if("Nevermind")
					return
				if("Attack Nearest")
					spawn src.AttackNearest()
				if("Stop")
					src.acting=null
				if("Attack Target")
					var/list/e=list("Cancel")
					for(var/mob/q in oview(12,src))
						e.Add(q)
					var/mob/b=input(usr,"Attack who?","[src]") in e
					if(b!="Cancel")
						src.target=b
						src.AttackTarget()
				if("Destroy")
					src.acting=null
					for(var/mob/Players/M in world)
						if(src.Owner==M.key)
							M.AizenClone=0
							M.ManaAmount+=100
							if(M.ManaAmount>=M.ManaMax)
								M.ManaAmount=M.ManaMax
					del(src)
				if("Follow")
					spawn src.Follow()
				if("Summon")
					for(var/mob/Players/M in world)
						if(src.Owner==M.key)
							src.loc=M.loc
	proc
		AttackTarget()
			set background=1
			src.acting="attacktarget"
			while(src.acting=="attacktarget")
				if(!src.target in world)
					src.acting=null
					break
				//if(Health<=0&&!KO) Unconscious(null,"?!?!")
				if(src.KO)break
				var/atom/O
				for(O in get_step(src,dir)) if(O.density&&!ismob(O)) break
				if(!src.Knockbacked)
					if(!O)
						step_towards(src,src.target)
					if(Target in get_step(src,src.dir))
						var/HShot=1
						for(var/obj/Skills/MartialArts/HeavyShot/MA in contents)
							if(MA.Using||prob(65))
								HShot=0
							else
								HShot=1
								MA.Cooldown()

						if(HShot)
							src.AttackHardness=2
							src.HeavyShot=1
					//		src.Melee(1,1,0,0)
							spawn(50) src.HeavyShot=0
					//	else
					//		Melee()
				sleep(src.SpeedMod/4)

		AttackNearest()
			set background=1
			src.acting="attacknearest"
			while(src.acting=="attacknearest")
				//if(Health<=0&&!KO) Unconscious(null,"?!?!")
				if(src.KO)
					src.acting=null
					break
				var/mob/Players/P
				for(P in oview(Sight_Range,src)) break
				var/atom/O
				for(O in get_step(src,dir)) if(O.density&&!ismob(O)) break
				if(!src.Knockbacked)
					if(P&&!O)
						src.target=P
						step_towards(src,P)
					if(Target in get_step(src,src.dir))
						var/HShot=1
						for(var/obj/Skills/MartialArts/HeavyShot/MA in contents)
							if(MA.Using||prob(65))
								HShot=0
							else
								HShot=1
								MA.Cooldown()

						if(HShot)
							src.AttackHardness=2
							src.HeavyShot=1
					//		src.Melee(1,1,0,0)
							spawn(50) src.HeavyShot=0
					//	else
					//		Melee()
				sleep(src.SpeedMod/4)

		Follow()
			set background=1
			src.target=null
			src.acting="follow"
			var/mob/x
			for(var/mob/Players/M in world)
				if(src.Owner==M.key)
					x=M
			if(!x)return
			while(src.acting=="follow")
				if(src.KO)break
				if(x)
					step_towards(src,x)
					sleep(1)
				else
					sleep(10)

mob/Sim
	Bump(mob/A)
		if(istype(A,/mob))if(src.target!=A)return
		Melee()
	var/acting
	var/target
	Click()
		if(usr.key==src.Owner)
			var/blah=input(usr,"Command your split.","[src]") in list("Destroy","Attack Self")
			switch(blah)
				if("Destroy")
					del src
					return
				if("Attack Self")
					src.target=usr
					src.SimAttackTarget()
	proc
		SimAttackTarget()
			set background=1
			src.acting="attacktarget"
			while(src.acting=="attacktarget")
				if(!src.target in world)
					src.acting=null
					break
				//if(Health<=0&&!KO) Unconscious(null,"?!?!")
				if(src.KO)break
				var/atom/O
				for(O in get_step(src,dir)) if(O.density&&!ismob(O)) break
				if(!src.Knockbacked)
					if(!O)
						step_towards(src,src.target)
				src.Energy-=10
				if(src.Energy<5)
					src.OMessage(10,"The simulation has vanished.","[ExtractInfo(src)] has vanished.")
					del src
				sleep(10/src.SpeedMod)

mob/Split
	Bump(mob/A)
		if(istype(A,/mob))if(src.target!=A)return
		Melee()
	var/acting
	var/target
	Click()
		if(usr.key==src.Owner)
			var/blah=input(usr,"Command your split.","[src]") in list("Nevermind","Stop","Attack Nearest","Attack Target","Destroy","Follow")
			switch(blah)
				if("Nevermind")
					return
				if("Attack Nearest")
					spawn src.AttackNearest()
				if("Stop")
					src.acting=null
				if("Attack Target")
					var/list/e=list("Cancel")
					for(var/mob/q in oview(12,src))
						e.Add(q)
					var/mob/b=input(usr,"Attack who?","[src]") in e
					if(b!="Cancel")
						src.target=b
						src.AttackTarget()
				if("Destroy")
					src.acting=null
					del(src)
				if("Follow")
					spawn src.Follow()
	proc
		AttackTarget()
			set background=1
			src.acting="attacktarget"
			while(src.acting=="attacktarget")
				if(!src.target in world)
					src.acting=null
					break
				//if(Health<=0&&!KO) Unconscious(null,"?!?!")
				if(src.KO)break
				var/atom/O
				for(O in get_step(src,dir)) if(O.density&&!ismob(O)) break
				if(!src.Knockbacked)
					if(!O)
						step_towards(src,src.target)
				sleep((10/src.SpeedMod)/2)


		AttackNearest()
			set background=1
			src.acting="attacknearest"
			while(src.acting=="attacknearest")
				//if(Health<=0&&!KO) Unconscious(null,"?!?!")
				if(src.KO)
					src.acting=null
					break
				var/mob/Players/P
				for(P in oview(Sight_Range,src)) break
				var/atom/O
				for(O in get_step(src,dir)) if(O.density&&!ismob(O)) break
				if(!src.Knockbacked)
					if(P&&!O)
						src.target=P
						step_towards(src,P)
				sleep((10/src.SpeedMod)/2)
		Follow()
			set background=1
			src.target=null
			src.acting="follow"
			var/mob/x
			for(var/mob/Players/M in world)
				if(src.Owner==M.key)
					x=M
			if(!x)return
			while(src.acting=="follow")
				if(src.KO)break
				if(x)
					step_towards(src,x)
					sleep(10)
				else
					sleep(100)

mob/DummyCharacter //For testing rares
	Bump(mob/A)
		if(istype(A,/mob))if(src.target!=A)return
		Melee()
	var/acting
	var/target
	Click()
		if(usr.key==src.Owner)
			var/blah=input(usr,"Command your split.","[src]") in list("Nevermind","Stop","Attack Nearest","Attack Target","Destroy","Follow")
			switch(blah)
				if("Nevermind")
					return
				if("Attack Nearest")
					spawn src.AttackNearest()
				if("Stop")
					src.acting=null
				if("Attack Target")
					var/list/e=list("Cancel")
					for(var/mob/q in oview(12,src))
						e.Add(q)
					var/mob/b=input(usr,"Attack who?","[src]") in e
					if(b!="Cancel")
						src.target=b
						src.AttackTarget()
				if("Destroy")
					src.acting=null
					del(src)
				if("Follow")
					spawn src.Follow()
	proc
		AttackTarget()
			set background=1
			src.acting="attacktarget"
			while(src.acting=="attacktarget")
				if(!src.target in world)
					src.acting=null
					break
				//if(Health<=0&&!KO) Unconscious(null,"?!?!")
				if(src.KO)break
				var/atom/O
				for(O in get_step(src,dir)) if(O.density&&!ismob(O)) break
				if(!src.Knockbacked)
					if(!O)
						step_towards(src,src.target)
				sleep((10/src.SpeedMod)/2)


		AttackNearest()
			set background=1
			src.acting="attacknearest"
			while(src.acting=="attacknearest")
				//if(Health<=0&&!KO) Unconscious(null,"?!?!")
				if(src.KO)
					src.acting=null
					break
				var/mob/Players/P
				for(P in oview(Sight_Range,src)) break
				var/atom/O
				for(O in get_step(src,dir)) if(O.density&&!ismob(O)) break
				if(!src.Knockbacked)
					if(P&&!O)
						src.target=P
						step_towards(src,P)
				sleep((10/src.SpeedMod)/2)
		Follow()
			set background=1
			src.target=null
			src.acting="follow"
			var/mob/x
			for(var/mob/Players/M in world)
				if(src.Owner==M.key)
					x=M
			if(!x)return
			while(src.acting=="follow")
				if(src.KO)break
				if(x)
					step_towards(src,x)
					sleep(10)
				else
					sleep(100)


proc/Homing(var/ori,var/pla)
	var/amount=50
	while(ori)
		amount--
		step_towards(ori,pla,4)
		sleep(1)
		if(amount<1)if(ori)del(ori)

proc/Butch(var/obj/Projectiles/Mystical/A)
	var/amount=75
	while(A)
		amount--
		for(var/mob/P in oview(30,A))
			if(P.key!=A.Owner)
				step_towards(A,P)
		sleep(1)
		if(amount<1)if(A)del(A)

/*proc/Drunk(var/ori)
	var/amount=50
	for(var/mob/V)
	while(ori)
		amount--
		step_towards(ori,V,4)
		sleep(1)
		if(amount<1)if(ori)del(ori)*/

mob/proc/Quake(var/duration=30)
	if(client) while(duration)
		duration-=1
		for(var/mob/M in view(src))
			if(M.client)
				M.client.pixel_x=rand(-8,8)
				M.client.pixel_y=rand(-8,8)
			if(!duration) if(M.client)
				M.client.pixel_x=0
				M.client.pixel_y=0
		sleep(1)

mob/proc/Earthquake(var/duration=30,var/xpixelmin=0,var/xpixelmax=5,var/ypixelmin=0,var/ypixelmax=5)
	if(client)
		while(duration)
			duration-=1
			for(var/mob/M in view(src))
				if(M.client)
					M.client.pixel_x=rand(xpixelmin,xpixelmax)
					M.client.pixel_y=rand(ypixelmin,ypixelmax)
				if(!duration) if(M.client)
					M.client.pixel_x=0
					M.client.pixel_y=0
			if(duration<0)
				duration=0
			sleep(1)
