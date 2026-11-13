local addonName, ns = ...

-- ===========================================================================
-- Data/Locales.lua -- the second pass of towns, ruins and landmarks.
--
-- These are the places that were on the worklist in tools/places.tsv after the
-- first pass covered the zones and their main settlements. Same lore cutoff as
-- everything else: patch 1.12 and earlier, plus Warcraft I-III and pre-WoW
-- history. Same style contract, enforced by tools/validate.lua.
--
-- Parent zones are declared per block and must already be registered, which
-- they are: this file loads after the continent files in the TOC.
-- ===========================================================================

local SubsOf = ns.SubsOf

-- ---------------------------------------------------------------------------
-- EASTERN KINGDOMS
-- ---------------------------------------------------------------------------

SubsOf("Elwynn Forest", {
	{
		name = "Thieves Camp", faction = "Hostile", levels = "8-12",
		hook = "A Defias camp inside Elwynn itself, further than the Brotherhood should ever have got.",
		lore = {
			"The Defias are supposed to be a Westfall problem. This camp sits in the southwestern corner of Elwynn, on the wrong side of the Westbrook Garrison, and its presence says more about the Brotherhood's reach than Stormwind would care to hear.",
			"The men camped here are not career bandits. Most were masons, carters and labourers a few years ago, and they are within a day's walk of the city they rebuilt and were never paid for.",
		},
	},
	{
		name = "Heroes' Vigil", faction = "Alliance",
		hook = "A hilltop monument east of Goldshire, raised for soldiers the kingdom could not bring home.",
		lore = {
			"The vigil marks Stormwind's war dead, and there are a great many of them. The First War killed most of a generation, the Second took the survivors north to Lordaeron and then across the sea, and the Alliance Expedition through the Dark Portal took the best of what was left.",
			"None of that expedition came back. Turalyon, Khadgar, Danath Trollbane, Kurdran Wildhammer and Alleria Windrunner were on the Draenor side when the portal was destroyed, and Stormwind has had no word since. Monuments like this one are what a kingdom raises instead of holding funerals.",
		},
	},
})

SubsOf("Westfall", {
	{
		name = "Demont's Place", faction = "Hostile",
		hook = "An abandoned farmhouse in the dust, taken over by a Defias spellcaster.",
		lore = {
			"Demont's was an ordinary Westfall holding before the farms failed. A Brotherhood magician works out of it now. The Defias were never only masons: the guild that rebuilt Stormwind employed engineers, surveyors and a few people who could do rather more than survey.",
			"Dealing with a hostile spellcaster in a fortified farmhouse is beyond the People's Militia, in numbers and in training both, so it has not been dealt with.",
		},
	},
	{
		name = "Longshore", faction = "Contested",
		hook = "Westfall's northern beach, strewn with wrecks and worked over by murlocs.",
		lore = {
			"The coast north of the lighthouse has taken a steady toll of shipping, and the hulls are still on the sand where they came ashore. Nobody salvages them properly. Murlocs got there first and have stayed.",
			"Stormwind's merchant traffic runs close in along this shore on the way to the harbour. Sentinel Hill has no boats and no coastal patrol, so what happens on the beach stays on the beach.",
		},
	},
	{
		name = "The Dust Plains", faction = "Contested",
		hook = "The driest ground in Westfall, where the farmland gave up before the rest of it did.",
		lore = {
			"South of Moonbrook the soil stopped holding water and the tenants walked away. This is what the rest of Westfall is afraid of becoming: not raided, not burned, just finished.",
			"Nothing is farmed out here now. Harvest golems left standing in the fields go on working the dirt regardless, and there is no more unsettling sight in the zone.",
		},
	},
})

SubsOf("Duskwood", {
	{
		name = "Brightwood Grove", faction = "Hostile",
		hook = "Woodland in Duskwood's northeast, thick with spiders and increasingly with worgen.",
		lore = {
			"Brightwood keeps a name from before the darkness came. Nothing about the grove has earned it since.",
			"The spiders here are large and the worgen are new. Duskwood's worgen population has grown without anybody establishing how they reached this far south from Silverpine, and the Night Watch has stopped asking and started patrolling.",
		},
	},
	{
		name = "The Hushed Bank", faction = "Contested",
		hook = "Duskwood's river bank, with Westfall's dust visible across the water.",
		lore = {
			"Stand on this bank and you can see what a river is worth. Behind you the forest is dark at noon; across the water Westfall is bleached and open. The two counties share a border and very little else.",
			"Smugglers use the crossings and so do the Defias. Neither the Night Watch nor the People's Militia has anybody to spare for river patrol, and both sides know it.",
		},
	},
})

SubsOf("Redridge Mountains", {
	{
		name = "Stonewatch Falls", faction = "Hostile",
		hook = "A waterfall below the captured keep, with caves behind it the orcs make use of.",
		lore = {
			"The falls run off the high ground Stonewatch Keep sits on, and the caves behind the water reach further into the hillside than Lakeshire would like. Blackrock orcs use them, and the gnolls use them when the orcs are elsewhere.",
			"Lakeshire's militia has mapped the entrance and gone no deeper. Holding the bridge is as much as the town can manage.",
		},
	},
})

SubsOf("Hillsbrad Foothills", {
	{
		name = "Darrow Hill", faction = "Contested",
		hook = "High ground east of Tarren Mill, valuable to whoever is holding it this week.",
		lore = {
			"Darrow Hill overlooks the eastern approach to Tarren Mill. In a war fought between two towns a short walk apart, a hill with a view gets taken, and it has changed hands more than once.",
			"The name belongs to the same Lordaeron family as Darrowmere Lake and the village of Darrowshire off in the Plaguelands. Very little that the Darrow name was attached to is still standing.",
		},
	},
	{
		name = "Corrahn's Dagger", faction = "Hostile",
		hook = "High ground in the Hillsbrad hills, with the Syndicate holding it.",
		lore = {
			"The Syndicate has the run of this hill. They are what became of Alterac's nobility after King Aiden Perenolde sold the Alliance out to the Horde and his kingdom was dismantled for it.",
			"Titles, land and income went in one stroke, and they have been financing a grudge ever since, working the Hillsbrad hills for whatever the roads and the mines will yield. They are better dressed than ordinary bandits and no less dangerous for it.",
		},
	},
})

SubsOf("Alterac Mountains", {
	{
		name = "The Uplands", faction = "Hostile",
		hook = "The high eastern mountains, taken over by the Crushridge ogres.",
		lore = {
			"The Uplands are the roof of Alterac and the Crushridge clan holds them. Ogres moved into these mountains once the kingdom was broken up and nobody was left with the authority or the troops to object.",
			"They are fighting the Syndicate for the high ground now: a clan of ogres against a society of dispossessed aristocrats, over a country that officially no longer exists.",
		},
	},
})

SubsOf("Arathi Highlands", {
	{
		name = "Circle of East Binding", faction = "Contested",
		hook = "One of four standing circles in the Highlands, this one watched by Witherbark trolls.",
		lore = {
			"Four of these circles stand in the Arathi Highlands: East, West, Outer and Inner Binding. They are deliberate work and they are old, and nothing in the Arathorian record claims them, which puts them before Thoradin.",
			"Witherbark trolls hold the ground around this one. Amani presence in the Highlands predates every human claim, so if anybody alive has an inherited opinion about who raised the circles, it is them.",
		},
	},
	{
		name = "Circle of Outer Binding", faction = "Contested",
		hook = "A standing circle in the open Highlands, and a reliable place to find a cultist.",
		lore = {
			"Arcane energy pools at the Binding circles. Whoever raised them was working with ley lines, and the effect has outlasted any explanation of the purpose.",
			"That makes the circles useful to people the Highlands would be better off without. Syndicate magicians and worse have been found working at them, drawn by power nobody is maintaining and nobody is guarding.",
		},
	},
	{
		name = "Circle of West Binding", faction = "Contested",
		hook = "The westernmost of the four Highlands circles, nearest the Thandol Span road.",
		lore = {
			"West Binding sits closest to the road down to the Thandol Span, so it sees more traffic than the other three. Travellers notice it, and a fair number stop.",
			"The Explorers' League would like to survey all four properly. Stromgarde's collapse means there is nobody in the Highlands to grant permission or provide an escort, and Ironforge has sent neither.",
		},
	},
	{
		name = "Boulder'gor", faction = "Hostile",
		hook = "A Boulderfist ogre camp in the west, part of the force taking Stromgarde apart.",
		lore = {
			"The Boulderfist are the largest ogre power in Arathi and one of three parties carving up Stromgarde. Camps like this one hold the open country between the city and Refuge Pointe.",
			"Ogres east of the sea are the Old Horde's leavings, brought over by Gul'dan during the Second War and abandoned when it ended. They have had no leadership and no purpose since, and the Highlands have offered them neither.",
		},
	},
})

SubsOf("Wetlands", {
	{
		name = "Direforge Hill", faction = "Hostile",
		hook = "A Dark Iron foothold in the highlands, in reach of the Thandol Span.",
		lore = {
			"Dark Iron dwarves have established themselves on this hill, within reach of both Dun Modr and the Thandol Span. Ironforge regards that as serious and has done nothing about it.",
			"The Dark Irons lost the War of the Three Hammers, fled south and bound themselves to Ragnaros. Everything they have done in the north since has been aimed at the Bronzebeards, and a bridge is a sensible thing to aim at.",
		},
	},
	{
		name = "Sundown Marsh", faction = "Contested",
		hook = "The low wet ground west of the road, between Menethil Harbor and the sea.",
		lore = {
			"Sundown Marsh is the water around Menethil Harbor, and it is murloc country as much as anybody's. The Bluegill hold the coast and the garrison keeps them off the causeway.",
			"Travellers off the boat from Kalimdor cross this marsh before they see anything else of the Eastern Kingdoms, which has given the Wetlands a reputation the rest of the zone has never shaken.",
		},
	},
	{
		name = "The Green Belt", faction = "Contested",
		hook = "The green heart of the Wetlands, full of raptors and very old bones.",
		lore = {
			"The Green Belt is the band of dense growth running through the middle of the zone. Raptors range through it in numbers, and the Explorers' League's interest in the ground is the only reason anybody goes in on purpose.",
			"The bone beds here hold remains far too large to belong to anything currently alive in Khaz Modan. Whelgar's excavation is working them, when the raptors allow it.",
		},
	},
	{
		name = "Saltspray Glen", faction = "Hostile",
		hook = "A northern stretch of coast given over to murlocs.",
		lore = {
			"Saltspray Glen is murloc ground on the Wetlands' northern shore. They came up out of the sea, they built, and they have not been moved since.",
			"Murlocs raid along this coast and retreat into the water, which makes them impossible to finish and easy enough to survive. The dwarves have learned to live beside them, in the sense that they have stopped counting.",
		},
	},
})

SubsOf("Searing Gorge", {
	{
		name = "Tanner Camp", faction = "Hostile",
		hook = "A Dark Iron camp on the Gorge's rim, worked the way they work everything.",
		lore = {
			"The Dark Irons hold the Searing Gorge, and camps like this one are how: a position on the rim, a crew, and an overseer. They do not pay wages and they do not recruit.",
			"Every one of them answers to Ragnaros in the end. Emperor Thaurissan summoned the Firelord to win a war he was losing, and the clan has been in his service since. No dwarf has ever made a worse bargain.",
		},
	},
})

SubsOf("Burning Steppes", {
	{
		name = "Blackrock Stronghold", faction = "Hostile",
		hook = "A Blackrock orc fortification on the Steppes, outside the mountain's gates.",
		lore = {
			"Not all of the Dark Horde lives inside Blackrock Mountain. This stronghold holds the ground outside it, and an army coming up from Redridge would have to deal with it first.",
			"These orcs answer to Rend Blackhand, son of the Horde's first warchief, who has never accepted that the Second War ended and still styles himself warchief. Orgrimmar does not recognise the title and can do very little about the claim.",
		},
	},
	{
		name = "Draco'dar", faction = "Hostile",
		hook = "Black dragonflight ground in the eastern Steppes, and nobody goes to look.",
		lore = {
			"Draco'dar belongs to Nefarian's brood. Drakes and dragonspawn patrol it, and the Steppes have enough open ash that they can see anyone coming from a long way off.",
			"Nefarian holds the upper reaches of Blackrock Spire and runs a laboratory in them. Ground like this is how he keeps the approaches clear while the orcs below him fight a war they believe is theirs.",
		},
	},
})

SubsOf("Badlands", {
	{
		name = "Mirage Flats", faction = "Contested",
		hook = "Open flats in the northern Badlands, with heat enough to earn the name.",
		lore = {
			"The Mirage Flats are the broad northern plain of the Badlands, and there is nothing on them: no water, no cover, no reason to stop walking.",
			"This region was not always like this. Something stripped it to bedrock long before any war fought here, and the Explorers' League's theory involves the titans' work on this world rather than erosion. It remains a theory.",
		},
	},
	{
		name = "Valley of Fangs", faction = "Hostile",
		hook = "A valley on the eastern road, held by scorpids and raptors in numbers.",
		lore = {
			"The Valley of Fangs carries the road east out of the Badlands. Wildlife along it has adapted to a landscape with no water and no shade by becoming far worse tempered than it strictly needs to be.",
			"Scorpids and raptors both hunt the valley floor. Caravans take the road anyway, because going around the Badlands costs days.",
		},
	},
	{
		name = "Dustbelch Grotto", faction = "Hostile",
		hook = "An ogre cave in the northern Badlands, attached to one of the road camps.",
		lore = {
			"Dustbelch Grotto is where the ogres of the northern Badlands shelter. Three ogre camps are strung across this zone holding the roads, and the grotto is where they go when the sun is at its worst.",
			"They have no strategic aim. Caravans pass, the ogres take what they can, and the dwarves and the Horde both file it under weather.",
		},
	},
})

