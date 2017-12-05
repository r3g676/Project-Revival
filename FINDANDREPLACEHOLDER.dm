			if("DriveForm")
				if(!Z.BuffUsing)
					if(src.Energy<src.EnergyMax/10)return
					if(Z:SpamLockout==1)
						usr<<"Stop spamming Drive!"
						return
					Z:SpamLockout=1
					var/list/ChosenKeybladeLevel=list("Valor")
					if(src.KeybladeLevel>=1)
						ChosenKeybladeLevel.Add("Wisdom")
					if(src.KeybladeLevel>=2)
						ChosenKeybladeLevel.Add("Master")
					if(src.KeybladeLevel>=4)
						ChosenKeybladeLevel.Add("Final")
					ChosenKeybladeLevel.Add("Cancel")
					Z:KeybladeLevelSelected=input("Pick a Drive level!") in ChosenKeybladeLevel
					if(Z:KeybladeLevelSelected=="Cancel")
						Z:SpamLockout=0
						return
					if(prob(AntiFormCounter))
						Z:KeybladeLevelSelected="Anti"
					if(Z:KeybladeLevelSelected=="Valor")
						src.Power_Multiplier+=0.5
						src.OffenseMultiplier*=1.35
						src.StrengthMultiplier*=1.35
						src.DriveType="Valor"
						src.DriveCounter=180
						src.AntiFormCounter+=15
						src.OMessage(30,"[src] surrounded themselves in a red aura, increasing their physical might!","<font color=red>[src]([src.key]) activated Valor Form.")
					else if(Z:KeybladeLevelSelected=="Wisdom")
						src.Power_Multiplier+=0.5
						src.SpeedMultiplier*=1.15
						src.ForceMultiplier*=1.35
						src.AntiFormCounter+=15
						src.DriveType="Wisdom"
						src.OMessage(30,"[src] surrounded themselves in a blue aura, increasing their spiritual might!","<font color=red>[src]([src.key]) activated Wisdom Form.")
					else if(Z:KeybladeLevelSelected=="Master")
						src.Power_Multiplier+=0.75
						src.SpeedMultiplier*=1.35
						src.StrengthMultiplier*=1.25
						src.ForceMultiplier*=1.25
						src.AntiFormCounter+=15
						src.DriveType="Master"
						src.DriveCounter=105
						src.OMessage(30,"[src] surrounded themselves in a yellow aura, surpassing their limitations!","<font color=red>[src]([src.key]) activated Master Form.")
					else if(Z:KeybladeLevelSelected=="Final")
						src.Power_Multiplier+=1
						src.SpeedMultiplier*=1.35
						src.StrengthMultiplier*=1.5
						src.ForceMultiplier*=1.5
						src.DriveType="Final"
						src.AntiFormCounter=0
						src.DriveCounter=60
						src.OMessage(30,"[src] surrounded themselves in a silver aura, commanding the full power of light and darkness!","<font color=red>[src]([src.key]) activated Final Form.")
					else if(Z:KeybladeLevelSelected=="Anti")
						src.Power_Multiplier+=0.5
						src.SpeedMultiplier*=2
						src.OffenseMultiplier*=1.5
						src.StrengthMultiplier*=0.5
						src.EnduranceMultiplier*=0.75
						src.DriveType="Anti"
						src.AntiFormCounter=0
						src.DriveCounter=60
						src<<"Once you attack, you'll ruthlessly pursue your opponent with no end."
						src.OMessage(30,"[src] loses control of their power, bringing forth their innermost darkness!","<font color=red>[src]([src.key]) activated Anti-Form.")

					src.DriveActive=1
					src.overlays-=Z.sicon
					src.overlays-=Z.sicon
					src.overlays+=Z.sicon
					Z:SpamLockout=0
				else
					if(src.DriveType=="Anti" && src.DriveCounter>=11)
						src<<"You cannot revert from Anti-Form yet."
						return
					src.DriveActive=0
					if(Z:KeybladeLevelSelected=="Valor")
						src.Power_Multiplier-=0.5
						src.OffenseMultiplier/=1.35
						src.StrengthMultiplier/=1.35
						src.DriveType="None"
					else if(Z:KeybladeLevelSelected=="Wisdom")
						src.Power_Multiplier-=0.5
						src.SpeedMultiplier/=1.15
						src.ForceMultiplier/=1.35
						src.DriveType="None"
					else if(Z:KeybladeLevelSelected=="Master")
						src.Power_Multiplier-=0.75
						src.SpeedMultiplier/=1.35
						src.StrengthMultiplier/=1.25
						src.ForceMultiplier/=1.25
						src.DriveType="None"
						src.DriveCounter=0
					else if(Z:KeybladeLevelSelected=="Final")
						src.Power_Multiplier-=1
						src.SpeedMultiplier/=1.35
						src.StrengthMultiplier/=1.5
						src.ForceMultiplier/=1.5
						src.DriveType="None"
						src.AntiFormCounter=0
						src.DriveCounter=0
					else if(Z:KeybladeLevelSelected=="Anti")
						src.Power_Multiplier-=0.5
						src.SpeedMultiplier/=2
						src.OffenseMultiplier/=1.5
						src.StrengthMultiplier/=0.5
						src.EnduranceMultiplier/=0.75
						src.DriveType="None"
						src.AntiFormCounter=0
						src.DriveCounter=0
						src<<"Once you attack, you'll ruthlessly pursue your opponent with no end."