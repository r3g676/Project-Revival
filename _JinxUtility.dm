var
	DemiUnlockedReq1=20000
	DemiReq1=50000
	DemiUnlockedReq2=75000
	DemiReq2=150000


	NamekianUnlockedReq1=10000
	NamekianReq1=15000
	NamekianUnlockedReq2=75000
	NamekianReq2=150000

	HumanUnlockedReq1=5000
	HumanReq1=10000
	HumanUnlockedReq2=40000
	HumanReq2=75000
	HumanUnlockedReq3=125000
	HumanReq3=200000

	SpiritDollUnlockedReq1=5000
	SpiritDollReq1=10000
	SpiritDollUnlockedReq2=40000
	SpiritDollReq2=75000

	HalfDemonUnlockedReq1=5000
	HalfDemonReq1=10000
	HalfDemonUnlockedReq2=10000
	HalfDemonReq2=25000

	TuffleUnlockedReq1=2500
	TuffleReq1=10000
	TuffleUnlockedReq2=25000
	TuffleReq2=50000

	HeranUnlockedReq1=75000
	HeranReq1=175000

	AethirianUnlockedReq1=10000
	AethirianReq1=25000
	AethirianUnlockedReq2=75000
	AethirianReq2=150000

	TanukiUnlockedReq1=75000
	TanukiReq1=175000

	KitsuneUnlockedReq1=25000
	KitsuneReq1=100000

	NekoUnlockedReq1=500
	NekoReq1=5000
	NekoUnlockedReq2=1000
	NekoReq2=10000
	NekoUnlockedReq3=25000
	NekoReq3=250000
	NekoUnlockedReq4=50000
	NekoReq4=500000



