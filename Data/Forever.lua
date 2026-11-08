local addonName, ns = ...

-- ===========================================================================
-- Data/Forever.lua -- the zones World of Warcraft: Forever adds to the
-- original world.
--
-- IMPORTANT: every entry here is spoiler = true, so it is hidden until the
-- user opts in with /ftn forever on. These are deliberately written as
-- BACKGROUND ONLY: where a place sits, who lives there, and the established
-- pre-WoW history the name is reaching back to. No questline outcomes, no
-- "and then it turns out", no villain reveals. The point is to walk into a new
-- zone understanding what it is standing on, not to be told what happens.
--
-- The four zones are Zephras Isle, Riverglades, Shen'dralas and Mount Hyjal.
--
-- The SPELLINGS are no longer the problem. Forever's AreaTable gives 68 named
-- areas across these zones, and tools/forever-areas.tsv lists all of them with
-- the client's own spelling and their area ids.
--
-- The SOURCES are. Only the entries below have a name that reaches back to
-- established pre-WoW or vanilla lore: Malorne, Aviana, the Well of Eternity,
-- the Magram, the Bristleback, Agamaggan, Al'Akir and Skywall.
--
-- The zone articles on warcraft.wiki.gg carry real history for these places,
-- and everything those four pages support is now written: the First War sack
-- of Sunnyglade and the towns the survivors founded, the Siege of Farholde,
-- the Twilight's Hammer arriving out of the Tomb of Sargeras, the Skyborne's
-- vanished elementals and their failing island.
--
-- 35 areas are still unwritten. They need the individual subzone articles or
-- the game itself; tools/forever-areas.tsv lists them. Client data will not
-- help, whatever effort goes in: quest text and NPC dialogue are what describe
-- a place in this game and both live on the server.
--
-- Nothing here is invented. That is the line.
-- ===========================================================================

local Zone, SubsOf, Instance = ns.Zone, ns.SubsOf, ns.Instance

-- ---------------------------------------------------------------------------
-- MOUNT HYJAL
-- ---------------------------------------------------------------------------

Zone{
	name = "Mount Hyjal", continent = "Kalimdor", faction = "Contested", levels = "55-60",
	era = "forever", spoiler = true,
	hook = "The mountain where the Legion was stopped, and where the night elves burned their own immortality to do it.",
	lore = {
		"Mount Hyjal is the most important ground in recent history. Nordrassil, the first World Tree, was planted at its summit over the Well of Eternity's remnant after the Sundering. For ten thousand years it was the source of the night elves' immortality and their bond to the natural world.",
		"At the end of the Third War the Burning Legion came here to destroy it. Archimonde, the Legion's field commander, had already levelled Dalaran and he marched on Hyjal to take the Well's power for himself. What met him was the one thing nobody had expected: humans under Jaina Proudmoore, orcs under Thrall, and night elves under Tyrande Whisperwind and Malfurion Stormrage, fighting together.",
		"They held him long enough. Malfurion's plan was to let Archimonde reach the summit and then spend Nordrassil itself: the wisps of Hyjal poured their energy into him and he was annihilated at the tree's roots. It worked. It also destroyed Nordrassil's power, and with it the night elves' immortality, which they gave up knowingly.",
		"The mountain has been closed since. Hyjal became sacred and off limits, guarded by the druids and the Ancients, while the forest below slowly recovered and the demon remnants in Darkwhisper Gorge were left to fester. Reaching it at all means going through territory that has been sealed for years.",
	},
	didYouKnow = "The alliance that saved this world at Hyjal was assembled by Medivh, the same Guardian who had opened the Dark Portal and started the whole catastrophe. Freed of Sargeras, he spent his second life warning everybody and getting them into the same army.",
	readMore = { "Wowpedia: Mount Hyjal", "Wowpedia: Battle of Mount Hyjal", "Wowpedia: Nordrassil", "Wowpedia: Archimonde" },
}

