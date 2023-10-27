/datum/category_item/player_setup_item/general/laws
	name = "Laws"
	sort_order = 6

/datum/category_item/player_setup_item/general/laws/load_character(var/savefile/S)
	S["synth_laws_zero"]	>> pref.synth_laws["Zeroth Law"]
	S["synth_laws_one"]		>> pref.synth_laws["First Law"]
	S["synth_laws_two"]		>> pref.synth_laws["Second Law"]
	S["synth_laws_three"]		>> pref.synth_laws["Third Law"]
	S["synth_laws_four"]		>> pref.synth_laws["Fourth Law"]
	S["synth_laws_five"]		>> pref.synth_laws["Fifth Law"]



/datum/category_item/player_setup_item/general/laws/save_character(var/savefile/S)
	S["synth_laws_zero"]	>> pref.synth_laws["Zeroth Law"]
	S["synth_laws_one"]		>> pref.synth_laws["First Law"]
	S["synth_laws_two"]		>> pref.synth_laws["Second Law"]
	S["synth_laws_three"]		>> pref.synth_laws["Third Law"]
	S["synth_laws_four"]		>> pref.synth_laws["Fourth Law"]
	S["synth_laws_five"]		>> pref.synth_laws["Fifth Law"]


/datum/category_item/player_setup_item/general/laws/delete_character(var/savefile/S)
	pref.synth_laws["Zeroth Law"] = null
	pref.synth_laws["First Law"] = null
	pref.synth_laws["Second Law"] = null
	pref.synth_laws["Third Law"] = null
	pref.synth_laws["Fourth Law"] = null
	pref.synth_laws["Fifth Law"] = null

/datum/category_item/player_setup_item/general/laws/sanitize_character()
	return

// Moved from /datum/preferences/proc/copy_to()
/*
/datum/category_item/player_setup_item/general/laws/copy_to_mob(var/mob/living/carbon/human/character)
	character.synth_laws["synth_laws_zero"]	= pref.synth_laws["Zeroth Law"]
	character.synth_laws["synth_laws_one"]	= pref.synth_laws["First Law"]
	character.synth_laws["synth_laws_two"]	= pref.synth_laws["Second Law"]
	character.synth_laws["synth_laws_three"]	= pref.synth_laws["Third Law"]
	character.synth_laws["synth_laws_four"]	= pref.synth_laws["Fourth Law"]
	character.synth_laws["synth_laws_five"]	= pref.synth_laws["Fifth Law"]
*/
/datum/category_item/player_setup_item/general/laws/content(var/mob/user)
	. += "<b>Laws:</b><br>"
	. += "<a href='?src=\ref[src];synth_law=open'>Set Synthetic Laws</a><br/>"

/datum/category_item/player_setup_item/general/laws/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["synth_law"])
		switch(href_list["synth_law"])
			if("open")
			if("Zeroth Law")
				var/msg = sanitize(input(usr,"Give your character a zeroth law, keep in mind law zero is considered illegal or a malfunction.","Synth Law",html_decode(pref.synth_laws[href_list["synth_law"]])) as message, extra = 0)
				if(CanUseTopic(user))
					pref.synth_laws[href_list["synth_law"]] = msg
			else
				var/msg = sanitize(input(usr,"Set the law text for your [href_list["synth_law"]].","Synthetic Law",html_decode(pref.synth_laws[href_list["synth_law"]])) as message, extra = 0)
				if(CanUseTopic(user))
					pref.synth_laws[href_list["synth_law"]] = msg
		SetSynthLaw(user)
		return TOPIC_HANDLED


/datum/category_item/player_setup_item/general/laws/proc/SetSynthLaw(mob/user)
	var/HTML = "<body>"
	HTML += "<tt><center>"
	HTML += "<b>Set Laws</b> <hr />"
	HTML += "<br></center>"
	HTML += "<a href='?src=\ref[src];synth_law=Zeroth Law'>$!£%*$:</a> "
	HTML += TextPreview(pref.synth_laws["Zeroth Law"])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];synth_law=First Law'>First Law:</a> "
	HTML += TextPreview(pref.synth_laws["First Law"])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];synth_law=Second  Law'>Second Law:</a> "
	HTML += TextPreview(pref.synth_laws["Second Law"])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];synth_law=Third Law'>Third Law:</a> "
	HTML += TextPreview(pref.synth_laws["Third Law"])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];synth_law=Fourth Law'>Fourth Law:</a> "
	HTML += TextPreview(pref.synth_laws["Fourth Law"])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];synth_law=Fifth Law'>Fifth Law:</a> "
	HTML += TextPreview(pref.synth_laws["Fifth Law"])
	HTML += "<br>"
	HTML += "<hr />"
	HTML += "<tt>"
	user << browse(HTML, "window=synth_law;size=430x300")
	return

