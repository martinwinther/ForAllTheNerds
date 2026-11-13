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
			"Rut'theran sits at Teldrassil's roots, at sea level, with the portal up to Darnassus and the boat to Auberdine in Darkshore.",
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
		hook = "A night elf tower taken over by a cult nobody in Darnassus recognises.",
		lore = {
			"Althalaxx is an old night elf structure, and a group of warlocks has taken up residence around it and inside it. They are the Cult of the Dark Strand, and Athrikus Narassin, a highborne of great power, leads them. The Sentinels watching the tower from Auberdine say plainly that they have never heard of the group and know nothing of its history.",
			"A journal taken off the cultists ties them to the Shadow Council, the demonic cabal that ran the Old Horde from behind Gul'dan. The Shadow Council was supposed to have been destroyed. Night elves serving it on this coast is exactly the kind of thing the night elves came out of their forests to prevent.",
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
		"The Barrens are the great dry middle of Kalimdor, and the name is accurate now but was not always. Before the Sundering this was lush country. The breaking of the continent took the water with it, and what remains is savannah, scrub and a handful of oases.",
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
			"Feathermoon Stronghold sits on its own island off Feralas' western coast and is the Sentinels' main base in the south. Sardor Isle lies further out, and the Hatecrest naga on it are the stronghold's nearest problem. Shandris Feathermoon commands here, and Tyrande Whisperwind raised her.",
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
		hook = "A temple to Elune in the Ruins of Eldarath, held now by naga.",
		lore = {
			"The Temple of Zin-Malor stands in the Ruins of Eldarath, and it was built to worship Elune. Its design is close to the nearby Temple of Arkkoran and closer still to the Temple of the Moon in Darnassus, the surviving example of the same architecture.",
			"Azshara is named for the queen whose capital stood here, and the Highborne were her court. The naga are what became of them: dragged under with the Sundering and changed, and still hers.",
			"The Spitelash hold this temple now, under Warlord Krellian. A night elf temple to the moon goddess, occupied by the descendants of the night elves who served the queen who broke the world.",
		},
		didYouKnow = "The Crystal of Zin-Malor was kept here. It was stolen, and it went to Kel'Theril in Winterspring, another ruin of the same vanished empire.",
		readMore = { "Wowpedia: Temple of Zin-Malor", "Wowpedia: Eldarath", "Wowpedia: Naga", "Wowpedia: Azshara" },
	},
})

SubsOf("The Barrens", {
	{
		name = "Bael Modan", parent = "The Barrens", faction = "Alliance",
		hook = "A dwarven dig in the southern Barrens, sunk into ground the tauren consider theirs.",
		lore = {
			"Bael Modan is an Explorers' League excavation, and the League digs for one reason: after Uldaman, Ironforge believes the dwarves were shaped from living stone by the titans, and every site is read as more of that record.",
			"The difficulty is where this one is. The southern Barrens is tauren country and Horde ground, and a fortified dwarven dig in the middle of it is not read as archaeology by anybody living nearby.",
			"Both positions are sincere, and that is what makes it intractable. The dwarves are looking for their own origins and the tauren are watching foreigners fortify their land.",
		},
		readMore = { "Wowpedia: Bael Modan", "Wowpedia: Explorers' League", "Wowpedia: Uldaman" },
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
		hook = "A way into the Emerald Dream, and the Dream is no place for visitors.",
		lore = {
			"The Dream Bough is one of the points where the Emerald Dream touches this world. The Dream is Azeroth as it would have been without any of us: the green dragonflight's charge, and Ysera's.",
			"Night elf druids sleep there. That is what the barrow dens are for, and Malfurion Stormrage has spent most of recorded history in it rather than awake.",
			"Ways in are guarded for good reason. Something has been wrong in the Dream for a long while, and the dragons who are meant to watch it have not been forthcoming about what.",
		},
		readMore = { "Wowpedia: Emerald Dream", "Wowpedia: Ysera", "Wowpedia: Green dragonflight" },
	},
	{
		name = "The Maul", parent = "Feralas", faction = "Hostile",
		hook = "The Gordok ogres' arena, inside the city the Highborne sealed themselves into.",
		lore = {
			"The Maul is the arena at the centre of Dire Maul, and Dire Maul is Eldre'Thalas: the Highborne city whose scholars refused to give up the arcane after the Sundering and locked themselves in with their library rather than submit.",
			"The Gordok ogres hold the city around them. Ogre politics are settled by single combat, and the arena is where that happens, so whoever holds the Maul is the ogre king until somebody takes it off him.",
			"Which leaves the oldest surviving library in the world sitting behind a wall, with the succession of an ogre clan being decided in the courtyard.",
		},
		readMore = { "Wowpedia: Dire Maul", "Wowpedia: Gordok", "Wowpedia: Shen'dralar" },
	},
})