SubsOf("Mount Hyjal", {
	{
		name = "Darkwhisper Gorge", parent = "Mount Hyjal", faction = "Hostile",
		era = "forever", spoiler = true,
		hook = "The demon-held canyon on the approach to Hyjal, never cleared after the Third War.",
		lore = {
			"Darkwhisper Gorge runs up out of southern Winterspring toward Hyjal, and it has been held by Burning Legion remnants since the Third War ended.",
			"These are not a new invasion. They are what was left on the mountain's slopes when Archimonde died: demons that survived the battle, were cut off, and have been sitting in a canyon nobody had the strength to clear.",
			"The road to the most sacred site in Kalimdor runs through a canyon full of demons. That is what the victory left behind.",
		},
	},
	{
		name = "Nordrassil", parent = "Mount Hyjal", faction = "Neutral",
		era = "forever", spoiler = true,
		hook = "The first World Tree, spent to kill a demon lord and still standing over the Well.",
		lore = {
			"Nordrassil was planted by the dragon Aspects over the Well of Eternity's remaining waters after the Sundering, and blessed by Alexstrasza, Ysera and Nozdormu. It gave the night elves immortality, a bond to nature, and the duty never to touch the arcane again.",
			"Its power was expended at the Battle of Mount Hyjal to destroy Archimonde. The tree was not killed outright, but what made it a World Tree was burned out of it.",
			"Everything that has happened to the night elves since follows from that moment: their mortality, Fandral Staghelm's push to plant Teldrassil without the Aspects' blessing, and the sickness in that second tree.",
		},
		readMore = { "Wowpedia: Nordrassil", "Wowpedia: Well of Eternity" },
	},
	{
		name = "Summit of Eternity", parent = "Mount Hyjal", faction = "Neutral",
		era = "forever", spoiler = true,
		hook = "The peak itself, where the Well's remnant was hidden and Nordrassil planted over it.",
		lore = {
			"After the Sundering the dragon Aspects hid what was left of the Well of Eternity at Hyjal's summit, and planted Nordrassil over it. The word in the name is the Well's own: the Well of Eternity was the font of arcane power that drew Sargeras's attention and broke the world apart.",
			"That makes this the most closely guarded ground in Kalimdor, and it has been for ten thousand years. It is also where Archimonde was destroyed at the end of the Third War, at the tree's roots.",
			"Almost everything that matters about this mountain happened inside a few hundred yards of here.",
		},
		readMore = { "Wowpedia: Well of Eternity", "Wowpedia: Nordrassil" },
	},
	{
		name = "Malorne's Retreat", parent = "Mount Hyjal", faction = "Neutral",
		era = "forever", spoiler = true,
		hook = "Named for the white stag who fathered Cenarius and died fighting the Legion.",
		lore = {
			"Malorne was an Ancient, a great white stag, and the one the other Ancients deferred to. His son by Elune was Cenarius, the demigod who taught Malfurion Stormrage what druidism is and who led the Ancients when the Legion first came.",
			"Malorne died in that war, and the accounts have him facing Archimonde when he fell. Ten thousand years later Archimonde came to this mountain himself and was destroyed on it.",
			"So Hyjal holds both halves of one argument. Malorne lost to Archimonde in the first war against the Legion; Archimonde lost here in the second.",
		},
		readMore = { "Wowpedia: Malorne", "Wowpedia: Cenarius", "Wowpedia: Archimonde" },
	},
	{
		name = "Shrine of Aviana", parent = "Mount Hyjal", faction = "Neutral",
		era = "forever", spoiler = true,
		hook = "A shrine to the Ancient who was patron of all birds, killed in the War of the Ancients.",
		lore = {
			"Aviana was one of the Ancients, the demigods of Kalimdor who fought beside Cenarius against the Burning Legion ten thousand years ago. She was the patron of birds.",
			"She did not survive it. The Ancients took appalling losses in that war: Aviana died, Malorne died, Agamaggan died, and Cenarius himself would be killed on this mountain's slopes in the Third War.",
			"A shrine here is the druids keeping the account. Both of the night elves' great wars against the Legion came to a head on Hyjal, and the Ancients paid for each of them.",
		},
		readMore = { "Wowpedia: Aviana", "Wowpedia: Ancients", "Wowpedia: War of the Ancients" },
	},
	{
		name = "Felblood Scar", parent = "Mount Hyjal", faction = "Hostile",
		era = "forever", spoiler = true,
		hook = "Ground the Legion fouled on its way up the mountain, never cleaned since.",
		lore = {
			"When the Burning Legion marched on Hyjal at the end of the Third War it came up these slopes. Archimonde was destroyed at the summit; the army he brought with him was not.",
			"Darkwhisper Gorge on the Winterspring side is the best-known pocket of what was left behind. This is another. Fel corruption does not lift on its own and the druids have had other priorities.",
			"The battle is remembered as a clean victory. The ground says otherwise.",
		},
	},
	{
		name = "Tainted Foothills", parent = "Mount Hyjal", faction = "Hostile",
		era = "forever", spoiler = true,
		hook = "The lower slopes, where the forest never came back.",
		lore = {
			"Hyjal's foothills took the Legion's march twice: once as the army climbed, and again as what survived scattered back down.",
			"Ashenvale and Winterspring recovered, slowly and in patches. The ground immediately under the mountain did not.",
			"Night elf policy on Hyjal has been to seal the mountain rather than clear it. That keeps people away from the corrupted ground. It also leaves the corrupted ground exactly where it is.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- RIVERGLADES
-- ---------------------------------------------------------------------------

Zone{
	name = "Riverglades", continent = "Eastern Kingdoms", faction = "Contested", levels = "35-45",
	era = "forever", spoiler = true,
	hook = "A river country walled in by Redridge, the Burning Steppes and the Badlands, and reachable until now only by sea.",
	lore = {
		"Riverglades sits in a gap in the middle of the Eastern Kingdoms, bordered by Redridge Mountains, the Burning Steppes, the Swamp of Sorrows and the Badlands. On old maps it is a blank: the passes in are blocked and the only practical route is the Steamwheedle Cartel's ship run from Tanaris into Powderfuse Port.",
		"Its neighbours tell you most of what to expect. Blackrock orcs and the Dark Horde press down from the Steppes. The Badlands side is Dark Iron and black dragonflight country. The Swamp of Sorrows brings the Atal'ai and whatever else the marsh produces. Redridge is Stormwind's failing eastern frontier.",
		"Three interests are visible on the ground. The Powderfuse goblins run the port and the extraction business, with the usual cartel indifference to consequences. The Twilight's Hammer are here. In the Eastern Kingdoms that almost always means something is buried. And the Brotherhood of the Horse, a Stormwind knightly order, has a presence, a notable thing to find in a region the kingdom has never administered.",
	},
	didYouKnow = "The Twilight's Hammer turn up wherever the Old Gods' prisons come close to the surface: the Master's Glaive in Darkshore, Blackfathom Deeps, the hives in Silithus. Their interest in a place is usually the most informative thing about it.",
	readMore = { "Wowpedia: Twilight's Hammer", "Wowpedia: Steamwheedle Cartel" },
}

SubsOf("Riverglades", {
	{
		name = "Powderfuse Port", parent = "Riverglades", faction = "Neutral",
		era = "forever", spoiler = true,
		hook = "The goblin port that is the only practical way into Riverglades.",
		lore = {
			"Powderfuse Port is the Steamwheedle Cartel's landing in Riverglades, served by ship from Tanaris. With the land passes blocked, the goblins own the front door to an entire region.",
			"This is the cartel's standard play. Ratchet, Booty Bay, Gadgetzan and Everlook all work the same way: find the chokepoint, build a neutral town on it, sell to both factions and forbid fighting on the premises.",
			"The 'Powderfuse' name suggests the goblin approach to geology: explosives first.",
		},
	},
	{
		name = "Bristle Hills", parent = "Riverglades", faction = "Hostile",
		era = "forever", spoiler = true,
		hook = "Quilboar hills, in a region already crowded with claimants.",
		lore = {
			"\"Bristle\" in this part of the world means quilboar. The Bristleback are the best known of their tribes, holding Razorfen Kraul and Razorfen Downs and fighting the tauren across the Barrens for as long as either side has counted.",
			"Quilboar trace themselves to Agamaggan, the Ancient called the Boar God, who died fighting the Burning Legion in the War of the Ancients. Thorns grew where his blood fell, and the quilboar hold those thornbrakes sacred.",
			"Riverglades is already pressed by the Dark Horde out of Blackrock Mountain and by ogres left behind when the Second War collapsed. Quilboar in the hills is one more claim on the same ground.",
		},
		readMore = { "Wowpedia: Quilboar", "Wowpedia: Agamaggan", "Wowpedia: Bristleback tribe" },
	},
	{
		name = "The Forbidding Sea", parent = "Riverglades", faction = "Neutral",
		era = "forever", spoiler = true,
		hook = "Open ocean off the Eastern Kingdoms, and the only open door into Riverglades.",
		lore = {
			"The Forbidding Sea is one of the oceans named on Azeroth's charts, lying off the Eastern Kingdoms' coast. For a region with its land passes blocked it is not scenery; it is the way in, which is why the goblins built Powderfuse Port and why a ship from Tanaris matters.",
			"Azeroth's water belongs in large part to the naga. They are the Highborne who went under with the Sundering and did not die: Queen Azshara and her court were dragged to the bottom and changed into something that has served her for ten thousand years since.",
			"So the sea is the open flank. It is open in both directions.",
		},
		readMore = { "Wowpedia: Forbidding Sea", "Wowpedia: Naga", "Wowpedia: Azshara" },
	},
	{
		name = "Sunnyglade", parent = "Riverglades", faction = "Hostile",
		era = "forever", spoiler = true,
		hook = "A Stormwind town the Old Horde sacked in the First War, and never rebuilt.",
		lore = {
			"The Riverglades were Stormwind's, and Sunnyglade was one of its towns. The Old Horde attacked it during the First War and took the survivors away as slaves.",
			"One detail of that attack says a great deal about the early Horde: they left one of the town's mage towers standing on purpose, to work out how human magic functioned. The tower is still there.",
			"Warcraft I had Sunnyglade rebuilt after Stormwind's forces freed the captives. The account here is harsher: the rescued never got home, and founded new towns instead. Sunnyglade stayed a ruin, and the Twilight's Hammer hold it now.",
		},
		readMore = { "Wowpedia: Sunnyglade", "Wowpedia: First War", "Wowpedia: Twilight's Hammer" },
	},
	{
		name = "Windstead", parent = "Riverglades", faction = "Alliance",
		era = "forever", spoiler = true,
		hook = "Founded by the handful of families who got out of Sunnyglade and kept running.",
		lore = {
			"When the Old Horde took Sunnyglade, a few families escaped north-east and built here, beside a lake shut in by mountains. Hidden was the point.",
			"It worked for a long time. It stopped working during the Second War, once Twilight's Hammer skirmishing reached the area and made it plain the cult meant to hold the whole region. The villagers left for Farholde in the south, some along the coast and some by road.",
			"The ones who took the road did not arrive. That is the sort of detail the Riverglades keeps.",
		},
		readMore = { "Wowpedia: Windstead", "Wowpedia: First War" },
	},
	{
		name = "Meadowsbrook", parent = "Riverglades", faction = "Alliance",
		era = "forever", spoiler = true,
		hook = "Built by the knights who freed Sunnyglade's captives and then could not get them home.",
		lore = {
			"A detachment of Stormwind knights did reach Sunnyglade's prisoners and get them out. The Horde then cut the road behind them, which left a column of freed slaves and their rescuers inside hostile country with nowhere to go.",
			"Meadowsbrook is what they built instead of going home, and Farholde followed. The Riverglades fell to the Horde regardless, and Stormwind wrote the region off to concentrate on the war nearer the capital.",
			"So the people here were abandoned by their own kingdom twice over: once when the road closed, and again when Stormwind decided the land was not worth the men.",
		},
		readMore = { "Wowpedia: Meadowsbrook", "Wowpedia: First War" },
	},
	{
		name = "Farholde Keep", parent = "Riverglades", faction = "Alliance",
		era = "forever", spoiler = true,
		hook = "A fortified island in the south, and the Brotherhood of the Horse's last hold on the region.",
		lore = {
			"Farholde was raised on a coastal island by the survivors of Sunnyglade and the knights who freed them. An island was the only ground they could be sure of.",
			"Near the end of the Second War it was besieged. Twilight's Hammer ogres and Stormreaver orcs had come to the Riverglades fleeing the Tomb of Sargeras, the ogre mound already here took them in, and the Brotherhood of the Horse was pushed back onto Farholde. Horde raiders got around by water and crippled the ships, which left the keep unable to leave or send for help.",
			"The siege broke because the Brotherhood killed the Horde's commanders in the night and the orcs outside never got their orders. They have been trying to take the rest of the region back ever since.",
		},
		readMore = { "Wowpedia: Farholde Keep", "Wowpedia: Brotherhood of the Horse", "Wowpedia: Stormreaver clan" },
	},
	{
		name = "Twilight's Shroud", parent = "Riverglades", faction = "Hostile",
		era = "forever", spoiler = true,
		hook = "The Twilight's Hammer's hold in the west of the region.",
		lore = {
			"The Twilight's Hammer were a Horde clan in the Second War, led by Cho'gall, and what they became afterwards is worse than what they were. The clan went looking for the Old Gods and found something willing to answer.",
			"Their presence in the Riverglades dates to the end of that war: survivors of the Tomb of Sargeras came here with Stormreaver orcs, and there were whispers that Cho'gall himself had come to recover after Gul'dan's death. Only whispers.",
			"A cult that worships the end of the world does not hold ground for ordinary reasons. Whatever the Hammer wants out of this region, it is not the farmland.",
		},
		readMore = { "Wowpedia: Twilight's Hammer", "Wowpedia: Cho'gall", "Wowpedia: Tomb of Sargeras" },
	},
	{
		name = "Bolder'ok", parent = "Riverglades", faction = "Horde",
		era = "forever", spoiler = true,
		hook = "An ogre settlement in the north that walked away from the Twilight's Hammer.",
		lore = {
			"Ogres in the Eastern Kingdoms are the Old Horde's leavings. Gul'dan brought them through during the Second War and the collapse left them here with no masters and no way home.",
			"The mound in the Riverglades took in Twilight's Hammer ogres fleeing the Tomb of Sargeras, and for years that was the arrangement. The Bolder'ok ogres have since left the cult and thrown in with the Horde instead.",
			"Which is a straightforward piece of ogre politics: the cult wanted an apocalypse and the Horde wants soldiers. One of those offers is survivable.",
		},
		readMore = { "Wowpedia: Bolder'ok", "Wowpedia: Ogre", "Wowpedia: Twilight's Hammer" },
	},
	{
		name = "Rog'mar", parent = "Riverglades", faction = "Horde",
		era = "forever", spoiler = true,
		hook = "The Horde's own town in the Riverglades, and one of its two flight hubs.",
		lore = {
			"Rog'mar is the Horde's settlement here, and it carries flight paths, which in this region means it is a place somebody intends to keep.",
			"The orcs who have been in the Riverglades longest are not Thrall's. They are what the Second War left: Stormreaver remnants, Twilight's Hammer allies, and whoever retreated to Krol'dok Stronghold when the Siege of Farholde failed.",
			"A town of the modern Horde standing in that company is a complicated thing, and the ogres of Bolder'ok changing sides is part of the same shift.",
		},
		readMore = { "Wowpedia: Rog'mar" },
	},
})

Instance{
	name = "Krol'dok Stronghold", continent = "Eastern Kingdoms", faction = "Hostile", levels = "40-45",
	era = "forever", spoiler = true,
	hook = "A stronghold in Riverglades, in a region hemmed in by orcs, ogres and the Dark Iron.",
	lore = {
		"Krol'dok Stronghold is the five-player dungeon in Riverglades. The name is orcish in form, fitting for a region pressed on one side by the Blackrock clan and the Dark Horde out of Blackrock Mountain.",
		"The Dark Horde are the orcs who never accepted the Second War's end: Rend Blackhand's followers, operating out of Blackrock Spire and still calling themselves the true Horde. They are not Thrall's Horde and both factions treat them as hostile.",
		"Ogres in the Eastern Kingdoms are the Old Horde's leavings, brought over by Gul'dan during the Second War and abandoned when it collapsed. Between the two, the region's stonework tends to end up in somebody's hands who did not build it.",
	},
	readMore = { "Wowpedia: Dark Horde", "Wowpedia: Blackrock clan" },
}

-- ---------------------------------------------------------------------------
-- SHEN'DRALAS
-- ---------------------------------------------------------------------------

Zone{
	name = "Shen'dralas", continent = "Kalimdor", faction = "Contested",
	era = "forever", spoiler = true,
	hook = "Night elf country south of Desolace, named for the sect that locked itself in with its library.",
	lore = {
		"Shen'dralas lies south-east of Desolace, past the Valley of Bones, in the gap between Feralas and Mulgore. It is centaur country on the approaches: the Magram and Gelkis clans hold the Desolace side, and their war with each other is older than any human kingdom.",
		"The name is the interesting part. The Shen'dralar were a sect of Highborne night elves, the arcane scholars of Queen Azshara's era, who refused to give up magic when the night elves outlawed it after the Sundering. They sealed themselves inside their city of Eldre'Thalas with their library rather than submit. They are still in there: Dire Maul, in Feralas, with the Gordok ogres holding the city around them.",
		"So a place carrying that name points back to the oldest unresolved argument in night elf history. The Highborne's pursuit of the arcane is what let Azshara reach Sargeras. That brought on the War of the Ancients, and the War of the Ancients brought the Sundering that broke this continent into the shape you walk on now. Darnassus has spent ten thousand years not talking about the ones who never repented.",
	},
	didYouKnow = "Darnassus' official position is that arcane magic is forbidden and the Highborne are gone. The Shen'dralar in Dire Maul have been quietly trading access to their pre-Sundering library to anyone who proves useful. The position rather undercuts itself.",
	readMore = { "Wowpedia: Shen'dralar", "Wowpedia: Eldre'Thalas", "Wowpedia: Highborne", "Wowpedia: Great Sundering" },
}

SubsOf("Shen'dralas", {
	{
		name = "Magram Front", parent = "Shen'dralas", faction = "Hostile",
		era = "forever", spoiler = true,
		hook = "Where the Magram centaur press on night elf ground from the Desolace side.",
		lore = {
			"The Magram are one of the centaur clans of Desolace, and the Gelkis are the other one that counts. Their war with each other is older than any human kingdom and neither clan has ever come close to ending it.",
			"Centaur origins are a grievance in two directions. Zaetar, Cenarius's son, fathered the first of them on Theradras, a princess of the earth elementals, and they killed him for it. The tauren have been driven around Kalimdor by centaur raiders ever since, which is a large part of why Thrall found them in the state he did.",
			"A front named for the Magram means that war has grown a new edge, and that this edge points at night elf country rather than at the Gelkis.",
		},
		readMore = { "Wowpedia: Magram", "Wowpedia: Centaur", "Wowpedia: Zaetar" },
	},
	{
		name = "Bristleback Retreat", parent = "Shen'dralas", faction = "Hostile",
		era = "forever", spoiler = true,
		hook = "A quilboar holding, named for the tribe that has fought the tauren the longest.",
		lore = {
			"The Bristleback are the quilboar tribe whose name the Barrens knows best. Razorfen Kraul and Razorfen Downs are theirs, and they were fighting the tauren over that country long before Thrall's Horde landed on this continent.",
			"Quilboar descend from Agamaggan, the Ancient called the Boar God, killed fighting the Legion in the War of the Ancients. Where his blood fell thorns grew, and those thornbrakes are sacred ground to his children.",
			"Which puts two Ancients' legacies against each other here: Agamaggan's children camped on country named for the night elves' own oldest schism.",
		},
		readMore = { "Wowpedia: Bristleback tribe", "Wowpedia: Agamaggan" },
	},
	{
		name = "Evenshade's Overlook", parent = "Shen'dralas", faction = "Neutral",
		era = "forever", spoiler = true,
		hook = "A Highborne vantage over country that three peoples claim.",
		lore = {
			"Shen'dralas is Highborne ground, and the Shen'dralar are the Highborne who never repented. When the night elves outlawed arcane magic after the Sundering, that sect refused and sealed itself into Eldre'Thalas with its library rather than give it up.",
			"What they are doing with a hold out here rather than inside Dire Maul is the interesting question. Darnassus's official position is that the Highborne are finished and the arcane is forbidden.",
			"The view from an overlook in this zone takes in Magram centaur on one side and Bristleback quilboar on the other. Whoever watches from here has plenty to watch.",
		},
		readMore = { "Wowpedia: Shen'dralar", "Wowpedia: Highborne", "Wowpedia: Eldre'Thalas" },
	},
	{
		name = "Outcast Hideaway", parent = "Shen'dralas", faction = "Neutral",
		era = "forever", spoiler = true,
		hook = "Shelter for the sort of people a night elf society produces and then disowns.",
		lore = {
			"\"Outcast\" in night elf terms is a precise accusation. After the Sundering the survivors banned the arcane outright, and the Highborne who would not stop practising were exiled rather than argued with.",
			"Ten thousand years of that policy has made a quantity of outcasts: the Shen'dralar sealed in Eldre'Thalas, the satyrs who took Sargeras's bargain, and the plainly unwelcome in between.",
			"A hideaway in a zone named for the unrepentant sect is where you would expect them to end up.",
		},
		readMore = { "Wowpedia: Shen'dralar", "Wowpedia: Highborne" },
	},
})

-- ---------------------------------------------------------------------------
-- ZEPHRAS ISLE
-- ---------------------------------------------------------------------------

Zone{
	name = "Zephras Isle", continent = "Elemental Plane", faction = "Neutral", levels = "1-12",
	era = "forever", spoiler = true,
	hook = "A failing island in the elemental skies, home of the Skyborne, whose elementals left.",
	lore = {
		"Zephras Isle is not on Azeroth. It is a flying island held in Skywall, and it is the Skyborne's homeland and their starting ground.",
		"Skywall is the Elemental Plane of Air, ruled by Al'Akir the Windlord. Al'Akir is one of the four Elemental Lords, with Ragnaros the Firelord, Therazane the Stonemother and Neptulon the Tidehunter. Before the titans came the four of them ruled this world on the Old Gods' behalf, and the titans' campaign against them ended with each Lord banished into a plane of their own.",
		"The air elementals who shared the island with the Skyborne vanished some years ago, and the magic holding it up has been fading since. Zephras is not the only Skyborne island: Anvilas and Siroccas are out there too, and contact with them was lost when the elementals went. Those islands are coming apart, their people are arriving here as refugees, and this one is beginning to go the same way.",
		"High Elder Talaanis Shadowsong leads them now. Before her the isle answered to the Shal'nan.",
	},
	didYouKnow = "Elementals on Azeroth are refugees and invaders from four planes, not natives. Every elemental incursion in the world, the Abyssal Sands in Tanaris, the Charred Vale, Firewatch Ridge, is a place where one of those planes presses close enough to come through. Zephras is the reverse case: mortals living inside the plane itself.",
	readMore = { "Wowpedia: Zephras Isle", "Wowpedia: Skywall", "Wowpedia: Al'Akir", "Wowpedia: Elemental Lords" },
}

SubsOf("Zephras Isle", {
	{
		name = "Skywall", parent = "Zephras Isle", faction = "Neutral",
		era = "forever", spoiler = true,
		hook = "The Elemental Plane of Air itself, and the prison of the Lord who rules it.",
		lore = {
			"Skywall is one of the four Elemental Planes and the domain of air. Al'Akir the Windlord rules it, and he is also confined to it: the titans banished each of the four Elemental Lords into a plane of their own at the end of their campaign against the Old Gods' servants.",
			"Zephras Isle hangs inside it. Living here means living in a Lord's prison, among wind spirits who answer to him, to themselves, or to nothing at all.",
			"One Elemental Lord has been let out since. A Dark Iron emperor summoned Ragnaros, and the Firelord is now at the bottom of Blackrock Mountain with a city built around him. That is the precedent for deciding a bound Lord would be useful.",
		},
		readMore = { "Wowpedia: Skywall", "Wowpedia: Al'Akir", "Wowpedia: Elemental Lords" },
	},
	{
		name = "Sanctum of Storms", parent = "Zephras Isle", faction = "Neutral",
		era = "forever", spoiler = true,
		hook = "A hall given to the storm, on a plane where the storm has an owner.",
		lore = {
			"Al'Akir is not weather. He is a bound Elemental Lord with a will of his own, and anything raised on Zephras Isle in the storm's honour is raised in his sight.",
			"Before the titans came, the four Elemental Lords ruled this world on the Old Gods' behalf. Reverence for an element in a place like this is never only reverence for the element.",
			"The Skyborne groups the isle names, the Windshapers, the High Order and the Al'Aketh, are the ones a hall like this belongs to. What they ask of the air, and whose voice answers, is the question the zone is built on.",
		},
		readMore = { "Wowpedia: Al'Akir", "Wowpedia: Elemental Lords" },
	},
	{
		name = "Rise of Spirits", parent = "Zephras Isle", faction = "Neutral",
		era = "forever", spoiler = true,
		hook = "High ground left to the wind spirits, whose loyalties are their own.",
		lore = {
			"Skywall's elementals are not one army. They run from the small and mindless to the old and deliberate, and the ones with minds have politics that do not necessarily pass through Al'Akir at all.",
			"For people living on a floating island in their plane that distinction is practical. Standing with the local spirits is a different account from standing with the Windlord.",
			"On Azeroth the elementals are the intruders, pressing through from four planes into a world that is not theirs. Here it runs the other way: the mortals are the newcomers.",
		},
		readMore = { "Wowpedia: Elemental", "Wowpedia: Skywall" },
	},
	{
		name = "Shrine of Akir", parent = "Zephras Isle", faction = "Neutral",
		era = "forever", spoiler = true,
		hook = "A shrine whose name sits one syllable off the Windlord's.",
		lore = {
			"Al'Akir is the Windlord, and \"Al'\" is the honorific the elemental tongues put in front of a Lord's name. The isle's own factions use the same shape: the Al'Aketh are built the same way.",
			"A shrine called Akir may be reaching for the Lord himself, or for whatever older thing his name was assembled from. The resemblance is as far as the name can be read without guessing, and either reading points at the ruler of the plane.",
			"He is a prisoner in it. Worship in Skywall is not a straightforward act.",
		},
		readMore = { "Wowpedia: Al'Akir" },
	},
	{
		name = "Thendal Village", parent = "Zephras Isle", faction = "Neutral",
		era = "forever", spoiler = true,
		hook = "The village in the north-west where every Skyborne begins.",
		lore = {
			"Thendal Village is where Skyborne characters start. It sits in the island's north-west, and a grove, a cave and a ring of standing stones carry the same name around it.",
			"It is an ordinary place in an extraordinary position: a village on a flying island inside the Elemental Plane of Air, kept up by magic that is now failing. The elementals who used to share the island left years ago and took the arrangement with them.",
			"Starting zones are usually quiet by design. This one is quiet because something has gone and has not come back.",
		},
		readMore = { "Wowpedia: Thendal Village", "Wowpedia: Zephras Isle" },
	},
	{
		name = "Valanaar", parent = "Zephras Isle", faction = "Neutral",
		era = "forever", spoiler = true,
		hook = "The isle's one real settlement, at the southern end.",
		lore = {
			"Valanaar is the major settlement on Zephras Isle, and the only one that reads as a town rather than a village. Everything leaving the island leaves from its skydocks.",
			"It is also where the refugees are arriving. Anvilas and Siroccas are the other Skyborne islands, and both have been breaking up since contact was lost, so their people have been coming here.",
			"High Elder Talaanis Shadowsong leads the Skyborne, and before her the isle answered to the Shal'nan.",
		},
		readMore = { "Wowpedia: Valanaar", "Wowpedia: Zephras Isle" },
	},
	{
		name = "Valanaar Skydocks", parent = "Zephras Isle", faction = "Neutral",
		era = "forever", spoiler = true,
		hook = "Two airship berths at the island's southern tip, and the only way off it.",
		lore = {
			"The skydocks sit at the southern tip of Zephras Isle, and there are two of them. The eastern berth runs to Dalaran in the Alterac Mountains; the western runs to the Skywatcher Plateau in north-western Mulgore.",
			"Which berth a Skyborne takes decides a great deal, since one lands in Alliance country and the other in Horde country. The airships run both ways, so the isle can be returned to.",
			"A people whose island is coming apart under them, with two gangways off it and a choice at the end of each. That is the position the zone puts you in.",
		},
		readMore = { "Wowpedia: Valanaar Skydocks", "Wowpedia: Zephras Isle" },
	},
})

-- ---------------------------------------------------------------------------
-- THE NEW DUNGEONS
--
-- Nine five-player dungeons. Names, level ranges and entrances come from
-- community guides quoting Blizzard's announcements, not from anything I could
-- verify directly, so each is registered with aliases covering the spellings
-- the sources disagree about. If one of these never fires in game, /ftn where
-- inside it prints what the client actually calls the place.
--
-- Written as background only, like the rest of this file: what the place is
-- and the older history it sits on. No bosses, no tactics, no plot.
-- ---------------------------------------------------------------------------

Instance{
	name = "Hall of Thanes", continent = "Eastern Kingdoms", faction = "Alliance", levels = "13-18",
	era = "forever", spoiler = true,
	aliases = { "The Hall of Thanes" },
	hook = "The tomb of Ironforge's kings, down in Old Ironforge beneath the High Seat.",
	lore = {
		"Old Ironforge is the original dwarven city, and it lies directly under the one you walk through. Modern Ironforge was built on top of it. The way in is off the High Seat, which is where Magni Bronzebeard holds court, so the kings of the dwarves have been sitting above their own predecessors' tombs this whole time.",
		"The Anvilmar name on the dungeon's occupants is the important one. Modimus Anvilmar was High King when the dwarves were still one people under one throne. His death left no settled succession, and the Bronzebeards, the Wildhammers and the Dark Irons went to war over it.",
		"That war is the hinge every other dwarven grievance turns on. Bronzebeards kept Ironforge. Wildhammers went north and founded Aerie Peak. Dark Irons went south, lost again, and bound themselves to Ragnaros, which is why there is a Searing Gorge and a Blackrock Depths at all.",
	},
	didYouKnow = "Old Ironforge has been sealed for most of recorded dwarven history. That a dungeon's worth of it opens under the High Seat means Magni has been holding court on top of something the Bronzebeards chose not to discuss.",
	readMore = { "Wowpedia: Old Ironforge", "Wowpedia: War of the Three Hammers", "Wowpedia: Modimus Anvilmar" },
}

Instance{
	name = "Ruins of Lordaeron", continent = "Eastern Kingdoms", faction = "Horde", levels = "15-20",
	era = "forever", spoiler = true,
	hook = "Capital City above the Undercity, where Arthas killed his father on the throne.",
	lore = {
		"This was the greatest human city in the world. Lordaeron's king, Terenas Menethil, ruled from here, and the Alliance of Lordaeron that won the Second War was put together inside these walls.",
		"His son Arthas took up Frostmourne in Northrend and came home a death knight. He killed Terenas on the throne in the room above, and the kingdom died with him. Sylvanas Windrunner's Forsaken later dug their capital out of the crypts and sewers underneath, which is how a dead nation's heirs ended up living in its basement.",
		"The Scourge never fully left. Holding the ruin matters to the Forsaken for reasons beyond defence: it is the one piece of Lordaeron they can still point at.",
	},
	readMore = { "Wowpedia: Ruins of Lordaeron", "Wowpedia: Arthas Menethil", "Wowpedia: Undercity" },
}

Instance{
	name = "Excavation Site", continent = "Eastern Kingdoms", faction = "Contested", levels = "24-29",
	era = "forever", spoiler = true,
	aliases = { "Excavation Site: Wetlands", "The Excavation Site" },
	hook = "An Explorers' League dig in the Wetlands that has broken into something titan-built.",
	lore = {
		"The Explorers' League has been digging across Khaz Modan since Uldaman, and Whelgar's excavation in the Wetlands is one of its sites. The dwarves came for the enormous bones in the marsh and kept going.",
		"What they are finding now is construction rather than fossils. After Uldaman, Ironforge knows what titan work looks like: the Discs of Norgannon recorded that the earthen, the dwarves' own ancestors, were shaped from living stone. Every find like this one is read in Ironforge as more of that record.",
		"Thelgen Rock and Dun Algaz are both close by, and the marsh has a habit of swallowing anything dug into it. The League keeps digging anyway.",
	},
	readMore = { "Wowpedia: Whelgar's Excavation Site", "Wowpedia: Uldaman", "Wowpedia: Explorers' League" },
}

Instance{
	name = "City of Dalaran", continent = "Eastern Kingdoms", faction = "Contested", levels = "28-33",
	era = "forever", spoiler = true,
	aliases = { "Dalaran", "The City of Dalaran" },
	hook = "Inside the Kirin Tor's ruined city, under the dome that has hidden it since the Third War.",
	lore = {
		"Dalaran was the magocracy, and the Violet Citadel at its centre was the finest school of arcane learning in the world. Medivh, Khadgar, Jaina Proudmoore, Antonidas and Kel'Thuzad all studied here.",
		"Archimonde destroyed it during the Legion's invasion. The mages threw everything they had into a shield and the demon broke it and crushed the city underneath. What has been visible from the Alterac Mountains ever since is a crater under a magical dome, patrolled by surviving Kirin Tor who keep people out.",
		"Kel'Thuzad is the name that hangs over the place. He was a Kirin Tor archmage until Dalaran expelled him for studying necromancy, and he went north, found the Lich King, and came back with the plague that killed Lordaeron. The order that threw him out paid for it as much as anyone.",
	},
	didYouKnow = "Getting in needs an attunement, and the Alliance and Horde start it from opposite ends of the Hillsbrad war: Southshore for one, Tarren Mill for the other.",
	readMore = { "Wowpedia: Dalaran", "Wowpedia: Kirin Tor", "Wowpedia: Archimonde" },
}

Instance{
	name = "The Drowned City", continent = "Eastern Kingdoms", faction = "Contested", levels = "35-40",
	era = "forever", spoiler = true,
	aliases = { "Drowned City" },
	hook = "A troll city under the water off Stranglethorn, with naga in it.",
	lore = {
		"Stranglethorn was the heart of the Gurubashi Empire, and the empire did not stop at the shoreline. A good deal of Gurubashi stonework is underwater along this coast, because the coast moved: the Sundering broke Kalimdor apart and raised the sea over ground that had been dry.",
		"The Gurubashi came apart from the inside. Their own priests summoned Hakkar the Soulflayer and the empire had to fight a war to contain him, and nothing has been built in the vale since.",
		"The naga are the other half of it. They were night elves once, highborne of Queen Azshara's court, changed when the Well of Eternity collapsed and Zin-Azshari went under. Ten thousand years later they are coming back up all along this world's coasts, and a sunken city suits them.",
	},
	readMore = { "Wowpedia: Gurubashi Empire", "Wowpedia: Naga", "Wowpedia: Great Sundering" },
}

Instance{
	name = "Alcaz Prison", continent = "Kalimdor", faction = "Contested", levels = "48-53",
	era = "forever", spoiler = true,
	aliases = { "Alcaz Island" },
	hook = "The island prison off Dustwallow, where the Defias held Stormwind's nobles for ransom.",
	lore = {
		"Alcaz Island sits off Dustwallow Marsh's eastern shore, within sight of Theramore and impossible to get onto. The Defias Brotherhood used it to hold kidnapped Stormwind nobility while the ransoms were negotiated, which is a long way from Westfall for a gang of stonemasons.",
		"The Brotherhood were never only bandits. They were the guild that rebuilt Stormwind after the First War and were refused payment for it, and they kept the organisation, the engineers and the reach that came with the work.",
		"Naga hold the water around the island now. Both the Horde and the Alliance have noticed that something is being kept there and neither has managed to get onto it in force.",
	},
	readMore = { "Wowpedia: Alcaz Island", "Wowpedia: Defias Brotherhood" },
}

Instance{
	name = "Blackmaw Hold", continent = "Kalimdor", faction = "Contested", levels = "55-60",
	era = "forever", spoiler = true,
	hook = "A furbolg city in Azshara, behind a gate that has been sealed a very long time.",
	lore = {
		"Furbolgs were the night elves' oldest neighbours and, for most of ten thousand years, their allies. They are not a monster population and the night elves have never treated them as one.",
		"Something has been going wrong with them. The Gnarlpine on Teldrassil, the Deadwood and Felpaw in Felwood, the Thistlefur in Ashenvale and the Winterfall in Winterspring have all turned, and the Timbermaw are the one large tribe that has held out. A sealed furbolg city in Azshara is the kind of place that would know why.",
		"Azshara is the right ground for it. This was Queen Azshara's own country before the Sundering, her palace stood here, and the region is the largest unsurveyed ruin field on the continent.",
	},
	readMore = { "Wowpedia: Furbolg", "Wowpedia: Timbermaw Hold", "Wowpedia: Azshara" },
}

Instance{
	name = "Shaper's Terrace", continent = "Kalimdor", faction = "Contested", levels = "58-60",
	era = "forever", spoiler = true,
	aliases = { "The Shaper's Terrace", "Shapers Terrace" },
	hook = "Structures in Un'Goro's northern hills, of a piece with the crater's unexplained machinery.",
	lore = {
		"Un'Goro is walled the whole way round, holds a jungle in the middle of a desert belt, has a live volcano at its centre and three crystal pylons standing on its rim that nobody has ever attributed to a builder. The expedition at Marshal's Refuge has catalogued all of that and explained none of it.",
		"The pylons react to crystals found across the crater floor and produce something when fed. That is the limit of what anyone has established about them, and a terrace of built structures in the northern hills belongs to the same set of questions.",
		"The dwarves have an obvious theory, because the Explorers' League has one theory about everything: titan work, as at Uldaman and behind the sealed Gates of Uldum in Tanaris. It is a theory. Nothing in the crater has confirmed it.",
	},
	readMore = { "Wowpedia: Un'Goro Crater", "Wowpedia: Uldaman" },
}
