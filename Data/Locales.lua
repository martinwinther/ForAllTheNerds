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
		name = "Heroes' Vigil", faction = "Alliance",
		hook = "The monument on the island in Stone Cairn Lake, held by Defias wizards.",
		lore = {
			"Heroes' Vigil is the middle of the island in Stone Cairn Lake, in north-eastern Elwynn. The Stone of Remembrance stands on it, raised for the people killed when the orcs came through this country in the First War.",
			"Nobody is tending it. Defias rogue wizards have the island, a dozen of them and more, which is a long way inside the kingdom's borders for the Brotherhood to be standing.",
			"Two men came out here to prove exactly that and take the proof to the king's advisors. They found a pair of Defias going over documents and attacked, and more of the mages came. Henze Faulk is still lying on the island. His companion got away because Henze held them off.",
		},
	},
})

SubsOf("Westfall", {
	{
		name = "Demont's Place", faction = "Hostile",
		hook = "A dead farmstead west of Moonbrook, with a gnoll camp on it.",
		lore = {
			"Demont's was an ordinary Westfall holding before the farms failed, and like the Dead Acre there is little of it left. Riverpaw gnolls have the ground now: brutes, mongrels and herbalists, camped around a fire with the farm's own sacks of oats stacked beside it.",
			"The gnolls are half of what has gone wrong out here and the Defias Brotherhood is the other. Moonbrook, the Gold Coast Quarry and the Alexston Farmstead have all been plundered, and the People's Militia at Sentinel Hill is recruiting pledges off the road to answer for it.",
		},
	},
	{
		name = "Longshore", faction = "Contested",
		hook = "The whole Westfall coast, strewn with wrecks and worked over by murlocs.",
		lore = {
			"Longshore is not a stretch of the coast, it is the coast: the entire western shoreline of Westfall, and one of the longest beaches anywhere. Hulls and anchors lie along it where they came ashore and in the shallows off it, and nobody salvages them properly, because the murlocs got there first and have stayed. Old Murk-Eye ranges the beach among them.",
			"Two things on it are worth the walk. A lockbox beside a wreck off the northern end holds half of the Pendant of the Sea Lion, which is what an Alliance druid needs before anyone will teach them an aquatic form. And at the far southern end, past the lighthouse, there is a farmhouse looking out at the water: Daphne Stilwell holds it alone while her husband is away working with the dwarves in Ironforge, in country the Defias have all but taken over.",
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
		hook = "Woodland in Duskwood's north-east, and the Nightbane pack has all of it.",
		lore = {
			"Brightwood keeps a name from before the darkness came and nothing about the grove has earned it since. What holds it is worgen: Nightbane dark runners and shadow weavers in numbers, with Fenros and Lupos ranging through them and black ravagers hunting the same ground.",
			"How Duskwood came to have so many worgen is not established. Nobody has accounted for their reaching this far south of Silverpine, and the Night Watch patrols the road past the grove rather than asking.",
		},
		readMore = { "Wowpedia: Brightwood Grove", "Wowpedia: Nightbane pack" },
	},
	{
		name = "The Hushed Bank", faction = "Contested",
		hook = "Duskwood's western riverbank, across the water from Westfall.",
		lore = {
			"The Hushed Bank follows Duskwood's western river, from the meeting of Elwynn, Westfall and Duskwood south towards Stranglethorn. The covered bridge to Westfall crosses here.",
			"Sven Yorgen and Lars camp at the northern end. Lars hunts for their food, but starving and rabid wolves follow him when he brings meat back to camp.",
		},
		readMore = { "Wowpedia: Hushed Bank", "Wowpedia: Wolves at Our Heels (Classic)" },
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
		hook = "High ground south-west of Tarren Mill, with yeti in the rock under it.",
		lore = {
			"Darrow Hill rises south-west of Tarren Mill, and nobody is holding it. Starving mountain lions and vicious gray bears work the slopes, cave yeti and ferocious yeti come up out of the Foothill Caverns underneath, and the signpost at the foot of it points four ways: Durnholde Keep, Hillsbrad, Tarren Mill and Southshore. Alterac granite comes out of this ground.",
			"The name belongs to the same Lordaeron family as Darrowmere Lake and the village of Darrowshire off in the Plaguelands. Very little that the Darrow name was attached to is still standing.",
		},
	},
	{
		name = "Corrahn's Dagger", faction = "Hostile",
		hook = "High ground in the Alterac Mountains, with the Syndicate holding it.",
		lore = {
			"The Syndicate has the run of this hill. They are what became of Alterac's nobility after King Aiden Perenolde sold the Alliance out to the Horde and his kingdom was dismantled for it.",
			"Titles, land and income went in one stroke, and they have been financing a grudge ever since, working the ridges above Hillsbrad for whatever the roads and the mines will yield. They are better dressed than ordinary bandits and no less dangerous for it.",
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
		hook = "A stone circle guarded by water elementals near Hammerfall.",
		lore = {
			"The Circle of East Binding stands in eastern Arathi Highlands, near Hammerfall. Cresting Exiles guard the Stone of East Binding at its centre.",
			"This is one of four binding circles in the Highlands. The stone holds the Cresting Key, one of the keys needed to unlock the strongest binding stone.",
		},
		readMore = { "Wowpedia: Circle of East Binding", "Wowpedia: Stones of Binding" },
	},
	{
		name = "Circle of Outer Binding", faction = "Contested",
		hook = "A circle of binding stones guarded by air elementals.",
		lore = {
			"The Circle of Outer Binding lies in central Arathi Highlands, near Refuge Pointe. Thundering Exiles guard the Stone of Outer Binding.",
			"The stone holds the Thundering Key, one of three keys needed to unlock the Stone of Inner Binding.",
		},
		readMore = { "Wowpedia: Circle of Outer Binding", "Wowpedia: Stones of Binding" },
	},
	{
		name = "Circle of West Binding", faction = "Contested",
		hook = "The westernmost of the four Highlands circles, nearest the Thandol Span road.",
		lore = {
			"West Binding sits closest to the road down to the Thandol Span, so it sees more traffic than the other three. Travellers notice it, and a fair number stop.",
			"There is a stone standing at the centre of each of the four circles, and they are not ornaments. Three of them hold keys, one burning, one cresting and one thundering, and the three keys are meant to be carried to the stone at the Inner Binding. Whoever set that up left no word of what it opens.",
		},
	},
	{
		name = "Boulder'gor", faction = "Hostile",
		hook = "A Boulderfist ogre camp in the west, part of the force taking Stromgarde apart.",
		lore = {
			"The Boulderfist are one of the parties carving up Stromgarde, and camps like this one hold the open country rather than the city. Their camp shares its ground with highland thrashers and striders.",
			"So do the Witherbark. Trolls of theirs stand about this camp alongside the ogres, and that is two of the three claimants on the Highlands keeping company instead of fighting over it.",
			"Ogres east of the sea came through the Dark Portal with the Horde in the Second War and were left behind when it ended. They have had no leadership and no purpose since, and the Highlands have offered them neither.",
		},
	},
})

SubsOf("Wetlands", {
	{
		name = "Direforge Hill", faction = "Hostile",
		hook = "A Dark Iron camp in the northern Wetlands, in reach of the Thandol Span.",
		lore = {
			"Dark Iron dwarves have established themselves on this hill at the top of the Wetlands, within reach of both Dun Modr and the Thandol Span. Balgaras the Foul is the warlock who holds it, and the dwarves who have looked into him say he is a coward who sends his soldiers out and stays in his camp. There is a standing price on his ear.",
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
		hook = "Marshland in the eastern Wetlands, home to the Greenwarden.",
		lore = {
			"The Green Belt lies in the eastern Wetlands, where crocolisks, bog beasts and oozes inhabit the marsh. Rethiel the Greenwarden lives here, east of the road that forks towards Dun Modr.",
			"Rethiel is troubled by the suffering of the land. He asks adventurers to destroy the Fen Creepers rising in the waterways so that they can settle back into the marsh.",
		},
		readMore = { "Wowpedia: Green Belt", "Wowpedia: The Greenwarden", "Wowpedia: Blisters on The Land" },
	},
	{
		name = "Saltspray Glen", faction = "Hostile",
		hook = "A raptor nesting ground in the north-west of the Wetlands.",
		lore = {
			"Saltspray Glen sits in the north-western Wetlands with Bluegill Marsh below it, Ironbeard's Tomb to the east and Baradin Bay on two sides. The glen is named for how readily the bay throws seawater inland across it when the wind is up.",
			"What nests here is raptors. Highland razormaws, scytheclaws and lashtails, in the numbers this zone manages everywhere it has standing water, with Mosshide gnolls and crocolisks working the same ground and Gnawbone somewhere in it.",
		},
	},
})

SubsOf("Searing Gorge", {
	{
		name = "Tanner Camp", faction = "Hostile",
		hook = "A Dark Iron camp on the Gorge's rim, worked the way they work everything.",
		lore = {
			"The Dark Irons hold the Searing Gorge, and camps like this one are how: a position on the rim, a work gang and a taskmaster over it. They do not pay wages and they do not recruit. The gangs are slaves, and the archaeologists among them were taken for their expertise rather than their backs.",
			"Every one of them answers to Ragnaros in the end. Emperor Thaurissan summoned the Firelord to win a war he was losing, and the clan has been in his service since. No dwarf has ever made a worse bargain.",
		},
	},
})

SubsOf("Burning Steppes", {
	{
		name = "Blackrock Stronghold", faction = "Hostile",
		hook = "A Blackrock orc fortification on the Steppes, outside the mountain's gates.",
		lore = {
			"Not all of the Dark Horde lives inside Blackrock Mountain. This stronghold holds the ground outside it, and an army coming up from Redridge would have to deal with it first. Blackrock battlemasters and sorcerers work the ash, with obsidian elementals and a scalding broodling among them, and Grark Lorkrub is held here.",
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
		hook = "The main Dustbelcher camp, an ogre mound in the south-west of the zone.",
		lore = {
			"Dustbelch Grotto is the large ogre mound in the south-western Badlands, and the dwarves working the digs call it the main ogre camp in the zone. Dustbelcher maulers, shamans, lords and ogre mages hold the ground around it, with Camp Cagg on the same corner of the map.",
			"What the dwarves want off them is scrap metal. The ogres carry more of it than ogres have any business carrying, enough that the old stories about siege engines in the Badlands get another hearing, and a dig camp short of material will take ogre scrap and build its defences out of that.",
		},
	},
})

SubsOf("Stranglethorn Vale", {
	{
		name = "Bal'lal Ruins", faction = "Hostile",
		hook = "Gurubashi stonework in the northern jungle, reoccupied by the Bloodscalp.",
		lore = {
			"Bal'lal is one of a chain of Gurubashi ruins across the vale. Taken together they show what this jungle used to be: not a city with a hinterland, but a dense built empire covering the whole of it.",
			"These ruins are held rather than empty. Bloodscalp shamans and axe throwers work the stones with warriors behind them, and tigers and raptors take the ground between the ruins. A book has been left lying open among the stonework.",
			"The Gurubashi broke apart after their own priests summoned Hakkar the Soulflayer and the empire had to fight a war to contain him. What stands here was raised before that and the trolls living in it are the descendants of the people who raised it.",
		},
		readMore = { "Wowpedia: Bal'lal Ruins", "Wowpedia: Bloodscalp tribe", "Wowpedia: Gurubashi" },
	},
	{
		name = "Balia'mah Ruins", faction = "Hostile",
		hook = "Ancient troll ruins occupied by the Skullsplitter tribe.",
		lore = {
			"Balia'mah Ruins lie east-southeast of Grom'gol Base Camp, on the eastern side of the river. Skullsplitter trolls occupy the old stonework.",
			"The Bloodscalp are their enemies. The Skullsplitters keep trophy skulls at these ruins, as they do at their other settlements farther south.",
		},
		readMore = { "Wowpedia: Balia'mah Ruins", "Wowpedia: Speaking with Nezzliok (Classic)" },
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
		hook = "A coral reef off the west coast, with murlocs living in drowned troll ruins.",
		lore = {
			"The reef lies off the vale's western shore near Grom'gol, and there is troll stonework down among the coral. The Saltscale murlocs have made their homes in the sunken ruins, which is the usual murloc instinct for occupying somebody else's architecture, and every one of them is tougher than it looks.",
			"The Altar of the Tides stands down there. Giant clams are scattered through the coral in numbers and are said to hold blue pearls, and wreckage floats along the whole coast.",
		},
		readMore = { "Wowpedia: Vile Reef", "Wowpedia: Stranglethorn Vale" },
	},
	{
		name = "Crystalvein Mine", faction = "Hostile",
		hook = "A mine on the western coast with a sign on it and basilisks inside.",
		lore = {
			"Crystalvein is a worked mine down the western side of the vale, and there is a sign on it telling people to keep out. Nobody is enforcing that: the basilisks have it.",
			"The shaft is held in numbers by ironjaw and thrashtail basilisks with Scale Belly somewhere at the back of it, and iron, silver and gold are still in the walls for anyone willing to get past them.",
		},
		readMore = { "Wowpedia: Crystalvein Mine", "Wowpedia: Stranglethorn Vale" },
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
		hook = "Cliffs above the eastern sea, with the Hinterlands' river falling off them.",
		lore = {
			"The Overlook Cliffs are the drop from the mountainous Hinterlands to the eastern shoreline, and they are known for their height. The big river that runs through the zone ends here, pouring over the edge in a waterfall.",
			"Revantusk Village sits at their foot and is the Horde's only foothold in this zone. The Revantusk are forest trolls who agreed a pact of friendship and mutual assistance with Thrall's Horde, and they are the last forest troll tribe serving it.",
			"Saltwater snapjaws work the water below in numbers and break the lines of anyone fishing off the rocks, with Gammerita among them. Rin'ji keeps something hidden on a small deserted island off these cliffs.",
		},
		readMore = { "Wowpedia: Overlook Cliffs", "Wowpedia: Revantusk Village", "Wowpedia: Troll Compendium/Forest Troll Tribes" },
	},
	{
		name = "Shaol'watha", faction = "Hostile",
		hook = "A former temple in the north-east, held by the Vilebranch.",
		lore = {
			"Shaol'watha was a temple once. It stands in the north-east of the zone with Agol'watha nearby, and the Vilebranch hold both: scalpers in the open and soothsayers among the stones, with Grimungous somewhere in the trees.",
			"Revantusk Village wants them out. The village smith has had his tools stolen and taken up here, and the village mystic simply wants the numbers brought down.",
			"How many of these ruins there are is the measure of what the Amani Empire once was. Troll civilisation held most of this continent before there were humans on it to notice.",
		},
		readMore = { "Wowpedia: Shaol'watha", "Wowpedia: Cannibalistic Cousins", "Wowpedia: Vilebranch tribe" },
	},
	{
		name = "The Creeping Ruin", faction = "Hostile",
		hook = "A troll ruin in the Hinterlands, overrun by slimes.",
		lore = {
			"The Creeping Ruin lies in the central Hinterlands. Slimes inhabit the old forest troll ruins.",
		},
		readMore = { "Wowpedia: The Creeping Ruin" },
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
		hook = "One of the four Lordaeron towers in the zone, being fought over again.",
		lore = {
			"Four towers stand around the Eastern Plaguelands: Eastwall, Northpass, Crown Guard and the tower at Plaguewood. They are Lordaeron's, and they have stood abandoned since the days of Lordaeron.",
			"Both sides want them now. An Alliance emissary at Light's Hope Chapel is handing out orders to seize and rebuild all four, to tighten the hold on the Forsaken positions west of here, and a Horde emissary at the same chapel is handing out the same assignment. Whoever took a tower last has a banner on it.",
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
		hook = "A blighted vale in the west, where the ground has gone purple under a haze.",
		lore = {
			"The Fungal Vale lies north of the Marris Stead and Crown Guard Tower, in the western part of the zone. The ground is a dark purple and a murky haze sits over it, and this is one of the places where the Plague of Undeath took the firmest hold.",
			"The Scourge holds the vale. Eyeless watchers and death singers work it, with diseased flayers and an abomination among them, and scourge champions walk here for anyone sent to hunt them.",
		},
		readMore = { "Wowpedia: Fungal Vale", "Wowpedia: Plague of Undeath" },
	},
	{
		name = "The Infectis Scar", faction = "Hostile",
		hook = "A gorge west of Corin's Crossing, with a shattered runeblade at its bottom.",
		lore = {
			"The Infectis Scar cuts into the blighted ground west of Corin's Crossing. The shattered sword of Marduk the Black lies at the bottom of the gorge, a remnant of the battle of Darrowshire.",
		},
		readMore = { "Wowpedia: Infectis Scar", "Wowpedia: Villains of Darrowshire (Classic)" },
	},
	{
		name = "Lake Mereldar", faction = "Contested",
		hook = "A polluted lake south of Corin's Crossing, with the plague living in the water.",
		lore = {
			"Lake Mereldar is in the south-east of the Eastern Plaguelands, south of Corin's Crossing. The water is not clean and what lives in it is what the plague made of water: blighted surges and plague ravagers. There are the ruins of a house on the bank, and a shack and a ferry that belonged to the farm.",
			"The Scarlet Crusade works this shore as well, out of Tyr's Hand to the east, and its wardens and clerics and enchanters are no friendlier to anyone standing here than the Scourge is.",
			"What the lake is actually good for is grim. Its shore grows Blood of Heroes, out of ground a great many people died on, and the smiths who forge against the chromatic flight ask for it ten at a time.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- KALIMDOR
-- ---------------------------------------------------------------------------

SubsOf("Durotar", {
	{
		name = "Burning Blade Coven", faction = "Hostile",
		hook = "A demon-infested cave at the northern edge of the Valley of Trials.",
		lore = {
			"The Burning Blade Coven lies in the mountains along the northern edge of the Valley of Trials. The cave holds imps and felstalkers, with Yarrog Baneshadow deep inside.",
			"Recruits are sent to recover a powerful medallion from the coven. The discovery of the Burning Blade here raises fears that a larger threat is spreading through Durotar.",
		},
		readMore = { "Wowpedia: Burning Blade Coven", "Wowpedia: Burning Blade Medallion (Classic)", "Wowpedia: Report to Sen'jin Village (Classic)" },
	},
	{
		name = "Rocktusk Farm", faction = "Hostile",
		hook = "The Horde's pig farm, just down the western road out of Orgrimmar.",
		lore = {
			"Rocktusk Farm is a pen of swine a short way down the road west of Orgrimmar's gates, with mottled boars in the scrub around it and a couple of benches to sit on. It feeds the city, and in Durotar that is not a small job: there is no farmland in this zone worth the name.",
			"The quilboar are not here, whatever the name suggests. The Razormane hold their own ground in the middle of the zone, battleguards and dustrunners and scouts, a long way south of the pigs.",
		},
	},
	{
		name = "Scuttle Coast", faction = "Contested",
		hook = "Durotar's eastern shore, littered with the wrecks of Kul Tiran ships.",
		lore = {
			"The Scuttle Coast lies southeast of Razor Hill and north of Tiragarde Keep. Ships from Kul Tiras lie wrecked along the coast, left from the fighting between the orcs and Daelin Proudmoore's fleet.",
		},
		readMore = { "Wowpedia: Scuttle Coast" },
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
		hook = "A burnt-out Venture Company caravan on the shore of Stonebull Lake.",
		lore = {
			"The caravan was the Venture Company's, carrying supplies up to Supervisor Fizsprocket's mine. The tauren saw the company moving freely through Mulgore and put a stop to this load. What is left sits on a mound with black smoke still coming off it.",
			"The company has not given it up. The laborers and taskmasters who survived the wrecking are camped on the remains and defend the cargo aggressively. That is the whole of their answer to being told to leave.",
		},
		readMore = { "Wowpedia: Ravaged Caravan", "Wowpedia: Venture Company", "Wowpedia: Mulgore" },
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
		hook = "The river out of Wellspring Lake, falling off the edge of the tree.",
		lore = {
			"The water starts from a natural spring deep inside Teldrassil. The river runs north out of Wellspring Lake and goes over the tree's edge in a great waterfall to the sea far below, which is as clear a view of what Teldrassil actually is as the tree offers anywhere.",
			"Crazed timberlings patrol the banks and go for anyone who comes near, so the walk along it is not the quiet one it looks like.",
		},
		readMore = { "Wowpedia: Wellspring River", "Wowpedia: Teldrassil" },
	},
})

SubsOf("Darkshore", {
	{
		name = "The Long Wash", faction = "Contested",
		hook = "The short stretch of coast south of Auberdine, where the sea keeps returning things.",
		lore = {
			"The Long Wash runs south from Auberdine to a point due west of Ameth'Aran, and in spite of the name it is the shortest stretch of coast in Darkshore. A wash is the part of a shore the waves work over.",
			"The beach is gloomy under Darkshore's overcast and littered with debris and the carcasses of dead sea animals. Greymist murlocs have been coming ashore along it in greater numbers, and tide crawlers, reef crawlers and Darkshore threshers work the shallows.",
			"This coast was dry land once. The Well of Eternity collapsed, Kalimdor broke apart and the sea came in over night elf ground, and the ruins it drowned are still standing inland at Ameth'Aran.",
		},
		readMore = { "Wowpedia: Long Wash", "Wowpedia: Darkshore" },
	},
	{
		name = "Mist's Edge", faction = "Contested",
		hook = "A long stretch of Darkshore coast, littered with wrecks and stranded sea creatures.",
		lore = {
			"Mist's Edge stretches north along Darkshore from near Auberdine. Murlocs inhabit the coast, and crabs scuttle across its beaches.",
			"Huge sea creatures have washed ashore, leaving carcasses for the murlocs to scavenge. Researchers in Auberdine seek samples to investigate what has happened.",
		},
		readMore = { "Wowpedia: Mist's Edge", "Wowpedia: Beached Sea Creature" },
	},
	{
		name = "Cliffspring River", faction = "Contested",
		hook = "The river out of Cliffspring Falls, and what Darkshore drinks.",
		lore = {
			"The river rises at Cliffspring Falls up in the cliffs and runs down to the beach below, fast and cold the whole way. It is the principal source of drinking water for the region, which on a coast with little fresh water reaching the sea that makes it the most useful thing in Darkshore.",
			"That also makes it a liability. The cave at the river's source has been corrupted and the Twilight's Hammer have been found inside it, so what Auberdine draws comes down past whatever they are doing up there.",
		},
		readMore = { "Wowpedia: Cliffspring River", "Wowpedia: Cliffspring Falls" },
	},
})

SubsOf("Ashenvale", {
	{
		name = "Nightsong Woods", faction = "Contested",
		hook = "The eastern half of Ashenvale, and the ground both sides are fighting over.",
		lore = {
			"Nightsong Woods is the eastern part of the forest, running from Raynewood Retreat and the Felwood road all the way out to Azshara, with the Falfarren River through the middle of it. Most of the cross-faction fighting in Ashenvale happens in here, and the southern reaches are where the Warsong have been cutting.",
			"The Horde's account of that is plain enough: under the guise of protecting a forest that does not belong to them, the Alliance is trying to deny the Horde one of its largest sources of lumber. The Silverwing Sentinels hold the other end of the argument.",
			"Not everything in the woods is about timber. Kayneth Stillwind keeps the shrine at Forest Song and wants reports on what is happening along the coast and around Astranaar, because he thinks a corruption is moving through Ashenvale and he is not wrong.",
		},
	},
	{
		name = "The Howling Vale", faction = "Hostile",
		hook = "A cave in northern Ashenvale named for wolf-men nobody can account for.",
		lore = {
			"The Howling Vale lies in the north of Ashenvale, near the Felwood border. Terrowulf fleshrippers and shadow weavers hold it along with ghostpaw alphas, and the chilling calls they make at night are what gave the place its name.",
			"The night elves have no account of where the wolf-men came from. The vale holds the ruined shrine of Mel'Thandris, with an ancient inscription praising Elune in front of it, and the Tome of Mel'Thandris kept at the shrine may say why they came.",
			"Withered and crazed ancients walk through the vale, and elder shadowhorn stags still graze in it.",
		},
		readMore = { "Wowpedia: Howling Vale", "Wowpedia: The Howling Vale (quest)" },
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
		hook = "A hill in eastern Ashenvale where the Legion's infernals came down.",
		lore = {
			"Infernals landed on this hill during the Third War and the ground has not recovered. The hill still carries searing infernals, with felguards and mannoroc lashers among them, and the Horde has Splintertree Post north-west of it and the Warsong Lumber Camp north-east.",
			"Demon Fall Canyon is nearby, where Grom Hellscream killed the pit lord Mannoroth and freed every orc alive from the blood curse. In this forest the Legion's leavings and the Horde's redemption are a short walk apart.",
		},
	},
	{
		name = "Night Run", faction = "Hostile",
		hook = "The smallest of Ashenvale's three satyr sites, up on a naze nobody can climb.",
		lore = {
			"The Felmusk hold the Night Run, in east-central Ashenvale between Raynewood Retreat and Splintertree Post. Of the three satyr settlements in this forest, with Satyrnaar and Xavian, it is by far the smallest: a few broken pillars and some ruined stonework for shelter. It is also the hardest to reach, sitting on a naze with cliffs nobody climbs, so the way in is along the Falfarren and then west.",
			"The satyrs here are doing more than holding ground. A Warsong delivery of oil was intercepted on its way to the lumber camp, and it is being used for rituals in this place and in the other two.",
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
		hook = "A small lake in Windshear Crag, with a goblin water wheel built over it.",
		lore = {
			"The lake lies in Windshear Crag at the head of the Blackwolf River. An enormous Venture Company structure runs above the water, a water wheel reached by a tower of scaffolding, and Gerenzo Wrenchwhistle oversaw the crag's operation from up there.",
			"The lumber mill is just south of the lake. What the Horde wants out of it is the engineering plans for the shredders, on the grounds that knowing how the machines work is worth more than smashing a few of them.",
			"The Cenarion Circle keeps a presence in these mountains trying to stop the argument turning into a war. Tauren at Sun Rock Retreat take the same line, which puts them awkwardly across their own faction.",
		},
		readMore = { "Wowpedia: Cragpool Lake", "Wowpedia: Windshear Crag", "Wowpedia: Gerenzo Wrenchwhistle" },
	},
	{
		name = "Camp Aparaje", faction = "Horde",
		hook = "Three people, a fire and a meat rack, in the middle of Grimtotem country.",
		lore = {
			"Camp Aparaje is about as small as a Horde position gets: Denni'ka the butcher, Ken'zigla and an orc up from Orgrimmar, with a campfire and a rack of smoked meat. It is a waypoint and a place to be behind.",
			"What surrounds it is the Grimtotem, the tauren tribe that refused Cairne Bloodhoof's alliance with the orcs and answers to nobody. Their brutes, sorcerers and mercenaries hold the ground on every side, and anybody got out of their hands is brought here first. Kaya Flathoof was walked back to this camp, and her father wanted word she was safe.",
		},
	},
})

SubsOf("Thousand Needles", {
	{
		name = "Weazel's Crater", faction = "Neutral",
		hook = "A crater on the salt flats, which is where goblin racing goes when it goes wrong.",
		lore = {
			"Weazel's Crater sits on the Shimmering Flats beside the Mirage Raceway. It is the sort of feature that appears when goblins combine rocket engines, a flat horizon and a betting market.",
			"The racing is a goblin against a gnome, Pozzik against Fizzle Brassbolts, and sabotage is a recognised tactic on both sides. The Flats themselves are a dried lake bed, with a wrecked sailing ship in the north as the evidence, and the racers are the first people to find a use for them.",
		},
	},
})

SubsOf("Desolace", {
	{
		name = "Kormek's Hut", faction = "Contested",
		hook = "A hut on the Desolace road, where a goblin buys kodo bones by the sack.",
		lore = {
			"Kormek's Hut stands by itself on the road through central Desolace, between Nijel's Point in the north and Shadowprey Village on the coast. What is in it is a goblin and a trade.",
			"Bibbly F'utzbuckle buys kodo bones, ten at a time, out of the graveyard to the south. A caravan calls at the hut and takes them down to Shadowprey, and what becomes of them is furniture, musical instruments and blasting powder. He will tell you himself that the bones are going to change the world forever.",
			"Desolace does not support much else. The land was green inside night elf memory and something killed it, and the two centaur clans holding most of it are too busy with each other to build.",
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
		hook = "A naga-held island off the northern end of the Desolace coast.",
		lore = {
			"Ranazjar lies a long way up the western shore, a mile north of Shadowprey Village rather than in sight of it, and the Slitherblade naga hold it. A statue of a serpent stands on the rock, and there are night elf ruins on the sea floor around the island.",
			"Naga coming up on these beaches are returning rather than invading. They were Azshara's highborne before the Well of Eternity collapsed, and this coast belonged to their empire.",
		},
	},
})

SubsOf("Dustwallow Marsh", {
	{
		name = "Wyrmbog", faction = "Hostile",
		hook = "The southern marsh, with two black dragons' doors opening into it.",
		lore = {
			"Wyrmbog is the south of Dustwallow, below the Dragonmurk, and the black dragonflight is at home in it. Two entrances open off this bog: Onyxia's Lair and Emberstrife's Den. Everything in the bog is elite ground.",
			"The brood is on the surface as well as under it. Firemane flamecallers and scalebanes patrol the water with searing whelps and hatchlings behind them, and eggs of Onyxia are lying about the mud in numbers. Onyxia's Gate stands at the end of it.",
			"Onyxia is a daughter of Deathwing, and a lair this close to Theramore, the Alliance's only real city on this continent, reads as a choice rather than a convenience.",
		},
		readMore = { "Wowpedia: Wyrmbog", "Wowpedia: Onyxia's Lair", "Wowpedia: Emberstrife" },
	},
	{
		name = "The Quagmire", faction = "Contested",
		hook = "The central bog, crossed by anyone travelling between Theramore and Brackenwall.",
		lore = {
			"The Quagmire is the middle of the marsh, running from Lost Point in the west to Dustwallow Bay in the east and from Brackenwall Village in the north to the Dragonmurk in the south. Signposts for Theramore Isle, Brackenwall Village and the Barrens stand along the tracks through it.",
			"The water is held by drywallow crocolisks and snappers, the ground by darkfang creepers and giant darkfang spiders, and swamp oozes move through both. The Rot and Ripscale are somewhere in it.",
			"Tabetha keeps a farm out in the middle of all this, and Theramore deserters have scattered across the bog around her.",
		},
		readMore = { "Wowpedia: Quagmire", "Wowpedia: Dustwallow Marsh" },
	},
	{
		name = "Dreadmurk Shore", faction = "Hostile",
		hook = "The eastern coast and its islands, thick with murlocs.",
		lore = {
			"Dreadmurk Shore is the coastline and the islands between Theramore Isle and Northwatch Hold. The Mirefin murlocs have the run of it, coastrunners in the shallows and the rest camped above the tideline, and sea turtles and snapjaws work the water with them.",
			"The Defias have been wrecked out here, somewhere between this shore and Alcaz Island, and have made camps on a few of the islands and the beach beside them. Theramore has sentries on the ground and an interest in what the Defias were carrying.",
			"Alcaz Island itself lies off this coast and is not a place anyone walks onto casually.",
		},
		readMore = { "Wowpedia: Dreadmurk Shore", "Wowpedia: Mirefin tribe", "Wowpedia: Alcaz Island" },
	},
})

SubsOf("Feralas", {
	{
		name = "Feral Scar Vale", faction = "Hostile",
		hook = "A yeti vale in the High Wilderness, inland of the Forgotten Coast.",
		lore = {
			"Feral Scar is yeti country. The vale and its tunnels hold the Feral Scar yeti in numbers, with groddoc apes on the same slopes, and the leatherworkers at Feathermoon Stronghold and Camp Mojache both send people out here for thick yeti hide. A gnomish homing robot is stuck at the back of the first tunnel, waiting for somebody carrying its distress beacon.",
			"Both factions' outposts in this jungle are small. Feathermoon Stronghold sits on an island and Camp Mojache is a tauren camp, and between them they hold rather less of Feralas than the gorillas, the yeti and the Woodpaw gnolls do.",
		},
	},
	{
		name = "Grimtotem Compound", faction = "Hostile",
		hook = "A Grimtotem village east of Dire Maul, with sprite darters in a cage.",
		lore = {
			"The compound is a large village in two parts, east of Dire Maul. Grimtotem shamans hold it, and camps of theirs stand from Stonetalon down to Thousand Needles. They are hostile to Horde and Alliance alike, which makes them one of the few things Camp Mojache and Feathermoon Stronghold agree about.",
			"The southern part has a large cage in it with sprite darters penned inside. Kindal Moonweaver is out here with a key and no patience, ready to go in after them and unwilling to wait long once the cage is open. Jer'kai Moonweaver stays back.",
			"The gnolls have a few camps of their own east of the northern part, which the Grimtotem appear to tolerate.",
		},
		readMore = { "Wowpedia: Grimtotem Compound", "Wowpedia: Freedom for All Creatures", "Wowpedia: Grimtotem tribe" },
	},
	{
		name = "Jademir Lake", faction = "Contested",
		hook = "A lake in northern Feralas, close to a door into the Emerald Dream.",
		lore = {
			"Jademir Lake sits in the north of the jungle with an island at its centre, and the island is the Dream Bough. That is one of four places in this world where the Emerald Dream presses against the waking one.",
			"The green dragonflight guards all four. Lethlas holds this one with tree warders around him, and the whelps along the lake's north-western shore have gone sick. Something has gone wrong in the Dream, and the dragons posted at Seradane, Bough Shadow, Twilight Grove and the Dream Bough have turned on everyone who comes near.",
		},
	},
	{
		name = "Frayfeather Highlands", faction = "Hostile",
		hook = "Hippogryph highlands in the High Wilderness, above the jungle and the ruins both.",
		lore = {
			"The Frayfeather are hippogryphs and the highlands are theirs. Frayfeather hippogryphs and stagwings hold this high ground in the middle of Feralas, and their nests are up here with eggs in them.",
			"Hippogryphs have been night elf companions for a long time and Feathermoon Stronghold keeps them, but the Frayfeather answer to nobody. The traffic in this corner of the zone is a goblin business instead: a machine in Gadgetzan weighs, measures and packages any hippogryph egg brought to it, and about half of what comes out of it hatches.",
		},
	},
})

SubsOf("Tanaris", {
	{
		name = "Noonshade Ruins", faction = "Hostile",
		hook = "Ancient troll ruins east of Gadgetzan, occupied by Wastewander bandits.",
		lore = {
			"The Wastewander hold these ruins in northeastern Tanaris. Their bandits and thieves are among the targets sought by the Gadgetzan Water Company, whose wells the nomads have seized.",
		},
		readMore = { "Wowpedia: Noonshade Ruins", "Wowpedia: Wastewander Justice" },
	},
	{
		name = "Southmoon Ruins", faction = "Hostile",
		hook = "Troll ruins in the southern sand, held by Dunemaul ogres.",
		lore = {
			"Southmoon is the southern member of the set of troll ruins in this desert, just north of the Valley of the Watchers, and the trolls who raised it are long gone.",
			"The Dunemaul have it instead. Ogres, enforcers, brutes, warlocks and an ogre mage hold the stonework, with rabid blisterpaws and glasshide basilisks working the sand around them.",
			"What brings people out here is underfoot. Gahz'ridian lies buried all through these ruins, and digging it out is the one reason to risk the ogres.",
		},
		readMore = { "Wowpedia: Southmoon Ruins", "Wowpedia: Dunemaul clan", "Wowpedia: Gahz'ridian" },
	},
	{
		name = "Waterspring Field", faction = "Contested",
		hook = "Desert water towers seized by the Wastewander bandits.",
		lore = {
			"The water towers at Waterspring Field draw on underground reserves in Tanaris. Built to supply Gadgetzan's operations, they have been seized by the Wastewander bandits.",
			"The Gadgetzan Water Company is hiring adventurers to fight the bandits and recover stolen water. Without access to its wells, the town faces a dwindling supply.",
		},
		readMore = { "Wowpedia: Waterspring Field", "Wowpedia: Wastewander Justice", "Wowpedia: Water Pouch Bounty" },
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
		hook = "Timbermaw furbolg ground in northern Azshara.",
		lore = {
			"Ursolan lies in northern Azshara, east of Timbermaw Hold. Timbermaw furbolgs occupy the area.",
		},
		readMore = { "Wowpedia: Ursolan" },
	},
	{
		name = "Bay of Storms", faction = "Hostile",
		hook = "The stretch of sea off Azshara's eastern coast, with three strange addresses in it.",
		lore = {
			"The Bay of Storms is water rather than a place anybody holds: the part of the Great Sea that travellers down Azshara's eastern coast have to name. Scalebeard's Cave is in it, Hetaera's Clutch is under it, and the Temple of Arkkoran stands on its shore.",
			"What that comes to in practice is hydras, a sea giant, murlocs and one very old turtle. There is a maelstrom out in the bay as well, with wreckage turning in it.",
		},
	},
	{
		name = "Ravencrest Monument", faction = "Contested",
		hook = "The legs of a colossal night elf statue on the cliffs at Azshara's southern tip.",
		lore = {
			"What is left of the monument is the broken-off legs of an enormous night elf statue, standing on the cliffs at the southern point of the zone with the Great Sea below and the rest of it scattered on the ground or gone under the water. It is south-east of the Ruins of Eldarath and cannot be reached from the sea at all.",
			"The Spitelash naga have the ruins now, battlemasters and enchantresses among the stones, with wavethrashers in the water below.",
			"The name belongs to the era this region is named for. Azshara ruled the night elf empire from a palace in this country and had given her loyalty to Sargeras, and the Ravencrest line stood outside her Highborne court.",
		},
		readMore = { "Wowpedia: Ravencrest Monument", "Wowpedia: Azshara", "Wowpedia: House of Ravencrest" },
	},
	{
		name = "Hetaera's Clutch", faction = "Hostile",
		hook = "A drowned temple of Elune in the Bay of Storms, with hydras nesting in it.",
		lore = {
			"Hetaera's Clutch is a large underwater temple of Elune, off the Azshara coast in the Bay of Storms. Hetaera herself roams it, a hydra of three heads, and the clutch is named for her brood.",
			"She has a rival rather than a cult. Lord Arkkoroc, the sea giant up at the Temple of Arkkoran, calls her a false god who claims to rule these oceans and wants all three of her heads brought to him. Between the two of them nobody has studied the building.",
			"A temple of Elune this far down measures the Sundering better than any ruin on land. When the Well of Eternity collapsed the sea came in over night elf territory, and sites built dry are now reached by holding your breath.",
		},
	},
})

SubsOf("Felwood", {
	{
		name = "Morlos'Aran", faction = "Hostile",
		hook = "A night elf ruin at Felwood's southern edge, older than the Sundering.",
		lore = {
			"Morlos'Aran was a great night elf settlement long before the Sundering, at what is now the southern edge of Felwood. It is one of a family of them: Ameth'Aran and Bashal'Aran down in Darkshore, and Ordil'Aran over in Ashenvale. They were thriving cities once, and are now the same heap of stones in four zones.",
			"When the Burning Legion was broken at Mount Hyjal the demonic energy here did not disperse. It went into the ground, and the trees, the water and the wildlife have been wrong ever since: the wolves and bears around these ruins are angerclaw and felpaw now, and even the rats and roaches are tainted.",
			"Arathandris Silversky, of the Emerald Circle, keeps a post at the ruins, which is what the druids' answer to all this amounts to on the ground.",
		},
		readMore = { "Wowpedia: Morlos'Aran", "Wowpedia: Felwood", "Wowpedia: Emerald Circle" },
	},
})

SubsOf("Un'Goro Crater", {
	{
		name = "The Marshlands", faction = "Hostile",
		hook = "The wet ground in the crater's south-east, and the first of it most people see.",
		lore = {
			"The Marshlands cover much of the south-east of the crater, and they are usually the first part of it anyone walks into: coming in anywhere else from Tanaris tends to end badly.",
			"Raptors own the marsh. Ravasaur hunters and runners work it in numbers, venomhide ravasaurs are among them, and the Ravasaur Matriarch is somewhere in the wet ground. Bloodpetal threshers and lashers grow out of it and oozes move through it.",
			"Torwa Pathfinder keeps to a mound in the middle of the marsh, which is as close to dry footing as this corner of the crater offers.",
		},
		readMore = { "Wowpedia: Marshlands", "Wowpedia: Un'Goro Crater" },
	},
	{
		name = "Eastern Pylon", faction = "Contested",
		hook = "The eastern pylon on the crater rim, one of three nobody can account for.",
		lore = {
			"Three crystal pylons stand on rises around Un'Goro: northern, eastern and western. They react to the crystals found across the crater floor and do something when fed.",
			"Who raised them has not been established. The expedition at Marshal's Refuge went looking for this one on rumour alone, and its working guess is that the pylons have something to do with the crystals turning up all over the crater floor.",
		},
	},
	{
		name = "Western Pylon", faction = "Contested",
		hook = "The third pylon, on the crater's western rim above the hot springs.",
		lore = {
			"The western pylon completes the ring with the northern and eastern ones. All three are the same work and all three are equally unexplained.",
			"Un'Goro is walled the whole way round, holds a jungle in a desert belt, has a live volcano at its centre and three unattributed devices on its rim. What the expedition can show is narrower than that: the pylons take the crater's power crystals, and combining them at a pylon table does something a manual at Marshal's Refuge sets out.",
		},
	},
})

SubsOf("Winterspring", {
	{
		name = "Frostfire Hot Springs", faction = "Contested",
		hook = "Hot springs in the southern snows, which is a stranger combination than it sounds.",
		lore = {
			"The Frostfire springs run warm in the middle of Winterspring's ice, and the water has qualities nobody has explained. There is a researcher camped out here trying to find the source of them and getting nowhere.",
			"The Winterfall furbolgs are drawn to the springs, which is the researcher's other problem. Winterspring has several places where the elements press close: Frostwhisper Gorge in the west is held by ice and water elementals outright.",
		},
	},
	{
		name = "Timbermaw Post", faction = "Neutral",
		hook = "A furbolg camp that the Timbermaw are named for and no longer hold.",
		lore = {
			"The post sits across the road south-east of the Frostfire Hot Springs, west of Lake Kel'Theril. The name says Timbermaw and the camp is not theirs: the corrupted Winterfall tribe has complete control of it, pathfinders and totemics and a den watcher in the snow.",
			"That is the shape of the furbolg problem in one camp. The Timbermaw held their minds and their hold through the Legion's corruption, and the tribes around them did not, so ground with a Timbermaw name on it can turn out to be held by exactly what they came through.",
		},
		readMore = { "Wowpedia: Timbermaw Post", "Wowpedia: Winterfall tribe", "Wowpedia: Timbermaw tribe" },
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
			"Boulder Lode is a goblin operation in the north of the zone, run by Boss Copperplug with enforcers and overseers under him and a company strongbox kept on site. The Venture Company works without any pretence of neutrality or restraint, and it has mines, camps and sludge works across the Barrens.",
			"The Horde wants it stopped. Venture Co. has no central authority to pressure and no reputation to protect, and the same firm is doing the same thing in Mulgore, Stonetalon and Stranglethorn.",
		},
	},
	{
		name = "Blackthorn Ridge", faction = "Hostile",
		hook = "A thorny valley just north of Razorfen Kraul, with one orc living on the ridge.",
		lore = {
			"Blackthorn Ridge is a thorny valley a short way north of Razorfen Kraul, and the Razormane hold it. The ridge it is named for has an orc shaman on it, Brine, camped above a pool whose water is unusually clean for this country, and she is the only thing here that is not quilboar.",
			"Quilboar build around thorn growths they tend with real care. Agamaggan, the boar demigod killed in the War of the Ancients, is where their religion and their architecture both begin, and the thorns are not decorative.",
		},
	},
	{
		name = "The Merchant Coast", faction = "Contested",
		hook = "The Barrens coast south of Ratchet, troubled by Southsea pirates.",
		lore = {
			"The Merchant Coast follows the eastern shore of the Barrens, with Ratchet on the coast and Fray Island offshore. Southsea pirates occupy the beaches south of the port.",
			"Ratchet needs help against the pirates. They have stolen cargo, and the port is offering work to adventurers willing to confront them.",
		},
		readMore = { "Wowpedia: Merchant Coast", "Wowpedia: Southsea Freebooters (quest)" },
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
		hook = "A night elf tower on a peak in northeastern Silithus.",
		lore = {
			"Staghelm Point stands above northeastern Silithus. Ralo'shan the Eternal Watcher resides at the tower, while a bronze drake circles overhead.",
			"Twilight's Run lies down the road from the peak. Twilight cultists occupy the cave and a camp outside its entrance.",
		},
		readMore = { "Wowpedia: Staghelm Point" },
	},
	{
		name = "The Scarab Dais", faction = "Contested",
		hook = "The dais before the Gates, where the Scepter of the Shifting Sands gets used.",
		lore = {
			"The Scarab Dais stands in front of the Gates of Ahn'Qiraj. The Scepter of the Shifting Sands is the key to the Scarab Wall, and the dais is where it is brought to bear.",
			"The scepter is in pieces. It shattered after Fandral Staghelm's betrayal, and what was left was divided among the four Aspects, each dragonflight charged with keeping its share out of the wrong hands. Reassembling it is now argued for seriously, on the grounds that opening Ahn'Qiraj deliberately with the might of Kalimdor behind you beats waiting for the qiraji to come out on a schedule of their own choosing.",
		},
	},
	{
		name = "Ortell's Hideout", faction = "Hostile",
		hook = "A cave in the mountains where a Twilight's Hammer deserter is hiding.",
		lore = {
			"Ortell left the Twilight's Hammer and lives in the mountains south of Southwind Village as a hermit. His own account of the decision is that the cult is not kind to those who leave its ranks and that they hunt him to this day like some sort of beast, so an enemy of theirs is a friend of his. Anyone who finds the cave is asked at once who they are and whether they were followed.",
			"What he can do is read the cult's writing. The Twilight Lexicon is the book their scribes encode with, kept in three chapters in three places by officers called Twilight Keepers, and with all three in hand Ortell will work through a tablet out loud, swapping every third word against the second chapter and every other word against the first, and then wonder whether he has it backwards.",
			"He also wants their post. The cult circulates an encoded bulletin called the True Believer once a month, and it will say whether they are still looking for him or have given up. Anything else useful in it he is willing to share.",
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
		hook = "One of two vineyards south of Goldshire, and one half of a feud with a romance in it.",
		lore = {
			"The Maclures grow grapes on the southern slopes, with the Stonefields a short walk away, and the two families cannot stand each other. Fargodeep Mine lies almost due south of Goldshire between the two homesteads, and that is how most people learn where both of them are.",
			"The feud has a hole in the middle of it. Maybell Maclure and Tommy Joe Stonefield are in love, and getting her off the vineyard to meet him has taken a note to William Pestle at the inn, a trip to the murlocs at Crystal Lake for crystal kelp, and a bottle of invisibility liquor brewed out of it.",
			"The rest of the family's business is smaller. Billy Maclure is accused by an old widow of taking her necklace and is usually to be found scuttling about the vines, a pork belly pie improves his mood, and the Brackwell prize sow comes over to eat the vegetables often enough that somebody has put a price on her collar.",
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
		name = "Mirror Lake Orchard", faction = "Hostile",
		hook = "An orchard on the southern bank of Mirror Lake, occupied by Defias bandits.",
		lore = {
			"The orchard lies in western Elwynn Forest, beside Mirror Lake. Defias bandits have taken possession of the trees and the nearby cottage.",
		},
		readMore = { "Wowpedia: Mirror Lake Orchard" },
	},
	{
		name = "Forest's Edge", faction = "Contested",
		hook = "Where Elwynn's trees give out and Westfall's dust begins.",
		lore = {
			"The change is abrupt. On one side the forest is green and worked; on the other the soil thins out and the farms stop. Anyone walking west sees the kingdom's problem laid out in a few hundred paces.",
			"Westbrook Garrison stands on this ground and watches it, with a morale officer, a weaponsmith and an armourer behind the walls. What comes at them is gnolls out of the hills, and Hogger is the one of those with a name.",
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
			"Four Amberstills work the place, with Ultham Ironhorn teaching the riding. What they lose stock to is on the hillside above them: Rudra Amberstill will point out Vagash, a worg big enough to take a ram, and ask any passing stranger to deal with him.",
		},
	},
	{
		name = "Helm's Bed Lake", faction = "Contested",
		hook = "A frozen lake in eastern Dun Morogh with a hole kept open in the ice.",
		lore = {
			"Helm's Bed lies on the eastern side of the mountains. The lake has frozen over and a hole is kept open in it at all times, so there is fresh water to be had out here.",
			"Crossing the ice is the safe part. Rockjaw troggs work the ground around the lake and Dark Iron dwarves have taken an abandoned building south of it, and the body of the dwarf who went to look at them too closely is still lying out there.",
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
		hook = "A stretch of hills west of Gol'Bolar Quarry, inhabited by hostile wildlife.",
		lore = {
			"The Tundrid Hills lie in south-central Dun Morogh, west of Gol'Bolar Quarry. Hostile wildlife makes travel through them dangerous.",
			"The hills offer a shortcut between Coldridge Valley and eastern Dun Morogh, away from the road through Kharanos.",
		},
		readMore = { "Wowpedia: Tundrid Hills" },
	},
	{
		name = "Chill Breeze Valley", faction = "Contested",
		hook = "A valley in western Dun Morogh with a wendigo at the end of it.",
		lore = {
			"Chill Breeze Valley runs between Gnomeregan and Kharanos. The arm of it that turns north is the part nobody walks, and the snow up there carries the evidence: blood and the remains of animals.",
			"Old Icebeard holds a cave at the end of it. Tundra MacGrann had a month of dried meat salted and locked away for the cold season, locked so the bears could not get at it, and the wendigo carried the whole locker off into the cave. He has not managed the thorium.",
		},
	},
})

SubsOf("Tirisfal Glades", {
	{
		name = "Solliden Farmstead", faction = "Hostile",
		hook = "A pumpkin farm north of Deathknell where the family is still alive.",
		lore = {
			"The Sollidens farmed this ground before the plague and they are farming it still. Almost nobody in Tirisfal can say that. The farmers and farmhands out in the fields are living humans, and they are hostile to everything that comes up the road, Forsaken and Alliance alike.",
			"Brill has found a use for them anyway. The apothecaries send new Forsaken west to steal the farm's pumpkins. They come back laced, and they are tried out on the Scarlet Crusade prisoners in the Gallows' End cellar. The Crusade patrols the ground near the farm from a tower of its own.",
		},
	},
	{
		name = "Nightmare Vale", faction = "Hostile",
		hook = "A withered valley in southwestern Tirisfal, stalked by darkhounds and bats.",
		lore = {
			"Nightmare Vale lies in southwestern Tirisfal Glades, west of the Scarlet Watchtower. Darkhounds and vampire bats inhabit the dying woodland.",
			"A rare white bat, Ressan the Needler, can also be found here.",
		},
		readMore = { "Wowpedia: Nightmare Vale" },
	},
	{
		name = "Venomweb Vale", faction = "Hostile",
		hook = "A valley in the east below the Scarlet Monastery, named for what crawls in it.",
		lore = {
			"The vale is a wide valley in eastern Tirisfal, just south of the Scarlet Monastery. People hunted deer and rabbits here when the grass was green. What it holds now is poisonous spiders under Sri'skulk, which is where the name came from, with ravenous darkhounds and vampiric duskbats through the rest of it.",
			"The Scarlet Crusade is camped in the northern part of the valley under Lieutenant Sanders, friars and zealots on the ground and scouts out on the road, so the approach to their monastery runs through both of them.",
			"Before any of that this was the meeting place of the Council of Tirisfal, and the ground where the first Guardian was given their power. The glades carry the council's name and almost nobody who fights over them knows it.",
		},
		readMore = { "Wowpedia: Venomweb Vale", "Wowpedia: Council of Tirisfal", "Wowpedia: Scarlet Crusade" },
	},
	{
		name = "Brightwater Lake", faction = "Contested",
		hook = "A lake east of Brill with a name from before the plague, and Vile Fin murlocs in it.",
		lore = {
			"Brightwater was named when the name fitted. It sits east of Brill, in what used to be some of the most productive country in Lordaeron.",
			"The water is held by Vile Fin murlocs, muckdwellers and minor oracles of theirs through the shallows, with Deeb somewhere among them. The shore belongs to cursed darkhounds and vampiric duskbats, and the hungering dead and a shambling horror or two walk the bank.",
			"Gunther Arcanus keeps to the lakeside with his books, well above the level of anything else out here, which raises the question of what a mage of that standing is doing on a murloc lake.",
		},
		readMore = { "Wowpedia: Brightwater Lake", "Wowpedia: Gunther Arcanus" },
	},
	{
		name = "Cold Hearth Manor", faction = "Hostile",
		hook = "A farmstead in the central glades, named for the warmth it used to have.",
		lore = {
			"The manor stands on the road east out of the Deathknell crossroads, on the way to Brill. It was known for a warm house and good crops, and the Plague of Undeath killed everyone who lived or worked here.",
			"The fields have gone barren and the Scourge walks them: rotting dead and ravaged corpses in the furrows, cursed darkhounds and duskbats around the buildings, and gloom weed growing where the crops were.",
			"The Forsaken took the farmhouse itself and made something of it. Two tailors, Bowen and Constance Brisboise, work out of it and sell to whoever is passing on the road, which is more than most of Tirisfal's empty houses get.",
		},
		readMore = { "Wowpedia: Cold Hearth Manor", "Wowpedia: Tirisfal Glades", "Wowpedia: Plague of Undeath" },
	},
	{
		name = "Crusader's Outpost", faction = "Hostile",
		hook = "The Crusade's westernmost ground in Tirisfal, a long way from the Monastery.",
		lore = {
			"The Crusade does not only hold the east. Scarlet warriors and missionaries work the western glades out by the Solliden Farmstead. That is as far west as the order reaches anywhere in Lordaeron, and a long way from anything that could reinforce them.",
			"They treat anybody possibly infected as already lost, which in practice means anybody at all. A post this isolated, surrounded by Forsaken ground and by the Scourge, has nothing to gain from making that distinction carefully.",
		},
		readMore = { "Wowpedia: Scarlet Crusade", "Wowpedia: Tirisfal Glades" },
	},
	{
		name = "Scarlet Watch Post", faction = "Hostile",
		hook = "A Scarlet tower guarding the northern side of the Monastery.",
		lore = {
			"Captain Melrache commands this tower in northeastern Tirisfal Glades. The Scarlet Crusade uses it to guard the northern approach to the Scarlet Monastery.",
			"The soldiers also raid from the tower. The Forsaken have identified Melrache and his two bodyguards as targets.",
		},
		readMore = { "Wowpedia: Scarlet Watch Post", "Wowpedia: At War With The Scarlet Crusade (4)" },
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
		hook = "A ruined Silverpine farm occupied by Ravenclaw undead.",
		lore = {
			"Olsen's Farthing was once a farmstead beside Silverpine's trade road. Ravenclaw slaves and raiders occupy the ruins, under the control of Thule Ravenclaw.",
		},
		readMore = { "Wowpedia: Olsen's Farthing" },
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
		hook = "An abandoned mine in the north of the forest, and the name is a warning.",
		lore = {
			"The Skittering Dark is a worked-out mine in northern Silverpine with the spiders in possession. Moss stalkers and mist creepers hold the tunnels, grizzled bears share them, and Krethis Shadowspinner is somewhere outside.",
			"Silverpine's spiders were a problem before any of the zone's other problems arrived, and the zone has since collected plenty: a son of Arugal's magic ranges past the mine mouth, a different kind of trouble on the same road.",
		},
		readMore = { "Wowpedia: Skittering Dark", "Wowpedia: Silverpine Forest" },
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
		hook = "A ferry landing with a boat still in use, and the cargo is bodies.",
		lore = {
			"The ferry crosses Lordamere Lake to Fenris Isle, and the dock on the far side can be seen from this one. It is not derelict. The boat tied up here is heaped with wrapped corpses.",
			"The Scourge have taken this stretch of shore and the Rot Hide are mixed up in it. Where the bodies are going is Fenris Isle, and why is the question anyone finding the boat ends up asking.",
		},
	},
	{
		name = "The Ivar Patch", faction = "Hostile",
		hook = "A pumpkin patch north of the Sepulcher, with two Deathstalkers pinned down in it.",
		lore = {
			"The Ivar Patch was a prosperous farm before the Scourge went through Lordaeron, and Ivar kept farmhands and servants on it. Neither he nor his household survived the Plague of Undeath, and Ivar the Foul is still here and no longer among the living.",
			"Rane and Quinn Yorick were sent through northern Silverpine on a reconnaissance mission and were not heard from again. Both are still on the patch with Deathstalker Erland, Quinn hurt and in need of a potion, and Ivar waits in the barn for their guard to drop.",
			"The fields around the farm are run by mottled worgs, and Gorefang is among them. A signpost at the patch still points the way to the Sepulcher, Pyrewood Village and Tirisfal.",
		},
		readMore = { "Wowpedia: Ivar Patch", "Wowpedia: Ivar the Foul", "Wowpedia: Lost Deathstalkers" },
	},
})

SubsOf("Westfall", {
	{
		name = "The Molsen Farm", faction = "Hostile",
		hook = "An abandoned farmstead in the north, taken over by the Defias.",
		lore = {
			"These lands were farmed by good folk once and the thieves drove them all off, the Molsens with the rest. The Defias Brotherhood moved into the buildings, and Gryan Stoutmantle's scouts report Defias trappers here and at Furlbrow's Pumpkin Farm.",
			"The fields did not stop working when the people left. Harvest watchers and harvest golems still walk them, with the Foe Reaper 4000 among the machines, and sacks of oats are stacked where they were set down. Off the open ground, goretusks and fleshrippers have come in.",
		},
		readMore = { "Wowpedia: Molsen Farm", "Wowpedia: The People's Militia" },
	},
	{
		name = "Jangolode Mine", faction = "Hostile",
		hook = "A Westfall mine with the machines still wandering in it.",
		lore = {
			"Jangolode was one of Westfall's main sources of minerals for Stormwind. Nothing is being mined now: rusty harvest golems wander the workings, and the Defias hold the road outside, running between Moonbrook, the Gold Coast quarry and here.",
			"Westfall has several of these. Moonbrook's mine, the quarry and this one were all somebody's livelihood a few years ago.",
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
		hook = "The lake at the heart of Loch Modan, held behind the Stonewrought Dam.",
		lore = {
			"The Loch fills the middle of Loch Modan, with the Stonewrought Dam holding back its waters at the northern end.",
			"Crocolisks occupy the islands. Hunters seek their skins and meat, but the beasts make that trade dangerous.",
		},
		readMore = { "Wowpedia: The Loch", "Wowpedia: Stonewrought Dam", "Wowpedia: Crocolisk Hunting" },
	},
	{
		name = "Stonesplinter Valley", faction = "Hostile",
		hook = "A trogg-held valley in southwestern Loch Modan.",
		lore = {
			"The Stonesplinter troggs hold this valley and its caves. Dwarven scouts identify Grawmug as the leader of the incursion, with Gnasher and Brawler guarding him.",
			"The local defenders need help keeping the troggs in check. Their reserves have been called to the front, leaving too few soldiers to handle the threat at home.",
		},
		readMore = { "Wowpedia: Stonesplinter Valley", "Wowpedia: In Defense of the King's Lands (Classic)" },
	},
	{
		name = "Algaz Station", faction = "Alliance",
		hook = "A dwarven post at the northern gate, watching the road down into the Wetlands.",
		lore = {
			"Algaz Station guards the approach to Dun Algaz, the pass that carries the road from Loch Modan down into the Wetlands. Everything moving between Khaz Modan's interior and the coast comes through.",
			"The Dragonmaw orcs in the Wetlands make that road worth watching, and what is watching it is three mountaineers and an armourer. The post is small for the job it has.",
		},
	},
	{
		name = "Dun Algaz", faction = "Hostile",
		-- The client also reports this pass as "Algaz Gate".
		aliases = { "Algaz Gate", "The Algaz Gate" },
		hook = "The tunnel pass between Loch Modan and the Wetlands, threatened by Dragonmaw orcs.",
		lore = {
			"Dun Algaz carries the road through the mountains between Loch Modan and the Wetlands. The Dragonmaw have expanded into the pass, threatening to cut off the dwarven homeland from Menethil Harbor.",
			"Mountaineers recruit travellers to fight their way through and report to the port beyond.",
		},
		readMore = { "Wowpedia: Dun Algaz", "Wowpedia: The Algaz Gauntlet" },
	},
})

SubsOf("Redridge Mountains", {
	{
		name = "Rethban Caverns", faction = "Hostile",
		hook = "A cavern system in the foothills north of Lakeshire, full of gnolls.",
		lore = {
			"Rethban ore is named after the man who first found it, Bart Rethban. It smelts weaker than iron, but the ore has a dark flat colour that scribes mix into their dyes, and the Northshire library buys it by the load.",
			"Redridge gnolls live in the caverns now and their drudgers are gathering the ore themselves. Lakeshire's foreman will tell anyone asking for a delivery that the town is busy fortifying itself and repairing orc damage, so they can go down and get it themselves.",
			"Somebody has made a game of the place. The Rethban Gauntlet, which is Yorus Barleybrew's, is to drink a Barleybrew Scalder, go in as far as the first fork and come back out inside the hour, through whole heaps of gnolls, without dying.",
		},
	},
	{
		name = "Lakeridge Highway", faction = "Contested",
		hook = "The old road along the southern shore of Lake Everstill.",
		lore = {
			"The Lakeridge Highway follows the southern edge of Lake Everstill. Once a busy route, it has fallen into disuse since the orcs took Stonewatch Keep. Gnolls patrol the road.",
			"Lakeshire has trouble keeping even its bridge in repair. The town used its iron for weapons during the last orc invasion, and gnolls stole the replacement shipment from Stormwind.",
		},
		readMore = { "Wowpedia: Lakeridge Highway", "Wowpedia: The Everstill Bridge" },
	},
})

SubsOf("Duskwood", {
	{
		name = "The Rotting Orchard", faction = "Hostile",
		hook = "An orchard in the south of the county, with the Nightbane pack living in it.",
		lore = {
			"The orchard lies in southern Duskwood, east of the Yorgen Farmstead and west of the Tranquil Gardens Cemetery, south-west of Darkshire. Nothing grown here since the dark came has been worth harvesting.",
			"The worgen have it. The Nightbane pack occupies the dilapidated buildings and camps among the trees, dark runners in numbers and shadow weavers working their magic in the open, with the tainted ones and vile fangs among them and Nefaru somewhere in the rows.",
			"Something else is here too. The Unseen move through the orchard and are a great deal older and stronger than anything the pack has, and nobody in Darkshire has an account of them.",
		},
		readMore = { "Wowpedia: Rotting Orchard", "Wowpedia: Nightbane pack", "Wowpedia: Duskwood" },
	},
	{
		name = "Dawning Wood Catacombs", faction = "Hostile",
		hook = "The catacombs under Raven Hill Cemetery, holding the county's worst dead.",
		lore = {
			"The catacombs run beneath Raven Hill Cemetery, out at the western end of the forest and well away from Darkshire. What is down there is the most powerful undead in the region, in numbers that overwhelm anyone who goes in alone.",
			"There are two ways in. The eastern entrance opens into a den of ghouls, the worst and most diseased of them, and the western one goes into the halls.",
			"Duskwood's dead do not reliably stay buried, and the county has a great many places like this one. The town's funeral customs have changed accordingly.",
		},
		readMore = { "Wowpedia: Dawning Wood Catacombs", "Wowpedia: Raven Hill Cemetery" },
	},
})

SubsOf("Wetlands", {
	{
		name = "Black Channel Marsh", faction = "Hostile",
		hook = "Dark water in the south-west, with raptor lairs close to the road.",
		lore = {
			"The Black Channel runs through the south-west of the Wetlands and travellers mostly meet it on the road down to Menethil Harbor. The warning given to anyone new is about the raptors: the marsh holds a number of their lairs and the hungrier ones come right up to the roadside.",
			"Mottled raptors and screechers work the banks with crocolisks in the channel itself, and the fen dwellers are no friendlier. Everything in this zone eventually becomes swamp, and the dwarves who built these roads knew it and built them raised.",
		},
		readMore = { "Wowpedia: Black Channel Marsh", "Wowpedia: Wetlands" },
	},
	{
		name = "Menethil Bay", faction = "Alliance",
		hook = "The inlet beside Menethil Harbor, within the larger Baradin Bay.",
		lore = {
			"Menethil Bay lies between Menethil Harbor and the northern cliffs of Dun Morogh. Crocolisks inhabit the water beside the port.",
			"Ships out of Menethil Harbor run to Theramore in Dustwallow Marsh and to Auberdine. Those two routes connect the Alliance ports of Khaz Modan and Kalimdor.",
		},
		readMore = { "Wowpedia: Menethil Bay", "Wowpedia: Menethil Harbor" },
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
		hook = "The south-eastern beach, held by Daggerspine naga.",
		lore = {
			"The Eastern Strand is the coast in the south-east of Hillsbrad, and the Daggerspine naga are on it: shorehunters and shorestalkers on the sand, sirens in the water. The Western Strand at the other end of the same coast has the same trouble.",
			"Southshore treats them as a military matter rather than a nuisance. Marshal Redpath has his lieutenant working the strand, with orders to report the results in person.",
		},
	},
})

SubsOf("Alterac Mountains", {
	{
		name = "Lordamere Lake", faction = "Contested",
		hook = "The great lake below the mountains, with a dead past under it.",
		lore = {
			"Lordamere separates the Alterac Mountains from Silverpine and the Hillsbrad lowlands, with Dalaran a little back from its southern shore. Fenris Isle sits out in it, and east of that the Dawning Isles, overrun by Vile Fin murlocs. Snapjaw turtles work the shallows, and Southshore's cooks will pay for the meat.",
			"Nothing else lives in the water. An ancient plague killed off the lake's aquatic life a very long time ago, and Apothecary Berard was studying it until Arugal's magic took his mind; the Royal Apothecary Society went looking for his journal afterwards, because a plague that emptied a lake is exactly the research it wants.",
			"The lake kept its name when the kingdoms around it stopped keeping theirs. Alterac was dismantled for treason, and Lord Aliden Perenolde's manor still stands on this shore. Lordaeron was destroyed outright. Dalaran's wizards used to quarantine people at an internment camp on the water, and they are not running it any more either.",
		},
	},
	{
		name = "Gallows' Corner", faction = "Contested",
		hook = "An Alterac crossroads patrolled by Crushridge ogres.",
		lore = {
			"Gallows' Corner lies near the Ruins of Alterac. Crushridge ogres hold the crossroads and patrol around its ruined scout tower.",
		},
		readMore = { "Wowpedia: Gallows' Corner" },
	},
	{
		name = "Misty Shore", faction = "Contested",
		hook = "Lordamere's southern waterline, under more or less permanent fog.",
		lore = {
			"The Misty Shore runs along the lake under the Alterac peaks, from Dandred's Fold east towards Dalaran. The fog off the water rarely lifts entirely, and what is on the shore is mostly turtles.",
			"Fenris Keep can be made out from here, standing on its island with the Dawning Isles beyond it. The ruins of Dalaran are a short way inland behind the beach, shut under their dome.",
		},
	},
})

SubsOf("Arathi Highlands", {
	{
		name = "O'Breen's Camp", faction = "Contested",
		aliases = { "O'Breen's Encampment" },
		hook = "What is left of the treasure expedition, camped on the sand at Faldir's Cove.",
		lore = {
			"Captain O'Breen led three ships into Faldir's Cove after a sunken elven treasure and got one of them docked. The camp on the beach is his, and it is where the survivors ended up.",
			"His own crew's account of the night is that the tide simply dropped. The Maiden's Folly and the Spirit of Silverpine ran aground on something in the reef, a temple by the look of it, and went down fast enough that the naga killed the men who made it into the water. O'Breen reached shore; most of his sailors did not.",
			"Nobody is leaving in a hurry. The logs and charts went down with the two ships and he wants them back before any of this reaches other eyes, and the Daggerspine are still massing offshore.",
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
		hook = "Gurubashi ruins on the south-eastern coast, held by a witch doctor and his dead.",
		lore = {
			"Aboraz is one of the chain of Gurubashi sites running the length of the vale, built right down to the waterline and in places beyond it.",
			"What lives in it now is Zanzil the Outcast. He has raised the dead to hold the ruins for him, zombies and risen naga and a hunter, with his own witch doctors among them, and he keeps a Darkspear captive called Yenniku there.",
		},
	},
	{
		name = "Nek'mani Wellspring", faction = "Hostile",
		hook = "A holy spring high in the cliffs, and every race claims the water was made for them.",
		lore = {
			"The wellspring sits high above the bluffs on the western side of the cape, overlooking the Southern Savage Coast. What comes out of it is the only clean fresh water south of Duskwood, and that is the smaller part of why anyone cares.",
			"The spring is the subject of great conflict among religious and mystical scholars, because every race in Azeroth claims the waters were made divine for its own people. Water from this spring turns up in enchantments on this continent and in a dwarf's still over in Westfall.",
			"Holding it at the moment is an expedition of naga explorers, who guard the spring ferociously and have Lord Sakrasis over them.",
		},
		readMore = { "Wowpedia: Nek'mani Wellspring", "Wowpedia: Mok'thardin's Enchantment", "Wowpedia: Holy Spring Water" },
	},
	{
		name = "Mistvale Valley", faction = "Hostile",
		hook = "A valley east of Booty Bay, thick with gorillas.",
		lore = {
			"Mistvale Valley is in the south of the vale, and the elder Mistvale gorillas forage across it with a silverback patriarch among them. Nothing else much lives up here.",
			"Everything the valley produces, somebody in Booty Bay wants. Gorilla fangs and the rare aged sinew go into enchantments; giblets go to a bookmaker who sends them to a man behind on his gambling debts without mentioning where they came from.",
			"Witch Doctor Unbagwa keeps a hidden cave on the cape and is the only one who can call up the white beast Mokk. A man dying of Stranglethorn fever needs the heart of that beast and nothing else will do. The witch doctor will start the spirit talking for a gorilla fang, and asks to be protected from the other gorilla-beasts while he does it.",
		},
	},
	{
		name = "Janeiro's Point", faction = "Contested",
		hook = "An island off Booty Bay with a giant goblin standing on it.",
		lore = {
			"Janeiro's Point is a small island in the water just outside Booty Bay, and the thing standing on it is a statue of a goblin with its arms thrown wide, built on a scale that can be read from well out to sea.",
			"Nobody lives there. The sea giant Mok'rash has the island to himself. That is as close as the point comes to having a keeper.",
		},
	},
	{
		name = "Bloodsail Compound", faction = "Hostile",
		hook = "A loose Bloodsail camp halfway up the western coast.",
		lore = {
			"The compound is not a fortress. It is a loose camp on the western shore of the vale, around the middle of the coast, with warlocks and swashbucklers in it and jungle stalkers prowling the treeline behind.",
			"The Bloodsail work this water and their quarrel is with Booty Bay down the coast. Baron Revilgaz runs that port and they would like to run it instead. Booty Bay's neutrality is commercial rather than principled, and the Steamwheedle Cartel enforces it with bruisers.",
		},
		readMore = { "Wowpedia: Bloodsail Compound", "Wowpedia: Bloodsail Buccaneers" },
	},
	{
		name = "Kal'ai Ruins", faction = "Hostile",
		hook = "Half-sunken troll ruins in the northern jungle, with murlocs in them.",
		lore = {
			"Kal'ai is one of the old troll sites in the north of the vale and a good part of it is under water now. The trolls who built it are not the ones in it.",
			"The Murkgill murlocs live in the ruins: warriors and foragers through the stonework, an oracle and a lord among them, and Gluggle somewhere in the shallows. Stranglethorn tigers and lashtail raptors work the ground above the waterline.",
			"It is worth noticing which way the occupation runs. The Bloodscalp and the Skullsplitter hold their ancestors' ground elsewhere in this jungle, and here the stonework went to something that was never troll at all.",
		},
		readMore = { "Wowpedia: Kal'ai Ruins", "Wowpedia: Murkgill tribe" },
	},
	{
		name = "Mizjah Ruins", faction = "Hostile",
		hook = "Troll ruins south-east of Grom'gol, held by Mosh'Ogg ogres.",
		lore = {
			"The ruins are Gurubashi work and the ogres have them now. Mosh'Ogg brutes and witch doctors are camped in the stonework, with Roloch somewhere among them, and crocolisks and raptors in the water below.",
			"They are there for the road. Grom'gol's job in this jungle is keeping Stonard supplied, and the ogres have gone on ambushing the supply caravans after being warned off, so clearing them out of the ruins is less about the ruins than about sending a firm message.",
		},
	},
})

SubsOf("Badlands", {
	{
		name = "Camp Boff", faction = "Hostile",
		hook = "One of the four Badlands ogre camps, and the one the mercenaries pass through.",
		lore = {
			"Four ogre camps sit across the Badlands holding the roads: Boff, Kosh, Cagg and Wurg. Boff is the one worth knowing, because the wandering band of Dustbelcher mercenaries is seen near it and travels through it, and Kargath's orcs send people here to look for them.",
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
		hook = "A cave in the north-east of the zone, filled with oozes.",
		lore = {
			"The Weeping Cave is in the north-east of the Western Plaguelands, just west of the Thondroril River. Nothing in it is working to any plan: it is full of slime.",
			"The cave holds vile slimes and devouring oozes, with rotting behemoths and a decaying horror among them, and an elemental called The Husk turns up here and nowhere else.",
			"Plaguebloom grows at the mouth of it, which is the only reason most people come this far east along the river.",
		},
		readMore = { "Wowpedia: Weeping Cave", "Wowpedia: Western Plaguelands", "Wowpedia: The Husk" },
	},
	{
		name = "Darrowmere Lake", faction = "Contested",
		hook = "The lake around Caer Darrow, with a school of necromancy on the island in it.",
		lore = {
			"Darrowmere separates Caer Darrow from the shore. The island held the Barov family's estate, a wealthy and entirely respectable holding before Kel'Thuzad took an interest in it.",
			"He talked them into it rather than taking it. Kel'Thuzad promised immortality to anyone who would serve the Lich King, the Barovs believed him and handed over the keep and its crypts, and the cultists killed them afterwards. The crypts became Scholomance, and the family's ghosts are still on the island.",
			"The lake carries what is left of the rest of them. Caer Darrow's citizens, guardsmen and horsemen stand about the water as spirits, and the Barovs' surviving relatives on both sides of the faction divide are still litigating the deeds.",
		},
	},
})

SubsOf("Eastern Plaguelands", {
	{
		name = "Blackwood Lake", faction = "Contested",
		hook = "A polluted lake with a drowned town under it, and a head at the bottom.",
		lore = {
			"Blackwood Lake sits in the Eastern Plaguelands and the water in it is foul. There was a town of the same name here once, and the lake is what is left of the ground it stood on.",
			"On the shore, spectral betrayers and defenders stand without moving, and plaguebats, plaguehounds and carrion grubs work the banks around them. The annals of Darrowshire put the head of Horgus the Ravager at the bottom of this lake, and his skull is down there.",
			"The Argent Dawn keeps a small camp on the lake with a medic in it. Water in the Plaguelands carries the blight the way the soil does, so they bring their own.",
		},
		readMore = { "Wowpedia: Blackwood Lake", "Wowpedia: Eastern Plaguelands", "Wowpedia: Argent Dawn" },
	},
	{
		name = "Pestilent Scar", faction = "Hostile",
		hook = "A deep gorge in the blighted ground of the Eastern Plaguelands.",
		lore = {
			"The Pestilent Scar cuts into the ground of the Eastern Plaguelands. The gorge is inhabited by oozes, below the surrounding plague-stricken land.",
		},
		readMore = { "Wowpedia: Pestilent Scar" },
	},
	{
		name = "Mazra'Alor", faction = "Hostile",
		hook = "The ziggurat at the heart of Zul'Mashar, held by Mossflayer trolls.",
		lore = {
			"Mazra'Alor is the large ziggurat in the middle of Zul'Mashar, in the north-east of the Plaguelands, and it is forest troll work. The Mossflayer hold it: scouts, cannibals and shadowhunters, with their own dead walking among them as zombies. That is what the plague has made of a tribe that was here before any of this.",
			"What they are keeping is worth more than the building. Two of the six Tablets of Mosh'aru are in Mossflayer hands, and the tablets are the record of how Hakkar's essence was contained. A troll who wanted only the first two of them was not telling the whole truth about why.",
		},
	},
	{
		name = "Browman Mill", faction = "Hostile",
		hook = "A haunted lumber mill north of Light's Hope Chapel.",
		lore = {
			"Browman Mill stands just north of Light's Hope Chapel in the Eastern Plaguelands. Scourge undead occupy the mill and its surroundings.",
		},
		readMore = { "Wowpedia: Browman Mill" },
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
		hook = "A ruined church and graveyard behind Karazhan.",
		lore = {
			"Morgan's Plot lies behind Karazhan in Deadwind Pass. A small church stands beside the graveyard and its crypt. Unliving residents haunt the church and the nearby slope.",
		},
		readMore = { "Wowpedia: Morgan's Plot" },
	},
})

SubsOf("Durotar", {
	{
		name = "Kolkar Crag", faction = "Hostile",
		hook = "A craggy gorge in southern Durotar with centaur living in it.",
		lore = {
			"The Kolkar are centaur, and centaur are the reason the tauren were nomads for generations before the Horde arrived in Kalimdor. They hunted them across the continent.",
			"The crag sits at Durotar's southern end, where the Barrens begins, and having Kolkar inside Durotar's borders at all is a problem Razor Hill handles rather than solves. The clans trace themselves to Zaetar, a son of the demigod Cenarius, and the earth elemental princess Theradras, and they have the temperament that suggests.",
		},
	},
	{
		name = "Tor'kren Farm", faction = "Horde",
		hook = "A farm northwest of Razor Hill, where a mother waits for news.",
		lore = {
			"Misha Tor'kren lives at this farm in northwestern Durotar. Her son Kron went to hunt crocolisks along the Southfury River and has not returned.",
			"Misha warned him about the beasts before he left. Now she asks travellers to search for him, or bring back some sign of his fate.",
		},
		readMore = { "Wowpedia: Tor'kren Farm", "Wowpedia: Lost But Not Forgotten (Classic)" },
	},
	{
		name = "Bladefist Bay", faction = "Horde",
		hook = "The bay on Durotar's northeastern coast, near Skull Rock.",
		lore = {
			"Bladefist Bay lies east of Orgrimmar, around Skull Rock on the northeastern Durotar coast. The southern coast of Azshara is visible across the water.",
		},
		readMore = { "Wowpedia: Bladefist Bay" },
	},
	{
		name = "Southfury River", faction = "Contested",
		hook = "The river between Durotar and the Barrens, and the border in practice.",
		lore = {
			"The Southfury runs down the western side of Durotar and marks where the orcs' land ends and the Barrens begin. Crossing it is how most traffic enters or leaves, by one of the three bridges over it.",
			"Further north the same river divides Ashenvale from Azshara, so four of Kalimdor's zones take their edge from it.",
			"Durotar is named for Durotan, chieftain of the Frostwolf clan and Thrall's father, who refused the demon blood when Gul'dan offered it to the clans and was murdered for it.",
		},
	},
})

SubsOf("Mulgore", {
	{
		name = "Winterhoof Water Well", faction = "Horde",
		hook = "A sacred well in southern Mulgore, poisoned and guarded by goblins.",
		lore = {
			"The Winterhoof Water Well stands southeast of Bloodhoof Village, at the edge of the Rolling Plains. Goblins and their servants have tainted its water.",
			"Mull Thunderhorn is preparing a cleansing totem and asks for paws from prairie wolves and talons from adult plainstriders. The goblins guarding the well must also be faced before its waters can be used again.",
		},
		readMore = { "Wowpedia: Winterhoof Water Well", "Wowpedia: Poison Water (Classic)", "Wowpedia: Winterhoof Cleansing (Classic)" },
	},
	{
		name = "Thunderhorn Water Well", faction = "Horde",
		hook = "A sacred well north of Bloodhoof Village, tainted by goblins.",
		lore = {
			"The Thunderhorn Water Well stands by the north road between Bloodhoof Village and Thunder Bluff. Goblins and their servants have poisoned the sacred wells of Mulgore.",
			"Mull Thunderhorn is preparing cleansing totems. For this well, he needs claws from prairie stalkers and flatland cougars before the cleansing ritual can begin.",
		},
		readMore = { "Wowpedia: Thunderhorn Water Well", "Wowpedia: Thunderhorn Totem (Classic)", "Wowpedia: Thunderhorn Cleansing (Classic)" },
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
		hook = "A corrupted cave north of Dolanaar, with a satyr and his grells in it.",
		lore = {
			"Fel Rock is a cave just north of Dolanaar that was beautiful once and is not now. Grells have infested it in numbers and Lord Melenas has gathered them, a satyr on a tree that is supposed to have none.",
			"Tallonkai Swiftroot in Dolanaar wants him dealt with and wants it kept quiet. The satyr are an embarrassment to the night elves already and this one is far too close to home.",
			"Teldrassil was grown to win back the immortality the night elves spent destroying Archimonde at Mount Hyjal. It was planted without the dragon Aspects' blessings, it is sick, and caves like this one are part of how that shows.",
		},
		readMore = { "Wowpedia: Fel Rock", "Wowpedia: Twisted Hatred", "Wowpedia: Lord Melenas" },
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
		hook = "The lake that feeds the Wellspring River, in the tree's north.",
		lore = {
			"The lake lies in Teldrassil's north with the Oracle Glade over to the west of it, and the Wellspring River runs north out of it to the tree's edge. The water comes from a spring deep inside the tree rather than off the slopes above.",
			"The banks are not quiet. Timberlings have gone crazed and work the shore in numbers, webwood spiders are in the trees with Lady Sathrah among them, and Blackmoss the Fetid is out in the shallows.",
		},
		readMore = { "Wowpedia: Wellspring Lake", "Wowpedia: Teldrassil" },
	},
	{
		name = "Ban'ethil Hollow", faction = "Hostile",
		hook = "The hollow above the barrow den, with Gnarlpine furbolgs in it.",
		lore = {
			"The hollow sits over the Ban'ethil Barrow Den, where night elf druids sleep while their minds walk the Emerald Dream.",
			"The Gnarlpine hold the hollow and have got into the den below, defenders and shamans and augurs of theirs through the whole of it, with fel cones scattered where the satyr have been. A druid's body left untended is just a body: Oben Rageclaw's is down in the den under an enchantment the Gnarlpine shaman work with a charm, and his spirit cannot do anything about it from where it is.",
			"The furbolgs were allies until something on this tree drove them mad. Two moonwells still stand in the hollow and say what the place was before they came.",
		},
	},
})

SubsOf("Darkshore", {
	{
		name = "Wildbend River", faction = "Contested",
		hook = "A tainted river near the Grove of the Ancients.",
		lore = {
			"Wildbend River crosses southern Darkshore near the Grove of the Ancients. It continues the course of Bloodvenom River from Felwood, flowing down from the mountains towards the sea.",
		},
		readMore = { "Wowpedia: Wildbend River" },
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
		hook = "The Burning Blade's cave on Dreadmist Peak, with the Demon Seed in it.",
		lore = {
			"The den is a cave on the peak itself, and what the Burning Blade keep in it is the Demon Seed, standing above an altar of fire. The cult rallies around that one object, and Orgrimmar knows where it is and wants it destroyed.",
			"They are orcs chasing the demonic power Thrall outlawed. Gul'dan traded the orcs' shamanism for warlock craft and the Legion's favour, and there are orcs who would take that trade again. A demon called Rathorian is in the den some of the time.",
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
		hook = "A lake in western Ashenvale, held by murlocs rather than by anybody who wanted it.",
		lore = {
			"Falathim lies in the west of the forest, south-east of the Zoram Strand and south-west of Maestra's Post. The Saltspittle murlocs have the shore and the shallows, oracles and warriors among them, with a big one called Mugglefin in the water.",
			"Teronis went missing here. He was a night elf scholar, he was last seen by this lake, and his body is still lying on the bank where the murlocs left it.",
		},
	},
	{
		name = "Ruins of Ordil'Aran", faction = "Hostile",
		hook = "Night elf ruins in northwestern Ashenvale, occupied by the Cult of the Dark Strand.",
		lore = {
			"The Ruins of Ordil'Aran lie northeast of Maestra's Post. The Cult of the Dark Strand has established itself here, and Delgren the Purifier seeks a soul gem carried by one of its members.",
			"The heartswood tree also grows among the ruins. Warlocks tell of two lovers who fell together in the War of the Ancients, and of the tree that grew where they died.",
		},
		readMore = { "Wowpedia: Ruins of Ordil'Aran", "Wowpedia: The Tower of Althalaxx (4)", "Wowpedia: Heartswood (quest)" },
	},
	{
		name = "Bathran's Haunt", faction = "Hostile",
		hook = "A ruin in the north where a healing plant grew, with Forsaken picking it over.",
		lore = {
			"Bathran's Hair grew in these ruins, north of Maestra's Post and just short of the Darkshore border. It was a plant that cured ailments of the spirit, a rare property and the reason anyone remembers the place.",
			"The Forsaken are there now. Apothecary Falthis has brought herbalists, seekers and a few thugs out to the haunt, and the night elves who hear about it call that very troubling indeed. They are not wrong to: what the Royal Apothecary Society wants with a cure for the spirit is an open question.",
		},
	},
	{
		name = "The Shrine of Aessina", faction = "Contested",
		hook = "A forest shrine west of Astranaar.",
		lore = {
			"The Shrine of Aessina stands in southwestern Ashenvale, west of Astranaar and southwest of Maestra's Post.",
			"Therysil lives at the shrine. Her sister Therylune has been trapped by cultists at the Master's Glaive in Darkshore and needs help escaping.",
		},
		readMore = { "Wowpedia: Shrine of Aessina", "Wowpedia: Therylune's Escape" },
	},
	{
		name = "Fallen Sky Lake", faction = "Contested",
		hook = "A small lake in the south-east, where moonstones used to be gathered.",
		lore = {
			"Night elves gathered moonstones at Fallen Sky Lake until the shadethicket came. The treants hold the water now, and their oracle has collected up the fallen stones and sits on the island in the middle of the lake with them.",
			"Astranaar sends out for a moonstone when somebody is too weak to mend on their own, and this is where the stones were. The lake lies south-east of the village, below Silverwing Outpost, and the errand is no longer a short one.",
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
		hook = "A Horde war party camped at the edge of the salt flats.",
		lore = {
			"Ironstone Camp is Moktar Krin's. His war party was sent out to drive the Explorers' League off the Rustmaul dig site, and it made camp here on the edge of the Shimmering Flats with its kodos to do it.",
			"That is not what they are fighting now. The digging opened a silithid nest, and what came out of it is why the camp is still sitting at the edge of the flats rather than on the dig.",
		},
	},
	{
		name = "Galak Hold", faction = "Hostile",
		hook = "A Galak centaur holding in the eastern canyon.",
		lore = {
			"The hold is one of the Galak clan's positions, and the clan is why Thousand Needles has never been safely crossed. Their stronghold proper is Splithoof Crag, against the canyon's northern wall.",
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
			"Bolgan's Hole is a cave in the cliff face at Gelkis Village, in Desolace's south-west, and the most senior of the Gelkis centaur are in it. Khan Shaka holds that seat.",
			"The zone supports very little. Nijel's Point in the north, Ghost Walker Post in the centre and Shadowprey Village on the coast are the settlements, and there is almost nothing between them.",
		},
	},
	{
		name = "Sargeron", faction = "Hostile",
		hook = "Ancient night elf ruins in northeastern Desolace, occupied by Hatefury satyrs.",
		lore = {
			"Sargeron stands in northeastern Desolace. Hatefury satyrs inhabit the remains of the night elf settlement.",
			"Their horns, claws and blood are sought as magical reagents. Researchers also seek a shadowstalker's scalp to break the wards concealing a demon lord.",
		},
		readMore = { "Wowpedia: Sargeron", "Wowpedia: Reagents for Reclaimers Inc. (quest)", "Wowpedia: The Corrupter (2)" },
	},
})

SubsOf("Dustwallow Marsh", {
	{
		name = "North Point Tower", faction = "Alliance",
		hook = "Theramore's northern watchtower, on a well-travelled stretch of road.",
		lore = {
			"North Point is one of the scout towers Theramore keeps out in the marsh, with Sentry Point and West Point Tower, and it stands in the north near the road. Theramore's own sentries garrison it.",
			"The quieter work out this way is done by the infiltrators camped in tents along the road, who are watching Brackenwall Village and anything else that might come at the border. The men in the towers are Kul Tiras marines, paid at the start of every month and inclined to go somewhere else with it.",
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
		hook = "The eastern end of Feralas, where the forest runs out into Thousand Needles.",
		lore = {
			"The Lower Wilds are the eastern section of Feralas, the ground the road crosses on its way out to Thousand Needles. Longtooth runners and ironfur bears hold most of it, in numbers, with gravelsnout troggs and needles cougars coming in from the dry country at the far end.",
			"Thalanaar is at that far end, where Falfindel Waywarder keeps the road and Thyssiana keeps the hippogryphs. Both factions' holdings in Feralas are small. Between them they hold rather less of this zone than the animals do.",
		},
	},
	{
		name = "The High Wilderness", faction = "Hostile",
		hook = "A vast forest in the west of the zone, with the Gordunni ogres holding the ruins in it.",
		lore = {
			"The High Wilderness stretches from the Forgotten Coast to the Verdantis River across western Feralas. Abandoned and ruined structures stand in the trees on ground that belonged to the night elves once, and the Gordunni ogres have taken that ground over. They do not take kindly to anyone who walks into it.",
			"The forest itself is busy. Groddoc apes, ironfur bears, feral scar yetis and frayfeather hippogryphs work it, Old Grizzlegut and Antilus the Soarer are somewhere in the trees, and hippogryph eggs sit in nests on the ground.",
		},
		readMore = { "Wowpedia: High Wilderness", "Wowpedia: The High Wilderness (quest)" },
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
		hook = "An ogre camp in the hills of Feralas.",
		lore = {
			"Gordunni ogres occupy the hills north of Lariss Pavilion. Their presence has scarred the surrounding forest, and the Horde seeks to stop their expansion.",
			"The ogres bury cobalt at the outpost. An interested collector at Camp Mojache offers a shovel to anyone willing to dig it up.",
		},
		readMore = { "Wowpedia: Gordunni Outpost", "Wowpedia: The Ogres of Feralas (1)", "Wowpedia: Gordunni Cobalt" },
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
			"Who raised it is not a mystery. The trolls held this land long before anyone else and left ruins across the whole desert, and the gold ornaments buried through them, the gahz'ridian, were modelled after Gahz'rilla, a hydra they worshipped as a god.",
			"Marvon Rivetseeker is the one working on it. He is a goblin who calls himself a scientist and a treasure hunter in the same breath, he left Ratchet to study these ruins, and he has a camp out by the pillar with the desert's scorpids and hyenas for company.",
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
		hook = "A Hazzali silithid hive sunk into the sand of the south-eastern desert.",
		lore = {
			"The chasm opens into several large hive complexes in the south-east of Tanaris, and the silithid in them are Hazzali: wasps, swarmers, workers, stingers, tunnelers and sandreavers, with Haarka the Ravenous somewhere inside.",
			"The Gadgetzan Water Co. sent its best surveyor out here and lost him. Junior Surveyor Scrimshank's gear is still lying in the chasm, and what worries Senior Surveyor Fizzledowser is that the bugs now appear to have infested two major regions of the desert rather than one.",
		},
		readMore = { "Wowpedia: Gaping Chasm", "Wowpedia: The Scrimshank Redemption" },
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
		hook = "Azshara's northern shore, with naga coming out of the shallows.",
		lore = {
			"The Jagged Reef is the northern coast of Azshara: sand broken up by jets of stone, with rocks and shallows under the water that make going along it slow work. Storm Bay naga come up onto the beach, with makrinni and coralshell tortoises on it, and a mammoth shark works the deeper water.",
			"The naga did not come from anywhere else. Azshara did not die in the Sundering: she and the followers closest to her became the naga, and the zone that still carries her name is where most of them are.",
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
		hook = "A night elf tower on the far eastern point, shut and abandoned.",
		lore = {
			"The tower stands on the tip of land north-east of the Bay of Storms and was part of the night elf civilisation that covered most of what is now called Azshara. It is closed and empty, and nobody has got it open.",
			"The beaches below it are patrolled rather than deserted. Storm Bay warriors work the sand with makrura scrabblers and coralshell lurkers, and wavethrashers take the shallows.",
			"Eldarath, the highborne city, lies inland from here. The highborne were Azshara's nobility and her arcane scholars, and their pursuit of magic is what let her reach Sargeras at all. Everything in this region traces back to that.",
		},
		readMore = { "Wowpedia: Tower of Eldara", "Wowpedia: Azshara", "Wowpedia: Highborne" },
	},
	{
		name = "The Shattered Strand", faction = "Hostile",
		hook = "The shore along the northern side of the Bay of Storms.",
		lore = {
			"The Shattered Strand lines the north side of the Bay of Storms in Azshara. The Temple of Arkkoran and the Tower of Eldara stand along this coast. Hydras, sea giants, makrura and murlocs inhabit the shore.",
		},
		readMore = { "Wowpedia: Shattered Strand" },
	},
})

SubsOf("Felwood", {
	{
		name = "Bloodvenom River", faction = "Hostile",
		hook = "The corrupted river through central Felwood, and it does not stay in the zone.",
		lore = {
			"The Bloodvenom runs through the middle of Felwood, past the Horde's waypoint at Bloodvenom Post, and nothing in it is drinkable. The banks crawl with noxious oozes and the rest of the forest's corrupted wildlife.",
			"It carries the corruption out. The river comes off these mountains and becomes the tainted Wildbend River in Darkshore, which is how a zone that had nothing to do with the Legion ends up drinking Felwood's water.",
			"When the Burning Legion was broken at Mount Hyjal the demonic energy in this region did not disperse. It went into the ground and the water, and the trees and wildlife followed.",
		},
		readMore = { "Wowpedia: Bloodvenom River", "Wowpedia: Felwood", "Wowpedia: Wildbend River" },
	},
	{
		name = "Irontree Cavern", faction = "Hostile",
		hook = "A cave in northern Felwood, inhabited by corrupted treants.",
		lore = {
			"Irontree Cavern lies in the Irontree Woods. Warpwood shredders and moss flayers inhabit its depths, part of the corruption afflicting the northern forest.",
		},
		readMore = { "Wowpedia: Irontree Cavern" },
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
		hook = "A wrecked dwarf camp in southern Winterspring, taken over by wildkin.",
		lore = {
			"The dwarven name on the map is Jaron Stoneshaper's. He is Explorers' League, he put a camp up beside a cave in the south of Winterspring, and the wildkin drove him off it. He got clear and one of his party did not, and his supplies and his wagon are still out in the snow where the owlbeasts left them.",
			"He had unearthed something at the dig and the wildkin came for it. Jaron is at Starfall Village now. Winterspring is thinly held either way: Everlook is a goblin town, Starfall Village is a small night elf post, and the rest belongs to the wildlife and the cold.",
		},
	},
	{
		name = "The Hidden Grove", faction = "Neutral",
		hook = "A walled crater in the north-east of the zone, held by hostile owlbeasts.",
		lore = {
			"The Hidden Grove is a forested crater in north-eastern Winterspring, ringed on all sides by high cliffs and close to inaccessible. One cave on the south-eastern face of the ridge leads in.",
			"Owlbeasts hold it, and they are extremely hostile. The moontouched, the crazed and the berserk among them are thick on the ground, with chillwind ravagers, elder shardtooths and winterspring screechers alongside, and most adventurers do not attempt the grove at all.",
		},
		readMore = { "Wowpedia: Hidden Grove", "Wowpedia: Winterspring" },
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