mob
	proc
		AscAvailable(var/race)
			if(race=="Demi")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked>=1)
						if(src.GetBPM() >= global.DemiUnlockedReq1)
							return 1
					else
						if(src.GetBPM() >= global.DemiReq1)
							return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >= 2)
						if(src.GetBPM() >= global.DemiUnlockedReq2)
							return 2
					else
						if(src.GetBPM() >= global.DemiReq2)
							return 2
				if(src.AscensionsAcquired < 3&&src.AscensionsAcquired==2)
					if(src.AscensionsUnlocked >= 3)
						return 3
				return 0
			if(race=="Namekian")
				if(src.EnhancedHearing!=1)
					src.EnhancedHearing=1
				if(src.Class != "Ancient")
					if(src.AscensionsAcquired < 1)
						if(src.AscensionsUnlocked >=1)
							if(src.GetBPM() >= global.NamekianUnlockedReq1)
								return 1
						else
							if(src.GetBPM() >= global.NamekianReq1)
								return 1
					if(src.AscensionsAcquired < 2)
						if(src.AscensionsUnlocked >=2)
							if(src.GetBPM() >= global.NamekianUnlockedReq2)
								return 2
						else
							if(src.GetBPM() >= global.NamekianReq2)
								return 2
					if(src.AscensionsAcquired < 3&&src.AscensionsAcquired==2)
						if(src.AscensionsUnlocked >=3)
							return 3
				return 0
			if(race=="Saiyan")
				if(src.Class=="Elite"||src.Class=="Legendary"||src.Class=="Savage")
					if(src.AscensionsUnlocked < 1)
						src.AscensionsUnlocked = 1
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >= 2)
						return 2
				if(src.AscensionsAcquired < 3)
					if(src.AscensionsUnlocked >= 3)
						return 3
				if(src.AscensionsAcquired < 4)
					if(src.AscensionsUnlocked >= 4)
						return 4
				return 0
			if(race=="Human")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						if(src.GetBPM() >= global.HumanUnlockedReq1)
							return 1
					else
						if(src.GetBPM() >= global.HumanReq1)
							return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >= 2)
						if(src.GetBPM() >= global.HumanUnlockedReq2)
							return 2
					else
						if(src.GetBPM() >= global.HumanReq2)
							return 2
				if(src.AscensionsAcquired < 3)
					if(src.AscensionsUnlocked >= 3)
						if(src.GetBPM() >= global.HumanUnlockedReq3)
							return 3
					else
						if(src.GetBPM() >= global.HumanReq3)
							return 3
				return 0
			if(race=="Nobody")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						if(src.GetBPM() >= global.HalfDemonUnlockedReq2)
							return 1
					else
						if(src.GetBPM() >= global.HalfDemonReq2)
							return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >= 2)
						if(src.GetBPM() >= (global.HumanUnlockedReq2*1.5))
							return 2
					else
						if(src.GetBPM() >= (global.HumanReq2*1.5))
							return 2
				if(src.AscensionsAcquired < 3&&src.AscensionsAcquired==2)
					if(src.AscensionsUnlocked >= 3)
						if(src.CompleteFormApproved||src.WONApproved)
							return 3
				return 0
			if(race=="1/16th Saiyan")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						if(src.GetBPM() >= global.HumanUnlockedReq1)
							return 1
					else
						if(src.GetBPM() >= global.HumanReq1)
							return 1
				return 0
			if(race=="Half Saiyan")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked>=1)
						if(src.GetBPM() >= global.DemiUnlockedReq1)
							return 1
					else
						if(src.GetBPM() >= global.DemiReq1)
							return 1
				if(src.AscensionsAcquired < 2&&src.AscensionsAcquired==1)
					if(src.AscensionsUnlocked >= 2)
						return 2
				return 0
			if(race=="Spirit Doll")
				if(src.ManaMax < 300)
					src.ManaMax = 300
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						if(src.GetBPM() >= global.SpiritDollUnlockedReq1)
							return 1
					else
						if(src.GetBPM() >= global.SpiritDollReq1)
							return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >= 2)
						if(src.GetBPM() >= global.SpiritDollUnlockedReq2)
							return 2
					else
						if(src.GetBPM() >= global.SpiritDollReq2)
							return 2
				return 0
			if(race=="Half Demon")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						if(src.GetBPM() >= global.HalfDemonUnlockedReq1)
							return 1
					else
						if(src.GetBPM() >= global.HalfDemonReq1)
							return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >= 2)
						if(src.GetBPM() >= global.HalfDemonUnlockedReq2)
							return 2
					else
						if(src.GetBPM() >= global.HalfDemonReq2)
							return 2
				return 0
			if(race=="Tsufurujin")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						if(src.GetBPM() >= global.TuffleUnlockedReq1)
							return 1
					else
						if(src.GetBPM() >= global.TuffleReq1)
							return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >= 2)
						if(src.GetBPM() >= global.TuffleUnlockedReq2)
							return 2
					else
						if(src.GetBPM() >= global.TuffleReq2)
							return 2
				if(src.AscensionsAcquired < 3&&src.AscensionsAcquired==2)
					if(src.AscensionsUnlocked >= 3)
						return 3
				if(src.AscensionsAcquired < 4&&src.AscensionsAcquired==3)
					if(src.AscensionsUnlocked >= 4)
						return 4
				return 0
			if(race=="Heran")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						if(src.GetBPM() >= global.HeranUnlockedReq1)
							return 1
					else
						if(src.GetBPM() >= global.HeranReq1)
							return 1
				if(src.AscensionsAcquired < 2&&src.AscensionsAcquired==1)
					if(src.AscensionsUnlocked >= 2)
						return 2
				return 0
			if(race=="Aethirian")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						if(src.GetBPM() >= global.AethirianUnlockedReq1)
							return 1
					else
						if(src.GetBPM() >= global.AethirianReq1)
							return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >= 2)
						if(src.GetBPM() >= global.AethirianUnlockedReq2)
							return 2
					else
						if(src.GetBPM() >= global.AethirianReq2)
							return 2
				if(src.AscensionsAcquired < 3&&src.AscensionsAcquired==2)
					if(src.AscensionsUnlocked >= 3)
						return 3
				if(src.AscensionsAcquired < 4&&src.AscensionsAcquired==3)
					if(src.AscensionsUnlocked >= 4)
						return 4
				return 0
			if(race=="Youkai")
				if(!src.EnhancedHearing)
					src.EnhancedHearing=1
				if(src.Class=="Kitsune")
					if(src.AscensionsAcquired < 1)
						if(src.AscensionsUnlocked >= 1)
							if(src.GetBPM() >= global.KitsuneUnlockedReq1)
								return 1
						else
							if(src.GetBPM() >= global.KitsuneReq1)
								return 1
					if(src.AscensionsAcquired < 2&&src.AscensionsAcquired==1)
						if(src.AscensionsUnlocked >= 2)
							return 2
					if(src.AscensionsAcquired < 3&&src.AscensionsAcquired==2)
						if(src.AscensionsUnlocked >= 3)
							return 3
					return 0
				if(src.Class=="Tanuki")
					if(src.AscensionsAcquired < 1)
						if(src.AscensionsUnlocked >= 1)
							if(src.GetBPM() >= global.TanukiUnlockedReq1)
								return 1
						else
							if(src.GetBPM() >= global.TanukiReq1)
								return 1
					if(src.AscensionsAcquired < 2&&src.AscensionsAcquired==1)
						if(src.AscensionsUnlocked >= 2)
							return 2
					return 0
				if(src.Class=="Hell Raven")
					if(src.AscensionsAcquired < 1)
						if(src.AscensionsUnlocked>=1)
							return 1
					if(src.AscensionsAcquired < 2)
						if(src.AscensionsUnlocked >= 2)
							return 2
					if(src.AscensionsAcquired < 3)
						if(src.AscensionsUnlocked >= 3)
							return 3
			if(race=="Android")
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >= 2)
						return 2
				if(src.AscensionsAcquired < 3)
					if(src.AscensionsUnlocked >= 3)
						return 3
				return 0
			if(race=="Neko")
				if(!src.EnhancedHearing)
					src.EnhancedHearing=1
				if(src.AscensionsAcquired < 1)
					if(src.AscensionsUnlocked >= 1)
						if(src.GetBPM() >= global.NekoUnlockedReq1)
							return 1
					else
						if(src.GetBPM() >= global.NekoReq1)
							return 1
				if(src.AscensionsAcquired < 2)
					if(src.AscensionsUnlocked >= 2)
						if(src.GetBPM() >= global.NekoUnlockedReq2)
							return 2
					else
						if(src.GetBPM() >= global.NekoReq2)
							return 2
				if(src.AscensionsAcquired < 3)
					if(src.AscensionsUnlocked >= 3)
						if(src.GetBPM() >= global.NekoUnlockedReq3)
							return 3
					else
						if(src.GetBPM() >= global.NekoReq3)
							return 3
				if(src.AscensionsAcquired < 4)
					if(src.AscensionsUnlocked >= 4)
						if(src.GetBPM() >= global.NekoUnlockedReq4)
							return 4
					else
						if(src.GetBPM() >= global.NekoReq4)
							return 4
				if(src.AscensionsAcquired < 5&&src.AscensionsAcquired==4)
					if(src.AscensionsUnlocked >= 5)
						return 5
				if(src.AscensionsAcquired < 6)
					if(src.AscensionsUnlocked >= 6&&src.AscensionsAcquired==5)
						return 6
				return 0

		Ascension(var/race, var/num)
			if(num!="Fury")
				src.AscensionsAcquired=num
			if(race=="Demi")
				if(num==1)
					var/choice
					while(!choice)
						choice=input(src,"Choose what kind of god you'd like to inherit your destiny from.", "Olympian Ascension") in list("Heracles", "Poseidon", "Hades", "Zeus")
						var/confirm
						switch(choice)
							if("Heracles")
								confirm=alert(src,"Heracles Demigods borrow more heavily from humans.  They gain exceptional stat growths, but do not gain much BP until later. Do you want to inherit Heracles' destiny?", "Olympian Ascension", "Yes", "No")
							if("Poseidon")
								confirm=alert(src,"Poseidon Demigods gain in all stats, as well as BP.  Furthermore, they hold dominion over water and recover more easily in it.  Do you want to inherit Poseidon's destiny?", "Olympian Ascension", "Yes", "No")
							if("Hades")
								confirm=alert(src,"Hades Demigods gain tremendous endurance and resistance.  They reign over fire. Do you want to inherit Hades' destiny?", "Olympian Ascension", "Yes", "No")
							if("Zeus")
								confirm=alert(src,"Zeus Demigods gain enormous force and energy manipulation abilities. Do you want to inherit Zeus' destiny?", "Olympian Ascension", "Yes", "No")
							if("Chin Chin")
								confirm=alert(src,"Chin Chin Demigods possess the power of the great dark lyrca god, enabling them to control the many realms of the universe. Will you join us, boss?", "Olympian Ascension", "Yes", "No")
						if(confirm=="No")
							choice=null
					src.Class=choice
					switch(src.Class)
						if("Heracles")
							src.Ascend(4)
							src.StrMult(2)
							src.EndMult(1.3)
							src.ResMult(1.3)
							src.SpdMult(1.5)
							src.OffMult(1.4)
							src.DefMult(1.4)
							src.RecovMult(1.5)
						if("Poseidon")
							src.Ascend(4)
							src.EnergyMult(2)
							src.StrMult(1.15)
							src.EndMult(1.15)
							src.SpdMult(1.5)
							src.ForMult(1.75)
							src.ResMult(1.25)
							src.OffMult(1.5)
							src.DefMult(1.5)
							src.RecovMult(2)
						if("Hades")
							src.Ascend(7)
							src.RegenMult(1.5)
							src.EndMult(2)
							src.ResMult(2)
							src.SpdMult(1.5)
						if("Zeus")
							src.Ascend(4)
							src.ForMult(3)
							src.EnergyMult(3)
							src.RecovMult(3)
							src.SpdMult(1.5)
						if("Chin Chin")
							if(!src.Kowala)
								src<<"You're not allowed to make this choice, boss..."
								return
							src.Ascend(4)
							src.AllMult(1.25)
							src.Kowala=0
							src.ChinChin=1
					src.SetVars()
				if(num==2)
					var/choices=list("Cronus", "Oceanus", "Hyperion")
					var/choice
					var/confirm=0
					while(confirm!="Yes")
						choice=input(src, "You've ascended beyond godhood, drawing in the power of the Titans themselves.  Which Titan's strength do you draw upon?", "Titan Ascension") in choices
						if(choice=="Cronus")
							confirm=alert(src, "Cronus was the leader of the Titans.  Godlings who draw in his power are offered a surge of power higher than every other Titan, and they typically wear the mantle of leadership.  Do you want to draw in this Titan's power?", "Titan Ascension", "Yes", "No")
						if(choice=="Oceanus")
							confirm=alert(src, "Oceanus embodies all the lively seas.  Godlings who draw in his power walk a moderate path.  While their power is not the highest, it can endure for the longest. They are compassionate for the sake of others, though this compassion may not always manifest as one expects. Do you want to draw in this Titan's power?", "Titan Ascension", "Yes", "No")
						if(choice=="Hyperion")
							confirm=alert(src, "Hyperion was the wisest of all Titans.  Godlings who draw in his power are offered wisdom and understanding rather than brute force.  They are a patient breed, but utterly fearsome when committed to a battle.  Do you want to draw in this Titan's power?", "Titan Ascension", "Yes", "No")
					if(src.Class=="Zeus")
						if(choice=="Cronus")
							src.Class="Uranus"
							src.EnergyMult(1.25)
							src.ForMult(1.25)
							src.OffMult(1.25)
						if(choice=="Oceanus")
							src.Class="Thalassa"
							src.OffMult(1.4)
							src.DefMult(1.35)
						if(choice=="Hyperion")
							src.Class="Aether"
							src.EnergyMult(1.5)
							src.StrMult(1.25)
					if(src.Class=="Poseidon")
						if(choice=="Cronus")
							src.Class="Hemera"
							src.EndMult(1.25)
							src.ResMult(1.25)
							src.OffMult(1.25)
						if(choice=="Oceanus")
							src.Class="Pontus"
							src.StrMult(1.4)
							src.OffMult(1.35)
						if(choice=="Hyperion")
							src.Class="Nyx"
							src.DefMult(1.5)
							src.ForMult(1.25)
					if(src.Class=="Heracles")
						if(choice=="Cronus")
							src.Class="Shukra"
							src.ForMult(2.25)
						if(choice=="Oceanus")
							src.Class="Raktavija"
							src.SpdMult(1.35)
						if(choice=="Hyperion")
							src.Class="Vritra"
							src.EndMult(1.25)
							src.ResMult(1.25)
							src.DefMult(1.25)
					if(src.Class=="Hades")
						if(choice=="Cronus")
							src.Class="Erebus"
							src.StrMult(1.25)
							src.DefMult(1.25)
							src.RecovMult(1.25)
						if(choice=="Oceanus")
							src.Class="Hydros"
							src.EndMult(1.4)
							src.DefMult(1.35)
						if(choice=="Hyperion")
							src.Class="Chaos"
							src.StrMult(1.5)
							src.OffMult(1.25)
					if(src.Class=="Chin Chin")
						if(choice=="Cronus")
							src.Class="Red Dick"
							src.StrMult(1.35)
							src.DefMult(1.35)
							src.RecovMult(1.35)
						if(choice=="Oceanus")
							src.Class="Pink Guy"
							src.EndMult(1.75)
							src.DefMult(1.25)
						if(choice=="Hyperion")
							src.Class="Filthy Frank"
							src.StrMult(1.45)
							src.OffMult(1.45)
					src << "Your godhood is infused with [choice]'s energy, and you become an avatar of [src.Class]'s power!"
					src.SetVars()
				if(num==3)
					if(src.trans["active"])
						src << "Turn off Godmode, then meditate again."
						return
					var/list/ZeusClasses = list("Uranus", "Thalassa", "Aether")
					var/list/PoseidonClasses = list("Hemera", "Pontus", "Nyx")
					var/list/HeraclesClasses = list("Shukra", "Raktavija", "Vritra")
					var/list/HadesClasses = list("Erebus", "Hydros", "Chaos")
					var/list/ChinChinClasses = list("Red Dick", "Pink Guy", "Filthy Frank")
					if(src.Class in ZeusClasses)
						src << "You are infused with the primordial powers of light!"
						src.Ascend(10)
						src.Class="Prime Zeus"
					if(src.Class in PoseidonClasses)
						src << "You are infused with the primordial powers of the sea!"
						src.Ascend(12.5)
						src.Class="Prime Poseidon"
					if(src.Class in HeraclesClasses)
						src << "You are infused with the primordial powers of evolution!"
						src.Ascend(17.5)
						src.Class="Prime Heracles"
					if(src.Class in HadesClasses)
						src << "You are infused with the primordial powers of night!"
						src.Ascend(20)
						src.Class="Prime Hades"
					if(src.Class in ChinChinClasses)
						src << "You are infused with the primordial powers of pussy!"
						src.Ascend(15)
						src.Class="Prime Boss"
					src.SetVars()
			if(race=="Namekian")
				if(src.Class != "Ancient")
					if(num==1)
						src.Ascend(2.5)
						src.NewAnger(1.5)
						src.RecovMult(1.5)
					if(num==2)
						src.Ascend(5)
						src.EnergyMult(1.25)
						src.RecovMult(1.25)
					if(num==3)
						src.Ascend(15)
						src.Class="Ascendant"
						src.SetVars()
			if(race=="Saiyan")
				if(num==1)
					if(src.Class=="Low-Class")
						src.Ascend(2.25)
						src.EnergyMult(2)
						src.RecovMult(1.25)
					if(src.Class=="Normal")
						src.Ascend(2.75)
						src.RecovMult(1.25)
						src.EnergyMult(1.5)
					if(src.Class=="Elite"||src.Class=="Legendary"||src.Class=="Savage")
						src << ":3c"
				if(num==2)
					if(src.Class=="Low-Class")
						src.Ascend(2.5)
						src.SpdMult(1.25)
						src.NewAnger(2.25)
					if(src.Class=="Normal")
						src.Ascend(3)
						src.OffMult(1.15)
						src.DefMult(1.15)
						src.SpdMult(1.15)
						src.NewAnger(2)
					if(src.Class=="Elite")
						src.Ascend(3.25)
						src.SpdMult(1.25)
						src.RecovMult(1.5)
					if(src.Class=="Legendary")
						src.AllMult(1.25)
					if(src.Class=="Savage")
						src.AllMult(1.25)
				if(num==3)
					if(src.Class=="Low-Class")
						src.Ascend(2.75)
						src.NewAnger(2.5)
						src.AllMult(1.15)
					if(src.Class=="Normal")
						src.Ascend(3.25)
						src.NewAnger(2.25)
						src.AllMult(1.15)
					if(src.Class=="Elite")
						src.Ascend(3.5)
						src.NewAnger(1.75)
						src.AllMult(1.15)
					if(src.Class=="Legendary")
						src.AllMult(1.3)
					if(src.Class=="Savage")
						src.AllMult(1.15)
				if(num==4)
					if(src.Class=="Low-Class")
						src.Ascend(3)
						src.AllMult(1.15)
					if(src.Class=="Normal")
						src.Ascend(3.5)
						src.AllMult(1.15)
					if(src.Class=="Elite")
						src.Ascend(4)
						src.NewAnger(2)
						src.AllMult(1.15)
					if(src.Class=="Legendary")
						src.AllMult(1.5)
					if(src.Class=="Savage")
						src.AllMult(1.1)
			if(race=="Human")
				if(num==1)
					src.Ascend(1.25)
					src.StrMult(1.3)
					src.EndMult(1.3)
					src.SpdMult(1.25)
					src.ForMult(1.3)
					src.ResMult(1.3)
					src.OffMult(1.25)
					src.DefMult(1.25)
					src.RecovMult(1.25)
				if(num==2)
					src.Ascend(1.5)
					src.StrMult(1.2)
					src.EndMult(1.2)
					src.ForMult(1.2)
					src.ResMult(1.2)
					src.OffMult(1.2)
					src.DefMult(1.2)
					src.NewAnger(1.75)
				if(num==3)
					src.Ascend(2.5)
					src.StrMult(1.25)
					src.EndMult(1.25)
					src.SpdMult(1.25)
					src.ForMult(1.25)
					src.ResMult(1.25)
					src.OffMult(1.25)
					src.DefMult(1.25)
			if(race=="Nobody")
				if(num==1)
					var/list/choices=list("Berserker", "Assassin", "Sorcerer")
					var/choice
					var/confirm="No"
					while(confirm=="No")
						choice=input(src,"What prototype of Nobody do you want to model yourself after?", "Nobody Ascension") in choices
						if(choice=="Berserker")
							confirm=alert(src,"Berserker Nobodies are physically powerful with enough accuracy to ensure that they maul what they want to maul.  Do you want to be a Berserker?", "Nobody Ascension", "Yes", "No")
						if(choice=="Assassin")
							confirm=alert(src,"Assassin Nobodies are spry and dangerous. They have good hit ratios, decent dodge ratios, and enough strength to bring the pain.  Do you want to be an Assassin?", "Nobody Ascension", "Yes", "No")
						if(choice=="Sorcerer")
							confirm=alert(src,"Sorcerer Nobodies are talented with the manipulation of energy.  They can use it stronger, faster, and more frequently than others.  Do you want to be a Sorcerer?", "Nobody Ascension", "Yes", "No")
					if(choice=="Berserker")
						src.StrMult(1.3)
						src.EndMult(1.2)
						src.ResMult(1.2)
						src.OffMult(1.2)
					if(choice=="Assassin")
						src.StrMult(1.2)
						src.SpdMult(1.2)
						src.OffMult(1.3)
					if(choice=="Sorcerer")
						src.ForMult(1.5)
						src.EndMult(1.2)
						src.ResMult(1.2)
						src.EnergyMult(1.33)
						src.RecovMult(1.25)
					src.Ascend(3.5)
					src << "You are now a [choice]-class Nobody."
				if(num==2)
					var/list/choices=list("Dragon", "Lunatic", "Renegade")
					var/choice
					var/confirm="No"
					while(confirm=="No")
						choice=input(src,"You've nearly mastered your non-existence as a Nobody.  What kind of Nobody have you become?", "Nobody Ascension") in choices
						if(choice=="Dragon")
							confirm=alert(src,"Dragons are those Nobodies which have embraced their new existence.  Whether good or evil, they have no regrets about their lack of emotions.  Do you want to become a Dragon?", "Nobody Ascension", "Yes", "No")
						if(choice=="Lunatic")
							confirm=alert(src,"Lunatics are Nobodies which have abandoned any sense of self in pursuit of their ideals -- whether these are new ideals that they formed as a Nobody or residual ideals from their past life is up to the player.  Do you want to become a Lunatic?", "Nobody Ascension", "Yes", "No")
						if(choice=="Renegade")
							confirm=alert(src,"Renegades are Nobodies which have rejected their lack of heart and constantly pursue a new one.  Either through rememberance of times long since passed or through creating a new one, they are dissatisfied with their lack of emotions and seek to break free.  Do you want to become a Renegade?", "Nobody Ascension", "Yes", "No")
					if(choice=="Dragon")
						src.Ascend(7)
						src.Class="Dragon"
						src.SetVars()
					if(choice=="Lunatic")
						src.contents+=new/obj/Skills/Buffs/LunarWrath
						src << "You learn to draw on the fury of the moon.  Just as the moon waxes and wanes, this powerful technique is unreliable..."
					if(choice=="Renegade")
						src.Ascend(5)
						src.StrMult(1.2)
						src.EndMult(1.2)
						src.SpdMult(1.2)
						src.ForMult(1.2)
						src.ResMult(1.2)
						src.OffMult(1.2)
						src.DefMult(1.2)
						src.Class="Renegade"
						src.SetVars()
					src << "You are now a [choice]-class Nobody."
			if(num==3&&src.WONApproved)
				src.Ascend(src.BaseMod*3)
				src.contents+=new/obj/Skills/NuWorldOfNothingness
				src << "You develop the means of consuming a planet with the void to bolster your own strength..."
			if(num==3&&src.CompleteFormApproved)
				src.Ascend(src.BaseMod*1.5)
				src.RecovMult(1.25)
				src.NewAnger(1.5)
			if(race=="1/16th Saiyan")
				if(num==1)
					src.Ascend(1.25)
					src.StrMult(1.3)
					src.EndMult(1.3)
					src.SpdMult(1.25)
					src.ForMult(1.3)
					src.ResMult(1.3)
					src.OffMult(1.25)
					src.DefMult(1.25)
					src.NewAnger(2.25)
			if(race=="Half Saiyan")
				if(num==1)
					if(src.Class=="Trunks")
						src.EnergyMult(1.5)
						src.StrMult(1.5)
						src.EndMult(1.3)
						src.SpdMult(1.25)
						src.ForMult(1.3)
						src.ResMult(1.3)
						src.OffMult(1.5)
						src.DefMult(1.5)
						src.NewAnger(1.75)
					if(src.Class=="Goten")
						src.EnergyMult(1.5)
						src.StrMult(1.3)
						src.EndMult(1.5)
						src.SpdMult(1.25)
						src.ForMult(1.5)
						src.ResMult(1.3)
						src.OffMult(1.3)
						src.DefMult(1.5)
						src.NewAnger(2)
					if(src.Class=="Gohan")
						src.EnergyMult(1.5)
						src.StrMult(1.5)
						src.EndMult(1.5)
						src.SpdMult(1.3)
						src.ForMult(1.2)
						src.ResMult(1.2)
						src.OffMult(1.5)
						src.DefMult(1.5)
						src.NewAnger(3)
				if(num==2)
					if(src.Class=="Trunks")
						src.Ascend(3)
						src.StrMult(1.25)
						src.EndMult(1.25)
						src.SpdMult(1.2)
						src.ForMult(1.25)
						src.ResMult(1.25)
						src.OffMult(1.25)
						src.DefMult(1.25)
						src.RecovMult(1.6)
						src.NewAnger(2)
					if(src.Class=="Goten")
						src.Ascend(2.5)
						src.StrMult(1.25)
						src.EndMult(1.25)
						src.SpdMult(1.2)
						src.ForMult(1.25)
						src.ResMult(1.25)
						src.OffMult(1.25)
						src.DefMult(1.25)
						src.RecovMult(1.5)
						src.NewAnger(2.5)
					if(src.Class=="Gohan")
						src.Ascend(2)
						src.StrMult(1.25)
						src.EndMult(1.25)
						src.SpdMult(1.2)
						src.ForMult(1.25)
						src.ResMult(1.25)
						src.OffMult(1.25)
						src.DefMult(1.25)
						src.RecovMult(1.5)
						src.NewAnger(3.5)
			if(race=="Spirit Doll")
				if(num==1)
					src.Ascend(1.35)
					src.EnergyMult(1.25)
					src.StrMult(1.2)
					src.EndMult(1.2)
					src.ForMult(1.2)
					src.ResMult(1.2)
					src.OffMult(1.2)
					src.DefMult(1.2)
					src.RecovMult(1.25)
					src.Training_Rate*=1.5
					src.Meditation_Rate*=1.5
				if(num==2)
					src.Ascend(1.5)
					src.EnergyMult(1.25)
					src.StrMult(1.3)
					src.EndMult(1.3)
					src.SpdMult(1.25)
					src.ForMult(1.3)
					src.ResMult(1.3)
					src.OffMult(1.3)
					src.DefMult(1.3)
					src.RecovMult(1.35)
			if(race=="Half Demon")
				if(num==1)
					src.contents+=new/obj/Skills/Buffs/DemonicWill
					src<<"You learn to interpret the whispers of Hell..."
				if(num==2)
					src.Ascend(3)
					src.AllMult(1.4)
					src.RecovMult(1.25)
			if(race=="Tsufurujin")
				if(num==1)
					src.Ascend(2)
					src.NewAnger(2)
					src.RegenMult(1.5)
				if(num==2)
					src.Ascend(3)
					src.AllMult(1.25)
					src.RecovMult(1.5)
				if(num==3)
					src.Ascend(7.5)
					src.Training_Rate=5
					src.Meditation_Rate=5
				if(num==4)
					src.Ascend(15)
					src.EnergyMult(3)
			if(race=="Heran")
				if(src.Class=="Fighter")
					if(num==1)
						src.Ascend(5)
					if(num==2)
						src.Ascend(15)
				if(src.Class=="Captain")
					if(num==1)
						src.Ascend(15)
			if(race=="Aethirian")
				if(num==1)
					src.Ascend(2)
					src.AllMult(1.15)
					src.RegenMult(1.5)
					src.RecovMult(1.5)
				if(num==2)
					src.Ascend(4.5)
					src.EnergyMult(1.5)
				if(num==3)
					src.Ascend(7.5)
					src.AllMult(1.3)
				if(num==4)
					src.Ascend(20)
			if(race=="Youkai")
				if(src.Class=="Kitsune")
					if(num==1)
						src.Ascend(3)
						src.EnergyMult(1.5)
						src.RecovMult(1.5)
						var/obj/Items/Wearables/tails = new/obj/Items/Wearables(src);
						tails.icon = 'Fox Tail3.dmi';
						tails.name = "3-Tails Fox";
					if(num==2)
						src.Ascend(6)
						src.AllMult(1.25)
						src.RegenMult(1.25)
						var/obj/Items/Wearables/tails = new/obj/Items/Wearables(src);
						tails.icon = 'Fox Tail6.dmi';
						tails.name = "6-Tails Fox";
					if(num==3)
						src.Ascend(9)
						var/obj/Items/Wearables/tails = new/obj/Items/Wearables(src);
						tails.icon = 'Fox Tail9.dmi';
						tails.name = "Kyuubi Tails";
				if(src.Class=="Tanuki")
					if(num==1)
						src.Ascend(5)
					if(num==2)
						src.Ascend(15)
				if(src.Class=="Hell Raven")
					if(num==1)
						src.Ascend(2.5)
						src.EnergyMult(1.2)
						src.RecovMult(2)
					if(num==2)
						src.Ascend(3)
						src.EnergyMult(1.25)
						src.RecovMult(1.5)
					if(num==3)
						src.Ascend(5)
						src.EnergyMult(1.33)
						src.RecovMult(1.5)
			if(race=="Android")
				src << "Your nano machines have advanced."
				if(num==1)
					src.Ascend(5)
				if(num==2)
					src.Ascend(7.5)
				if(num==3)
					src.Ascend(15)
			if(race=="Neko")
				src.NewAnger(src.AngerMax+0.25)
				src.Ascend(src.BaseMod+0.25)
				if(num==1)
					src.EnergyMult(1.5)
					src.SpdMult(1.05)
					src.DefMult(1.25)
				if(num==2)
					src.EnergyMult(1.33)
					src.EndMult(1.25)
					src.ResMult(1.25)
				if(num==3)
					src.EnergyMult(1.25)
					src.StrMult(1.25)
					src.ForMult(2)
				if(num==4)
					src.EnergyMult(1.2)
					src.SpdMult(1.05)
					src.OffMult(1.25)
				if(num==5)
					src.EnergyMult(1.33)
					src.StrMult(1.25)
					src.ForMult(1.25)
					src.OffMult(1.25)
				if(num==6)
					src.EnergyMult(1.25)
					src.EndMult(1.5)
					src.ResMult(1.5)
					src.DefMult(1.5)
		TierSUp()
			if(src.KeybladeLevel)
				src.KeybladeAscensions()
				src.GetKeybladeEXP()
			if(locate(/obj/Skills/Buffs/SpiralEnergy,src)||locate(/obj/Skills/Buffs/SpiralNemesis,src))
				src.GetSpiralEXP()
			if(locate(/obj/Skills/MartialArts/Eight_Gates,src))
				src.GetEightGatesEXP()
			if(locate(/obj/Skills/TierS/WeaponSoul,src))
				src.WeaponSoulAscensions()
				src.GetWeaponSoulEXP()
			/*if(jaganeye)
				src.GetJaganEyeEXP()*/
			if(src.HitenMitsurugi)
				src.GetHitenMitsurugiEXP()
			if(locate(/obj/Skills/Buffs/Sharingan, src))
				src.GetSharinganEXP()
			if(src.AnsatsukenMod)
				src.GetAnsatsukenEXP()
			if(src.SpiritLevel)
				src.GetSpiritEnergyEXP()
			if(src.HeroLevel)
				src.GetHOAEXP()
			if(src.SexyMod)
				src.GetKamuiEXP()
			if(src.RippleMod)
				src.GetRippleEXP()
			if(src.UBWLevel)
				src.GetUBWEXP()
			if(src.BerserkerMod)
				src.GetBerserkEXP()
			if(src.VisoredStage)
				src.GetVaizardEXP()
			if(src.MadScientist)
				src.GetMadScientistEXP()
		DoDamage(var/mob/m, var/val)
			if(src.HasTierS())
				if(src.Lethal)
					src.LethalDone+=val
					m.LethalTaken+=val
				src.DamageDone+=val
				m.DamageTaken+=val
			m.Health-=val
			if(m.Health<=0)
				m.Unconscious(src)
			if(src.WoundIntent)
				src.DoWounds(m, val/10)
		DoWounds(var/mob/m, var/val)
			if(src.HasTierS())
				src.WoundsDone+=val
			if(m.HasTierS())
				m.WoundsTaken+=val
			m.TotalInjury+=val
			m.MaxHealth()
		LoseEnergy(var/val)
			if(src.HasTierS())
				src.EnergyUsed+=val
			src.Energy-=val
			if(src.Energy < 0)
				src.Energy=0
			src.LoseFatigue(val/10)
		LoseFatigue(var/val)
			src.TotalFatigue+=val
			if(src.HasTierS())
				src.FatigueUsed+=val
			src.MaxEnergy()
		GetEnergyPercent()
			return (src.Energy/src.EnergyMax)*100
		GetEnergyPercentVal(var/val)
			return (val*src.EnergyMax)/100
		HealHealth(var/val)
			if(src.HasTierS())
				src.DamageHealed+=val
			src.Health+=val
			src.MaxHealth()
		HealEnergy(var/val)
			if(src.HasTierS())
				src.EnergyHealed+=val
			src.Energy+=val
			src.MaxEnergy()
		HealWounds(var/val)
			if(src.HasTierS())
				src.WoundsHealed+=val
			src.TotalInjury-=val
			if(src.TotalInjury < 0)
				src.TotalInjury=0
			src.MaxHealth()
		HealFatigue(var/val)
			if(src.HasTierS())
				src.FatigueHealed+=val
			src.TotalFatigue-=val
			if(src.TotalFatigue < 0)
				src.TotalFatigue=0
			src.MaxEnergy()
		MaxHealth()
			if(src.Health > 100 - src.TotalInjury)
				src.Health=100-src.TotalInjury
		MaxEnergy()
			if(src.GetEnergyPercent() > (100 - src.TotalFatigue))
				src.Energy=GetEnergyPercentVal(100-src.TotalFatigue)
		//todo: make specific procs for the various tier s
		StrVsEnd(var/mob/defender, var/mult=1)
			var/damage = (src.Power*src.GetStr())/(defender.Power*defender.GetEnd())
			damage=BlockDamage(defender, damage)
			damage*=mult
			src.DoDamage(defender, damage)
		StrVsRes(var/mob/defender, var/mult=1)
			var/damage = (src.Power*src.GetStr())/(defender.Power*defender.GetRes())
			damage=BlockDamage(defender, damage)
			damage*=mult
			src.DoDamage(defender, damage)
		ForVsEnd(var/mob/defender, var/mult=1)
			var/damage = (src.Power*src.GetFor())/(defender.Power*defender.GetEnd())
			damage=BlockDamage(defender, damage)
			damage*=mult
			src.DoDamage(defender, damage)
		ForVsRes(var/mob/defender, var/mult=1)
			var/damage = (src.Power*src.GetFor())/(defender.Power*defender.GetRes())
			damage=BlockDamage(defender, damage)
			damage*=mult
			src.DoDamage(defender, damage)
		ResVsFor(var/mob/defender, var/mult=1)
			var/damage = (src.Power*src.GetRes())/(defender.Power*defender.GetFor())
			damage=BlockDamage(defender, damage)
			damage*=mult
			src.DoDamage(defender, damage)
		GetStr(var/mult=1)
			return src.Strength*src.StrengthMultiplier*mult
		GetEnd(var/mult=1)
			return src.Endurance*src.EnduranceMultiplier*mult
		GetSpd(var/mult=1)
			return src.SpeedMod*src.SpeedMultiplier*mult
		GetFor(var/mult=1)
			return src.Force*src.ForceMultiplier*mult
		GetRes(var/mult=1)
			return src.Resistance*src.ResistanceMultiplier*mult
		GetOff(var/mult=1)
			return src.Offense*src.OffenseMultiplier*mult
		GetDef(var/mult=1)
			return src.Defense*src.DefenseMultiplier*mult
		GetRegen(var/mult=1)
			return src.Regeneration*src.RegenerationMultiplier*mult
		GetRecov(var/mult=1)
			return src.Recovery*src.RecoveryMultiplier*mult
		Ascend(var/num)
			src.Base/=src.BaseMod
			src.BaseMod=num
			src.Base*=src.BaseMod
		NewAnger(var/num)
			if(src.AngerMax < num)
				src.AngerMax = num
		AllMult(var/num)
			src.StrMult(num)
			src.EndMult(num)
			src.EXSpdMult(num)
			src.ForMult(num)
			src.ResMult(num)
			src.OffMult(num)
			src.DefMult(num)
		StrMult(var/num)
			src.Strength*=num
			src.StrengthMod*=num
		EndMult(var/num)
			src.Endurance*=num
			src.EnduranceMod*=num
		SpdMult(var/num)
			src.SpeedMod*=num
		EXSpdMult(var/num)
			var/good = num-1
			good/=2
			good+=1
			src.SpeedMod*=good
		ForMult(var/num)
			src.Force*=num
			src.ForceMod*=num
		ResMult(var/num)
			src.Resistance*=num
			src.ResistanceMod*=num
		OffMult(var/num)
			src.Offense*=num
			src.OffenseMod*=num
		DefMult(var/num)
			src.Defense*=num
			src.DefenseMod*=num
		RegenMult(var/num)
			src.Regeneration*=num
		RecovMult(var/num)
			src.Recovery*=num
		EnergyMult(var/num)
			src.EnergyMod*=num
			src.EnergyMax*=num
			src.Energy*=num
		GetBPM()
			return (src.Base/src.BaseMod)
		BPMult(var/num)
			src.BaseMod*=num
			src.Base*=num
		BPDiv(var/num)
			src.BaseMod/=num
			src.Base/=num
		GetSSjMastery(var/num)
			return src.ssj["[num]mastery"]
		GetSSjUnlocked()
			return src.ssj["unlocked"]
		GetTransMastery(var/num)
			return src.trans["[num]mastery"]
		GetTransUnlocked()
			return src.trans["unlocked"]
		GetAscensionValue(var/asc)
			if(asc=="Olympian Ascension")
				return global.DemiReq1
			if(asc=="Olympian Ascension Unlocked")
				return global.DemiUnlockedReq1
			if(asc=="Titan Ascension")
				return global.DemiReq2
			if(asc=="Titan AscensionUnlocked")
				return global.DemiUnlockedReq2
			if(asc=="Namekian Ascension 1")
				return global.NamekianReq1
			if(asc=="Namekian Ascension 1 Unlocked")
				return global.NamekianUnlockedReq1
			if(asc=="Namekian Ascension 2")
				return global.NamekianReq2
			if(asc=="Namekian Ascension 2 Unlocked")
				return global.NamekianUnlockedReq2
			if(asc=="Human Third Eye")
				return global.HumanReq1
			if(asc=="Human Third Eye Unlocked")
				return global.HumanUnlockedReq1
			if(asc=="Red Ascension")
				return global.HumanReq2
			if(asc=="Red Ascension Unlocked")
				return global.HumanUnlockedReq2
			if(asc=="Blue Ascension")
				return global.HumanReq3
			if(asc=="Blue Ascension Unlocked")
				return global.HumanUnlockedReq3
			if(asc=="Spirit Doll Ascension 1")
				return global.SpiritDollReq1
			if(asc=="Spirit Doll Ascension 1 Unlocked")
				return global.SpiritDollUnlockedReq1
			if(asc=="Spirit Doll Ascension 2")
				return global.SpiritDollReq2
			if(asc=="Spirit Doll Ascension 2 Unlocked")
				return global.SpiritDollUnlockedReq2
			if(asc=="Half Demon Demonic Will")
				return global.HalfDemonReq1
			if(asc=="Half Demon Demonic Will Unlocked")
				return global.HalfDemonUnlockedReq1
			if(asc=="Half Demon Third Eye")
				return global.HalfDemonReq2
			if(asc=="Half Demon Third Eye Unlocked")
				return global.HalfDemonUnlockedReq2
			if(asc=="Tuffle Ascension 1")
				return global.TuffleReq1
			if(asc=="Tuffle Ascension 1 Unlocked")
				return global.TuffleUnlockedReq1
			if(asc=="Tuffle Ascension 2")
				return global.TuffleReq2
			if(asc=="Tuffle Ascension 2 Unlocked")
				return global.TuffleUnlockedReq2
			if(asc=="Heran Ascension 1")
				return global.HeranReq1
			if(asc=="Heran Ascension 1 Unlocked")
				return global.HeranUnlockedReq1
			if(asc=="Aethirian Ascension 1")
				return global.AethirianReq1
			if(asc=="Aethirian Ascension 1 Unlocked")
				return global.AethirianUnlockedReq1
			if(asc=="Aethirian Ascension 2")
				return global.AethirianReq2
			if(asc=="Aethirian Ascension 2 Unlocked")
				return global.AethirianUnlockedReq2
			if(asc=="Tanuki Ascension 1")
				return global.TanukiReq1
			if(asc=="Tanuki Ascension 1 Unlocked")
				return global.TanukiUnlockedReq1
			if(asc=="Three Tails Ascension")
				return global.KitsuneReq1
			if(asc=="Three Tails Ascension Unlocked")
				return global.KitsuneUnlockedReq1
			if(asc=="Neko Ascension 1")
				return global.NekoReq1
			if(asc=="Neko Ascension 1 Unlocked")
				return global.NekoUnlockedReq1
			if(asc=="Neko Ascension 2")
				return global.NekoReq2
			if(asc=="Neko Ascension 2 Unlocked")
				return global.NekoUnlockedReq2
			if(asc=="Neko Ascension 3")
				return global.NekoReq3
			if(asc=="Neko Ascension 3 Unlocked")
				return global.NekoUnlockedReq3
			if(asc=="Neko Ascension 4")
				return global.NekoReq4
			if(asc=="Neko Ascension 4 Unlocked")
				return global.NekoUnlockedReq4
		HasKeyblade(var/element, var/level)
			if((src.KeybladeElement==element&&src.KeybladeLevel>=level)||(src.SecondKeybladeElement==element&&src.SecondKeybladeLevel>=level))
				return 1
			return 0
		NoDarkMode()
			if((src.KeybladeElement=="Darkness"&&src.KeybladeLevel>=4)||(src.SecondKeybladeElement=="Darkness"&&src.SecondKeybladeLevel >=4))
				return 0
			if(src.DarkMode)
				return 0
			return 1
		UnmasteredDarkKeyblade()
			if((src.KeybladeElement=="Darkness"&&src.KeybladeLevel<=3)||(src.SecondKeybladeElement=="Darkness"&&src.SecondKeybladeLevel<=3))
				return 1
			return 0
		GetDarkKeybladeLevel()
			if(src.KeybladeElement=="Darkness")
				return src.KeybladeLevel
			if(src.SecondKeybladeElement=="Darkness")
				return src.SecondKeybladeLevel
		GetLightKeybladeLevel()
			if(src.KeybladeElement=="Light")
				return src.KeybladeLevel
			if(src.SecondKeybladeElement=="Light")
				return src.SecondKeybladeLevel
		GetNothingnessKeybladeLevel()
			if(src.KeybladeElement=="Nothingness")
				return src.KeybladeLevel
			if(src.SecondKeybladeElement=="Nothingness")
				return src.SecondKeybladeLevel
		LoseDriveForms()
			if(src.KeybladeElement!="Nothingness")
				if(!src.SecondKeyblade&&!src.SecondKeybladeElement&&!src.SecondKeybladeLevel)
					for(var/obj/Skills/TierS/DriveForm/df, src)
						src << "You lose the capability to use Drive Forms without a second keyblade."
						del df
		GainDriveForms()
			if(src.KeybladeElement=="Nothingness"||src.SecondKeybladeElement=="Nothingness"||(src.SecondKeyblade&&src.SecondKeybladeElement&&src.SecondKeybladeLevel))
				if(!locate(/obj/Skills/TierS/DriveForm,src))
					src.contents+=new/obj/Skills/TierS/DriveForm
					src << "You gain the capability to use Drive Forms due to having two keyblades."
		EquippedSword()
			var/obj/Items/Sword/sord
			for(var/obj/Items/Sword/s in src)
				if(s.suffix)
					sord=s
					break
			if(sord)
				return sord
			else
				return 0
		SwordOverlays(var/obj/Items/Sword/s, var/type)
			if(type=="Remove")
				src.overlays-=image(icon=s.icon,icon_state=s.icon_state,pixel_x=s.pixel_x,pixel_y=s.pixel_y)
			if(type=="Add")
				src.overlays+=image(icon=s.icon,icon_state=s.icon_state,pixel_x=s.pixel_x,pixel_y=s.pixel_y)
		MakeSword(var/obj/Items/Sword/s, var/damage, var/acc, var/delay, var/icon/i=null, var/icons=null)
			s.Damage_Multiplier=damage
			s.Accuracy_Multiplier=acc
			s.Delay_Multiplier=delay
			s.Points=0
			s.PointsAssigned=1
			s.EnchantType=null
			s.Enchanted=1
			src.SwordOverlays(s, "Remove")
			if(i)
				s.icon=i
				s.icon_state=icons
				s.pixel_x=0
				s.pixel_y=0
			src.SwordOverlays(s, "Add")
		MakeDualWield(var/obj/Items/Sword/s)
			src.MakeSword(s, 1, 0.8, 2, icon('SwordDualKatana.dmi'), "")
		MakeKusanagi(var/obj/Items/Sword/s)
			src.MakeSword(s, 1.5, 1, 4)//get an icon
			s.name="Kusanagi"
		MakeDurendal(var/obj/Items/Sword/s)
			src.MakeSword(s, 4, 1.5, 0.25)//get an icon
			s.name="Durendal"
		MakeMasamune(var/obj/Items/Sword/s)
			src.MakeSword(s, 0.75, 2, 2)//get an icon
			s.name="Masamune"
		MakeTripleWield(var/obj/Items/Sword/s)
			src.MakeSword(s, 1.5, 1, 3)//get an icon
		MakeSoulCalibur(var/obj/Items/Sword/s)
			src.MakeSword(s, 2, 1, 2)//get an icon
			s.name="Soul Calibur"
		MakeSoulEdge(var/obj/Items/Sword/s)
			src.MakeSword(s, 3, 0.75, 1)//get an icon
			s.name="Soul Edge"
		MakeMuramasa(var/obj/Items/Sword/s)
			src.MakeSword(s, 2.5, 1, 2)//get an icon
			s.name="Muramasa"
		IsEvil()
			var/list/races=list("Changeling", "Majin", "Dragon", "Vampire", "Lycan", "Demon", "Half Demon", "Makaioshin", "Popo", "God of Destruction")
			if(src.Race in races)
				return 1
			if(src.NecroLevel)
				return 1
			if(src.HasEvilSword())
				return 1
			if(src.Majin)
				return 1
			if(locate(/obj/Regenerate,src))
				return 1
			if(locate(/obj/Skills/Rank/Necromancy,src))
				return 1
			if(locate(/obj/Skills/VampireFrenzy,src))
				return 1
			if(locate(/obj/Lycan,src))
				return 1
			return 0
		HasEvilSword()
			if(src.WeaponSoul=="Corrupt"||src.WeaponSoul=="Calibur"||src.WeaponSoul=="Edge"||src.WeaponSoul=="Muramasa")
				return 1
			if(src.HasKeyblade("Darkness", 1))
				return 1
			return 0
		SoulCaliburChecks(var/dmg)
			if(src.SoulCalibur==1)
				if(prob(10))
					src.HealHealth(dmg)
					dmg=0
				if(dmg)
					if(prob(33))
						dmg*=0.5
					else
						dmg*=0.85
				return dmg
			if(src.SoulCalibur==2)
				if(prob(20))
					src.HealHealth(dmg)
					dmg=0
				if(dmg)
					if(prob(50))
						dmg*=0.5
					else
						dmg*=0.75
				return dmg
		LunarWrathFail()
			for(var/obj/Skills/Buffs/LunarWrath/lw in src)
				if(lw.BuffUsing)
					src.BuffX("MoonBerserker", lw)
			src << "Your Lunar Wrath has failed!"
			src.LunarWrathCD=1
			spawn(3000)
				src.LunarWrathCD=0
		StartWoN()
			src << "Don't log out while using this."
			src.WoNing=1
			src.MakeWoNObject()
		MakeWoNObject()
			var/health=src.Power*(src.GetStr()*src.GetFor()/2)*200
			var/obj/WorldOfNothingness/won = new/obj/WorldOfNothingness(locate(src.x, src.y, src.z))
			won.Health=health
			won.Owner=src
			won.Timer=10*(60*10)//10 minutes
			spawn()won.Life()
obj
	WorldOfNothingness
		var/Timer
		var/RPModed
		icon='BlackHole.dmi'
		Grabbable=0
		proc
			Life()
				if(!RPModed)
					src.Timer--
					if(src.Timer <= 0)
						src.EndOfTheWorld()
				sleep(1)
				src.Life()
			EndOfTheWorld()
				for(var/mob/m in world)
					if(m.z==src.z)
						m << "[src.Owner] has devoured the world..."
						m.loc=locate(250, 250, 12)
				src.Owner.Ascend(src.Owner.BaseMod+20)
				src.Owner.WoNing=0

