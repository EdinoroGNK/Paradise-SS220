#define INIT_ORDER_MODPACKS 16.5

SUBSYSTEM_DEF(modpacks)
	name = "Modpacks"
	init_order = INIT_ORDER_MODPACKS
	flags = SS_NO_FIRE
	var/list/loaded_modpacks

/datum/controller/subsystem/modpacks/Initialize()
	var/list/all_modpacks = list()
	for(var/modpack in subtypesof(/datum/modpack/))
		all_modpacks.Add(new modpack)

	loaded_modpacks = list()
	// Pre-init and register all compiled modpacks.
	for(var/datum/modpack/package as anything in all_modpacks)
		var/fail_msg = package.pre_initialize()
		if(QDELETED(package))
			stack_trace("Modpack of type [package.type] is null or queued for deletion.")
		if(fail_msg)
			stack_trace("Modpack [package.type] failed to pre-initialize: [fail_msg].")
		if(loaded_modpacks[package.name])
			stack_trace("Attempted to register duplicate modpack name: [package.name].")
		loaded_modpacks.Add(package)

	// Handle init and post-init (two stages in case a modpack needs to implement behavior based on the presence of other packs).
	for(var/datum/modpack/package as anything in loaded_modpacks)
		var/fail_msg = package.initialize()
		if(fail_msg)
			stack_trace("Modpack [(istype(package) && package.name) || "Unknown"] failed to initialize: [fail_msg]")
	for(var/datum/modpack/package as anything in loaded_modpacks)
		var/fail_msg = package.post_initialize()
		if(fail_msg)
			stack_trace("Modpack [(istype(package) && package.name) || "Unknown"] failed to post-initialize: [fail_msg]")

	load_admins() // To make admins always have modular added verbs

/client/verb/modpacks_list()
	set name = "Modpacks List"
	set category = "OOC"

	if(!mob || !SSmodpacks.initialized)
		return

	if(length(SSmodpacks.loaded_modpacks))
		. = "<hr><br><center><b><font size = 3>Список модификаций</font></b></center><br><hr><br>"
		for(var/datum/modpack/M as anything in SSmodpacks.loaded_modpacks)
			if(M.name)
				. += "<div class = 'statusDisplay'>"
				. += "<center><b>[M.name]</b></center>"

				if(M.desc || M.author)
					. += "<br>"
					if(M.desc)
						. += "<br>Описание: [M.desc]"
					if(M.author)
						. += "<br><i>Автор: [M.author]</i>"
				. += "</div><br>"

		var/datum/browser/popup = new(mob, "modpacks_list", "Список Модификаций", 480, 580)
		popup.set_content(.)
		popup.open()
	else
		to_chat(src, "Этот сервер не использует какие-либо модификации.")
