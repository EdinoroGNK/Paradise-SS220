/datum/modpack/cyrillic_fixes
	name = "Cyrillic Fixes"
	desc = "Adds Cyrillic support"
	author = "larentoun"

/datum/modpack/cyrillic_fixes/initialize()
	. = ..()
	update_cyrillic_radio()

/datum/modpack/cyrillic_fixes/proc/update_cyrillic_radio()
	GLOB.department_radio_keys |= list(
/*
	Busy letters by languages:
	a b d f g j k o q v x y
	aa as bo db fa fm fn fs vu

	Busy symbols by languages:
	0 1 2 3 4 5 6 7 8 9
	% ? ^ '

	Busy letters by radio(eng):
	c e h i l m n p r s t u w x z

	Busy letters by radio(rus):
	б г д е ё з к р с т у ц ч ш ы ь я Э

	Busy symbols by radio:
	~ , $ _ - + *

	CAUTION! The key must not repeat the key of the languages (language.dm)
	and must not contain prohibited characters
*/
	// Russian text lowercase
		":к" = "right ear",		"#к" = "right ear",		"№к" = "right ear",		".к" = "right ear",
		":д" = "left ear",		"#д" = "left ear",		"№д" = "left ear",		".д" = "left ear",
		":ш" = "intercom",		"#ш" = "intercom",		"№ш" = "intercom",		".ш" = "intercom",
		":р" = "department",	"#р" = "department",	"№р" = "department",	".р" = "department",
		":с" = "Command",		"#с" = "Command",		"№с" = "Command",		".с" = "Command",
		":т" = "Science",		"#т" = "Science",		"№т" = "Science",		".т" = "Science",
		":ь" = "Medical",		"#ь" = "Medical",		"№ь" = "Medical",		".ь" = "Medical",
		":ч" = "Procedure",		"#ч" = "Procedure",		"№ч" = "Procedure",		".ч" = "Procedure",
		":у" = "Engineering", 	"#у" = "Engineering",	"№у" = "Engineering",	".у" = "Engineering",
		":ы" = "Security",		"#ы" = "Security",		"№ы" = "Security",		".ы" = "Security",
		":ц" = "whisper",		"#ц" = "whisper",		"№ц" = "whisper",		".ц" = "whisper",
		":е" = "Syndicate",		"#е" = "Syndicate",		"№е" = "Syndicate",		".е" = "Syndicate",
		":г" = "Supply",		"#г" = "Supply",		"№г" = "Supply",		".г" = "Supply",
		":я" = "Service",		"#я" = "Service",		"№я" = "Service",		".я" = "Service",
		":з" = "AI Private",	"#з" = "AI Private",	"№з" = "AI Private",	".з" = "AI Private",
		":ё" = "cords",			"#ё" = "cords",			"№ё" = "cords",			".ё" = "cords",
	// Russian text uppercase
		":К" = "right ear",		"#К" = "right ear",		"№К" = "right ear",		".К" = "right ear",
		":Д" = "left ear",		"#Д" = "left ear",		"№Д" = "left ear",		".Д" = "left ear",
		":Ш" = "intercom",		"#Ш" = "intercom",		"№Ш" = "intercom",		".Ш" = "intercom",
		":Р" = "department",	"#Р" = "department",	"№Р" = "department",	".Р" = "department",
		":С" = "Command",		"#С" = "Command",		"№С" = "Command",		".С" = "Command",
		":Т" = "Science",		"#Т" = "Science",		"№Т" = "Science",		".Т" = "Science",
		":Ь" = "Medical",		"#Ь" = "Medical",		"№Ь" = "Medical",		".Ь" = "Medical",
		":У" = "Engineering",	"#У" = "Engineering",	"№У" = "Engineering",	".У" = "Engineering",
		":Ы" = "Security",		"#Ы" = "Security",		"№Ы" = "Security",		".Ы" = "Security",
		":Ц" = "whisper",		"#Ц" = "whisper",		"№Ц" = "whisper",		".Ц" = "whisper",
		":Е" = "Syndicate",		"#Е" = "Syndicate",		"№Е" = "Syndicate",		".Е" = "Syndicate",
		":Г" = "Supply",		"#Г" = "Supply",		"№Г" = "Supply",		".Г" = "Supply",
		":Я" = "Service",		"#Я" = "Service",		"№Я" = "Service",		".Я" = "Service",
		":З" = "AI Private",	"#З" = "AI Private",	"№З" = "AI Private",	".З" = "AI Private",
		":Ё" = "cords",			"#Ё" = "cords",			"№Ё" = "cords",			".Ё" = "cords",

	// Russian symbols no case
		// None yet.

	// Special symbols only (that means that they don't have/use an english/russian analogue)
		":$" = "Response Team",	"#$" = "Response Team", "№$" = "Response Team",	".$" = "Response Team",
		":_" = "SyndTeam",		"#_" = "SyndTeam",		"№_" = "SyndTeam",		"._" = "SyndTeam",
		":-" = "Special Ops",	"#-" = "Special Ops",	"№-" = "Special Ops",	".-" = "Special Ops",
		":+" = "special",		"#+" = "special",		"№+" = "special",		".+" = "special" //activate radio-specific special functions
)
