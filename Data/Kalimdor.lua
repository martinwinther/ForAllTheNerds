local addonName, ns = ...

-- ===========================================================================
-- Data/Kalimdor.lua
-- Lore cutoff: patch 1.12 and earlier, plus Warcraft III and pre-WoW history.
-- ===========================================================================

local Zone, SubsOf = ns.Zone, ns.SubsOf
local KA = "Kalimdor"

-- ---------------------------------------------------------------------------
-- DUROTAR
-- ---------------------------------------------------------------------------

Zone{
	name = "Durotar", continent = KA, faction = "Horde", levels = "1-10",
	hook = "Hard red earth the orcs chose on purpose, named for the chieftain who refused the demon's cup.",
	lore = {
		"Durotar is new. After the Third War the orcs had no homeland: Draenor was gone, the internment camps were behind them, and the Eastern Kingdoms would never be theirs. Thrall took his people across the sea to Kalimdor and claimed this stretch of arid coast, and Orgrimmar was raised in the canyon above it.",
		"The land is named for Durotan, chieftain of the Frostwolf clan and Thrall's father. Durotan was the orc who refused to drink Mannoroth's blood when Gul'dan offered it to the clans. The refusal got the Frostwolves exiled to Alterac Valley, and eventually got Durotan and his mate Draka murdered. Thrall was the infant they left behind.",
		"Choosing a desert was a deliberate statement. The orcs had been given fertile land before, as a gift and a leash, and Thrall's Horde intends to owe nobody. What they are building here is a nation, with shamanism restored, warlocks outlawed, and the trolls of the Darkspear and the tauren of Mulgore as full partners rather than vassals.",
	},
	didYouKnow = "Thrall's name is not an orcish name. It is what Aedelas Blackmoore called him in the gladiator pits of Durnholde. He kept it.",
	readMore = { "Wowpedia: Durotar", "Wowpedia: Durotan", "Wowpedia: Thrall" },
}