SubsOf("Desolace", {
	{
		name = "Valley of Spears", parent = "Desolace", faction = "Hostile",
		hook = "The Magram clan's hold, in a war that has outlasted every kingdom.",
		lore = {
			"The Valley of Spears belongs to the Magram, one of the centaur clans of Desolace. The Gelkis are the other one that counts here, and the two have been killing each other for longer than any human kingdom has existed.",
			"The centaur came from Zaetar, Cenarius's son, and Theradras, a princess of the earth elementals. Their children killed their father, and Theradras keeps his remains in Maraudon to this day.",
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
		hook = "A barrow den where the sleepers did not wake well.",
		lore = {
			"Barrow dens are where night elf druids sleep, and sleeping is not a figure of speech for them: the body stays in the den for years or centuries while the druid walks the Emerald Dream.",
			"That is the arrangement Malfurion Stormrage made and the reason he has been absent from his own people's history for most of it. The dens were built on the assumption that someone would be awake to guard the ones who were not.",
			"Something has gone wrong in the Dream. The sleepers in these dens have been disturbed by it, and Dor'Danil is one of the places where that shows.",
		},
		readMore = { "Wowpedia: Dor'Danil Barrow Den", "Wowpedia: Emerald Dream", "Wowpedia: Malfurion Stormrage" },
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
			"The Burning Blade and the Kolkar both hold ground within reach of the post, and neither is a problem that gets solved so much as held at arm's length.",
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
			"Silverwind Refuge stands in south-central Ashenvale, north of Mystral Lake. It is night elf ground, and Sentinel Velene Starstrike holds it.",
			"The Warsong are close on both sides of it. Horde scouts watch the refuge from across the lake, which makes this a forward position rather than a safe one.",
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
			"This is the Bael Modan expedition digging on the western edge of Mulgore, and it is a large quarry rather than a trial trench. The Explorers' League does not dig idly: since Uldaman, Ironforge has believed the dwarves were shaped from living stone by the titans, and every site is read as more of that record.",
			"Baine Bloodhoof warned them off. To the tauren the land is the Earth Mother, and cutting a quarry into her is not a property dispute but a desecration. Diplomacy was tried and it failed.",
			"So the Bloodhoof tribe settled on taking the diggers' pickaxes and breaking them, which is a restrained answer by the standards of this continent. The dwarves kept digging.",
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
			"Getting up the eastern one is not a walk. It was reached by arrangement rather than by climbing, and that says enough about how sheer these are.",
			"There is a pond at the top with a giant makura in it called Diamond Head. Gregan Brewspewer watched the thing claw its own way up the mountain, and is now up there with it.",
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
		hook = "Night elf ruins in the north guarded by green dragonspawn, named for the Greek gods of dreams.",
		lore = {
			"Oneiros lies south of Jademir Lake, and it is night elf ruins with green dragonspawn patrolling them. The green flight is Ysera's, and Ysera's charge is the Emerald Dream.",
			"The name is not Darnassian. The Oneiroi were the sons of Hypnos in Greek myth, the personifications of dreams, and Morpheus was the greatest of them. Somebody chose that deliberately for a place where the Dream presses against the waking world.",
			"There is a small night elf camp inside the ruins called Dreamer's Rest. Druids sleep for centuries in this world while they walk in the other one, and a dragon-guarded ruin is a reasonable place to do it.",
		},
		readMore = { "Wowpedia: Oneiros", "Wowpedia: Emerald Dream", "Wowpedia: Green dragonflight" },
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
			"That is unusual for Azshara, where almost everything is held by somebody: Legashi and Haldarr satyrs inland, naga along the coast, blue dragonkin at the pinnacle.",
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
		hook = "A Galak centaur stronghold in a cave, with a flame in it that does not go out.",
		lore = {
			"The Galak are the centaur clan of Thousand Needles, and they took this cave in Splithoof Crag and made a stronghold of it.",
			"Inside is the Ancient Brazier and the Sacred Flame, and the flame burns without stopping. The centaur guard it. Whatever it was before they arrived, they have kept it alight.",
			"All five centaur clans descend from Zaetar, Cenarius's son, and Theradras of the earth elementals, and they killed their father between them. A clan keeping an eternal flame is a strange note in that family history.",
		},
		readMore = { "Wowpedia: Splithoof Hold", "Wowpedia: Galak", "Wowpedia: Centaur" },
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
		hook = "A dwarven dig where the diggers were killed, and then the killers were driven off.",
		lore = {
			"The Explorers' League were uncovering ruins out on the Shimmering Flats when a Horde war party under Moktar Krin came down on them and killed every one of them.",
			"The fighting opened something. There was a silithid nest in a cave at the dig, and the swarm that came out of it drove the already battered war party off the site entirely. The survivors fell back to Ironstone Camp.",
			"So the dig stands abandoned twice over, and what is in it now is neither dwarves nor orcs. Silithid are the qiraji's creatures, and Ahn'Qiraj is not far south of here.",
		},
		readMore = { "Wowpedia: Rustmaul Dig Site", "Wowpedia: Explorers' League", "Wowpedia: Silithid" },
	},
})

SubsOf("Winterspring", {
	{
		name = "The Ruins of Kel'Theril", parent = "Winterspring", faction = "Hostile",
		hook = "A night elf city the Sundering took, with its Highborne still grieving in it.",
		lore = {
			"Kel'Theril was a great night elf city and the Great Sundering destroyed it. What is left is on the shores of the lake that carries its name, in the middle of Winterspring.",
			"The Highborne who did not survive are still here. They did not move on, and the ruins are haunted by them: not a curse laid on the place by somebody else, but the dead of the city refusing to leave it.",
			"The Highborne were Azshara's arcane nobility, and the Sundering was the direct result of what their queen and her court did with the Well of Eternity. Spirits tormented on the ruins of their own city is as exact a judgement as the world has handed down.",
		},
		didYouKnow = "The Crystal of Zin-Malor was taken from the Temple of Zin-Malor in Azshara and brought to Kel'Theril. Two ruins of the same vanished empire, with one of its relics moved between them.",
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
			"The crystal carries a trace of earthen magic. The earthen were the titans' work, living stone shaped before there were dwarves, and anything with their magic in it means something titan-built is close.",
			"Kobolds are the least regarded creatures on this world and are generally treated as vermin with candles. They have found something in this cavern that nobody else noticed.",
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
		hook = "A bronze dragon's skeleton, kept as a holy site by the things that killed him.",
		lore = {
			"Grakkarond was a bronze dragon and he was killed here by Ossirian the Unscarred during the War of the Shifting Sands. His bones are still in the sand in central Silithus and they are enormous.",
			"The bronze flight fought that war beside the night elves, and it went so badly that the best available ending was the Scarab Wall and a sealed gate. A dragon of Nozdormu's own flight dying in this desert is part of the price of that.",
			"The Anubisath hold the bones sacred. They are qiraji constructs, stone-made and old, and they treat the skeleton of a dragon their side brought down as a place of reverence.",
		},
		readMore = { "Wowpedia: Bones of Grakkarond", "Wowpedia: War of the Shifting Sands", "Wowpedia: Anubisath" },
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
			"He is generally not in it. Scalebeard prefers to be out hunting in the Great Sea, so anyone who comes looking for him mostly finds an empty cave.",
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
		hook = "A Sentinel post on the wrong side of the river, holding anyway.",
		lore = {
			"Silverwing Outpost is in south-central Ashenvale, near the Barrens border and south-west of Splintertree Post. Duriel Moonfire has it.",
			"The position is the point: it is on the Horde's side of the Falfarren River. The Silverwing Sentinels put a post east of the line on purpose and the orcs have been trying to remove it ever since, without pause.",
			"Splintertree is close enough to make that a daily matter. Holding ground across a river from an enemy camp is a statement rather than a strategy, and Darnassus is making it.",
		},
		readMore = { "Wowpedia: Silverwing Outpost", "Wowpedia: Silverwing Sentinels", "Wowpedia: Splintertree Post" },
	},
	{
		name = "Falfarren River", parent = "Ashenvale", faction = "Contested",
		hook = "The river that is roughly where the night elves stop and the orcs start.",
		lore = {
			"The Falfarren runs north-east to south-west across Ashenvale, and it is the nearest thing this zone has to a border: night elf country under Astranaar to the west, orc country under Splintertree Post to the east.",
			"It is not much of a river. Not deep, not wide, and it swells after rain. Nobody could hold it as a line even if both sides agreed it was one.",
			"Bog beasts move under the surface near Felfire Hill, and they are the other reason to use the bridges. A frontier that can be waded is the most honest description of the war in Ashenvale.",
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
			"Prospector Gunstan runs this camp in southern Tanaris, below the Southmoon Ruins: a handful of dwarves and a dig.",
			"The Explorers' League work desert sites for the same reason they work everywhere else. Uldaman gave Ironforge the Discs of Norgannon and the record of the earthen, and every site since has been read as more of that story.",
			"Tanaris has rather a lot to find. Uldum's sealed gate is in this desert, the Caverns of Time are in it, and the Gadgetzan goblins have been digging here for profit since long before the dwarves arrived.",
		},
		readMore = { "Wowpedia: Gunstan's Dig", "Wowpedia: Explorers' League", "Wowpedia: Uldaman" },
	},
	{
		name = "Southbreak Shore", parent = "Tanaris", faction = "Hostile",
		hook = "Flat empty beach below Lost Rigger Cove, apart from the pirates on it.",
		lore = {
			"Southbreak Shore runs south from Lost Rigger Cove: a wide flat beach with almost nothing happening on it, except at the northern end.",
			"The Southsea Freebooters have that end, and Lost Rigger Cove above is their proper anchorage. Sea giants work the surf along this stretch as well, which is its own reason to stay off the sand.",
			"Tanaris is a desert with a goblin port on it and pirates on the coast, which is the arrangement everywhere the Steamwheedle set up. Gadgetzan sells to everybody and polices nothing past its own walls.",
		},
		readMore = { "Wowpedia: Southbreak Shore", "Wowpedia: Southsea Freebooters", "Wowpedia: Gadgetzan" },
	},
})

SubsOf("Winterspring", {
	{
		name = "Moon Horror Den", parent = "Winterspring", faction = "Hostile",
		hook = "An owlbeast cave a short walk from Everlook's gates.",
		lore = {
			"The Moon Horror Den is a small cave north-east of Everlook, close enough to the goblin town's gates to walk. Raging owlbeasts live in it.",
			"Owlbeasts are a night elf problem that got out. They were made, or shaped, in the service of Elune's own and they have not stayed where they were put; Winterspring is full of them.",
			"Winterfall Village looks close on a map and is not, because the mountain is in the way. Winterspring is a zone where everything is a long ride from everything else, and Everlook is the only place to buy anything.",
		},
		readMore = { "Wowpedia: Moon Horror Den", "Wowpedia: Everlook", "Wowpedia: Owlbeast" },
	},
})

SubsOf("The Barrens", {
	{
		name = "Southern Barrens", parent = "The Barrens", faction = "Contested",
		hook = "The lower half of the Barrens, past the dry riverbed that splits the zone.",
		lore = {
			"The Barrens runs a long way. A dried-up riverbed crosses it about halfway down and the ground south of that gets its own name. Camp Taurajo is down here, so is Northwatch Hold, and so is Razorfen Kraul.",
			"The quilboar are the southern half's own problem. Razorfen Kraul and Razorfen Downs are both theirs, and the crone Charlga Razorflank is mustering an army inside the Kraul. The tauren lived in the southern Barrens for decades and held the land holy before they were driven off it, and Thunder Bluff's elders want Razorflank dead rather than merely contained.",
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
		hook = "One of Ashenvale's three moonwells, and a fragment of the Well of Eternity.",
		lore = {
			"Ashenvale has three moonwells. The Moonwell of Purity is in the north, east of Iris Lake and west of Raynewood Retreat; the Moonwell of Cleansing lies west of the Silverwing Outpost; and a third carries no further name than the one the client reports.",
			"A moonwell is not decorative. They are drawn from the waters of the Well of Eternity, which means every one of them is a piece of the thing whose destruction broke this world apart, kept and tended by the people who caused it.",
			"They heal, and they sustain the forest around them. In a zone being logged from one end and held by satyrs at the other, three of them is a reason the night elves will not give Ashenvale up.",
		},
		readMore = { "Wowpedia: Moonwell", "Wowpedia: Well of Eternity", "Wowpedia: Ashenvale" },
	},
})
