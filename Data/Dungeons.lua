local addonName, ns = ...

-- ===========================================================================
-- Data/Dungeons.lua -- instances that are not already covered as subzones.
-- Registered with ns.Instance so the detector can prefer them when the player
-- is inside an instance (IsInInstance() plus the instance name from
-- GetInstanceInfo(), both of which report the instance rather than the parent
-- zone).
-- ===========================================================================

local Instance = ns.Instance

-- ---------------------------------------------------------------------------
-- Low level
-- ---------------------------------------------------------------------------

Instance{
	name = "Ragefire Chasm", continent = "Kalimdor", faction = "Hostile", levels = "13-18",
	hook = "A lava cave directly under Orgrimmar, with a demon cult in it that the Horde has not cleaned out.",
	lore = {
		"Ragefire Chasm runs down from the Cleft of Shadow beneath Orgrimmar. It is, in other words, inside the Horde's capital.",
		"The Burning Blade cult has established itself down there, along with elementals and worse. The cult wants the orcs' old demonic power back, the one thing Thrall outlawed outright.",
		"That this is happening under the Warchief's own city is an embarrassment with real implications. Thrall's authority over the Horde's fringes has always been thinner than Orgrimmar's walls suggest.",
	},
	aliases = { "Ragefire Chasm" },
}

Instance{
	name = "The Stockade", continent = "Eastern Kingdoms", faction = "Hostile", levels = "22-30",
	hook = "Stormwind's prison, after the inmates took it.",
	lore = {
		"The Stockade is Stormwind's prison, built into the canals beneath the city. It holds the kingdom's criminals, including a good number of Defias.",
		"There has been a riot, and it succeeded. The inmates control the prison and the city's guard has not retaken it.",
		"The warden is still inside. A kingdom that cannot retake its own jail, inside its own walls, has very little left in reserve.",
	},
	aliases = { "Stormwind Stockade", "The Stockades" },
}

-- ---------------------------------------------------------------------------
-- Scholomance
-- ---------------------------------------------------------------------------

Instance{
	name = "Scholomance", continent = "Eastern Kingdoms", faction = "Hostile", levels = "58-60",
	-- The client reports the inside of it as "School of Necromancy".
	aliases = { "School of Necromancy", "The School of Necromancy" },
	hook = "A noble family's crypt turned into the Scourge's school of necromancy.",
	lore = {
		"Scholomance is on Caer Darrow, the island estate of the Barov family in Darrowmere Lake. The Barovs were wealthy, respectable Lordaeron nobility.",
		"Kel'Thuzad acquired the estate by promising them immortality and then murdering them for it. The crypts beneath the manor became a school, and the Cult of the Damned trains its necromancers in them.",
		"Darkmaster Gandling runs it. The Barov family's surviving relatives on both sides of the faction divide are still trying to reclaim the deeds. It is a notably bureaucratic response to a school of necromancy.",
	},
	readMore = { "Wowpedia: Scholomance", "Wowpedia: Kel'Thuzad" },
}

-- ---------------------------------------------------------------------------
-- Blackrock Mountain
-- ---------------------------------------------------------------------------

Instance{
	name = "Blackrock Depths", continent = "Eastern Kingdoms", faction = "Hostile", levels = "52-60",
	hook = "The sunken Dark Iron capital, with an emperor on the throne and a fire god at the bottom.",
	lore = {
		"Blackrock Depths is the city of Thaurissan, the Dark Iron dwarves' capital, after Emperor Dagran Thaurissan's summoning of Ragnaros dropped it into the mountain.",
		"Thaurissan still rules it. So does Ragnaros, from further down, and the arrangement is not an equal one: the Dark Irons summoned the Firelord and ended up his servants.",
		"The emperor's consort is Moira Bronzebeard, King Magni's only daughter. She was taken from Ironforge and she is now, by any reading, the Dark Iron empress. Magni wants her back and has not asked too loudly what she wants.",
	},
	didYouKnow = "The Grim Guzzler, a tavern inside the Depths, serves Dark Irons, ogres and anyone else who walks in. It is the only neutral ground inside Blackrock Mountain.",
	readMore = { "Wowpedia: Blackrock Depths", "Wowpedia: Dagran Thaurissan" },
}

