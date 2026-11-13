local addonName, ns = ...

-- ===========================================================================
-- Data/Cities.lua -- the six vanilla capitals and their districts.
-- GetZoneText() returns the city name inside a capital, and GetSubZoneText()
-- returns the district, so cities register as zones and districts as subzones.
-- ===========================================================================

local Zone, SubsOf = ns.Zone, ns.SubsOf
local EK, KA = "Eastern Kingdoms", "Kalimdor"

-- ---------------------------------------------------------------------------
-- STORMWIND CITY
-- ---------------------------------------------------------------------------

Zone{
	name = "Stormwind City", continent = EK, faction = "Alliance", levels = "Capital",
	hook = "Burned to the ground in the First War, rebuilt by masons it then refused to pay.",
	lore = {
		"Stormwind is the capital of the human kingdom once called Azeroth, and the greatest city in the Alliance. It is also a reconstruction. The orcish Horde sacked and burned it in the First War, King Llane Wrynn was murdered in his own keep, and the survivors fled north to Lordaeron.",
		"The rebuilding was done by the Stonemasons' Guild and it was superb. The nobility then refused to pay for it, and the guild's leader Edwin VanCleef took his masons underground and founded the Defias Brotherhood. Westfall is still burning over that decision.",
		"The city's politics are harder to read than its history. King Varian Wrynn is missing, lost at sea, and the throne is held in regency for his young son Anduin by Highlord Bolvar Fordragon. A regency concentrates power in whoever has the regent's ear, and the decisions coming out of this keep have served Westfall, Redridge and Duskwood very badly indeed.",
	},
	didYouKnow = "Stormwind Keep still stands on the spot where King Llane was assassinated during the First War. The city rebuilt around that room rather than move the seat of government anywhere else.",
	readMore = { "Wowpedia: Stormwind City", "Wowpedia: Bolvar Fordragon", "Wowpedia: Varian Wrynn" },
}