SubsOf("Blasted Lands", {
	{
		name = "The Red Reaches", faction = "Contested",
		hook = "The eastern coast of the Blasted Lands, red rock running down into the sea.",
		lore = {
			"The Reaches are what this zone does when it meets water. The stone is the same cracked red as everywhere else in it, and the sea does nothing to soften the look of it.",
			"All of this was the Black Morass before the Dark Portal opened. What came through turned a swamp into glass and rock, and the coastline is the clearest place to see how deep the change went.",
		},
	},
})

SubsOf("Stranglethorn Vale", {
	{
		name = "Bal'lal Ruins", faction = "Hostile",
		hook = "Gurubashi stonework in the northern jungle, with the trees most of the way through it.",
		lore = {
			"Bal'lal is one of a chain of Gurubashi ruins across the vale. Taken together they show what this jungle used to be: not a city with a hinterland, but a dense built empire covering the whole of it.",
			"The Gurubashi broke apart after their own priests summoned Hakkar the Soulflayer and the empire had to fight a war to contain him. Everything standing in Stranglethorn dates from before that, and nothing has been built here since.",
		},
	},
	{
		name = "Balia'mah Ruins", faction = "Hostile",
		hook = "A Gurubashi ruin reoccupied by the Bloodscalp, living in their ancestors' stonework.",
		lore = {
			"The Bloodscalp hold Balia'mah. They are Gurubashi descendants camped in Gurubashi architecture, the ordinary condition of troll life in this jungle rather than an irony anybody remarks on.",
			"Their war with the Skullsplitter in the south is older than any human kingdom, and it has done more to keep both tribes off the roads than Booty Bay's bruisers or Stormwind's patrols ever managed.",
		},
	},
	{
		name = "Ziata'jai Ruins", faction = "Hostile",
		hook = "Ruins in the central jungle, overgrown to the point of being easy to walk into.",
		lore = {
			"Ziata'jai sits in the thick of the vale and the jungle has taken it further than most. Walls are findable. Floors rather less so.",
			"The Gurubashi built in stone and the trees have had a long time to work on it. Dating the empire's collapse to the war against Hakkar puts these blocks well past the age of anything human on this continent.",
		},
	},
	{
		name = "Tkashi Ruins", faction = "Hostile",
		hook = "A ruin on the shore of Lake Nazferiti, with the lake's own problems at the door.",
		lore = {
			"Tkashi stands on the great jungle lake, and the Gurubashi built heavily all round that water. Fresh water in Stranglethorn meant the same to them as it does to everybody else.",
			"Trolls, raptors and crocolisks hold the shoreline now in roughly equal measure. The ruins are the least dangerous thing on it.",
		},
	},
	{
		name = "Zuuldaia Ruins", faction = "Hostile",
		hook = "Gurubashi ruins on the southern coast, a short walk from Booty Bay's docks.",
		lore = {
			"Zuuldaia sits at the bottom of the vale, close enough to Booty Bay that the goblins have had every opportunity to strip it and have mostly not bothered. There is no market for Gurubashi masonry.",
			"Naga have taken an interest in this stretch of coast, a newer problem than the trolls and a worse one. What comes out of the water here does not negotiate with the Blackwater Raiders.",
		},
	},
	{
		name = "The Vile Reef", faction = "Hostile",
		hook = "A reef off the Stranglethorn coast, with murlocs living in drowned troll ruins.",
		lore = {
			"The Vile Reef lies off the vale's shore, and there is Gurubashi stonework down there. Murlocs have made their homes in the sunken ruins among the coral, which is the usual murloc instinct for occupying somebody else's architecture.",
			"How much Gurubashi building ended up underwater says something about how far this coastline has moved. Troll construction runs right down to the waterline all along the vale and then carries on past it.",
		},
	},
	{
		name = "Crystalvein Mine", faction = "Hostile",
		hook = "A mine in the jungle interior, worked by troops who stopped taking orders.",
		lore = {
			"Crystalvein is held by Colonel Kurzen's forces. Kurzen was sent into Stranglethorn on Stormwind's business and something in the jungle took him, and his loyalists now hold a compound and several outlying positions like this one.",
			"Soldiers who would not follow him broke away and camped on the northern road, where they are fighting their own former commander. Stormwind has sent nobody to resolve it.",
		},
	},
})

SubsOf("Swamp of Sorrows", {
	{
		name = "The Shifting Mire", faction = "Contested",
		hook = "Open mire in the northern swamp, where the ground is a matter of opinion.",
		lore = {
			"The Shifting Mire is the least solid part of a zone with no solid parts. Tracks across it hold for a season and then stop holding.",
			"Stonard keeps the usable routes marked. The orcs have been in this swamp since the First War, longer than they have held anywhere else on this continent, and marking safe ground is one of the few things they have had the time to get right.",
		},
	},
})

SubsOf("The Hinterlands", {
	{
		name = "Hiri'watha", faction = "Hostile",
		hook = "A small Witherbark village in the forest, lived in rather than ruined.",
		lore = {
			"Hiri'watha is Witherbark ground, and one of the tribe's smaller villages alongside Zun'watha. The Vilebranch hold the south of the Hinterlands out of Jintha'Alor; these are the other forest trolls, and the two should not be confused.",
			"The Witherbark are Amani stock like the rest, and Arathor's founding war was fought against that empire with high elven help. The trolls lost it. They have never accepted the result, and the Wildhammers at Aerie Peak have never expected them to.",
		},
	},
	{
		name = "The Overlook Cliffs", faction = "Contested",
		hook = "Cliffs above the eastern sea, over the one troll village that joined the Horde.",
		lore = {
			"The Overlook Cliffs drop away to the water at the Hinterlands' eastern edge, with Revantusk Village below them. The Revantusk are forest trolls who allied with Thrall, unusual on both counts.",
			"Forest trolls have little love for orcs and the Amani tribes have little for anyone. The Revantusk judged the Vilebranch and the dwarves to be worse options, and the Horde's only foothold in this zone rests on that calculation.",
		},
	},
	{
		name = "Shaol'watha", faction = "Hostile",
		hook = "An abandoned Amani site in the woods, with the forest most of the way in.",
		lore = {
			"Shaol'watha is one of the Hinterlands' empty troll sites rather than one of its occupied ones. The Amani network supporting Jintha'Alor was extensive, and a good part of it has gone back to the trees.",
			"How many of these ruins there are is the measure of what the Amani Empire once was. Troll civilisation held most of this continent before there were humans on it to notice.",
		},
	},
	{
		name = "The Creeping Ruin", faction = "Hostile",
		hook = "A troll ruin in the southern woods, being taken apart by the forest itself.",
		lore = {
			"The name is descriptive. Roots have got into the stonework and are finishing a job the Amani's enemies started a long time ago.",
			"Wildhammer rangers use the site as a marker and do not camp in it. Hinterlands ruins have a way of still being occupied by something, including the ones that look finished.",
		},
	},
})

SubsOf("Western Plaguelands", {
	{
		name = "Thondroril River", faction = "Contested",
		hook = "The river between the two Plaguelands, and the way into either of them.",
		lore = {
			"The Thondroril runs down the border between the Western and Eastern Plaguelands, and the crossing is how most people enter the region at all. Argent Dawn traffic, Scarlet Crusade patrols and the Scourge all use it.",
			"Upstream, before the plague, this was Lordaeron's water, and it irrigated the kingdom's granary. The grain that came out of those fields is what Kel'Thuzad's cult infected.",
		},
	},
})

