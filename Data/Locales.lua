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
		hook = "A Vilebranch site in the central forest, lived in rather than ruined.",
		lore = {
			"Hiri'watha is Vilebranch ground. The difference between a troll ruin and a troll settlement matters in the Hinterlands, because the Vilebranch are not squatters: Jintha'Alor and its outlying sites are theirs, and have been since the Amani Empire held this whole region.",
			"Arathor's founding war was fought against that empire with high elven help, and the trolls lost it. They have never accepted the result, and the Wildhammers at Aerie Peak have never expected them to.",
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
			"Thorn Hill is a settlement of some size, set on the north face of a hilltop on the road between the Crossroads and Durotar. The Razormane hold it in numbers, under a quilboar named Tortusk.",
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