Instance{
	name = "Molten Core", continent = "Eastern Kingdoms", faction = "Hostile", levels = "60",
	hook = "A pocket of the Elemental Plane of Fire at the mountain's root, with Ragnaros in it.",
	lore = {
		"The Molten Core lies beneath Blackrock Depths. Strictly speaking it is not part of this world at all. Thaurissan's summoning tore a hole through to the Elemental Plane of Fire, and the Core is what came through.",
		"Ragnaros the Firelord is one of the four Elemental Lords, the ancient rulers of the elements who served the Old Gods before the titans broke them. He was banished from this world long ago. Thaurissan brought him back.",
		"He has been building. The Core holds his lieutenants, his elemental legions and the forges where Dark Iron smiths work for him. Majordomo Executus manages the operation.",
	},
	didYouKnow = "Ragnaros is one of four Elemental Lords, with Al'Akir the Windlord, Therazane the Stonemother and Neptulon the Tidehunter. The titans imprisoned all four in their own planes. Ragnaros is the one somebody let out.",
	readMore = { "Wowpedia: Molten Core", "Wowpedia: Ragnaros" },
}

Instance{
	name = "Blackrock Spire", continent = "Eastern Kingdoms", faction = "Hostile", levels = "55-60",
	hook = "An orcish fortress with a black dragon living on the top floor and running the place.",
	lore = {
		"Blackrock Spire is the upper half of Blackrock Mountain. The lower reaches are held by the Dark Horde: orcs under Rend Blackhand, son of the Horde's first warchief, who never accepted the Second War's end and still calls himself warchief.",
		"The upper Spire belongs to Nefarian, son of Deathwing. He has been running experiments on dragonflight blood up there, attempting to create a new flight that combines the others' strengths.",
		"Rend holds the lower halls and Nefarian the upper. Whatever passes between them is their own business, and the orcs doing the fighting further down are not told much about it.",
	},
	aliases = { "Lower Blackrock Spire", "Upper Blackrock Spire" },
	readMore = { "Wowpedia: Blackrock Spire", "Wowpedia: Nefarian", "Wowpedia: Rend Blackhand" },
}

Instance{
	name = "Blackwing Lair", continent = "Eastern Kingdoms", faction = "Hostile", levels = "60",
	hook = "Nefarian's laboratory at the top of the Spire, where he is building a new dragonflight.",
	lore = {
		"Blackwing Lair is Nefarian's own domain at the Spire's summit: a laboratory rather than a lair.",
		"His project is chromatic dragons: creatures combining the powers of all five dragonflights. To get there he has been collecting eggs and samples from the other flights. Every Aspect still functioning counts him an enemy.",
		"His sister Onyxia dens in Dustwallow Marsh, on the other continent. Deathwing's children work separately and to the same pattern: take ground next to something that matters, and take a long time over it.",
	},
	readMore = { "Wowpedia: Blackwing Lair", "Wowpedia: Nefarian" },
}

-- ---------------------------------------------------------------------------
-- Naxxramas and Ahn'Qiraj
-- ---------------------------------------------------------------------------

Instance{
	name = "Naxxramas", continent = "Eastern Kingdoms", faction = "Hostile", levels = "60",
	hook = "Kel'Thuzad's flying necropolis, parked over the Plaguelands where everyone can see it.",
	lore = {
		"Naxxramas is a necropolis: a floating fortress of the Scourge, hanging above Plaguewood in the Eastern Plaguelands. It is Kel'Thuzad's seat.",
		"Kel'Thuzad was a Kirin Tor archmage expelled from Dalaran for studying necromancy. He went to Northrend, found the Lich King, founded the Cult of the Damned, and seeded the plague that destroyed Lordaeron. He was killed during the Third War and raised as a lich, which was always the plan.",
		"The necropolis holds the Scourge's four great wings, its Construct and Plague works, its military quarter and its own frozen chamber at the top. It is the Lich King's forward headquarters in these lands.",
	},
	didYouKnow = "Naxxramas is visible from the ground in the Eastern Plaguelands. It has been floating there, unassailable, while the Argent Dawn fights farm by farm beneath it.",
	readMore = { "Wowpedia: Naxxramas", "Wowpedia: Kel'Thuzad" },
}

Instance{
	name = "Ruins of Ahn'Qiraj", continent = "Kalimdor", faction = "Hostile", levels = "60",
	hook = "The qiraji city's outer ruins, opened when the Scarab Wall finally gave.",
	lore = {
		"The Ruins are Ahn'Qiraj's outer city, exposed when the Gates were opened. They were built by the qiraji, C'Thun's insectoid servants, and they held an empire that nearly took Kalimdor a thousand years ago.",
		"The War of the Shifting Sands ended with the night elves and the bronze dragonflight sealing the qiraji in behind the Scarab Wall. The seal has now been broken deliberately, because waiting for it to fail on its own was worse.",
		"What is inside the outer ruins is the qiraji army. What is inside the inner temple is the reason the titans built prisons.",
	},
	readMore = { "Wowpedia: Ruins of Ahn'Qiraj" },
}

