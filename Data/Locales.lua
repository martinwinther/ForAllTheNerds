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
		hook = "High ground east of Tarren Mill, valuable to whoever is holding it this week.",
		lore = {
			"Darrow Hill overlooks the eastern approach to Tarren Mill. In a war fought between two towns a short walk apart, a hill with a view gets taken, and it has changed hands more than once.",
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
			"The Boulderfist are the largest ogre power in Arathi and one of three parties carving up Stromgarde. Camps like this one hold the open country between the city and Refuge Pointe.",
			"Ogres east of the sea are the Old Horde's leavings, brought over by Gul'dan during the Second War and abandoned when it ended. They have had no leadership and no purpose since, and the Highlands have offered them neither.",
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
		hook = "A blighted vale in the west, where the ground itself has started producing.",
		lore = {
			"The Fungal Vale is one of the places in the Plaguelands where corruption has stopped being damage and become an ecology. What grows here was not planted and is not natural.",
			"Pockets like this one get mapped carefully by the Argent Dawn. They mark where the blight is being actively maintained rather than merely lingering, and something maintaining it is a worse problem than something left over.",
		},
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
		hook = "A demon-infested cave at the northern edge of the Valley of Trials.",
		lore = {
			"The Burning Blade Coven lies in the mountains along the northern edge of the Valley of Trials. The cave holds imps and felstalkers, with Yarrog Baneshadow deep inside.",
			"Recruits are sent to recover a powerful medallion from the coven. The discovery of the Burning Blade here raises fears that a larger threat is spreading through Durotar.",
		},
		readMore = { "Wowpedia: Burning Blade Coven", "Wowpedia: Burning Blade Medallion (Classic)", "Wowpedia: Report to Sen'jin Village (Classic)" },
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
			"Jademir Lake sits in the north of the jungle with an island at its centre, and the island is the Dream Bough. That is one of four places in this world where the Emerald Dream presses against the waking one.",
			"The green dragonflight guards all four. Lethlas holds this one with tree warders around him, and the whelps along the lake's north-western shore have gone sick. Something has gone wrong in the Dream, and the dragons posted at Seradane, Bough Shadow, Twilight Grove and the Dream Bough have turned on everyone who comes near.",
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
		hook = "Ancient troll ruins east of Gadgetzan, occupied by Wastewander bandits.",
		lore = {
			"The Wastewander hold these ruins in northeastern Tanaris. Their bandits and thieves are among the targets sought by the Gadgetzan Water Company, whose wells the nomads have seized.",
		},
		readMore = { "Wowpedia: Noonshade Ruins", "Wowpedia: Wastewander Justice" },
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
			"Hetaera's Clutch is a large underwater temple of Elune, off the Azshara coast in the Bay of Storms. Hetaera herself roams it, a hydra of three heads, and the clutch is named for her brood.",
			"She has a rival rather than a cult. Lord Arkkoroc, the sea giant up at the Temple of Arkkoran, calls her a false god who claims to rule these oceans and wants all three of her heads brought to him. Between the two of them nobody has studied the building.",
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
			"The Frostfire springs run warm in the middle of Winterspring's ice, and the water has qualities nobody has explained. There is a researcher camped out here trying to find the source of them and getting nowhere.",
			"The Winterfall furbolgs are drawn to the springs, which is the researcher's other problem. Winterspring has several places where the elements press close: Frostwhisper Gorge in the west is held by ice and water elementals outright.",
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
			"The scepter is in pieces. It shattered after Fandral Staghelm's betrayal, and what was left was divided among the four Aspects, each dragonflight charged with keeping its share out of the wrong hands. Reassembling it is now argued for seriously, on the grounds that opening Ahn'Qiraj deliberately with the might of Kalimdor behind you beats waiting for the qiraji to come out on a schedule of their own choosing.",
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
		hook = "A ferry landing with a boat still in use, and the cargo is bodies.",
		lore = {
			"The ferry crosses Lordamere Lake to Fenris Isle, and the dock on the far side can be seen from this one. It is not derelict. The boat tied up here is heaped with wrapped corpses.",
			"The Scourge have taken this stretch of shore and the Rot Hide are mixed up in it. Where the bodies are going is Fenris Isle, and why is the question anyone finding the boat ends up asking.",
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
		hook = "An island off Booty Bay with a giant goblin standing on it.",
		lore = {
			"Janeiro's Point is a small island in the water just outside Booty Bay, and the thing standing on it is a statue of a goblin with its arms thrown wide, built on a scale that can be read from well out to sea.",
			"Nobody lives there. The sea giant Mok'rash has the island to himself. That is as close as the point comes to having a keeper.",
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
		hook = "A deep gorge in the blighted ground of the Eastern Plaguelands.",
		lore = {
			"The Pestilent Scar cuts into the ground of the Eastern Plaguelands. The gorge is inhabited by oozes, below the surrounding plague-stricken land.",
		},
		readMore = { "Wowpedia: Pestilent Scar" },
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
		hook = "A lake in western Ashenvale, held by murlocs rather than by anybody who wanted it.",
		lore = {
			"Falathim lies in the west of the forest, south-east of the Zoram Strand and south-west of Maestra's Post. The Saltspittle murlocs have the shore and the shallows, oracles and warriors among them, with a big one called Mugglefin in the water.",
			"Teronis went missing here. He was a night elf scholar, he was last seen by this lake, and his body is still lying on the bank where the murlocs left it.",
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
