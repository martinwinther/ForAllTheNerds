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
		hook = "Durotar's garrison town, holding the road while the quilboar and the Alliance both test it.",
		lore = {
			"Razor Hill is the Horde's main settlement outside Orgrimmar: a barracks, an inn, a smith and the administration for eastern Durotar. Orgrimmar's reach ends roughly where Razor Hill's patrols do.",
			"Its problems are the Razormane quilboar in the hills, the Kolkar centaur raiding from the Barrens, and the shipwrecked Kul Tiras marines who dug in at Tiragarde Keep and have never surrendered.",
		},
	},
	{
		name = "Sen'jin Village", faction = "Horde", levels = "5-12",
		hook = "The Darkspear trolls' village on the coast, home to a tribe twice driven from its islands.",
		lore = {
			"The Darkspear are jungle trolls who were living on the Echo Isles when Thrall's fleet arrived. He helped them against the murlocs and the sea witch who had them cornered, and their chieftain Sen'jin died in the fighting after foreseeing that his people's future lay with the orcs.",
			"Vol'jin leads them now, and the village is named for his father. The Darkspear's loyalty to Thrall personally is absolute and has nothing to do with the Horde as an institution.",
		},
		didYouKnow = "The Darkspear are the only troll tribe to have joined either faction willingly, and they did it on the strength of one dying chieftain's vision.",
	},
	{
		name = "Echo Isles", parent = "Durotar", faction = "Hostile",
		hook = "The Darkspear's own islands, stolen by one of their own witch doctors.",
		lore = {
			"The Echo Isles were given to the Darkspear as their home when they allied with Thrall. They do not hold them any more.",
			"Zalazane, a Darkspear witch doctor, turned on his own people, seized the islands and has been enslaving the minds of any troll who goes back. The tribe lives on the mainland at Sen'jin Village and the loss is a standing humiliation nobody in the village will discuss at length.",
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
			"Thunder Ridge sits in northeastern Durotar, and the elemental activity there is strong enough to charge the local wildlife. Thunder lizards in Kalimdor are a known hazard and this ridge is a dense population of them.",
			"The Horde's shaman take an interest. Elemental disturbance of this kind usually means something has upset the balance nearby, and Kalimdor has plenty that is upset.",
		},
	},
	{
		name = "Skull Rock", parent = "Durotar", faction = "Hostile",
		hook = "A cave of Burning Blade cultists, practising exactly what Thrall outlawed.",
		lore = {
			"The Burning Blade is a demonic cult operating inside Horde territory. Its members are mostly orcs who want the old power back: the demon blood, the warlock pacts, the strength that the Horde used to have and that destroyed it.",
			"Thrall's Horde has banned that path outright. The cults keep forming anyway, because the Horde's strength under Gul'dan was real and some orcs would rather be strong than free.",
		},
	},
	{
		name = "Razormane Grounds", parent = "Durotar", faction = "Hostile",
		hook = "Quilboar territory in western Durotar.",
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
		"The tauren are the Horde's conscience. They are shamanistic, they keep the Earthmother's teachings, and their druids were trained by Cenarius himself. When Orgrimmar does something ugly, it is usually a tauren who says so out loud.",
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
			"Tauren training is as much religious as martial. The rites here are about the Earthmother and a young tauren's place in the world, and the fighting is incidental to that.",
		},
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
		hook = "Cairne Bloodhoof's own village, and the heart of the tauren nation below Thunder Bluff.",
		lore = {
			"Bloodhoof Village is named for the tribe and the chieftain who leads it. Cairne Bloodhoof is High Chieftain of the tauren and one of Thrall's closest allies, and this is where his people's everyday business happens.",
			"The village is also where the Venture Company's intrusion into Mulgore is being managed. Goblins have been drilling and cutting on tauren land, and the tauren response has been patient up to a point.",
		},
	},
	{
		name = "Thunder Bluff", faction = "Horde", levels = "Capital",
		hook = "Four mesas joined by rope bridges, the first city the tauren ever built.",
		lore = {
			"Thunder Bluff sits on top of four connected mesas in northern Mulgore, reachable by lift or by wing. It holds the tauren's leadership, their druids, their shaman and the Pools of Vision where their spirit-walkers work.",
			"For a people who were nomads within living memory, a permanent capital is a profound change. The city is deliberately open: no walls, few gates, and the sky on all sides.",
			"It is also the Horde's intellectual centre. The tauren keep histories, and their understanding of Kalimdor's natural order is older and better than anything Orgrimmar has.",
		},
		readMore = { "Wowpedia: Thunder Bluff" },
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
		hook = "A Bristleback quilboar warren dug into the southern hills.",
		lore = {
			"Brambleblade is one of the Bristleback tribe's warrens, and quilboar warrens are built around a thorny central growth the tribe tends almost religiously.",
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
		"Teldrassil is a World Tree, grown off Kalimdor's northern coast, and the night elves live in and on it. Darnassus is built in its branches. It is perhaps a few decades old. For a tree of this kind that is infancy.",
		"It exists because of what happened at Mount Hyjal. The night elves' immortality came from Nordrassil, the first World Tree, which was rooted in the Well of Eternity's waters. At the Battle of Mount Hyjal they used Nordrassil to destroy Archimonde, and the tree's power, and their immortality with it, was spent. Teldrassil was Fandral Staghelm's answer: plant a new World Tree and get it back.",
		"Malfurion Stormrage and the dragonflights opposed it. A World Tree needs the Aspects' blessings, and Teldrassil was planted without them. It is sick. The Gnarlpine furbolgs nearby have been driven mad by the corruption, the Ban'ethil barrow dens are troubled, and the night elves who argued against this are being proved right.",
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
		hook = "A furbolg camp where a friendly people have gone mad.",
		lore = {
			"The Gnarlpine were allies. Furbolgs and night elves share a long history of mutual respect, and the Gnarlpine's corruption is recent and specific.",
			"Something in Teldrassil is doing this to them. They have taken to dark rituals and have stolen night elf relics, and the night elves are killing them while knowing exactly what they are killing.",
		},
	},
	{
		name = "Ban'ethil Barrow Den", parent = "Teldrassil", faction = "Hostile",
		hook = "A druid barrow den under the tree, with its sleepers disturbed.",
		lore = {
			"Barrow dens are where night elf druids sleep while their minds walk the Emerald Dream. Night elf druids spent most of the last ten thousand years in dens like this one.",
			"Ban'ethil has been broken into by the Gnarlpine, and the druids sleeping there are vulnerable in a way that is difficult to overstate. A druid's body left untended is simply a body.",
		},
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
		hook = "A set of pools in the western woods, sacred and intruded upon.",
		lore = {
			"The pools are a site of some significance to the night elves, and like the moonwells they are tied to water the night elves consider holy.",
			"The Gnarlpine have reached here too. That sentence recurs in any account of Teldrassil.",
		},
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
			"Rut'theran sits at Teldrassil's roots, at sea level, with the portal up to Darnassus and the boats to Auberdine in Darkshore.",
			"It is the Alliance's gateway to the night elves. Before Teldrassil the night elves had no port and wanted none; their alliance with the humans, dwarves and gnomes is recent and was forced on them by the Third War.",
		},
	},
	{
		name = "Lake Al'Ameth", parent = "Teldrassil", faction = "Alliance",
		hook = "A lake on the tree's southern slopes, with a village on its shore.",
		lore = {
			"Al'Ameth is Teldrassil's largest body of water, and the night elves have settled lightly around it.",
			"Night elf building practice is to disturb as little as possible. Much of Teldrassil looks unoccupied when it is not.",
		},
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
		"The zone's live problems are the Twilight Hammer cultists at the Master's Glaive, the naga coming out of the water, the Shadow Council's tower at Althalaxx, and a dwarven archaeologist digging up things he does not understand. Auberdine is the Alliance's port and the only organised settlement on the coast.",
	},
	didYouKnow = "The Master's Glaive is an enormous blade driven into the ground, and the Twilight Hammer cult gathers there because something very old is buried beneath it. The cult worships the Old Gods, and on the question of one being down there somewhere they may well be right.",
	readMore = { "Wowpedia: Darkshore", "Wowpedia: Great Sundering" },
}