Instance{
	name = "Temple of Ahn'Qiraj", continent = "Kalimdor", faction = "Hostile", levels = "60",
	hook = "The inner temple, built over an Old God the titans could not kill.",
	lore = {
		"The Temple of Ahn'Qiraj is the qiraji's holiest ground and the floor of C'Thun's prison. The Old God is beneath it, and the qiraji exist to serve it.",
		"Old Gods are the entities the titans found on this world and could not destroy. They imprisoned them instead, deep down, and every one of those prisons has been leaking ever since. C'Thun's is the one with an empire built on top.",
		"The Twilight Hammer cult has spent years working toward this moment from the outside. The qiraji have spent a thousand years working toward it from the inside.",
	},
	didYouKnow = "C'Thun is not the only Old God. Whatever is under the Master's Glaive in Darkshore, whatever the Twilight Hammer are listening to, and whatever the titans buried elsewhere are all still down there.",
	readMore = { "Wowpedia: Temple of Ahn'Qiraj", "Wowpedia: C'Thun", "Wowpedia: Old Gods" },
}

-- ---------------------------------------------------------------------------
-- Battlegrounds
-- ---------------------------------------------------------------------------

Instance{
	name = "Alterac Valley", continent = "Eastern Kingdoms", faction = "Contested", levels = "51-60",
	hook = "Dwarven prospectors against Thrall's own clan, in a valley neither side will leave.",
	lore = {
		"Alterac Valley is a war between the Stormpike Guard and the Frostwolf clan. The Stormpikes are Ironforge dwarves who came to the valley to excavate, convinced there are titan relics under the ice. The Frostwolves were already living there.",
		"The Frostwolves matter enormously to the Horde. This is Thrall's own clan: Durotan's clan, exiled to this valley by Gul'dan after Durotan refused to drink Mannoroth's blood. Drek'Thar, who leads them, is the shaman who found Thrall, took him in and taught him what being an orc meant.",
		"So the dwarves are digging in the one place the Horde cannot allow to be dug, and the Horde is defending the valley where its Warchief was made. Neither side is going to walk away.",
	},
	didYouKnow = "Drek'Thar is blind and he is the reason there is a Horde at all. Without the Frostwolves taking Thrall in after Durnholde, the orcs would have stayed in the camps.",
	readMore = { "Wowpedia: Alterac Valley", "Wowpedia: Frostwolf clan", "Wowpedia: Drek'Thar" },
}

Instance{
	name = "Warsong Gulch", continent = "Kalimdor", faction = "Contested", levels = "10-60",
	hook = "The logging war in Ashenvale, fought over a single valley the night elves want back.",
	lore = {
		"Warsong Gulch is a single valley in Ashenvale carrying the whole of that forest's argument. The Warsong clan is cutting timber for the Horde; the Silverwing Sentinels want them out of the woods.",
		"The Warsong were Grom Hellscream's clan. They are the Horde's most aggressive element and they have never been fully controlled by Orgrimmar, including when Thrall has told them to stop.",
		"The night elves spent ten thousand years as these forests' guardians. From their side this is not a border dispute, it is desecration. From the Horde's side, a nation given no land has to take timber from somewhere.",
	},
	readMore = { "Wowpedia: Warsong Gulch" },
}

Instance{
	name = "Arathi Basin", continent = "Eastern Kingdoms", faction = "Contested", levels = "20-60",
	hook = "Five resource sites in the Highlands, contested by the League of Arathor and the Forsaken.",
	lore = {
		"Arathi Basin sits in the Arathi Highlands, and the fighting there is over resources: a farm, a lumber mill, a blacksmith, a gold mine and a stable.",
		"The League of Arathor are Stromgarde loyalists trying to hold their collapsing kingdom together. Arathor was the first human nation and Stromgarde is its direct successor, and the League is fighting for the resources to keep it standing.",
		"The Defilers are a Forsaken outfit, and their interest is in making sure Stromgarde does not recover. The Forsaken would rather the Highlands stayed broken.",
	},
	readMore = { "Wowpedia: Arathi Basin", "Wowpedia: League of Arathor" },
}