SubsOf("Stormwind City", {
	{
		name = "Trade District", faction = "Alliance",
		hook = "Stormwind's commercial heart, and the first thing most visitors see.",
		lore = {
			"The Trade District holds the bank, the auction house and the general business of the richest city in the Alliance. It is also where the city's guards are thickest.",
			"The district's prosperity is new. Stormwind spent a generation as a burnt shell and the trade here is the clearest evidence that the reconstruction worked.",
		},
	},
	{
		name = "Old Town", faction = "Alliance",
		hook = "The city's rough quarter, home to the rogues' guild and the city watch both.",
		lore = {
			"Old Town is the oldest surviving part of Stormwind and the least rebuilt. It holds the Stormwind City Guard's barracks, the SI:7 intelligence service, and the rogues who work out of the back rooms.",
			"SI:7 is Stormwind's spy service, and its agents handle the kingdom's problems that cannot be solved with soldiers. Which, given the state of Westfall, is most of them.",
		},
	},
	{
		name = "Cathedral Square", faction = "Alliance",
		hook = "The Cathedral of Light, and the seat of the Church in the southern kingdoms.",
		lore = {
			"The Cathedral of Light is the greatest temple of the Holy Light in Stormwind and the seat of Archbishop Benedictus. Paladins and priests train here.",
			"The Church's roots in this kingdom run back to Northshire Abbey, where the first battle-clerics turned the Light against the orcish Horde. The Cathedral is what that grew into.",
		},
	},
	{
		name = "The Mage Quarter", faction = "Alliance",
		hook = "Stormwind's arcane district, under the Wizard's Sanctum tower.",
		lore = {
			"The Mage Quarter holds the Wizard's Sanctum and Stormwind's arcane establishment. It is where the kingdom's mages and warlocks train, the latter rather more discreetly.",
			"Stormwind's magical tradition has always been secondary to Dalaran's. With Dalaran a crater, that has started to change by default rather than design.",
		},
	},
	{
		name = "Dwarven District", faction = "Alliance",
		hook = "An Ironforge quarter inside Stormwind, built around the deeprun tram.",
		lore = {
			"The Dwarven District is home to Stormwind's dwarven and gnomish population and the Stormwind end of the Deeprun Tram, which runs under the sea to Ironforge.",
			"The tram is an ambitious piece of gnomish and dwarven engineering, and the clearest physical statement of the alliance between the two kingdoms.",
		},
	},
	{
		name = "Stormwind Keep", faction = "Alliance",
		hook = "The throne room where King Llane was murdered, and where the regency sits now.",
		lore = {
			"Stormwind Keep is the seat of the kingdom. King Llane Wrynn was assassinated here during the First War, and the keep was burned with the rest of the city.",
			"It now holds Highlord Bolvar Fordragon as regent and the boy king Anduin Wrynn, with the court nobility around them. A great deal of the kingdom runs through that room.",
		},
	},
	{
		name = "The Park", faction = "Alliance",
		hook = "A green quarter where the night elves keep a presence in a human city.",
		lore = {
			"The Park is Stormwind's garden district and the quarter where the night elves and the city's druids maintain themselves.",
			"The night elves' alliance with the humans is only a few years old, forced by the Third War and still being worked out. The Park is what that accommodation looks like in architecture.",
		},
	},
	{
		name = "The Canals", faction = "Alliance",
		hook = "The waterways tying the city's districts together, and a monument to a mage.",
		lore = {
			"Stormwind's canals run between all its districts and are part of the Stonemasons' reconstruction work.",
			"A statue along the canal honours the city's dead and the heroes of the wars. The masonry throughout is worth looking at, given what it cost.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- IRONFORGE
-- ---------------------------------------------------------------------------

Zone{
	name = "Ironforge", continent = EK, faction = "Alliance", levels = "Capital",
	hook = "A city built inside a mountain's forge, run by a king who put his nation's money into archaeology.",
	lore = {
		"Ironforge is carved into the mountain at the heart of Dun Morogh, and the Great Forge at its centre is both an industrial site and the reason the city exists. The dwarves have been enlarging it for as long as they have been a nation.",
		"King Magni Bronzebeard rules. His reign has been defined by one decision: after the Uldaman excavations turned up evidence that dwarves descend from the earthen, beings the titans shaped out of living stone, Magni helped set up the Explorers' League and put Ironforge's resources behind digging up the past. Nearly every dwarven dig in the world traces back to that.",
		"The city is also the Alliance's most crowded capital, because Gnomeregan fell and the gnomes had nowhere else to go. Tinker Town is full of refugees running a government-in-exile, and High Tinker Mekkatorque is recruiting for an operation to retake his city.",
	},
	didYouKnow = "Magni has two brothers. Muradin Bronzebeard went to Northrend with Arthas' expedition and was presumed killed when Arthas claimed Frostmourne. Brann Bronzebeard is the Explorers' League's most famous field archaeologist and is almost never home.",
	readMore = { "Wowpedia: Ironforge", "Wowpedia: Magni Bronzebeard", "Wowpedia: Explorers' League" },
}

SubsOf("Ironforge", {
	{
		name = "The Great Forge", faction = "Alliance",
		hook = "The forge the city is named for, and the centre of everything.",
		lore = {
			"The Great Forge is a vast open foundry at Ironforge's heart, and the city's wards are arranged around it. It has been burning for a very long time.",
			"Dwarven smithing is the best in the Alliance, and the Forge is where most of it happens. The heat and noise are permanent features of living here.",
		},
	},
	{
		name = "Hall of Explorers", faction = "Alliance",
		hook = "The Explorers' League's own museum, full of things dug up from under the world.",
		lore = {
			"The Hall of Explorers holds the League's library and collection, including material recovered from Uldaman. It is the best archive of titan-related research anywhere.",
			"The League's central claim, that the dwarves were made by the titans rather than born of the mountain, is argued and displayed here. For a people who thought they knew where they came from, the Hall is a nation-sized identity crisis with exhibits.",
		},
	},
	{
		name = "The High Seat", faction = "Alliance",
		hook = "Magni Bronzebeard's throne room, with three thrones and only one occupant.",
		lore = {
			"The High Seat is Ironforge's throne room. Magni rules from it, and the chamber's design remembers that the dwarves once had three clans and a High King.",
			"The War of the Three Hammers ended that. The Wildhammers went to Aerie Peak and the Dark Irons went south to Blackrock Mountain, and the Bronzebeards have held Ironforge alone ever since.",
		},
	},
	{
		name = "Tinker Town", faction = "Alliance",
		hook = "The gnomes' quarter, housing a refugee nation and the tram station.",
		lore = {
			"Tinker Town is the gnomish district of Ironforge, and the gnomes' capital in exile in all but name. High Tinker Mekkatorque leads from here.",
			"It also holds the Deeprun Tram to Stormwind. The gnomes arrived as refugees after Gnomeregan was irradiated, and the dwarves took them in without much argument.",
		},
	},
	{
		name = "The Commons", faction = "Alliance",
		hook = "Ironforge's market ring, where the Alliance does its business.",
		lore = {
			"The Commons holds the auction house, the bank and the bulk of Ironforge's trade. It is one of the busiest commercial spaces in the Alliance.",
			"Ironforge's central position and its tram link to Stormwind have made it a hub out of proportion to Dun Morogh's own population.",
		},
	},
	{
		name = "Military Ward", faction = "Alliance",
		hook = "Where Ironforge trains its warriors and its gryphon riders.",
		lore = {
			"The Military Ward holds Ironforge's warrior and paladin training and the city's armouries.",
			"Dwarven military tradition runs to heavy infantry, firearms and siege. The gryphons come from the Wildhammers, not from here.",
		},
	},
	{
		name = "Mystic Ward", faction = "Alliance",
		hook = "The ward where dwarves do magic, a discipline they came to late.",
		lore = {
			"The Mystic Ward holds Ironforge's arcane and holy training. Dwarves came to magic late compared with humans and elves.",
			"Their shamanistic tradition is older and has mostly been lost. The Wildhammers kept it; the Bronzebeards did not.",
		},
	},
	{
		name = "Gates of Ironforge", faction = "Alliance",
		hook = "The mountain's front door, flanked by statues and gryphons.",
		lore = {
			"The Gates are the only formal entrance to Ironforge, opening onto Dun Morogh's snow, built to be held.",
			"The gryphon roost outside is the Alliance's main flight hub in the Eastern Kingdoms. No doorstep in the north is busier.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- UNDERCITY
-- ---------------------------------------------------------------------------

Zone{
	name = "Undercity", continent = EK, faction = "Horde", levels = "Capital",
	hook = "A nation of the risen dead, living in the sewers beneath the kingdom that made them.",
	lore = {
		"The Undercity is built in and beneath the ruins of Lordaeron's Capital City, in the crypts and sewers that Arthas had begun expanding for his own purposes. The Forsaken finished the work and made it a capital.",
		"Sylvanas Windrunner rules as the Banshee Queen. She was Ranger-General of Silvermoon, killed by Arthas when the Scourge destroyed Quel'Thalas, and raised as a banshee to serve him. When the Lich King's attention was pulled away during the Legion's invasion, she broke free, freed others, and took this ground.",
		"The Forsaken are not the Scourge and they are not alive. They have joined the Horde because no one else would take them and because Thrall was willing. The Royal Apothecary Society in the Apothecarium is working on a plague of its own, the dreadlord Varimathras serves Sylvanas after she spared him, and nobody in the Horde is entirely comfortable with any of it.",
	},
	didYouKnow = "Sylvanas' sisters are both significant: Alleria Windrunner went through the Dark Portal with the Alliance Expedition and never returned, and Vereesa Windrunner married the human archmage Rhonin. Sylvanas is the one who came back wrong.",
	readMore = { "Wowpedia: Undercity", "Wowpedia: Sylvanas Windrunner", "Wowpedia: Forsaken" },
}

SubsOf("Undercity", {
	{
		name = "The Royal Quarter", faction = "Horde",
		hook = "Sylvanas' throne room, with a dreadlord standing beside it.",
		lore = {
			"The Royal Quarter is the Banshee Queen's court, at the Undercity's heart.",
			"Varimathras attends her. He is a dreadlord of the Burning Legion, one of three brothers sent to oversee the Scourge, and Sylvanas spared him in exchange for his service. Keeping a demon as an advisor is the sort of decision the Forsaken make without blinking.",
		},
	},
	{
		name = "The Apothecarium", faction = "Horde",
		hook = "Where the Royal Apothecary Society develops a new plague.",
		lore = {
			"The Apothecarium houses the Royal Apothecary Society, and its project is a plague of its own: something that will kill the Scourge.",
			"The Forsaken's stated target is the Lich King's undead. Whether a weapon of that kind can be aimed only at the Scourge is a question the Horde has not pressed hard enough.",
		},
	},
	{
		name = "The Trade Quarter", faction = "Horde",
		hook = "The Undercity's commercial ring, around a central well.",
		lore = {
			"The Trade Quarter holds the bank, the auction house and the Undercity's general business, arranged around the central chamber.",
			"The Forsaken trade with the living Horde out of necessity on both sides. It works better than anyone expected.",
		},
	},
	{
		name = "The Magic Quarter", faction = "Horde",
		hook = "Where the Forsaken train mages and warlocks, with no squeamishness at all.",
		lore = {
			"The Magic Quarter handles the Forsaken's arcane and shadow training. Many Forsaken were mages in life, including Kirin Tor-trained ones.",
			"The Forsaken have no cultural restraints on necromancy or shadow magic, having been on the receiving end of both.",
		},
	},
	{
		name = "The War Quarter", faction = "Horde",
		hook = "The Forsaken's barracks and training ground.",
		lore = {
			"The War Quarter trains the deathguards and the Forsaken's warriors. They are fighting the Scourge in the Plaguelands and the Alliance in Hillsbrad simultaneously.",
			"Forsaken soldiers do not tire and do not fear death. They are far more effective than their numbers suggest.",
		},
	},
	{
		name = "The Rogues' Quarter", faction = "Horde",
		hook = "Where the Forsaken train the skills that do not get written down.",
		lore = {
			"The Rogues' Quarter handles the Forsaken's less public work. The Deathstalkers, Sylvanas' intelligence service, operate out of this part of the city.",
			"The Deathstalkers are among the best spies in the world, for the simple reason that a Forsaken agent can go places the living cannot.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- ORGRIMMAR
-- ---------------------------------------------------------------------------

Zone{
	name = "Orgrimmar", continent = KA, faction = "Horde", levels = "Capital",
	hook = "A fortress city cut into a canyon, named for a warchief and built by a freed slave.",
	lore = {
		"Orgrimmar is the Horde's capital, built into a canyon in Durotar and named for Orgrim Doomhammer, the Horde's second warchief, who killed Blackhand, led the Second War, and died in the Arathi Highlands.",
		"Thrall built it. He was raised a gladiator in Durnholde, escaped, found the Frostwolf clan and learned shamanism from Drek'Thar, freed the internment camps, and led his people across the sea to a continent where they could start again. Orgrimmar is the physical result.",
		"The Horde he built is not the Horde that invaded this world. Warlock practice is outlawed, shamanism is restored, and the trolls of the Darkspear and the tauren of Mulgore are full members rather than conquered auxiliaries. The Cleft of Shadow is still down there under the city. The suppression has plainly had its limits.",
	},
	didYouKnow = "Grommash Hold is named for Grom Hellscream, who died killing Mannoroth and freeing every orc alive from the demon blood. Thrall's Horde is built on his grave as much as on Doomhammer's name.",
	readMore = { "Wowpedia: Orgrimmar", "Wowpedia: Thrall", "Wowpedia: Orgrim Doomhammer" },
}

SubsOf("Orgrimmar", {
	{
		name = "Valley of Strength", faction = "Horde",
		hook = "Orgrimmar's main entrance and market, the busiest ground in the Horde.",
		lore = {
			"The Valley of Strength is the first part of Orgrimmar anyone sees: the bank, the auction house and the bulk of the city's trade. The zeppelin towers stand outside the gates, out in Durotar.",
			"It serves the Horde as the Trade District serves Stormwind. It is also where the Horde's three founding peoples visibly mix.",
		},
	},
	{
		name = "Valley of Wisdom", faction = "Horde",
		hook = "Thrall's own quarter, holding Grommash Hold and the shaman.",
		lore = {
			"The Valley of Wisdom holds Grommash Hold, where Thrall holds court, and the city's shamanistic training.",
			"Restoring shamanism was Thrall's central achievement. The orcs had lost it entirely under Gul'dan's warlocks, and Drek'Thar and the Frostwolves were the only ones who had kept it.",
		},
	},
	{
		name = "Valley of Honor", faction = "Horde",
		hook = "The warriors' quarter, with the training halls and the forges.",
		lore = {
			"The Valley of Honor trains Orgrimmar's warriors and hunters out of the Hall of the Brave and the Hunter's Hall, and it holds the city's forges and anvils.",
			"Honour in Thrall's Horde is a live concept rather than a slogan. It is the standard by which the new Horde distinguishes itself from the old one.",
		},
	},
	{
		name = "Valley of Spirits", faction = "Horde",
		hook = "The Darkspear trolls' quarter of the city.",
		lore = {
			"The Valley of Spirits is where Orgrimmar's troll population lives and where troll witch doctors and priests train.",
			"The Darkspear were given a quarter of the Horde's capital. For a tribe of refugees off the Echo Isles that was a substantial statement of Thrall's intent.",
		},
	},
	{
		name = "The Drag", faction = "Horde",
		hook = "A covered street of workshops and leatherworkers between the valleys.",
		lore = {
			"The Drag is the roofed thoroughfare running through Orgrimmar, lined with trade trainers and workshops.",
			"It is also the way to the Cleft of Shadow, which the city's layout does not advertise.",
		},
	},
	{
		name = "Cleft of Shadow", faction = "Horde",
		hook = "An underground quarter where the Horde keeps the magic it officially does not practise.",
		lore = {
			"The Cleft of Shadow is a cave district beneath Orgrimmar, holding the warlock trainers and the city's rogues.",
			"Thrall outlawed the demonic pacts that destroyed his people. The Cleft exists anyway: a compromise between principle and the fact that the Horde needs every weapon it can get.",
			"Ragefire Chasm runs down from here, and what is in it is not something the Horde's leadership has fully dealt with.",
		},
	},
	{
		name = "Grommash Hold", faction = "Horde",
		hook = "Thrall's throne room, named for the orc who broke the blood curse.",
		lore = {
			"Grommash Hold is the Warchief's seat, in the Valley of Wisdom. Thrall rules the Horde from here.",
			"The name honours Grom Hellscream. Naming the Horde's throne room after the orc whose death freed the race is a deliberate and permanent reminder of what the old Horde cost.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- THUNDER BLUFF
-- ---------------------------------------------------------------------------

Zone{
	name = "Thunder Bluff", continent = KA, faction = "Horde", levels = "Capital",
	hook = "Four mesas joined by rope bridges, the first city a nomadic people ever needed.",
	lore = {
		"Thunder Bluff stands on four connected mesas above Mulgore. It is the tauren capital, and within living memory the first permanent city they have ever had.",
		"They were nomads. For generations the tauren followed the kodo herds across Kalimdor and fought a losing war against the centaur, who hunted them. Thrall's Horde arrived, helped Cairne Bloodhoof break the centaur, and the tauren settled Mulgore in return for an alliance.",
		"Cairne rules as High Chieftain. The city holds the tauren's druids, their shaman, and the Pools of Vision where their spirit-walkers work. There are no walls. For a people who spent their history being chased, building an open city on top of a cliff was the point.",
	},
	didYouKnow = "Tauren druids were taught by Cenarius himself, in a tradition separate from the night elves'. When the Cenarion Circle reopened after the Third War, the two traditions met properly for the first time.",
	readMore = { "Wowpedia: Thunder Bluff", "Wowpedia: Cairne Bloodhoof" },
}

SubsOf("Thunder Bluff", {
	{
		name = "Elder Rise", faction = "Horde",
		hook = "The druids' mesa, and where the tauren keep their histories.",
		lore = {
			"Elder Rise holds the tauren's druid trainers and their elders. Tauren oral history is extensive and carefully kept, and this is where it lives.",
			"The tauren's understanding of Kalimdor's natural order is older and more complete than anything the Horde's other peoples brought with them.",
		},
	},
	{
		name = "Spirit Rise", faction = "Horde",
		hook = "The shamans' mesa, and the Pools of Vision.",
		lore = {
			"Spirit Rise holds the tauren's shamanistic training and the Pools of Vision, where spirit-walkers commune with the ancestors and the elements.",
			"Tauren shamanism predates the orcs' by a long way, and Thrall's restoration of orcish shamanism was helped enormously by having the tauren to consult.",
		},
	},
	{
		name = "Hunter Rise", faction = "Horde",
		hook = "The hunters' and warriors' mesa.",
		lore = {
			"Hunter Rise trains the tauren's hunters and warriors, and holds their weapon and armour crafters.",
			"Tauren hunting is bound up with religious obligation. Taking an animal carries duties, and the Hunter Rise teaches both halves.",
		},
	},
	{
		name = "High Rise", faction = "Horde",
		hook = "The top of the central mesa, where the High Chieftain lives.",
		lore = {
			"The High Rise is the highest ground in Thunder Bluff, at the top of the central mesa, and Cairne Bloodhoof dwells on it. A tauren who completes the Rites of the Earthmother is sent up here to stand in front of him, and that audience is the last thing asked of them.",
			"There is no throne room. The High Chieftain keeps a tent, and the open ground around it is where the city gathers to hear anything that matters. The rope bridges down to the other mesas are Thunder Bluff's only internal roads.",
		},
	},
	{
		name = "Pools of Vision", faction = "Horde",
		hook = "Sacred pools on Spirit Rise where the tauren speak with the dead.",
		lore = {
			"The Pools of Vision are where tauren spirit-walkers do their work, communing with ancestors and the elemental spirits.",
			"The tauren treat the dead as present rather than gone, and the pools are the formal mechanism for that.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- DARNASSUS
-- ---------------------------------------------------------------------------

Zone{
	name = "Darnassus", continent = KA, faction = "Alliance", levels = "Capital",
	hook = "A city grown in the branches of a sick World Tree, ruled by a priestess whose partner is asleep.",
	lore = {
		"Darnassus sits in the branches of Teldrassil and it is the night elves' capital. It is also brand new. The night elves had no city for ten thousand years: after the Sundering they scattered into Kalimdor's forests and lived as guardians rather than citizens.",
		"Tyrande Whisperwind rules as High Priestess of Elune. She leads alone, because Malfurion Stormrage, the first druid and her partner, is in the Emerald Dream and has not come back. In his absence the Cenarion Circle's politics have fallen to Fandral Staghelm, who pushed for Teldrassil and for the attempt to recover the night elves' lost immortality.",
		"That attempt is failing. Teldrassil was planted without the dragon Aspects' blessings, it is sick, and the corruption is spreading into the furbolgs and the barrow dens. The night elves are mortal now, they are in the Alliance now, and both of those are recent, unwelcome facts that the city is still absorbing.",
	},
	didYouKnow = "Night elves lost their immortality at the Battle of Mount Hyjal, when they spent Nordrassil's power to destroy Archimonde. It was a deliberate trade and they made it knowingly. The generation that remembers being immortal is still walking around Darnassus.",
	readMore = { "Wowpedia: Darnassus", "Wowpedia: Tyrande Whisperwind", "Wowpedia: Teldrassil" },
}

SubsOf("Darnassus", {
	{
		name = "Temple of the Moon", faction = "Alliance",
		hook = "Elune's temple and Tyrande's seat, the centre of night elf religion.",
		lore = {
			"The Temple of the Moon is the Sisters of Elune's great temple and Tyrande Whisperwind's seat as High Priestess. Priestess training happens here.",
			"Elune is the night elves' moon goddess, and unlike most divinities in this world her nature is genuinely unclear even to her own priesthood. The Sisters of Elune are the oldest institution the night elves have.",
		},
	},
	{
		name = "Cenarion Enclave", faction = "Alliance",
		hook = "Where the druids gather, and where Fandral Staghelm holds court.",
		lore = {
			"The Cenarion Enclave is the druids' quarter of Darnassus, raised in the tree's upper branches.",
			"Fandral Staghelm leads the Circle here in Malfurion's absence. He is the architect of Teldrassil, he lost his son Valstann to the qiraji in Silithus, and his judgement has not been the same since.",
		},
	},
	{
		name = "Warrior's Terrace", faction = "Alliance",
		hook = "Where the Sentinels train, and the city's only martial quarter.",
		lore = {
			"The Warrior's Terrace trains the Sentinels, the night elves' standing army. They have been fighting the Horde in Ashenvale and Stonetalon continuously since the orcs reached Kalimdor.",
			"The Sentinels are overwhelmingly female, a division of labour that dates to the long period when the men were druids asleep in the barrow dens and the women held the forests.",
		},
	},
	{
		name = "Craftsmen's Terrace", faction = "Alliance",
		hook = "The city's workshops, in a culture that does not much like manufacturing.",
		lore = {
			"The Craftsmen's Terrace holds Darnassus' trade trainers and workshops.",
			"Night elf craft tends toward the grown rather than the built. Their architecture is shaped from living material where possible. Darnassus looks nothing like Stormwind or Ironforge for that reason.",
		},
	},
	{
		name = "Tradesmen's Terrace", faction = "Alliance",
		hook = "Darnassus' market quarter, and the least night elven part of the city.",
		lore = {
			"The Tradesmen's Terrace handles the city's commerce, including trade with the rest of the Alliance.",
			"The night elves had no money economy to speak of before joining the Alliance. This quarter is an accommodation to allies who do.",
		},
	},
	{
		name = "The Temple Gardens", faction = "Alliance",
		hook = "The gardens before Elune's temple, with the city's moonwell.",
		lore = {
			"The Temple Gardens surround the Temple of the Moon and hold a moonwell, the night elves' source of healing and renewal.",
			"Moonwells are drawn from the Well of Eternity's waters. Every one of them is a fragment of the thing whose destruction broke the world.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- BETWEEN THE CAPITALS, AND INSIDE THEM
--
-- All three of these are top-level areas in the client's own AreaTable, which
-- is why they are registered as zones rather than as districts: GetZoneText
-- returns them. They were missing until a sweep of every top-level area turned
-- them up, the Tram having been mentioned in six places and written up in none.
-- ---------------------------------------------------------------------------

Zone{
	name = "Deeprun Tram", continent = EK, faction = "Alliance", levels = "Transit",
	aliases = { "The Deeprun Tram" },
	hook = "A gnome-built railway under the mountains, and the Alliance's most convincing argument for itself.",
	lore = {
		"The Deeprun Tram runs between Tinker Town in Ironforge and the Dwarven District in Stormwind, and it is gnomish work. Nothing else in the world quite matches it: a rail tunnel bored through the roots of Khaz Modan so that two capitals can be reached from one another without going outside.",
		"Treaties are easy to sign. The dwarves and gnomes of Ironforge and the humans of Stormwind built a railway instead, which costs more and says more. It is the Alliance's oldest working proof that its members actually mean it.",
		"The gnomes who did the engineering no longer have a city. Gnomeregan was lost to the troggs and to Mekgineer Thermaplugg's decision to flood it with radiation rather than hand it over, and the survivors live in Tinker Town, at this tunnel's northern end.",
	},
	didYouKnow = "The tunnel passes through a flooded cavern with glass walls, so the tram runs for a stretch with deep water and whatever lives in it on both sides. Nobody has ever satisfactorily explained what the gnomes were thinking.",
	readMore = { "Wowpedia: Deeprun Tram", "Wowpedia: Gnomeregan", "Wowpedia: Tinker Town" },
}

Zone{
	name = "Champions' Hall", continent = EK, faction = "Alliance", levels = "Capital",
	aliases = { "Champions Hall", "The Champions' Hall" },
	hook = "Stormwind's hall for its war heroes, off the Old Town.",
	lore = {
		"The Champions' Hall is where Stormwind honours the Alliance's ranking soldiers. Entry depends on rank earned in the war against the Horde, and what is inside is quartermasters and recognition rather than lore.",
		"The ranks themselves are the interesting part. The Alliance's field hierarchy runs from Private up through Knight and Marshal to Grand Marshal, and the Horde's mirror of it runs from Scout to High Warlord. Those titles were invented for a war that neither side is formally fighting.",
		"Azeroth is not at war. The Alliance and the Horde have no declared conflict after the Third War, and both maintain a full promotion ladder for killing each other anyway.",
	},
	readMore = { "Wowpedia: Champions' Hall", "Wowpedia: Honor system" },
}

Zone{
	name = "Hall of Legends", continent = KA, faction = "Horde", levels = "Capital",
	aliases = { "The Hall of Legends" },
	hook = "Orgrimmar's answer to the Champions' Hall, and the Horde's record of its own ranks.",
	lore = {
		"The Hall of Legends sits in Orgrimmar and does the same work as Stormwind's Champions' Hall: it recognises the Horde's ranking soldiers and supplies them.",
		"The Horde's ladder runs from Scout through Stone Guard and Champion to High Warlord. Thrall's Horde is built on the idea that the orcs are no longer a conquering army, and it keeps a promotion scheme for conquest regardless.",
		"The hall is named for legends rather than for champions, which fits the orcs better. The Horde's authority has always run through who the stories are about.",
	},
	readMore = { "Wowpedia: Hall of Legends", "Wowpedia: Honor system" },
}