SubsOf("Darkshore", {
	{
		name = "Auberdine", faction = "Alliance", levels = "10-20",
		hook = "The night elves' port on the ruined coast, and the Alliance's ferry hub in the north.",
		lore = {
			"Auberdine is a working port with boats to Rut'theran Village, Menethil Harbor in the Wetlands and the Azuremyst route north. For Alliance players it is the main crossing between Kalimdor and the Eastern Kingdoms.",
			"It is also the night elves' administrative centre for Darkshore, coordinating responses to naga, cultists and a coastline full of things washing ashore.",
		},
	},
	{
		name = "Ruins of Mathystra", parent = "Darkshore", faction = "Hostile",
		hook = "A night elf city from before the Sundering, now furbolg-held.",
		lore = {
			"Mathystra was a night elf settlement of the old empire, one of the better-preserved ruins on this coast. The architecture belongs to the same tradition Darnassus is built in. For a night elf it is an uncomfortable place to walk through.",
			"Furbolgs have taken the ruins. The night elves' response is complicated by the fact that furbolgs used to be friends.",
		},
	},
	{
		name = "Ameth'Aran", parent = "Darkshore", faction = "Hostile",
		hook = "A ruined night elf town whose dead have not left it.",
		lore = {
			"Ameth'Aran fell in the Sundering with its people in it. Night elf spirits still occupy the ruins, and none of them are at peace.",
			"Ten thousand years is a long time to be restless. The night elves know exactly who these ghosts were.",
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
		hook = "A night elf tower taken over by the Shadow Council.",
		lore = {
			"Althalaxx is an old night elf structure now occupied by warlocks of the Shadow Council, the demonic cabal that ran the Old Horde from behind Gul'dan.",
			"The Shadow Council was supposed to have been destroyed. Its continued operation on this coast is exactly the kind of thing the night elves came out of their forests to prevent.",
		},
	},
	{
		name = "Grove of the Ancients", parent = "Darkshore", faction = "Alliance",
		hook = "A grove where the tree-ancients themselves stand guard.",
		lore = {
			"The Ancients are enormous sentient trees, allies of the night elves since the War of the Ancients. They fought at Mount Hyjal and they are not decorative.",
			"The grove is a night elf strongpoint in southern Darkshore, and the Ancients there are both garrison and advisors.",
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
			"Remtravel's own expedition has fallen apart around him. He has not noticed.",
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
		hook = "A furbolg den in the northern woods.",
		lore = {
			"The Blackwood furbolgs hold this den, and like the Gnarlpine on Teldrassil they have turned hostile.",
			"Furbolg corruption across the northern zones is widespread enough that the night elves treat it as a single phenomenon rather than a series of local problems.",
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
		"The Barrens are the great dry middle of Kalimdor, and the name is accurate now but was not always. Before the Sundering this was lush country. The cataclysm that broke the continent took the water with it, and what remains is savannah, scrub and a handful of oases.",
		"The Horde runs through it. The Crossroads sits at the junction of every road that matters, Camp Taurajo supplies the south, and the Mor'shan Rampart holds the northern border against the night elves in Ashenvale. For most Horde players the Barrens are the spine of the world.",
		"It is crowded with other claims. Quilboar hold Razorfen Kraul and Razorfen Downs, Kolkar centaur raid the central roads, the Venture Company is stripping the Sludge Fen, dwarves are digging at Bael'dun without permission, the Alliance holds Northwatch Hold on the coast, and Ratchet is a goblin free port where nobody is allowed to fight.",
	},
	didYouKnow = "The Wailing Caverns beneath the Barrens were a druid's attempt to restore the region. Naralex tried to reach the Emerald Dream to bring the water back, and touched the Nightmare instead. The screaming you can hear is him.",
	readMore = { "Wowpedia: The Barrens", "Wowpedia: Wailing Caverns" },
}

SubsOf("The Barrens", {
	{
		name = "The Crossroads", faction = "Horde", levels = "10-20",
		hook = "A Horde waystation at the centre of Kalimdor's road network, attacked constantly.",
		lore = {
			"The Crossroads is exactly what its name says: the point where the Barrens' north-south and east-west roads meet. The Horde fortified it because holding it means holding Kalimdor's interior.",
			"It is raided by centaur, by the Alliance out of Northwatch Hold, and by anyone else with an interest in the roads. For a generation of Horde players, the cry for help from the Crossroads is the sound of the Barrens.",
		},
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
			"The druid Naralex came here to do something ambitious: enter the Emerald Dream and use it to bring water and life back to the Barrens. The caverns are built around that attempt.",
			"He reached the Dream and found the Nightmare instead. The corruption poured back through him into the caves, warping the local wildlife, driving his own disciples mad, and leaving Naralex trapped in a sleep he cannot wake from. His screaming carries through the tunnels.",
			"His disciples are still down there, now serpentine and hostile, and the Cenarion Circle wants him recovered.",
		},
		readMore = { "Wowpedia: Wailing Caverns", "Wowpedia: Naralex" },
	},
	{
		name = "Razorfen Kraul", parent = "The Barrens", faction = "Hostile", levels = "25-35",
		hook = "A quilboar fortress woven out of living thorns.",
		lore = {
			"Razorfen Kraul is a quilboar warren on a scale no other warren matches, built out of enormous thorny growths that the quilboar cultivate and live inside.",
			"Quilboar religion centres on Agamaggan, a boar demigod killed fighting the Burning Legion during the War of the Ancients. These thorns are said to have grown from his blood, making the Kraul a temple as much as a fortress.",
		},
		readMore = { "Wowpedia: Razorfen Kraul", "Wowpedia: Agamaggan" },
	},
	{
		name = "Razorfen Downs", parent = "The Barrens", faction = "Hostile", levels = "35-45",
		hook = "A quilboar burial warren where the Scourge has arrived.",
		lore = {
			"The Downs are the quilboar's burial grounds, the oldest of their sites in the Barrens and dense with their dead.",
			"The Scourge has reached it. A cult of undead has moved into the Downs and begun raising the quilboar dead. The living quilboar are now fighting their own ancestors.",
		},
	},
	{
		name = "Northwatch Hold", parent = "The Barrens", faction = "Hostile",
		hook = "An Alliance fortress on the Barrens coast, directly in the Horde's way.",
		lore = {
			"Northwatch Hold is a Kul Tiras and Stormwind position on the eastern coast, and it exists to interdict the Horde's roads and shipping.",
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
		hook = "A green oasis in the central Barrens, on the main road.",
		lore = {
			"Lushwater sits close to the Crossroads and is the most-travelled of the Barrens' oases.",
			"The oases support an ecology the surrounding savannah cannot, including the thunder lizards and raptors that make the central Barrens a serious hazard.",
		},
	},
	{
		name = "The Stagnant Oasis", parent = "The Barrens", faction = "Contested",
		hook = "The southern oasis, and the name is a warning.",
		lore = {
			"The Stagnant Oasis has not aged as well as its neighbours. Something in the water has gone wrong, and the wildlife around it reflects that.",
			"Water quality in the Barrens is not a minor concern. It is the zone's only real resource.",
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
		hook = "A Horde farm in the southern Barrens, raided by quilboar.",
		lore = {
			"Grol'dom is one of the Horde's attempts at agriculture in the Barrens. Farming here is hard work for thin returns.",
			"The Razorfen quilboar raid it regularly, and the farm is as much a border post as a food source.",
		},
	},
	{
		name = "The Dry Hills", parent = "The Barrens", faction = "Hostile",
		hook = "Gnoll country in the northwestern Barrens.",
		lore = {
			"The Dry Hills hold a gnoll population working the western roads.",
			"Gnolls in the Barrens are a nuisance rather than a power. The centaur and the quilboar are neither.",
		},
	},
	{
		name = "Field of Giants", parent = "The Barrens", faction = "Contested",
		hook = "A plain scattered with the bones of enormous creatures.",
		lore = {
			"The Field of Giants is littered with skeletons far larger than anything currently living in the Barrens.",
			"The usual explanation involves the age before the Sundering, when this was a very different place with very different inhabitants.",
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
		hook = "A high mountain lake at the centre of the range.",
		lore = {
			"Mirkfallon is the range's main lake, surrounded by the forest that everybody is arguing about.",
			"It is one of the few parts of Stonetalon that nobody has yet cut, dug or burned.",
		},
	},
	{
		name = "Grimtotem Post", parent = "Stonetalon Mountains", faction = "Hostile",
		hook = "A camp of tauren who reject the Horde and everyone else.",
		lore = {
			"The Grimtotem are a tauren tribe that refused Cairne Bloodhoof's alliance with the orcs. Magatha Grimtotem leads them and her ambitions are her own.",
			"They are spread across Kalimdor in camps like this one, hostile to Horde and Alliance alike.",
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
		hook = "A troll witch doctor's camp in the southern mountains.",
		lore = {
			"Malaka'jin is a small Darkspear troll site, and the trolls' spiritual practice sits oddly alongside the Horde's industry a few valleys away.",
			"Darkspear witch doctors work with spirits and loa in ways the orcs' shamanism does not quite cover, and the Horde has mostly decided not to ask.",
		},
	},
	{
		name = "Webwinder Path", parent = "Stonetalon Mountains", faction = "Hostile",
		hook = "A spider-infested path through the northern mountains.",
		lore = {
			"The path is one of the main routes through the range and the spiders along it have made it expensive.",
			"Travellers going between the Barrens and Desolace have little alternative.",
		},
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
		hook = "The Sentinels' town on the lake, and the night elves' command post in Ashenvale.",
		lore = {
			"Astranaar is built on an island in a lake in central Ashenvale and it is the Sentinel army's base for the whole forest. The Sentinels are the night elves' standing military, almost entirely female, and they have been fighting for these woods continuously since the Horde arrived.",
			"The town handles the war against the Warsong, the satyr problem, and the furbolgs. It is the busiest Alliance settlement in Kalimdor outside Darnassus.",
		},
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
		name = "Demon Fall Canyon", parent = "Ashenvale", faction = "Hostile",
		hook = "The canyon where Grom Hellscream killed Mannoroth and freed his race.",
		lore = {
			"Mannoroth was the pit lord whose blood Gul'dan fed to the orcish clans, binding them to the Burning Legion. Grom Hellscream drank it first, and in the Third War he was corrupted by it a second time in these woods.",
			"Thrall freed him. Together they hunted Mannoroth down to this canyon, and Grom struck the killing blow with the pit lord's own death throes taking him with it. Every orc alive was released from the blood curse in that moment.",
			"Grom's tomb is here. It is the single most important place in orcish history, sitting in a night elf forest the Horde is fighting to log.",
		},
		didYouKnow = "Thrall named the Horde's beachhead in Stranglethorn Grom'gol after him, and the Warsong clan's continued aggression in this forest is carried out in his name whether he would have wanted it or not.",
		readMore = { "Wowpedia: Demon Fall Canyon", "Wowpedia: Grom Hellscream" },
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
		hook = "A Horde camp on the Zoram Strand, cut off from the rest of the forest.",
		lore = {
			"Zoram'gar sits on Ashenvale's western coast, isolated from the Horde's other positions and surrounded by night elf territory and naga.",
			"The Zoram Strand was part of a night elf city before the Sundering. The ruins along the beach are what is left of it.",
		},
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
		hook = "One of the four Emerald Dream portals, guarded by green dragons.",
		lore = {
			"Bough Shadow in eastern Ashenvale is one of the four great Dream portals, with Seradane, Twilight Grove and the Dream Bough.",
			"The green dragonflight guards all four and is not coping. Something has been going wrong in the Dream, and the dragons posted at these portals have become hostile to everyone, including each other.",
		},
	},
	{
		name = "Maestra's Post", faction = "Alliance", levels = "18-25",
		hook = "A Sentinel camp on the southern border, watching the Barrens road.",
		lore = {
			"Maestra's Post is the night elves' position nearest the Mor'shan Rampart and the Barrens, and the first thing the Horde meets coming north.",
			"It is small and exposed, and serves as the Sentinels' early warning for anything coming out of the Barrens.",
		},
	},
	{
		name = "Fire Scar Shrine", parent = "Ashenvale", faction = "Hostile",
		hook = "A night elf shrine taken by satyrs.",
		lore = {
			"The shrine was a night elf site and the satyrs have taken it over for their own rituals.",
			"Satyr practice is demonic, and turning Elune's shrines to that use is a deliberate provocation rather than mere convenience.",
		},
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
		hook = "A night elf tower in the eastern forest, pressed hard by the Horde.",
		lore = {
			"Raynewood Retreat is a Sentinel and druid position in eastern Ashenvale, close to the Horde's Splintertree Post.",
			"It is one of the places where the forest's war is at its most immediate, with both sides within a short march of each other.",
		},
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
		hook = "A goblin racetrack on a salt flat, run by two cartels who hate each other.",
		lore = {
			"The Mirage Raceway is built on the Shimmering Flats, goblin enterprise in its purest form: a dry lake bed, some rocket engines and a betting operation.",
			"Two rival goblin outfits, the Bloodsail-adjacent racing concerns of Gadgetzan and Steamwheedle interests, compete here with sabotage as a recognised tactic. It is neutral ground and it is the least serious place in Kalimdor.",
		},
	},
	{
		name = "The Shimmering Flats", parent = "Thousand Needles", faction = "Neutral",
		hook = "A salt pan that was a sea before the world broke.",
		lore = {
			"The Flats are the dried bed of a body of water that the Sundering drained. The salt crust goes down a long way and the sun off it is blinding.",
			"The goblins race on it. The Explorers' League would rather dig in it, and there is an ongoing low-grade argument about who has the right.",
		},
	},
	{
		name = "The Great Lift", parent = "Thousand Needles", faction = "Contested",
		hook = "The tauren-built elevator between the canyon and the Barrens.",
		lore = {
			"The Great Lift carries traffic up out of Thousand Needles to the Barrens above. It is tauren engineering and it is the main route between southern and central Kalimdor.",
			"Control of the lift matters enormously. The centaur harass it and the Horde keeps it running.",
		},
	},
	{
		name = "Highperch", parent = "Thousand Needles", faction = "Hostile",
		hook = "A wyvern roost on the western mesas.",
		lore = {
			"Highperch is a wyvern nesting site. Wyverns are native to Kalimdor and the Horde uses them as flying mounts, which the wild populations have not consented to.",
			"The mesas' tops are the only safe nesting ground in the canyon. Wyverns and tauren both want them.",
		},
	},
	{
		name = "Darkcloud Pinnacle", parent = "Thousand Needles", faction = "Hostile",
		hook = "A Grimtotem tauren stronghold on a mesa.",
		lore = {
			"Darkcloud Pinnacle is held by the Grimtotem, the tauren tribe that rejected the Horde.",
			"Their presence on a mesa top, the same tactic Freewind Post uses, makes them as hard to remove as the loyal tauren are.",
		},
	},
	{
		name = "Splithoof Crag", parent = "Thousand Needles", faction = "Hostile",
		hook = "A centaur camp in the western canyon.",
		lore = {
			"Splithoof Crag is one of the centaur clans' holdings in the canyon's western end.",
			"The centaur clans fight each other almost as much as they fight the tauren. Without that, Freewind Post would not have held.",
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
		hook = "An Alliance outpost in the northern hills, watching a zone nobody wants.",
		lore = {
			"Nijel's Point is the Alliance's garrison in Desolace, held by night elves and humans working together on the centaur problem.",
			"The posting is grim. Desolace offers no resources worth taking and the Alliance holds it mainly to deny it to the Horde.",
		},
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
			"Theradras kept his remains and has been in these caverns since, and the place has become a strange hybrid of elemental earth and corrupted nature. The centaur consider it their point of origin.",
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
			"The bones are being harvested and the site disturbed. The tauren call it desecration and mean it. Kodo are central to tauren life and this is their animals' resting place.",
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
		hook = "The other centaur clan, in the southern hills.",
		lore = {
			"The Gelkis hold the hills near Maraudon and consider themselves the senior clan. The Magram disagree.",
			"Both clans claim descent from Zaetar, and their mutual hatred is theological as much as territorial.",
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
			"The Valley of Bones is exactly that, and it sits on the route south out of Desolace.",
			"Between the kodo graveyard, this valley and the centaur wars, Desolace has more skeletal landscape than most zones manage.",
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
		hook = "An island off the coast, held by naga, with a very important prisoner.",
		lore = {
			"Alcaz Island sits off Dustwallow's eastern shore and is held by naga and their allies. It is not a place anyone visits casually.",
			"Something is being held on that island. The Horde and the Alliance have both noticed and neither has been able to get onto it in force.",
		},
	},
	{
		name = "Stonemaul Ruins", parent = "Dustwallow Marsh", faction = "Hostile",
		hook = "The Stonemaul ogres' old city, lost to them.",
		lore = {
			"The Stonemaul held this settlement before they were driven out and ended up at Brackenwall. The ruins are now occupied by ogres who did not come along.",
			"Rexxar's involvement with the Stonemaul and their change of leadership is the reason any of them are Horde today.",
		},
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
		hook = "An abandoned Alliance position in the southern marsh, overrun.",
		lore = {
			"Lost Point was a Theramore outpost. It is not any more, and the name reflects what happened.",
			"The southern marsh is the least controlled part of Dustwallow and the dragonkin presence there is heaviest.",
		},
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
			"Feathermoon Stronghold sits on Sardor Isle off Feralas' western coast and is the Sentinels' main base in the south. General Shandris Feathermoon commands it.",
			"Shandris was Tyrande Whisperwind's ward, orphaned in the War of the Ancients, and she is the Sentinel army's most capable field commander. Her presence here marks how seriously Darnassus takes Feralas.",
		},
	},
	{
		name = "Camp Mojache", faction = "Horde", levels = "40-50",
		hook = "A tauren camp in the jungle, dealing with gnolls and a very old ruin.",
		lore = {
			"Camp Mojache is the Horde's position in Feralas, held by tauren who are more interested in the zone's natural state than in contesting it with the night elves.",
			"Its practical concerns are the Woodpaw gnolls, the Grimtotem at the Twin Colossals, and whatever the ogres at Dire Maul are doing.",
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
		hook = "Two enormous peaks in the north, with a Grimtotem camp between them.",
		lore = {
			"The Twin Colossals are the two great mountains in northern Feralas, and the route between them is the land link toward Desolace.",
			"The Grimtotem hold ground here, as do harpies, and the peaks themselves are home to some of Kalimdor's largest wildlife.",
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
		hook = "Night elf ruins taken by harpies.",
		lore = {
			"Ravenwind is another lost night elf site, now held by harpies in the central jungle.",
			"Harpies' preference for occupying night elf ruins has fed the story that they were night elves once, which they will neither confirm nor discuss.",
		},
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
			"The Isle of Dread holds Feralas' heaviest concentration of dangerous animals, including the gorillas and great cats the mainland jungle is known for.",
			"Sailors named it, not scholars, and nobody has surveyed it properly since.",
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
	didYouKnow = "Uldum, Uldaman and Uldum's unexplored siblings all share a naming pattern, and all three are titan installations. The dwarves' discovery at Uldaman suggests the titans left records of everything they built here. Uldum is still closed.",
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
			"They keep a creature called Gahz'rilla, a hydra they revere and summon, and the city's whole layout is built around their religious practice. Troll religion works. That is the recurring difficulty with troll cities.",
			"There is also a captured Alliance force held in the city, and that is how most outsiders end up involved.",
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
		hook = "A goblin port on the southern coast, harassed by pirates.",
		lore = {
			"Steamwheedle Port is the cartel's seaside operation in Tanaris, handling shipping that does not want to go through Ratchet or Booty Bay.",
			"The Southsea pirates along this coast are a constant problem, and goblin relations with goblin pirates are complicated by the fact that they are all goblins.",
		},
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
			"Thistleshrub Valley is full of animated plant life that has adapted to the desert and is unpleasant about it.",
			"Tanaris's ecology is stranger than a desert's has any right to be, and the Explorers' League puts it down to the titan work nearby.",
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
		hook = "A highborne city's remains, now full of satyrs and naga.",
		lore = {
			"Eldarath was a city of the highborne, the night elf nobility who served Azshara's court and pursued the arcane without restraint.",
			"What is left is held by satyrs and naga: the two things the highborne became. It is as complete a judgement on that era as the landscape can manage.",
		},
	},
	{
		name = "Temple of Arkkoran", parent = "Azshara", faction = "Hostile",
		hook = "A coastal temple to something that lives in the water.",
		lore = {
			"The Temple of Arkkoran stands on Azshara's coast, dedicated to a sea creature the naga revere.",
			"The naga's religion is not only Azshara-worship. They have older attachments, and the temple is one of the places where that shows.",
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
		hook = "The eastern coast, held by naga.",
		lore = {
			"The Bitter Reaches are Azshara's eastern shore, and the naga have made it theirs.",
			"This is the stretch of coast nearest to where Zin-Azshari went under, and the naga have gathered accordingly.",
		},
	},
	{
		name = "Forlorn Ridge", parent = "Azshara", faction = "Hostile",
		hook = "A ridge of ruins in the south, picked over by satyrs.",
		lore = {
			"Forlorn Ridge carries more of the zone's night elf ruins, and the satyrs have been through them.",
			"Azshara is the largest ruin field on the continent, and almost none of it has been properly surveyed.",
		},
	},
	{
		name = "Lake Mennar", parent = "Azshara", faction = "Contested",
		hook = "A lake in the eastern hills, oddly untouched.",
		lore = {
			"Lake Mennar sits in the hills above the coast and is one of the quieter spots in Azshara.",
			"Quiet in Azshara means unvisited rather than safe. The zone is far too large for the single night elf camp and the single Horde camp in it to patrol. Most of it goes unobserved.",
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
		hook = "A cult town named after the Burning Legion's chief strategist.",
		lore = {
			"Jaedenar is a settlement of the Shadow Council's successors, built in corrupted Felwood and named for Kil'jaeden.",
			"The cult is not merely living with the corruption; it is cultivating it. Shadow Hold beneath the town is where their serious work happens.",
		},
	},
	{
		name = "Shadow Hold", parent = "Felwood", faction = "Hostile",
		hook = "The cult's underground base beneath Jaedenar.",
		lore = {
			"Shadow Hold is the Jaedenar cult's cave complex, and where the warlocks and demons running the operation actually sit.",
			"The Shadow Council was the warlock cabal behind the Old Horde, and it has never been fully destroyed. This is one of its surviving limbs.",
		},
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
		hook = "Another corrupted furbolg village, in the north.",
		lore = {
			"The Felpaw tribe is in the same state as the Deadwood, holding a village in northern Felwood.",
			"The Timbermaw regard these tribes as lost rather than enemy. The fighting goes on regardless.",
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
		hook = "A crater field where infernals came down during the Third War.",
		lore = {
			"Shatter Scar Vale is pocked with impact craters from the Legion's infernals, the burning constructs the demons rain down from the sky.",
			"The infernals are still there, and the craters are among the most concentrated sources of corruption in the forest.",
		},
	},
	{
		name = "Ruins of Constellas", parent = "Felwood", faction = "Hostile",
		hook = "A night elf ruin in a forest that used to be theirs.",
		lore = {
			"Constellas was a night elf site in what was then Ashenvale's northern forest. Felwood's corruption took the area around it.",
			"The night elves have written Felwood off. For a people who kept these forests for ten thousand years that is a significant concession.",
		},
	},
	{
		name = "Talonbranch Glade", faction = "Alliance", levels = "48-55",
		hook = "A night elf camp near the Timbermaw tunnels.",
		lore = {
			"Talonbranch Glade is a small night elf position in northern Felwood, close to the route through to Winterspring.",
			"It is a waypoint rather than a garrison. The night elves' presence in Felwood is minimal by choice.",
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
		"Marshal's Refuge, a joint expedition of dwarves and gnomes, is camped inside trying to work out what the pylons do. The Slithering Scar in the south is a silithid hive connecting toward Silithus. Whatever is in Silithus has a way in here.",
	},
	didYouKnow = "Un'Goro is walled all the way round and holds plants and animals found nowhere else on the continent. Whether the crater produced them or preserved them from something older is the question the expedition would most like answered.",
	readMore = { "Wowpedia: Un'Goro Crater" },
}

SubsOf("Un'Goro Crater", {
	{
		name = "Marshal's Refuge", faction = "Neutral", levels = "48-55",
		hook = "A dwarf and gnome expedition camped in a crater full of dinosaurs.",
		lore = {
			"Marshal's Refuge is the research camp inside Un'Goro, run jointly by Explorers' League dwarves and gnomish technicians, on neutral ground.",
			"They are studying the pylons, the crystals and the crater's ecology. They are also hiding in a cave from devilsaurs, a task that takes up a good share of the working day.",
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
		hook = "Tar pits in the north, full of things that got stuck and things that eat them.",
		lore = {
			"The Lakkari Tar Pits are natural asphalt seeps, and they have trapped a fair share of the crater's wildlife over time.",
			"The pits are also a source of the crater's fossil record, which the expedition would like to study and the local pterrordax would prefer they did not.",
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
		"The zone's deeper business is draconic and elven. Mazthoril, the cave beneath Frostsaber Rock, holds blue dragons, and the blue dragonflight is the flight of magic, led by Malygos the Spell-Weaver, who has not been coherent since Deathwing's betrayal of the Aspects. The night elves maintain Starfall Village, and the frostsaber pride in the west is tied to the night elves' own history with the great cats.",
	},
	didYouKnow = "Night elves ride frostsabers, and the relationship is not domestication. The frostsaber pride in Winterspring has to be earned, cat by cat, by anyone who wants to ride one.",
	readMore = { "Wowpedia: Winterspring", "Wowpedia: Malygos" },
}

SubsOf("Winterspring", {
	{
		name = "Everlook", faction = "Neutral", levels = "55-60",
		hook = "A goblin town in the snow, selling to anyone who gets this far north.",
		lore = {
			"Everlook is the Steamwheedle Cartel's northern outpost and the only settlement of any size in Winterspring. Inn, flight path, auctioneer, bruisers.",
			"The cartel put a town here because the zone has resources and nobody else was going to. Goblin commercial instinct is the only thing that reliably reaches Kalimdor's extremities.",
		},
	},
	{
		name = "Starfall Village", faction = "Alliance", levels = "55-60",
		hook = "A night elf village in the eastern snows, watching the sky.",
		lore = {
			"Starfall Village is a small night elf settlement in eastern Winterspring, concerned with the zone's dragons and with what the night elves consider their own business in the north.",
			"It is one of the night elves' most remote outposts and it operates without much reference to Darnassus.",
		},
	},
	{
		name = "Mazthoril", parent = "Winterspring", faction = "Hostile",
		hook = "A cave of blue dragons beneath Frostsaber Rock.",
		lore = {
			"Mazthoril is a blue dragonflight site in Winterspring. The blues are the dragonflight charged with magic and arcane order, and their Aspect is Malygos.",
			"Malygos has not been right for a very long time. He was driven close to madness when Deathwing betrayed the Aspects and then nearly exterminated the blue flight, and the blues have been without coherent direction since.",
		},
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
		hook = "A thicket of owlbeasts in the central valley.",
		lore = {
			"Owlbeasts, or owlkin, are native to Kalimdor's forests and the Winterspring population holds this thicket.",
			"They are associated with the night elves' moon worship in ways the night elves understand and rarely explain.",
		},
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
		hook = "The Cenarion Circle's fortress in the desert, holding the line nobody else will.",
		lore = {
			"Cenarion Hold is the druids' fortified camp in Silithus, and the only organised settlement in the zone. The Cenarion Circle runs it as neutral ground open to Alliance and Horde alike.",
			"Their job is to watch the hives, fight the Twilight Hammer and prepare for the gates opening. They are undermanned and they know what is underneath them.",
		},
	},
	{
		name = "Ahn'Qiraj", parent = "Silithus", faction = "Hostile", levels = "60",
		hook = "The qiraji city, sealed behind a wall, with an Old God at the bottom of it.",
		lore = {
			"Ahn'Qiraj is the qiraji empire's capital, built over C'Thun's prison. The qiraji are insectoid, intelligent, and wholly devoted to the Old God beneath them.",
			"The night elves and the bronze dragonflight sealed the city behind the Scarab Wall after the War of the Shifting Sands, and the seal has held for a thousand years. It is weakening.",
			"What is inside is not an army alone. C'Thun is an Old God, one of the entities the titans themselves could only imprison, and the qiraji are its instrument.",
		},
		readMore = { "Wowpedia: Ahn'Qiraj", "Wowpedia: C'Thun" },
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
		hook = "One of three silithid hives in the open desert.",
		lore = {
			"Hive'Ashi is one of the three surface hives in Silithus, with Hive'Regal and Hive'Zora. Each is a silithid colony outside the sealed city.",
			"That three hives exist outside the Scarab Wall is the clearest evidence that the seal is not holding.",
		},
	},
	{
		name = "Hive'Regal", parent = "Silithus", faction = "Hostile",
		hook = "The southern hive, and the largest of the three.",
		lore = {
			"Hive'Regal is the most developed of the surface hives, in Silithus' south.",
			"The hives are expanding. The Cenarion Circle maps them and the maps keep needing revision.",
		},
	},
	{
		name = "Hive'Zora", parent = "Silithus", faction = "Hostile",
		hook = "The northern hive, nearest the route into Un'Goro.",
		lore = {
			"Hive'Zora sits in northern Silithus, closest to the Un'Goro border and the Slithering Scar beyond it.",
			"The silithid in Un'Goro's Slithering Scar came through from here. The tunnels connect.",
		},
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
		hook = "A village the silithid took, with its people still in it.",
		lore = {
			"Southwind Village was a settlement in Silithus before the silithid reached it. The inhabitants did not get out.",
			"It is the most direct illustration available of what happens when a hive expands into occupied ground.",
		},
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
		name = "Bronzebeard Encampment", parent = "Silithus", faction = "Alliance",
		hook = "A dwarven camp in the desert, digging where it probably should not.",
		lore = {
			"The Explorers' League has a camp in Silithus, because of course it does. The titan connection to Ahn'Qiraj and the Old Gods is exactly the sort of thing Ironforge cannot leave alone.",
			"The Cenarion Circle's view of the dig is not enthusiastic. The druids are holding a line against an Old God's prison, and a dwarven team digging exploratory trenches next to it strikes them as the worst possible use of the ground.",
		},
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
	hook = "The druids' sanctuary, where no faction fights and Cenarius' son keeps watch.",
	lore = {
		"Moonglade is a protected valley in northern Kalimdor, reachable through the Timbermaw tunnels or by druidic travel, and home to the Cenarion Circle. No fighting happens here. Alliance and Horde druids share the same village.",
		"Keeper Remulos holds it. He is a son of Cenarius, the demigod who taught Malfurion Stormrage the first druidic magic and who was killed by Grom Hellscream's corrupted Warsong clan during the Third War. Remulos tends the glade and the Stormrage barrow dens, where Malfurion's body lies while his mind is in the Emerald Dream.",
		"Nighthaven is the village at the centre. The Circle reopened to all races after the Third War, which is why tauren druids trained by the night elves are now a normal sight, and why Moonglade is the one place where the two factions' druids simply get on with the work.",
	},
	didYouKnow = "Malfurion Stormrage is the first mortal druid and arguably the single most important figure in night elf history, and he is not available. He has been in the Emerald Dream for years and the Circle under Fandral Staghelm has been making decisions in his absence that he would not approve of.",
	readMore = { "Wowpedia: Moonglade", "Wowpedia: Cenarion Circle", "Wowpedia: Malfurion Stormrage" },
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
		hook = "The barrow where Malfurion Stormrage's body sleeps while he walks the Dream.",
		lore = {
			"The Stormrage Barrow Dens are the most important barrow in the world. Malfurion's physical body rests here, tended by the Circle, while his consciousness is in the Emerald Dream.",
			"He has been there a long time and something is keeping him. The Nightmare spreading through the Dream and the trouble at the four Dream portals are presumed to be connected to his absence.",
		},
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
		"Fandral Staghelm broke the scepter. His son Valstann had been killed in front of him during the war, and when the dragons offered him the key to a door he had just paid that much to close, he shattered it rather than take it. The pieces were scattered.",
		"That is why the gates are still shut and why opening them is a project rather than a decision. The Scarab Gong stands at the wall, and ringing it requires the scepter whole again.",
	},
	didYouKnow = "The wall was built to hold, and it has held for a thousand years. What is behind it has not been idle: the qiraji answer to C'Thun, one of the Old Gods the titans buried rather than killed.",
	readMore = { "Wowpedia: Gates of Ahn'Qiraj", "Wowpedia: War of the Shifting Sands", "Wowpedia: Scepter of the Shifting Sands", "Wowpedia: Fandral Staghelm" },
}