SubsOf("Durotar", {
	{
		name = "Valley of Trials", faction = "Horde", levels = "1-5",
		hook = "The canyon where every new orc and troll of the Horde is tested before anything else.",
		lore = {
			"The Valley of Trials is a walled canyon in southern Durotar set aside for exactly one purpose: finding out whether a recruit can fight. Thrall's Horde does not assume competence and does not hand out rank.",
			"The scorpids, boars and Burning Blade cultists here can kill a recruit, deliberately so. The Horde learned what unearned strength costs when the clans drank demon blood, and it has been rebuilding on a different basis ever since.",
		},
	},
	{
		name = "Razor Hill", faction = "Horde", levels = "5-12",
		hook = "An orcish settlement at the crossroads of central Durotar.",
		lore = {
			"Razor Hill stands on the road between Orgrimmar and Sen'jin Village. A western road crosses the Southfury River into the Barrens.",
			"Gar'Thok commands the settlement and seeks recruits to confront the humans at Tiragarde Keep. Orgnil Soulscar investigates the Burning Blade cult's foothold in Durotar.",
		},
		readMore = { "Wowpedia: Razor Hill", "Wowpedia: Vanquish the Betrayers", "Wowpedia: Report to Orgnil" },
	},
	{
		name = "Sen'jin Village", faction = "Horde", levels = "5-12",
		hook = "The Darkspear trolls' village on the coast, home to a tribe twice driven from its islands.",
		lore = {
			"Thrall met the Darkspear on their island home during his voyage to Kalimdor. He helped them against the murlocs, but their chieftain Sen'jin died after foreseeing that the orc would lead his people away.",
			"The tribe later settled on the Echo Isles, only to be driven out by Zalazane. Vol'jin brought his people to the coast of Durotar and named this village after his father. Master Gadrin now seeks help against the witch doctor and his hexed followers.",
		},
		readMore = { "Wowpedia: Sen'jin Village", "Wowpedia: Sen'jin", "Wowpedia: Zalazane (quest)" },
	},
	{
		name = "Echo Isles", parent = "Durotar", faction = "Hostile",
		hook = "The Darkspear's own islands, stolen by one of their own witch doctors.",
		lore = {
			"The Echo Isles were given to the Darkspear as their home when they allied with Thrall. They do not hold them any more.",
			"Zalazane, a Darkspear witch doctor, turned on his own people and seized the islands. He sends his trolls across to the mainland to hex the Darkspear and drag more of them under his sway, and he keeps the skulls of the taken in a circle of power on the largest isle. The tribe lives at Sen'jin Village now and wants him dealt with.",
		},
	},
	{
		name = "Tiragarde Keep", parent = "Durotar", faction = "Hostile",
		hook = "A Kul Tiras garrison shipwrecked in Horde territory, still following orders from a dead admiral.",
		lore = {
			"These are marines of Kul Tiras, the human naval kingdom, wrecked on Durotar's coast and dug in. They have fortified the keep and they are not negotiating.",
			"Their admiral, Daelin Proudmoore, sailed to Kalimdor to finish the orcs and attacked Theramore's Horde neighbours against his own daughter Jaina's wishes. He died at Theramore. These marines have not been told, or do not accept it.",
		},
	},
	{
		name = "Drygulch Ravine", parent = "Durotar", faction = "Hostile",
		hook = "A ravine full of harpies in northern Durotar.",
		lore = {
			"Drygulch is a dry canyon north of Razor Hill, held by harpies. Harpies are everywhere in Kalimdor. The story told about them is that they are cursed descendants of night elves, a subject on which no harpy has ever been drawn.",
			"They raid the roads around Orgrimmar, keeping the Horde's patrols busy and making the ravine a standard early assignment.",
		},
	},
	{
		name = "Thunder Ridge", parent = "Durotar", faction = "Contested",
		hook = "A ridge where the storms never quite stop, full of lightning-charged lizards.",
		lore = {
			"Thunder Ridge sits in northeastern Durotar, and the storms have got into the wildlife: thunder lizards and lightning hides, whose scales come off singed. Orgrimmar's warriors send recruits up here to fight them as a test.",
			"Something else is camped in the hollow. Fizzle Darkstorm is a goblin warlock of the Burning Blade, and he and his cultists are working out here in the open, well inside Durotar, which is the whole trouble with that cult.",
		},
	},
	{
		name = "Skull Rock", parent = "Durotar", faction = "Hostile",
		hook = "A cave of Burning Blade cultists, practising exactly what Thrall outlawed.",
		lore = {
			"The Burning Blade is a demonic cult operating inside Horde territory. Its members are mostly orcs who want the old power back: the demon blood, the warlock pacts, the strength that the Horde used to have and that destroyed it.",
			"Thrall's Horde has banned that path outright and Thrall would have them killed. The cults keep forming anyway, because the Horde's strength under Gul'dan was real and some orcs would rather be strong than free.",
			"What the cave east of Orgrimmar holds is the practice itself. The cultists perform their rituals in there and burn their own flesh with searing collars, which is how they attune themselves to demonic power, and one of the collars taken out of this cave is what first put the Horde on to them.",
		},
	},
	{
		name = "Razormane Grounds", parent = "Durotar", faction = "Hostile",
		hook = "Quilboar territory in central Durotar.",
		lore = {
			"The Razormane are quilboar, and quilboar were in Durotar and the Barrens long before the orcs arrived. They are organised around their thorny warrens and they do not recognise Horde claims.",
			"Quilboar trace themselves to Agamaggan, a boar demigod killed fighting the Burning Legion. Their religion and their geography both grow out of that.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- MULGORE
-- ---------------------------------------------------------------------------

Zone{
	name = "Mulgore", continent = KA, faction = "Horde", levels = "1-10",
	hook = "Open plains where a nomadic people finally stopped walking, and built a city on four mesas.",
	lore = {
		"Mulgore is the tauren homeland, and it has only been that for a few years. The tauren were nomads, following the kodo herds across Kalimdor and fighting a losing war against the centaur, who had hunted them for generations.",
		"Thrall's Horde changed that. The orcs arrived in Kalimdor, met Cairne Bloodhoof's people, and helped them break the centaur. In return the tauren joined the Horde, and with the pressure off they settled Mulgore and raised Thunder Bluff on the mesas at its northern end. It is the first permanent tauren city in their history.",
		"The tauren are the Horde's conscience. They are shamanistic, they keep the Earthmother's teachings, and their druids are a new thing: the Cenarion Circle took them in after the Third War, and the night elves there still call them young in the ways of Cenarius. When Orgrimmar does something ugly, it is usually a tauren who says so out loud.",
	},
	didYouKnow = "Not all tauren agree. The Grimtotem tribe under Magatha Grimtotem rejected the alliance with the orcs and operates across Kalimdor on its own account. They are not friendly.",
	readMore = { "Wowpedia: Mulgore", "Wowpedia: Cairne Bloodhoof", "Wowpedia: Tauren" },
}

SubsOf("Mulgore", {
	{
		name = "Red Cloud Mesa", faction = "Horde", levels = "1-5",
		hook = "The mesa where young tauren are given their first rites.",
		lore = {
			"Red Cloud Mesa is the tauren equivalent of the orcs' Valley of Trials: a contained stretch of plain where the young are taught, tested and sent on.",
			"The rites begin with practical service to the tribe. Young hunters bring meat and feathers back to Camp Narache, and the Bristleback quilboar in Brambleblade Ravine threaten their home.",
		},
		readMore = { "Wowpedia: Red Cloud Mesa", "Wowpedia: The Hunt Begins", "Wowpedia: Break Sharptusk!" },
	},
	{
		name = "Camp Narache", faction = "Horde", levels = "1-6",
		hook = "A starting camp on Red Cloud Mesa, with the Bristleback quilboar already a problem.",
		lore = {
			"Camp Narache is the first village a young tauren knows. It is small and traditional, and under constant low-level pressure from the Bristleback quilboar in the hills.",
			"Quilboar and tauren have been fighting over Mulgore's plains for a very long time, and the quilboar were here first.",
		},
	},
	{
		name = "Bloodhoof Village", faction = "Horde", levels = "5-12",
		hook = "The Bloodhoof tribe's own village, with Cairne's son running it.",
		lore = {
			"Bloodhoof Village is named for the tribe, and the tribe's name is the High Chieftain's: Cairne Bloodhoof, one of Thrall's closest allies. Cairne himself rules from Thunder Bluff, up on the mesas. What is down here is his son, Baine, and the everyday business of Mulgore.",
			"Two things are on Baine's desk. The Palemane gnolls have settled south of the village and in a cave to the west and are killing Mulgore's wildlife without restraint, and attempts to talk to them have been thrown back. And there are dwarves cutting a quarry to the north-west. For both of them he has run out of words.",
		},
	},
	{
		name = "Thunder Bluff", faction = "Horde", levels = "Capital",
		hook = "The tauren capital, built on four mesas joined by rope bridges.",
		lore = {
			"Thunder Bluff stands above the grasslands of northern Mulgore. Bridges of wood and rope connect its mesas, and lifts carry visitors up from the plains.",
			"With Thrall's help, Cairne Bloodhoof and his people drove back the centaur and claimed Mulgore. Cairne built Thunder Bluff as a refuge where tauren of every tribe were welcome.",
			"Cairne rules as High Chieftain. Druids and shaman have their places in the city, while the Forsaken keep mage and priest trainers in the Pools of Vision beneath Spirit Rise.",
		},
		readMore = { "Wowpedia: Thunder Bluff", "Wowpedia: Pools of Vision" },
	},
	{
		name = "The Golden Plains", parent = "Mulgore", faction = "Horde",
		hook = "Open grassland in central Mulgore, and the kodo herds' main range.",
		lore = {
			"The Golden Plains are the heart of Mulgore's grassland and the reason the tauren stopped here. The kodo herds graze them, and kodo are central to tauren life as beasts of burden, as food and as a measure of wealth.",
			"The plains are also where the tauren's relationship with the land is most visible. Nothing is fenced and nothing is farmed intensively.",
		},
	},
	{
		name = "Red Rocks", parent = "Mulgore", faction = "Contested",
		hook = "The tauren burial ground, and somebody has been disturbing it.",
		lore = {
			"Red Rocks is where the tauren lay their honoured dead. It is sacred ground and treated as such.",
			"It has been interfered with. For the tauren there is hardly a graver offence. The Grimtotem and outside necromancy have both been suspected.",
		},
	},
	{
		name = "Palemane Rock", parent = "Mulgore", faction = "Hostile",
		hook = "A gnoll den in western Mulgore, stealing tauren hides.",
		lore = {
			"The Palemane gnolls have made a camp in the western hills and have been raiding tauren leather and supplies.",
			"Gnolls turn up on both continents wherever there is a road worth robbing. The tauren treat them as vermin rather than as an enemy.",
		},
	},
	{
		name = "Brambleblade Ravine", parent = "Mulgore", faction = "Hostile",
		hook = "A Bristleback quilboar warren east of Camp Narache, at war with the tauren.",
		lore = {
			"Brambleblade is one of the Bristleback tribe's warrens, dug into the hills east of Camp Narache, and quilboar warrens are built around a thorny central growth the tribe tends almost religiously.",
			"The Bristlebacks here raid tauren hunting parties under Chief Sharptusk Thornmantle, which is why the ravine is where young tauren are sent for the Rite of Strength. It is the first of the Rites of the Earthmother, and most tauren meet their first enemy in this ravine.",
			"The quilboar's connection to Agamaggan, the boar demigod, runs through those thorns. Destroying a warren is not just a military act to them.",
		},
	},
	{
		name = "Stonebull Lake", parent = "Mulgore", faction = "Horde",
		hook = "A lake in southern Mulgore, and a quiet place by any standard.",
		lore = {
			"Stonebull Lake waters the southern plains and is one of the more peaceful spots in Horde territory.",
			"Mulgore as a whole is the gentlest zone the Horde holds. The tauren regard that as earned, not granted.",
		},
	},
	{
		name = "Windfury Ridge", parent = "Mulgore", faction = "Contested",
		hook = "A ridge in the north where harpies have settled.",
		lore = {
			"Windfury Ridge holds a harpy population on Mulgore's northern edge, near the approaches to Thunder Bluff.",
			"Harpies and tauren have no history to speak of; the harpies are there and aggressive, as they are across most of Kalimdor.",
		},
	},
	{
		name = "The Venture Co. Mine", parent = "Mulgore", faction = "Hostile",
		hook = "A goblin mining operation drilling into tauren land without asking.",
		lore = {
			"The Venture Company has set up on Mulgore's eastern edge and started extracting. They did not seek permission and they are not interested in the tauren's objections.",
			"Venture Co. is the goblin cartel that works without any pretence of neutrality or restraint. They are doing the same thing in the Barrens, Stranglethorn and Stonetalon.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- TELDRASSIL
-- ---------------------------------------------------------------------------

Zone{
	name = "Teldrassil", continent = KA, faction = "Alliance", levels = "1-10",
	hook = "A World Tree grown to win back a lost immortality, already going wrong.",
	lore = {
		"Teldrassil is a World Tree, grown off Kalimdor's northern coast, and the night elves live in and on it. Darnassus is built in its branches. It was grown after the Third War. For a tree of this kind that is infancy.",
		"It exists because of what happened at Mount Hyjal. The night elves' immortality came from Nordrassil, the first World Tree, which was rooted in the Well of Eternity's waters. At the Battle of Mount Hyjal they used Nordrassil to destroy Archimonde, and the tree's power, and their immortality with it, was spent. Teldrassil was Fandral Staghelm's answer: plant a new World Tree and get it back.",
		"Malfurion Stormrage was not there to argue. He never came back from the Emerald Dream, and with him missing the druids went along with Staghelm. The dragons did not. Nozdormu refused his blessing and chided Staghelm for his arrogance, and Alexstrasza refused with him. A World Tree needs the Aspects' blessings and Teldrassil has none, so its growth has been flawed from the start. It is sick. The Gnarlpine furbolgs nearby have been driven mad by the corruption and the Ban'ethil barrow dens are troubled.",
	},
	didYouKnow = "Night elves are not naturally mortal and have not adjusted well. The generation that remembers being immortal is still alive, and it colours everything in Darnassus.",
	readMore = { "Wowpedia: Teldrassil", "Wowpedia: Nordrassil", "Wowpedia: Fandral Staghelm" },
}

SubsOf("Teldrassil", {
	{
		name = "Shadowglen", faction = "Alliance", levels = "1-5",
		hook = "A moonwell glade in Teldrassil's branches where night elves begin.",
		lore = {
			"Shadowglen is the night elves' training glade, centred on a moonwell. Moonwells are drawn from the Well of Eternity's waters and they are the night elves' source of healing and renewal.",
			"The glade should be perfectly healthy. The grell and corrupted wildlife in it are an early sign that something is wrong with the tree itself.",
		},
	},
	{
		name = "Dolanaar", faction = "Alliance", levels = "5-12",
		hook = "Teldrassil's main village, dealing with a furbolg problem it did not create.",
		lore = {
			"Dolanaar is the night elves' settlement on the tree's slopes, with an inn, a trainer's hall and the administration for the region.",
			"Its chief concern is the Gnarlpine. Furbolgs were peaceful neighbours and allies of the night elves for a long time, and the Gnarlpine tribe's descent into madness is both a security problem and a real grief.",
		},
	},
	{
		name = "Darnassus", faction = "Alliance", levels = "Capital",
		hook = "The night elf capital in Teldrassil's branches, built around a temple to the moon goddess.",
		lore = {
			"Darnassus is the night elves' city and the seat of Tyrande Whisperwind, High Priestess of Elune. It holds the Temple of the Moon, the Cenarion Enclave where the druids gather, and the Warrior's Terrace where the Sentinels train.",
			"The city is new, like the tree. The night elves' old capital was Zin-Azshari and then, after the Sundering, they lived scattered across Kalimdor's forests for ten thousand years without a city at all.",
			"Tyrande rules alone at present. Malfurion Stormrage, her partner and the first druid, is in the Emerald Dream and not reachable, and the Cenarion Circle's politics under Fandral Staghelm have become difficult in his absence.",
		},
		readMore = { "Wowpedia: Darnassus", "Wowpedia: Tyrande Whisperwind" },
	},
	{
		name = "Gnarlpine Hold", parent = "Teldrassil", faction = "Hostile",
		hook = "A furbolg stronghold in southwestern Teldrassil.",
		lore = {
			"Gnarlpine Hold lies in southwestern Teldrassil. Ursal the Mauler is found here among the hostile Gnarlpine furbolgs.",
			"Athridas Bearmantle names Ursal as the creature responsible for disrupting the awakening of the Druids of the Talon. He asks for help against Ursal while preparing the ritual for the sleeping druids.",
		},
		readMore = { "Wowpedia: Gnarlpine Hold", "Wowpedia: Ursal the Mauler (quest)" },
	},
	{
		name = "Ban'ethil Barrow Den", parent = "Teldrassil", faction = "Hostile",
		hook = "A druid barrow den overrun by the Gnarlpine.",
		lore = {
			"Ban'ethil Barrow Den shelters sleeping Druids of the Talon in Teldrassil. Gnarlpine invaders have ravaged the den, leaving the druids trapped in their hibernation.",
			"Athridas Bearmantle in Dolanaar seeks the Relics of Wakening stored in sacred chests inside. Without them, he cannot prepare the ritual to wake the sleepers.",
		},
		readMore = { "Wowpedia: Ban'ethil Barrow Den", "Wowpedia: The Relics of Wakening" },
	},
	{
		name = "Starbreeze Village", parent = "Teldrassil", faction = "Hostile",
		hook = "A night elf village overrun by furbolgs and spiders.",
		lore = {
			"Starbreeze was a small night elf settlement. The Gnarlpine took it, and the night elves have not retaken it.",
			"It is a measure of how thinly the Sentinels are spread. Teldrassil is supposed to be the night elves' sanctuary and they cannot hold all of it.",
		},
	},
	{
		name = "Pools of Arlithrien", parent = "Teldrassil", faction = "Contested",
		hook = "Pools and a moonwell in western Teldrassil, threatened by the Gnarlpine.",
		lore = {
			"The Pools of Arlithrien lie south of the entrance to Darnassus. A moonwell stands on their shores.",
			"Gnarlpine attacks have made Sentinel patrols difficult. Travellers sent to collect water from the well are warned to keep their weapons close.",
		},
		readMore = { "Wowpedia: Pools of Arlithrien", "Wowpedia: Crown of the Earth (4)" },
	},
	{
		name = "Oracle Glade", parent = "Teldrassil", faction = "Contested",
		hook = "A glade in the north where the night elves seek counsel.",
		lore = {
			"Oracle Glade is a place of consultation and prophecy, tended by night elves who read the natural world for guidance.",
			"The guidance currently coming out of it is not reassuring. The night elves blame the tree rather than the oracles.",
		},
	},
	{
		name = "Rut'theran Village", parent = "Teldrassil", faction = "Alliance",
		hook = "The harbour at the tree's base, and the only way in or out by sea.",
		lore = {
			"Rut'theran sits at Teldrassil's roots, at sea level, with the portal up to Darnassus and the boat to Auberdine in Darkshore.",
			"It is the Alliance's gateway to the night elves. Before Teldrassil the night elves had no port and wanted none; their alliance with the humans, dwarves and gnomes is recent and was forced on them by the Third War.",
		},
	},
	{
		name = "Lake Al'Ameth", parent = "Teldrassil", faction = "Alliance",
		hook = "A lake south of Dolanaar, with angry timberlings along its shores.",
		lore = {
			"Lake Al'Ameth lies south of Dolanaar in Teldrassil. Timberlings inhabit its shores, and their growing anger troubles Denalan.",
			"He suspects the soil is involved and asks for timberling seeds to test his methods of nurturing plants. He also wants dangerous new sprouts cleared from around the water.",
		},
		readMore = { "Wowpedia: Lake Al'Ameth", "Wowpedia: Timberling Seeds", "Wowpedia: Timberling Sprouts" },
	},
})

-- ---------------------------------------------------------------------------
-- DARKSHORE
-- ---------------------------------------------------------------------------

Zone{
	name = "Darkshore", continent = KA, faction = "Alliance", levels = "10-20",
	hook = "A grey, rain-swept coast scattered with the ruins of the night elves' own lost empire.",
	lore = {
		"Darkshore is the coastline south of Teldrassil, and a ruin field from end to end. Ten thousand years ago this was inland territory of the night elf empire. Then came the War of the Ancients and the Sundering: the Well of Eternity collapsed, the single continent of Kalimdor was blown apart, and the sea came in.",
		"What is left along this coast are the drowned and broken remains of night elf cities. Ameth'Aran, Bashal'Aran and Mathystra were real places with real populations, and the night elves walk past them daily.",
		"The zone's live problems are the Twilight Hammer cultists at the Master's Glaive, the naga coming out of the water, the warlocks of the Cult of the Dark Strand in the Tower of Althalaxx, and a dwarven archaeologist digging up things he does not understand. Auberdine is the Alliance's port and the only organised settlement on the coast.",
	},
	didYouKnow = "The Master's Glaive is an enormous blade driven into the ground, and the Twilight Hammer cult gathers there because something very old is buried beneath it. The cult worships the Old Gods, and on the question of one being down there somewhere they may well be right.",
	readMore = { "Wowpedia: Darkshore", "Wowpedia: Great Sundering" },
}

SubsOf("Darkshore", {
	{
		name = "Auberdine", faction = "Alliance", levels = "10-20",
		hook = "The night elves' port on the ruined coast, and the Alliance's ferry hub in the north.",
		lore = {
			"Auberdine is a working port with two boats: one to Rut'theran Village at the foot of Teldrassil, the other to Menethil Harbor in the Wetlands. For Alliance players it is the main crossing between Kalimdor and the Eastern Kingdoms.",
			"It is also the night elves' administrative centre for Darkshore, coordinating responses to naga, cultists and a coastline full of things washing ashore.",
		},
		readMore = { "Wowpedia: Auberdine", "Wowpedia: Moonspray" },
	},
	{
		name = "Ruins of Mathystra", parent = "Darkshore", faction = "Hostile",
		hook = "A night elf city from before the Sundering, with naga in it now.",
		lore = {
			"Mathystra was a night elf settlement of the old empire, one of the better-preserved ruins on this coast. The architecture belongs to the same tradition Darnassus is built in. For a night elf it is an uncomfortable place to walk through.",
			"The Stormscale naga have the ruins and guard them against anyone who comes near. That is a particular insult: the naga are what became of the highborne, and what is scattered through Mathystra is highborne relics. Young night elves come looking for them anyway. The ghost sabers on the site are the other reason people make the trip.",
		},
	},
	{
		name = "Ameth'Aran", parent = "Darkshore", faction = "Hostile",
		hook = "A ruined Highborne town whose dead have not left it.",
		lore = {
			"Ameth'Aran was a place where the servants of Azshara practised their magic freely, and the restless spirits in the ruins are the Highborne who lived there. Ten thousand years is a long time to be restless.",
			"How any of this is known is two stone tablets lying in the ruins, carrying the lay of Ameth'Aran and the account of its fall. A Sentinel sent to read them was set on by the spirits and had to leave. Records from the years around the destruction of the Well of Eternity are thin, so the tablets are worth the trouble.",
		},
	},
	{
		name = "Bashal'Aran", parent = "Darkshore", faction = "Hostile",
		hook = "Another drowned night elf settlement, with a cursed spirit at its centre.",
		lore = {
			"Bashal'Aran is a sister ruin to Ameth'Aran, and like it the Sundering caught the population where they stood.",
			"The night elves who investigate these sites are, in effect, doing archaeology on their own living memory. Some of them remember the towns standing.",
		},
	},
	{
		name = "The Master's Glaive", parent = "Darkshore", faction = "Hostile",
		hook = "A colossal blade buried in the earth, with Old God cultists camped around it.",
		lore = {
			"The Glaive is an enormous weapon driven point-first into the ground at the mouth of a valley. Nobody knows who wielded it or what they used it on, and the scale rules out anything mortal.",
			"The Twilight Hammer cult gathers here. They worship the Old Gods, the ancient horrors the titans imprisoned beneath this world, and their presence at the Glaive suggests they believe one of the titans' prisons is nearby.",
			"The cult is small, fanatical and spread across Kalimdor. Where they show up, it is usually because something is buried.",
		},
		readMore = { "Wowpedia: Twilight's Hammer", "Wowpedia: Old Gods" },
	},
	{
		name = "Tower of Althalaxx", parent = "Darkshore", faction = "Hostile",
		hook = "A night elf tower taken over by a cult nobody in Darnassus recognises.",
		lore = {
			"Althalaxx is an old night elf structure, and a group of warlocks has taken up residence around it and inside it. They are the Cult of the Dark Strand, and Athrikus Narassin, a highborne of great power, leads them. The Sentinels watching the tower from Auberdine say plainly that they have never heard of the group and know nothing of its history.",
			"A journal taken off the cultists ties them to the Shadow Council, the demonic cabal that ran the Old Horde from behind Gul'dan. The Shadow Council was supposed to have been destroyed. Night elves serving it on this coast is exactly the kind of thing the night elves came out of their forests to prevent.",
		},
	},
	{
		name = "Grove of the Ancients", parent = "Darkshore", faction = "Alliance",
		hook = "A ruined temple in southern Darkshore with an Ancient of Lore in it.",
		lore = {
			"The Ancients are enormous sentient trees, allies of the night elves since the War of the Ancients. They fought at Mount Hyjal and they are not decorative.",
			"What is at this grove is one of them. Onu sits in the ruins of an old night elf temple, in against the mountains, with two merchants and a sleeping druid for company. He is a keeper of lore rather than a garrison, and the Circle of Ancients meets here.",
		},
	},
	{
		name = "Cliffspring Falls", parent = "Darkshore", faction = "Contested",
		hook = "A waterfall in the northern cliffs, with a cave behind it.",
		lore = {
			"The falls are a landmark on Darkshore's northern stretch, and the cave system behind them has acquired the usual tenants.",
			"Darkshore's caves tend to connect further than they look, and finding that out has gone badly more than once.",
		},
	},
	{
		name = "Remtravel's Excavation", parent = "Darkshore", faction = "Alliance",
		hook = "A dwarven dig in night elf ruins, run by an archaeologist with no sense of self-preservation.",
		lore = {
			"Prospector Remtravel of the Explorers' League is excavating the ruins at Darkshore's southern end. The night elves regard it as grave-robbing conducted by an ally.",
			"He is also alone out there, and the digging has woken something up. Cracked golems walk the site with a stone behemoth among them, and Remtravel is still at his work in the middle of it.",
		},
	},
	{
		name = "Twilight Vale", parent = "Darkshore", faction = "Hostile",
		hook = "The valley behind the Master's Glaive, thick with cultists.",
		lore = {
			"Twilight Vale is the Twilight Hammer's ground in Darkshore, running inland from the Glaive.",
			"The cult has three separate camps along this coast. For an organisation this secretive that is a substantial commitment.",
		},
	},
	{
		name = "Blackwood Den", parent = "Darkshore", faction = "Hostile",
		hook = "A furbolg den south of Auberdine, and what is getting into the river.",
		lore = {
			"The Blackwood furbolgs hold this den, and like the Gnarlpine on Teldrassil they have turned hostile. Theirs is the camp the Sentinels name as the biggest threat to Auberdine.",
			"The corruption in them is going downstream. The Cliffspring River has begun to turn foul on its way to Mist's Edge, the Blackwood up-river are taken to be the cause, and the night elves looking into it suspect the furbolgs are not the root of it either.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- THE BARRENS
-- ---------------------------------------------------------------------------

Zone{
	name = "The Barrens", continent = KA, faction = "Horde", levels = "10-25",
	hook = "A vast dry savannah that used to be forest, and the Horde's main road through Kalimdor.",
	lore = {
		"The Barrens are the great dry middle of Kalimdor, and the name is accurate now but was not always. This was lush forest once, and the druids who want it back say so in those words. What remains is savannah, scrub and a handful of oases.",
		"The Horde runs through it. The Crossroads sits at the junction of every road that matters, Camp Taurajo supplies the south, and the Mor'shan Rampart holds the northern border against the night elves in Ashenvale. For most Horde players the Barrens are the spine of the world.",
		"It is crowded with other claims. Quilboar hold Razorfen Kraul and Razorfen Downs, Kolkar centaur raid the central roads, the Venture Company is stripping the Sludge Fen, dwarves are digging at Bael'dun without permission, the Alliance holds Northwatch Hold on the coast, and Ratchet is a goblin free port where nobody is allowed to fight.",
	},
	didYouKnow = "The Wailing Caverns beneath the Barrens were a druid's attempt to restore the region. Naralex tried to reach the Emerald Dream to bring the water back, and touched the Nightmare instead. The screaming you can hear is him.",
	readMore = { "Wowpedia: The Barrens", "Wowpedia: Wailing Caverns" },
}

SubsOf("The Barrens", {
	{
		name = "The Crossroads", faction = "Horde", levels = "10-20",
		hook = "A Horde settlement where the roads of the Barrens meet.",
		lore = {
			"The Crossroads stands at the junction of the main north-south road and the route between Ratchet and the Stonetalon Mountains. Its inn and wind rider master make it a gathering place for Horde travellers.",
			"Sergra Darkthorn receives recruits sent into the Barrens. The settlement's guards have troubles of their own: raptors have stolen a shipment of silver meant for their pay.",
		},
		readMore = { "Wowpedia: The Crossroads", "Wowpedia: Crossroads Conscription", "Wowpedia: Raptor Thieves" },
	},
	{
		name = "Ratchet", faction = "Neutral", levels = "10-25",
		hook = "A goblin port on the eastern coast where Alliance and Horde trade under bruiser supervision.",
		lore = {
			"Ratchet is a Steamwheedle Cartel port: neutral ground, enforced by goblin bruisers. The boat from here runs to Booty Bay in Stranglethorn, making it the main cross-faction sea route in the world.",
			"The cartel's neutrality is strictly commercial. Baron Revilgaz in Booty Bay and the goblins here are running the same business: sell to both sides, forbid fighting on the premises, and take a cut of everything.",
		},
	},
	{
		name = "Camp Taurajo", faction = "Horde", levels = "20-30",
		hook = "A tauren camp in the southern Barrens, supplying the Horde's southern routes.",
		lore = {
			"Taurajo is a tauren settlement rather than an orcish one, and it handles the Horde's business in the southern Barrens: hides, kodo, supply and the road toward Thousand Needles and Dustwallow Marsh.",
			"Its position puts it between the quilboar at Razorfen and the Alliance at Theramore, and it is busier than its size suggests.",
		},
	},
	{
		name = "Wailing Caverns", parent = "The Barrens", faction = "Hostile", levels = "15-25",
		hook = "A cave system where a druid's dream of restoring the Barrens turned into a nightmare.",
		lore = {
			"Naralex entered the Emerald Dream hoping to restore the Barrens to a lush forest. His dream became a nightmare, and corrupt creatures began to inhabit the caverns.",
			"Some of his disciples are trying to wake him. Others have become the Druids of the Fang, seeking to reshape the Barrens according to their own twisted dreams.",
			"The caverns take their name from the mournful sounds of steam escaping through fissures in the rock.",
		},
		readMore = { "Wowpedia: Wailing Caverns", "Wowpedia: Deviate Eradication", "Wowpedia: Leaders of the Fang" },
	},
	{
		name = "Razorfen Kraul", parent = "The Barrens", faction = "Hostile", levels = "25-35",
		hook = "A quilboar fortress woven out of living thorns.",
		lore = {
			"Razorfen Kraul is the quilboar's ancestral home, a warren built inside enormous thorny growths at the far southern edge of the Barrens.",
			"Quilboar religion centres on Agamaggan, a boar demigod killed fighting the Burning Legion during the War of the Ancients. The thorns are said to have sprung from the ground where his blood fell, making the Kraul a temple as much as a fortress. The crone Charlga Razorflank rules it now, and her quilboar raid rival tribes and Horde villages alike.",
		},
		readMore = { "Wowpedia: Razorfen Kraul", "Wowpedia: Agamaggan" },
	},
	{
		name = "Razorfen Downs", parent = "The Barrens", faction = "Hostile", levels = "35-45",
		hook = "A quilboar burial warren where the Scourge has arrived.",
		lore = {
			"The Downs are the quilboar's ancestral burial ground and their traditional capital, grown from the same thorns as the Kraul and dense with their dead.",
			"The Scourge has reached it. Undead hold much of the warren now and the quilboar dead are coming up out of their own graves, so the living are fighting their ancestors for their own capital.",
		},
	},
	{
		name = "Northwatch Hold", parent = "The Barrens", faction = "Hostile",
		hook = "An Alliance fortress on the Barrens coast, directly in the Horde's way.",
		lore = {
			"Northwatch Hold is a Theramore and Kul Tiras position on the Merchant Coast, and its guns are the point of it. Goblin shipping keeps going down off this shore, and the Horde's complaint is that the humans in the hold are trigger-happy and shooting at anything in range.",
			"It was established as part of the Alliance's effort to contain the Horde in Kalimdor, an effort which Jaina Proudmoore at Theramore has been trying to moderate and her late father pushed as hard as he could.",
		},
	},
	{
		name = "Bael'dun Keep", parent = "The Barrens", faction = "Hostile",
		hook = "A dwarven dig fortified against the Horde that owns the land.",
		lore = {
			"The dwarves of the Explorers' League are excavating here, and they built a keep around the dig because the Horde objected.",
			"Ironforge's archaeology has a habit of becoming a diplomatic incident. The dwarves' position is that the past belongs to everyone; the Horde's position is that the ground belongs to them.",
		},
	},
	{
		name = "The Sludge Fen", parent = "The Barrens", faction = "Hostile",
		hook = "A goblin industrial site poisoning the northern Barrens.",
		lore = {
			"The Venture Company is running an extraction operation here and dumping the waste into the water. The result is a spreading sludge that is killing everything downstream.",
			"The Horde wants it stopped. Venture Co. has no interest, and the cartel has no central authority that the Horde can pressure.",
		},
	},
	{
		name = "Mor'shan Rampart", parent = "The Barrens", faction = "Horde",
		hook = "The Horde's wall on the Ashenvale border, facing the night elves across it.",
		lore = {
			"The rampart holds the northern pass between the Barrens and Ashenvale. On the far side are the night elves, and the Horde's logging operations in their forest are the central grievance between the two.",
			"This border has been contested since the Horde arrived in Kalimdor and it has never been settled.",
		},
	},
	{
		name = "The Forgotten Pools", parent = "The Barrens", faction = "Contested",
		hook = "One of the Barrens' oases, holding out against the dry.",
		lore = {
			"The Barrens' oases, the Forgotten Pools, Lushwater and the Stagnant Oasis, are what is left of the water that used to be everywhere here.",
			"They are green, crowded with wildlife, and fought over by everything that needs to drink.",
		},
	},
	{
		name = "Lushwater Oasis", parent = "The Barrens", faction = "Contested",
		hook = "An oasis south of the Crossroads, held by Kolkar centaurs.",
		lore = {
			"The Kolkar leader Hezrul Bloodmark leads his people from Lushwater Oasis. The water draws beasts to the pools, but the centaurs make this a dangerous watering place.",
			"The oasis also draws attention for what its water does to those beasts. Shells from the snapjaws here and at the Stagnant Oasis are being collected to investigate the changes.",
		},
		readMore = { "Wowpedia: Lushwater Oasis", "Wowpedia: Hezrul Bloodmark (quest)", "Wowpedia: Altered Beings (Classic)" },
	},
	{
		name = "The Stagnant Oasis", parent = "The Barrens", faction = "Contested",
		hook = "The southern oasis, with a fissure under it and centaur camped on it.",
		lore = {
			"The Kolkar have a command tent at this oasis, and Verog the Dervish works out of it. Water is the zone's only real resource, so the oasis the centaur hold is the one worth holding.",
			"There is a fissure beneath the water, as there is at the Forgotten Pools. The Crossroads druids think the fissures are what feed the oases, and the test they ran was to drop dead, dried seeds into one. The seeds came up alive. Whatever is down there makes life out of nothing, and nobody knows what it is.",
		},
	},
	{
		name = "Dreadmist Peak", parent = "The Barrens", faction = "Hostile",
		hook = "A tower-topped peak held by Burning Blade cultists.",
		lore = {
			"Dreadmist Peak is a high point in the northern Barrens, occupied by the Burning Blade: the demonic cult of orcs who want the old Horde's power back.",
			"That the cult can hold a visible landmark inside Horde territory says something about how thinly Orgrimmar's authority is spread across Kalimdor.",
		},
	},
	{
		name = "Far Watch Post", parent = "The Barrens", faction = "Horde",
		hook = "A Horde watchtower on the road north from Durotar.",
		lore = {
			"Far Watch Post is the first Horde position travellers meet coming into the Barrens from Durotar, and it watches the eastern road.",
			"The tower system across the Barrens is how the Horde keeps track of a zone far too large to garrison properly.",
		},
	},
	{
		name = "Grol'dom Farm", parent = "The Barrens", faction = "Horde",
		hook = "A Horde farm in the southern Barrens, working thin ground.",
		lore = {
			"Grol'dom is one of the Horde's attempts at agriculture in the Barrens. Farming here is hard work for thin returns, and the farm is a long way south of the Crossroads.",
			"The quilboar warrens are the nearest neighbours. Razorfen Kraul lies south-west of the farm and the Downs beyond it, which is reason enough to build a palisade around a field.",
		},
	},
	{
		name = "The Dry Hills", parent = "The Barrens", faction = "Hostile",
		hook = "Harpy country in the northwestern Barrens.",
		lore = {
			"The Dry Hills are Witchwing ground. The harpies nest in the hills at the zone's northwestern corner, and they have been ravaging the Horde's caravan supplies on the road below for a long time.",
			"Serena Bloodfeather leads them, and the raids are revenge: her sister Bloodfeather was killed by Rexxar. The Crossroads wants her head, and the Witchwing slayers who lead her raiding parties with it.",
		},
	},
	{
		name = "Field of Giants", parent = "The Barrens", faction = "Contested",
		hook = "A plain of enormous bones, with something newer nesting among them.",
		lore = {
			"The Field of Giants is littered with skeletons far larger than anything currently living in the Barrens, and nothing on record says what they were.",
			"What lives there now is silithid. They have raised mounds on the field and they lay eggs in them, and the Horde at the Crossroads has taken an interest: the creatures seem to have more intelligence to them than an animal should, and nobody knows much else. Razormane country begins further south, past the field.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- STONETALON MOUNTAINS
-- ---------------------------------------------------------------------------

Zone{
	name = "Stonetalon Mountains", continent = KA, faction = "Contested", levels = "15-27",
	hook = "Mountain forest being cut down for Horde timber, and the night elves are not negotiating.",
	lore = {
		"Stonetalon is the forested mountain range between the Barrens and Desolace. Outside Ashenvale, nowhere brings the Horde and the night elves to blows faster. The Horde needs lumber; Orgrimmar was built from somewhere and Kalimdor's forests are the nearest source.",
		"The night elves are druids and Sentinels who spent ten thousand years as the stewards of these forests. From their side, the Horde is doing to Kalimdor exactly what the Legion's servants did. From the Horde's side, they were given no land and no welcome and have to live somewhere.",
		"The zone also holds the Charred Vale, a stretch of mountain burned down to ash and never recovered, and the Grimtotem tauren who answer to nobody. The Cenarion Circle maintains a presence trying to keep the whole thing from becoming a war.",
	},
	didYouKnow = "Thrall has repeatedly tried to restrain the logging. The Warsong clan under Grom Hellscream's old command did it anyway, and the orcs who want the forests cut are not the orcs who negotiate treaties.",
	readMore = { "Wowpedia: Stonetalon Mountains" },
}

SubsOf("Stonetalon Mountains", {
	{
		name = "Sun Rock Retreat", faction = "Horde", levels = "15-27",
		hook = "A tauren outpost trying to hold the middle ground in a logging war.",
		lore = {
			"Sun Rock Retreat is a tauren settlement, and the tauren's position in Stonetalon is awkward. They are Horde, but they share the night elves' view of what the forests are for.",
			"The retreat spends much of its effort on the harpies and the Grimtotem rather than on the night elves. That suits everyone.",
		},
	},
	{
		name = "Stonetalon Peak", faction = "Alliance", levels = "15-27",
		hook = "The night elves' hold at the top of the range, overlooking the logging camps.",
		lore = {
			"Stonetalon Peak is the night elves' position in the mountains, held by Sentinels and druids who are watching the Horde's timber operations from above.",
			"Their restraint is deliberate and under strain. The Sentinels could escalate; the Cenarion Circle has been arguing against it.",
		},
	},
	{
		name = "Windshear Crag", parent = "Stonetalon Mountains", faction = "Hostile",
		hook = "A Venture Company mining operation tearing up the eastern slopes.",
		lore = {
			"Windshear Crag is a goblin industrial site, and the Venture Company is extracting here with its usual indifference to anything nearby.",
			"The Horde and the night elves both object. Venture Co. is the one party in Stonetalon that neither side can make answer for anything.",
		},
	},
	{
		name = "The Charred Vale", parent = "Stonetalon Mountains", faction = "Hostile",
		hook = "A valley burned to ash and still full of fire elementals.",
		lore = {
			"The Charred Vale was forest. It is now ash, and the elementals that burned it have not left.",
			"The night elves regard the vale as evidence of what happens when the elements are provoked, and the Cenarion Circle has made attempts at restoration that have not taken.",
		},
	},
	{
		name = "Mirkfallon Lake", parent = "Stonetalon Mountains", faction = "Contested",
		hook = "A mountain lake with seeds that may help regrow Stonetalon.",
		lore = {
			"Mirkfallon Lake lies in the centre of the Stonetalon Mountains, north of Sun Rock Retreat. Pridewing wyverns live nearby.",
			"The lakeshore is a source of Gaea seeds. Tammra Windfield wants to imbue them with shamanistic power and plant a new forest on land damaged by industry and war.",
		},
		readMore = { "Wowpedia: Mirkfallon Lake", "Wowpedia: Cycle of Rebirth", "Wowpedia: Pridewings of Stonetalon" },
	},
	{
		name = "Grimtotem Post", parent = "Stonetalon Mountains", faction = "Hostile",
		hook = "The Grimtotem's camp in Stonetalon, with a prisoner in it.",
		lore = {
			"Grimtotem Post is the tribe's base in the Stonetalon Mountains, held by Grundig Darkcloud with brutes and sorcerers around him. Kaya Flathoof is being kept here, taken when they attacked her village.",
			"The Grimtotem are the one tauren tribe that never formally joined the Horde. Magatha Grimtotem leads them from a seat on Thunder Bluff, with all the standing of a tauren elder, while camps like this one are spread across Kalimdor and hostile to Horde and Alliance alike.",
		},
	},
	{
		name = "Boulderslide Ravine", parent = "Stonetalon Mountains", faction = "Hostile",
		hook = "A ravine full of kobolds and worse, under the southern slopes.",
		lore = {
			"Boulderslide Ravine is a cave and ravine complex in the southern mountains, infested and avoided.",
			"Stonetalon's caves connect further than they should, and the Venture Company's digging has made that worse.",
		},
	},
	{
		name = "Malaka'jin", parent = "Stonetalon Mountains", faction = "Horde",
		hook = "A troll hunting camp with a witch doctor and three captive night elves.",
		lore = {
			"The trolls of Malaka'jin live by hunting in the Stonetalon Mountains. Spiders have begun raiding their camps at night to steal the catch, and the hunters are asking for help.",
			"Witch Doctor Jin'Zil works from a cave here. He keeps three night elves in cages and collects sap, whiskers, eyes and a fey dragon scale for a brew he calls forest magic.",
		},
		readMore = { "Wowpedia: Malaka'jin", "Wowpedia: Blood Feeders", "Wowpedia: Jin'Zil's Forest Magic" },
	},
	{
		name = "Webwinder Path", parent = "Stonetalon Mountains", faction = "Hostile",
		hook = "A mountain road from Malaka'jin towards Mirkfallon Lake.",
		lore = {
			"Webwinder Path runs through Stonetalon Mountains from Malaka'jin towards Mirkfallon Lake. Spiders inhabit the ground along the route.",
		},
		readMore = { "Wowpedia: Webwinder Path" },
	},
})

-- ---------------------------------------------------------------------------
-- ASHENVALE
-- ---------------------------------------------------------------------------

Zone{
	name = "Ashenvale", continent = KA, faction = "Contested", levels = "18-30",
	hook = "Ancient night elf forest where Grom Hellscream killed a demon lord and broke a curse on his whole race.",
	lore = {
		"Ashenvale is old-growth night elf forest and the front line between the night elves and the Horde. The Warsong clan is logging it from Warsong Lumber Camp, the Sentinels hold Astranaar and Silverwing, and the war here is active rather than theoretical.",
		"It is also the ground where the orcs were freed. During the Third War, Grom Hellscream's Warsong clan was corrupted again by demon blood in these woods. Thrall and Grom hunted down Mannoroth, the pit lord whose blood had bound the orcish race to the Burning Legion for generations. Grom killed him at Demon Fall Canyon and died doing it, and the curse on every orc alive died with him.",
		"The forest holds much else: satyrs at Satyrnaar, corrupted furbolgs at Thistlefur, the Fire Scar Shrine, the Emerald Dream portal at Bough Shadow, and the night elves' own ruins at Stardust. Blackfathom Deeps on the coast is a drowned temple of Elune that the naga and the Twilight Hammer have both taken an interest in.",
	},
	didYouKnow = "Satyrs are corrupted night elves. Xavius, the first satyr, was one of Queen Azshara's highborne, and the satyrs in these woods are the descendants of night elves who chose the Legion ten thousand years ago.",
	readMore = { "Wowpedia: Ashenvale", "Wowpedia: Grom Hellscream", "Wowpedia: Mannoroth" },
}

SubsOf("Ashenvale", {
	{
		name = "Astranaar", faction = "Alliance", levels = "18-30",
		hook = "A night elf town on a lake in central Ashenvale.",
		lore = {
			"Astranaar stands on an island along the main road through Ashenvale, connected to the shore by two bridges. It offers an inn, merchants and a flight master to Alliance travellers.",
			"Raene Wolfrunner watches the growing Thistlefur threat north of town. Her scouts fear that the furbolgs may gather enough strength to attack Astranaar directly.",
		},
		readMore = { "Wowpedia: Astranaar", "Wowpedia: Culling the Threat" },
	},
	{
		name = "Splintertree Post", faction = "Horde", levels = "25-35",
		hook = "The Horde's eastern outpost, holding the line it cut into the forest.",
		lore = {
			"Splintertree Post is the Horde's position in eastern Ashenvale, supporting the logging and holding the road toward Felwood and the Barrens.",
			"It is under constant Sentinel pressure. The orcs here are not conquerors with a secure rear; they are an exposed garrison in hostile woods.",
		},
	},
	{
		name = "Warsong Lumber Camp", parent = "Ashenvale", faction = "Hostile",
		hook = "The logging camp that is the entire reason for the war in this forest.",
		lore = {
			"The Warsong clan cuts timber here, and the timber goes to Orgrimmar. Grom Hellscream's clan took the name Warsong for their battle chants and they have never been the Horde's moderating influence.",
			"Thrall has restrained them and they have resumed. The camp is both a practical necessity for the Horde and the clearest evidence that Orgrimmar does not fully control its own clans.",
		},
	},
	{
		name = "Warsong Labor Camp", parent = "Ashenvale", faction = "Hostile",
		hook = "The Warsong's other logging camp, out in the southeast where nobody is watching.",
		lore = {
			"This is not the Warsong Lumber Camp. That is the main operation; this is a smaller one in the southeast of the forest, east of Fallen Sky Lake, where loggers and harvesters work under a handful of orcish guards.",
			"Two camps instead of one is the part worth noticing. The Horde's timber operation in Ashenvale is not a single site the Sentinels could close down and be finished with. It spreads, and this is where it has spread to.",
			"It stands a short walk from the Dor'Danil Barrow Den, where night elf druids were laid down to sleep in the earth. Nobody at the camp seems to have been told that, or to have asked.",
		},
		readMore = { "Wowpedia: Warsong Labor Camp", "Wowpedia: Ashenvale" },
	},
	{
		name = "Demon Fall Canyon", parent = "Ashenvale", faction = "Hostile",
		hook = "The canyon where Grom Hellscream killed Mannoroth and broke the blood curse.",
		lore = {
			"Demon Fall Canyon lies in southeastern Ashenvale. Here Thrall and Grom Hellscream confronted Mannoroth, the pit lord whose blood had bound the orcs to the Burning Legion. Grom's killing blow destroyed the demon, but the explosion also took his own life.",
			"A monument honours Grom's sacrifice. During the Harvest Festival, Horde travellers bring offerings to its base.",
		},
		readMore = { "Wowpedia: Demon Fall Canyon", "Wowpedia: Honoring a Hero (Horde)" },
	},
	{
		name = "Silverwing Grove", parent = "Ashenvale", faction = "Alliance",
		hook = "A Sentinel grove facing the Warsong across a contested forest.",
		lore = {
			"The Silverwing Sentinels hold this grove and the surrounding woods against the Warsong's expansion.",
			"The Silverwing and Warsong conflict in Ashenvale is the oldest continuous fight between the Alliance and Horde in Kalimdor, and both sides have made it a point of honour.",
		},
	},
	{
		name = "Zoram'gar Outpost", faction = "Horde", levels = "18-30",
		hook = "A Horde camp on the Zoram Strand, threatened by naga from the sea.",
		lore = {
			"Zoram'gar Outpost stands on Ashenvale's western coast. It is one of the Horde's two outposts in the forest, alongside Splintertree Post.",
			"Naga attack the camp, and the hydra Vorsha the Lasher has also struck it. Je'neu Sancrea, a member of the Earthen Ring, studies the corruption of the elements from here.",
		},
		readMore = { "Wowpedia: Zoram'gar Outpost", "Wowpedia: Je'neu Sancrea", "Wowpedia: Vorsha the Lasher (quest)" },
	},
	{
		name = "Blackfathom Deeps", parent = "Ashenvale", faction = "Hostile", levels = "20-30",
		hook = "A drowned temple of Elune, now held by naga and an Old God cult.",
		lore = {
			"Blackfathom Deeps was a temple of Elune on the coast, lost to the sea in the Sundering. The night elves abandoned it and it has been underwater ever since.",
			"It is not empty. Naga have taken the flooded halls, and the Twilight Hammer cult is down there too, working on something involving an Old God's influence. The night elves consider the desecration of a temple of Elune a serious matter and have no force to spare for it.",
		},
		readMore = { "Wowpedia: Blackfathom Deeps" },
	},
	{
		name = "Satyrnaar", parent = "Ashenvale", faction = "Hostile",
		hook = "A satyr settlement in the eastern forest, built by night elves who chose the Legion.",
		lore = {
			"Satyrnaar is held by satyrs, which means it is held by the descendants of night elves who sided with the Burning Legion during the War of the Ancients and were transformed for it.",
			"The night elves do not treat satyrs as a monster population. They treat them as traitors, and the distinction matters a great deal in how that war is fought.",
		},
	},
	{
		name = "Thistlefur Village", parent = "Ashenvale", faction = "Hostile",
		hook = "A furbolg village gone over to corruption.",
		lore = {
			"The Thistlefur furbolgs have fallen the way the Gnarlpine and Blackwood did, and they hold a village in northern Ashenvale.",
			"Furbolg corruption across the northern forests is widespread, and the source is generally traced to the demonic taint left after the Third War, worst of all in Felwood next door.",
		},
	},
	{
		name = "Bough Shadow", parent = "Ashenvale", faction = "Hostile",
		hook = "An Emerald Dream portal in northeastern Ashenvale, guarded by green dragonkin.",
		lore = {
			"Bough Shadow lies beyond Forest Song, in the northeastern corner of Ashenvale. Its great tree holds a portal to the Emerald Dream.",
			"Green drakes and dragonspawn guard the approach. Phantim and Dreamstalker are among the formidable creatures found here.",
		},
		readMore = { "Wowpedia: Bough Shadow" },
	},
	{
		name = "Maestra's Post", faction = "Alliance", levels = "18-25",
		hook = "A road junction in north-western Ashenvale, with a paladin working out of it.",
		lore = {
			"Maestra's Post sits near the Darkshore border at the top of the forest, a junction more than a camp: signposts for Darkshore, Astranaar and the Shrine of Aessina, and three people.",
			"Delgren the Purifier runs his own campaign from here against the Dark Strand, the night elf cult holding the Tower of Althalaxx north of the post. Feero Ironhand is the other man worth knowing, and his business is getting a supply run through to Auberdine.",
		},
	},
	{
		name = "Fire Scar Shrine", parent = "Ashenvale", faction = "Hostile",
		hook = "A corrupted shrine in southwestern Ashenvale, occupied by demons.",
		lore = {
			"Fire Scar Shrine lies southwest of Astranaar. Demons inhabit the area, and the orc warlock Ilkrud Magthrull makes his home here.",
			"His activities have drawn the attention of those investigating the Tower of Althalaxx. Adventurers are sent to confront him at the shrine.",
		},
		readMore = { "Wowpedia: Fire Scar Shrine", "Wowpedia: The Tower of Althalaxx (5)" },
	},
	{
		name = "Mystral Lake", parent = "Ashenvale", faction = "Contested",
		hook = "A lake in the forest's heart, with furbolgs on its shores.",
		lore = {
			"Mystral Lake is central Ashenvale's main water, and the forest around it is some of the oldest growth in Kalimdor.",
			"It also sits on the route between Astranaar and the Horde's eastern positions, so it stays contested.",
		},
	},
	{
		name = "The Ruins of Stardust", parent = "Ashenvale", faction = "Contested",
		hook = "Night elf ruins in the southern forest, from before the Sundering.",
		lore = {
			"Stardust was a night elf settlement of the old empire, and these ruins are ten thousand years old.",
			"Ashenvale is full of them. The night elves fighting for this forest are fighting over ground that already holds their own civilisation's wreckage.",
		},
	},
	{
		name = "Raynewood Retreat", parent = "Ashenvale", faction = "Alliance",
		hook = "A great tree in Ashenvale, watched by dryads and Cenarion protectors.",
		lore = {
			"Raynewood Retreat stands in north-central Ashenvale. Dryads, blink dragons and Cenarion protectors inhabit the grounds around its great tree.",
			"Keeper Ordanus, a son of Cenarius, resides at the top. A moonwell lies to the east, tended by Shael'dryn.",
		},
		readMore = { "Wowpedia: Raynewood Retreat", "Wowpedia: Ordanus (quest)" },
	},
})

-- ---------------------------------------------------------------------------
-- THOUSAND NEEDLES
-- ---------------------------------------------------------------------------

Zone{
	name = "Thousand Needles", continent = KA, faction = "Contested", levels = "25-35",
	hook = "A canyon of towering mesas on a dry sea bed, with a goblin racetrack at the bottom.",
	lore = {
		"Thousand Needles is a vast canyon of freestanding rock pillars in southern Kalimdor. The mesas are the remains of a landscape the Sundering tore apart, and the Shimmering Flats at the eastern end are a salt pan that used to be under water.",
		"The centaur own most of it. The Galak and other clans hold the canyon floor and the lower mesas, and the centaur are the reason the tauren were nomads for so long. Centaur trace their descent from Zaetar, a son of Cenarius, and the earth elemental princess Theradras. They are a demigod's grandchildren with a very bad temperament.",
		"The tauren hold Freewind Post on a high mesa, reachable only by lift. At the other end, goblins have built the Mirage Raceway on the salt flats and race rocket-powered machines across them, because goblins look at a dry lake bed and see a track.",
	},
	didYouKnow = "The Great Lift, the enormous elevator between Thousand Needles and the Barrens, is tauren-built and one of the few large pieces of engineering the tauren have ever made. They built it because the alternative was a very long walk.",
	readMore = { "Wowpedia: Thousand Needles", "Wowpedia: Centaur" },
}

SubsOf("Thousand Needles", {
	{
		name = "Freewind Post", faction = "Horde", levels = "25-35",
		hook = "A tauren village on a mesa top, safe because nothing can climb up to it.",
		lore = {
			"Freewind Post sits on a high mesa and is reached by lift. The tauren put it there for exactly the reason it looks: the centaur cannot get at it.",
			"It is the Horde's only secure position in Thousand Needles and it coordinates the tauren's long campaign against the centaur clans below.",
		},
	},
	{
		name = "Mirage Raceway", faction = "Neutral", levels = "25-35",
		hook = "A racetrack on a salt flat, built by a goblin and a gnome who cannot let it go.",
		lore = {
			"The Mirage Raceway is built on the Shimmering Flats: a dry lake bed, some rocket engines and a betting operation.",
			"It exists because the goblin Pozzik and the gnome Fizzle Brassbolts each wanted to prove his own people built the better machine. They laid out the track, built rocket cars and put teams in them, and they keep separate camps at opposite ends of it. Sabotage is a recognised tactic. It is neutral ground and it is the least serious place in Kalimdor.",
		},
	},
	{
		name = "The Shimmering Flats", parent = "Thousand Needles", faction = "Neutral",
		hook = "A dried lake bed with a racetrack on it and a dig nobody got to keep.",
		lore = {
			"The Flats are a dried lake bed. The wrecked sailing ship lying in the north is the evidence, and the salt crust goes down a long way with the sun off it blinding.",
			"The goblins and gnomes race on it, because flat ground is what a rocket car wants. Dwarven archaeologists would rather dig, and they had the Rustmaul Dig Site in the south-west until a Horde raiding party under Moktar Krin came at them. In the end neither side held it: the dwarves dug into a silithid hive and everybody left.",
		},
	},
	{
		name = "The Great Lift", parent = "Thousand Needles", faction = "Contested",
		hook = "The tauren-built elevator between Thousand Needles and the Barrens.",
		lore = {
			"The Great Lift carries travellers between the Barrens and the canyon of Thousand Needles. Tauren guards watch the elevator.",
			"Grish Longrunner has requested time away to visit his family. A reserve warrior is being sent to relieve him, and a letter from his superior brings the news.",
		},
		readMore = { "Wowpedia: Great Lift", "Wowpedia: Calling in the Reserves" },
	},
	{
		name = "Highperch", parent = "Thousand Needles", faction = "Hostile",
		hook = "A wyvern roost on the western mesas.",
		lore = {
			"Highperch is a wyvern nesting site. Wyverns are native to Kalimdor and the Horde uses them as flying mounts, which the wild populations have not consented to.",
			"The nests are up on the mesa tops, with the egg shells scattered on the ground below them. The shells are sun-scorched by the time they are collected, and worth something to an armoursmith, which is the usual reason anyone climbs up here.",
		},
	},
	{
		name = "Darkcloud Pinnacle", parent = "Thousand Needles", faction = "Hostile",
		hook = "A Grimtotem settlement spread across the mesas of Thousand Needles.",
		lore = {
			"Darkcloud Pinnacle stands east of the Great Lift. Rope bridges connect its inhabited mesas, and guards watch the approaches.",
			"The Grimtotem keep secret correspondence in guarded chests here. Their dealings with visitors of unknown origin have drawn the attention of Freewind Post.",
		},
		readMore = { "Wowpedia: Darkcloud Pinnacle", "Wowpedia: Grimtotem Spying" },
	},
	{
		name = "Splithoof Crag", parent = "Thousand Needles", faction = "Hostile",
		hook = "The Galak stronghold, against the canyon's northern wall.",
		lore = {
			"Splithoof Crag is the Galak clan's stronghold, set against the northern wall of the canyon east of Darkcloud Pinnacle, and the Galak are here in great numbers.",
			"Splithoof Hold is the guarded part of it. The centaur keep a relic in there from the time of their own creation, held in a flame that does not go out, and Freewind Post has been working at thinning the clan for a long time without much to show for it.",
		},
	},
	{
		name = "Roguefeather Den", parent = "Thousand Needles", faction = "Hostile",
		hook = "A harpy den in the canyon walls.",
		lore = {
			"Roguefeather Den holds a harpy population in the canyon's cliffs, and they raid the roads below.",
			"Harpies, centaur and tauren have been fighting over Thousand Needles longer than any of them can account for, and the canyon has not changed hands.",
		},
	},
	{
		name = "The Screeching Canyon", parent = "Thousand Needles", faction = "Hostile",
		hook = "A side canyon full of harpies, named for the noise.",
		lore = {
			"The Screeching Canyon is a harpy concentration in the north of the zone, named descriptively.",
			"It sits near the route to the Great Lift, so it is everyone's problem.",
		},
	},
	{
		name = "Whitereach Post", parent = "Thousand Needles", faction = "Hostile",
		hook = "A centaur outpost on the eastern road.",
		lore = {
			"Whitereach Post is a Galak centaur position watching the road toward the Shimmering Flats.",
			"The Galak are the dominant clan in eastern Thousand Needles and the tauren's main opponent here.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- DESOLACE
-- ---------------------------------------------------------------------------

Zone{
	name = "Desolace", continent = KA, faction = "Contested", levels = "30-40",
	hook = "A dead grey plain that was forest once, with a demon coven in the middle and kodo going there to die.",
	lore = {
		"Desolace earns its name. It is a grey, stony waste on Kalimdor's western coast. It was not always like this. The accounts differ on exactly what killed it, but the land here was green within the span of night elf memory.",
		"Two centaur clans hold most of it: the Magram and the Gelkis, who hate each other. Their war is hereditary. Centaur descend from Zaetar, son of the demigod Cenarius, and Theradras, a princess of the earth elementals, and the clans are named for Zaetar's sons. Theradras is still alive, in Maraudon, with her consort's remains.",
		"In the south sits the Mannoroc Coven, where demons left over from the Third War are still active and the Burning Blade cult works alongside them. Thunder Axe Fortress is in Burning Blade hands too. The Kodo Graveyard in the east is where Kalimdor's kodo go when they are dying, as close to peaceful as this zone gets.",
	},
	didYouKnow = "Maraudon, the cave in Desolace's hills, is a demigod's tomb. Zaetar's remains are inside, and Princess Theradras has kept them there and turned the caverns into something that is neither elemental nor natural.",
	readMore = { "Wowpedia: Desolace", "Wowpedia: Maraudon", "Wowpedia: Theradras" },
}

SubsOf("Desolace", {
	{
		name = "Nijel's Point", faction = "Alliance", levels = "30-40",
		hook = "An Alliance outpost in the northern mountains of Desolace.",
		lore = {
			"Nijel's Point shelters Alliance soldiers and members of the Cenarion Circle. Captain Pentigast watches the wars between the centaur clans.",
			"He fears that the victorious clan will threaten Alliance strongholds. To learn how to defeat the centaurs, he seeks an alliance with one clan against another.",
		},
		readMore = { "Wowpedia: Nijel's Point", "Wowpedia: Brutal Politics", "Wowpedia: Strange Alliance" },
	},
	{
		name = "Shadowprey Village", faction = "Horde", levels = "30-40",
		hook = "A Darkspear troll village on the western coast, facing the naga.",
		lore = {
			"Shadowprey is a Darkspear settlement on Desolace's coast, and its chief concern is the naga who have established themselves offshore and on the beaches.",
			"Naga were night elves once, highborne of Queen Azshara's court who were transformed when the Well of Eternity collapsed and the sea took Zin-Azshari. They have been under the water for ten thousand years and they are coming back up.",
		},
	},
	{
		name = "Maraudon", parent = "Desolace", faction = "Hostile", levels = "45-55",
		hook = "A cave system that is also a demigod's tomb and an elemental princess's home.",
		lore = {
			"Maraudon holds the body of Zaetar, son of Cenarius. Zaetar fathered the centaur with Princess Theradras of the earth elementals, and the centaur killed him at birth.",
			"The centaur hold his remains to this day, and Theradras has been down in these caverns ever since. She is an elemental force of earth with the Old Gods somewhere behind her, and the place has become a strange hybrid of elemental earth and corrupted nature. The centaur consider it their point of origin.",
			"The Cenarion Circle has an interest in recovering what is left of Zaetar. Theradras has a different view.",
		},
		readMore = { "Wowpedia: Maraudon", "Wowpedia: Zaetar" },
	},
	{
		name = "Mannoroc Coven", parent = "Desolace", faction = "Hostile",
		hook = "A demon camp left standing after the Third War ended.",
		lore = {
			"The Mannoroc Coven is a Burning Legion site in southern Desolace, named for the pit lord Mannoroth. Demons have held it since the Third War.",
			"The Legion was defeated at Mount Hyjal but not removed. Pockets like this one survived across Kalimdor and the Burning Blade cult has been working with them.",
		},
	},
	{
		name = "Thunder Axe Fortress", parent = "Desolace", faction = "Hostile",
		hook = "A fortress held by the Burning Blade, in the middle of the zone.",
		lore = {
			"Thunder Axe Fortress is a Burning Blade stronghold: orcs pursuing demonic power inside a zone that already has demons in it.",
			"The cult's presence in Desolace is better organised than elsewhere, probably because the Mannoroc Coven gives them something to organise around.",
		},
	},
	{
		name = "Kodo Graveyard", parent = "Desolace", faction = "Contested",
		hook = "Where Kalimdor's kodo go to die, and something is interfering with it.",
		lore = {
			"Kodo travel to this place when they are dying. The behaviour is real, and the tauren treat it with reverence.",
			"The bones are being carted off. A goblin at Kormek's Hut on the road north buys them ten at a time and a caravan takes them to the coast, where they are made into furniture, instruments and blasting powder. Kodo are central to tauren life and this is their animals' resting place, so the trade is not a small thing to them.",
		},
	},
	{
		name = "Magram Village", parent = "Desolace", faction = "Hostile",
		hook = "One of the two warring centaur clans' villages.",
		lore = {
			"The Magram hold the eastern plains and are at war with the Gelkis in the hills. The feud goes back to Zaetar's sons.",
			"The tauren and the Alliance have both tried playing the clans against each other, with some success and no lasting benefit.",
		},
	},
	{
		name = "Gelkis Village", parent = "Desolace", faction = "Hostile",
		hook = "The Gelkis clan's village, built around a ravine off the road.",
		lore = {
			"The Gelkis hold a ravine in Desolace's south-west, close to the coast and beside the road. The village is built in a ring around the drop, and Khan Shaka keeps to a cave in the cliff face.",
			"The Gelkis and the Magram both claim descent from Zaetar and hate each other for it. There are four centaur clans in this zone, and Maraudon belongs to a third of them, the Maraudine.",
		},
	},
	{
		name = "Sar'theris Strand", parent = "Desolace", faction = "Hostile",
		hook = "A northern beach held by naga.",
		lore = {
			"Sar'theris Strand is naga-held coastline, and the ruins along it are night elf work from before the Sundering.",
			"The naga returning to these beaches are, in a sense, coming home. That is what makes it so unsettling for the night elves.",
		},
	},
	{
		name = "Ethel Rethor", parent = "Desolace", faction = "Hostile",
		hook = "Night elf ruins on the coast, now naga ground.",
		lore = {
			"Ethel Rethor is another pre-Sundering night elf site on Desolace's coast, and the naga have taken it.",
			"The density of ancient ruins in a zone this dead is a reminder that Desolace was not always worth nothing.",
		},
	},
	{
		name = "Valley of Bones", parent = "Desolace", faction = "Contested",
		hook = "A valley of bleached bones on the southern road.",
		lore = {
			"The Valley of Bones is exactly that, and it sits on the route south out of Desolace. What walks among the bones is undead, and the ghosts are Magram: the centaur clan's own dead, haunting a valley the living Magram will not go into.",
			"Both sides have taken an interest for their own reasons. The Scarlet Crusade uses the valley as a proving ground for recruits, and a goblin in Gadgetzan wants the ghost energy bottled, on the grounds that the Magram will pay a great deal to have their ancestors taken away.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- DUSTWALLOW MARSH
-- ---------------------------------------------------------------------------

Zone{
	name = "Dustwallow Marsh", continent = KA, faction = "Contested", levels = "35-45",
	hook = "A humid swamp holding Jaina Proudmoore's city, an ogre kingdom and a black dragon's lair.",
	lore = {
		"Dustwallow Marsh is the swamp on Kalimdor's eastern coast, and where the Alliance's human presence on this continent lives. Theramore Isle was founded by Jaina Proudmoore with the survivors of the refugee fleet she led out of Lordaeron during the Third War.",
		"Jaina is the most important moderate in the world. She fought alongside Thrall at Mount Hyjal, she maintains direct contact with him, and when her own father Admiral Daelin Proudmoore sailed to Kalimdor and attacked the Horde against her wishes, she let him lose. He died at Theramore's gates. She has been holding the peace with the Horde ever since at considerable personal cost.",
		"The swamp also holds Onyxia's Lair. Onyxia is a daughter of Deathwing, and she has denned within easy reach of Theramore. The black dragonflight does not go in for open assault, so a lair placed next to the Alliance's only real city on this continent is worth thinking about.",
	},
	didYouKnow = "Theramore exists because Medivh, freed from Sargeras and acting as a prophet, told Jaina to take her people west. The city is the direct result of the warning that also produced the alliance at Mount Hyjal.",
	readMore = { "Wowpedia: Dustwallow Marsh", "Wowpedia: Theramore Isle", "Wowpedia: Jaina Proudmoore" },
}

SubsOf("Dustwallow Marsh", {
	{
		name = "Theramore Isle", faction = "Alliance", levels = "35-45",
		hook = "Jaina Proudmoore's city, the Alliance's only real holding in Kalimdor outside the night elf lands.",
		lore = {
			"Theramore was built by the refugees Jaina led out of Lordaeron when the plague took it. It is a walled port on an island in the marsh, and the seat of Jaina's authority as Lady of Theramore.",
			"Politically it is the most interesting city in the world. Jaina maintains working communication with Thrall, she has Kirin Tor credentials, and she is simultaneously an Alliance leader and the main reason Kalimdor is not at total war.",
			"Her position is not popular with everyone. Her father died attacking the Horde she refuses to fight, and there are people in Theramore who have not forgiven her for letting it happen.",
		},
		readMore = { "Wowpedia: Theramore Isle" },
	},
	{
		name = "Brackenwall Village", faction = "Horde", levels = "35-45",
		hook = "An ogre village that joined the Horde, in the middle of a swamp.",
		lore = {
			"Brackenwall is held by the Stonemaul ogres, who allied with Thrall's Horde. Ogre clans joining the Horde voluntarily is unusual, and the Stonemaul did it after Rexxar helped them deal with their own leadership problem.",
			"The village is the Horde's base in Dustwallow and the counterweight to Theramore across the marsh.",
		},
	},
	{
		name = "Onyxia's Lair", parent = "Dustwallow Marsh", faction = "Hostile", levels = "60",
		hook = "A cave in the marsh holding Onyxia, a daughter of Deathwing.",
		lore = {
			"Onyxia is a black dragon and a daughter of Deathwing, and this is her lair: a cave in Dustwallow Marsh, well hidden and well guarded.",
			"The black dragonflight does not fight the mortal kingdoms head-on. Deathwing's brood works by placement and patience, and where one of them settles usually says more than what it does once it has settled.",
			"Her brother Nefarian holds the upper reaches of Blackrock Spire and is running something comparable from there. The two of them are the most active of Deathwing's children, and they work apart.",
		},
		didYouKnow = "Deathwing was Neltharion the Earth-Warder once, one of the five Aspects and the guardian of the world's deep places, before the Old Gods got to him. His children inherited the ruin of that rather than the office.",
		readMore = { "Wowpedia: Onyxia", "Wowpedia: Deathwing", "Wowpedia: Black dragonflight" },
	},
	{
		name = "Alcaz Island", parent = "Dustwallow Marsh", faction = "Hostile",
		hook = "An island off the coast, held by naga, with a goblin scientist living among them.",
		lore = {
			"Alcaz Island sits off Dustwallow's eastern shore and the Strashaz naga hold it, under Tidelord Rrurgaz. Their myrmidons, serpent guards, sirens and hydras are a match for a party rather than a person, so nobody visits casually.",
			"Doctor Weavil is also on the island, with his flying machine and a crew of minions, and the naga have not moved him off. What outsiders come for is the bloodkelp the naga keep in baskets there, and the going rate for fetching it is high.",
		},
	},
	{
		name = "Stonemaul Ruins", parent = "Dustwallow Marsh", faction = "Hostile",
		hook = "The Stonemaul ogres' former home, occupied by Firemane dragonkin.",
		lore = {
			"The Stonemaul held this settlement before black dragons drove them out. Mok'Morokk led the survivors to Brackenwall Village, leaving their old home to the Firemane dragonkin.",
			"Tharg still calls the ruins home and wants to fight for them. Rexxar's choice of Mok'Morokk as leader has not persuaded every ogre to accept the retreat.",
		},
		readMore = { "Wowpedia: Stonemaul Ruins", "Wowpedia: Overlord Mok'Morokk's Concern", "Wowpedia: Army of the Black Dragon" },
	},
	{
		name = "Witch Hill", parent = "Dustwallow Marsh", faction = "Hostile",
		hook = "A hill in the northern marsh with a grim reputation and a worse resident.",
		lore = {
			"Witch Hill is a local landmark with the sort of name that gets earned. The marsh's undead and its stranger inhabitants concentrate here.",
			"Dustwallow has a scattering of sites like this: isolated, unexplained and left alone by both factions.",
		},
	},
	{
		name = "The Den of Flame", parent = "Dustwallow Marsh", faction = "Hostile",
		hook = "A cave of black dragonkin, in Onyxia's neighbourhood.",
		lore = {
			"The Den of Flame holds black dragonkin, which in Dustwallow means Onyxia's brood and servants.",
			"The black flight's presence in this marsh is substantial and deliberate. It is not an accident that Onyxia chose a lair next door to the Alliance's Kalimdor capital.",
		},
	},
	{
		name = "Sentry Point", parent = "Dustwallow Marsh", faction = "Alliance",
		hook = "A Theramore watchpost on the northern road.",
		lore = {
			"Sentry Point watches the road into Theramore from the north and the Barrens beyond it.",
			"Theramore's outposts are sparse. Jaina's city is strong and her hinterland is not.",
		},
	},
	{
		name = "Bluefen", parent = "Dustwallow Marsh", faction = "Contested",
		hook = "A stretch of open marsh in the north, full of things that bite.",
		lore = {
			"Bluefen is the northern marsh, between Brackenwall and the Barrens road. Crocolisks and worse live in it.",
			"The marsh's wildlife is one of the main reasons Dustwallow has stayed thinly settled by both factions.",
		},
	},
	{
		name = "Lost Point", parent = "Dustwallow Marsh", faction = "Hostile",
		hook = "An abandoned Theramore watchtower occupied by deserters.",
		lore = {
			"Lost Point is a ruined watchtower in western Dustwallow Marsh. Deserters from Theramore have taken shelter here under Balos Jacken.",
			"Theramore's officers want information from their lieutenant. The outpost is part of an investigation into the deserters' activities in the marsh.",
		},
		readMore = { "Wowpedia: Lost Point" },
	},
	{
		name = "Darkmist Cavern", parent = "Dustwallow Marsh", faction = "Hostile",
		hook = "A spider cave in the eastern marsh.",
		lore = {
			"Darkmist Cavern holds a large spider population, and Dustwallow's spiders run to size.",
			"The marsh's caves are numerous and most of them hold something worth avoiding.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- FERALAS
-- ---------------------------------------------------------------------------

Zone{
	name = "Feralas", continent = KA, faction = "Contested", levels = "40-50",
	hook = "Deep jungle hiding Eldre'Thalas, where a sect of night elves locked themselves in with a demon and a library.",
	lore = {
		"Feralas is dense temperate jungle in southwestern Kalimdor, and among the least disturbed places on the continent. The night elves hold Feathermoon Stronghold on an island off the coast, the Horde keeps Camp Mojache inland, and most of the zone belongs to gorillas, yeti, harpies and the Woodpaw gnolls.",
		"The reason to come here is Dire Maul. Its real name is Eldre'Thalas, one of the night elf empire's great cities, built around a branch of the Highborne's magical scholarship. When the Sundering came, the Shen'dralar sect of highborne sealed themselves inside with their library rather than give up the arcane.",
		"They survived, after a fashion. For ten thousand years the Shen'dralar have been in there, sustaining themselves by feeding on a bound demon and guarding the largest collection of pre-Sundering knowledge in existence. The ogres have taken most of the city around them. The Shen'dralar are still in the middle of it, still reading.",
	},
	didYouKnow = "The night elves outlawed arcane magic after the Sundering, and the Shen'dralar simply refused. They are the only highborne who never gave it up and never left Kalimdor, and Darnassus has spent ten thousand years pretending they do not exist.",
	readMore = { "Wowpedia: Feralas", "Wowpedia: Dire Maul", "Wowpedia: Shen'dralar" },
}

SubsOf("Feralas", {
	{
		name = "Feathermoon Stronghold", faction = "Alliance", levels = "40-50",
		hook = "A Sentinel fortress on an island, commanding the night elves' southern reach.",
		lore = {
			"Feathermoon Stronghold sits on its own island off Feralas' western coast and is the Sentinels' main base in the south. Sardor Isle lies further out, and the Hatecrest naga on it are the stronghold's nearest problem. Shandris Feathermoon commands here, and Tyrande Whisperwind raised her.",
			"Shandris was Tyrande Whisperwind's ward, orphaned in the War of the Ancients, and she is the Sentinel army's most capable field commander. Her presence here marks how seriously Darnassus takes Feralas.",
		},
	},
	{
		name = "Camp Mojache", faction = "Horde", levels = "40-50",
		hook = "A tauren camp in the jungle, dealing with gnolls and a very old ruin.",
		lore = {
			"Camp Mojache is the Horde's position in Feralas: a tauren camp in the east of the zone above Wildwind Lake, with braves on the approaches and a wind rider master inside.",
			"Its practical concerns are the Woodpaw gnolls, the Grimtotem in their compound to the west, whatever the ogres at Dire Maul are doing, and the silithid that have come up next to the camp itself.",
		},
	},
	{
		name = "Dire Maul", parent = "Feralas", faction = "Hostile", levels = "55-60",
		hook = "A night elf city turned ogre capital, with a sealed library at its heart.",
		lore = {
			"Eldre'Thalas was a night elf city and a centre of Highborne magical study. The Sundering left it stranded, and the Shen'dralar sect sealed themselves in rather than abandon the arcane.",
			"The Gordok ogres have taken the city. They are the dominant ogre power in Kalimdor and Dire Maul is their capital in all but name. An ogre king holds court in the ruins of one of the night elves' greatest libraries.",
			"Deep inside, the Shen'dralar persist. They have kept themselves alive by draining a bound demon for ten millennia, and will trade access to their library to outsiders who prove useful. It is the single richest source of pre-Sundering knowledge anybody can actually reach.",
		},
		readMore = { "Wowpedia: Dire Maul", "Wowpedia: Eldre'Thalas" },
	},
	{
		name = "The Twin Colossals", parent = "Feralas", faction = "Contested",
		hook = "Two enormous peaks in the north, with Rexxar camped at the foot of one.",
		lore = {
			"The Twin Colossals are the two great mountains in northern Feralas, and the route between them is the land link toward Desolace.",
			"Rexxar is here, with Misha beside him, at the base of the western peak. He holds no post and runs no camp: he is simply out here, as far from either capital as Kalimdor allows.",
			"Northspring harpies nest on the slopes above, groddoc apes and rage scar yetis hold the ground below, and the Grimtotem that this place is often credited with are a mile south, west of Camp Mojache.",
		},
	},
	{
		name = "Thalanaar", faction = "Alliance", levels = "40-45",
		hook = "A night elf outpost on the eastern border, beside a sacred spring.",
		lore = {
			"Thalanaar guards the pass between Feralas and Thousand Needles and sits beside a spring the night elves hold sacred.",
			"It is the Alliance's gateway into Feralas by land, and the only Alliance position in the zone that is not on an island.",
		},
	},
	{
		name = "Ruins of Isildien", parent = "Feralas", faction = "Hostile",
		hook = "Night elf ruins in the central jungle, held by centaur.",
		lore = {
			"Isildien was a night elf settlement, and the centaur have taken the ruins.",
			"Feralas is dotted with night elf ruins the way Darkshore and Ashenvale are. The empire covered all of this.",
		},
	},
	{
		name = "Ruins of Solarsal", parent = "Feralas", faction = "Contested",
		hook = "A night elf ruin on the coast, half in the water.",
		lore = {
			"Solarsal is a coastal ruin showing exactly where the waterline used to be before the Sundering raised the sea.",
			"The night elves have an active interest in these sites and a very limited capacity to protect them.",
		},
	},
	{
		name = "Ruins of Ravenwind", parent = "Feralas", faction = "Hostile",
		hook = "Ancient night elf ruins in northern Feralas, held by Northspring harpies.",
		lore = {
			"The Ruins of Ravenwind lie in northern Feralas. Northspring harpies occupy the broken buildings and surrounding ground.",
			"An altar and four magical flames remain among the ruins. They are part of a mystery surrounding an ancient staff found in Feralas.",
		},
		readMore = { "Wowpedia: Ruins of Ravenwind", "Wowpedia: The Stave of Equinex" },
	},
	{
		name = "The Dream Bough", parent = "Feralas", faction = "Hostile",
		hook = "The fourth Emerald Dream portal, guarded and hostile.",
		lore = {
			"The Dream Bough is the last of the four Dream portals, with Seradane, Bough Shadow and Twilight Grove.",
			"Like the others it is guarded by a green dragon who has gone wrong. Whatever is happening in the Emerald Dream is happening at all four gates at once.",
		},
	},
	{
		name = "Woodpaw Hills", parent = "Feralas", faction = "Hostile",
		hook = "Gnoll country in the southern jungle.",
		lore = {
			"The Woodpaw gnolls hold the southern hills and are the most numerous hostile population in Feralas.",
			"They are better organised than gnolls usually manage, and Camp Mojache suspects somebody else is giving them direction.",
		},
	},
	{
		name = "Rage Scar Hold", parent = "Feralas", faction = "Hostile",
		hook = "A yeti cave in the northern highlands.",
		lore = {
			"Rage Scar Hold is a yeti den. Feralas' yeti are large, numerous and bad-tempered even by yeti standards.",
			"The zone's wildlife is its real population. Both factions' outposts here are small by comparison.",
		},
	},
	{
		name = "Lariss Pavilion", parent = "Feralas", faction = "Contested",
		hook = "A night elf pavilion by a waterfall, still standing.",
		lore = {
			"Lariss Pavilion is one of the better-preserved night elf structures in Feralas, beside a waterfall in the eastern jungle.",
			"It shows what these ruins looked like intact, and that makes it the most melancholy spot in the zone.",
		},
	},
	{
		name = "Isle of Dread", parent = "Feralas", faction = "Hostile",
		hook = "An island of very large wildlife off the western coast.",
		lore = {
			"The Isle of Dread lies off Feralas' western coast, south of Sardor Isle, and what is on it is chimaera. The chimaerok of this island are far heavier than the mainland sort and they have the run of it, though the Hatecrest naga have cut Shalzaru's Lair into the northern end.",
			"Sailors named it, not scholars, and nobody has surveyed it properly since. The one thing anybody comes out here for is chimaerok meat, which cooks into the best food on the market.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- TANARIS
-- ---------------------------------------------------------------------------

Zone{
	name = "Tanaris", continent = KA, faction = "Contested", levels = "40-50",
	hook = "A desert of goblin ports and troll pyramids, with a sealed titan city at the far end.",
	lore = {
		"Tanaris is the great desert of southern Kalimdor, and in practice a goblin zone. Gadgetzan is a Steamwheedle Cartel town, neutral and thoroughly commercial, and Steamwheedle Port on the coast is its sister operation. Southsea pirates work the beaches.",
		"The desert's older business is troll and titan. Zul'Farrak in the west is a Sandfury troll city, built around a stepped pyramid, and the Sandfury are desert trolls with their own gods and no interest in either faction. The ruins scattered across the sands, Eastmoon, Southmoon and Noonshade, are older still.",
		"At the southeastern edge stand the Gates of Uldum, an enormous titan structure sealed shut. Nobody has opened it. The Explorers' League would like to, and whatever the titans put behind those doors has been sitting there since before there were mortals on this world to wonder about it.",
	},
	didYouKnow = "Uldum and Uldaman share a naming pattern, and both are titan installations. The dwarves' discovery at Uldaman suggests the titans left records of everything they built here. Uldum is still closed.",
	readMore = { "Wowpedia: Tanaris", "Wowpedia: Uldum", "Wowpedia: Zul'Farrak" },
}

SubsOf("Tanaris", {
	{
		name = "Gadgetzan", faction = "Neutral", levels = "40-50",
		hook = "A goblin town in the desert, neutral and relentlessly commercial.",
		lore = {
			"Gadgetzan is a Steamwheedle Cartel town in the middle of Tanaris, and the hub for everything happening in the desert. It has an inn, a flight path, an auction house and bruisers to keep the peace.",
			"Goblin neutrality is the reason the place works. Alliance and Horde both use Gadgetzan, and the cartel's only rule is that nobody fights on the premises.",
		},
	},
	{
		name = "Zul'Farrak", parent = "Tanaris", faction = "Hostile", levels = "42-50",
		hook = "A Sandfury troll city built around a pyramid, with something very large in the water.",
		lore = {
			"Zul'Farrak is the Sandfury tribe's city in western Tanaris, centred on a stepped pyramid and a sacrificial pool. The Sandfury are desert trolls, a separate branch from the jungle and forest tribes.",
			"They keep a creature called Gahz'rilla, a hydra they revere as a god and summon, and they carve ornaments in its image out of an element the goblins have named gahz'ridian after it. Troll religion works. That is the recurring difficulty with troll cities.",
			"Two things in the city draw outsiders. Sergeant Bly's band of ill-reputed treasure hunters went in on their own account and are still in there, and the trolls hold tablets of the prophecy of Mosh'aru. Those bear on Hakkar, and they are wanted by people a long way from Tanaris.",
		},
		readMore = { "Wowpedia: Zul'Farrak", "Wowpedia: Sandfury" },
	},
	{
		name = "Gates of Uldum", parent = "Tanaris", faction = "Contested",
		hook = "An enormous sealed titan door at the desert's edge, and nobody has got it open.",
		lore = {
			"The Gates of Uldum are a titan structure in southeastern Tanaris: colossal doors flanked by watchers, shut tight.",
			"After Uldaman, Ironforge knows what titan installations contain: records, machinery and the history of how this world was shaped. Uldum is presumably the same and much larger.",
			"The Explorers' League has a camp nearby and no way in. The watchers at the gate are still functioning and still following their original instructions.",
		},
	},
	{
		name = "Steamwheedle Port", parent = "Tanaris", faction = "Neutral",
		hook = "A goblin port on the eastern coast of Tanaris, paying pirates who keep raiding it.",
		lore = {
			"Steamwheedle Port belongs to the neutral Steamwheedle Cartel. Its shipping connects it with Booty Bay, and pirates have obtained detailed schedules of those journeys.",
			"The cartel pays protection money to the Southsea pirates, but the raids continue. Security Chief Bilgewhizzle must stay in town to keep the peace, so he recruits adventurers to deal with the pirates at Lost Rigger Cove.",
		},
		readMore = { "Wowpedia: Steamwheedle Port", "Wowpedia: Ship Schedules", "Wowpedia: Southsea Shakedown" },
	},
	{
		name = "Lost Rigger Cove", parent = "Tanaris", faction = "Hostile",
		hook = "A pirate harbour on the eastern coast.",
		lore = {
			"Lost Rigger Cove is the Southsea pirates' base in Tanaris: a working pirate port rather than a hideout.",
			"The Steamwheedle Cartel would like it gone. The pirates are, inconveniently, also customers.",
		},
	},
	{
		name = "The Noxious Lair", parent = "Tanaris", faction = "Hostile",
		hook = "A silithid hive in the eastern desert.",
		lore = {
			"The Noxious Lair is a silithid colony. Silithid are insectoid, they are spreading across southern Kalimdor, and they answer to something in Silithus.",
			"Their appearance in Tanaris, Un'Goro and the Barrens is not three separate infestations. It is one expansion.",
		},
	},
	{
		name = "Dunemaul Compound", parent = "Tanaris", faction = "Hostile",
		hook = "An ogre camp in the southern desert.",
		lore = {
			"The Dunemaul ogres hold ground in southern Tanaris, where they raid the roads and the goblin traffic.",
			"Ogres in a desert are a poor fit and the Dunemaul have adapted badly. They are no less dangerous for it.",
		},
	},
	{
		name = "Valley of the Watchers", parent = "Tanaris", faction = "Contested",
		hook = "A valley of colossal statues on the approach to Uldum.",
		lore = {
			"The Valley of the Watchers leads toward the Gates of Uldum, lined with enormous titan-made figures.",
			"The statues are still intact after an unguessable span of time, as is everything else titan-built on this world.",
		},
	},
	{
		name = "Eastmoon Ruins", parent = "Tanaris", faction = "Hostile",
		hook = "Ruins in the eastern sands, with troll scavengers in them.",
		lore = {
			"Eastmoon is one of a set of ruins across Tanaris, with Southmoon and Noonshade, whose builders are not clearly identified.",
			"The Sandfury trolls use them. Whether they built them is a separate question the trolls are not answering.",
		},
	},
	{
		name = "Abyssal Sands", parent = "Tanaris", faction = "Hostile",
		hook = "An open stretch of sand where elementals have broken through.",
		lore = {
			"The Abyssal Sands hold elemental incursions, which in Tanaris means the planes pressing close to the surface.",
			"Kalimdor has a number of these thin places. The Cenarion Circle and the Horde's shaman both monitor them.",
		},
	},
	{
		name = "Thistleshrub Valley", parent = "Tanaris", faction = "Contested",
		hook = "A valley of hostile desert plants.",
		lore = {
			"Thistleshrub Valley is full of animated plant life that has adapted to the desert and is unpleasant about it. The things are called gnarled thistleshrubs and thistleshrub rootshapers, and they are big enough that Gadgetzan's own prospectors will not walk in.",
			"What is in there that anybody wants is a cactus. One goblin has been trying to get a look at it for a while and keeps sending other people to clear his way.",
		},
	},
	{
		name = "Land's End Beach", parent = "Tanaris", faction = "Contested",
		hook = "The southern shore of Kalimdor, with nothing beyond it.",
		lore = {
			"Land's End Beach is the southern edge of the continent. Past here is the Great Sea.",
			"It is one of the few places on either continent where you can stand at the actual end of the known map.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- AZSHARA
-- ---------------------------------------------------------------------------

Zone{
	name = "Azshara", continent = KA, faction = "Contested", levels = "45-55",
	hook = "The queen's own country, named for the night elf ruler whose vanity broke the world.",
	lore = {
		"Azshara is named for Queen Azshara, who ruled the night elf empire at its height and destroyed it. Her palace at Zin-Azshari stood in this region, and her court of highborne nobles was the centre of a civilisation that had grown reckless with the arcane.",
		"Azshara made contact with Sargeras. She and her court worked to bring the Burning Legion into this world, drawing on the Well of Eternity, and the War of the Ancients followed. When the Well collapsed, the resulting Sundering blew Kalimdor apart and sank her palace beneath the sea.",
		"She did not die. Azshara and her closest followers were transformed into the naga, and they have been under the water ever since. The ruins along this coast, Eldarath and the rest, are her empire's remains, and the naga coming ashore here are the locals, returning.",
	},
	didYouKnow = "The Maelstrom at the centre of the world is where the Well of Eternity was. The Sundering did not just break the continent; it left a permanent hole in the ocean that is still turning.",
	readMore = { "Wowpedia: Azshara", "Wowpedia: Queen Azshara", "Wowpedia: War of the Ancients" },
}

SubsOf("Azshara", {
	{
		name = "Talrendis Point", faction = "Alliance", levels = "45-55",
		hook = "A night elf outpost watching the ruins of their own empire.",
		lore = {
			"Talrendis Point is the night elves' position in Azshara, and a small one. The zone is enormous and the Sentinels hold a single camp.",
			"For night elves this ground is uniquely uncomfortable. It is where their civilisation's worst decision was made, and the naga crawling out of the water are their own relatives.",
		},
	},
	{
		name = "Valormok", faction = "Horde", levels = "45-55",
		hook = "A Horde camp in the hills, mostly interested in what the elves left behind.",
		lore = {
			"Valormok is the Horde's outpost in Azshara, and its interests are practical: the zone's resources and whatever can be learned from its ruins.",
			"The Horde has no stake in the night elves' history here, so they dig in places the night elves will not.",
		},
	},
	{
		name = "Ruins of Eldarath", parent = "Azshara", faction = "Hostile",
		hook = "An ancient night elf city in Azshara, occupied by the Spitelash naga.",
		lore = {
			"The Ruins of Eldarath lie in central Azshara. Spitelash naga hold the fallen city, with Warlord Krellian based in the Temple of Zin-Malor.",
			"Ancient mages left tablets here recording their knowledge of the arcane. Researchers from the Explorers' League seek rubbings of these inscriptions despite the naga occupation.",
		},
		readMore = { "Wowpedia: Ruins of Eldarath", "Wowpedia: Arcane Runes" },
	},
	{
		name = "Temple of Arkkoran", parent = "Azshara", faction = "Hostile",
		hook = "A temple of Elune on the shore, with a sea giant sitting at the top of it.",
		lore = {
			"The Temple of Arkkoran was built as a temple of Elune, on Azshara's north-eastern shore. The night elves do not hold it any more.",
			"What is in it is the sea giant Arkkoroc, who sits on the top level with murlocs and makrura guarding the way up. The shore around the temple has hydras and more sea giants on it. A temple of the moon goddess with a sea giant installed at the top is the kind of thing Azshara is full of, and nobody has come to do anything about it.",
		},
	},
	{
		name = "Legash Encampment", parent = "Azshara", faction = "Hostile",
		hook = "A satyr camp in the northern hills.",
		lore = {
			"The Legash satyrs hold ground in northern Azshara, among the ruins of the empire their ancestors betrayed.",
			"Satyrs are drawn to night elf sites. The night elves regard this as deliberate and probably correct.",
		},
	},
	{
		name = "Haldarr Encampment", parent = "Azshara", faction = "Hostile",
		hook = "Another satyr camp, in the southwest.",
		lore = {
			"The Haldarr satyrs hold the zone's southwestern approach, close to the route in from Ashenvale.",
			"Azshara has several satyr clans, more than most zones, and the region's history explains why.",
		},
	},
	{
		name = "Thalassian Base Camp", parent = "Azshara", faction = "Hostile",
		hook = "A high elf camp with its own agenda.",
		lore = {
			"The elves at this camp are Thalassian, out of Quel'Thalas, and not working with the Alliance.",
			"Quel'Thalas was destroyed by Arthas and the Scourge, and the surviving elves' relationship with their old allies has not recovered. Camps like this one operate on their own account.",
		},
	},
	{
		name = "Bear's Head", parent = "Azshara", faction = "Contested",
		hook = "A rock formation in the northern hills, and a furbolg site.",
		lore = {
			"Bear's Head is a landmark in northern Azshara with a furbolg presence around it.",
			"The zone's furbolgs are in better condition than those in Felwood and Ashenvale, which is a low bar.",
		},
	},
	{
		name = "Bitter Reaches", parent = "Azshara", faction = "Hostile",
		hook = "Remote ground in northeastern Azshara, with giants along its northern edge.",
		lore = {
			"The Bitter Reaches lie in northeastern Azshara. Hippogryphs, oozes and chimaeras inhabit the area, while powerful mountain giants occupy its northern edge.",
		},
		readMore = { "Wowpedia: Bitter Reaches" },
	},
	{
		name = "Forlorn Ridge", parent = "Azshara", faction = "Hostile",
		hook = "The mountain that dominates the western half of the zone.",
		lore = {
			"Forlorn Ridge is the great mountain of western Azshara. It is rock rather than a settlement, and the zone's inhabitants are around its foot rather than on it.",
			"The satyr encampments are inland of it, the naga hold the shore, and the ruins of the night elf empire run along the coast. Azshara is mostly somebody else's wreckage, and the ridge is the ground it lies on.",
		},
	},
	{
		name = "Lake Mennar", parent = "Azshara", faction = "Contested",
		hook = "A lake in the eastern hills, ringed by blue dragonkin.",
		lore = {
			"Lake Mennar sits in the hills above the coast, and the ground on every side of it belongs to the blue dragonflight. Scalebanes and mageweavers hold the perimeter, with magelords behind them, and all of them are stronger than anything else in the zone.",
			"The water itself is clear. Getting to it is the difficulty, and this is one of very few places outside Northrend where the blue flight keeps a holding at all.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- FELWOOD
-- ---------------------------------------------------------------------------

Zone{
	name = "Felwood", continent = KA, faction = "Contested", levels = "48-55",
	hook = "A forest poisoned by the Legion's defeat, with a demon cult named after the Legion's commander.",
	lore = {
		"Felwood was part of Ashenvale's forest and it is now the most thoroughly corrupted land in Kalimdor. The cause was the Third War: when the Burning Legion was broken at Mount Hyjal, the demonic energy in this region did not disperse. It soaked into the ground.",
		"What grew out of that is a forest where the trees, the water and the wildlife are all tainted. Furbolgs of the Deadwood and Felpaw tribes have been driven mad by it. Worse, the Jaedenar cult, named for Kil'jaeden, the Legion's chief architect, has set up at Shadow Hold and is working to deepen the corruption on purpose.",
		"Two things hold out. The Timbermaw furbolgs in their hold have stayed clean and will deal with outsiders who earn it, and the Cenarion Circle's Emerald Sanctuary is attempting restoration. Both are small operations in a very large sick forest.",
	},
	didYouKnow = "Kil'jaeden, whom the Jaedenar cult is named for, is the demon who found the orcs on Draenor, corrupted Ner'zhul, and set the whole chain of events in motion that brought the Horde to this world. He was not at Mount Hyjal. He is still out there.",
	readMore = { "Wowpedia: Felwood", "Wowpedia: Timbermaw Hold", "Wowpedia: Jaedenar" },
}

SubsOf("Felwood", {
	{
		name = "Emerald Sanctuary", faction = "Neutral", levels = "48-55",
		hook = "The Cenarion Circle's attempt to heal a forest that is actively getting worse.",
		lore = {
			"The Emerald Sanctuary is a druid camp in southern Felwood, run by the Cenarion Circle, and its purpose is restoration.",
			"The Circle is the order of druids founded on Cenarius' teaching, and after the Third War it opened to tauren as well as night elves. The work in Felwood is its largest ongoing project and it is not winning.",
		},
	},
	{
		name = "Timbermaw Hold", faction = "Neutral", levels = "48-60",
		hook = "A furbolg tunnel-hold that stayed sane, and the only road between three zones.",
		lore = {
			"The Timbermaw are the furbolg tribe that resisted the corruption, and their hold is a tunnel complex connecting Felwood, Winterspring and Moonglade.",
			"They are suspicious of everyone, with reason: most of their kin have gone mad and most outsiders have treated furbolgs as monsters. Earning their trust takes real effort and it is the only way to use their tunnels.",
		},
		didYouKnow = "Furbolgs were long-standing allies of the night elves before the corruption spread. The Timbermaw are what the whole race used to be.",
	},
	{
		name = "Jaedenar", parent = "Felwood", faction = "Hostile",
		hook = "A Shadow Council stronghold in the corrupted forests of Felwood.",
		lore = {
			"The Shadow Council occupies Jaedenar's ruins and corrupted barrow dens. Its cultists plot with the Burning Legion, while demons move among them.",
			"Shadow Hold lies deep within the settlement. Magical braziers protect the Council's lair from attempts to spy on its activities.",
		},
		readMore = { "Wowpedia: Jaedenar", "Wowpedia: Forces of Jaedenar (Classic)", "Wowpedia: Collection of the Corrupt Water" },
	},
	{
		name = "Shadow Hold", parent = "Felwood", faction = "Hostile",
		hook = "The Shadow Council's underground stronghold within Jaedenar.",
		lore = {
			"Shadow Hold lies beneath Jaedenar in western Felwood. Warlocks and their demonic servants occupy its passages, including the dreadlord Lord Banehollow.",
			"Magical braziers shield the stronghold from attempts to spy on it. Investigators seek a way to extinguish those protections and expose the Council's activities.",
		},
		readMore = { "Wowpedia: Shadow Hold", "Wowpedia: Dousing the Flames of Protection (Classic)", "Wowpedia: Lord Banehollow (Classic)" },
	},
	{
		name = "Deadwood Village", parent = "Felwood", faction = "Hostile",
		hook = "A furbolg village lost to the corruption.",
		lore = {
			"The Deadwood furbolgs have gone over completely and now practise demonic rituals of their own.",
			"They are the clearest illustration of what Felwood does to anything living in it long enough.",
		},
	},
	{
		name = "Felpaw Village", parent = "Felwood", faction = "Hostile",
		hook = "A corrupted furbolg village in the far north, at Timbermaw Hold's door.",
		lore = {
			"Felpaw Village belongs to the Deadwood, the furbolg tribe just past Timbermaw Hold that the fel has corrupted and driven mad, and Chieftain Bloodmaw holds it.",
			"The Timbermaw want them driven back rather than talked round, and they count the headdress feathers of the fallen as proof of the work. The wolves and ravagers in the same woods carry the village's name.",
		},
	},
	{
		name = "Irontree Woods", parent = "Felwood", faction = "Hostile",
		hook = "Northern woods where the trees themselves have turned.",
		lore = {
			"The Irontree Woods hold corrupted treants and worse. When Felwood's taint reaches plant life that was already sentient, the result is a hostile forest in the literal sense.",
			"The Cenarion Circle finds this the most disturbing part of the zone, because treants were allies.",
		},
	},
	{
		name = "Shatter Scar Vale", parent = "Felwood", faction = "Hostile",
		hook = "A scarred stretch of Felwood where infernals fell during the Third War.",
		lore = {
			"Shatter Scar Vale lies north of Bloodvenom Falls, east of the road through Felwood. Infernals called down during the Third War left the craters that mark its ground.",
			"Demons still inhabit the vale. Researchers want to know whether entropic elementals remain there and whether corrupted water still fills the craters.",
		},
		readMore = { "Wowpedia: Shatter Scar Vale", "Wowpedia: Verifying the Corruption" },
	},
	{
		name = "Ruins of Constellas", parent = "Felwood", faction = "Hostile",
		hook = "A night elf ruin with a corrupted moonwell in it, worked by satyrs.",
		lore = {
			"Constellas was a night elf site in forest the night elves held, and Felwood's corruption took it along with everything around it. The Jadefire satyrs hold the ruins now, under one called Xavathras, and they spread the disease to whatever they meet.",
			"The moonwell is the reason the place matters. A moonwell was a symbol of renewal, and this one is corrupted and bringing forth more satyrs. The Emerald Circle wants Constellas back and says plainly that this land was once theirs.",
		},
	},
	{
		name = "Talonbranch Glade", faction = "Alliance", levels = "48-55",
		hook = "A night elf camp near the Timbermaw tunnels.",
		lore = {
			"Talonbranch Glade is a small night elf position in northern Felwood, high up and close to the route through to Winterspring.",
			"It is a waypoint rather than a garrison, and the hippogryphs are the point of it. What is here besides the flight master is a druid trainer, a hunter trainer with his own cat, a pet trainer and two merchants, which is more than the glade's size suggests.",
		},
	},
	{
		name = "Bloodvenom Post", faction = "Horde", levels = "48-55",
		hook = "A Horde camp in the corrupted forest, mostly there for the road.",
		lore = {
			"Bloodvenom Post is the Horde's waypoint in Felwood, supporting traffic between Ashenvale, Winterspring and the Timbermaw tunnels.",
			"Neither faction wants Felwood. Both want the roads through it.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- UN'GORO CRATER
-- ---------------------------------------------------------------------------

Zone{
	name = "Un'Goro Crater", continent = KA, faction = "Contested", levels = "48-55",
	hook = "A walled jungle crater full of dinosaurs, ringed by crystal pylons nobody can explain.",
	lore = {
		"Un'Goro Crater is a vast depression in southern Kalimdor, walled all the way around, holding a jungle ecology that exists nowhere else. The crater has devilsaurs, pterrordax and tar pits: an isolated pocket of something much older than the desert around it.",
		"Three crystal pylons stand on rises at the crater's northern, eastern and western edges. Nobody knows who put them there. They respond to the crystals that turn up all over the crater floor, they do something when fed, and that is the full extent of what anyone has established about them.",
		"Marshal's Refuge is camped inside, a mixed expedition of explorers and biologists under Williden Marshal, trying to work out what the pylons do. The Slithering Scar in the south is a silithid hive connecting toward Silithus. Whatever is in Silithus has a way in here.",
	},
	didYouKnow = "Un'Goro is walled all the way round and holds plants and animals found nowhere else on the continent. Whether the crater produced them or preserved them from something older is the question the expedition would most like answered.",
	readMore = { "Wowpedia: Un'Goro Crater" },
}

SubsOf("Un'Goro Crater", {
	{
		name = "Marshal's Refuge", faction = "Neutral", levels = "48-55",
		hook = "A dwarf and gnome expedition camped in a crater full of dinosaurs.",
		lore = {
			"Marshal's Refuge is the research camp inside Un'Goro, and Williden Marshal, who leads it, calls his people a non-aligned expedition troupe. They are nobody's envoys: not the Explorers' League, not Gadgetzan, not either faction.",
			"They are studying the three pylons and the crater's power crystals, which J.D. Collie works on in the cave. The expedition underestimated Un'Goro and has been driven back to this one hole in the rock, where Gadgetzan bruisers keep order and a hippogryph will carry anybody out who has had enough.",
		},
	},
	{
		name = "Fire Plume Ridge", parent = "Un'Goro Crater", faction = "Hostile",
		hook = "A volcanic ridge at the crater's centre, with fire elementals on it.",
		lore = {
			"Fire Plume Ridge is the volcano at the crater's centre, and still active. Fire elementals and worse have taken up residence on its slopes.",
			"The volcano may be what keeps the crater warm enough for the jungle. Nobody at Marshal's Refuge will commit to it.",
		},
	},
	{
		name = "The Slithering Scar", parent = "Un'Goro Crater", faction = "Hostile",
		hook = "A silithid hive in the crater's south, connected to something worse.",
		lore = {
			"The Slithering Scar is a silithid colony inside Un'Goro, and the silithid are not native to the crater's ecology.",
			"They came from Silithus, and the tunnels run both ways. The crater's isolation has been breached by the one thing in Kalimdor that nobody wants loose.",
		},
	},
	{
		name = "Lakkari Tar Pits", parent = "Un'Goro Crater", faction = "Hostile",
		hook = "Tar pits in the north of the crater, with the tar itself walking about.",
		lore = {
			"The Lakkari Tar Pits are natural asphalt seeps a short way south of Marshal's Refuge, and they have trapped a fair share of the crater's wildlife over time, and old bones stand up out of the surface.",
			"Some of the tar has got up and moved off. Tar beasts, creepers, lurkers and lords are all elementals of the stuff, and they are what a traveller meets at the pits rather than anything that drowned in them.",
		},
	},
	{
		name = "Golakka Hot Springs", parent = "Un'Goro Crater", faction = "Contested",
		hook = "Hot springs in the northwest, with elementals in the water.",
		lore = {
			"The Golakka Hot Springs are geothermal pools on the crater's western side.",
			"Together with Fire Plume Ridge they suggest the crater sits on something volcanically active, which may be why a jungle survives here in the middle of a desert belt.",
		},
	},
	{
		name = "Terror Run", parent = "Un'Goro Crater", faction = "Hostile",
		hook = "Devilsaur country in the south, and the name is advice.",
		lore = {
			"Terror Run is where the crater's devilsaurs range. Devilsaurs are enormous predatory dinosaurs, and nothing else in Un'Goro comes close to them.",
			"Marshal's Refuge's standing instruction is to avoid the south. It is not followed often enough.",
		},
	},
	{
		name = "Northern Pylon", parent = "Un'Goro Crater", faction = "Contested",
		hook = "One of three crystal pylons standing on the crater rim.",
		lore = {
			"The Northern Pylon is one of three crystal pylons standing on the crater's rim. They react to the crystals found on the crater floor, and the expedition has been feeding them samples to see what happens.",
			"What they are for is unknown, and so is who built them. The guesses at Marshal's Refuge run from measuring instruments to something holding the crater shut, and nobody likes the second one.",
		},
	},
	{
		name = "Ironstone Plateau", parent = "Un'Goro Crater", faction = "Hostile",
		hook = "A raised plateau in the east, held by stone creatures.",
		lore = {
			"The Ironstone Plateau is high ground in eastern Un'Goro with an elemental and stone-creature population.",
			"Un'Goro has elemental activity out of all proportion to its size: fire on the ridge, earth on this plateau, water at the springs. The expedition has not worked out whether that is cause or effect.",
		},
	},
	{
		name = "Fungal Rock", parent = "Un'Goro Crater", faction = "Hostile",
		hook = "A cave of enormous fungi and the things that live in them.",
		lore = {
			"Fungal Rock is a cave on the crater's western side, dense with oversized fungal growth.",
			"The crater's plant life is as unusual as its animals, and the expedition's botanists are as busy as its palaeontologists.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- WINTERSPRING
-- ---------------------------------------------------------------------------

Zone{
	name = "Winterspring", continent = KA, faction = "Contested", levels = "55-60",
	hook = "A frozen valley in northern Kalimdor, with a goblin boom town and the Blue Dragonflight's interest.",
	lore = {
		"Winterspring is the snow country in Kalimdor's far north, reachable through the Timbermaw tunnels or the long way around. It is cold, high and thinly populated, and most of it belongs to the wildlife: frostsabers, yeti, chimaera and owlbeasts.",
		"Everlook is the only town, a Steamwheedle Cartel operation like Gadgetzan and Ratchet. Neutral, commercial, and improbably busy for a place this remote.",
		"The zone's deeper business is draconic and elven. Mazthoril, the deep icy cavern in the middle of the zone near Lake Kel'Theril, holds blue dragons, and the blue dragonflight is the flight of magic, led by Malygos the Spell-Weaver, who has not been coherent since Deathwing's betrayal of the Aspects. The night elves maintain Starfall Village, and the frostsaber pride out at Frostsaber Rock in the west is tied to the night elves' own history with the great cats.",
	},
	didYouKnow = "Night elves ride frostsabers, and the relationship is not domestication. The frostsaber pride in Winterspring has to be earned, cat by cat, by anyone who wants to ride one.",
	readMore = { "Wowpedia: Winterspring", "Wowpedia: Malygos" },
}

SubsOf("Winterspring", {
	{
		name = "Everlook", faction = "Neutral", levels = "55-60",
		hook = "A goblin town in the snow, selling to anyone who gets this far north.",
		lore = {
			"Everlook is the Steamwheedle Cartel's northern outpost and the only settlement of any size in Winterspring. An inn, an auctioneer, a stable, fifteen bruisers to keep order, and two flight masters: a hippogryph for one side and a wind rider for the other, standing within sight of each other.",
			"The cartel put a town here because the zone has resources and nobody else was going to. Goblin commercial instinct is the only thing that reliably reaches Kalimdor's extremities.",
		},
	},
	{
		name = "Starfall Village", faction = "Alliance", levels = "55-60",
		hook = "A night elf village northwest of Everlook, with explorers among its residents.",
		lore = {
			"Starfall Village stands along the main road northwest of Everlook. Its buildings include a night elf lodge, a smaller house and the Ban'Thallow Barrow Den.",
			"Wynd Nightchaser knows the surrounding ruins, while Jaron Stoneshaper, a member of the Explorers' League, has visited Kel'Theril. The village is a place to ask about what lies beneath Winterspring's snow.",
		},
		readMore = { "Wowpedia: Starfall Village", "Wowpedia: Starfall", "Wowpedia: The Ruins of Kel'Theril (Classic)" },
	},
	{
		name = "Mazthoril", parent = "Winterspring", faction = "Hostile",
		hook = "An icy cavern in central Winterspring, held by the blue dragonflight.",
		lore = {
			"Mazthoril lies near Lake Kel'Theril in central Winterspring. Blue dragonkin occupy the cavern and its approaches.",
			"Haleh, their matron, can be reached through cobalt runes on the cavern floor. Visitors seeking her must first pass through the dragons' domain.",
		},
		readMore = { "Wowpedia: Mazthoril", "Wowpedia: The Matron Protectorate" },
	},
	{
		name = "Frostsaber Rock", parent = "Winterspring", faction = "Contested",
		hook = "The frostsaber pride's territory in the western mountains.",
		lore = {
			"Frostsaber Rock is where Winterspring's frostsaber pride lives. The great cats here are wild and the night elves' relationship with them is one of negotiation rather than ownership.",
			"Earning a frostsaber's trust is a long piece of work. The night elves consider that appropriate.",
		},
	},
	{
		name = "Winterfall Village", parent = "Winterspring", faction = "Hostile",
		hook = "A furbolg village in the north, corrupted by something in the water.",
		lore = {
			"The Winterfall furbolgs have turned hostile, and the cause appears to be a tainted substance they have been drinking.",
			"It is a milder version of what happened in Felwood, and the Timbermaw are watching it with obvious alarm.",
		},
	},
	{
		name = "Darkwhisper Gorge", parent = "Winterspring", faction = "Hostile",
		hook = "A gorge in the far south, full of demons, leading toward Hyjal.",
		lore = {
			"Darkwhisper Gorge is a demon-held canyon in southern Winterspring, and the worst corner of the zone by a distance.",
			"It sits on the approach to Mount Hyjal, which is not accessible from here in any ordinary sense. The demons in the gorge are Legion remnants from the Third War that nobody has cleared.",
		},
	},
	{
		name = "Ice Thistle Hills", parent = "Winterspring", faction = "Hostile",
		hook = "Yeti country in the eastern hills.",
		lore = {
			"The Ice Thistle Hills hold Winterspring's main yeti population, large even by yeti standards.",
			"The zone's wildlife is its dominant feature. Everlook's economy runs substantially on what can be taken off it.",
		},
	},
	{
		name = "Frostwhisper Gorge", parent = "Winterspring", faction = "Hostile",
		hook = "A frozen gorge in the west, held by ice creatures.",
		lore = {
			"Frostwhisper Gorge is an elemental site, with ice and water elementals holding the valley.",
			"Kalimdor's elemental incursions are not confined to fire and earth, and the north has its own version.",
		},
	},
	{
		name = "Lake Kel'Theril", parent = "Winterspring", faction = "Hostile",
		hook = "A frozen lake over a night elf ruin, with its dead still on the ice.",
		lore = {
			"Kel'Theril was a night elf site, and the lake froze over it. The spirits of the night elves who died here are still present.",
			"They died in the War of the Ancients era, in fighting among the night elves themselves over the arcane. Even this far north, the empire's collapse left bodies.",
		},
	},
	{
		name = "Owl Wing Thicket", parent = "Winterspring", faction = "Hostile",
		hook = "Owlbeast caves in southern Winterspring, watched by a night elf researcher.",
		lore = {
			"Owl Wing Thicket lies in southern Winterspring. Wildkin inhabit the caves and the ground around them.",
			"Ranshalla is studying the site and believes an altar of Elune stands at the top of the ridge. She seeks help investigating its torches and inscriptions.",
		},
		readMore = { "Wowpedia: Owl Wing Thicket", "Wowpedia: Guardians of the Altar", "Wowpedia: Find Ranshalla" },
	},
})

-- ---------------------------------------------------------------------------
-- SILITHUS
-- ---------------------------------------------------------------------------

Zone{
	name = "Silithus", continent = KA, faction = "Contested", levels = "55-60",
	hook = "A desert of insect hives over the prison of an Old God, and the wall holding it shut is failing.",
	lore = {
		"Silithus is the sand-blasted southwestern corner of Kalimdor, and the most dangerous zone in the world for reasons that are buried rather than visible. Beneath Ahn'Qiraj lies C'Thun, one of the Old Gods: ancient horrors the titans fought, could not kill, and imprisoned in the deep places of this world.",
		"The qiraji, C'Thun's insectoid servants, came out of Ahn'Qiraj once already. The War of the Shifting Sands was fought here between the qiraji and an alliance of night elves and the bronze dragonflight. It was brutal. The night elves won at enormous cost and sealed the Scarab Wall, locking the qiraji in with the Scepter of the Shifting Sands as the key.",
		"The seal is failing. Silithid are spreading into Tanaris, Un'Goro and the Barrens, the Twilight Hammer cult has camps all over the zone working to help C'Thun along, and the Cenarion Circle has established Cenarion Hold because somebody has to be here. The scepter was broken and scattered, and reassembling it to open the gates deliberately is now being discussed as the better option.",
	},
	didYouKnow = "Fandral Staghelm's son Valstann died in the War of the Shifting Sands, and Fandral has never recovered from it. The archdruid who pushed hardest for Teldrassil and the night elves' lost immortality is the same man who lost his son to the qiraji in this desert.",
	readMore = { "Wowpedia: Silithus", "Wowpedia: Ahn'Qiraj", "Wowpedia: C'Thun", "Wowpedia: War of the Shifting Sands" },
}

SubsOf("Silithus", {
	{
		name = "Cenarion Hold", faction = "Neutral", levels = "55-60",
		hook = "The Cenarion Circle's stronghold against the silithid in Silithus.",
		lore = {
			"Cenarion Hold is the Cenarion Circle's fortified settlement in Silithus. It recruits both Alliance and Horde adventurers to fight the expanding silithid threat.",
			"The hold also investigates the Twilight's Hammer. Geologist Larksbane seeks fragments of a tablet from a ruined cultist camp to the northwest.",
			"Commander Mar'alith's soldiers are spread thin. Alongside his duties at the outpost, he is searching for his missing wife, Natalia.",
		},
		readMore = { "Wowpedia: Cenarion Hold", "Wowpedia: Taking Back Silithus (Alliance)", "Wowpedia: Taking Back Silithus (Horde)", "Wowpedia: The Twilight Mystery", "Wowpedia: Dearest Natalia" },
	},
	{
		name = "Ahn'Qiraj", parent = "Silithus", faction = "Hostile", levels = "60",
		hook = "The qiraji city beyond the Scarab Wall, with an Old God beneath it.",
		lore = {
			"Ahn'Qiraj lies at the southern end of Silithus. Its qiraji serve C'Thun, the Old God beneath the city.",
			"At the end of the War of the Shifting Sands, the night elves and the dragonflights sealed the qiraji behind the Scarab Wall. The ruins and temple beyond the wall still hold the forces of that ancient enemy.",
		},
		readMore = { "Wowpedia: Ahn'Qiraj", "Wowpedia: The War of the Shifting Sands (short story)" },
	},
	{
		name = "The Scarab Wall", parent = "Silithus", faction = "Contested",
		hook = "The wall that has kept the qiraji in for a thousand years.",
		lore = {
			"The Scarab Wall and the Gates of Ahn'Qiraj were raised by the night elves and the bronze dragonflight to seal the qiraji inside their own city.",
			"The Scepter of the Shifting Sands is the key. It was broken and its pieces scattered, partly to make sure nobody opened the gates casually, and reassembling it is now a live project.",
			"Opening the gates on purpose, with an army ready, is being argued as better than waiting for the qiraji to come out on their own schedule.",
		},
	},
	{
		name = "Hive'Ashi", parent = "Silithus", faction = "Hostile",
		hook = "A silithid hive in northern Silithus.",
		lore = {
			"Hive'Ashi is one of the three silithid hives in the open desert, alongside Hive'Regal and Hive'Zora. Its insects also infest the nearby Swarming Pillar.",
		},
		readMore = { "Wowpedia: Hive'Ashi" },
	},
	{
		name = "Hive'Regal", parent = "Silithus", faction = "Hostile",
		hook = "A silithid hive in southern Silithus, watched by Cenarion scouts.",
		lore = {
			"Hive'Regal is one of the three silithid hives in the open desert of Silithus. Its tunnels extend beneath the southern sands.",
			"Cenarion Scout Landion has been watching the hive's movements. The Cenarion Circle seeks his written report before acting on what he has learned.",
		},
		readMore = { "Wowpedia: Hive'Regal", "Wowpedia: Hive'Regal Scout Report (quest)" },
	},
	{
		name = "Hive'Zora", parent = "Silithus", faction = "Hostile",
		hook = "A silithid hive in western Silithus.",
		lore = {
			"Hive'Zora lies in western Silithus. Silithid tunnelers, wasps and reavers occupy the hive.",
			"Cenarion Scout Azenel watches the insects' movements from within. The Cenarion Circle sends adventurers to collect her report.",
		},
		readMore = { "Wowpedia: Hive'Zora", "Wowpedia: Hive'Zora Scout Report (quest)" },
	},
	{
		name = "Twilight Base Camp", parent = "Silithus", faction = "Hostile",
		hook = "A Twilight Hammer camp, working to help an Old God out of its prison.",
		lore = {
			"The Twilight Hammer maintain several camps across Silithus, and their goal is explicit: they want C'Thun free.",
			"The cult worships the Old Gods and believes the world should end. They are not negotiating and they have been at this since before anyone was paying attention.",
		},
	},
	{
		name = "Southwind Village", parent = "Silithus", faction = "Hostile",
		hook = "A ruined night elf settlement in Silithus, haunted by its former defenders.",
		lore = {
			"Southwind Village was once a night elf base in Silithus. Silithids overran it, and the tortured spirits of druids and sentinels now wander its ruins.",
			"Layo Starstrike sends adventurers from Valor's Rest to investigate the village and release the suffering spirits.",
		},
		readMore = { "Wowpedia: Southwind Village", "Wowpedia: The Spirits of Southwind" },
	},
	{
		name = "Valor's Rest", parent = "Silithus", faction = "Contested",
		hook = "A memorial to the night elves who died sealing the gates.",
		lore = {
			"Valor's Rest honours the dead of the War of the Shifting Sands, the night elves and dragons who fought the qiraji to a standstill and paid for the seal with their lives.",
			"It is a thousand years old and the war it commemorates is about to restart.",
		},
	},
	{
		name = "Bronzebeard Encampment", parent = "Silithus", faction = "Neutral",
		hook = "A dwarven research camp studying the silithid hives.",
		lore = {
			"Bronzebeard Encampment stands in southern Silithus, east of the Scarab Wall. Rutgar Glyphshaper and Frankal Stonebridge work here.",
			"Rutgar needs rubbings of the glyphs on crystals inside the three silithid hives. Frankal is gathering material for an elixir he hopes will help decipher the language.",
			"The researchers also have information about the missing Natalia. Commander Mar'alith sends adventurers from Cenarion Hold to question them.",
		},
		readMore = { "Wowpedia: Bronzebeard Encampment", "Wowpedia: Glyph Chasing", "Wowpedia: Breaking the Code", "Wowpedia: Dearest Natalia" },
	},
	{
		name = "The Crystal Vale", parent = "Silithus", faction = "Contested",
		hook = "A crystal formation in the north, and one of the few clean places left.",
		lore = {
			"The Crystal Vale is a formation in northern Silithus that the silithid have not taken.",
			"It is visibly different from the rest of the zone, and the Cenarion Circle watches it closely for signs of change.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- MOONGLADE
-- ---------------------------------------------------------------------------

Zone{
	name = "Moonglade", continent = KA, faction = "Neutral", levels = "Any",
	hook = "A sanctuary shared by tauren and night elf druids.",
	lore = {
		"Moonglade is a sheltered valley in northern Kalimdor and a home of the Cenarion Circle. The land route passes through Timbermaw Hold, while druids learn a spell that brings them directly to the glade.",
		"Keeper Remulos watches over the druids who hibernate here. Nighthaven welcomes tauren and night elves alike, and its wardens defend the settlement.",
		"That welcome does not mean the Circle is free of disagreements. Druid teachers speak of tensions between Remulos and Fandral Staghelm even as they send their pupils to train here.",
	},
	readMore = { "Wowpedia: Moonglade", "Wowpedia: Moonglade (Alliance)", "Wowpedia: Moonglade (Horde)" },
}

SubsOf("Moonglade", {
	{
		name = "Nighthaven", faction = "Neutral", levels = "Any",
		hook = "The druids' own village, where the factions' quarrels are left at the door.",
		lore = {
			"Nighthaven is the Cenarion Circle's village in Moonglade, with trainers, a flight path and the Circle's administration.",
			"It is genuinely shared. Night elf and tauren druids live and work here together, and the Circle's authority over its own members outranks either faction's.",
		},
	},
	{
		name = "Shrine of Remulos", parent = "Moonglade", faction = "Neutral",
		hook = "Keeper Remulos' seat, at the glade's heart.",
		lore = {
			"The shrine is where Remulos, son of Cenarius, holds court. He is a demigod and he is the Circle's direct link to what Cenarius taught.",
			"Cenarius himself is dead, killed in Ashenvale during the Third War. Remulos is what the mortal druids have left of that lineage.",
		},
	},
	{
		name = "Stormrage Barrow Dens", parent = "Moonglade", faction = "Neutral",
		hook = "Sacred druid barrow dens in Moonglade, named for Malfurion Stormrage.",
		lore = {
			"The Stormrage Barrow Dens lie in Moonglade. They are a resting place for night elf druids whose spirits enter the Emerald Dream.",
			"During the Third War, Tyrande Whisperwind sought Malfurion here while Tichondrius' forces threatened his sleeping body. His awakening brought him back to the fight against the Burning Legion.",
		},
		readMore = { "Wowpedia: Stormrage Barrow Dens", "Wowpedia: The Awakening of Stormrage (WC3 Night Elf)" },
	},
	{
		name = "Lake Elune'ara", parent = "Moonglade", faction = "Neutral",
		hook = "The lake at Moonglade's centre, named for the moon goddess.",
		lore = {
			"Lake Elune'ara is the water Moonglade is built around, and the night elves hold it sacred.",
			"The glade's protection is not just a treaty between factions. The place itself is warded, and the Circle maintains that.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- THE GATES OF AHN'QIRAJ
--
-- A top-level area in the client's AreaTable, so GetZoneText returns it rather
-- than Silithus. The addon had Ahn'Qiraj, the Ruins and the Temple, and not
-- the wall across the front of them.
-- ---------------------------------------------------------------------------

Zone{
	name = "Gates of Ahn'Qiraj", continent = KA, faction = "Contested", levels = "60",
	aliases = { "The Gates of Ahn'Qiraj", "Scarab Wall" },
	hook = "The wall the night elves and the dragonflights built to seal the qiraji in, and the gong that opens it.",
	lore = {
		"About a thousand years before the Dark Portal, the qiraji came out of Ahn'Qiraj in numbers nobody had imagined. That was the War of the Shifting Sands, and it went badly: the night elves were losing until the bronze dragonflight came in beside them, and even then the best available outcome was not victory.",
		"So they walled it up. The dragons and the night elves raised the Scarab Wall across the entrance and sealed the qiraji behind it, and Anachronos of the bronze flight handed the night elves the Scepter of the Shifting Sands, the key, so that the gates could be opened again if anyone ever needed to go in.",
		"Fandral Staghelm broke the scepter. His son Valstann had been killed in front of him during the war, and Anachronos put the key to that door in his hands. He took it, and then he broke it. The pieces were scattered.",
		"That is why the gates are still shut and why opening them is a project rather than a decision. The Scarab Gong stands at the wall, and ringing it requires the scepter whole again.",
	},
	didYouKnow = "The wall was built to hold, and it has held for a thousand years. What is behind it has not been idle: the qiraji answer to C'Thun, one of the Old Gods the titans buried rather than killed.",
	readMore = { "Wowpedia: Gates of Ahn'Qiraj", "Wowpedia: War of the Shifting Sands", "Wowpedia: Scepter of the Shifting Sands", "Wowpedia: Fandral Staghelm" },
}

-- ---------------------------------------------------------------------------
-- FROM THE AREA SWEEP
--
-- Places the client names that had no entry until tools/area-sweep.md went
-- looking. Background only; the Shady Rest has a vanilla quest chain attached
-- and what it uncovers is not given away here.
-- ---------------------------------------------------------------------------

SubsOf("Azshara", {
	{
		name = "Temple of Zin-Malor", parent = "Azshara", faction = "Hostile",
		hook = "A temple in the Ruins of Eldarath, occupied by Warlord Krellian.",
		lore = {
			"The Temple of Zin-Malor stands among the fallen night elf buildings of Eldarath in Azshara. Spitelash naga occupy the temple under Warlord Krellian.",
			"A mage's scrying has detected a powerful magical artifact in Krellian's possession. He seeks someone willing to confront the warlord and his guards.",
		},
		readMore = { "Wowpedia: Temple of Zin-Malor", "Wowpedia: Warlord Krellian (quest)" },
	},
})

SubsOf("The Barrens", {
	{
		name = "Bael Modan", parent = "The Barrens", faction = "Alliance",
		hook = "A dwarven excavation on land taken from the Stonespire tauren.",
		lore = {
			"Bael Modan is a dwarven dig in the southern Barrens, defended by a keep. The excavation is directed by Prospector Khazgorm, a member of the Explorers' League.",
			"Gann Stonespire says the dwarves killed or drove off many of his people and tore into their ancestral lands with machines and explosives. His attempts at diplomacy failed, and he now seeks help driving the excavators out.",
		},
		readMore = { "Wowpedia: Bael Modan", "Wowpedia: Gann's Reclamation" },
	},
})

SubsOf("Dustwallow Marsh", {
	{
		name = "Shady Rest Inn", parent = "Dustwallow Marsh", faction = "Contested",
		hook = "A burnt-out inn that very nearly started a war.",
		lore = {
			"The Shady Rest was an inn on the road through Dustwallow, and it was burned with people inside it. That is the whole of what is agreed.",
			"Everything else about it is contested, and the contest matters because of where it happened. Theramore is Jaina Proudmoore's city and the only human settlement on Kalimdor that has chosen to live alongside the Horde. Orgrimmar is a short way north.",
			"Jaina and Thrall both have more to lose from a war here than anyone else, and both know it. Finding out what actually happened at the inn is work somebody has to do on the ground.",
		},
		readMore = { "Wowpedia: Shady Rest Inn", "Wowpedia: Theramore Isle", "Wowpedia: Jaina Proudmoore" },
	},
	{
		name = "Emberstrife's Den", parent = "Dustwallow Marsh", faction = "Hostile",
		hook = "A cave in the marsh with a black dragon living in it.",
		lore = {
			"Emberstrife is a black dragon, and he keeps this cave in Dustwallow. The marsh has rather a lot of his kin: Onyxia's lair is here too, under Theramore's nose.",
			"The black dragonflight was Neltharion's, the Aspect of Earth, before Neltharion became Deathwing. The Old Gods got to him during the War of the Ancients and what he did with the Demon Soul broke the flights' alliance and nearly ended them.",
			"His brood has spent the time since working as infiltrators rather than as an army. That is the shape of every black dragon problem in the world.",
		},
		readMore = { "Wowpedia: Emberstrife", "Wowpedia: Black dragonflight", "Wowpedia: Neltharion" },
	},
})

SubsOf("Tanaris", {
	{
		name = "Uldum", parent = "Tanaris", faction = "Contested",
		hook = "A sealed titan city in the southern desert, with nobody inside who will open it.",
		lore = {
			"Uldum is one of the titan vaults, and its gate is shut. The other one known in this part of the world is Uldaman, dug into by the Explorers' League, and Uldum is larger.",
			"What Uldaman held was the Discs of Norgannon and the record of the earthen, the living-stone ancestors the dwarves descend from. A sealed vault on the same pattern is the single most interesting closed door on the continent to anybody in Ironforge.",
			"It has stayed closed. The constructs outside it are still at their posts, and they were not built to let visitors through.",
		},
		readMore = { "Wowpedia: Uldum", "Wowpedia: Uldaman", "Wowpedia: Titan" },
	},
})

SubsOf("Feralas", {
	{
		name = "Dream Bough", parent = "Feralas", faction = "Neutral",
		hook = "An Emerald Dream portal guarded by green dragons in northern Feralas.",
		lore = {
			"Dream Bough stands on a small island in Jademir Lake. A great tree shelters one of the portals to the Emerald Dream, and the green dragonflight guards the site.",
		},
		readMore = { "Wowpedia: Dream Bough" },
	},
	{
		name = "The Maul", parent = "Feralas", faction = "Hostile",
		hook = "An open arena among the ruins of Dire Maul.",
		lore = {
			"The Maul is a fighting pit outside the three dungeon wings of Dire Maul. Combat inside the arena is allowed even between members of the same faction.",
			"A tunnel on the western side leads past sleeping Gordok hyenas into the pit. Fighters can also drop into the arena from above, but the tunnel is the way out.",
		},
		readMore = { "Wowpedia: Maul (subzone)" },
	},
})

SubsOf("Desolace", {
	{
		name = "Valley of Spears", parent = "Desolace", faction = "Hostile",
		hook = "The Magram clan's hold, in a war that has outlasted every kingdom.",
		lore = {
			"The Valley of Spears belongs to the Magram, one of the centaur clans of Desolace. The Gelkis are the other one that counts here, and the two have been killing each other for longer than any human kingdom has existed.",
			"The centaur came from Zaetar, Cenarius's son, and Theradras, a princess of the earth elementals. Their children killed their father, and the centaur have held his remains ever since, down in Maraudon where Theradras is.",
			"The tauren have been driven across Kalimdor by centaur raiding for generations. That is a large part of why Thrall found them in the state he did when the Horde landed.",
		},
		readMore = { "Wowpedia: Magram", "Wowpedia: Centaur", "Wowpedia: Zaetar", "Wowpedia: Theradras" },
	},
	{
		name = "Kolkar Village", parent = "Desolace", faction = "Hostile",
		hook = "A Kolkar holding, from the clan that spread furthest.",
		lore = {
			"The Kolkar are the centaur clan the rest of Kalimdor meets most often. They are in Desolace, they are across the Barrens, and they are in Durotar. New orcs are sent to deal with them before anything else.",
			"All five clans trace to the same parents: Zaetar, son of Cenarius, and Theradras of the earth elementals. The clans are named for Zaetar's sons and they have been at war with each other since.",
			"A village rather than a camp suggests the Kolkar intend to stay in Desolace. The Magram and the Gelkis will have views.",
		},
		readMore = { "Wowpedia: Kolkar", "Wowpedia: Centaur" },
	},
})

SubsOf("Durotar", {
	{
		name = "The Den", parent = "Durotar", faction = "Horde",
		hook = "The cave new orcs and trolls come out of, in a land Thrall chose on purpose.",
		lore = {
			"The Den is where it starts. Durotar is named for Durotan, Thrall's father, chieftain of the Frostwolves and the orc who refused Gul'dan's bargain and was murdered for it.",
			"Thrall was born in internment. He grew up a slave in Aedelas Blackmoore's household, learned war from the man who meant to use him, escaped, found the Frostwolves and freed the camps. Then he took the Horde across the sea to found a nation somewhere nobody had a prior claim.",
			"He picked hard ground deliberately. Durotar is dry, thin and defensible, and the point was a homeland the orcs owed nobody for.",
		},
		readMore = { "Wowpedia: Durotar", "Wowpedia: Thrall", "Wowpedia: Durotan" },
	},
})

SubsOf("Ashenvale", {
	{
		name = "Demon Fall Ridge", parent = "Ashenvale", faction = "Hostile",
		hook = "Demon-held ground above Demon Fall Canyon, with a dreadlord at the bottom of a barrow den.",
		lore = {
			"The ridge sits west and above Demon Fall Canyon, and it is held by lesser demons, outside on the slopes and inside an abandoned barrow den cut into the side of it. Diathorus the Seeker is down in the deepest part: a dreadlord, and the one the demons in Ashenvale answer to.",
			"Dreadlords are nathrezim, and they do not fight wars so much as arrange them. They were the Legion's agents inside the Scourge, and Tichondrius was the one riding Arthas.",
			"A barrow den is the worst possible place to find them. Those are druidic, dug for sleeping in, and something has made itself at home in one.",
		},
		readMore = { "Wowpedia: Demon Fall Ridge", "Wowpedia: Nathrezim", "Wowpedia: Barrow Dens" },
	},
	{
		name = "The Dor'Danil Barrow Den", parent = "Ashenvale", faction = "Hostile",
		hook = "A druid resting place in Ashenvale, corrupted by Forsaken poison.",
		lore = {
			"The Dor'Danil Barrow Den lies south of Splintertree Post. Forsaken agents occupy the passages alongside the restless spirits of night elf druids.",
			"Kayneth Stillwind describes a vision of the druids poisoned by the undead, their spirits severed from their bodies and driven mad. He seeks help putting the den's former leaders to rest.",
		},
		readMore = { "Wowpedia: The Dor'Danil Barrow Den", "Wowpedia: Insane Druids" },
	},
})

SubsOf("The Barrens", {
	{
		name = "Shrine of the Fallen Warrior", parent = "The Barrens", faction = "Neutral",
		hook = "A memorial on a hill west of the Crossroads, and the only one here that is not fiction.",
		lore = {
			"This one is not lore. The Shrine of the Fallen Warrior is a real memorial, raised in the game for Michel Koiter, an artist who worked on World of Warcraft and died before it was released.",
			"The orc figure on the hill is his own beta character, copied exactly, and the initials MK are cut into the base of the obelisk. A spirit healer named Koiter stands in front of it.",
			"Everything else this addon has to say about the Barrens is made up by somebody. This is the one place in the zone where the grief is real, and it seemed worth saying so rather than inventing a story for it.",
		},
		readMore = { "Wowpedia: Shrine of the Fallen Warrior" },
	},
})

SubsOf("Silithus", {
	{
		name = "Twilight Outpost", parent = "Silithus", faction = "Hostile",
		hook = "A Twilight's Hammer camp in the desert, dug in over something they want let out.",
		lore = {
			"The Twilight's Hammer began as a Horde clan under Cho'gall in the Second War. What they are now is a doomsday cult that serves the Old Gods, and Silithus is where they have concentrated.",
			"The reason is underneath. Ahn'Qiraj holds C'Thun, one of the Old Gods the titans could not kill and settled for burying, and the qiraji are its army. The cult is not here to fight the qiraji.",
			"Their presence is the strongest argument anybody has for reopening the gates deliberately rather than waiting to see what comes through them. It is not a comfortable argument.",
		},
		readMore = { "Wowpedia: Twilight's Hammer", "Wowpedia: C'Thun", "Wowpedia: Ahn'Qiraj" },
	},
})

SubsOf("Desolace", {
	{
		name = "Ghost Walker Post", parent = "Desolace", faction = "Horde",
		hook = "A tauren camp in the worst country on the continent.",
		lore = {
			"Desolace earns the name. It is grey, broken, mostly dead ground, fought over by centaur clans who have been killing each other since their founding.",
			"The tauren are here anyway, and the reason is partly that the centaur are. Generations of centaur raiding drove the tauren across Kalimdor, and a camp in Desolace is a people who have decided to stop retreating.",
			"The Burning Blade and the Kolkar both hold ground within reach of the post, and neither is a problem that gets solved so much as held at arm's length. The post itself is small: a few braves, a macecrafter and a leatherworker, with the kodo graveyard away to the south and the dying animals walking past on their way to it.",
		},
		readMore = { "Wowpedia: Ghost Walker Post", "Wowpedia: Tauren", "Wowpedia: Centaur" },
	},
})

SubsOf("Durotar", {
	{
		name = "Razor Hill Barracks", parent = "Durotar", faction = "Horde",
		hook = "Where Durotar's defence is organised, which in this zone is not ceremonial.",
		lore = {
			"Razor Hill is the first real town new orcs reach, and the barracks is the part of it that matters. Durotar is bordered by the Kolkar centaur, harassed by the Burning Blade, and sits across a strait from a human city.",
			"The Burning Blade is the serious problem. They are orcs who kept the demonic bargain after Thrall renounced it, and a clan that still drinks from the Legion's cup inside his own borders is a direct challenge to what the new Horde claims to be.",
			"Thrall's whole case is that the orcs are no longer what Gul'dan made them. Durotar contains the counterexample.",
		},
		readMore = { "Wowpedia: Razor Hill", "Wowpedia: Burning Blade clan", "Wowpedia: Thrall" },
	},
})

-- Ashenvale, working down tools/coverage.md from the top.
SubsOf("Ashenvale", {
	{
		name = "Xavian", parent = "Ashenvale", faction = "Hostile",
		hook = "Satyr ground in an old night elf temple, named for the first satyr of all.",
		lore = {
			"Xavius was a night elf and one of Queen Azshara's counsellors, and he is the reason there is a Burning Legion in this world's history at all: he worked the portal at Zin-Azshari that let Sargeras's army through the Well of Eternity.",
			"Sargeras grew dissatisfied with him and made him into something else. Xavius became the first satyr, and every satyr since is descended from that act. They are night elves who took the bargain, and ten thousand years later they are still here.",
			"Xavian is one of three satyr holdings in Ashenvale, with Satyrnaar and Night Run, and it is the one where their leadership sits. The ruins they have made themselves at home in were a night elf temple.",
		},
		didYouKnow = "The satyrs are not invaders. They are the descendants of the night elves who went over during the War of the Ancients, which is why they are still in Kalimdor's forests arguing with the people they used to be.",
		readMore = { "Wowpedia: Xavian", "Wowpedia: Xavius", "Wowpedia: Satyr", "Wowpedia: War of the Ancients" },
	},
	{
		name = "The Zoram Strand", parent = "Ashenvale", faction = "Hostile",
		hook = "A beach in the north-west that used to be a city, until the Sundering put it under the sea.",
		lore = {
			"There was a night elf city here called Zoram. The Great Sundering destroyed it and most of it went down beneath the Veiled Sea, and what is left is a strip of beach with the coastline rearranged around it.",
			"The naga hold it now, and the wreckage along the shore is the evidence: ships broken up and sea creatures beached. The naga are the Highborne who went under with the Sundering and did not die, so their presence on the ruins of a drowned night elf city is a homecoming of a sort.",
			"Blackfathom Deeps opens off this strand, which was a temple of Elune before the water took it.",
		},
		readMore = { "Wowpedia: Zoram Strand", "Wowpedia: Great Sundering", "Wowpedia: Naga" },
	},
	{
		name = "Kargathia Keep", parent = "Ashenvale", faction = "Horde",
		hook = "The Warsong officers' stronghold, placed where Orgrimmar can reinforce it.",
		lore = {
			"Kargathia Keep sits in the eastern part of the Warsong lumber operation, near the Southfury River, and it is where the clan's officers work. The position is chosen: if Ashenvale turns into a proper war, reinforcements come up from Orgrimmar along this line.",
			"The name is Kargath Bladefist's. He was chieftain of the Shattered Hand, the orc who cut off his own shackled hand and replaced it with a blade, and the Old Horde treated him as a figure to live up to. Kargath in the Badlands and Bladefist Bay in Durotar carry the name too.",
			"Which is a particular choice for a logging camp in night elf country. The clan cutting Ashenvale down has named its command post after an orc famous for mutilating himself to get free.",
		},
		readMore = { "Wowpedia: Kargathia Keep", "Wowpedia: Kargath Bladefist", "Wowpedia: Warsong clan" },
	},
	{
		name = "The Ruins of Ordil'Aran", parent = "Ashenvale", faction = "Hostile",
		hook = "An old city in the north-west, fought over by a cult and then by furbolgs.",
		lore = {
			"Very little of Ordil'Aran is left. It was a night elf city once, north of Maestra's Post, and what survives is enough stonework to shelter in.",
			"The Cult of the Dark Strand made a base of it. They are Shadow Council work: night elves and others turned to the service of things that should not be served, operating inside Darnassus's own territory, and the Tower of Althalaxx further up the coast is the other end of the same problem.",
			"The Thistlefur furbolgs have since pushed them out and taken the ruins for themselves. The dead cultists are still lying about, and they give a reasonable idea of how that went.",
		},
		readMore = { "Wowpedia: Ruins of Ordil'Aran", "Wowpedia: Dark Strand", "Wowpedia: Thistlefur" },
	},
	{
		name = "Bloodtooth Camp", parent = "Ashenvale", faction = "Hostile",
		hook = "A furbolg camp west of the Falfarren, and the tribe in it has been got at.",
		lore = {
			"Ran Bloodtooth leads the furbolgs here, and they are corrupted. Every one of them is hostile, and that is not how furbolgs are supposed to be.",
			"The furbolgs were the night elves' oldest allies on this continent, and the collapse of that friendship is one of the quieter tragedies in Kalimdor. Tribe after tribe has been turned, and the night elves have gone from treating them as neighbours to treating them as a problem.",
			"Not all of them. The Timbermaw in the north are uncorrupted and still dealing with outsiders. They show what the rest have lost.",
		},
		readMore = { "Wowpedia: Bloodtooth Camp", "Wowpedia: Furbolg", "Wowpedia: Timbermaw Hold" },
	},
	{
		name = "Silverwind Refuge", parent = "Ashenvale", faction = "Alliance",
		hook = "A night elf position in south-central Ashenvale, north of Mystral Lake.",
		lore = {
			"Silverwind Refuge stands in south-central Ashenvale, north of Mystral Lake. It is night elf ground, Sentinel Velene Starstrike holds it, and the place is a proper settlement: a hunter trainer, a pet trainer, two alchemists, a herbalist, a skinner, a bowyer and a butcher, with Sentinels out of Astranaar standing guard.",
			"The lake below has turned. Its water elementals are befouled, they have come up in numbers, and they attack anything that goes near the water, which has stopped the traffic on the Talondeep Path. Splintertree Post has noticed the gazebo out on the water, and wants it quietly for the view it gives of this place. Foulweald furbolgs hold the woods on either side.",
			"That is Ashenvale as plainly as it can be put. The Warsong clan needs the timber, Darnassus will not sell it, and the two of them are settling the question a clearing at a time.",
		},
		readMore = { "Wowpedia: Velene Starstrike", "Wowpedia: Ashenvale", "Wowpedia: Warsong clan" },
	},
	{
		name = "Forest Song", parent = "Ashenvale", faction = "Neutral",
		hook = "An ancient night elf ruin in the north-east, and nearly empty.",
		lore = {
			"Forest Song is old night elf stonework in the north-east of Ashenvale, out past Satyrnaar and short of Bough Shadow. Hardly anybody is there.",
			"That corner of the forest is the worst of it. Satyrnaar and Xavian are both close, Bough Shadow has its own troubles, and the Warsong lumber operation is to the south. A ruin standing empty in the middle of that is not an accident.",
			"The Silverwing Sentinels hold what they can of Ashenvale, and what they can hold does not currently extend out here.",
		},
		readMore = { "Wowpedia: Forest Song", "Wowpedia: Ashenvale" },
	},
	{
		name = "The Shady Nook", parent = "Ashenvale", faction = "Neutral",
		hook = "A small valley with a family of bears in it, and nothing else going on.",
		lore = {
			"The Shady Nook is a hollow south of Raynewood Retreat with a cave in it and a few bears living there. That is the whole of it.",
			"Which is worth saying out loud. Ashenvale is a zone where nearly every named place is a front line, a cult site, a satyr holding or something that used to be a city, and this one is a dell with animals in it.",
			"The whole forest was like this once, before the Warsong came for the timber and the satyrs came out of the ruins. A hollow with bears in it is what Ashenvale is defending.",
		},
		readMore = { "Wowpedia: Shady Nook" },
	},
})

-- Mulgore, continuing down tools/coverage.md.
SubsOf("Mulgore", {
	{
		name = "Bael'dun Digsite", parent = "Mulgore", faction = "Hostile",
		hook = "A dwarven quarry cut into Mulgore, against every warning the tauren gave.",
		lore = {
			"Bael'dun diggers and appraisers are cutting a quarry north-west of Bloodhoof Village, and it is a large one rather than a trial trench. The dwarves do not dig idly: since Uldaman, Ironforge has believed its people were shaped from living stone by the titans, and every site is read as more of that record.",
			"Baine Bloodhoof warned them off. To the tauren the land is the Earth Mother, and hollowing it is no way to earn its teachings, and those are his own words. His other objection is practical: the digging will enrage the kodos of Mulgore.",
			"What he asks for is the diggers' picks, collected and taken to a forge and smashed, which is a restrained answer by the standards of this continent. The dwarves kept digging.",
		},
		didYouKnow = "Both sides are entirely sincere. The dwarves are looking for the origin of their own species and the tauren are watching foreigners tear open sacred ground. Neither reading leaves room for the other.",
		readMore = { "Wowpedia: Bael'dun Digsite", "Wowpedia: Bael Modan", "Wowpedia: Explorers' League" },
	},
	{
		name = "Kodo Rock", parent = "Mulgore", faction = "Horde",
		hook = "A stone near Camp Narache that tauren shaman are sent to find.",
		lore = {
			"Kodo Rock is a natural monument out east of Camp Narache, past the Brambleblade Ravine, and it is a shaman shrine.",
			"What young tauren shaman come here to do is drink the Earth Sapta, a brew only a few of their kind know how to make. It has to be taken in a holy place and nowhere else, which is why they are sent out to find this one.",
			"Shamanism among the tauren is not scholarship but a relationship with the land and the elements. Drinking the sapta binds the shaman's spirit to the element it was made for, and for the earth that means the mountains for strength and the plains for patience. Standing before the earth humbly is the whole of what is asked.",
		},
		readMore = { "Wowpedia: Kodo Rock", "Wowpedia: Camp Narache", "Wowpedia: Shaman" },
	},
	{
		name = "Skywatcher Plateau", parent = "Mulgore", faction = "Horde",
		era = "forever", spoiler = true,
		hook = "The Horde's airship landing for Zephras Isle, in north-western Mulgore.",
		lore = {
			"Skywatcher Plateau is where the Skyborne arrive. Their flying island hangs in Skywall, the Elemental Plane of Air, and the airships off its Valanaar skydocks come down here for anyone joining the Horde; the Alliance berth lands at Dalaran instead.",
			"The Skyborne are high elves descended from Eldre'Thalas, which is Dire Maul. Their ancestors fled Prince Tortheldrin, bargained with wind spirits, and have spent ten thousand years off this world entirely.",
			"Mulgore is a strange place to come back to. The tauren built nothing like an airship and wanted nothing like one, and the plateau is now the point where the oldest shamanic people on Kalimdor meet a people who have been living inside an elemental plane.",
		},
		readMore = { "Wowpedia: Skyborne", "Wowpedia: Zephras Isle", "Wowpedia: Mulgore" },
	},
	{
		name = "Camp Gev'rek", parent = "Mulgore", faction = "Horde",
		era = "forever", spoiler = true,
		hook = "The Earthen Ring's camp on top of the plateau, and where the Windshapers came into the Horde.",
		lore = {
			"Camp Gev'rek stands on Skywatcher Plateau, above the berth where the Skyborne airships come down. The Earthen Ring holds it: shaman who deal with the elements directly rather than through any temple, Rimblat Earthshatter among them.",
			"They are here for the Windshapers. Of the three Skyborne orders that one descends from Eldre'Thalas' ordinary citizens instead of its magisters, and it is the order that has thrown in with the Horde. The Earthen Ring brought them in.",
			"Put the two together and the pairing explains itself. One side has spent its existence listening to elementals on this world. The other spent ten thousand years inside the Plane of Air, asking wind spirits for the magic that held their islands up, and has now watched those spirits leave.",
		},
		didYouKnow = "This is less an alliance than a landing. Anvilas and Siroccas are already breaking up and Zephras is going the same way, so the Windshapers are not negotiating from strength. What they have to offer is ten thousand years of knowing how to talk to air.",
		readMore = { "Wowpedia: Earthen Ring", "Wowpedia: Skyborne", "Wowpedia: Zephras Isle" },
	},
	{
		name = "Gloomrise", parent = "Mulgore", faction = "Hostile",
		era = "forever", spoiler = true,
		hook = "High ground in northern Mulgore where the spiders have crystal in them and the tauren dead are talking.",
		lore = {
			"The spiders own the Gloomrise. Hatchlings and soldiers are ordinary enough for Mulgore, and the spinners are not: whatever has got into them has left crystal behind.",
			"Tauren dead walk the rise alongside them, and they are not silent. What comes out of them is not threat or challenge. It is pleading, and the words they have left come to roughly this: that what is happening to them is not right.",
			"They are not wrong. Tauren give their dead back to the Earth Mother and Mulgore is the one place where the ground is supposed to be safe to lie in. Something here is undoing that, the corpses carry a toxin, and somebody has started collecting samples of it.",
		},
		readMore = { "Wowpedia: Mulgore", "Wowpedia: Tauren" },
	},
	{
		name = "Galak Camp", parent = "Mulgore", faction = "Hostile",
		hook = "Galak centaur camped on the Mulgore plains, a long way from any ground of theirs.",
		lore = {
			"The Galak are a Thousand Needles tribe. Thousand Needles is on the other side of the Barrens, and yet here they are on the grass in Mulgore with a camp pitched.",
			"Nobody has explained it. The force is small and behaves like a scouting party rather than a raid: moving over open ground, not holding any.",
			"The tauren will take it badly either way. Centaur are the reason their people spent generations as nomads, driven across Kalimdor tribe by tribe, and Mulgore was only made safe when Cairne's Bloodhoof drove them back with orcish help. A centaur camp inside this valley is the exact thing the settlement was built to prevent.",
		},
		readMore = { "Wowpedia: Galak", "Wowpedia: Centaur", "Wowpedia: Mulgore" },
	},
})

SubsOf("Tirisfal Glades", {
	{
		name = "Gunther's Retreat", parent = "Tirisfal Glades", faction = "Hostile",
		hook = "An island in Brightwater Lake with a lich on it who thinks the Forsaken are still slaves.",
		lore = {
			"Gunther Arcanus holds the island in Brightwater Lake, with his zombies around him. He is a lich, and he is free-willed: Sylvanas's break from the Lich King took him with it.",
			"He does not accept that it took anybody else. His position is that every other undead in these glades is still a Scourge thrall, and he has his minions attack anyone who comes near on that basis.",
			"Which makes him a problem the Forsaken cannot argue their way out of. Being free is exactly what he denies them, and the only evidence he would accept is the sort nobody can produce.",
		},
		readMore = { "Wowpedia: Gunther's Retreat", "Wowpedia: Gunther Arcanus", "Wowpedia: Lich" },
	},
	{
		name = "Gallows' End Tavern", parent = "Tirisfal Glades", faction = "Horde",
		hook = "Brill's inn, and the only working tavern the Forsaken run.",
		lore = {
			"The Gallows' End is in Brill, and it does everything an inn should: trainers for most of the classes, an innkeeper, vendors. It is also, as far as anybody knows, the only fully functioning tavern the Forsaken operate anywhere.",
			"That is worth sitting with. The Forsaken do not eat, do not drink and do not sleep, and they have built and staffed a public house regardless, with a name that makes a joke of the hanging they were spared and did not escape.",
			"There is a Scarlet zealot and a dwarven mountaineer in the cellars. Not drinking.",
		},
		didYouKnow = "A people with no appetite keeping a tavern open is the most human thing in Tirisfal. They are holding on to the shape of a life they no longer have any use for.",
		readMore = { "Wowpedia: Gallows' End Tavern", "Wowpedia: Brill", "Wowpedia: Forsaken" },
	},
	{
		name = "Crusader Outpost", parent = "Tirisfal Glades", faction = "Hostile",
		hook = "A Scarlet Crusade watchtower over the glades road, covering the Monastery's flank.",
		lore = {
			"The tower stands on the hills of eastern Tirisfal, and Captain Vachon has it. From up there the Crusade watches the main road through the glades and can come down on the flank of anyone moving against the Scarlet Monastery.",
			"The Scarlet Crusade began as the remnant of the Silver Hand and the Church, the people who stayed when Lordaeron fell. What they became is a movement that cannot tell the difference between the undead and the living any more, and kills both.",
			"They are not wrong that the Forsaken are walking corpses. They are wrong about almost everything that follows from it, and the Monastery behind this tower is where that went furthest.",
		},
		readMore = { "Wowpedia: Crusader Outpost", "Wowpedia: Scarlet Crusade", "Wowpedia: Scarlet Monastery" },
	},
})

-- Feralas, continuing down tools/coverage.md.
SubsOf("Feralas", {
	{
		name = "East Pillar", parent = "Feralas", faction = "Neutral",
		hook = "The eastern of the Twin Colossals, the highest ground in Feralas.",
		lore = {
			"The Twin Colossals are two sheer mountains on Feralas's western side, and they are the tallest thing in the zone by a long way. The road from Feralas into Desolace runs between them.",
			"Getting up the eastern one is not a walk. Marli Wishrunner, at the foot of the western colossal, will send a traveller to the top of it, and she is clear that it is a one-way trip.",
			"What is up there is a view and a way down. Kalin Windflight keeps a stock of parachutes on the summit, and that is what makes the trip survivable.",
		},
		readMore = { "Wowpedia: Twin Colossals", "Wowpedia: Feralas" },
	},
	{
		name = "West Pillar", parent = "Feralas", faction = "Neutral",
		hook = "The western Colossal, with the road to Desolace running past its foot.",
		lore = {
			"The western of the two Colossals stands over the Feralas-Desolace road. Marli Wishrunner keeps to the base of this one.",
			"Feralas is a wet, overgrown, warm forest and Desolace is grey rubble with centaur fighting over it. The change happens in the gap between these two mountains, over a few hundred yards of road.",
			"The night elves held all of this once. What is in Feralas now is Gordunni ogres, Woodpaw gnolls, Grimtotem tauren, Hatecrest naga and the Shen'dralar sealed in Dire Maul, with Feathermoon Stronghold holding what it can off the coast.",
		},
		readMore = { "Wowpedia: Twin Colossals", "Wowpedia: Feralas" },
	},
	{
		name = "Oneiros", parent = "Feralas", faction = "Hostile",
		hook = "Night elf ruins south of Jademir Lake, patrolled by elite green dragonspawn.",
		lore = {
			"Oneiros lies in northern Feralas, just south of Jademir Lake. Elite green dragonspawn patrol the night elf ruins. The green flight is Ysera's, and her charge is the Emerald Dream.",
		},
		readMore = { "Wowpedia: Oneiros", "Wowpedia: Green dragonflight" },
	},
	{
		name = "The Writhing Deep", parent = "Feralas", faction = "Hostile",
		hook = "A silithid hive in the south-east, and the gnolls around it have gone frantic.",
		lore = {
			"Hive Zukk'ash is in the ground here, and it is silithid. They are the qiraji's creatures: insectoid, numberless, and answering ultimately to C'Thun under Ahn'Qiraj.",
			"The hive is driving the local gnolls out of their minds. They are pushing north in a state and running into Camp Mojache, which means the tauren there are fighting gnolls because of something neither of them started.",
			"That is how silithid work as a problem. Clearing the ones on the surface does nothing to the eggs, and no hive was ever the real problem; each is an outpost of something much older, still buried in Silithus.",
		},
		readMore = { "Wowpedia: Writhing Deep", "Wowpedia: Silithid", "Wowpedia: C'Thun" },
	},
	{
		name = "Woodpaw Den", parent = "Feralas", faction = "Hostile",
		hook = "The Woodpaw gnolls' den, and they have been pushed into it from two directions.",
		lore = {
			"The Woodpaw hold this den, and their alphas are here. The Darkmist Ruins lie south of it.",
			"They have been squeezed. The Gordunni ogres deforested the Woodpaws' old home, and the Feral Scar yetis came through it as well, so the gnolls moved east and built again.",
			"Feralas has a great many claimants and no authority. The ogres push the gnolls, the gnolls push the tauren at Camp Mojache, the naga work the coast, and Feathermoon Stronghold holds an island and watches.",
		},
		readMore = { "Wowpedia: Woodpaw Den", "Wowpedia: Gordunni", "Wowpedia: Feralas" },
	},
	{
		name = "Shalzaru's Lair", parent = "Feralas", faction = "Hostile",
		hook = "A flooded naga cave on the Isle of Dread, with the Hatecrest's master at the back of it.",
		lore = {
			"The lair is a large twisting cave at the northern end of the Isle of Dread, south of Feathermoon Stronghold's island. Two chambers joined by a waterway, full of Hatecrest sorceresses and serpent guards, with Shalzaru himself deep inside.",
			"The Hatecrest are one of the naga clans working Kalimdor's western coast. The naga are the Highborne who went under at the Sundering and were changed rather than drowned, and they have been Azshara's ever since.",
			"Ten thousand years later they are coming back up, all along this coastline. Feathermoon Stronghold exists because of it.",
		},
		readMore = { "Wowpedia: Shalzaru's Lair", "Wowpedia: Naga", "Wowpedia: Feathermoon Stronghold" },
	},
})

-- Dustwallow Marsh.
SubsOf("Dustwallow Marsh", {
	{
		name = "Foothold Citadel", parent = "Dustwallow Marsh", faction = "Alliance",
		hook = "Theramore's barracks, and the room where Jaina's father died.",
		lore = {
			"The Foothold Citadel is the keep inside Theramore Isle and the headquarters of the Theramore Guard.",
			"Daelin Proudmoore died in it. He was Lord Admiral of Kul Tiras and Jaina's father, and he came to Kalimdor to finish the orcs off, on the straightforward Second War logic that the only safe orc is a dead one. Jaina had spent the Third War learning otherwise, at Hyjal, beside Thrall.",
			"She would not fight her father and she would not help him. Thrall's forces stormed Theramore and killed him in this keep, and she let it happen because the alternative was the war her father wanted.",
		},
		didYouKnow = "Theramore is the only human settlement on Kalimdor that chose to live alongside the Horde, and the price of that choice was paid in this building. Jaina has been the Alliance's most committed advocate of peace with Orgrimmar ever since, and the reason is upstairs.",
		readMore = { "Wowpedia: Foothold Citadel", "Wowpedia: Daelin Proudmoore", "Wowpedia: Jaina Proudmoore", "Wowpedia: Theramore Isle" },
	},
	{
		name = "Swamplight Manor", parent = "Dustwallow Marsh", faction = "Neutral",
		hook = "A hermit's house at Witch Hill, with a buried spy report in the garden.",
		lore = {
			"Swamplight Manor is one small house out at Witch Hill, and calling it a manor is a joke somebody is in on. \"Swamp Eye\" Jarl lives there and is a famous cook.",
			"In the garden there is a pile of dirt with an orcish spy's report buried in it. Both sides want it. Theramore's guard captain will take it, and so will the Horde at Brackenwall.",
			"That is Dustwallow entirely. A hermit, a good cook, a murdered spy's paperwork in the vegetable patch, and two armies a few miles apart pretending the marsh is quiet.",
		},
		readMore = { "Wowpedia: Swamplight Manor", "Wowpedia: Dustwallow Marsh" },
	},
})

-- Azshara.
SubsOf("Azshara", {
	{
		name = "The Ruined Reaches", parent = "Azshara", faction = "Neutral",
		hook = "The broken coast of the queen's own province, with nothing much left standing.",
		lore = {
			"Azshara was the heart of the night elf empire and Zin-Azshari, the queen's capital, stood in it. The Sundering took most of that and put it under water.",
			"The Ruined Reaches are the part of the coastline where the wreckage shows worst. Ravencrest Monument is close by, and Rethress Sanctum is in here somewhere, empty.",
			"Ten thousand years of nothing being rebuilt. The naga are offshore, the satyrs are inland, and the zone still carries the name of the queen who caused all of it.",
		},
		readMore = { "Wowpedia: Azshara", "Wowpedia: Zin-Azshari", "Wowpedia: Great Sundering" },
	},
	{
		name = "Rethress Sanctum", parent = "Azshara", faction = "Neutral",
		hook = "A ruined shrine in the Reaches with nobody in it but stray murlocs.",
		lore = {
			"Rethress Sanctum is a shrine south-west of Ravencrest Monument, and it is a ruin. Nothing lives there. Murlocs and makrura wander through it.",
			"That is unusual for Azshara, where almost everything is held by somebody: Legashi and Haldarr satyrs inland, naga along the coast, blue dragonkin around Lake Mennar.",
			"An empty shrine in the middle of that is a reminder of the scale of what was lost. There was enough night elf civilisation here that some of its holy places are not worth anybody's trouble to occupy.",
		},
		readMore = { "Wowpedia: Rethress Sanctum", "Wowpedia: Azshara" },
	},
	{
		name = "Legashi Encampment", parent = "Azshara", faction = "Hostile",
		hook = "Satyr ground in Azshara, held by one of the two clans working this coast.",
		lore = {
			"The Legashi are satyrs, and Azshara has them and the Haldarr both. A satyr is a night elf who took Sargeras's bargain during the War of the Ancients and was remade for it.",
			"Their presence here is pointed. This was Azshara's own province, and the queen's court were the ones who opened the portal; Xavius, the first satyr of all, was her counsellor. The satyrs are in the ruins of the civilisation they helped destroy.",
			"They have had ten thousand years and have not gone anywhere. Satyr camps are scattered through every forest the night elves once held, in Azshara, Ashenvale, Felwood and Desolace.",
		},
		readMore = { "Wowpedia: Satyr", "Wowpedia: Xavius", "Wowpedia: Azshara" },
	},
})

-- Durotar.
SubsOf("Durotar", {
	{
		name = "Shrine of the Dormant Flame", parent = "Durotar", faction = "Horde",
		hook = "The holiest place the Horde's shaman have, up a hidden path above the Valley of Trials.",
		lore = {
			"The shrine sits on top of the tallest mountain north-west of the Valley of Trials, reached by a path that spirals up and is not obvious; it starts down by the Southfury River.",
			"Telf Joolam keeps it, alone. His work was guiding new shaman in the taming of fire, and the brazier at the summit was lit by them as part of that.",
			"Shamanism is the whole of what Thrall's Horde claims to be. The orcs had it, Gul'dan took it from them and gave them warlocks instead, and Thrall got it back from Drek'Thar and the Frostwolves. A quiet shrine above the orc starting valley is where that recovery is taught.",
		},
		didYouKnow = "The view from the summit is the best in Durotar. Jumping off is not advised, and the accounts felt the need to specify it.",
		readMore = { "Wowpedia: Shrine of the Dormant Flame", "Wowpedia: Shaman", "Wowpedia: Thrall" },
	},
})

-- The Barrens and Thousand Needles, continuing down tools/coverage.md.
SubsOf("The Barrens", {
	{
		name = "The Mor'shan Rampart", parent = "The Barrens", faction = "Horde",
		hook = "The Horde's wall at the top of the Gold Road, facing Ashenvale.",
		lore = {
			"The rampart sits at the northern end of the Gold Road, where the Barrens runs into Ashenvale, and it was thrown up to stop the Alliance coming south. It is makeshift and it is meant to be.",
			"It does not only defend. The towers here are also where raids on Astranaar start from, Astranaar being the night elf town on the other side of the border.",
			"The Warsong clan want Ashenvale's timber and Darnassus will not give it up, so this is where the two positions meet. A wall that is also a staging post is an honest description of the whole quarrel.",
		},
		readMore = { "Wowpedia: Mor'shan Rampart", "Wowpedia: Warsong clan", "Wowpedia: Astranaar" },
	},
	{
		name = "Mor'shan Base Camp", parent = "The Barrens", faction = "Horde",
		hook = "The camp behind the rampart, at the head of the Gold Road.",
		lore = {
			"The base camp sits with the rampart at the northern terminus of the Gold Road. The rampart is the wall; this is what keeps the wall supplied.",
			"The Gold Road is the Barrens' spine. It runs north to south from here, crosses the east-west road at the Crossroads, and carries everything the Horde moves between Orgrimmar and the south.",
			"Which makes the top of it the most sensitive point on the whole road. Lose the rampart and Ashenvale's war comes down the highway into the Barrens.",
		},
		readMore = { "Wowpedia: Mor'shan Rampart", "Wowpedia: Gold Road" },
	},
	{
		name = "Gold Road", parent = "The Barrens", faction = "Contested",
		hook = "The Barrens' north-south highway, and the reason the Crossroads matters.",
		lore = {
			"The Gold Road runs the length of the Barrens, from the Mor'shan Rampart in the north down past the Crossroads and Wailing Caverns to the dried-up riverbed that divides the zone, where a bridge carries it across. South of the bridge the same road is called the Southern Gold Road.",
			"Where it crosses the east-west road is the Crossroads, and that is the whole reason the Crossroads exists: it is not a town that happens to have roads, it is a junction that acquired a town.",
			"Everything the Horde does on this continent moves along this line. Orgrimmar to Ashenvale, Orgrimmar to Thousand Needles, Orgrimmar to Ratchet and the sea. The Barrens looks empty and is actually the Horde's circulatory system.",
		},
		readMore = { "Wowpedia: Gold Road", "Wowpedia: The Crossroads" },
	},
	{
		name = "Fray Island", parent = "The Barrens", faction = "Neutral",
		hook = "An island off the coast south of Ratchet where warriors go to fight each other.",
		lore = {
			"Fray Island is small, dry and off the Barrens' eastern shore. What it is for is fighting: warriors come here to test themselves against each other, and have done under one management or another for years.",
			"Klannoc Macleod runs the challenges. The test he sets is called the Affray, offered to warriors who turn up believing they are already tough.",
			"Humans, trolls, ogres, dwarves, goblins, orcs and night elves have all fought here. On an island with no faction and no authority, the only question anybody asks is whether you can.",
		},
		didYouKnow = "Ratchet is a short way north and is Steamwheedle neutral ground, where fighting is forbidden on the premises. The goblins appear to have solved that by letting the fighting happen on an island just offshore.",
		readMore = { "Wowpedia: Fray Island", "Wowpedia: Ratchet" },
	},
	{
		name = "Raptor Grounds", parent = "The Barrens", faction = "Hostile",
		hook = "A valley of raptors that build their own huts and tools.",
		lore = {
			"The Sunscale raptors hold this small valley west of Northwatch Hold, and they are not like other raptors. They show an intelligence their kind is not supposed to have: they make crude tools, and they build huts.",
			"They also collect. Anything bright or out of the ordinary attracts them, and a good deal of it has been taken out of Horde settlements nearby, which is how the valley came to anybody's attention.",
			"Nobody has explained the intelligence. Azeroth has a long record of creatures turning out to be more than they look, and it usually means something older has had a hand in them.",
		},
		readMore = { "Wowpedia: Raptor Grounds", "Wowpedia: Raptor" },
	},
	{
		name = "Honor's Stand", parent = "The Barrens", faction = "Horde",
		hook = "A Horde post of burrows and towers on the western road.",
		lore = {
			"Honor's Stand guards the west road between Sun Rock Retreat in Stonetalon and the Crossroads. It is burrows and watchtowers rather than a fort, and some of the burrows have been knocked about.",
			"The western approach matters because Stonetalon does. The Venture Company are cutting that range apart, the Grimtotem tauren are in it, and the road through is the Horde's link to everything west.",
			"The name is the sort the Horde gives a position it does not intend to leave.",
		},
		readMore = { "Wowpedia: Honor's Stand", "Wowpedia: The Barrens" },
	},
})

SubsOf("Thousand Needles", {
	{
		name = "Splithoof Hold", parent = "Thousand Needles", faction = "Hostile",
		hook = "A guarded Galak cave with a sacred flame burning inside.",
		lore = {
			"Splithoof Hold is a cave in Splithoof Crag, the Galak centaurs' stronghold in Thousand Needles. The Ancient Brazier and the Sacred Flame stand within it.",
			"The flame protects a relic the centaurs prize. The hold is heavily guarded, and the Galak have no intention of surrendering it.",
		},
		readMore = { "Wowpedia: Splithoof Hold", "Wowpedia: The Sacred Flame (quest)" },
	},
	{
		name = "Tahonda Ruins", parent = "Thousand Needles", faction = "Neutral",
		hook = "A tauren village that went under the sands of the Shimmering Flats, with claw marks on it.",
		lore = {
			"Tahonda was a tauren village. It came to ruin a long time ago and the Shimmering Flats have been taking it ever since; most of it is under the salt.",
			"Almost nothing is recorded about it, so the ruin has to speak for itself. Saltstone basilisks live in it now and may be the reason it was abandoned.",
			"There is other evidence. On the leather of one of the buildings there are two sets of three parallel tears. Something with claws came through here, and whatever happened to Tahonda, the tauren did not write it down.",
		},
		readMore = { "Wowpedia: Tahonda Ruins", "Wowpedia: Shimmering Flats", "Wowpedia: Tauren" },
	},
	{
		name = "The Rustmaul Dig Site", parent = "Thousand Needles", faction = "Hostile",
		hook = "A dwarven dig that neither the diggers nor the raiders got to keep.",
		lore = {
			"The Explorers' League were uncovering ruins out on the Shimmering Flats when a Horde raiding party under Moktar Krin came down on them.",
			"Then the digging opened something. There was a silithid nest under the site, and what came out of it drove both sides off the ground entirely.",
			"So the dig stands abandoned twice over, and what is in it now is neither dwarves nor orcs. Silithid are the qiraji's creatures, and Ahn'Qiraj is not far south of here.",
		},
		readMore = { "Wowpedia: Rustmaul Dig Site", "Wowpedia: Explorers' League", "Wowpedia: Silithid" },
	},
})

SubsOf("Winterspring", {
	{
		name = "The Ruins of Kel'Theril", parent = "Winterspring", faction = "Hostile",
		hook = "A night elf ruin on a frozen lake, with its Highborne cursed to it.",
		lore = {
			"What is left of Kel'Theril stands on the shores of the lake that carries its name, in the middle of Winterspring, and the Highborne who lived there are still on the ruins.",
			"They are there because of what they did. The Highborne of this city stole a sacred artefact, the Crystal of Zin-Malor, believing they could siphon its power into themselves. It shattered in an explosion that drove the pieces down under the ice of the lake, and the thieves have been bound here ever since, still looking for them. The curse is their own.",
			"The Highborne were Azshara's arcane nobility, and the Sundering was the direct result of what their queen and her court did with the Well of Eternity. Spirits tormented on the ruins of their own city is as exact a judgement as the world has handed down.",
		},
		didYouKnow = "The fragments can be brought up out of the ice and the crystal mended, and the elf who knows how is not here. She is Aurora Skycaller, living a continent away outside Quel'Lithien Lodge in the Eastern Plaguelands, and she grieves for what her people did.",
		readMore = { "Wowpedia: Ruins of Kel'Theril", "Wowpedia: Highborne", "Wowpedia: Great Sundering" },
	},
})

SubsOf("Teldrassil", {
	{
		name = "Aldrassil", parent = "Teldrassil", faction = "Alliance",
		hook = "The great tree at the centre of Shadowglen, where night elves start.",
		lore = {
			"Aldrassil is both a tree and a village: the night elves have built into it, and Tenaron Stormgrip leads Shadowglen from a room at the very top.",
			"It stands on Teldrassil, and Teldrassil is a difficulty. Fandral Staghelm pushed for a second World Tree after Nordrassil was spent killing Archimonde, and he planted it without the dragon Aspects' blessing, which Nordrassil had.",
			"Malfurion Stormrage opposed it. Ysera withheld her blessing. The tree went up anyway, and there is already something wrong in its roots. New night elves begin their lives in a tree that their own Archdruid thinks should not exist.",
		},
		readMore = { "Wowpedia: Aldrassil", "Wowpedia: Teldrassil", "Wowpedia: Fandral Staghelm", "Wowpedia: Nordrassil" },
	},
	{
		name = "The Oracle Glade", parent = "Teldrassil", faction = "Alliance",
		hook = "Teldrassil's first and strongest moonwell, under a tree shaped like an eagle on a bear.",
		lore = {
			"The Oracle Glade is in Teldrassil's north-west, and the moonwell here is the first and the most powerful on the tree. Moonwells are drawn from the Well of Eternity's remaining waters, so every one of them is a fragment of the thing whose destruction broke the world.",
			"The Oracle Tree stands over it, with a wide trunk and boughs grown into the shape of a great eagle perched on a bear. It is said to have been raised by nature magic rather than planted, and it has watched Teldrassil grow alongside the druids.",
			"Malfurion Stormrage comes here to meditate. Bloodfeather harpies have nested nearby and are a threat to the tree, and a small group of Sentinels has been sent to push them back.",
		},
		readMore = { "Wowpedia: Oracle Glade", "Wowpedia: Moonwell", "Wowpedia: Malfurion Stormrage" },
	},
})

SubsOf("Felwood", {
	{
		name = "Shrine of the Deceiver", parent = "Felwood", faction = "Hostile",
		hook = "A barrow den at Jaedenar, turned into a shrine to Kil'jaeden.",
		lore = {
			"This was a barrow den, which means druids slept in it. It is now a shrine, and the Deceiver it is named for is Kil'jaeden, who leads the Burning Legion in Sargeras's absence.",
			"The Shadow Council run it, and the warlocks in it are not amateurs. Jaedenar as a whole is theirs: a cult site named for their master, built inside a druidic holy place in a forest the Legion already poisoned.",
			"Kil'jaeden is the one who found Ner'zhul and made the Lich King out of him, which means the Scourge on the other continent and the corruption in this forest come from the same hand.",
		},
		readMore = { "Wowpedia: Shrine of the Deceiver", "Wowpedia: Kil'jaeden", "Wowpedia: Shadow Council", "Wowpedia: Jaedenar" },
	},
	{
		name = "Jadefire Glen", parent = "Felwood", faction = "Hostile",
		hook = "A satyr camp in the south, speaking the Legion's own language.",
		lore = {
			"Xavathras holds the Jadefire Glen in southern Felwood, and the satyrs here answer to the Burning Legion directly rather than to themselves.",
			"The detail worth noticing is the language. The satyrs of the Jadefire speak Eredun, the Legion's tongue, not Darnassian. They were night elves once, and they have given up even that.",
			"Felwood is the forest the Legion ruined and the night elves could not clean. Most of the zone's work is killing satyrs, and there are always more.",
		},
		readMore = { "Wowpedia: Jadefire Glen", "Wowpedia: Satyr", "Wowpedia: Eredun" },
	},
	{
		name = "Bloodvenom Falls", parent = "Felwood", faction = "Hostile",
		hook = "A poisoned waterfall, and the head of a river that carries the poison out of the zone.",
		lore = {
			"The falls are high in Felwood and they are corrupted. They are also the source of the Bloodvenom River, which is the problem with them.",
			"The corruption does not stay here. The river comes down off these mountains and becomes the Wildbend River in Darkshore, carrying Felwood's poison into a zone that had nothing to do with it.",
			"That is the argument for Felwood mattering to anyone outside it. The Legion's damage to this forest is not contained by the forest, and it runs downhill.",
		},
		readMore = { "Wowpedia: Bloodvenom Falls", "Wowpedia: Felwood", "Wowpedia: Darkshore" },
	},
})

SubsOf("Darkshore", {
	{
		name = "Twilight Shore", parent = "Darkshore", faction = "Neutral",
		hook = "The roughest stretch of Darkshore's coast, running down to Ashenvale.",
		lore = {
			"The Twilight Shore is southern Darkshore's coastline, starting below the Long Wash and running all the way down to the Ashenvale border. It is the most broken part of the coast, and the beaches are grey.",
			"Darkshore is a drowned shoreline. The Sundering rearranged this whole edge of Kalimdor, and the night elf ruins along it, Ameth'Aran and Bashal'Aran among them, are what was above water when the sea finished moving.",
			"The Wildbend River comes out near here, carrying Felwood's corruption down from the mountains. Darkshore gets other people's damage from both directions.",
		},
		readMore = { "Wowpedia: Twilight Shore", "Wowpedia: Darkshore", "Wowpedia: Great Sundering" },
	},
})

SubsOf("Stonetalon Mountains", {
	{
		name = "Boulderslide Cavern", parent = "Stonetalon Mountains", faction = "Hostile",
		hook = "A kobold mine chasing a purple crystal with titan magic in it.",
		lore = {
			"The Boulderslide kobolds nest at the end of Boulderslide Ravine, and they are mining. What they are after is resonite: a rare glowing purple crystal, and they guard it with everything they have.",
			"There is more in the cave than ore. Deep in it stands a resonite cask, and what is sealed inside the cask is an earthen, asleep, by the name of Goggeroc. The earthen were the titans' work, living stone shaped before there were dwarves.",
			"Kobolds are the least regarded creatures on this world and are generally treated as vermin with candles. They have been mining around a sleeping titan-made giant, and the shaman who worked out what the crystals were is not pleased about it.",
		},
		readMore = { "Wowpedia: Boulderslide Cavern", "Wowpedia: Kobold", "Wowpedia: Earthen" },
	},
	{
		name = "Sishir Canyon", parent = "Stonetalon Mountains", faction = "Hostile",
		hook = "A spider canyon off the main Stonetalon road.",
		lore = {
			"Sishir Canyon runs off the main Stonetalon road, and the Deepmoss spiders have it. Their eggs and webbing cover the whole of it.",
			"Besseleth is the largest of them and she is deep inside. Giant spiders in Kalimdor are not unusual; a canyon taken so thoroughly that nothing else is left in it is.",
			"Stonetalon is being pulled apart from several directions at once. The Venture Company are logging and mining it, the Grimtotem tauren hold ground in it, harpies are in the Charred Vale, and the one road through runs past this.",
		},
		readMore = { "Wowpedia: Sishir Canyon", "Wowpedia: Stonetalon Mountains" },
	},
})

SubsOf("Thunder Bluff", {
	{
		name = "The Pools of Vision", parent = "Thunder Bluff", faction = "Horde",
		hook = "A tunnel under Spirit Rise, and the Forsaken's quarters in Thunder Bluff.",
		lore = {
			"The Pools of Vision are in a tunnel system just below the cap of Spirit Rise, reached from the bridge up from Lower Rise. They are also where the Forsaken keep their business in Thunder Bluff.",
			"That arrangement is worth sitting with. Thunder Bluff is the most spiritually serious city in the Horde, the tauren read the land as the Earth Mother, and their allies in this building are walking corpses raised by the Scourge.",
			"Cairne Bloodhoof accepted them because Thrall did, and Thrall accepted them because Sylvanas brought an army. The Forsaken quarter being in a cave under the spirit rise rather than out on the mesa is about as diplomatic as that compromise gets.",
		},
		readMore = { "Wowpedia: Pools of Vision", "Wowpedia: Thunder Bluff", "Wowpedia: Forsaken" },
	},
})

SubsOf("Silithus", {
	{
		name = "Twilight Post", parent = "Silithus", faction = "Hostile",
		hook = "A Twilight's Hammer camp in the north-west, well away from the Cenarion watch.",
		lore = {
			"The Twilight Post sits in north-western Silithus, a long way west of Cenarion Hold. Twilight Lord Everun and Twilight Keeper Mayna are the names attached to it, with geolords and stonecallers under them.",
			"The Twilight's Hammer are not in Silithus by accident. Ahn'Qiraj holds C'Thun, one of the Old Gods the titans buried rather than killed, and the cult serve the Old Gods directly.",
			"The Cenarion Circle hold the only real position in this desert and are trying to contain the qiraji. The cult are trying to let them out. Both are camped in the same sand.",
		},
		readMore = { "Wowpedia: Twilight Post", "Wowpedia: Twilight's Hammer", "Wowpedia: Cenarion Circle" },
	},
	{
		name = "Twilight's Run", parent = "Silithus", faction = "Hostile",
		hook = "A cult cave at the foot of Staghelm Point.",
		lore = {
			"Twilight's Run is a cave in northern Silithus, under Staghelm Point, and it is full of Twilight's Hammer.",
			"The point above it is named for Fandral Staghelm, the night elf Archdruid who planted Teldrassil without the dragons' blessing and who lost his son Valstann in the War of the Shifting Sands, fought over this very desert.",
			"So a cult serving the thing under Ahn'Qiraj has made itself a cave beneath a monument to the man whose grief helped seal it. Silithus is full of arrangements like that.",
		},
		readMore = { "Wowpedia: Twilight's Run", "Wowpedia: Fandral Staghelm", "Wowpedia: Twilight's Hammer" },
	},
	{
		name = "Bones of Grakkarond", parent = "Silithus", faction = "Contested",
		hook = "A fallen dragon's skeleton, sacred to the anubisath.",
		lore = {
			"The enormous bones of Grakkarond lie in central Silithus. During the War of the Shifting Sands, Ossirian brought the dragon down by hurling a sword through his wing.",
			"Grakkarond nearly killed Ossirian, but the anubisath and qiraji overwhelmed the grounded dragon. The anubisath revere the bones as a monument to their victory.",
		},
		readMore = { "Wowpedia: Bones of Grakkarond", "Wowpedia: Game Guide/Monsters of Ahn'Qiraj" },
	},
	{
		name = "The Swarming Pillar", parent = "Silithus", faction = "Hostile",
		hook = "The biggest silithid hive above ground, a short way from Cenarion Hold.",
		lore = {
			"The Swarming Pillar is a peak in the middle of Silithus with a hive in it, and the name comes from the cloud of small silithid that never stops moving around it. It is the largest of them.",
			"It is also only one. The hives' foundations run under the sand across the whole zone, and there are far too many of them to count, let alone clear.",
			"That is the Cenarion Circle's problem in one sentence. They can hold a fort and they can kill what comes out of a hive. They cannot do anything about what the hives are connected to.",
		},
		readMore = { "Wowpedia: Swarming Pillar", "Wowpedia: Silithid", "Wowpedia: Cenarion Hold" },
	},
})

SubsOf("Azshara", {
	{
		name = "Scalebeard's Cave", parent = "Azshara", faction = "Neutral",
		hook = "A cave on an islet in the Bay of Storms, usually with nobody home.",
		lore = {
			"The cave is on a tiny island in the western Bay of Storms, and it belongs to Scalebeard, who is a very large and very old turtle.",
			"He is rarely in it, and nothing on record says where he goes instead. He does not trouble anyone who walks in on him either.",
			"Azshara is full of ruins, satyrs, naga and the wreckage of a drowned empire. It is worth noting that one of its named places is a turtle's address.",
		},
		readMore = { "Wowpedia: Scalebeard's Cave", "Wowpedia: Azshara" },
	},
})

SubsOf("Durotar", {
	{
		name = "Darkspear Strand", parent = "Durotar", faction = "Horde",
		hook = "The beach the Darkspear trolls came ashore on.",
		lore = {
			"This is where the Darkspear landed. They had been driven off the Echo Isles and they came onto this strand with what they could carry; Sen'jin Village, a few yards inland, is where they gathered afterwards.",
			"Thrall found them on a different island altogether, besieged by murlocs and a sea witch, and took them in. Vol'jin's people have been Horde ever since, and they are the reason the Horde has shadow hunters and a claim on anything south of Durotar.",
			"A beach is a thin place to start a nation from. The orcs did the same thing a short way north of here.",
		},
		readMore = { "Wowpedia: Darkspear Strand", "Wowpedia: Darkspear tribe", "Wowpedia: Vol'jin", "Wowpedia: Sen'jin Village" },
	},
	{
		name = "Spirit Rock", parent = "Durotar", faction = "Horde",
		hook = "A stone above the Valley of Trials where shaman are sent to listen.",
		lore = {
			"Spirit Rock is in the hills over the Valley of Trials, and it is sacred to the Horde's shaman. Getting to it means finding the Hidden Path.",
			"New shaman came here to drink sapta by the rock and commune with the earth. That is the first lesson rather than a ceremony: not casting anything, but listening to the ground and finding out whether it answers.",
			"The orcs lost shamanism entirely. Gul'dan traded it away for warlock power and a generation grew up without it; Thrall learned it from Drek'Thar among the Frostwolves and brought it back. Every orc shaman since starts on this hill.",
		},
		readMore = { "Wowpedia: Spirit Rock", "Wowpedia: Shaman", "Wowpedia: Drek'Thar" },
	},
	{
		name = "Hidden Path", parent = "Durotar", faction = "Horde",
		hook = "A route through the mountains that new shaman are told to find for themselves.",
		lore = {
			"The Hidden Path goes up through the mountains ringing the Valley of Trials, and the first thing an aspiring shaman is asked to do is find it. Nobody draws them a map.",
			"It leads to Spirit Rock. From the top of it there is a clear view out over the Barrens, which is the first time most new orcs see how much of this continent there is.",
			"Setting the search itself as the test is deliberate. A shaman's work is paying attention to the land, and a path that has to be noticed rather than followed is a reasonable way to begin.",
		},
		readMore = { "Wowpedia: Hidden Path", "Wowpedia: Valley of Trials", "Wowpedia: Spirit Rock" },
	},
	{
		name = "Jaggedswine Farm", parent = "Durotar", faction = "Horde",
		hook = "A pig farm outside Orgrimmar's gates, feeding the city.",
		lore = {
			"Jaggedswine is one of several pig farms near the front gates of Orgrimmar: a storage house, a large pen, a pond. The swine off these farms are what the Horde eats.",
			"Durotar is dry, thin, rocky ground and Thrall chose it on purpose, for defensibility and because nobody else had a prior claim on it. Feeding a capital city out of it was always going to be the hard part.",
			"So the unglamorous answer is pigs, in pens, within sight of the gate. A nation founded by escaped slaves has to solve the ordinary problems as well as the heroic ones.",
		},
		readMore = { "Wowpedia: Jaggedswine Farm", "Wowpedia: Orgrimmar", "Wowpedia: Durotar" },
	},
	{
		name = "Razorwind Canyon", parent = "Durotar", faction = "Hostile",
		hook = "Harpy nesting ground either side of the Orgrimmar road.",
		lore = {
			"The Dustwind harpies nest in this canyon, and the canyon is in two parts, east and west of the main road between Razor Hill and Orgrimmar.",
			"Harpies are one of the stranger things in Kalimdor. The night elves hold them to be descended from Aviana's own servants, twisted long ago, which would make them a ruin of the same War of the Ancients that produced the satyrs.",
			"Either way they are nesting on both sides of the Horde's main road, a short ride from the capital, and Durotar has not managed to do anything about it.",
		},
		readMore = { "Wowpedia: Razorwind Canyon", "Wowpedia: Harpy", "Wowpedia: Razor Hill" },
	},
})

SubsOf("Dustwallow Marsh", {
	{
		name = "Tidefury Cove", parent = "Dustwallow Marsh", faction = "Neutral",
		hook = "A reef-choked cove south of Theramore, with two wrecks in the shallows.",
		lore = {
			"Tidefury Cove is at the end of Dustwallow Bay, south of Theramore and off the Wyrmbog coast. It is full of small islands and reefs and it is a bad place to bring a ship.",
			"Two of them did not make it. Both are broken on the shallows with makrura moving through the wreckage.",
			"Nat Pagle lives out here, on an islet called Nat's Landing. He is the most accomplished fisherman anybody knows of and he has chosen to do it from a rock in a cove full of reefs, which is probably the point.",
		},
		readMore = { "Wowpedia: Tidefury Cove", "Wowpedia: Nat Pagle", "Wowpedia: Dustwallow Marsh" },
	},
	{
		name = "Bloodfen Burrow", parent = "Dustwallow Marsh", faction = "Hostile",
		hook = "A raptor nest in the south-west, with somebody's settlement torn apart outside it.",
		lore = {
			"The Bloodfen raptors nest in this cave in concentration, and raptors in numbers are not a thing to walk into.",
			"Just outside the entrance there is what is left of a settlement. Somebody built here, and the raptors took it apart.",
			"Part of Cortello's Riddle is in the burrow, so the pirates who scattered that riddle across the coast came in here too and presumably had the same problem.",
		},
		readMore = { "Wowpedia: Bloodfen Burrow", "Wowpedia: Dustwallow Marsh" },
	},
})

SubsOf("Ashenvale", {
	{
		name = "Silverwing Outpost", parent = "Ashenvale", faction = "Alliance",
		hook = "A Sentinel post on the Horde side of the Falfarren River.",
		lore = {
			"Silverwing Outpost is in south-central Ashenvale, near the Barrens border and south-west of Splintertree Post. Duriel Moonfire leads it.",
			"The post is defended by sentinels and warriors. Nearby, Torek and his raiders are preparing an attack and looking for volunteers to join them.",
		},
		readMore = { "Wowpedia: Silverwing Outpost", "Wowpedia: Torek's Assault" },
	},
	{
		name = "Falfarren River", parent = "Ashenvale", faction = "Contested",
		hook = "The river that is roughly where the night elves stop and the orcs start.",
		lore = {
			"The Falfarren runs north-east to south-west across Ashenvale, and it is the nearest thing this zone has to a border: night elf country under Astranaar to the west, orc country under Splintertree Post to the east.",
			"It is not much of a river. Not deep, not wide, and it swells after rain. Nobody could hold it as a line even if both sides agreed it was one.",
			"A frontier that can be waded is the most honest description of the war in Ashenvale.",
		},
		readMore = { "Wowpedia: Falfarren River", "Wowpedia: Astranaar", "Wowpedia: Ashenvale" },
	},
	{
		name = "The Talondeep Path", parent = "Ashenvale", faction = "Contested",
		hook = "The Ashenvale mouth of the tunnel through to Stonetalon.",
		lore = {
			"The Talondeep Path is a tunnel through the mountains joining Ashenvale to the Stonetalon Mountains. This end of it opens just west of Mystral Lake.",
			"The tunnel itself is empty: a winding passage with dead ends and odd hollows in the walls and nobody living in it. In Kalimdor that is close to remarkable.",
			"The trouble is at this end. Mystral Lake has come alive, and its water elementals go for anything that gets near, and that means anyone on the path. Traffic between Ashenvale and Stonetalon is at a standstill because of it, and Splintertree Post is sending people out to put the lake down.",
		},
		readMore = { "Wowpedia: Talondeep Path", "Wowpedia: Ashenvale", "Wowpedia: Stonetalon Mountains" },
	},
})

SubsOf("Stonetalon Mountains", {
	{
		name = "The Talondeep Path", parent = "Stonetalon Mountains", faction = "Contested",
		hook = "The Stonetalon mouth of the same tunnel, in Windshear Crag.",
		lore = {
			"This is the other end of the Talondeep Path, opening in the north-west of Windshear Crag. The far end comes out in Ashenvale near Mystral Lake.",
			"Windshear Crag is Venture Company ground. They are the goblin cartel that chose extraction over neutrality, and they are cutting and mining Stonetalon with no interest in who objects.",
			"So the tunnel runs from a logging war at one end to a mining operation at the other. Stonetalon and Ashenvale are being taken apart for the same reason, by different people, and the path joins them up.",
		},
		readMore = { "Wowpedia: Talondeep Path", "Wowpedia: Venture Company", "Wowpedia: Windshear Crag" },
	},
})

SubsOf("Desolace", {
	{
		name = "Shadowbreak Ravine", parent = "Desolace", faction = "Hostile",
		hook = "A hidden Burning Blade haven with a summoning circle in it.",
		lore = {
			"Shadowbreak Ravine is tucked into the mountains in Desolace's south-east and it is well enough hidden to be missed. The Burning Blade are in it.",
			"What they have built is the part that matters: structures, giant mushrooms, and a summoning circle with heavy chains set into it. Chains on a summoning circle mean they expected to bring through something that would need holding down.",
			"The Burning Blade are orcs who kept the demonic bargain after Thrall renounced it. A clan still working the Legion's craft, in a ravine in the worst country on the continent, is the Horde's own unfinished business.",
		},
		readMore = { "Wowpedia: Shadowbreak Ravine", "Wowpedia: Burning Blade clan", "Wowpedia: Desolace" },
	},
})

SubsOf("Azshara", {
	{
		name = "Legashi Stronghold", parent = "Azshara", faction = "Hostile",
		hook = "The larger of the two Legashi satyr positions in the north.",
		lore = {
			"The Legashi hold northern Azshara in strength, with an encampment and this stronghold. East of Ursolan, north of the Thalassian camp, the satyrs have the high ground.",
			"Archmage Xylem found a grimoire in their camp, so they are keeping written work rather than simply raiding. Satyrs were Highborne once and the scholarship did not leave them when the rest did.",
			"Azshara was the queen's own province and her court opened the portal. The satyrs are the ones who took Sargeras's bargain during that war, and they have been camped in the ruins of their own civilisation for ten thousand years.",
		},
		readMore = { "Wowpedia: Legash Encampment", "Wowpedia: Satyr", "Wowpedia: Azshara" },
	},
	{
		name = "Thalassian Vanguard Camp", parent = "Azshara", faction = "Hostile",
		aliases = { "Thalassian Base Camp" },
		hook = "A Thalassian camp in northern Azshara under Magus Rimtori.",
		lore = {
			"Magus Rimtori runs this camp in northern Azshara, south of the Legashi. The elves here speak Thalassian and answer to nobody but themselves.",
			"Thalassian is Quel'Thalas's tongue. The high elves of that kingdom were nearly destroyed when Arthas came north for the Sunwell, and what survived has been split ever since between those who kept the old name and those who took a new one under Kael'thas.",
			"A camp of them this deep in night elf country, digging into Azshara's ruins, is not a refugee arrangement. They came here for what is buried.",
		},
		readMore = { "Wowpedia: Thalassian Base Camp", "Wowpedia: Quel'Thalas", "Wowpedia: Azshara" },
	},
})

SubsOf("Desolace", {
	{
		name = "Scrabblescrew's Camp", parent = "Desolace", faction = "Neutral",
		hook = "A goblin and his kodo caravan, near the graveyard where kodos go to die.",
		lore = {
			"Smeed Scrabblescrew keeps this small camp not far from the Kodo Graveyard and runs a kodo caravan out of it.",
			"The graveyard is the thing worth knowing about. Old kodos walk to it to die; the tauren treat that as natural and sacred, and the goblins treat it as an opportunity.",
			"Desolace is grey, broken, centaur-ridden country with almost nothing in it worth having. A goblin has found a business anyway, because that is what goblins do.",
		},
		readMore = { "Wowpedia: Scrabblescrew's Camp", "Wowpedia: Kodo Graveyard", "Wowpedia: Desolace" },
	},
})

SubsOf("Durotar", {
	{
		name = "Dustwind Cave", parent = "Durotar", faction = "Hostile",
		hook = "Where the Burning Blade train their new recruits, within sight of Razor Hill.",
		lore = {
			"Dustwind Cave sits on the cliffs above Razorwind Canyon, north-east of Razor Hill, and it is small. What happens inside is training: Burning Blade cultists bringing on neophytes and thugs.",
			"The Burning Blade are orcs who kept the demonic bargain when Thrall renounced it. Gul'dan traded the orcs' shamanism for warlock power and the Legion's favour, and this clan never gave the second part back.",
			"So the new Horde's starting zone contains a school for the thing the new Horde exists to have stopped being. Thrall's problem in Durotar is not the centaur.",
		},
		readMore = { "Wowpedia: Dustwind Cave", "Wowpedia: Burning Blade clan", "Wowpedia: Razor Hill" },
	},
})

SubsOf("Dustwallow Marsh", {
	{
		name = "Dustwallow Bay", parent = "Dustwallow Marsh", faction = "Neutral",
		hook = "The water off the marsh's eastern coast, with Theramore on it.",
		lore = {
			"Dustwallow Bay is the stretch of the Great Sea along the marsh's eastern side. Theramore Isle sits in it, with Tidefury Cove at the southern end.",
			"Theramore being on an island in this bay is the whole of its position. Jaina Proudmoore put a human city on Kalimdor's coast with Orgrimmar a short way north, and the water is what makes that survivable.",
			"Nat Pagle fishes out of an islet in the cove. The most accomplished fisherman anybody knows of has set up in the bay beside the most politically delicate city on the continent.",
		},
		readMore = { "Wowpedia: Dustwallow Bay", "Wowpedia: Theramore Isle", "Wowpedia: Nat Pagle" },
	},
})

SubsOf("Feralas", {
	{
		name = "High Wilderness", parent = "Feralas", faction = "Neutral",
		hook = "The great forest of western Feralas, from the coast to the Verdantis.",
		lore = {
			"The High Wilderness is the forest itself, running from the Forgotten Coast across to the Verdantis River. It is the largest single thing in Feralas.",
			"What lives in it covers most of the zone: bears, wolves, yetis, treants, hippogryphs and ogres, all in the same woods.",
			"Feralas is the wettest, greenest, least ruined part of Kalimdor, and the night elves held all of it once. The wilderness is what the zone looks like where nobody has arrived to argue about it yet.",
		},
		readMore = { "Wowpedia: High Wilderness", "Wowpedia: Feralas" },
	},
	{
		name = "Wildwind Lake", parent = "Feralas", faction = "Neutral",
		hook = "Open water near Camp Mojache.",
		lore = {
			"Wildwind Lake lies near Camp Mojache in central Feralas, and there is not a great deal more on record about it.",
			"Camp Mojache is the Horde's hold in this zone, Grimtotem tauren rather than Thrall's being the complication there, and the lake is the water the camp sits beside.",
			"Not every named place carries a war. Feralas has gnolls, ogres, naga, satyrs and a sealed Highborne city in it, and it also has a lake.",
		},
		readMore = { "Wowpedia: Wildwind Lake", "Wowpedia: Camp Mojache" },
	},
})

SubsOf("Silithus", {
	{
		name = "Ravaged Twilight Camp", parent = "Silithus", faction = "Neutral",
		hook = "A cult camp in the Crystal Vale that something took apart.",
		lore = {
			"The camp is in the Crystal Vale in north-western Silithus, and it has been ruined. The Twilight's Hammer built it and no longer hold it.",
			"Highlord Demitrian is there now, among the wreckage. He is the one who knows what to do with the shards of an elemental blade, so a destroyed cult camp is a more important address than it looks.",
			"The cult's own records mention the place. State of the Cult runs to at least a hundred and twenty-seven volumes, so the Twilight's Hammer document themselves very thoroughly indeed.",
		},
		readMore = { "Wowpedia: Ravaged Twilight Camp", "Wowpedia: Twilight's Hammer", "Wowpedia: Silithus" },
	},
})

SubsOf("Stonetalon Mountains", {
	{
		name = "Greatwood Vale", parent = "Stonetalon Mountains", faction = "Contested",
		hook = "A forested valley in the foothills, reached by the Webwinder Path.",
		lore = {
			"The Greatwood Vale is one of the green parts of Stonetalon, down in the foothills, and the way in is along the Webwinder Path.",
			"Malaka'jin lies south of it. That is a troll holding, and trolls in Stonetalon are a reminder that the Darkspear are not the only ones on this continent.",
			"Stonetalon has woods worth the name and the Venture Company are cutting them. A vale called Greatwood is the sort of place that gets noticed by a logging concern.",
		},
		readMore = { "Wowpedia: Greatwood Vale", "Wowpedia: Stonetalon Mountains" },
	},
	{
		name = "Windshear Mine", parent = "Stonetalon Mountains", faction = "Horde",
		hook = "A tin mine the Horde took over after the goblins walked away from it.",
		lore = {
			"Windshear Mine sits at the end of the Blackwolf River in Windshear Crag. It produces tin, claimed by the Horde once the Venture Company had abandoned the ground.",
			"While the cartel had it, they worked it with kobolds. That is their method everywhere: find something worth extracting, employ whatever will dig for least, and leave when the seam stops paying.",
			"So a working Horde mine in Stonetalon is a goblin leftover. The crag is full of them, and the Venture Company are still cutting the rest of the range.",
		},
		readMore = { "Wowpedia: Windshear Mine", "Wowpedia: Venture Company", "Wowpedia: Windshear Crag" },
	},
})

SubsOf("Tanaris", {
	{
		name = "Gunstan's Post", parent = "Tanaris", faction = "Alliance",
		aliases = { "Gunstan's Dig" },
		hook = "A small Explorers' League dig south of the Southmoon Ruins.",
		lore = {
			"Prospector Gunstan runs this camp in southern Tanaris, below the Southmoon Ruins, and runs it on his own: one dwarf, a campfire and a book propped up in the sand about the awakening of the dwarves.",
			"The Explorers' League work desert sites for the same reason they work everywhere else. Uldaman gave Ironforge the Discs of Norgannon and the record of the earthen, and every site since has been read as more of that story.",
			"Tanaris has rather a lot to find. Uldum's sealed gate is in this desert, the Caverns of Time are in it, and the Gadgetzan goblins have been digging here for profit since long before the dwarves arrived.",
		},
		readMore = { "Wowpedia: Gunstan's Dig", "Wowpedia: Explorers' League", "Wowpedia: Uldaman" },
	},
	{
		name = "Southbreak Shore", parent = "Tanaris", faction = "Hostile",
		hook = "Flat beach south of Lost Rigger Cove, with pirates at its northern end.",
		lore = {
			"Southbreak Shore runs south from Lost Rigger Cove. The Southsea Freebooters occupy the northern end of this stretch of beach, while turtles and sea giants roam the surf.",
			"The pirates have enemies in Steamwheedle Port. The cartel pays them protection money, but they have been disregarding the arrangement, and the port is recruiting adventurers to strike back.",
		},
		readMore = { "Wowpedia: Southbreak Shore", "Wowpedia: Southsea Shakedown" },
	},
})

SubsOf("Winterspring", {
	{
		name = "Moon Horror Den", parent = "Winterspring", faction = "Hostile",
		hook = "A cave of raging owlbeasts northeast of Everlook.",
		lore = {
			"Moon Horror Den lies a short distance northeast of Everlook. Raging owlbeasts inhabit the cave.",
			"Winterfall Village is close on the map, but the mountain blocks a direct route between the two places.",
		},
		readMore = { "Wowpedia: Moon Horror Den", "Wowpedia: Wild Guardians" },
	},
})

SubsOf("The Barrens", {
	{
		name = "Southern Barrens", parent = "The Barrens", faction = "Contested",
		hook = "The lower half of the Barrens, past the dry riverbed that splits the zone.",
		lore = {
			"The Barrens runs a long way. A dried-up riverbed crosses it about halfway down and the ground south of that gets its own name. Camp Taurajo is down here, so is Northwatch Hold, and so is Razorfen Kraul.",
			"Quilboar are the southern half's own problem. The Bristleback hold Agama'gor off the road west of Camp Taurajo, Razorfen Kraul and Razorfen Downs are quilboar ground too, and the crone Charlga Razorflank is mustering an army inside the Kraul. The tauren lived in the southern Barrens for decades and held the land holy before they were driven off it, and Thunder Bluff's elders want Razorflank dead rather than merely contained.",
			"Northwatch Hold is the other difficulty: a human fort on the coast of what the Horde regards as its own continent, dug in and not leaving. The south Barrens is where the two factions actually touch.",
		},
		readMore = { "Wowpedia: Southern Barrens", "Wowpedia: Razorfen Kraul", "Wowpedia: Northwatch Hold" },
	},
})

SubsOf("Thousand Needles", {
	{
		name = "The Weathered Nook", parent = "Thousand Needles", faction = "Neutral",
		hook = "A hidden cave high on the northern wall, with two tauren living in it.",
		lore = {
			"The Weathered Nook is small, well concealed, and set into the northern wall of Thousand Needles. Dorn Plainstalker and Prate Cloudseer live up there.",
			"Thousand Needles is a canyon system of tall stone spires with very little flat ground, so anybody wanting to be left alone has good options. A cave on a cliff face is one of the better ones.",
			"Tauren who take themselves off to a hidden cave are usually doing it for a reason connected to the spirits rather than to politics. The Needles have the Great Lift at one end and centaur at the other, and the quiet places are up the walls.",
		},
		readMore = { "Wowpedia: Weathered Nook", "Wowpedia: Thousand Needles" },
	},
})

SubsOf("Ashenvale", {
	{
		name = "Moonwell", parent = "Ashenvale", faction = "Neutral",
		hook = "Sacred waters in Ashenvale, revered by the Sentinels and used by druids.",
		lore = {
			"The dryad Shael'dryn stands beside a moonwell east of Iris Lake. Another lies near the western bank of the Falfarren River, south of the main road.",
			"The moonwells hold water from the Well of Eternity. Druids make use of its properties, and the Sentinels revere these pools as shrines to Elune.",
		},
		readMore = { "Wowpedia: Moonwell (Ashenvale)", "Wowpedia: Raene's Cleansing", "Wowpedia: Crown of the Earth", "Wowpedia: The Sacred Flame (quest)" },
	},
})