SubsOf("Eastern Plaguelands", {
	{
		name = "Eastwall Tower", faction = "Contested",
		hook = "One of four Lordaeron watchtowers ringing the zone, worth holding for the sightlines.",
		lore = {
			"Four towers stand at the compass points of the Eastern Plaguelands: Eastwall, Northpass, Crown Guard and the tower at Plaguewood. Lordaeron raised them to watch its own roads.",
			"They are still worth having. Whoever holds a tower can see movement across a long stretch of open blight, and in a zone where the Scourge moves in columns that counts for something.",
		},
	},
	{
		name = "Crown Guard Tower", faction = "Contested",
		hook = "A Lordaeron tower in the south, changing hands often enough that nobody repaints it.",
		lore = {
			"Crown Guard watches the southern approach, nearest Light's Hope Chapel. The Argent Dawn would rather hold it than not, and the Scourge keeps taking it back.",
			"The kingdom that built these towers is gone. Its capital is a Forsaken city and its king was murdered on his own throne by his son. The towers have carried on doing the job regardless of who stands in them.",
		},
	},
	{
		name = "The Fungal Vale", faction = "Hostile",
		hook = "A blighted vale in the west, where the ground itself has started producing.",
		lore = {
			"The Fungal Vale is one of the places in the Plaguelands where corruption has stopped being damage and become an ecology. What grows here was not planted and is not natural.",
			"Pockets like this one get mapped carefully by the Argent Dawn. They mark where the blight is being actively maintained rather than merely lingering, and something maintaining it is a worse problem than something left over.",
		},
	},
	{
		name = "The Infectis Scar", faction = "Hostile",
		hook = "A scar of corrupted ground in the south, held and worked by the Scourge.",
		lore = {
			"The Infectis Scar is open blight in the southern Eastern Plaguelands, and the Scourge holds it the way a works holds a yard.",
			"The Scourge does not occupy this zone so much as operate it. Farms, graveyards, towers and scars all feed the same business, with Naxxramas hanging over the whole arrangement.",
		},
	},
	{
		name = "Lake Mereldar", faction = "Contested",
		hook = "A lake in the southeast, close enough to Light's Hope to be almost safe.",
		lore = {
			"Mereldar sits near the Argent Dawn's chapel, in the one corner of the Eastern Plaguelands the Scourge has not managed to settle. The water is not clean, but it is water.",
			"Light's Hope holds because of what lies under it: a great many of the Silver Hand's dead, and ground the undead cannot press into. Land around the chapel benefits by association, and the Dawn has used that margin to build the only working organisation in the region.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- KALIMDOR
-- ---------------------------------------------------------------------------

SubsOf("Durotar", {
	{
		name = "Burning Blade Coven", faction = "Hostile",
		hook = "A cave of Burning Blade cultists, chasing the power that broke their own race.",
		lore = {
			"The Burning Blade want the old Horde's strength back: the demon blood, the warlock pacts, the thing that made the clans unstoppable and then unmade them. Thrall outlawed all of it.",
			"The cults keep forming anyway. Gul'dan's Horde really was more powerful than the one Thrall built, and there are orcs who would take that trade. Recruits out of the Valley of Trials are sent here partly so they understand what they have joined and what they have not.",
		},
	},
	{
		name = "Rocktusk Farm", faction = "Hostile",
		hook = "A quilboar farm in western Durotar, worked by people who were here first.",
		lore = {
			"The Razormane farm this ground. Orcs did not expect farming from quilboar, and the surprise is a fair part of why the two have never come to an arrangement. Durotar was not empty land waiting to be settled.",
			"Quilboar trace themselves to Agamaggan, a boar demigod killed fighting the Burning Legion in the War of the Ancients. Their warrens, their thorns and their claim on this coast all start there.",
		},
	},
	{
		name = "Scuttle Coast", faction = "Contested",
		hook = "Durotar's southeastern shore, looking out at islands the Darkspear have lost.",
		lore = {
			"The Scuttle Coast runs down to the water opposite the Echo Isles. Those islands were given to the Darkspear when they allied with Thrall, and the tribe does not hold them now.",
			"Zalazane, one of their own witch doctors, took the isles and enslaves the mind of any troll who goes back. Sen'jin Village sits on the mainland looking at them, and nobody in the village cares to discuss it at length.",
		},
	},
	{
		name = "Deadeye Shore", faction = "Contested",
		hook = "The shore where a Kul Tiras fleet came apart, with its marines still dug in inland.",
		lore = {
			"Ships of Kul Tiras, the human naval kingdom, were wrecked along this coast. Marines who got ashore fortified Tiragarde Keep and have never given it up.",
			"Their admiral was Daelin Proudmoore, who sailed to Kalimdor to finish the orcs and attacked the Horde against his own daughter Jaina's wishes. He died at Theramore's gates. These marines have either not been told or do not accept it.",
		},
	},
})

SubsOf("Mulgore", {
	{
		name = "The Rolling Plains", faction = "Horde",
		hook = "Eastern Mulgore grassland, and the road out toward the Barrens.",
		lore = {
			"The Rolling Plains carry Mulgore's eastern traffic, and the change in the land as you go is abrupt. Good grass gives way to the Barrens' scrub inside a few hours' walk.",
			"Kodo herds graze here and the tauren follow them, as they did for generations before they settled. Mulgore is only a few years old as a homeland, and the habits that carried the tauren through the centuries before it have not been put down.",
		},
	},
	{
		name = "Ravaged Caravan", faction = "Contested",
		hook = "A wrecked caravan on the Mulgore grass, with gnolls going through it.",
		lore = {
			"Something took this caravan apart and the Palemane gnolls have been working the wreckage since. Gnolls turn up wherever there is a road worth robbing, on both continents.",
			"The tauren class them as vermin rather than as an enemy, a distinction the gnolls have not earned and do not benefit from.",
		},
	},
})

SubsOf("Teldrassil", {
	{
		name = "Shadowthread Cave", faction = "Hostile",
		hook = "A spider nest in Teldrassil's roots, with spiders larger than the tree should allow.",
		lore = {
			"Shadowthread is a nest inside the World Tree itself, and the spiders in it are not the size that spiders in a healthy wood reach.",
			"Teldrassil was planted without the dragon Aspects' blessings and it is sick. The Gnarlpine furbolgs' madness, the trouble in the barrow dens and the state of caves like this one all read to the night elves as one symptom.",
		},
	},
	{
		name = "Wellspring River", faction = "Alliance",
		hook = "A river running down Teldrassil's northern slopes, feeding the lake below.",
		lore = {
			"The Wellspring comes off the tree's high ground, and the night elves have built lightly along it in the way they build everywhere.",
			"Water matters more here than the geography suggests. Moonwells are drawn from the Well of Eternity's waters and they are the night elves' source of healing and renewal, so every spring on this tree is something to watch for change.",
		},
	},
})

SubsOf("Darkshore", {
	{
		name = "The Long Wash", faction = "Contested",
		hook = "Darkshore's northern beach, where the sea keeps returning things.",
		lore = {
			"The Long Wash takes whatever the water brings: wreckage, naga, and pieces of a civilisation that went under ten thousand years ago.",
			"This coast was inland once. The Well of Eternity collapsed, Kalimdor broke apart, and the sea came in over night elf territory. What washes up on this beach is sometimes night elf work.",
		},
	},
	{
		name = "Mist's Edge", faction = "Contested",
		hook = "The southern shoreline, where Darkshore's fog finally gives out.",
		lore = {
			"Mist's Edge marks the bottom of the coast, where the grey lifts a little and Ashenvale's forest starts to show. Night elves pass through rather than stop.",
			"Ruins run the length of this shore. Ameth'Aran and Bashal'Aran were towns with populations, caught where they stood when the Sundering came, and their dead have not settled in all the time since.",
		},
	},
	{
		name = "Cliffspring River", faction = "Contested",
		hook = "A river coming down the northern cliffs, drawing everything that needs to drink.",
		lore = {
			"Cliffspring River drops off Darkshore's high ground to the beach below, running fast and cold the whole way.",
			"Fresh water reaching the sea is scarce on this coast, so the river pulls in wildlife and the wildlife pulls in everything else. Auberdine sends people up it for water and sends them in pairs.",
		},
	},
})

SubsOf("Ashenvale", {
	{
		name = "Nightsong Woods", faction = "Contested",
		hook = "The old-growth heart of Ashenvale, and the reason both sides want this forest.",
		lore = {
			"Nightsong is what the Ashenvale war is actually about. These are trees the night elves have watched over for ten thousand years, and they are also the best timber within reach of Orgrimmar.",
			"The Warsong are cutting at the edges. Thrall has restrained them more than once and they have resumed more than once, and the Sentinels at Astranaar have drawn the obvious conclusion about what Orgrimmar's word on the subject is worth.",
		},
	},
	{
		name = "The Howling Vale", faction = "Hostile",
		hook = "A vale in northern Ashenvale with worgen in it, which should not be possible.",
		lore = {
			"Worgen were summoned into this world by the archmage Arugal, in Silverpine, on the other continent, as weapons against the Scourge. How they reached a vale in Ashenvale has not been answered by anyone.",
			"The Howling Vale holds furbolgs too, and northern Ashenvale's furbolgs have been going the way the Gnarlpine and the Blackwood went. The night elves are fighting former allies here and are aware of it.",
		},
	},
	{
		name = "Greenpaw Village", faction = "Hostile",
		hook = "A furbolg village in the south, held by a tribe that has turned.",
		lore = {
			"The Greenpaw hold this village. Furbolgs and night elves share a long history of mutual respect, and the corruption running through the northern tribes has turned that into a war neither side wanted.",
			"The source is generally traced to demonic taint left across these forests after the Third War. Felwood is where it runs deepest, and Felwood is not far.",
		},
	},
	{
		name = "Iris Lake", faction = "Contested",
		hook = "A lake in eastern Ashenvale, between the Sentinels and the Horde's positions.",
		lore = {
			"Iris Lake sits in the contested eastern half of the forest, with Astranaar to the west and Splintertree Post to the east. Both sides water at it.",
			"Ashenvale's war is fought at close quarters. Raynewood Retreat and Splintertree are within a short march of each other, and a lake between two garrisons is where people meet without meaning to.",
		},
	},
	{
		name = "Felfire Hill", faction = "Hostile",
		hook = "A hill in eastern Ashenvale still burning from the Third War.",
		lore = {
			"Felfire Hill holds demons that were never cleared after the Legion was broken at Mount Hyjal. They were cut off rather than destroyed, and they have been sitting on this hill since.",
			"Demon Fall Canyon is nearby, where Grom Hellscream killed the pit lord Mannoroth and freed every orc alive from the blood curse. In this forest the Legion's leavings and the Horde's redemption are a short walk apart.",
		},
	},
	{
		name = "Night Run", faction = "Hostile",
		hook = "Eastern woodland held by satyrs, who were night elves before they chose otherwise.",
		lore = {
			"Satyrs hold the Night Run. They descend from night elves who sided with the Burning Legion during the War of the Ancients and were transformed for it, and Satyrnaar is their settlement a short way east.",
			"Night elf accounts of the satyrs read unlike their accounts of anything else in these woods. There is no puzzlement in them. Xavius, the first satyr, was one of Queen Azshara's own highborne, and the night elves know exactly what was chosen and by whom.",
		},
	},
})

SubsOf("Stonetalon Mountains", {
	{
		name = "The Talon Den", faction = "Hostile",
		hook = "A cave in the Stonetalon range, connected to more of the mountain than it looks.",
		lore = {
			"The Talon Den opens into the rock of the central range. Stonetalon's caves run further than their mouths suggest, and the Venture Company's digging has opened up more of them.",
			"What comes up out of the passages belongs to the mountains rather than to either faction. Kobolds, troggs and worse were using the deep ground long before anybody arrived to argue about the trees.",
		},
	},
	{
		name = "Cragpool Lake", faction = "Contested",
		hook = "A lake high in the northern mountains, above the logging and the burning both.",
		lore = {
			"Cragpool sits near the top of the range. From it you can see the two things being done to Stonetalon: the Horde's timber camps below to the east, and the Charred Vale's ash to the south.",
			"The Cenarion Circle keeps a presence in these mountains trying to stop the argument turning into a war. Tauren at Sun Rock Retreat take the same line, which puts them awkwardly across their own faction.",
		},
	},
	{
		name = "Camp Aparaje", faction = "Horde",
		hook = "A small Horde camp in the southern mountains, and not a logging one.",
		lore = {
			"Aparaje is tauren rather than orcish, and the tauren position in Stonetalon is uncomfortable. They are Horde, and they share the night elves' view of what a forest is for.",
			"The camp puts most of its effort into harpies and into the Grimtotem, the tauren tribe that refused Cairne Bloodhoof's alliance with the orcs and answers to nobody. That arrangement suits everyone who has to live up here.",
		},
	},
})

SubsOf("Thousand Needles", {
	{
		name = "Weazel's Crater", faction = "Neutral",
		hook = "A crater on the salt flats, which is where goblin racing goes when it goes wrong.",
		lore = {
			"Weazel's Crater sits on the Shimmering Flats beside the Mirage Raceway. It is the sort of feature that appears when goblins combine rocket engines, a flat horizon and a betting market.",
			"Two rival goblin outfits race here with sabotage treated as a recognised tactic. The Flats themselves are a dried sea bed, drained when the Sundering tore this part of Kalimdor apart, and the goblins are the first people to find a use for them.",
		},
	},
})

SubsOf("Desolace", {
	{
		name = "Kormek's Hut", faction = "Contested",
		hook = "A single hut on the Desolace road, which is as much settlement as this zone offers.",
		lore = {
			"Kormek's Hut stands alone on the road through central Desolace. Between Nijel's Point in the north and Shadowprey Village on the coast there is nothing else.",
			"Desolace does not support much. The land was green inside night elf memory and something killed it, and the two centaur clans holding most of it are too busy with each other to build.",
		},
	},
	{
		name = "Tethris Aran", faction = "Hostile",
		hook = "A night elf ruin in Desolace, from a time when this was worth settling.",
		lore = {
			"Tethris Aran is pre-Sundering night elf work, which places it before the sea came in and before this region became grey stone. The empire covered all of it.",
			"Ruins like this one are the strongest argument that Desolace was not always a waste. Nobody builds a settlement on ground that looks like this.",
		},
	},
	{
		name = "Ranazjar Isle", faction = "Hostile",
		hook = "A naga-held island off the Desolace coast, within sight of a troll village.",
		lore = {
			"Ranazjar lies off the western shore and the naga hold it. Shadowprey Village, the Darkspear settlement on the mainland, exists largely to deal with what comes off islands like this one.",
			"Naga coming up on these beaches are returning rather than invading. They were Azshara's highborne before the Well of Eternity collapsed, and this coast belonged to their empire.",
		},
	},
})

SubsOf("Dustwallow Marsh", {
	{
		name = "Wyrmbog", faction = "Hostile",
		hook = "The southern marsh, thick with black dragonkin for an obvious reason.",
		lore = {
			"Wyrmbog is the least controlled part of Dustwallow and the most heavily patrolled by things with wings. Onyxia's lair opens into this stretch of the marsh.",
			"Onyxia is a daughter of Deathwing and her choice of ground was not sentimental. A lair within easy reach of Theramore, the Alliance's only real city on this continent, is deliberate positioning rather than convenience.",
		},
	},
	{
		name = "The Quagmire", faction = "Contested",
		hook = "The central bog, crossed by anyone travelling between Theramore and Brackenwall.",
		lore = {
			"The Quagmire is the middle of the marsh, and the route between the Alliance city and the Horde's ogre village runs through it. Both sides use the tracks and neither patrols them properly.",
			"Dustwallow's wildlife is the main reason this zone stayed thinly settled. Crocolisks, spiders and worse make the marsh expensive to cross and pointless to garrison.",
		},
	},
	{
		name = "Dreadmurk Shore", faction = "Hostile",
		hook = "The eastern shore, looking out at an island nobody has managed to take.",
		lore = {
			"Dreadmurk Shore faces Alcaz Island across a short stretch of water. Naga and their allies hold the island and have repelled everything sent at it.",
			"Something is being held on Alcaz. The Horde and the Alliance have both noticed and neither has got onto it in force, an unusual thing for them to have in common.",
		},
	},
})

SubsOf("Feralas", {
	{
		name = "Feral Scar Vale", faction = "Hostile",
		hook = "A yeti vale in central Feralas, where the wildlife outnumbers every claim on it.",
		lore = {
			"Feral Scar is yeti country. Feralas' yeti run large and numerous and bad-tempered even by the standards of yeti elsewhere, and this vale holds a good share of them.",
			"Both factions' outposts in this jungle are small. Feathermoon Stronghold sits on an island and Camp Mojache is a tauren camp, and between them they hold rather less of Feralas than the gorillas, the yeti and the Woodpaw gnolls do.",
		},
	},
	{
		name = "Grimtotem Compound", faction = "Hostile",
		hook = "A Grimtotem camp in the jungle, loyal to no faction and no chieftain.",
		lore = {
			"The Grimtotem refused Cairne Bloodhoof's alliance with the orcs. Magatha Grimtotem leads them, her ambitions are her own, and camps like this one are spread from Stonetalon to Thousand Needles.",
			"They are hostile to Horde and Alliance alike, making them one of the few subjects Camp Mojache and Feathermoon Stronghold can agree on.",
		},
	},
	{
		name = "Jademir Lake", faction = "Contested",
		hook = "A lake in northern Feralas, close to a door into the Emerald Dream.",
		lore = {
			"Jademir sits in the north of the jungle with the Dream Bough nearby. That is one of four places in this world where the Emerald Dream presses against the waking one.",
			"The green dragonflight guards all four and is not coping. Something has gone wrong in the Dream, and the dragons posted at Seradane, Bough Shadow, Twilight Grove and the Dream Bough have turned hostile to everyone, one another included.",
		},
	},
	{
		name = "Frayfeather Highlands", faction = "Hostile",
		hook = "Harpy highlands in the east, above the jungle and the ruins both.",
		lore = {
			"The Frayfeather hold the high ground in eastern Feralas and raid down off it. Harpies show a preference for occupying night elf ruins that the night elves consider deliberate.",
			"What the Frayfeather want from the stonework is unclear. They are not scholars and they do not build, and yet across Kalimdor it is night elf ruins they settle in rather than caves.",
		},
	},
})

SubsOf("Tanaris", {
	{
		name = "Noonshade Ruins", faction = "Hostile",
		hook = "One of Tanaris's unexplained ruin sets, occupied by desert trolls.",
		lore = {
			"Three sets of ruins stand in Tanaris: Noonshade, Eastmoon and Southmoon. Nobody has established who built them. The Sandfury trolls use them, and whether their own ancestors raised them is a question the Sandfury decline to answer.",
			"Tanaris holds older work than this. The Gates of Uldum at the zone's southeastern edge are titan-built and still sealed, and the Explorers' League would much rather be digging there.",
		},
	},
	{
		name = "Southmoon Ruins", faction = "Hostile",
		hook = "A second set of unattributed ruins in the sand, south of the road.",
		lore = {
			"Southmoon is the southern member of the set, in the same condition as the others: stone, sand, and trolls living in it.",
			"The Sandfury are desert trolls, a separate branch from the jungle tribes of Stranglethorn and the forest tribes of the Hinterlands. Zul'Farrak in the west is their city, and they take no interest in either faction's business.",
		},
	},
	{
		name = "Waterspring Field", faction = "Contested",
		hook = "Water in the middle of Tanaris, which makes it the most valuable ground here.",
		lore = {
			"Waterspring Field holds one of the few reliable sources in the desert. In Tanaris that outranks ore, ruins and territory.",
			"Gadgetzan rests on the same arithmetic. The Steamwheedle Cartel built a town in the middle of a desert because the desert gets crossed by people who need things, and the cartel sells things.",
		},
	},
	{
		name = "Zalashji's Den", faction = "Hostile",
		hook = "A naga den on the Tanaris coast, where the desert runs into the sea.",
		lore = {
			"Naga have established themselves on this shore. The Tanaris coast is long, hot and barely watched, and a den here can go unremarked for years.",
			"Southsea pirates work the same water out of Lost Rigger Cove, and the Steamwheedle Cartel would like both gone. Neither is going, and the cartel keeps selling to the pirates.",
		},
	},
})

SubsOf("Azshara", {
	{
		name = "Ursolan", faction = "Hostile",
		hook = "A ruined night elf site in Azshara, taken over by furbolgs.",
		lore = {
			"Ursolan is highborne work from before the Sundering, and furbolgs hold it now. Azshara is the largest ruin field on the continent and almost none of it has been surveyed.",
			"This was Queen Azshara's own country. Her palace at Zin-Azshari stood in the region and her court of highborne nobles ran an empire from it, until she made contact with Sargeras and the War of the Ancients followed.",
		},
	},
	{
		name = "Bay of Storms", faction = "Hostile",
		hook = "A naga-held bay on the Azshara coast, as near to Zin-Azshari as the map gets.",
		lore = {
			"The Bay of Storms is naga ground. Azshara's coastline is where the sea took her palace, and the weight of naga along it follows from that.",
			"Azshara did not die in the Sundering. She and her closest followers were transformed into the naga and have been under the water for ten thousand years. What comes ashore in this bay is her court.",
		},
	},
	{
		name = "Ravencrest Monument", faction = "Contested",
		hook = "A monument carrying the Ravencrest name, and nobody has established which Ravencrest.",
		lore = {
			"The monument gives the name and nothing else. The obvious candidate is Lord Kur'talos Ravencrest, who led the first kaldorei resistance in the War of the Ancients, but the link has never been confirmed and the stone may predate that war and honour somebody else of the line.",
			"Either way the name belongs to the era this region is named for. Azshara ruled the night elf empire from a palace in this country and had given her loyalty to Sargeras. Ravencrest was no Highborne, and the resistance he raised was against what she had let in.",
		},
	},
	{
		name = "Hetaera's Clutch", faction = "Hostile",
		hook = "A drowned temple of Elune in the Bay of Storms, with hydras nesting in it.",
		lore = {
			"Hetaera's Clutch is a large underwater temple of Elune, off the Azshara coast in the Bay of Storms. The hydras filling it are the children of Hetaera, and they are why nobody has studied the building.",
			"A temple of Elune this far down measures the Sundering better than any ruin on land. When the Well of Eternity collapsed the sea came in over night elf territory, and sites built dry are now reached by holding your breath.",
		},
	},
})

SubsOf("Felwood", {
	{
		name = "Morlos'Aran", faction = "Hostile",
		hook = "A corrupted site in southern Felwood, where the taint has had longest to work.",
		lore = {
			"Morlos'Aran carries a night elf name, which places it in the forest this was before the Third War. Felwood was Ashenvale's northern woodland and entirely ordinary.",
			"When the Burning Legion was broken at Mount Hyjal the demonic energy here did not disperse. It went into the ground, and the trees, the water and the wildlife have been wrong ever since.",
		},
	},
	{
		name = "Whisperwind Grove", faction = "Neutral",
		hook = "A grove in northern Felwood the Cenarion Circle is trying to hold clean.",
		lore = {
			"Whisperwind Grove is one of the few places in this forest the Circle still has a claim on. The work is restoration, and in Felwood restoration means holding ground rather than gaining any.",
			"The Circle is the order of druids founded on Cenarius' teaching, opened to tauren as well as night elves after the Third War. Felwood is its largest project and its least successful one.",
		},
	},
})

SubsOf("Un'Goro Crater", {
	{
		name = "The Marshlands", faction = "Hostile",
		hook = "Wetland in the crater's northwest, holding an ecology the desert outside cannot.",
		lore = {
			"The Marshlands are wet ground inside a crater that sits in a desert belt. Whatever keeps Un'Goro's climate running keeps this corner of it waterlogged.",
			"Pterrordax nest in the soft ground and devilsaurs come down to drink. Marshal's Refuge advises working the northwest in the morning and being out of it by the afternoon.",
		},
	},
	{
		name = "Eastern Pylon", faction = "Contested",
		hook = "The eastern pylon on the crater rim, one of three nobody can account for.",
		lore = {
			"Three crystal pylons stand on rises around Un'Goro: northern, eastern and western. They react to the crystals found across the crater floor and do something when fed.",
			"Who raised them has not been established. The guesses at Marshal's Refuge run from measuring instruments to something holding the crater shut, and the expedition has no way to test either.",
		},
	},
	{
		name = "Western Pylon", faction = "Contested",
		hook = "The third pylon, on the crater's western rim above the hot springs.",
		lore = {
			"The western pylon completes the ring with the northern and eastern ones. All three are the same work and all three are equally unexplained.",
			"Un'Goro is walled the whole way round, holds a jungle in a desert belt, has a live volcano at its centre and three unattributed devices on its rim. The expedition's working position is that those four facts are related, and that they have no way to demonstrate it.",
		},
	},
})

SubsOf("Winterspring", {
	{
		name = "Frostfire Hot Springs", faction = "Contested",
		hook = "Hot springs in the southern snows, which is a stranger combination than it sounds.",
		lore = {
			"The Frostfire springs run warm in the middle of Winterspring's ice. Elemental activity is the explanation generally offered, and the Horde's shaman take more interest in them than anybody else does.",
			"Winterspring has several places where the elements press close. Frostwhisper Gorge in the west is held by ice and water elementals outright, and the shaman read both sites as signs that something nearby has been knocked out of balance.",
		},
	},
	{
		name = "Timbermaw Post", faction = "Neutral",
		hook = "A Timbermaw outpost in the snow, held by the furbolgs who stayed sane.",
		lore = {
			"The Timbermaw are the furbolg tribe that resisted the corruption, and their tunnel-hold connects Felwood, Winterspring and Moonglade. Posts like this one are how they watch their own ground.",
			"They are suspicious of everyone, with cause. Most of their kin have gone mad and most outsiders have treated furbolgs as monsters on sight. Earning their trust takes real work, and it is the only way to use their tunnels.",
		},
	},
})

SubsOf("The Barrens", {
	{
		name = "Thorn Hill", faction = "Hostile",
		hook = "A Razormane quilboar settlement on the hilltop between the Crossroads and Durotar.",
		lore = {
			"Thorn Hill is a settlement of some size, set on the north face of a hilltop on the road between the Crossroads and Durotar. The Razormane hold it in numbers.",
			"Its position is the whole problem. That road is the main link between Orgrimmar and the Barrens' interior, and the Horde does not control the ground beside it. Quilboar were in this country long before the orcs crossed the sea and have never recognised the claim.",
		},
	},
	{
		name = "Boulder Lode Mine", faction = "Hostile",
		hook = "A Venture Company mine in the north, extracting without having asked.",
		lore = {
			"Boulder Lode is a goblin operation. The Venture Company works without any pretence of neutrality or restraint, and it has mines, camps and sludge works across the Barrens.",
			"The Horde wants it stopped. Venture Co. has no central authority to pressure and no reputation to protect, and the same firm is doing the same thing in Mulgore, Stonetalon and Stranglethorn.",
		},
	},
	{
		name = "Blackthorn Ridge", faction = "Hostile",
		hook = "A quilboar ridge in the southern Barrens, between the Horde and Razorfen.",
		lore = {
			"Blackthorn Ridge is quilboar ground on the route south. Razorfen Kraul and Razorfen Downs are the tribe's great sites, and ridges like this one are the ordinary business of holding the country between them.",
			"Quilboar build around thorn growths they tend with real care. Agamaggan, the boar demigod killed in the War of the Ancients, is where their religion and their architecture both begin, and the thorns are not decorative.",
		},
	},
	{
		name = "The Merchant Coast", faction = "Contested",
		hook = "The southeastern coast, worked by pirates and named with some optimism.",
		lore = {
			"The Merchant Coast runs along the Barrens' southeastern shore, and the name describes an intention rather than a condition. Southsea pirates work this water.",
			"Ratchet is a short way north, and the boat from Ratchet to Booty Bay is the main cross-faction sea route in the world. Pirates on a coast that busy are a structural feature rather than an accident.",
		},
	},
	{
		name = "Agama'gor", faction = "Hostile",
		hook = "A Bristleback quilboar settlement north of the road west out of Camp Taurajo.",
		lore = {
			"Agama'gor is a sizeable Bristleback holding, just north of the road running west from Camp Taurajo. The tauren treat it as standing business rather than as a campaign.",
			"Two quilboar tribes work this zone: the Razormane in the north around Thorn Hill, and the Bristleback in the south. Behind both stand Razorfen Kraul and Razorfen Downs, which are less a pair of camps than what remains of a civilisation's centres.",
		},
	},
})

SubsOf("Silithus", {
	{
		name = "Staghelm Point", faction = "Contested",
		hook = "A tower on the desert's edge carrying the Staghelm name, for reasons nobody wrote down.",
		lore = {
			"Which Staghelm the point was named for is not recorded. Archdruid Fandral Staghelm led the night elf armies in the War of the Shifting Sands, fought against the qiraji in this desert a thousand years ago, and his son Valstann fell in it.",
			"Fandral now leads the Cenarion Circle in Malfurion Stormrage's absence, and he is the archdruid who pushed hardest for Teldrassil and for recovering the night elves' lost immortality. Whichever Staghelm the tower stands for, the family's business in Silithus ended badly.",
		},
	},
	{
		name = "The Scarab Dais", faction = "Contested",
		hook = "The dais before the Gates, where the Scepter of the Shifting Sands gets used.",
		lore = {
			"The Scarab Dais stands in front of the Gates of Ahn'Qiraj. The Scepter of the Shifting Sands is the key to the Scarab Wall, and the dais is where it is brought to bear.",
			"The scepter was broken and its pieces scattered, partly so that nobody could open the gates casually. Reassembling it is now argued for seriously, on the grounds that opening Ahn'Qiraj deliberately with an army ready beats waiting for the qiraji to come out on a schedule of their own choosing.",
		},
	},
	{
		name = "Ortell's Hideout", faction = "Hostile",
		hook = "A Twilight Hammer hideout in the rocks, run by a cultist with a grievance.",
		lore = {
			"The Twilight Hammer keep camps and hideouts across Silithus, and their aim is stated rather than suspected: they want C'Thun free. They worship the Old Gods and hold that this world should end.",
			"Places like this one house the people doing the quiet work. The Cenarion Circle has been rolling up cultists in this desert for years without getting to the bottom of the organisation.",
		},
	},
})

-- ===========================================================================
-- THIRD PASS
--
-- The second pass covered the places on tools/places.tsv. This covers the rest
-- of the named areas I am confident exist in the 1.12 world. Where I am not
-- sure of a spelling I have left the place out rather than guess: an entry
-- whose name never matches is dead weight, and /ftn gaps will surface it.
-- ===========================================================================

SubsOf("Elwynn Forest", {
	{
		name = "Northshire Vineyards", faction = "Alliance",
		hook = "The Abbey's own vineyard, worked by the brotherhood between lessons.",
		lore = {
			"Northshire Abbey feeds itself. The vineyard on the valley floor is part of that, tended by the same clerics who teach in the halls above, and the wine goes to the Abbey's table rather than to market.",
			"Kobolds have been getting into the rows. A good number of Stormwind recruits are first handed a weapon because of it. It is a small job on purpose.",
		},
	},
	{
		name = "Echo Ridge Mine", faction = "Hostile",
		hook = "A worked-out mine above the Abbey, and the first fight most Stormwind recruits ever have.",
		lore = {
			"Echo Ridge was a shallow working in the ridge above Northshire, long since emptied of anything worth digging for. Kobolds moved in once the miners left, as they do everywhere in Elwynn.",
			"The mine's real use now is training. It is close to the Abbey, it has one way in, and the things inside it are dangerous enough to be worth taking seriously and not dangerous enough to lose a recruit over.",
		},
	},
	{
		name = "Maclure Vineyards", faction = "Alliance",
		hook = "One of two vineyards south of Goldshire, and one half of a feud nobody can explain.",
		lore = {
			"The Maclures grow grapes on the southern slopes, as the Stonefields do a short walk away. Between them they supply most of the wine in this part of the kingdom.",
			"The two families have been at each other for years over a dispute whose origins depend entirely on which farmhouse you ask in. Goldshire's magistrate has stopped trying to settle it.",
		},
	},
	{
		name = "Stonefield Farm", faction = "Alliance",
		hook = "The other southern vineyard, and the other half of the argument.",
		lore = {
			"The Stonefields farm the land beside the Maclures and get on with them about as well as two families can when they have been accusing each other of theft for a generation.",
			"Both farms also have a kobold problem and a gnoll problem, which they manage separately and without speaking, because that would mean speaking.",
		},
	},
	{
		name = "Thunder Falls", faction = "Contested",
		hook = "A waterfall in the eastern forest, loud enough to name itself.",
		lore = {
			"The falls come down off the high ground toward Eastvale, feeding the streams that water the eastern half of Elwynn.",
			"Nothing of consequence has ever happened here, which in a kingdom that has been sacked once and is currently losing three counties counts as a recommendation.",
		},
	},
	{
		name = "Mirror Lake Orchard", faction = "Alliance",
		hook = "The orchard above Mirror Lake, supplying a good share of Stormwind's cider.",
		lore = {
			"The orchard works the slopes above the lake and sends its fruit up the road to the city. Between this and the vineyards to the south, Elwynn drinks well for a county with a gnoll problem.",
			"Kobolds have been coming up out of the hills into the rows. The farmhands deal with it themselves, since the militia is busy further west.",
		},
	},
	{
		name = "Forest's Edge", faction = "Contested",
		hook = "Where Elwynn's trees give out and Westfall's dust begins.",
		lore = {
			"The change is abrupt. On one side the forest is green and worked; on the other the soil thins out and the farms stop. Anyone walking west sees the kingdom's problem laid out in a few hundred paces.",
			"Westbrook Garrison watches this ground, mostly for gnolls coming out of the hills and increasingly for Defias coming the other way.",
		},
	},
	{
		name = "Jerod's Landing", faction = "Contested",
		hook = "A landing on the southern river, on the road down into the dark woods.",
		lore = {
			"The landing sits where the road south crosses toward Duskwood, and it is the last ordinary place a traveller passes before the trees close over.",
			"Elwynn's southern boundary is a real one. The forest on the far side has not seen daylight in years and the Night Watch has its hands full keeping the road open at all.",
		},
	},
	{
		name = "Stormwind Gates", faction = "Alliance",
		hook = "The approach to the city, where Elwynn's road runs up to the walls.",
		lore = {
			"The gates face east into Elwynn, with the Valley of Heroes and its statues on the far side of them. Everything that enters Stormwind by land comes through here.",
			"The walls are part of the reconstruction. Stormwind was taken once, in the First War, and the city that was rebuilt afterwards was built by people who had watched it happen.",
		},
	},
})

SubsOf("Dun Morogh", {
	{
		name = "Brewnall Village", faction = "Alliance",
		hook = "A small dwarven village in the western snows, close to the trolls and the gnomes both.",
		lore = {
			"Brewnall sits out west, past Kharanos, in the part of Dun Morogh where the Frostmane trolls have the run of the high ground. It is a working village with no walls to speak of.",
			"Gnomeregan is not far. Since the city fell, the traffic through here has been refugees going one way and volunteers going the other, and the villagers have got used to both.",
		},
	},
	{
		name = "Amberstill Ranch", faction = "Alliance",
		hook = "A ram ranch east of Kharanos, breeding the mounts Ironforge rides.",
		lore = {
			"The Amberstills breed mountain rams. That is how dwarves get about. A ram will go up ground a horse will not look at, and in Dun Morogh that is not a preference.",
			"The ranch loses stock to Frostmane raids and to the wildlife, and the family has a standing arrangement with anybody passing who can do something about either.",
		},
	},
	{
		name = "Helm's Bed Lake", faction = "Contested",
		hook = "A frozen lake in eastern Dun Morogh, on the road toward Loch Modan.",
		lore = {
			"Helm's Bed lies on the eastern side of the mountains, where the road runs down through the Valley of Kings toward Loch Modan.",
			"Dun Morogh's lakes stay frozen most of the year and the dwarves fish them through the ice. It is a practical arrangement that the Frostmane keep interrupting.",
		},
	},
	{
		name = "Shimmer Ridge", faction = "Hostile",
		hook = "A high ridge west of Kharanos, held by the Frostmane.",
		lore = {
			"Shimmer Ridge is Frostmane ground. The ice trolls were pushed into the high cold parts of this mountain when the dwarves expanded out of Ironforge, and ridges like this one are what they were left with.",
			"They raid down from here onto the road and the ranches. From a Frostmane point of view every dwarven building in Dun Morogh is on taken ground, and nobody has ever put a counter-argument to them beyond holding it.",
		},
	},
	{
		name = "Coldridge Pass", faction = "Alliance",
		hook = "The single pass out of the training valley, and the only way in or out of it.",
		lore = {
			"Coldridge Valley has one entrance, and this is it. The arrangement is why Ironforge trains its recruits down there: one road to watch, and nothing comes in that the instructors have not seen coming.",
			"Walking out through the pass is the point at which a dwarf stops being a recruit. On the far side the mountain stops being supervised.",
		},
	},
	{
		name = "The Tundrid Hills", faction = "Contested",
		hook = "Open snow between Kharanos and the eastern road.",
		lore = {
			"The Tundrid Hills are the rolling ground in the middle of Dun Morogh, crossed by anyone travelling between Kharanos and the Gates of Ironforge.",
			"Wolves and boars work the hills, and the Frostmane come down out of the ridges to the west. The road is patrolled; the hills either side of it are not.",
		},
	},
	{
		name = "Chill Breeze Valley", faction = "Contested",
		hook = "A valley in the north, with wolves in numbers.",
		lore = {
			"Chill Breeze runs north of the main road, and the wolf population in it is large enough that Ironforge's hunters treat it as a working ground rather than a hazard.",
			"Dun Morogh's wildlife is one of the reasons the dwarves are as hardy as they are. There is nothing gentle living on this mountain.",
		},
	},
})

SubsOf("Tirisfal Glades", {
	{
		name = "Solliden Farmstead", faction = "Hostile",
		hook = "A Lordaeron farm whose family is still on the land, after a fashion.",
		lore = {
			"The Sollidens farmed this ground before the plague, like half the families in Tirisfal. What is walking the fields now got up without its mind.",
			"The Forsaken make a sharp distinction between themselves and what is out here. Free will is the only thing separating the two, and they test for it the moment somebody sits up.",
		},
	},
	{
		name = "Nightmare Vale", faction = "Hostile",
		hook = "A stretch of blighted ground west of Brill, named by people who had to cross it.",
		lore = {
			"The vale is one of the places in Tirisfal where the plague went deepest into the soil. What grows here is wrong and what lives here is worse.",
			"Lordaeron's farmland was the best in the north. That it now produces this is the single most complete thing the Scourge managed anywhere.",
		},
	},
	{
		name = "Venomweb Vale", faction = "Hostile",
		hook = "Spider country in the northwest, and the spiders are not the size they were.",
		lore = {
			"Venomweb Vale holds one of the larger spider populations in Tirisfal, and the plague has not made them smaller.",
			"Much of what lives in these glades now is bigger and meaner than it was when this was farmland. The Forsaken have stopped treating that as remarkable.",
		},
	},
	{
		name = "Brightwater Lake", faction = "Contested",
		hook = "A lake east of Brill with a name from before the plague.",
		lore = {
			"Brightwater was named when the name fitted. It sits east of Brill, in what used to be some of the most productive country in Lordaeron.",
			"The Forsaken have not renamed anything in Tirisfal. Deathknell is the exception, and it was named after rather than before.",
		},
	},
	{
		name = "Cold Hearth Manor", faction = "Hostile",
		hook = "A gentry house in the northern glades, empty of anyone who would recognise it.",
		lore = {
			"The manor belonged to one of Lordaeron's lesser noble families. Houses like it are scattered across Tirisfal, and almost none of them are occupied by their owners now.",
			"The Forsaken use some of these buildings and leave others. Which is which tends to depend on how structurally sound the roof is rather than on sentiment.",
		},
	},
	{
		name = "Crusader's Outpost", faction = "Hostile",
		hook = "A Scarlet Crusade post on the eastern road, watching the Forsaken.",
		lore = {
			"The Crusade holds a string of positions on the eastern side of Tirisfal, between Brill and the Monastery. This is one of them.",
			"They treat anybody possibly infected as already lost, which in practice means anybody at all. Refugees have been executed at posts like this one on suspicion alone.",
		},
	},
	{
		name = "Scarlet Watch Post", faction = "Hostile",
		hook = "Another Crusade position on the Monastery road.",
		lore = {
			"The watch posts screen the approach to the Scarlet Monastery, which the Crusade holds as a fortress rather than as the cathedral and seminary it was built to be.",
			"Lordaeron's priesthood used that building as a seat of learning. The order occupying it now considers the Argent Dawn traitors for working alongside the Forsaken.",
		},
	},
})

SubsOf("Silverpine Forest", {
	{
		name = "North Tide's Hollow", faction = "Hostile",
		hook = "A murloc hollow on the northern coast.",
		lore = {
			"The hollow sits on Silverpine's northern shoreline, where murlocs have come up out of the water and stayed, as they do on every coast in the world.",
			"Nobody has established where murlocs come from. Lordaeron's scholars were working on it before there stopped being Lordaeron scholars.",
		},
	},
	{
		name = "Olsen's Farthing", faction = "Hostile",
		hook = "An abandoned Silverpine holding on the road south.",
		lore = {
			"Olsen's was a working farm when Silverpine still had working farms. The people who lived here left, or did not, and the forest has been taking the buildings back since.",
			"Silverpine is a corridor now rather than a country. Everything between Tirisfal and the Greymane Wall is either held by the Forsaken, the worgen or nobody.",
		},
	},
	{
		name = "The Dead Field", faction = "Hostile",
		hook = "A field south of the Sepulcher that has stopped growing anything.",
		lore = {
			"The Dead Field is exactly what the name says, and it is close enough to the road that travellers see it whether they want to or not.",
			"Silverpine took the plague's edge rather than its full weight. That was enough to finish the farming.",
		},
	},
	{
		name = "The Skittering Dark", faction = "Hostile",
		hook = "A cave of spiders in the southern forest, and the name is a warning.",
		lore = {
			"The Skittering Dark is a spider cave on the way south toward the Greymane Wall. Silverpine's spiders were a problem before any of the zone's other problems arrived.",
			"The Forsaken keep the road nominally clear and the spiders keep disagreeing with them about it.",
		},
	},
	{
		name = "Valgan's Field", faction = "Hostile",
		hook = "Another emptied farm, with worgen in the treeline.",
		lore = {
			"Valgan's is one of several holdings between the Sepulcher and Pyrewood that have been abandoned since Arugal's worgen got loose in this forest.",
			"The archmage summoned them out of another world as weapons against the Scourge and lost control of them immediately. They have been spreading ever since.",
		},
	},
	{
		name = "The Decrepit Ferry", faction = "Contested",
		hook = "A ferry landing on the lake shore, with nothing left that floats.",
		lore = {
			"The ferry crossed to Fenris Isle out in Lordamere Lake, back when there was a reason to go there.",
			"Fenris Keep on the island is worgen-held now. Nobody is running a service to it.",
		},
	},
	{
		name = "The Ivar Patch", faction = "Hostile",
		hook = "A smallholding north of the Sepulcher, worked by whatever is left of the Ivars.",
		lore = {
			"The Ivar patch is one of Silverpine's smaller farms, and like most of them it has outlived the people who kept it.",
			"Some of Tirisfal's Forsaken went back to their own land and carried on. Silverpine's did not, mostly because Silverpine's dead did not come back with their minds.",
		},
	},
})

SubsOf("Westfall", {
	{
		name = "The Molsen Farm", faction = "Hostile",
		hook = "An abandoned farmstead in the north, taken over by the Defias.",
		lore = {
			"The Molsens left like most of Westfall's tenants, and the Brotherhood moved into the buildings. Several of the zone's farms have gone the same way.",
			"The farms were not destroyed. They were left standing and empty, and useful to an organisation that needed somewhere to be.",
		},
	},
	{
		name = "Jangolode Mine", faction = "Hostile",
		hook = "A worked-out mine in the north of the zone, with Defias in it.",
		lore = {
			"Jangolode was a legitimate operation before the ore ran thin. The Brotherhood uses it now. A guild of excavators finding a use for an empty shaft is no surprise.",
			"Westfall has several of these. Moonbrook's mine, the Gold Coast quarry and this one were all somebody's livelihood a few years ago.",
		},
	},
	{
		name = "The Dead Acre", faction = "Contested",
		hook = "A field that stopped producing before the rest of Westfall did.",
		lore = {
			"The Dead Acre went first. The soil here gave out early, and the farmers who worked the land around it watched and drew conclusions.",
			"Drought took part of Westfall and neglect took the rest. The kingdom's attention and money went north after the wars and never properly came back.",
		},
	},
})

SubsOf("Loch Modan", {
	{
		name = "The Loch", faction = "Alliance",
		hook = "The lake the valley is named for, held in place by dwarven engineering.",
		lore = {
			"The Loch fills the middle of the valley and exists in its present shape because the Stonewrought Dam holds it there. Without the dam this would be a river.",
			"Fishing it is a serious local industry and the water feeds everything downstream into the Wetlands. Dwarves do not build things like the dam for ornament.",
		},
	},
	{
		name = "Stonesplinter Valley", faction = "Hostile",
		hook = "A valley of troggs on the loch's western side.",
		lore = {
			"The Stonesplinter troggs hold this valley and come up out of the deep tunnels into the dwarven workings above.",
			"Troggs are the titans' first attempt at what became the earthen, and the earthen became the dwarves. Ironforge has had to absorb that relationship and does not enjoy discussing it.",
		},
	},
	{
		name = "Algaz Station", faction = "Alliance",
		hook = "A dwarven post at the northern gate, watching the road down into the Wetlands.",
		lore = {
			"Algaz Station guards the approach to Dun Algaz, the pass that carries the road from Loch Modan down into the Wetlands. Everything moving between Khaz Modan's interior and the coast comes through.",
			"The Dragonmaw orcs in the Wetlands make that road worth watching properly, and the garrison here is not decorative.",
		},
	},
	{
		name = "Dun Algaz", faction = "Hostile",
		-- The client also reports this pass as "Algaz Gate".
		aliases = { "Algaz Gate", "The Algaz Gate" },
		hook = "The tunnel pass between Loch Modan and the Wetlands, and it is not securely held.",
		lore = {
			"Dun Algaz is a dwarven-cut pass through the mountains, and it is the land link between Loch Modan and the coast. The dwarves built it, fortified it, and have been fighting over it since.",
			"Dragonmaw orcs use the tunnels. The clan that enslaved the red dragonflight in the Second War scattered afterwards, and a hard core of them ended up in these hills.",
		},
	},
})

SubsOf("Redridge Mountains", {
	{
		name = "Rethban Caverns", faction = "Hostile",
		hook = "A mine in the western cliffs, worked for ore and infested with kobolds.",
		lore = {
			"Rethban was dug for the red ore the mountains are named for. Kobolds have the run of it now, the standard fate of an abandoned shaft anywhere near Elwynn.",
			"Lakeshire would like it back. Lakeshire would like a great many things back, and is currently holding a bridge with volunteers.",
		},
	},
	{
		name = "Lakeridge Highway", faction = "Contested",
		hook = "The road along the lake, and the only way through the zone.",
		lore = {
			"The highway runs the length of Lake Everstill and over the bridge at Lakeshire. Everything crossing Redridge uses it, including the things Redridge would rather did not.",
			"The bridge is the zone's weak point and the orcs in Stonewatch know it. Repairing it is a recurring item of town business.",
		},
	},
})

SubsOf("Duskwood", {
	{
		name = "The Rotting Orchard", faction = "Hostile",
		hook = "An orchard behind Raven Hill that has not produced anything edible in years.",
		lore = {
			"The orchard stands near the cemetery and has gone the way of everything else in this part of the county. Nothing grown in Duskwood since the dark came has been worth harvesting.",
			"The Night Watch patrols the road past it and does not go in. Their standing practice is to write off anything more than a patrol's reach from the road.",
		},
	},
	{
		name = "Dawning Wood Catacombs", faction = "Hostile",
		hook = "Catacombs in the eastern woods, which in Duskwood is a specific kind of problem.",
		lore = {
			"The catacombs are an old burial site in the eastern half of the forest, well away from Darkshire and well outside what the Night Watch can cover.",
			"Duskwood's dead do not reliably stay buried, and the county has a great many places like this one. The town's funeral customs have changed accordingly.",
		},
	},
})

SubsOf("Wetlands", {
	{
		name = "Black Channel Marsh", faction = "Hostile",
		hook = "A stretch of dark water in the southern marsh, murloc-held.",
		lore = {
			"The Black Channel runs through the southern Wetlands and the murlocs along it are a standing nuisance to anything using the road.",
			"Everything in this zone eventually becomes swamp. The dwarves who built the roads here knew that and built them raised.",
		},
	},
	{
		name = "Menethil Bay", faction = "Alliance",
		hook = "The water outside Menethil Harbor, and the Alliance's western shipping lane.",
		lore = {
			"The bay carries the traffic between Khaz Modan and Kalimdor. Ships out of Menethil run to Theramore in Dustwallow Marsh and north to Auberdine. This is the Alliance's main crossing between the continents.",
			"It is named for Lordaeron's royal house, as the port is, from the days when the Alliance of Lordaeron still held together.",
		},
	},
})

SubsOf("Hillsbrad Foothills", {
	{
		name = "Western Strand", faction = "Contested",
		hook = "The beach west of Southshore, with murlocs and wreckage on it.",
		lore = {
			"The strand runs along the bay west of the town. Southshore is a fishing port and this is part of what it fishes.",
			"Murlocs work the shoreline here and the town's militia deals with them when it has anybody spare. Tarren Mill sees to it that this is rare.",
		},
	},
	{
		name = "Eastern Strand", faction = "Contested",
		hook = "The beach east of Southshore, looking out toward Purgation Isle.",
		lore = {
			"The eastern strand faces the small islands off the Hillsbrad coast. Purgation Isle is the nearest of them.",
			"What the Scarlet Crusade does on that island is well outside anything the Church of the Holy Light would sanction, and the name is not a metaphor.",
		},
	},
})

SubsOf("Alterac Mountains", {
	{
		name = "Lordamere Lake", faction = "Contested",
		hook = "The great lake below the mountains, with a drowned past on its shores.",
		lore = {
			"Lordamere separates the Alterac Mountains from Silverpine and the Hillsbrad lowlands. Fenris Isle sits out in it, and Dalaran's crater is not far from its southern shore.",
			"The lake kept its name when the kingdoms around it stopped keeping theirs. Alterac was dismantled for treason and Lordaeron was destroyed outright.",
		},
	},
	{
		name = "Gallows' Corner", faction = "Contested",
		hook = "A crossroads in the southern mountains with an unencouraging name.",
		lore = {
			"The corner is where the roads through southern Alterac meet, on the way between Hillsbrad and the Arathi Highlands.",
			"Alterac has no law. The Syndicate works these roads and the Crushridge ogres work the high ground above them, and the name predates both.",
		},
	},
	{
		name = "Misty Shore", faction = "Contested",
		hook = "The lake shore below the mountains, under more or less permanent fog.",
		lore = {
			"The shore runs along Lordamere's northern edge beneath the Alterac peaks. The fog off the lake rarely lifts entirely.",
			"Dalaran's crater sits behind this coast under its containment dome, and it does nothing good for the weather or for anything living nearby.",
		},
	},
})

SubsOf("Arathi Highlands", {
	{
		name = "O'Breen's Encampment", faction = "Hostile",
		hook = "A Syndicate camp on the southern road through the Highlands.",
		lore = {
			"The Syndicate works the Highlands as thoroughly as it works Hillsbrad, and camps like this one sit on the roads between Refuge Pointe and the coast.",
			"They are Alterac's dispossessed nobility and their retainers. The kingdom was broken up for King Aiden Perenolde's dealings with the Horde, and they have been funding a grudge ever since.",
		},
	},
	{
		name = "Witherbark Caverns", faction = "Hostile",
		hook = "Forest troll caves in the eastern Highlands.",
		lore = {
			"The Witherbark hold these caves as they hold their village further north. They are Amani forest trolls, and their presence in the Highlands is older than any human claim on it.",
			"Arathor's founding war was fought against the Amani Empire, with high elven help. The trolls lost and have never accepted the result.",
		},
	},
})

SubsOf("Stranglethorn Vale", {
	{
		name = "The Savage Coast", faction = "Contested",
		hook = "The northern coastline of the vale, between the jungle and the sea.",
		lore = {
			"The Savage Coast runs along Stranglethorn's northwestern shore. The Bloodscalp hold the ground behind it and the water in front of it belongs to whatever is in the water.",
			"Every stretch of this jungle has a claim on it: trolls, ogres, the Venture Company, Kurzen's deserters and the goblins at the southern tip. The coast is no different.",
		},
	},
	{
		name = "Ruins of Aboraz", faction = "Hostile",
		hook = "Gurubashi ruins on the southern coast, with the sea taking the lower levels.",
		lore = {
			"Aboraz is one of the chain of Gurubashi sites running the length of the vale. The empire built right down to the waterline and in places beyond it.",
			"How much of their work is underwater is a measure of how far this coast has moved. The Sundering raised the sea over ground that had been dry.",
		},
	},
	{
		name = "Nek'mani Wellspring", faction = "Hostile",
		hook = "A spring in the southern jungle, built around by the trolls who found it.",
		lore = {
			"Fresh water in Stranglethorn meant the same to the Gurubashi as it does to anyone, and they built where it was. The wellspring is one of those places.",
			"Skullsplitter trolls hold the southern vale now, squatting in their own ancestors' stonework, and their war with the Bloodscalp in the north is older than any human kingdom.",
		},
	},
	{
		name = "Mistvale Valley", faction = "Hostile",
		hook = "A valley in the southern jungle, thick with gorillas.",
		lore = {
			"Mistvale holds one of the larger gorilla populations in the vale, which in Stranglethorn means something worth taking seriously.",
			"Hemet Nesingwary's expedition came to this jungle for exactly this. The dwarf hunts the largest animals he can find and has made a career of it across the world.",
		},
	},
	{
		name = "Janeiro's Point", faction = "Contested",
		hook = "A point on the eastern coast, named for somebody the sea kept.",
		lore = {
			"The point juts out on Stranglethorn's eastern shore, north of the Horde's camp at Grom'gol.",
			"This coast has taken a steady toll of shipping. Between the reefs, the weather and the Bloodsail pirates working the water, a good deal has gone down within sight of the trees.",
		},
	},
	{
		name = "Bloodsail Compound", faction = "Hostile",
		hook = "A pirate camp on the southern coast, run by the Bloodsail Buccaneers.",
		lore = {
			"The Bloodsail work this water and they have a particular quarrel with Booty Bay. Baron Revilgaz runs the port and the Bloodsail would like to run it instead.",
			"Booty Bay's neutrality is commercial rather than principled, and the Steamwheedle Cartel enforces it with bruisers. Pirates who threaten the business find out how seriously the cartel takes it.",
		},
	},
	{
		name = "Kal'ai Ruins", faction = "Hostile",
		hook = "A Gurubashi ruin in the northern jungle, held by Bloodscalp trolls.",
		lore = {
			"Kal'ai is another of the empire's sites, reoccupied by its own descendants. The Bloodscalp hold the northern end of the vale from ruins like this one.",
			"Nothing has been built in Stranglethorn since the Gurubashi broke apart. Every stone structure in the jungle predates that collapse.",
		},
	},
	{
		name = "Mizjah Ruins", faction = "Hostile",
		hook = "Ruins on the eastern side of the vale, overgrown past the point of use.",
		lore = {
			"Mizjah sits in the eastern jungle and the trees have had their way with it more thoroughly than with most.",
			"The Gurubashi collapse is usually dated to the war their own priests started by summoning Hakkar the Soulflayer. The empire had to fight to contain what it had called up, and it did not survive the effort.",
		},
	},
})

SubsOf("Badlands", {
	{
		name = "Camp Boff", faction = "Hostile",
		hook = "The third of the Badlands ogre camps, on the western road.",
		lore = {
			"Three ogre camps sit across the Badlands holding the roads: Boff, Kosh and Cagg. None of them has an objective beyond the next caravan.",
			"Ogres east of the sea are the Old Horde's leavings, brought over by Gul'dan during the Second War and left behind when it ended.",
		},
	},
})

SubsOf("The Hinterlands", {
	{
		name = "Bogen's Ledge", faction = "Contested",
		hook = "A ledge on the southern cliffs, with a long drop and a longer view.",
		lore = {
			"The ledge overlooks the southern end of the Hinterlands, where the forest falls away toward the Highlands.",
			"The Wildhammers ride gryphons, which makes ground like this less of an obstacle for them than for anyone else. No other dwarven clan ever managed to tame them.",
		},
	},
})

SubsOf("Western Plaguelands", {
	{
		name = "The Weeping Cave", faction = "Hostile",
		hook = "A cave in the western hills, and the name is not decorative.",
		lore = {
			"The cave sits in the hills above the plague farms, and what is in it belongs to the same operation as the cauldrons below.",
			"The Argent Dawn maps the places in this zone where the blight is being actively maintained rather than merely lingering. Something keeping it going is a worse problem than something left over.",
		},
	},
	{
		name = "Darrowmere Lake", faction = "Contested",
		hook = "The lake around Caer Darrow, with a school of necromancy on the island in it.",
		lore = {
			"Darrowmere separates Caer Darrow from the shore. The island held the Barov family's estate, a wealthy and entirely respectable holding before Kel'Thuzad took an interest in it.",
			"He promised the family immortality, murdered them for it, and turned the crypts under the manor into Scholomance. The Barovs' surviving relatives on both sides of the faction divide are still litigating the deeds.",
		},
	},
})

SubsOf("Eastern Plaguelands", {
	{
		name = "Blackwood Lake", faction = "Contested",
		hook = "A lake in the western Plaguelands, fed by water nobody should drink.",
		lore = {
			"Blackwood sits in the western half of the zone, between the Thondroril crossing and the Fungal Vale.",
			"Water in the Plaguelands carries the blight the way the soil does. The Argent Dawn's people bring their own.",
		},
	},
	{
		name = "Pestilent Scar", faction = "Hostile",
		hook = "An open wound of corrupted ground in the middle of the zone.",
		lore = {
			"The scar is one of the places where the blight has eaten through to something underneath. Nothing crosses it that does not have to.",
			"The Scourge does not occupy the Eastern Plaguelands so much as run it. Farms, graveyards, towers and scars all feed the same work.",
		},
	},
	{
		name = "Mazra'Alor", faction = "Hostile",
		hook = "An Amani troll site in the northeast, taken by the Scourge.",
		lore = {
			"Mazra'Alor is troll work, part of the Amani presence that predates everything human in this region. Zul'Mashar is close by.",
			"The trolls' holdings in the north were already in decline before the plague arrived. The Scourge finished the job and kept the buildings.",
		},
	},
	{
		name = "Browman Mill", faction = "Hostile",
		hook = "A Lordaeron mill in the east, still standing and badly occupied.",
		lore = {
			"The mill worked grain for the eastern settlements before the plague. Given what the Cult of the Damned later did with Lordaeron's grain, it was a grim trade to have been in.",
			"Andorhal was where the infected shipments went out from. Everything downstream of that, including mills like this one, handled it without knowing.",
		},
	},
})

SubsOf("Deadwind Pass", {
	{
		name = "Diamondhead River", faction = "Contested",
		hook = "The river running through the pass, under Karazhan's shadow.",
		lore = {
			"The Diamondhead runs the length of the canyon, between Duskwood and the Swamp of Sorrows. It is the only thing in Deadwind Pass that moves with any purpose.",
			"There is no inn, no flight path and no settlement anywhere in this zone. Travellers cross it without stopping.",
		},
	},
	{
		name = "Morgan's Plot", faction = "Contested",
		hook = "A graveyard in the pass, which raises the question of who buried them.",
		lore = {
			"The plot is a burial ground in a canyon with no living population. There was a village in Deadwind Pass once, and the records on what happened to it are thin.",
			"Karazhan stands above all of it. Medivh's tower has been sealed since he died in it, and the few expeditions that have gone in have not come back with a coherent account.",
		},
	},
})

SubsOf("Durotar", {
	{
		name = "Kolkar Crag", faction = "Hostile",
		hook = "A centaur camp in northern Durotar, raiding down from the Barrens.",
		lore = {
			"The Kolkar are centaur, and centaur are the reason the tauren were nomads for generations before the Horde arrived in Kalimdor. They hunted them across the continent.",
			"Having them inside Durotar's borders is a problem Razor Hill handles rather than solves. The clans trace themselves to Zaetar, a son of the demigod Cenarius, and the earth elemental princess Theradras, and they have the temperament that suggests.",
		},
	},
	{
		name = "Tor'kren Farm", faction = "Horde",
		hook = "A Horde farm in western Durotar, which is harder work than it sounds.",
		lore = {
			"Farming Durotar is a deliberate act of stubbornness. The orcs picked arid country on purpose, having been handed fertile land before as a gift with a leash attached, and they intend to owe nobody.",
			"The farm's problems are the zone's: Razormane quilboar in the hills, who were here long before the Horde crossed the sea and do not recognise the claim.",
		},
	},
	{
		name = "Bladefist Bay", faction = "Horde",
		hook = "Orgrimmar's harbour, named for an orc who cut off his own hand.",
		lore = {
			"The bay serves Orgrimmar and carries what shipping the Horde has on this coast. It is named for Kargath Bladefist, chieftain of the Shattered Hand.",
			"Kargath was held in a gladiator pit and severed his own hand to get free of the shackle, replacing it with a blade. His clan took its name from the act.",
		},
	},
	{
		name = "Southfury River", faction = "Contested",
		hook = "The river between Durotar and the Barrens, and the border in practice.",
		lore = {
			"The Southfury runs down the western side of Durotar and marks where the orcs' land ends and the Barrens begin. Crossing it is how most traffic enters or leaves.",
			"Durotar is named for Durotan, chieftain of the Frostwolf clan and Thrall's father, who refused the demon blood when Gul'dan offered it to the clans and was murdered for it.",
		},
	},
})

SubsOf("Mulgore", {
	{
		name = "Winterhoof Water Well", faction = "Horde",
		hook = "One of Mulgore's three tribal wells, kept by the Winterhoof.",
		lore = {
			"Three wells stand on the Mulgore plains, one for each of the tauren tribes that settled here with the Bloodhoof. Water on open grassland is not a small thing.",
			"The wells are tended rather than owned. Tauren practice treats the land as something held in trust, and the Earthmother's teachings run through how they use it.",
		},
	},
	{
		name = "Thunderhorn Water Well", faction = "Horde",
		hook = "The Thunderhorn tribe's well, out on the eastern plains.",
		lore = {
			"The Thunderhorn keep this one, as the Winterhoof and the Wildmane keep theirs. Between them the three wells water the herds across Mulgore.",
			"The tauren have only been settled here a few years. Before Thrall's Horde helped them break the centaur they followed the kodo and kept nothing permanent at all.",
		},
	},
	{
		name = "Wildmane Water Well", faction = "Horde",
		hook = "The third of the tribal wells, in the western plains.",
		lore = {
			"The Wildmane tend this well on Mulgore's western side, under the bluffs.",
			"Something has been fouling the wells, which for the tauren is closer to a desecration than a practical problem. Water, land and the Earthmother are not separable concepts in how they think about it.",
		},
	},
})

SubsOf("Teldrassil", {
	{
		name = "Fel Rock", faction = "Hostile",
		hook = "A cave near Shadowglen with things in it that should not be on this tree.",
		lore = {
			"Fel Rock sits close to the night elves' training glade. What is inside it becomes a problem for every recruit who passes.",
			"Teldrassil was grown to win back the immortality the night elves spent destroying Archimonde at Mount Hyjal. It was planted without the dragon Aspects' blessings, it is sick, and caves like this one are part of how that shows.",
		},
	},
	{
		name = "The Cleft", faction = "Contested",
		hook = "A split in the tree's bark wide enough to walk down.",
		lore = {
			"The Cleft runs between Dolanaar and the northern slopes. On a World Tree the geography is the organism, which takes some getting used to.",
			"Teldrassil is perhaps a few decades old. For a tree of this kind that is infancy, and the night elves who argued against planting it are being proved right slowly.",
		},
	},
	{
		name = "Wellspring Lake", faction = "Alliance",
		hook = "The lake the Wellspring River feeds, in the tree's north.",
		lore = {
			"The lake collects the water running off Teldrassil's upper slopes, with the Oracle Glade beyond it.",
			"Night elves watch their water. Moonwells are drawn from the Well of Eternity's waters and are the source of their healing and renewal, so a change in any spring on this tree gets noticed.",
		},
	},
	{
		name = "Ban'ethil Hollow", faction = "Hostile",
		hook = "The hollow above the barrow den, with Gnarlpine furbolgs in it.",
		lore = {
			"The hollow sits over the Ban'ethil Barrow Den, where night elf druids sleep while their minds walk the Emerald Dream.",
			"The Gnarlpine have broken into the den below. A druid's body left untended is just a body, and the furbolgs were allies until something on this tree drove them mad.",
		},
	},
})

SubsOf("Darkshore", {
	{
		name = "Wildbend River", faction = "Contested",
		hook = "A river crossing the southern coast, running down to the sea.",
		lore = {
			"The Wildbend cuts across Darkshore's southern stretch on its way to the water, below the Grove of the Ancients.",
			"The Ancients in that grove are enormous sentient trees and allies of the night elves since the War of the Ancients. They fought at Mount Hyjal, and they are not decorative.",
		},
	},
})

SubsOf("The Barrens", {
	{
		name = "The Tidus Stair", faction = "Contested",
		hook = "A sunken formation off the eastern coast, out in the water.",
		lore = {
			"The Tidus Stair lies off the Barrens' eastern shore, below the surface. Stepped stone underwater generally means somebody built it when the water was not there.",
			"The Barrens were not always barren, and this coastline was not always this coastline. The Sundering broke Kalimdor apart and the sea came in over a good deal of it.",
		},
	},
	{
		name = "Bramblescar", faction = "Hostile",
		hook = "Quilboar ground in the central Barrens, thorned over.",
		lore = {
			"Bramblescar is one of the quilboar holdings on the central plains, between the Crossroads and the southern road.",
			"Quilboar build around thorn growths they tend with real care. Agamaggan, the boar demigod killed fighting the Burning Legion in the War of the Ancients, is where their religion and their architecture both begin.",
		},
	},
	{
		name = "Dreadmist Den", faction = "Hostile",
		hook = "The cave under Dreadmist Peak, where the Burning Blade work.",
		lore = {
			"The den sits beneath the peak in the northern Barrens, and the Burning Blade hold both. They are orcs chasing the demonic power Thrall outlawed.",
			"The old Horde under Gul'dan was genuinely stronger than the one Thrall built, and there are orcs who would take that trade. The cults keep forming for that reason.",
		},
	},
	{
		name = "Southern Gold Road", faction = "Contested",
		hook = "The road south out of the Crossroads, toward Camp Taurajo.",
		lore = {
			"The Gold Road runs the length of the Barrens and this is its southern half, carrying everything moving between the Crossroads and the tauren camp.",
			"Kolkar centaur raid it, the Alliance comes up at it from Northwatch Hold on the coast, and the quilboar at Razorfen do not recognise the Horde's claim to any of it.",
		},
	},
})

SubsOf("Stonetalon Mountains", {
	{
		name = "Blackwolf River", faction = "Contested",
		hook = "The river through the southern range, running past the logging.",
		lore = {
			"The Blackwolf comes down through southern Stonetalon, past the ground the Horde is cutting and the ground the night elves are trying to keep.",
			"Orgrimmar was built from somewhere, and Kalimdor's forests are the nearest source. The Sentinels spent ten thousand years as these woods' guardians and read the whole business accordingly.",
		},
	},
})

SubsOf("Ashenvale", {
	{
		name = "Lake Falathim", faction = "Alliance",
		hook = "A lake in the northwest, with Astranaar's road running past it.",
		lore = {
			"Falathim sits in Ashenvale's northwestern corner, in ground the Sentinels still hold without having to fight for it weekly.",
			"That is unusual here. The eastern half of this forest is contested at close quarters, with Astranaar and Splintertree Post within a short march of one another.",
		},
	},
	{
		name = "Ruins of Ordil'Aran", faction = "Hostile",
		hook = "A night elf ruin in the west, from before the Sundering.",
		lore = {
			"Ordil'Aran is old night elf work, left from the empire that covered this continent before the Well of Eternity collapsed and broke it apart.",
			"Ashenvale is full of these. The Sentinels fighting for this forest are fighting over ground that already holds their own civilisation's wreckage.",
		},
	},
	{
		name = "Bathran's Haunt", faction = "Hostile",
		hook = "A ruin in the northern forest with a name the night elves gave it afterwards.",
		lore = {
			"The haunt is a night elf site in northern Ashenvale that has not stayed empty. Places here acquire names like this one when something takes up residence.",
			"Satyrs hold a good deal of this forest. They descend from night elves who sided with the Burning Legion in the War of the Ancients and were transformed for it, which is why the Sentinels treat them as traitors rather than as monsters.",
		},
	},
	{
		name = "The Shrine of Aessina", faction = "Contested",
		hook = "A shrine in the eastern forest to one of the wild gods.",
		lore = {
			"Aessina belongs to the older layer of night elf worship, the demigods and wild gods that predate anything organised. Shrines to them are scattered through Kalimdor's forests.",
			"Cenarius was the greatest of that company and the one who taught Malfurion Stormrage the first druidic magic. He was killed in these woods during the Third War.",
		},
	},
	{
		name = "Fallen Sky Lake", faction = "Contested",
		hook = "A lake in a crater in the eastern forest, and the name explains itself.",
		lore = {
			"The lake fills an impact crater. During the Third War the Burning Legion rained infernals down across these forests, and the ground still carries the marks.",
			"Felwood took the worst of it. When the Legion was broken at Mount Hyjal the demonic energy in that region went into the soil instead of dispersing, and it has been wrong ever since.",
		},
	},
})

SubsOf("Thousand Needles", {
	{
		name = "Camp E'thok", faction = "Hostile",
		hook = "A centaur camp on the canyon floor, one of several.",
		lore = {
			"Camp E'thok is Galak centaur ground in the eastern canyon. The Galak are the dominant clan at this end and the tauren's main opponent here.",
			"Centaur clans fight each other almost as hard as they fight anybody else. Without that, Freewind Post up on its mesa would not have held.",
		},
	},
	{
		name = "Ironstone Camp", faction = "Hostile",
		hook = "A camp on the salt flats, worked by people who do not advertise what for.",
		lore = {
			"Ironstone sits out on the Shimmering Flats, the dried bed of a body of water the Sundering drained.",
			"The flats are crossed by goblins, racing teams, prospectors and whoever else thinks a salt pan is worth something. Not all of them explain themselves.",
		},
	},
	{
		name = "Galak Hold", faction = "Hostile",
		hook = "The Galak centaur's own hold in the eastern canyon.",
		lore = {
			"The hold is the Galak clan's seat, and the clan is why Thousand Needles has never been safely crossed.",
			"Centaur descend from Zaetar, a son of Cenarius, and the earth elemental princess Theradras. The clans are named for Zaetar's sons and their feuds are hereditary.",
		},
	},
	{
		name = "Windbreak Canyon", faction = "Hostile",
		hook = "A side canyon in the south, full of wind and harpies.",
		lore = {
			"Windbreak runs off the main canyon and the harpies nesting in its walls raid the floor below.",
			"Harpies, centaur and tauren have been contesting this canyon longer than any of them can account for, and it has not changed hands.",
		},
	},
})

SubsOf("Desolace", {
	{
		name = "Shok'Thokar", faction = "Hostile",
		hook = "A Burning Blade site in the southern waste.",
		lore = {
			"The Burning Blade are better organised in Desolace than almost anywhere, with Thunder Axe Fortress and sites like this one across the zone.",
			"Having the Mannoroc Coven nearby helps them. Demons left over from the Third War have held that ground since, and the cult has something to organise around.",
		},
	},
	{
		name = "Bolgan's Hole", faction = "Hostile",
		hook = "A cave in Gelkis Village, where the Gelkis keep their khan.",
		lore = {
			"Bolgan's Hole is a cave inside Gelkis Village, in Desolace's eastern rise, and the most senior of the Gelkis centaur are in it. Khan Shaka holds that seat.",
			"The zone supports very little. Nijel's Point in the north, Ghost Walker Post in the centre and Shadowprey Village on the coast are the settlements, and there is almost nothing between them.",
		},
	},
	{
		name = "Sargeron", faction = "Hostile",
		hook = "Ruins in the eastern waste, older than anything else standing in Desolace.",
		lore = {
			"Sargeron is a ruin field in the east of the zone, and like Tethris Aran further west it predates the land becoming what it is.",
			"Desolace was green inside night elf memory. Ruins of this age are the strongest argument that something killed the region rather than it always having been dead.",
		},
	},
})

SubsOf("Dustwallow Marsh", {
	{
		name = "North Point Tower", faction = "Alliance",
		hook = "A Theramore watchtower on the northern coast.",
		lore = {
			"North Point watches the marsh's northern shore for Jaina Proudmoore's city. Theramore's outposts are few and thinly held.",
			"Jaina led the refugees out of Lordaeron when the plague took it, on Medivh's warning, and built the city they landed at. It is the Alliance's only real holding on this continent outside the night elf lands.",
		},
	},
	{
		name = "Beezil's Wreck", faction = "Contested",
		hook = "A crashed goblin machine in the marsh, picked over since.",
		lore = {
			"Something goblin-built came down here and has been settling into the mud ever since. Dustwallow swallows things.",
			"Goblin engineering turns up in odd corners of this world because goblins will take a contract from anyone. The same instinct put a shipyard under Westfall.",
		},
	},
	{
		name = "The Dragonmurk", faction = "Hostile",
		hook = "The southern mire, thick with black dragonkin.",
		lore = {
			"The Dragonmurk is the worst-held corner of Dustwallow and the most heavily patrolled from the air. Onyxia's lair opens into this part of the marsh.",
			"The black dragonflight does not go in for open assault. Where one of Deathwing's children chooses to settle usually says more than anything it does afterwards.",
		},
	},
})

SubsOf("Feralas", {
	{
		name = "The Forgotten Coast", faction = "Contested",
		hook = "The western shoreline, with night elf ruins half in the water.",
		lore = {
			"The coast runs below Feathermoon Stronghold, and the ruins along it show where the waterline used to be before the Sundering raised the sea.",
			"Solarsal and the other coastal sites were settlements with populations. The night elves who patrol past them now are doing archaeology on their own living memory.",
		},
	},
	{
		name = "Lower Wilds", faction = "Hostile",
		hook = "The southern jungle, where the wildlife outnumbers everyone's claim.",
		lore = {
			"The Lower Wilds are thick jungle running south from the Twin Colossals. Gorillas, yeti and great cats hold most of it.",
			"Both factions' outposts in Feralas are small. Between them they hold rather less of this zone than the animals do.",
		},
	},
	{
		name = "The High Wilderness", faction = "Hostile",
		hook = "The high ground in the east, above the jungle canopy.",
		lore = {
			"The High Wilderness is the raised eastern edge of Feralas, below the Frayfeather highlands and above everything else.",
			"Harpies work the heights and raid down off them. Across Kalimdor they show a preference for occupying night elf ruins that the night elves consider deliberate.",
		},
	},
	{
		name = "Verdantis River", faction = "Contested",
		hook = "The river through the northern jungle, running past the Dream portal.",
		lore = {
			"The Verdantis cuts through northern Feralas, near Jademir Lake and the Dream Bough.",
			"That bough is one of four places in this world where the Emerald Dream presses against the waking one. The green dragonflight guards all four and is not managing it.",
		},
	},
	{
		name = "Idlewind Lake", faction = "Contested",
		hook = "A lake in the eastern jungle, quiet by the standards of the zone.",
		lore = {
			"Idlewind sits in eastern Feralas, between Camp Mojache and the high ground.",
			"Feralas is among the least disturbed places on the continent. Neither faction has the strength here to change that, and the ogres at Dire Maul have other concerns.",
		},
	},
	{
		name = "Gordunni Outpost", faction = "Hostile",
		hook = "An ogre camp in the central jungle, flying Gordunni colours.",
		lore = {
			"The Gordunni are the ogre clan spread across Feralas outside Dire Maul, and outposts like this one hold the ground between the ruins.",
			"Dire Maul was Eldre'Thalas, a night elf city and a centre of Highborne magical study. The Gordok ogres hold it now, putting an ogre king in one of the great libraries of the old empire.",
		},
	},
	{
		name = "Sardor Isle", faction = "Contested",
		hook = "A small island off Feralas' western coast, and the naga have it.",
		lore = {
			"Sardor Isle lies out past Feathermoon Stronghold, and the Sentinels do not hold it. The Hatecrest naga do, in numbers.",
			"The Sentinels send people out to thin them. Latronicus Moonspear hands that errand to most of the new arrivals at Feathermoon Stronghold, on the reasoning that a weakened naga presence on Sardor plays to the night elves' advantage. The same naga have occupied the Ruins of Solarsal down the coast, and the Sentinels are less sure what that is about.",
		},
	},
})

SubsOf("Tanaris", {
	{
		name = "Wavestrider Beach", faction = "Contested",
		hook = "A beach on the eastern shore, between the goblin port and the pirate cove.",
		lore = {
			"The beach runs down Tanaris' eastern shore, from Steamwheedle Port at the top to Lost Rigger Cove at the bottom. Steeljaw snappers work the sand, and there is wreckage along it.",
			"The two ends of it explain the middle. Steamwheedle Port is cartel business and Lost Rigger Cove is pirates, and the beach between them is where things come ashore.",
		},
	},
	{
		name = "Broken Pillar", faction = "Contested",
		hook = "A fallen column in the middle of the desert, used as a landmark.",
		lore = {
			"The pillar stands, or rather lies, in central Tanaris, and travellers navigate by it because there is very little else to navigate by.",
			"Who raised it is not established. Tanaris holds three sets of unattributed ruins and a sealed titan gate, and the Explorers' League would rather be working on the gate.",
		},
	},
	{
		name = "Sandsorrow Watch", faction = "Horde",
		hook = "A tower west of Gadgetzan, with Sandfury trolls on the ground around it.",
		lore = {
			"Sandsorrow sits west of Gadgetzan on the northern route into Tanaris, where traffic comes down from Thousand Needles and the Barrens. Sandfury trolls hold the ground around it, and the tower itself is a neutral camp.",
			"The desert is a goblin zone in practice. Gadgetzan and Steamwheedle Port are both cartel operations, and the cartel sells to everyone and forbids fighting on the premises.",
		},
	},
	{
		name = "The Gaping Chasm", faction = "Hostile",
		hook = "A silithid hive sunk into the southern sand.",
		lore = {
			"The chasm opens into a silithid colony in southern Tanaris. Silithid are insectoid and they are spreading across the south of this continent.",
			"Their appearance in Tanaris, Un'Goro and the Barrens is one expansion rather than three infestations, and what it expands from is underneath Silithus.",
		},
	},
})

SubsOf("Azshara", {
	{
		name = "Southridge Beach", faction = "Contested",
		hook = "The southern shore, below the ruins and the satyr camps.",
		lore = {
			"Southridge runs along Azshara's lower coast, beneath the ground the Haldarr satyrs hold.",
			"Satyrs are what became of the night elves who sided with the Burning Legion during the War of the Ancients. In this region, which was Queen Azshara's own, there are several clans of them.",
		},
	},
	{
		name = "Jagged Reef", faction = "Hostile",
		hook = "A reef off the coast, with naga on and under it.",
		lore = {
			"The reef sits off Azshara's shoreline, close to where the sea took the queen's palace at Zin-Azshari.",
			"Azshara did not die in the Sundering. She and her closest followers became the naga, and the concentration of them along this coast follows from where they went down.",
		},
	},
	{
		name = "Shadowsong Shrine", faction = "Contested",
		hook = "A ruin-covered hill in western Azshara, and the highborne are still on it.",
		lore = {
			"Shadowsong Shrine is a hill in the west of the zone, buried under ruins from before the empire fell. What walks on it are Highborne Apparitions and Highborne Lichlings, and they do not confine themselves to the hill. The ghosts range over the ground around it and go for anything living that comes through.",
			"The shrine carries the Shadowsong name. So does Jarod Shadowsong, who commanded the resistance in the War of the Ancients. Whether he has anything to do with this hill, nobody has established.",
		},
	},
	{
		name = "Tower of Eldara", faction = "Hostile",
		hook = "A highborne tower on the eastern coast, still standing.",
		lore = {
			"Eldara is one of the better-preserved structures in Azshara, out on the eastern shore. Eldarath, the highborne city, is not far inland.",
			"The highborne were Azshara's nobility and her arcane scholars, and their pursuit of magic is what let her reach Sargeras at all. Everything in this region traces back to that.",
		},
	},
	{
		name = "The Shattered Strand", faction = "Hostile",
		hook = "A broken coastline in the north, naga-held.",
		lore = {
			"The strand is the northern shore, where the land gives out in pieces rather than a line. The Sundering did that.",
			"Naga hold it, as they hold most of Azshara's coast. What comes ashore here is, in a strict sense, the local population returning.",
		},
	},
})

SubsOf("Felwood", {
	{
		name = "Bloodvenom River", faction = "Hostile",
		hook = "The river through the forest, carrying the corruption downstream.",
		lore = {
			"The Bloodvenom runs the length of Felwood, past the Horde's waypoint at Bloodvenom Post, and nothing in it is drinkable.",
			"When the Burning Legion was broken at Mount Hyjal the demonic energy in this region did not disperse. It went into the ground and the water, and the trees and wildlife followed.",
		},
	},
	{
		name = "Irontree Cavern", faction = "Hostile",
		hook = "A cave under the northern woods, where the corruption has had somewhere to pool.",
		lore = {
			"The cavern sits beneath the Irontree Woods, where the trees themselves have turned.",
			"Corrupted treants are the part of Felwood the Cenarion Circle finds hardest. Treants were allies, and a hostile forest in the literal sense is not something the druids have a precedent for.",
		},
	},
	{
		name = "Jadefire Run", faction = "Hostile",
		hook = "Satyr ground in the southern forest.",
		lore = {
			"The Jadefire satyrs hold this stretch of southern Felwood, between the Emerald Sanctuary and the Ashenvale border.",
			"Satyrs in a forest this corrupted are at home in a way nothing else is. They chose the Legion ten thousand years ago and Felwood is what the Legion leaves behind.",
		},
	},
})

SubsOf("Winterspring", {
	{
		name = "Dun Mandarr", faction = "Hostile",
		hook = "Ruins in the northern snow, with a dwarven name on them.",
		lore = {
			"Dun Mandarr carries a dwarven name in a zone with no dwarven settlement. That is the interesting thing about it.",
			"Winterspring is thinly held by anyone. Everlook is a goblin town, Starfall Village is a small night elf post, and the rest belongs to the wildlife and the cold.",
		},
	},
	{
		name = "The Hidden Grove", faction = "Neutral",
		hook = "A sheltered grove in the northern valley, kept quiet on purpose.",
		lore = {
			"The grove sits away from Everlook's roads in the northern part of the zone, and it is tended rather than wild.",
			"Winterspring's druids and the Timbermaw both have reasons to keep somewhere out of the way. The furbolgs of this tribe resisted the corruption that took their kin and are suspicious of everybody with cause.",
		},
	},
	{
		name = "Ban'Thallow Barrow Den", faction = "Hostile",
		hook = "A barrow den in the snow, and its sleepers are not alone in it.",
		lore = {
			"Barrow dens are where night elf druids sleep while their minds walk the Emerald Dream. The druids spent most of the last ten thousand years in places like this one.",
			"Furbolgs have got into this den. A druid's body left untended is just a body, and the Winterfall tribe nearby has been turning the way the Felwood tribes did.",
		},
	},
})
