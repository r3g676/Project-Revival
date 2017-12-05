mob
	var
		ThunderHands=0
obj/Skills/Feva
	ThunderHands
		Cooldown=150
		verb/ThunderHands()
			set category="Skills"
			if(src.Using||usr.Attacking)return
			src.Using=1
			usr.ThunderHands=1
			usr.OMessage(10,"[usr]'s hand is shining brightly!","<font color=red>[usr]([usr.key]) used ThunderHands.")
			sleep(100)
			usr.ThunderHands=0
			Cooldown()