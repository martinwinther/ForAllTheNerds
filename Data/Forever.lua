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
-- Subzone names beyond the ones below are not yet reliably documented, so this
-- file stays deliberately thin rather than guessing at spellings that would
-- never match GetSubZoneText(). Add them with ns.SubsOf as you find them --
-- the README's "Adding places" section explains how.
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
})

Instance{
	name = "Krol'dok Stronghold", continent = "Eastern Kingdoms", faction = "Hostile", levels = "35-45",
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
		"Shen'dralas lies south of Desolace, past the Valley of Bones, in the gap between Desolace and Mulgore. It is centaur country on the approaches: the Magram and Gelkis clans hold the Desolace side, and their war with each other is older than any human kingdom.",
		"The name is the interesting part. The Shen'dralar were a sect of Highborne night elves, the arcane scholars of Queen Azshara's era, who refused to give up magic when the night elves outlawed it after the Sundering. They sealed themselves inside their city of Eldre'Thalas with their library rather than submit. They are still in there: Dire Maul, in Feralas, with the Gordok ogres holding the city around them.",
		"So a place carrying that name points back to the oldest unresolved argument in night elf history. The Highborne's pursuit of the arcane is what let Azshara reach Sargeras. That brought on the War of the Ancients, and the War of the Ancients brought the Sundering that broke this continent into the shape you walk on now. Darnassus has spent ten thousand years not talking about the ones who never repented.",
	},
	didYouKnow = "Darnassus' official position is that arcane magic is forbidden and the Highborne are gone. The Shen'dralar in Dire Maul have been quietly trading access to their pre-Sundering library to anyone who proves useful. The position rather undercuts itself.",
	readMore = { "Wowpedia: Shen'dralar", "Wowpedia: Eldre'Thalas", "Wowpedia: Highborne", "Wowpedia: Great Sundering" },
}

-- ---------------------------------------------------------------------------
-- ZEPHRAS ISLE
-- ---------------------------------------------------------------------------

Zone{
	name = "Zephras Isle", continent = "Elemental Plane", faction = "Neutral", levels = "1-12",
	era = "forever", spoiler = true,
	hook = "An island anchored in the elemental skies, home of the Skyborne and sheltered by the wind spirits of Skywall.",
	lore = {
		"Zephras Isle is not on Azeroth. It is a floating island held in the elemental skies, and the Skyborne's homeland.",
		"Skywall is the Elemental Plane of Air, ruled by Al'Akir the Windlord. Al'Akir is one of the four Elemental Lords, with Ragnaros the Firelord, Therazane the Stonemother and Neptulon the Tidehunter. Before the titans came, the four of them ruled this world on the Old Gods' behalf, and the titans' campaign against them ended with each Lord banished into his or her own plane.",
		"That is the backdrop to anything living in Skywall: a plane with an imprisoned Elemental Lord in it, full of wind spirits whose loyalties are their own. The one Elemental Lord anybody has let back out is Ragnaros, who got loose because a Dark Iron emperor summoned him, and he is currently sitting at the bottom of Blackrock Mountain.",
		"The groups named on the isle, the Windshapers, the High Order and the Al'Aketh, are the Skyborne's own. Their relationship to the Windlord whose plane they live in is the question the zone is built around, and the sort worth arriving with rather than being handed.",
	},
	didYouKnow = "Elementals on Azeroth are refugees and invaders from four planes, not natives. Every elemental incursion in the world, the Abyssal Sands in Tanaris, the Charred Vale, Firewatch Ridge, is a place where one of those planes presses close enough to come through.",
	readMore = { "Wowpedia: Skywall", "Wowpedia: Al'Akir", "Wowpedia: Elemental Lords", "Wowpedia: Elemental Plane" },
}
