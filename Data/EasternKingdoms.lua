local addonName, ns = ...

-- ===========================================================================
-- Data/EasternKingdoms.lua
-- Lore cutoff: patch 1.12 and everything before it, including Warcraft I-III
-- and pre-WoW history. Nothing from The Burning Crusade onward.
-- ===========================================================================

local Zone, SubsOf = ns.Zone, ns.SubsOf
local EK = "Eastern Kingdoms"

-- ---------------------------------------------------------------------------
-- ELWYNN FOREST
-- ---------------------------------------------------------------------------

Zone{
	name = "Elwynn Forest", continent = EK, faction = "Alliance", levels = "1-10",
	hook = "The green heartland of Stormwind, twice rebuilt and still the safest ground in the kingdom.",
	lore = {
		"Elwynn is the oldest continuously held human land in the south. When the seven human nations split from Arathor, the settlers who came furthest south founded the Kingdom of Azeroth here, with its seat at Stormwind Keep. For most of recorded history this was a quiet farming realm on the edge of the map, too far from Lordaeron's politics to matter much.",
		"That ended with the First War. Orcs poured out of the Dark Portal in the Black Morass and drove north through these woods. Stormwind City was sacked and burned, King Llane was murdered, and Sir Anduin Lothar led the survivors across the sea to Lordaeron. Elwynn's farms were abandoned for a generation.",
		"What you are walking through is the rebuilt version. The farms are tilled again, the Abbey is teaching again, and the worst threats are kobolds in the mineshafts and gnolls raiding the pumpkin patches. Nobody in Goldshire will tell you the forest is dangerous. They will tell you it is finally boring, and that this is an achievement.",
	},
	didYouKnow = "Stormwind's kingdom was called Azeroth long before anyone used that name for the whole world. Older maps label this entire region 'Azeroth' and the city is just its capital.",
	readMore = { "Wowpedia: Elwynn Forest", "Wowpedia: Kingdom of Azeroth" },
}

SubsOf("Elwynn Forest", {
	{
		name = "Northshire Valley", faction = "Alliance", levels = "1-5",
		hook = "The walled training vale where Stormwind's recruits start.",
		lore = {
			"Northshire Valley is closed in by mountains with one way through it, a southern pass behind thick stone walls and a guarded gate, and a river runs down the middle of it and out into Crystal Lake. Northshire Abbey trains the kingdom's recruits inside that ring, and Marshal McBride commands its garrison.",
			"It has not always been safe. The Abbey was left a shell in the First War, taken apart in an orcish onslaught after the Horde came through this valley. The troubles now are smaller: kobolds in Echo Ridge Mine, Defias thugs eyeing the vineyard, and more wolves in the woods than there used to be, driven up here out of Duskwood.",
		},
	},
	{
		name = "Northshire Abbey", faction = "Alliance", levels = "1-5",
		hook = "The home of the Brotherhood of Northshire and a training ground for recruits.",
		lore = {
			"Northshire Abbey stands in Northshire Valley, among the foothills of Elwynn Forest. Its clerics served the kingdom of Stormwind during the First War, and the abbey fell to the invading orcs.",
			"The rebuilt abbey now houses trainers and receives recruits for the defence of the kingdom. Kobolds and Defias bandits threaten the surrounding valley.",
		},
		readMore = { "Wowpedia: Northshire Abbey", "Wowpedia: Northshire Abbey (WC1 Orc)", "Wowpedia: A Threat Within", "Wowpedia: Brotherhood of Thieves" },
	},
	{
		name = "Goldshire", faction = "Alliance", levels = "5-12",
		hook = "A crossroads town in Elwynn Forest, home to the Lion's Pride Inn.",
		lore = {
			"Goldshire stands at the junction of the roads through central Elwynn Forest. Travellers can find an inn, a forge and trade trainers here.",
			"Marshal Dughan is responsible for local security. He seeks help with threats in the surrounding forest, including murlocs and the Riverpaw gnolls.",
		},
		readMore = { "Wowpedia: Goldshire", "Wowpedia: Riverpaw Gnoll Bounty", "Wowpedia: A Fishy Peril" },
	},
	{
		name = "Lion's Pride Inn", parent = "Elwynn Forest", faction = "Alliance",
		hook = "Goldshire's inn, under a lion sigil, with a motto and a guest list.",
		lore = {
			"Innkeeper Farley runs the inn, and the motto he greets people with is rest and relaxation for the tired and cold. Mention the right friend in Northshire and he will knock something off the food and drink. Barkeep Dobbins works the bar, there are trainers for half a dozen trades sitting in the common room, and William Pestle lodges here with his potions while he collects candle wax for the apothecary he and his brother run in Stormwind.",
			"The lion is Stormwind's own sigil, and the sign does not say more than that.",
			"Not everyone who passes through is a traveller. When a trail of old addresses out of Duskwood was followed up, the registry had a second entry under the name Stalvan, half scratched out, and it pointed here. Asking after that name in the common room is how a good many people have spent an evening in Goldshire.",
		},
	},
	{
		name = "Fargodeep Mine", parent = "Elwynn Forest", faction = "Hostile",
		hook = "An abandoned Stormwind gold mine south of Goldshire, full of kobolds.",
		lore = {
			"Fargodeep was a Stormwind gold mine and a clan of kobolds has the workings now. It lies almost due south of Goldshire, between the Stonefield and Maclure homesteads, and a lower level runs deeper than that. A rare taskmaster called Narg turns up at the back of it, and a gold-toothed kobold dens above the mine with other people's property about him.",
			"Kobolds are not an invasion so much as a persistent infestation. They are drawn to candles and dark places and they dig compulsively, and Goldshire has turned that into a trade: gold dust bought off them by the ounce, candle wax collected for a Stormwind apothecary, and Marshal Dughan sending people down to confirm the reports he keeps getting.",
		},
	},
	{
		name = "Jasperlode Mine", parent = "Elwynn Forest", faction = "Hostile",
		hook = "A kobold mine in the foothills north of the Tower of Azora, with something worse at the bottom of it.",
		lore = {
			"The way to Jasperlode is east along the road as far as the Tower of Azora and then north into the foothills. Marshal Dughan sends a scout rather than a patrol: go through it, confirm whether the kobolds are in it, come back and say so. They are. The gold dust they carry has a buyer in Goldshire, and William Pestle wants their large candles for the wax.",
			"The kobolds are not the deepest thing in there. A colony of mine spiders holds the far end of the workings and treats them as food, with Mother Fang at the back of it. The spiders do not come far from the nest. That is the only reason the mouth of the mine is a reasonable place to send a recruit.",
		},
	},
	{
		name = "Crystal Lake", parent = "Elwynn Forest", faction = "Contested",
		hook = "A lake east of Goldshire, with murlocs along its shores.",
		lore = {
			"Crystal Lake lies just east of Goldshire in Elwynn Forest. Murlocs inhabit its shores, making the water dangerous for inexperienced travellers.",
			"William Pestle seeks crystal kelp from these murlocs for an invisibility liquor. The plant usually grows in the ocean, but murlocs sometimes collect it.",
		},
		readMore = { "Wowpedia: Crystal Lake", "Wowpedia: Collecting Kelp" },
	},
	{
		name = "Stone Cairn Lake", parent = "Elwynn Forest", faction = "Contested",
		hook = "A ring-shaped lake in the north-east, with a war memorial on its island.",
		lore = {
			"The lake takes its name from the cairn on the island at its centre, which is Heroes' Vigil: the monument raised for the dead of the First War. People used to come out here on pilgrimage.",
			"They do not now. Defias rogue wizards have settled the island and hold it, and a murloc tribe has put crude huts up along the southern bank. The Stone of Remembrance still stands among them.",
			"Guard Thomas sent Rolf and Malakai up the river to see what the murlocs were doing and neither came back. Their remains are on the shore, and the report that went to Marshal Dughan said plainly that the troops in eastern Elwynn are not enough to contain the problem.",
		},
		readMore = { "Wowpedia: Stone Cairn Lake", "Wowpedia: Heroes' Vigil", "Wowpedia: Find the Lost Guards" },
	},
	{
		name = "Brackwell Pumpkin Patch", parent = "Elwynn Forest", faction = "Contested",
		hook = "A noble family's pumpkin farm, raided by gnolls and guarded by a boar nobody wants to talk about.",
		lore = {
			"The Brackwells are minor Stormwind nobility with land in southern Elwynn. The pumpkin crop is a real and valuable export, and the gnoll raids out of the hills get treated as a kingdom problem rather than a farmer's problem.",
			"The estate also keeps a very large and very bad-tempered boar. It has become the kind of local legend that gets new adventurers killed.",
		},
	},
	{
		name = "Eastvale Logging Camp", parent = "Elwynn Forest", faction = "Alliance",
		hook = "Stormwind's lumber camp in eastern Elwynn, always behind on its orders.",
		lore = {
			"Eastvale cuts Stormwind's timber out of the forest east of Goldshire, and the orders keep arriving against delivery dates the camp struggles to meet.",
			"The wildlife is why. Wolves and bears attack the camp almost constantly, enough to chase the workers off the cut, and the Stormwind Guard has taken to paying passing help to thin them out. Marshal Haggard, who led the Stormwind Guard before he retired, keeps a manor here.",
		},
	},
	{
		name = "Tower of Azora", parent = "Elwynn Forest", faction = "Alliance",
		hook = "Theocritus' tower in Elwynn, watching a rival in Redridge.",
		lore = {
			"The Tower of Azora stands east of Goldshire, along the road through Elwynn Forest. Theocritus lives here with the gnomish servants of Azora; merchants and an enchanting trainer also work inside.",
			"His rival Morganth occupies the Tower of Ilgalar in Redridge. Theocritus sends adventurers to place a magical glyph near that tower so he can study his enemy's thoughts.",
		},
		readMore = { "Wowpedia: Tower of Azora", "Wowpedia: A Watchful Eye" },
	},
	{
		name = "Mirror Lake", parent = "Elwynn Forest", faction = "Alliance",
		hook = "A small lake with a waterfall, south-west of the Stormwind gates.",
		lore = {
			"Mirror Lake sits in western Elwynn with the Mirror Lake Orchard beside it. It would be the obvious place in the forest to swim or fish, and the Defias in the trees around it are the reason nobody does.",
			"The water is also under suspicion. Jennea Cannon sends mages out from Stormwind to fill a flask at the foot of the waterfall, because the mystic struggles of the last few years tore magic out of channels that used to be stable and nobody knows yet what has come through into this lake. Her working fear is for anyone who drinks from it long enough.",
		},
	},
	{
		name = "Ridgepoint Tower", parent = "Elwynn Forest", faction = "Alliance",
		hook = "A watchtower on the Redridge border, built to warn the kingdom about orcs coming down the pass.",
		lore = {
			"The eastern border of Elwynn is the line where the forest meets the Redridge Mountains, and Ridgepoint is one of the Stormwind Guard's scout towers along it, held properly rather than nominally.",
			"It is not only watching for orcs. The gnolls and the Blackrock come from Redridge in the east, the undead come up out of Duskwood to the south, and the Defias have camps close enough that the tower counts them as a third direction.",
		},
	},
	{
		name = "Westbrook Garrison", parent = "Elwynn Forest", faction = "Alliance",
		hook = "An undermanned barracks at Elwynn's western edge, with Hogger's poster on the wall.",
		lore = {
			"Westbrook Garrison is a Stormwind Guard barracks at Forest's Edge, on Elwynn's western end near the Westfall border. Deputy Rainer has it, with guards, two quartermasters and a morale officer. The bulk of the Stormwind army is abroad and the garrison has barely enough men to keep the roads of the region open.",
			"Its work is the Riverpaw pack in the woods to the south. Deputy Rainer asked Marshal Dughan in Goldshire for more soldiers and was sent adventurers instead. That is how most of that fighting gets done.",
			"On the garrison wall there are wanted posters for Hogger, the Riverpaw chieftain, who has seen off every attempt at taking him so far.",
		},
		readMore = { "Wowpedia: Westbrook Garrison", "Wowpedia: Riverpaw Gnoll Bounty", "Wowpedia: Hogger" },
	},
	{
		name = "Valley of Heroes", parent = "Stormwind City", faction = "Alliance",
		hook = "The approach to Stormwind, lined with statues of the Alliance Expedition's commanders.",
		lore = {
			"Five statues stand along the road in, raised while the city was still being rebuilt after the Second War. Turalyon is the one at the head of the road, with Kurdran Wildhammer and Khadgar on one side of the approach and Danath Trollbane and Alleria Windrunner on the other.",
			"All five led the Alliance Expedition. They went through the Dark Portal into Draenor to shut it from the far side, the portal came down behind them, and Stormwind has no idea what became of any of them. The statues went up for people who were already gone.",
		},
		didYouKnow = "None of the five is Anduin Lothar, though he is the reason there is a Stormwind to walk into. He covered the retreat from this city in the First War and died holding the line at Blackrock Spire in the Second.",
	},
})

-- ---------------------------------------------------------------------------
-- DUN MOROGH
-- ---------------------------------------------------------------------------

Zone{
	name = "Dun Morogh", continent = EK, faction = "Alliance", levels = "1-12",
	hook = "The frozen dwarven homeland, where a nation of miners found out they were carved from stone.",
	lore = {
		"Dun Morogh is the Bronzebeard dwarves' home range, and Ironforge is dug into the mountain at its heart. The dwarves have worked these peaks for so long that the distinction between the mountain and the city has stopped meaning much. Every ridge here has a shaft in it.",
		"The zone's defining event is recent and intellectual rather than military. Excavations at Uldaman and elsewhere turned up evidence that dwarves were not born of these mountains at all but made: shaped by the titans out of living stone as the earthen, and changed into flesh later. King Magni Bronzebeard threw the weight of his kingdom behind the Explorers' League and told it to go and find the rest.",
		"Not everything here is settled. The Frostmane trolls were pushed off this land by the dwarves and have never accepted it. Gnomeregan, the gnomish city at the zone's western edge, has just fallen to a radioactive catastrophe, and its refugees are now living in Ironforge.",
	},
	didYouKnow = "The dwarves' three clans fought the War of the Three Hammers over Ironforge's throne after High King Modimus Anvilmar died. The Bronzebeards kept the city, the Wildhammers went north to Aerie Peak, and the Dark Irons went south and have been a problem ever since.",
	readMore = { "Wowpedia: Dun Morogh", "Wowpedia: War of the Three Hammers" },
}

SubsOf("Dun Morogh", {
	{
		name = "Coldridge Valley", faction = "Alliance", levels = "1-5",
		hook = "A walled-off training valley where new dwarves and gnomes learn which end of a gun to hold.",
		lore = {
			"Coldridge is separated from the rest of Dun Morogh by a single pass, ideal ground for training. Ironforge keeps its recruits here until they can handle a troll and a wolf without supervision.",
			"The valley is busier than it has any right to be. Gnomeregan's fall dumped a generation of displaced gnomes into dwarven territory, and a good number of them are now learning to fight here alongside the dwarves who took them in.",
		},
	},
	{
		name = "Kharanos", faction = "Alliance", levels = "5-12",
		hook = "Dun Morogh's main village, built around a distillery that is arguably its real purpose.",
		lore = {
			"Kharanos sits on the road between Coldridge Valley and the Gates of Ironforge, and the first proper town most travellers see. It has a smith, an inn, and the Thunderbrew Distillery. The distillery is the reason anyone remembers the name.",
			"The town is also the staging point for the kingdom's two running problems: Frostmane troll raids out of the hills, and the steady trickle of things coming out of Gnomeregan that should not be coming out of Gnomeregan.",
		},
	},
	{
		name = "Thunderbrew Distillery", parent = "Dun Morogh", faction = "Alliance",
		hook = "The Thunderbrew family's brewery at Kharanos, and it has two sets of rivals.",
		lore = {
			"The distillery stands in Kharanos and Ragnar Thunderbrew runs it. What comes out of it is Thunder Ale, and there are barrels of it in the basement.",
			"The Barleybrews brew in the same zone and do not accept that the Thunderbrews make the only decent drink in Dun Morogh. One of them will hand over a barrel of Barleybrew Scalder and ask for it to be swapped quietly for a barrel of Thunder Ale, guard or no guard.",
			"The other rivalry is not a joke. Ragnar has had one of the family recipes stolen, and he blames the Dark Iron, of whom he says he had cause enough to think badly already.",
		},
		readMore = { "Wowpedia: Thunderbrew Distillery", "Wowpedia: Bitter Rivals", "Wowpedia: Ragnar Thunderbrew (quest)" },
	},
	{
		name = "Gol'Bolar Quarry", parent = "Dun Morogh", faction = "Alliance",
		hook = "A working stone quarry that keeps digging up things older than the dwarves.",
		lore = {
			"Gol'Bolar supplies cut stone to Ironforge, but the quarrymen have a habit of breaking into older workings and sealed chambers. Given what the Explorers' League found at Uldaman, every unexpected cavity in Dun Morogh now gets looked at twice.",
			"The immediate trouble is more mundane: troggs. Troggs are the titans' failed first attempt at what became the earthen, and the dwarves find that genealogy deeply unwelcome. They come up out of the deep tunnels and the quarry crews fight them off.",
		},
		didYouKnow = "Troggs and dwarves are, uncomfortably, relatives. Both descend from the titans' work on living stone; troggs are the version that went wrong.",
	},
	{
		name = "Frostmane Hold", parent = "Dun Morogh", faction = "Hostile",
		hook = "The last real stronghold of the ice trolls the dwarves drove off this mountain.",
		lore = {
			"The Frostmane are a tribe of ice trolls who held Dun Morogh before the dwarves expanded out of Ironforge. They lost, badly, and were pushed into the high cold ground at the zone's edges.",
			"They have not stopped raiding and are not going to. From the Frostmane view, Kharanos and every dwarven mine on this mountain is built on stolen ground, and the dwarves have never offered an argument against that beyond holding it.",
		},
	},
	{
		name = "Iceflow Lake", parent = "Dun Morogh", faction = "Contested",
		hook = "The frozen lake west of Kharanos, with Brewnall Village fishing through the ice.",
		lore = {
			"Iceflow is the largest water in Dun Morogh and the altitude keeps it frozen. Brewnall Village sits on the west bank and keeps a hole cut in the ice for fresh water and for fishing. Paxton Ganter works it and Gretta Ganter sells the tackle. The road to it runs north out of Kharanos and then follows the frozen river west.",
			"The islands out in the middle are the part to leave alone. A pack of winter wolves holds them, some of them starving, with the worg Timber at the head of it.",
			"Frostmane Hold is south-west of the village and it is full of trolls. The dwarf who found the cave is behind on his report about it: he got as far as the mouth, saw how many were inside and did not go in.",
		},
	},
	{
		name = "Gnomeregan", parent = "Dun Morogh", faction = "Hostile", levels = "24-34",
		hook = "The gnomish capital, flooded with radiation by its own leader to kill the troggs invading it.",
		lore = {
			"Gnomeregan was the technological wonder of the Alliance: a vertical city of machinery dug into the mountain, built and run by gnomes. When troggs broke into the lower levels, Mekgineer Thermaplugg, an advisor to High Tinker Mekkatorque, proposed flooding the city with radiation to purge them.",
			"It worked on the troggs. It also irradiated the gnomes. Something like four-fifths of the gnomish population died or was warped into leper gnomes, and Thermaplugg sealed himself inside and took the city for himself. The survivors fled to Ironforge, where the dwarves took them in.",
			"The gnomes have not given up on retaking it. Mekkatorque is openly recruiting anyone willing to go down into the irradiated levels, and the entrance is crawling with takers.",
		},
		didYouKnow = "Nobody in Tinker Town is being delicate about it. Mekkatorque says outright that he trusted Thermaplugg and was betrayed, calls him a madman and the king of nothing, and what he asks of anyone who volunteers is to kill the betrayer and take the city back.",
		readMore = { "Wowpedia: Gnomeregan", "Wowpedia: Sicco Thermaplugg" },
	},
	{
		name = "The Grizzled Den", parent = "Dun Morogh", faction = "Contested",
		hook = "A wendigo cave south-west of Kharanos, and a test of nerve for new adventurers.",
		lore = {
			"The Grizzled Den is a large cave system south-west of Kharanos. Wendigo hold it, young and full-grown, and Old Icebeard is somewhere at the back.",
			"What people come down here for is wendigo manes. Pilot Stonegear wants a heap of them to line the inside deck of his siege engine Trollplow, and couriers on the road have been chased off their loads by wendigo coming out of the den.",
			"Old Icebeard has Tundra MacGrann's meat locker, a month of salted meat that MacGrann had locked away for the cold season. The thorium held where MacGrann's door latch did not.",
		},
		readMore = { "Wowpedia: Grizzled Den", "Wowpedia: Tundra MacGrann's Stolen Stash" },
	},
	{
		name = "Misty Pine Refuge", parent = "Dun Morogh", faction = "Alliance",
		hook = "One building in the pines, with the Argent Dawn's man in Dun Morogh sitting in it.",
		lore = {
			"The refuge is a single house off the road north-east of Kharanos, with a fire, three chairs and Father Gavin in it, who serves the Argent Dawn. There is no mine here, and in Dun Morogh that counts as remarkable.",
			"The Argent Dawn fights the Scourge in the Plaguelands, most of a continent away, and it recruits and collects everywhere else. Keeping one man this far from the war is what that looks like on the ground.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- TIRISFAL GLADES
-- ---------------------------------------------------------------------------

Zone{
	name = "Tirisfal Glades", continent = EK, faction = "Horde", levels = "1-12",
	hook = "The dead heart of Lordaeron, where the Forsaken dug their city out from under a murdered kingdom.",
	lore = {
		"This was the richest farmland in the north and the seat of Lordaeron, the greatest of the human kingdoms. King Terenas Menethil ruled from Capital City, and the Alliance of Lordaeron that won the Second War was assembled here.",
		"Then the plague of undeath came. Kel'Thuzad's Cult of the Damned seeded infected grain through the countryside, and Terenas' son Arthas Menethil, trying to stop it, followed the trail to Northrend, took up the runeblade Frostmourne and came home as a death knight. He killed his father on the throne and raised Lordaeron's dead as the Scourge.",
		"The Forsaken are what happened next. When the Lich King's attention was dragged away during the Legion's invasion, Sylvanas Windrunner broke his hold on her mind and freed a large number of other undead with her. They took the ruins of Capital City, dug the Undercity out beneath it, and declared themselves a nation. They are not alive, they are not the Scourge, and they have joined the Horde because nobody else would have them.",
	},
	didYouKnow = "The region gave its name to the Guardians of Tirisfal, the order of mages that produced Medivh. The human and high elven magi who founded it met here, and took the name of the place they met in.",
	readMore = { "Wowpedia: Tirisfal Glades", "Wowpedia: Forsaken", "Wowpedia: Arthas Menethil" },
}

SubsOf("Tirisfal Glades", {
	{
		name = "Deathknell", faction = "Horde", levels = "1-5",
		hook = "A ruined village the Forsaken use to work out which of their new dead can still think.",
		lore = {
			"Deathknell was an ordinary Lordaeron hamlet. It is now where newly risen Forsaken wake up, in the crypt, and the test is simply whether they wake at all. Mordo is the caretaker down there, and what he tells someone who sits up is that they were nearly tossed into the fire with the others.",
			"The others are still outside. Mindless and wretched zombies wander the fields around the village, risen and never come back, and the distinction between them and the Forsaken who did is the whole of what the Forsaken have. Free will is the only thing separating them from the Scourge.",
		},
	},
	{
		name = "Brill", faction = "Horde", levels = "5-12",
		hook = "The Forsaken's working town above the Undercity, run out of a surprisingly intact inn.",
		lore = {
			"Brill survived the plague better than most of Tirisfal, so the Forsaken kept it standing rather than levelling it. It is the surface administration for the Undercity: the inn, the stables, the deathguard post and the apothecary who handles local business.",
			"The town's troubles are the zone's, scaled down: Scarlet Crusade fanatics to the east, mindless Scourge to the north, and the Forsaken's own experiments getting loose in the fields.",
		},
	},
	{
		name = "Agamand Mills", parent = "Tirisfal Glades", faction = "Hostile",
		hook = "A milling family's estate, now a crypt full of Agamands who refuse to stay in it.",
		lore = {
			"The Agamands were a prominent farming family who ran the mills here for generations. The plague took all of them, and unlike the Forsaken they came back without their minds.",
			"The Forsaken find the place useful and galling in equal measure. It is a reminder of exactly what they escaped, sitting a short walk from Brill.",
		},
	},
	{
		name = "Scarlet Monastery", parent = "Tirisfal Glades", faction = "Hostile", levels = "26-45",
		hook = "The Church's finest training abbey, seized by zealots who now kill the living and the dead without distinction.",
		lore = {
			"The Monastery was a cathedral of the Church of the Holy Light and a seminary for paladins in training, Stromgarde's especially. Lordaeron's priesthood treated it as a seat of learning. When Lordaeron fell, the survivors who gathered here turned into something else.",
			"The Scarlet Crusade splintered off from the Silver Hand and decided that the only way to be certain of rooting out the undead was to treat anyone possibly infected as already lost. They now hold the Monastery as a fortress, execute refugees on suspicion, and consider the Argent Dawn traitors for working with the Forsaken.",
			"They are not wrong that the Forsaken are dangerous. They are wrong about almost everything else, and their own leadership has been quietly compromised in ways the rank and file do not know about.",
		},
		readMore = { "Wowpedia: Scarlet Crusade", "Wowpedia: Scarlet Monastery" },
	},
	{
		name = "Ruins of Lordaeron", parent = "Tirisfal Glades", faction = "Horde",
		hook = "The shell of Capital City, with the Forsaken's Undercity hollowed out beneath its floor.",
		lore = {
			"These are the remains of the greatest human city in the world. The throne room above is where Arthas killed his father Terenas, and the Forsaken have left the ruin standing largely as it fell.",
			"The Undercity below was originally a crypt and sewer system that Arthas had begun expanding. Sylvanas finished the job and turned it into a capital. The symbolism of a dead nation's heirs living in its basement is not lost on anyone.",
		},
		didYouKnow = "The Forsaken have left the throne room much as they found it. They hold their court in the crypts below instead.",
	},
	{
		name = "The Bulwark", parent = "Tirisfal Glades", faction = "Horde",
		hook = "The Forsaken's wall against the Scourge, holding the gap between Tirisfal and the Plaguelands.",
		lore = {
			"East of Tirisfal the land simply stops being land and becomes the Western Plaguelands. The Bulwark is the Forsaken's checkpoint and barricade on that border. The fighting there is real.",
			"The Forsaken fight the Scourge harder than anyone. The Lich King would reclaim them if he could, and they know exactly what that would mean.",
		},
	},
	{
		name = "Night Web's Hollow", parent = "Tirisfal Glades", faction = "Hostile",
		hook = "A gold mine north-west of Deathknell that the Forsaken cannot work for spiders.",
		lore = {
			"There is a gold mine in the hollow, and the Forsaken want what is in it. There was little gold in Lordaeron even at its height, and the state the Forsaken are building has less than that.",
			"The spiders got there first. Night web spiders have the cave and the slope outside it, with a matriarch among them, and Executor Arren in Deathknell has no manpower to spare for the job. So it is done a few spiders at a time, and he reckons on months before the mine is clear enough to go in with torches and burn the webbing out.",
		},
	},
	{
		name = "Garren's Haunt", parent = "Tirisfal Glades", faction = "Hostile",
		hook = "A farmstead whose dead will not lie down, and a Forsaken test case in raising the willing.",
		lore = {
			"Garren's Haunt is one of several Tirisfal farmsteads where the plagued dead rose without minds. The Forsaken use such places to practise their own necromancy. Given what necromancy did to them, the irony is sharp and goes unremarked.",
			"The Forsaken position is that the Scourge's methods are tools and nothing more, and refusing to use them against the Scourge would be sentimental.",
		},
	},
	{
		name = "Balnir Farmstead", parent = "Tirisfal Glades", faction = "Horde",
		hook = "A Tirisfal farm the Scourge has taken, with the flowers still coming up in it.",
		lore = {
			"Nobody works the Balnir place now. The Forsaken call it a haven for interloping Scourge and send patrols east from the Bulwark to deal with what gathers there, and what gathers there is bleeding horrors and wandering spirits, with Fellicent's shade among them.",
			"The Scarlet Crusade is the other half of the problem. Captain Vachon raids from the ruined tower just along from the farm with his friars and zealots, so the ground between them belongs to neither.",
			"The snapdragons are still growing in the beds. They are named for the family and they are the only thing on the farm that has carried on as before.",
		},
	},
	{
		name = "Whispering Gardens", parent = "Tirisfal Glades", faction = "Contested",
		hook = "An old Lordaeron graveyard, unnervingly peaceful by the standards of this zone.",
		lore = {
			"The Gardens were a formal burial ground for Capital City's dead, laid out long before the plague. Most of its occupants have since got up and walked off.",
			"The Forsaken keep an eye on it. Consecrated ground has a way of producing complications for the undead, and some of the older graves here were warded by the Church.",
		},
	},
	{
		name = "Terrace of Repose", parent = "Tirisfal Glades", faction = "Contested",
		hook = "A green terrace at the Scarlet Monastery's gate, the one ground the plague missed.",
		lore = {
			"The Terrace of Repose is the ground just north of the Scarlet Monastery's entrance, and it is one of the very few places in northern Lordaeron the plague never reached. The Scarlet Crusade hold it, and on it they have hedges growing and a fountain running clean water, which nothing else in Tirisfal Glades manages.",
			"It is a garrison rather than a garden. Scarlet sentries stand on it, a scout and a pair of preservers walk the approach, and the cathedral and armoury doors are behind them.",
		},
		readMore = { "Wowpedia: Terrace of Repose", "Wowpedia: Scarlet Monastery", "Wowpedia: Scarlet Crusade" },
	},
})

-- ---------------------------------------------------------------------------
-- SILVERPINE FOREST
-- ---------------------------------------------------------------------------

Zone{
	name = "Silverpine Forest", continent = EK, faction = "Horde", levels = "10-20",
	hook = "A grey, worg-haunted forest between two dead kingdoms, where a mage's pet curse got loose.",
	lore = {
		"Silverpine lies between Forsaken Tirisfal and the sealed border of Gilneas. It was Lordaeron's southern woodland, dotted with villages and watched over by a contingent of Dalaran mages. The plague and the wars have left it a corridor rather than a country.",
		"Its defining disaster is Shadowfang Keep. The archmage Arugal, sent by Dalaran to help hold the line against the Scourge, summoned worgen out of another world as weapons. They did not stay under control. They overran Pyrewood Village and the keep itself, Arugal lost his mind, and the curse has been spreading through the forest ever since.",
		"The Forsaken now claim Silverpine and hold it loosely from the Sepulcher. They are contesting Dalaran's remaining mages at Ambermill, watching the Greymane Wall, and trying to work out what to do about a forest full of wolves that used to be people.",
	},
	didYouKnow = "Gilneas fought the Second War and then walked out of the Alliance over what the peace cost, sealing itself behind the Greymane Wall. Nobody outside has heard anything reliable from behind it since.",
	readMore = { "Wowpedia: Silverpine Forest", "Wowpedia: Shadowfang Keep" },
}

SubsOf("Silverpine Forest", {
	{
		name = "The Sepulcher", faction = "Horde", levels = "10-20",
		hook = "The Forsaken's hold in Silverpine, built into a crypt because of course it is.",
		lore = {
			"The Sepulcher is the Forsaken's administrative centre for the whole forest: an inn, a flight master, an apothecary and a garrison, all built into and around an old Lordaeron burial site.",
			"From here the Forsaken manage three separate problems at once: the worgen, the Dalaran holdouts at Ambermill, and the question of what is behind the Greymane Wall.",
		},
	},
	{
		name = "Pyrewood Village", parent = "Silverpine Forest", faction = "Hostile",
		hook = "A village at the foot of the Greymane Wall whose people turn into worgen after dark.",
		lore = {
			"Pyrewood sat just outside Gilneas' wall and was the first settlement Arugal's worgen reached. The villagers were cursed rather than killed outright: by day they are people, and at nightfall they become something else.",
			"They know what is happening to them. That is the worst part of it. Travellers passing through in daylight sometimes mistake Pyrewood for an ordinary, if miserable, village.",
		},
	},
	{
		name = "Shadowfang Keep", parent = "Silverpine Forest", faction = "Hostile", levels = "22-30",
		hook = "Baron Silverlaine's castle, taken by the worgen its own guest summoned.",
		lore = {
			"The keep belonged to Baron Silverlaine, a Lordaeron noble. Archmage Arugal was one of the Dalaran mages sent to hold Silverpine against the Scourge, and when the Scourge pressed in he reached into another world and pulled worgen through to fight for him.",
			"They killed the Scourge and then turned on the wizards, and they besieged Silverlaine's keep. Silverlaine died there, and Arugal, driven mad by guilt, took the worgen for his own and settled in among them. The castle has been theirs since, and Silverlaine's ghost is still in it.",
		},
		didYouKnow = "Arugal's worgen were not native to this world at all. He summoned them. Where they came from, and whether anything else can come through the same way, nobody has answered.",
		readMore = { "Wowpedia: Archmage Arugal" },
	},
	{
		name = "Ambermill", parent = "Silverpine Forest", faction = "Hostile",
		hook = "The last Dalaran holdout in Silverpine, and the Forsaken want it gone.",
		lore = {
			"Ambermill is held by mages still loyal to Dalaran, squarely in the Forsaken's way. Dalaran itself is a ruin and a crater, but the Kirin Tor's scattered agents have not all accepted that the city is finished.",
			"The Forsaken see an enemy garrison inside their borders. The mages see squatters in a dead kingdom. Neither reading is unreasonable.",
		},
	},
	{
		name = "The Greymane Wall", parent = "Silverpine Forest", faction = "Contested",
		hook = "Gilneas' enormous wall, sealed from the inside, with nobody answering.",
		lore = {
			"King Genn Greymane had the wall built across the isthmus and took Gilneas out of the Alliance of Lordaeron after the Second War was won. The quarrel was the bill: taxes raised in Gilneas were paying to feed orcs in the internment camps and to raise Nethergarde Keep, and the king did not see why they should. It is a serious piece of engineering and it has held shut for years.",
			"What is going on behind it is a genuine unknown. The Forsaken have probed it, the worgen curse has spread near it, and nothing has come out.",
		},
	},
	{
		name = "Fenris Isle", parent = "Silverpine Forest", faction = "Hostile",
		hook = "An island in Lordamere Lake occupied by the Rot Hide gnolls.",
		lore = {
			"Fenris Isle lies in Lordamere Lake, east of the Decrepit Ferry. The Rot Hide gnolls occupy the island and its keep, making it a Scourge stronghold in Silverpine Forest.",
			"The Forsaken investigate the strange ichor within the gnolls before preparing an assault on their master, Thule Ravenclaw.",
		},
		readMore = { "Wowpedia: Fenris Isle", "Wowpedia: Rot Hide Ichor", "Wowpedia: Assault on Fenris Isle" },
	},
	{
		name = "Beren's Peril", parent = "Silverpine Forest", faction = "Hostile",
		hook = "Spider-thick woods on the road south, named for somebody it did not work out for.",
		lore = {
			"The name is a warning that predates the Forsaken. Silverpine's spiders were a problem before the plague and are considerably worse now.",
			"The road through here is the main route from Tirisfal to the Hillsbrad front, so the Forsaken keep it nominally clear and the spiders keep disagreeing.",
		},
	},
	{
		name = "Deep Elem Mine", parent = "Silverpine Forest", faction = "Hostile",
		hook = "A Silverpine mine occupied by worgen under its tainted foreman.",
		lore = {
			"Arugal's magic has spread to Deep Elem Mine in the hills of Silverpine Forest. Worgen inhabit the workings under Grimson the Pale, the mine's former foreman.",
			"The Forsaken want the mine for Varimathras' advance. Dalar Dawnweaver sends adventurers against Grimson before they can claim it.",
		},
		readMore = { "Wowpedia: Deep Elem Mine", "Wowpedia: Arugal's Folly (3)" },
	},
	{
		name = "Malden's Orchard", parent = "Silverpine Forest", faction = "Contested",
		hook = "An abandoned orchard still fruiting, with nobody left to pick it.",
		lore = {
			"Malden's was a working orchard serving the Silverpine villages. The trees have carried on without the family. Across Lordaeron that is a common enough sight now.",
			"Travellers do eat the fruit. Given what the plague did to this region's grain, that is a braver act than it looks.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- WESTFALL
-- ---------------------------------------------------------------------------

Zone{
	name = "Westfall", continent = EK, faction = "Alliance", levels = "10-20",
	hook = "Stormwind's breadbasket turned to dust, now held by the masons the kingdom refused to pay.",
	lore = {
		"Westfall fed Stormwind. It was open grain country worked by tenant farmers. What is left is abandoned fields, dust and scarecrows. The farms failed partly through drought and partly because the kingdom's attention and money went elsewhere after the wars.",
		"The Defias Brotherhood is the zone's real story, and Stormwind brought it on itself. After the First War, the Stonemasons' Guild rebuilt Stormwind City from the ground up. When the bill came due, the nobility refused to pay it. The guild's leader, Edwin VanCleef, took his masons, went underground, and turned a labour dispute into an insurgency.",
		"They now operate out of the Deadmines beneath Moonbrook, raid the roads, and have the sympathy of a good number of the people they are nominally terrorising. What stands against them is the People's Militia: a volunteer force of farmers out of Sentinel Hill, because Stormwind has not sent an army.",
	},
	didYouKnow = "The Defias grievance is legitimate. The masons did the work, Stormwind did not pay, and nobody on the council that made that decision has ever had to answer for what came of it.",
	readMore = { "Wowpedia: Westfall", "Wowpedia: Defias Brotherhood", "Wowpedia: Edwin VanCleef" },
}

SubsOf("Westfall", {
	{
		name = "Sentinel Hill", faction = "Alliance", levels = "10-20",
		hook = "The People's Militia headquarters, holding Westfall with volunteers because the kingdom will not.",
		lore = {
			"Sentinel Hill is a stone tower on the only high ground in central Westfall, and the last functioning Alliance authority in the zone. Gryan Stoutmantle runs the People's Militia out of it.",
			"The militia is better organised than volunteers usually are. Captain Danuvin and a line of protectors serve under Stoutmantle, there is a quartermaster and a scout, and anyone joining starts as a pledge sworn to the militia and to the Light.",
			"What they do not have is help. Stoutmantle's own view is that Stormwind deserted Westfall, and that if it had not there would be no need for a militia at all. Lakeshire's magistrate, writing to ask the militia for aid, got a letter back saying so.",
		},
	},
	{
		name = "Moonbrook", parent = "Westfall", faction = "Hostile",
		hook = "A mining town that failed, emptied out, and was taken over wholesale by the Defias.",
		lore = {
			"Moonbrook was a real town with a real economy until the mine beneath it stopped paying and the farms around it dried up. The people left, and the Defias Brotherhood walked into an abandoned settlement sitting directly on top of the tunnel network they needed.",
			"It is Defias territory now, openly patrolled. The militia at Sentinel Hill does not have the strength to take it back.",
		},
	},
	{
		name = "The Deadmines", parent = "Westfall", faction = "Hostile", levels = "17-26",
		hook = "An abandoned gold mine where the Defias are building a warship underground.",
		lore = {
			"The Deadmines were Stormwind's gold mine, worked out and sealed long before the Defias arrived. VanCleef reopened them as a base, exactly the sort of thing a guild of expert excavators would think to do.",
			"What they have built down there is well past banditry. The tunnels have been expanded into a shipyard, with a goblin-engineered juggernaut under construction in a flooded cavern. The Brotherhood is not planning to rob caravans forever.",
		},
		didYouKnow = "VanCleef is building it with goblin help. Which goblins, nobody has established, and goblins will take a contract from anyone with coin.",
		readMore = { "Wowpedia: The Deadmines" },
	},
	{
		name = "Furlbrow's Pumpkin Farm", parent = "Westfall", faction = "Alliance",
		hook = "A pumpkin farm the Defias took, with the machines still working the rows.",
		lore = {
			"The Furlbrows are not here. They fled the farm and are camped out on the road up by the Jansen Stead, and Farmer Furlbrow left his pocket watch behind in the wardrobe of the farmhouse.",
			"What holds the fields now is Defias smugglers and harvest watchers, with a Foe Reaper among them. The deed to the place was stolen as well, and getting it back has fallen to passing strangers rather than to anyone wearing a tabard.",
		},
	},
	{
		name = "Saldean's Farm", parent = "Westfall", faction = "Alliance",
		hook = "A Westfall farm whose owners refuse to leave their overrun fields.",
		lore = {
			"Farmer Saldean and Salma Saldean remain on their farm while other families flee Westfall. Harvest Watchers have taken over their fields, and the farmer offers pay to anyone who clears them out.",
			"Salma seeks ingredients for Westfall stew. A neighbouring farmer's wife sends her the recipe while preparing to leave the region herself.",
		},
		readMore = { "Wowpedia: Saldean's Farm", "Wowpedia: The Killing Fields", "Wowpedia: Westfall Stew (Classic 2)" },
	},
	{
		name = "The Jansen Stead", parent = "Westfall", faction = "Contested",
		hook = "A farm the thieves emptied, with the harvest machines still in the fields.",
		lore = {
			"The Jansen Stead was emptied like most of Westfall's farms, and it was thieves who did the emptying. What holds the fields now is a crowd of harvest watchers, mechanical things shaped like scarecrows that go for anyone who comes near.",
			"Nobody is sure who built them. Some say only goblins could have. Others say the Defias Brotherhood had them made to frighten Westfall off its own land and leave the smuggling roads clear. Either way they have done the job.",
		},
	},
	{
		name = "Gold Coast Quarry", parent = "Westfall", faction = "Hostile",
		hook = "A coastal stone quarry, now a Defias work site.",
		lore = {
			"The quarry cut stone for Stormwind's reconstruction. Many of the Defias working it now were working it legitimately a few years ago.",
			"They are still cutting stone. They are simply not being paid for it by anyone the kingdom recognises.",
		},
	},
	{
		name = "Westfall Lighthouse", parent = "Westfall", faction = "Contested",
		hook = "A lighthouse on the dust coast, with murlocs in the surf below it.",
		lore = {
			"The lighthouse still works and still matters, since the coast here is a hazard and Stormwind's shipping passes it. Its keeper's situation is lonely and precarious.",
			"Murlocs have colonised the beaches beneath it, and the job has got much worse.",
		},
	},
	{
		name = "The Dagger Hills", parent = "Westfall", faction = "Hostile",
		hook = "The ridge behind Moonbrook, where Defias bands hide between raids.",
		lore = {
			"The Dagger Hills rise behind Moonbrook in southern Westfall. Defias knuckledusters, pathstalkers and highwaymen occupy the hills.",
			"The People's Militia has reports of Defias raiders hiding here after pillaging the countryside. Sentinel Hill is sending adventurers against them.",
		},
		readMore = { "Wowpedia: Dagger Hills", "Wowpedia: The People's Militia (3)" },
	},
	{
		name = "Alexston Farmstead", parent = "Westfall", faction = "Hostile",
		hook = "An abandoned farm the Defias are stripping, with the harvest golems still walking it.",
		lore = {
			"Another emptied Westfall holding. The militia on Sentinel Hill names three places the Defias pillagers are working over, and this is one of them, along with the Gold Coast Quarry and Moonbrook.",
			"The farm was left rather than destroyed, and it shows. There are sacks of oats still stacked where somebody put them, harvest watchers and a Foe Reaper still walking the fields, and the Defias are carrying off what they can lift.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- LOCH MODAN
-- ---------------------------------------------------------------------------

Zone{
	name = "Loch Modan", continent = EK, faction = "Alliance", levels = "10-20",
	hook = "A dwarven lake valley where the Explorers' League digs for proof of who made them.",
	lore = {
		"Loch Modan is the green valley east of Dun Morogh, built around a great lake held in place by the Stonewrought Dam. The dam is one of the finest pieces of dwarven engineering in the world and the zone's economy runs on it.",
		"The real work here is archaeology. After Uldaman, Ironforge became convinced that the titans left records across these mountains, and the Explorers' League dug in at Ironband's Excavation Site in the east. Prospector Ironband has troggs in his dig and is recruiting for Uldaman from it. The League's premise is that dwarves were made rather than born, and every artefact supporting it lands in Ironforge as a theological event.",
		"The valley is not quiet. The Mo'grosh ogres hold the northeastern hills, troggs come up from below, and Dark Iron agents have taken an unhealthy interest in the dam.",
	},
	didYouKnow = "If the Stonewrought Dam ever failed, it would empty the loch into the Wetlands below. The dwarves consider this unthinkable. The Dark Irons consider it a plan.",
	readMore = { "Wowpedia: Loch Modan", "Wowpedia: Explorers' League" },
}

SubsOf("Loch Modan", {
	{
		name = "Thelsamar", faction = "Alliance", levels = "10-20",
		hook = "The dwarven town on the loch's west shore, famous for its blood sausage.",
		lore = {
			"Thelsamar is Loch Modan's main settlement: an inn, a smith, a flight path and the administration for the valley's mining and digging concerns. It is comfortable in a way Dun Morogh's towns are not, because it is not on a glacier.",
			"The town handles the practical side of the Explorers' League's work in the valley, and is full of dwarves with strong opinions about potsherds. There is never a shortage of empty bellies in it either, with children running in and out and the excavation crews coming in at the end of a day.",
			"The blood sausage is the town's own. Vidra Hearthstove makes it and will give out the recipe to anyone who fetches the ingredients: bear meat, boar intestines for the casings and spider ichor for spice. She recommends eating them fresh.",
		},
	},
	{
		name = "Stonewrought Dam", parent = "Loch Modan", faction = "Alliance",
		hook = "The dam that made the loch, and the single most important structure in the region.",
		lore = {
			"The dam holds back Loch Modan and regulates the water running down into the Wetlands. It is old, enormous, and maintained with the seriousness dwarves reserve for stonework.",
			"It is also a target. Dark Iron dwarves have been caught probing it, and the garrison on the dam is not decorative. Breaking it would flood the lowlands and cripple Ironforge's eastern approach in one stroke.",
		},
	},
	{
		name = "Ironband's Excavation Site", parent = "Loch Modan", faction = "Alliance",
		hook = "An archaeological dig in southeastern Loch Modan, overrun by troggs.",
		lore = {
			"Prospector Ironband's team is excavating ancient ruins southeast of the Loch. Troggs have driven the workers from the site and taken the carved idols they uncovered.",
			"The idols seem to send the troggs berserk. Magmar Fellhew wants them recovered for study, while Ironband seeks more blastpowder to continue the excavation.",
		},
		readMore = { "Wowpedia: Ironband's Excavation Site", "Wowpedia: Excavation Progress Report" },
	},
	{
		name = "The Farstrider Lodge", parent = "Loch Modan", faction = "Alliance",
		hook = "A hunters' lodge on the loch's eastern shore, and the staging point against the ogres.",
		lore = {
			"The lodge is Ironforge's hunting and ranging base in Loch Modan, and the people here know the valley better than anyone. It is also the nearest organised force to the Mo'grosh Stronghold.",
			"The hunters' current preoccupation is that the ogres have become more coordinated than ogres normally bother to be.",
		},
	},
	{
		name = "Mo'grosh Stronghold", parent = "Loch Modan", faction = "Hostile",
		hook = "An ogre stronghold in northeastern Loch Modan.",
		lore = {
			"Mo'grosh Stronghold is a group of caves occupied by ogres in northeastern Loch Modan. Brutes, enforcers, shamans and mystics defend the stronghold.",
			"The ogres mine rare crystals. Dwarven investigators need one as an ingredient in a mixture that can disarm Dark Iron explosives.",
		},
		readMore = { "Wowpedia: Mo'grosh Stronghold", "Wowpedia: A Dark Threat Looms (5)" },
	},
	{
		name = "Silver Stream Mine", parent = "Loch Modan", faction = "Hostile",
		hook = "A worked-out silver mine turned storehouse, with kobolds all over the dwarves' tools.",
		lore = {
			"Silver Stream ran dry a long time ago, and the Miners' League turned it into a storage depot instead. Its crates are still down there. They hold good dwarven gear, and they hold the charged rift gems woven into a mage's first wizard robe: this mine is the only known source of those.",
			"Kobolds have moved in on the lot of it. Mountaineer Stormpike wants the League's gear out before his warriors tromp in and break things, and he is impatient for the order to clear the place, because the thought of kobold hands clawing around a dwarven mine turns his stomach.",
		},
		readMore = { "Wowpedia: Silver Stream Mine", "Wowpedia: Filthy Paws", "Wowpedia: Miners' League" },
	},
	{
		name = "Valley of Kings", parent = "Loch Modan", faction = "Alliance",
		hook = "Two carved kings standing over the locked gate to the Searing Gorge.",
		lore = {
			"The Valley of Kings is the south-western corner of Loch Modan, west of Stonesplinter Valley. The South Gate Pass clips a piece of it, but what the valley is really for is the road south into the Searing Gorge.",
			"The two kings are Madoran Bronzebeard and Khardros Wildhammer, and the statues were raised by their sons after both men were dead. They stand over the pass into the southlands, gone volcanic under Ragnaros by then, as a warning to anyone minded to attack the dwarven kingdoms and a reminder of the price the Dark Irons paid for trying.",
			"The gate itself stays shut. Mountaineer Pebblebitty keeps it and keeps the lever, and will not open it for anyone who has not satisfied her, a position she enjoys. She also has a history with Margol out in the Badlands, and she will tell you that any horn you bring her is a fake because she has seen the real one close up.",
		},
		readMore = { "Wowpedia: Valley of Kings", "Wowpedia: War of the Three Hammers", "Wowpedia: Mountaineer Pebblebitty" },
	},
	{
		name = "Grizzlepaw Ridge", parent = "Loch Modan", faction = "Contested",
		hook = "The bear hills above Thelsamar, and the one bear the Farstrider Lodge could not kill.",
		lore = {
			"Grizzlepaw Ridge runs through the hills south of Thelsamar, east of Stonesplinter Valley. It is held by grizzled and elder black bears, with cliff lurkers and mangy mountain boars among them.",
			"Ol' Sooty has his lair up here and he is the reason hunters come. The Farstrider Lodge went after him for a year and none of them had any luck. A younger hunter called Daryl tried his own hand against the bear and came away with the scar he still carries over his eye. Vyrin Swiftwind would like the head brought in, and says plainly that it would leave Daryl speechless for once.",
		},
	},
	{
		name = "North Gate Pass", parent = "Loch Modan", faction = "Contested",
		hook = "The upper of the two passes between Loch Modan and Dun Morogh.",
		lore = {
			"North Gate Pass runs through the north-west corner of the Loch and comes out in Dun Morogh, high in the mountains on the far side. It is the route most people take to and from the Wetlands, because it is the closest pass to the descent out of the Loch.",
			"The dwarves keep North Gate Outpost in the middle of it, and the trouble the garrison deals with is wildlife rather than anybody's army.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- REDRIDGE MOUNTAINS
-- ---------------------------------------------------------------------------

Zone{
	name = "Redridge Mountains", continent = EK, faction = "Alliance", levels = "15-25",
	hook = "A lakeside logging county with orcs in the ruined keep above it and no help coming.",
	lore = {
		"Redridge is a narrow strip of red-stone hills, forest and lake east of Elwynn: Stormwind's eastern frontier. The town of Lakeshire works timber and quarry stone, and the bridge over the lake is the only road through.",
		"The zone's problem is the Blackrock clan. Orcs out of Blackrock Mountain, under the warlord Gath'Ilzogg, have taken Stonewatch Keep, which was the fortress built specifically to stop this from happening. From there they press down on Lakeshire while Redridge gnolls raid the roads and the Tower of Ilgalar sits in the hands of a mage nobody trusts.",
		"Stormwind's response has been letters. Lakeshire's militia is holding a border with volunteers, a handful of guards and the kind of grim humour that comes from knowing exactly where you stand on the kingdom's list of priorities.",
	},
	didYouKnow = "The Blackrock clan here are remnants of the Old Horde that never went home and never surrendered, now mixed up in Blackrock Mountain's politics between Rend Blackhand's Dark Horde and the black dragonflight.",
	readMore = { "Wowpedia: Redridge Mountains" },
}

SubsOf("Redridge Mountains", {
	{
		name = "Lakeshire", faction = "Alliance", levels = "15-25",
		hook = "A lumber town on Lake Everstill whose bridge keeps getting destroyed.",
		lore = {
			"Lakeshire is Redridge's only real town: a mill, a quarry, an inn and a town hall, strung along the north shore of Lake Everstill. The bridge is the zone's lifeline and the orcs know it, so repairing the bridge is a recurring item of town business.",
			"The mayor's office spends its time writing to Stormwind about the orcs in Stonewatch and receiving polite acknowledgements.",
		},
	},
	{
		name = "Stonewatch", parent = "Redridge Mountains", faction = "Hostile",
		hook = "A captured human stronghold in Redridge, held by the Blackrock orcs.",
		lore = {
			"Stonewatch includes the keep and its nearby watchtower, above Stonewatch Falls. The Blackrock orcs have captured the stronghold from the humans of Lakeshire.",
			"Gath'Ilzogg holds the keep, while Morganth works from the Tower of Ilgalar. Once allies in the attack on Stonewatch, the warlock and the orcs are now enemies.",
		},
		readMore = { "Wowpedia: Stonewatch", "Wowpedia: The State of Lakeshire", "Wowpedia: Looking Further" },
	},
	{
		name = "Tower of Ilgalar", parent = "Redridge Mountains", faction = "Hostile",
		hook = "A mage tower in the eastern foothills, and its occupant commands the local gnolls.",
		lore = {
			"The tower stands in the eastern part of Redridge, and Morganth holds it. He was exiled from Stormwind's Mage Quarter for his use of dark magic and came out here to carry on with it.",
			"He is not suspected of anything. Lakeshire knows what he is doing: the Shadowhide gnoll clan takes his orders, Lieutenant Fangore leads them for him, and the pendants the gnolls carry are how he sends those orders. Magistrate Solomon has made aiding him a capital matter.",
			"Theocritus, the high mage of the Tower of Azora over in Elwynn, is his rival and watches him from a distance through a device called the Eye of Azora. Morganth keeps servants of his own in the tower, and a copy of Ur's treatise on shadow magic.",
		},
		readMore = { "Wowpedia: Tower of Ilgalar", "Wowpedia: Morganth", "Wowpedia: Solomon's Law" },
	},
	{
		name = "Lake Everstill", parent = "Redridge Mountains", faction = "Contested",
		hook = "The lake Redridge is built around, and the reason there is a town here at all.",
		lore = {
			"Everstill is fresh, deep and full of fish, and Lakeshire exists because of it. The lake also splits the zone, so control of the bridge is control of Redridge.",
			"Murlocs have established themselves on the shoreline, as murlocs do, and the fishermen have adapted.",
		},
	},
	{
		name = "Render's Valley", parent = "Redridge Mountains", faction = "Hostile",
		hook = "The orc-held valley in the south, named for the warchief who never accepted defeat.",
		lore = {
			"The valley is named for Rend Blackhand, son of the Horde's first warchief, who still styles himself warchief of the Dark Horde from Blackrock Spire. The orcs camped here answer to that chain of command.",
			"This is the staging ground for the Blackrock pressure on Lakeshire, and it sits uncomfortably close to the town.",
		},
	},
	{
		name = "Alther's Mill", parent = "Redridge Mountains", faction = "Hostile",
		hook = "An abandoned sawmill northeast of Lakeshire, full of spiders.",
		lore = {
			"Alther's Mill was part of Lakeshire's timber operation and nobody works it now. What is in it is spiders and dire condors, Chatter somewhere among them, and the people who come this way are mostly passing through towards Stonewatch.",
			"Stormwind's rogues have a use for the place that has nothing to do with timber. There is a lockbox up at the mill, and cracking it open is what earns a thief out of Lakeshire his certificate.",
		},
	},
	{
		name = "Three Corners", parent = "Redridge Mountains", faction = "Alliance",
		hook = "A guard post where Redridge, Elwynn and Duskwood meet.",
		lore = {
			"Three Corners watches the junction of three regions: strategically sensible, chronically understaffed. Traffic between Stormwind, Duskwood and Redridge passes through here.",
			"The handful of guards posted here are the thin seam holding the kingdom's southern map together.",
		},
	},
	{
		name = "Render's Camp", parent = "Redridge Mountains", faction = "Hostile",
		hook = "A Blackrock camp in Redridge's north-west, on the way out to the Burning Steppes.",
		lore = {
			"The camp sits in the north-western hills near the entrance to the Burning Steppes, and what is in it is not a raiding party. Blackrock renegades and outrunners with summoners, shadowcasters, trackers and champions behind them, and Kazon somewhere among the tents.",
			"The Dark Horde's interest in Redridge is the road. Through Redridge lies Elwynn, and through Elwynn lies Stormwind.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- DUSKWOOD
-- ---------------------------------------------------------------------------

Zone{
	name = "Duskwood", continent = EK, faction = "Alliance", levels = "18-30",
	hook = "A forest where the sun stopped rising, and the people who stayed formed a Night Watch.",
	lore = {
		"Duskwood was ordinary human farmland and woodland south of Elwynn, worked out of a town called Grand Hamlet. It is now permanently dark, wrapped in a mist that does not lift, and the trees have gone wrong.",
		"There is no single agreed cause. Necromancy practised in the region, the Scythe of Elune's passage through these woods, and the corruption bleeding out of Twilight Grove have all been blamed, and they may all be true at once. Whatever started it, the dead do not stay buried in Duskwood and the living have adapted.",
		"The adaptation is the Night Watch. Darkshire, which used to be Grand Hamlet, is defended by a volunteer watch that patrols the roads with lanterns and treats every grave as a problem waiting to happen. They are underfunded, overworked, and the only reason anyone still lives here.",
	},
	didYouKnow = "Twilight Grove in the heart of the forest is one of a handful of places where the Emerald Dream touches this world. Something is badly wrong with the one that guards it, and the corruption seeping out does not help the woods above.",
	readMore = { "Wowpedia: Duskwood", "Wowpedia: Night Watch" },
}

SubsOf("Duskwood", {
	{
		name = "Darkshire", faction = "Alliance", levels = "20-30",
		hook = "Grand Hamlet renamed for what became of it, held by lantern-light and stubbornness.",
		lore = {
			"This was Grand Hamlet, a prosperous market town. When the darkness settled and the dead started walking, the survivors renamed it Darkshire. No town in the kingdom has rebranded itself more bleakly.",
			"The town is run by the Night Watch and a town council with a deep suspicion of outsiders, magic and anything that happens after dark. They have earned all three. Lord Ello Ebonlocke is the mayor and Commander Althea Ebonlocke runs the Night Watch, and between them their authority here outweighs anything Stormwind sends.",
		},
	},
	{
		name = "Raven Hill", parent = "Duskwood", faction = "Contested",
		hook = "An abandoned village beside the graveyard that outlived it.",
		lore = {
			"Raven Hill was a working village until the woods turned. Its people left or died, and what remains is a shell next to a cemetery that is still very much in use, in the wrong sense.",
			"The Night Watch keeps a presence nearby because Raven Hill Cemetery is the single worst undead problem in the zone.",
		},
	},
	{
		name = "Raven Hill Cemetery", parent = "Duskwood", faction = "Hostile",
		-- The client reports this one simply as "The Cemetary", misspelling included.
		aliases = { "The Cemetary", "The Cemetery" },
		hook = "Duskwood's largest graveyard, and the reason the Night Watch exists.",
		lore = {
			"Generations of the county's dead are buried here, and in Duskwood that is a liability rather than a memorial. The necromancer Morbent Fel took an interest in the place and the consequences are still walking.",
			"Among them is Mor'Ladim, and he does not stay put. He walks a strange meandering circuit through the cemetery and out into the woods beyond it, attacking Watchmen on patrol and killing whoever else he meets. His grave is at Forlorn Rowe, out past the house on the hill, and he has not been in it for a long time. Commander Althea Ebonlocke has the job of dealing with him, and some of the Night Watch's strongest have been lost to him already.",
		},
		didYouKnow = "Mor'Ladim was Morgan Ladimore, a soldier of Grand Hamlet who went off to fight in Lordaeron and came home to a wasted county and no family left to find. He went mad, killed innocents, and when he understood what he had done he took his own life. The body did not stay down.",
	},
	{
		name = "Twilight Grove", parent = "Duskwood", faction = "Hostile",
		hook = "A green clearing in a dead forest, and a doorway into the Emerald Dream.",
		lore = {
			"Twilight Grove is one of the Great Trees' groves, a place where the Emerald Dream presses against the waking world. It should be the healthiest ground in Duskwood. It is not.",
			"A moonwell stands in the clearing and the ground around it is green, which nothing else in this county manages. The Nightmare presses through from the other side of the portal, and Nightbane worgen work the treeline. Druids who understand what they are looking at here do not stay long.",
		},
		readMore = { "Wowpedia: Twilight Grove", "Wowpedia: Emerald Dream" },
	},
	{
		name = "Vul'Gol Ogre Mound", parent = "Duskwood", faction = "Hostile",
		hook = "A basin in southern Duskwood, overrun by Splinter Fist ogres and named for their chief.",
		lore = {
			"The mound is a small basin in southern Duskwood, just south-west of where the road splits and runs on into Stranglethorn. The Splinter Fist ogres have all of it, under Zzarc' Vul, and the place is named after him. Humans lived in the basin once, as the ruined farmhouses still show.",
			"The walls are thick with ore, copper through to gold, and nobody is mining any of it. What the ogres do collect is other people's property: Abercrombie had a crate of tools and herbs taken off him and carried in here, and he wants it back.",
			"The Night Watch will not spend its own few members on the place and pays others to thin the ogres instead. Viktori Prism'Antras has a narrower interest and wants Zzarc' Vul's monocle for his research.",
		},
		readMore = { "Wowpedia: Vul'Gol Ogre Mound", "Wowpedia: Zzarc' Vul", "Wowpedia: Ogre Thieves" },
	},
	{
		name = "Manor Mistmantle", parent = "Duskwood", faction = "Contested",
		hook = "A haunted stead north of Darkshire, occupied by Stalvan Mistmantle.",
		lore = {
			"Manor Mistmantle lies north of Darkshire in Duskwood. Stalvan Mistmantle, a former schoolteacher now among the undead, inhabits the property with ghouls.",
			"The town's records connect his name to the schoolhouse in Moonbrook. Investigators in Darkshire are trying to piece together his past.",
		},
		readMore = { "Wowpedia: Manor Mistmantle", "Wowpedia: The Legend of Stalvan" },
	},
	{
		name = "Addle's Stead", parent = "Duskwood", faction = "Hostile",
		hook = "An abandoned farm in the south-west, haunted by the men who used it last.",
		lore = {
			"Addle's Stead sits in south-western Duskwood, south of Raven Hill and west of the Vul'Gol Ogre Mound, just off the road in from Westfall. It is one of several outlying farms the county lost when the dark came down.",
			"What walks there now are Forlorn Spirits, and the Night Watch takes them for Defias dead. The Brotherhood used the empty farm for its own business, and agents of theirs gathering at it is the last thing anybody reports happening here.",
		},
	},
	{
		name = "The Yorgen Farmstead", parent = "Duskwood", faction = "Hostile",
		hook = "An abandoned farm with worgen in the barn.",
		lore = {
			"The Yorgen place is another lost holding, and it has become one of the clearest signs that Duskwood's worgen population is not a rumour.",
			"They did not come down from Silverpine. The Carevin family in Darkshire will tell anybody who asks that the worgen in this forest were first found in the mine at Roland's Doom, in the south-east of the zone, and that they appeared there out of nowhere.",
		},
	},
	{
		name = "Tranquil Gardens Cemetery", parent = "Duskwood", faction = "Contested",
		hook = "Darkshire's graveyard, and the ghoul who stole Blind Mary's looking glass.",
		lore = {
			"The Tranquil Gardens lie a little south-east of Darkshire and the name has stopped applying. Its dead are up and walking, around a ruined church, though they are the weakest undead in Duskwood and the town has worse problems further out.",
			"The one in the cemetery worth knowing about is the Insane Ghoul. Blind Mary, whose house is just north of the graves, threw a looking glass out behind her barn after what she calls the incident, and the ghoul used to roam back there and is thought to have picked it up. Viktori Prism'Antras in Darkshire wants that glass: he and Cog are building a machine for looking at the stars and need a lens big enough.",
		},
		readMore = { "Wowpedia: Tranquil Gardens Cemetery", "Wowpedia: Look To The Stars", "Wowpedia: Blind Mary" },
	},
	{
		name = "Beggar's Haunt", parent = "Duskwood", faction = "Hostile",
		hook = "The eastern road out of Duskwood, where the worst of the woods collects.",
		lore = {
			"Beggar's Haunt is the stretch of road running toward the Deadwind Pass border, and the least patrolled ground in the zone.",
			"Travellers take it because it is the way to Stranglethorn and the south. The Night Watch recommends against it and provides no alternative.",
		},
	},
	{
		name = "The Darkened Bank", parent = "Duskwood", faction = "Contested",
		hook = "Duskwood's whole northern shore, with two refugees camped at the west end.",
		lore = {
			"The Darkened Bank runs the length of Duskwood's northern shore, from the far western edge of the zone east to the bridge into the Redridge Mountains. The water on the far side is Westfall at the western end and Elwynn along the rest, and swimming south out of Elwynn's south-western corner lands you on it.",
			"Sven Yorgen and Lars are camped at the western end with a fire going. They are refugees, they are the first people most adventurers meet in Duskwood, and what they hand out is work against the weaker things in the woods.",
		},
		readMore = { "Wowpedia: Darkened Bank", "Wowpedia: Sven Yorgen", "Wowpedia: Duskwood" },
	},
})

-- ---------------------------------------------------------------------------
-- WETLANDS
-- ---------------------------------------------------------------------------

Zone{
	name = "Wetlands", continent = EK, faction = "Contested", levels = "20-30",
	hook = "A drowned marsh below the dwarven dam, overlooked by the fortress where a Dragon Queen was chained.",
	lore = {
		"The Wetlands are what happens downhill from the Stonewrought Dam: a sprawl of marsh, mangrove and flooded lowland on Khaz Modan's western coast. Menethil Harbor at the river mouth is the Alliance's main port on this side of the world, named for Lordaeron's royal house.",
		"The zone's two powers are the Dragonmaw orcs and the dwarves who want them gone. The Dragonmaw clan holds the eastern highlands out of Dragonmaw Gates and Angerfang Encampment, and Dun Modr to the north is a contested wreck.",
		"Above it all sits Grim Batol. The Wildhammer dwarves founded it and then lost it to a curse rather than to an army. During the War of the Three Hammers the Dark Iron sorceress Modgud led the assault on the fortress, Khardros Wildhammer struck her down, and she laid the curse on the place as she died. The Wildhammers won the battle and could not live in what they had held. They went north to Aerie Peak instead.",
	},
	didYouKnow = "Nobody has gone into Grim Batol and come back with a useful report. The dwarves abandoned it, the Dark Irons abandoned it, and the Dragonmaw who used it are now scattered. Whatever is still in there has been left alone on purpose.",
	readMore = { "Wowpedia: Wetlands", "Wowpedia: Grim Batol", "Wowpedia: Demon Soul" },
}

SubsOf("Wetlands", {
	{
		name = "Menethil Harbor", faction = "Alliance", levels = "20-30",
		hook = "The Alliance's great western port, and the boat to everywhere.",
		lore = {
			"Menethil is the keystone of Alliance shipping: ships run from here to Theramore in Dustwallow Marsh and north to Auberdine in Darkshore. For anyone flying Alliance colours this is the main crossing between the two continents.",
			"The town is named for the Menethil line of Lordaeron, a courtesy from the days when the Alliance of Lordaeron held together. The fortress here has been attacked repeatedly by Dragonmaw orcs and holds because the dwarves built it properly.",
		},
	},
	{
		name = "Dun Modr", parent = "Wetlands", faction = "Hostile",
		hook = "A dwarven town at the Thandol Span, taken by the Dark Iron.",
		lore = {
			"Dun Modr guards the southern end of the Thandol Span, the great bridge linking Khaz Modan to the Arathi Highlands. Holding it means holding the only land route north.",
			"The dwarves lost it. Dark Iron dwarves hold the town now, and the Alliance's inability to retake a bridgehead this important says a great deal about how thinly stretched it is.",
		},
	},
	{
		name = "Grim Batol", parent = "Wetlands", faction = "Hostile",
		hook = "The sealed dwarven fortress where the Dragonmaw broke a Dragon Queen.",
		lore = {
			"Khardros Wildhammer led his clan north after the dwarven civil war and founded a kingdom inside this mountain. It did not last. Thaurissan's sorceress wife Modgud brought a Dark Iron army against it and laid a curse on the fortress before Khardros struck her down, and the curse stayed after she did not. The Wildhammers abandoned Grim Batol as unlivable and settled Aerie Peak in the Hinterlands.",
			"The Dragonmaw clan found it empty in the Second War and used it as a breeding prison. With the Demon Soul, an artefact Deathwing had made by draining the other dragonflights, they bound Alexstrasza the red Dragon Queen and sent her captive children against the Alliance as living siege engines. When the Demon Soul was destroyed the reds took their vengeance on the clan in full.",
			"The fortress is shut now. The dwarves will not reopen it, the red dragonflight watches the approaches, and the mountain itself feels wrong to anybody who gets close.",
		},
		readMore = { "Wowpedia: Grim Batol", "Wowpedia: Alexstrasza" },
	},
	{
		name = "Dragonmaw Gates", parent = "Wetlands", faction = "Hostile",
		hook = "The Dragonmaw clan's gate into the highlands, still flying a dead empire's banners.",
		lore = {
			"The Dragonmaw were the clan that enslaved the red dragonflight and they paid for it. After the Second War the survivors scattered, and a hard core of them holds this ground in the Wetlands highlands.",
			"They answer to nobody in Orgrimmar. Thrall's Horde disowned clans like this one, and that is why they are still here making trouble on their own account.",
		},
	},
	{
		name = "Dragonmaw Retreat", parent = "Wetlands", faction = "Hostile",
		era = "forever", spoiler = true,
		hook = "A Dragonmaw camp sitting on the road rather than up in the hills.",
		lore = {
			"The clan's other ground in this zone is a gate and a war camp in the highlands. This one is different: it straddles the road, where the traffic is, and the orcs on it are posted along the verges.",
			"Half of them are warlocks. Soulbinders throw corruption and call succubi up to stand with them, and the fighters beside them net you before they close. A clan that held a Dragon Queen with the Demon Soul still keeps people whose whole trade is binding things that do not want to be bound.",
			"The rest call themselves reclaimers and carry the clan's war banners down a public road. The Dragonmaw were broken after the Second War and the red flight collected on the debt. Nobody here has accepted that the clan is finished.",
		},
		readMore = { "Wowpedia: Dragonmaw clan", "Wowpedia: Grim Batol", "Wowpedia: Wetlands" },
	},
	{
		name = "The Drunken Dwarf", parent = "Wetlands", faction = "Alliance",
		era = "forever", spoiler = true,
		hook = "A watchtower on the Wetlands road that the Firebrews turned into a pub.",
		lore = {
			"Somebody's kingdom built an outlook here and then got tired of paying to keep anyone in it. The Firebrews took the building over, put a bar in the bottom of it, and have been running the place for a year or so.",
			"Agriel Firebrew holds it now and is clear that the coin was never the point. Word has got around regardless. Traders keep arriving who want their brew on her shelf or their jerky on her plates, and she is in no hurry about any of them.",
			"Read the neighbourhood before you judge the decision. This is the Wetlands: the road here runs between Dragonmaw camps and dwarven garrisons, and the Firebrews have taken a fortified tower off that road and left the door open to whoever walks up it.",
		},
		readMore = { "Wowpedia: Wetlands", "Wowpedia: Menethil Harbor" },
	},
	{
		name = "Angerfang Encampment", parent = "Wetlands", faction = "Hostile",
		hook = "A Dragonmaw war camp pressing west toward Menethil.",
		lore = {
			"Angerfang is the Dragonmaw's forward base against the Alliance port, and it stages raids rather than sitting still.",
			"The clan's goal appears to be Menethil Harbor itself. Taking it would cut the Alliance's sea link between the continents.",
		},
	},
	{
		name = "Whelgar's Excavation Site", parent = "Wetlands", faction = "Alliance",
		hook = "An Explorers' League dig in the marsh, reading titan script out of the mud.",
		lore = {
			"What Whelgar has pulled out of this site is a tablet. He calls it the Goaz Stone, it is written in titan script, and the translation breaks off in four places, so he keeps sending people back into the mud for the missing fragments.",
			"What he has read so far is enough. The text speaks of a divine plan and a doomed prophecy, and then of Old Gods chained beneath the land. He is pleased. The dig has also been overrun by raptors more than once. That is the usual career trajectory for an Explorers' League site.",
		},
	},
	{
		name = "Thelgen Rock", parent = "Wetlands", faction = "Hostile",
		hook = "A spider cave in the marsh, with volatile ore in its walls.",
		lore = {
			"Thelgen Rock is an extensive cavern running deep into the mountains of the southern Wetlands, north-west of Algaz Gate, and it is crawling with spiders. Cave stalkers and leech stalkers hold most of it, with the Leech Widow somewhere inside.",
			"The reason anybody goes in is in the walls. Incendicite is a rare ore, volatile enough that it is hard to handle without blowing yourself up, and Pilot Stonegear up at Steelgrill's Depot is convinced that smelted the right way it would make cannon shells worth having. He is content to let somebody else do the experimenting.",
		},
		readMore = { "Wowpedia: Thelgen Rock", "Wowpedia: Search for Incendicite" },
	},
	{
		name = "Ironbeard's Tomb", parent = "Wetlands", faction = "Contested",
		hook = "A dwarven crypt in the marsh, north-east of Menethil, full of oozes.",
		lore = {
			"The tomb sits west of the road to Dun Modr, in the north-central Wetlands, with a graveyard and a dwarf's statue beside the crypt, and grave moss over the lot of it. The dwarf the place is named for has outlasted his own story, and nothing out here says who Ironbeard was.",
			"Oozes have the crypt now, black and crimson and monstrous, and nobody brings their dead here any more. Sida still walks out from Menethil Harbor every week. On one of those visits the oozes came at her, she panicked and threw her bag at one, and it absorbed the bag whole. That bought her the moment she needed to get away. She would like the contents back and cannot tell one ooze from another.",
		},
	},
	{
		name = "The Lost Fleet", parent = "Wetlands", faction = "Contested",
		hook = "The wrecks of the Kul Tiras Third Fleet, with its crew still walking them.",
		lore = {
			"The hulls lie half in the water off the northern coast. They are the Third Fleet of Kul Tiras, the Doomed Fleet, burned and sunk on its last voyage by red dragons under orcish control.",
			"First Mate Fitzsimmons, off the Wave Mistress, is the only man of that fleet still breathing, and he is not the only one still walking. Cursed sailors and cursed marines crew the wrecks, First Mate Snellig among them, and Captain Halyndor walks his own ship, the Intrepid, with its strongbox still locked aboard.",
			"Bluegill murlocs have colonised the hulls and hammerhead sharks work the water around them. Battered footlockers still lie scattered through the shallows.",
		},
		readMore = { "Wowpedia: Lost Fleet", "Wowpedia: The Third Fleet", "Wowpedia: The Cursed Crew" },
	},
	{
		name = "Bluegill Marsh", parent = "Wetlands", faction = "Hostile",
		hook = "A murloc territory on the coast that the Alliance port would rather not have next door.",
		lore = {
			"The Bluegill murlocs hold the coastal marsh west of the main road and raid toward Menethil Harbor. They are organised enough to have a name and a hierarchy. Most murloc populations do not get that far.",
			"Menethil's garrison treats them as a permanent chore rather than a war. Mirelow is the one of them worth avoiding.",
			"The tide does the murlocs' collecting for them. Battered footlockers are strewn across this marsh by the dozen, along with half-buried barrels and broken crates, and cursed sailors and marines off the Lost Fleet wander in from the wrecks to the north.",
		},
	},
	{
		name = "Mosshide Fen", parent = "Wetlands", faction = "Hostile",
		hook = "Gnoll country in the eastern marsh, below the dwarven gate.",
		lore = {
			"The Mosshide gnolls hold the eastern fen in a scatter of camps, down towards the gate at Dun Algaz, and Gnawbone is the one they follow. Brutes, trappers, mystics and an alpha are what the camps hold.",
			"The complaint against them is not that they raid. They lived in the Wetlands quietly for years and have simply grown too numerous: they trample the fen flat, and they cut far more wood than they need for their fires. Rethiel the Greenwarden puts it as a matter of balance, and wants their numbers brought down and their firemaking tools taken off them.",
		},
	},
	{
		name = "Raptor Ridge", parent = "Wetlands", faction = "Hostile",
		hook = "A raptor-infested ridge in the eastern Wetlands.",
		lore = {
			"Raptor Ridge lies northwest of the Dragonmaw Gates in the eastern Wetlands. Raptors inhabit the ridge and its cavern. The rare Razormaw Matriarch can be encountered here.",
		},
		readMore = { "Wowpedia: Raptor Ridge", "Wowpedia: Razormaw Matriarch" },
	},
})

-- ---------------------------------------------------------------------------
-- HILLSBRAD FOOTHILLS
-- ---------------------------------------------------------------------------

Zone{
	name = "Hillsbrad Foothills", continent = EK, faction = "Contested", levels = "20-30",
	hook = "Green farm country where the orcs were kept in camps, and where Thrall grew up a gladiator.",
	lore = {
		"Hillsbrad was Lordaeron's southern farmland and one of the gentlest landscapes in the Eastern Kingdoms. After the Second War it became something uglier: the Alliance built internment camps across these hills to hold the defeated orcs, and Durnholde Keep above the fields was the headquarters of the whole system.",
		"Durnholde's commander, Aedelas Blackmoore, found an orc infant on the battlefield and raised him as a gladiator and a weapon. He named him Thrall. Thrall learned to read in Blackmoore's house, escaped with the help of a stablehand named Taretha Foxton, freed the camps, and became Warchief of a new Horde. Durnholde is a ruin now because he came back for it.",
		"The present conflict is simpler and meaner. Southshore is Alliance, Tarren Mill is Forsaken, they are a short walk apart, and both sides have been fighting over these fields continuously with no prospect of either winning.",
	},
	didYouKnow = "Thrall's name was Blackmoore's idea of a joke. He raised the orc who would unify the Horde, taught him strategy and literacy, and lost everything to it.",
	readMore = { "Wowpedia: Hillsbrad Foothills", "Wowpedia: Durnholde Keep", "Wowpedia: Thrall" },
}

SubsOf("Hillsbrad Foothills", {
	{
		name = "Southshore", faction = "Alliance", levels = "20-30",
		hook = "The Alliance's fishing town on the bay, permanently at war with the village up the road.",
		lore = {
			"Southshore is a working port on Baradin Bay and the Alliance's anchor in Hillsbrad. It has an inn, a dock and a garrison that exists because of Tarren Mill.",
			"The fighting between the two settlements is close to permanent. It is not a campaign with objectives so much as a grudge with infrastructure.",
		},
	},
	{
		name = "Tarren Mill", faction = "Horde", levels = "20-30",
		hook = "The Forsaken's foothold in Hillsbrad, and the other half of the oldest feud in the Eastern Kingdoms.",
		lore = {
			"Tarren Mill was a human village. The Forsaken took it and turned it into their forward position in Hillsbrad, complete with apothecary, inn and a standing garrison.",
			"The town's purpose is the war with Southshore. For a great many players on both sides, the fields between these two settlements are where the Alliance and Horde conflict stopped being theoretical.",
		},
	},
	{
		name = "Durnholde Keep", parent = "Hillsbrad Foothills", faction = "Hostile",
		hook = "The ruined headquarters of the orc internment camps, and the house where Thrall was raised.",
		lore = {
			"Durnholde was the centre of the Alliance's internment system and the seat of Aedelas Blackmoore, who ran it. The orcs held in the camps were kept in a lethargy nobody fully understood, broken and incurious, until Thrall's escape gave them something to follow.",
			"Thrall freed the camps, built an army and came back here. Blackmoore died at Durnholde and the keep was left a ruin. The Syndicate and assorted scavengers have had the run of it since.",
		},
		didYouKnow = "Taretha Foxton, the human woman who helped Thrall escape, was Blackmoore's servant and Thrall's only friend in that house. Blackmoore killed her for it.",
	},
	{
		name = "Dun Garok", parent = "Hillsbrad Foothills", faction = "Hostile",
		hook = "A dwarven garrison in the southern hills, still manned and still hostile to the Horde.",
		lore = {
			"Dun Garok is an Ironforge outpost holding the pass toward the Alterac Mountains. It predates the current war and has simply kept doing its job.",
			"Its mountaineers are a problem for anyone travelling the southern road in Horde colours, and the Forsaken at Tarren Mill consider it unfinished business.",
		},
	},
	{
		name = "Azurelode Mine", parent = "Hillsbrad Foothills", faction = "Hostile",
		hook = "A working Alliance mine south of Hillsbrad, and a target.",
		lore = {
			"Azurelode is worked, guarded and Alliance-held. Foreman Bonds has better than twenty miners down there, the veins are silver and tin, and the iron that comes out goes to Alliance armories.",
			"That last fact is why Tarren Mill knows the mine by name. The Forsaken read it out of the Hillsbrad town registry they stole, and what they want in the hills now is the foreman dead, his miners with him, and the Alliance left in no doubt about who did it.",
		},
	},
	{
		name = "Purgation Isle", parent = "Hillsbrad Foothills", faction = "Hostile",
		hook = "An island of condemned dead, and every one of them served the Light.",
		lore = {
			"Purgation Isle is a small spiral island off the south coast of the Hillsbrad Foothills, with a cemetery and a ruined scout tower on it. Nobody living holds it.",
			"What is on it is the dead: condemned paladins, clerics, monks and mages, human and dwarf, none of them at peace. Who condemned them, and what for, is not recorded. The name is not metaphorical.",
			"An ogre necromancer named Kormok made use of them, and by the accounts he enjoyed it. Raising the banished dead of a place like this is the sort of work that gets an ogre remembered.",
		},
	},
	{
		name = "Thoradin's Wall", parent = "Hillsbrad Foothills", faction = "Contested",
		hook = "The ancient wall Arathor built against the trolls, battered but still across the hills.",
		lore = {
			"Thoradin ordered the wall raised soon after Arathor was founded, to shield his people from Amani incursions. It separates the Arathi Highlands from the Hillsbrad Foothills and it is gigantic and badly damaged.",
			"The empire that raised it has been gone for millennia and the wall has not. Arathor built to last, whatever else it failed at.",
			"Somebody is still using it. The dwarves of Dun Garok have put a barracks up against the wall in south-eastern Hillsbrad, which the Horde at Tarren Mill treats as a standing provocation.",
		},
		didYouKnow = "Thoradin was the first human to unite the tribes into one nation. Every human kingdom, including Stormwind, descends from the empire he founded at Strom.",
	},
	{
		name = "Nethander Stead", parent = "Hillsbrad Foothills", faction = "Contested",
		hook = "An abandoned Hillsbrad farm, with gnolls in the fields and mushrooms growing in them.",
		lore = {
			"The stead lies east of Southshore and south of Tarren Mill, across the river, and nobody farms it any more. Mudsnout gnolls have it, along with their shamans, and this is the only ground in the world that tribe is found on.",
			"What grows in the fields now is giant white mushrooms. Apothecary Lydon wants six of them in Tarren Mill, for an elixir of agony he is building towards the Forsaken's next plague, and his own view of the gnolls is that at least they are good for something.",
		},
	},
	{
		name = "Hillsbrad Fields", parent = "Hillsbrad Foothills", faction = "Contested",
		hook = "The farmland between the two warring towns, and the most fought-over ground in the north.",
		lore = {
			"The fields are the open country between Southshore and Tarren Mill. On a map it is farmland. In practice it is the corridor both sides march through.",
			"There are still farmers here. They have become very good at reading which way the road traffic is going.",
		},
	},
	{
		name = "Southpoint Tower", parent = "Hillsbrad Foothills", faction = "Horde",
		hook = "A ruined tower on the Silverpine road, used by a Forsaken scout.",
		lore = {
			"Southpoint Tower stands at the western end of Hillsbrad Foothills, just south of the road to Silverpine Forest. Deathstalker Lesh is stationed here, watching Alliance activity.",
			"Lesh is surveying Hillsbrad and needs a message carried to High Executor Darthalia in Tarren Mill. The ruined tower serves as a reconnaissance post.",
		},
		readMore = { "Wowpedia: Southpoint Tower", "Wowpedia: Time To Strike" },
	},
	{
		name = "Lordamere Internment Camp", parent = "Hillsbrad Foothills", faction = "Hostile",
		hook = "One of the orc camps that is still standing, and still holding prisoners.",
		lore = {
			"Most of the internment camps emptied when Thrall freed them. This one did not finish emptying. The Syndicate runs it as a holding pen now, with no Alliance involvement at all.",
			"The camps are the Alliance's least defensible chapter, and the Horde has never let anyone forget them.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- ALTERAC MOUNTAINS
-- ---------------------------------------------------------------------------

Zone{
	name = "Alterac Mountains", continent = EK, faction = "Contested", levels = "30-40",
	hook = "A kingdom erased for treason, with its disinherited nobles now running the hills as bandits.",
	lore = {
		"Alterac was one of the seven human kingdoms and a founding member of the Alliance of Lordaeron. Its king, Aiden Perenolde, then sold the Alliance out: he fed intelligence to the Horde during the Second War and tried to cut a separate peace. When it came out, Alterac was dismantled and its nobility stripped of everything.",
		"What is left is the Syndicate. The dispossessed Alterac nobles and their retainers turned to organised crime, and they now operate across the Alterac Mountains, Hillsbrad and the Arathi Highlands. They are better dressed than ordinary bandits and no less dangerous.",
		"The mountains hold two other things worth knowing. Dalaran's crater is here, where the Violet Citadel was crushed by the demon Archimonde during the Legion's invasion. And Alterac Valley to the north is a live war: Stormpike dwarves digging for titan relics against the Frostwolf orcs who were already living there.",
	},
	didYouKnow = "The Frostwolf clan in Alterac Valley are Thrall's own clan, exiled to that valley by Gul'dan long before the Horde came through the portal. Drek'Thar leads them, and without them Thrall would never have learned what being an orc meant.",
	readMore = { "Wowpedia: Alterac Mountains", "Wowpedia: Syndicate", "Wowpedia: Alterac" },
}

SubsOf("Alterac Mountains", {
	{
		name = "Dalaran Crater", parent = "Alterac Mountains", faction = "Hostile",
		aliases = { "Dalaran", "Old Dalaran Ruins" },
		hook = "What is left of the Kirin Tor's city after a demon lord stepped on it.",
		lore = {
			"Dalaran was the magocracy, home of the Kirin Tor and the finest centre of arcane learning in the world. Khadgar, Jaina Proudmoore, Antonidas and Kel'Thuzad all studied in its Violet Citadel, and most of the archmages whose decisions shaped the last two wars with them.",
			"During the Legion's invasion, Archimonde destroyed it. The mages threw everything they had into a magical shield and he simply broke it and crushed the city. What remains is a crater under a dome.",
			"Kirin Tor are still on the ground outside it, and they are not only standing guard. Dalaran summoners and theurgists work the crater with elemental slaves bound to them, and nobody is in a position to question the liberty.",
			"The Kirin Tor has not disbanded. Its archmages are scattered and it has no city, but the order still considers itself responsible for magic in this world.",
		},
		didYouKnow = "Kel'Thuzad was a Kirin Tor archmage before he founded the Cult of the Damned. Dalaran expelled him for studying necromancy. He went to Northrend, found the Lich King, and brought back the plague that destroyed Lordaeron.",
		readMore = { "Wowpedia: Dalaran", "Wowpedia: Kirin Tor" },
	},
	{
		name = "Ruins of Alterac", parent = "Alterac Mountains", faction = "Hostile",
		hook = "The capital of a kingdom that was taken off the map for treason.",
		lore = {
			"This was Alterac's seat of government. The Alliance attacked the city after Perenolde's betrayal in the Second War. Its abandoned buildings now shelter the Crushridge ogres.",
			"Mug'thol leads the ogres here. Southshore offers bounties on the Crushridge and sends adventurers into the ruined capital to fight their warmongers.",
		},
		readMore = { "Wowpedia: Ruins of Alterac", "Wowpedia: Crushridge Warmongers", "Wowpedia: The Crown of Will" },
	},
	{
		name = "Strahnbrad", parent = "Alterac Mountains", faction = "Hostile",
		hook = "A ruined town in the Alterac Mountains, occupied by the Syndicate.",
		lore = {
			"Strahnbrad lies east of the ruins of Alterac and west of Chillwind Point. The Syndicate holds the abandoned town and keeps prisoners in its cells.",
			"Shortly before the Third War, Arthas defended Strahnbrad against Blackrock orcs. The town was one of his early battlefields while he still served Lordaeron.",
		},
		readMore = { "Wowpedia: Strahnbrad", "Wowpedia: The Defense of Strahnbrad (WC3 Human)", "Wowpedia: Gol'dir (quest)" },
	},
	{
		name = "Crushridge Hold", parent = "Alterac Mountains", faction = "Hostile",
		hook = "An ogre hold in the eastern mountains, squatting in Alterac's abandoned stonework.",
		lore = {
			"The Crushridge ogres moved into the vacuum left when Alterac was dissolved, and they have been fighting the Syndicate for the hills ever since. Lo'Grosh is the one of them worth knowing about, and the hold's maulers and mages are harder going than ogres usually are.",
			"The hill is also a mine, and iron, mithril, gold, silver and truesilver all come out of this ground in quantity, and a goblin named Rizz Loosebolt sells engineering supplies in the middle of an ogre hold rather than miss the trade.",
			"Ogres taking over a dead kingdom's buildings is a recurring image in the Eastern Kingdoms. They rarely maintain the plumbing.",
		},
	},
	{
		name = "Sofera's Naze", parent = "Alterac Mountains", faction = "Hostile",
		hook = "A Syndicate camp on one of the four ridges above Hillsbrad.",
		lore = {
			"The Syndicate holds Sofera's Naze. Southshore has identified this camp and the one at Corrahn's Dagger as positions held by the thieves and their leaders, nobles of the fallen kingdom of Alterac.",
		},
		readMore = { "Wowpedia: Sofera's Naze", "Wowpedia: Syndicate Assassins" },
	},
	{
		name = "Gavin's Naze", parent = "Alterac Mountains", faction = "Contested",
		hook = "The last of the four named fingers of high ground above Hillsbrad, and the one nobody took.",
		lore = {
			"Four ridges run down out of these mountains and stand out over Hillsbrad, and the game counts them in order: Sofera's Naze, Corrahn's Dagger, the Headland, and this one last. A naze is a headland, so two of the four are named for what all four are.",
			"Three of them carry a person's name and not one of those people is recorded anywhere. Alterac was dissolved after the Second War and its archives went with it, so the hills keep the names of Sofera, Corrahn and Gavin and nothing explains any of them.",
			"The Syndicate took Sofera's Naze and Corrahn's Dagger, the Crushridge ogres took the holds further east, and this one is the most defensible of the four. Nothing is on it. The mountain lions have it.",
		},
		didYouKnow = "One of those lions is Araga, who has a coat no other cat in the world shares. She does not roam: she holds one spot up here among the ordinary mountain lions, and she is rarely there when anybody looks. No animal in the Eastern Kingdoms is harder for a hunter to find, never mind tame.",
		readMore = { "Wowpedia: Gavin's Naze", "Wowpedia: Alterac Mountains" },
	},
	{
		name = "Chillwind Point", parent = "Alterac Mountains", faction = "Contested",
		hook = "A small rise on the eastern edge of the mountains, with a troll ruin on it.",
		lore = {
			"Chillwind Point is a low rise at the far eastern edge of the Alterac Mountains, and what stands on it is a small ancient troll ruin. The name comes from the cold winds that come down the nearby ravine out of the Western Plaguelands to the north. This pass was part of Lordaeron once.",
			"Bath'rah the Windwatcher lives up here, a jungle troll who is friendly to anyone who climbs it. The rest of this region does not offer that.",
			"It is not the Alliance position people take it for. Chillwind Camp, the outpost holding the road into the Plaguelands, is a separate place to the north and the confusion is easily made.",
		},
		readMore = { "Wowpedia: Chillwind Point", "Wowpedia: Bath'rah the Windwatcher", "Wowpedia: Chillwind Camp" },
	},
	{
		name = "Slaughter Hollow", parent = "Alterac Mountains", faction = "Hostile",
		hook = "A Crushridge ogre mound in the Alterac Mountains, with a caged gnome trading inside it.",
		lore = {
			"Slaughter Hollow is an ogre mound, a cave deep in the Alterac Mountains, and the Crushridge hold it. Brutes and ordinary ogres move about inside, and the walls carry iron, silver, gold, mithril and truesilver.",
			"Rizz Loosebolt is in there in a cage. He is a gnome, the ogres took him, and he sells engineering supplies to anyone who gets far enough in to reach him.",
		},
		readMore = { "Wowpedia: Slaughter Hollow", "Wowpedia: Crushridge", "Wowpedia: Rizz Loosebolt" },
	},
	{
		name = "Growless Cave", parent = "Alterac Mountains", faction = "Contested",
		hook = "A yeti cave in the Alterac Mountains, sheltering a ceremonial flame.",
		lore = {
			"Mountain yeti inhabit Growless Cave. Inside stands the Flame of Uzel, one of three ceremonial pyres created by Helcular for his ritual.",
			"The elusive yeti Frostmaw is also sought by hunters in these mountains.",
		},
		readMore = { "Wowpedia: Growless Cave", "Wowpedia: Helcular's Revenge (2)", "Wowpedia: Frostmaw (quest)" },
	},
})

-- ---------------------------------------------------------------------------
-- ARATHI HIGHLANDS
-- ---------------------------------------------------------------------------

Zone{
	name = "Arathi Highlands", continent = EK, faction = "Contested", levels = "30-40",
	hook = "Where human civilisation began, now a windswept ruin fought over by ogres, bandits and the Horde.",
	lore = {
		"Every human kingdom in the world traces back to this ground. Thoradin united the scattered human tribes here and founded Arathor, with its capital at Strom. Arathor fought the Amani trolls to a standstill with high elven help, raised Thoradin's Wall, and then broke apart as its people spread out and founded the seven kingdoms.",
		"Strom became Stromgarde, and Stromgarde held on longer than most. It has now collapsed too. The city is a three-way battlefield between the Syndicate, the Boulderfist ogres, and the remnant of its own garrison, which holds a few districts around Prince Galen Trollbane. Thoras Trollbane is dead and Galen is his son. The Alliance holds a single outpost at Refuge Pointe and little else.",
		"The Horde is here too, at Hammerfall in the east. Those are orcs freed from the internment camps who settled where Orgrim Doomhammer, the Horde's second warchief, was killed. They have made it a permanent holding.",
	},
	didYouKnow = "The Trollbane line gave the Alliance one of its great Second War commanders, Danath Trollbane, who went through the Dark Portal with the Alliance Expedition and never came back. Stromgarde has been running out of Trollbanes ever since.",
	readMore = { "Wowpedia: Arathi Highlands", "Wowpedia: Stromgarde", "Wowpedia: Arathor" },
}

SubsOf("Arathi Highlands", {
	{
		name = "Stromgarde Keep", parent = "Arathi Highlands", faction = "Hostile",
		hook = "The former capital of Arathor, divided between three warring occupants.",
		lore = {
			"Stromgarde is built on Strom, Thoradin's capital and the birthplace of human nationhood. It was one of the kingdoms of the Alliance of Lordaeron, but its capital has fallen into ruin.",
			"The Syndicate, the Boulderfist ogres and Stromgarde's remaining soldiers each hold part of the city. Captain Nials describes a stalemate in which her own forces dwindle while their enemies grow.",
			"Southshore is sending supplies, but Syndicate positions between the two towns make delivery difficult. The defenders need the route cleared as well as the city reclaimed.",
		},
		readMore = { "Wowpedia: Stromgarde Keep", "Wowpedia: Northfold Manor (Classic)" },
	},
	{
		name = "The Sanctum", parent = "Arathi Highlands", faction = "Alliance",
		aliases = { "Sanctum" },
		hook = "The chapel inside Stromgarde Keep, and the stair down to the Trollbane crypt.",
		lore = {
			"Past the Church of the Holy Light's chapel in Stromgarde there is an inner room, and under it the Trollbane family crypt. A graveyard lies alongside the church. Stromgarde Soldiers hold this part of the city.",
			"Prince Galen Trollbane keeps to the chapel. He is what remains of the royal line: his father Thoras is dead, the kingdom came apart, and Galen holds a church and the ground immediately around it while the Syndicate and the Boulderfist ogres divide up the rest.",
			"Thoras was the last king here, and he carried a line that ran back to Thoradin and the founding of Arathor. He was a founding member of the Alliance of Lordaeron and he took Stromgarde back out of it, over the orcs in the internment camps: he wanted every one of them executed, argued it bitterly with Terenas, who was a close friend, and withdrew when Lordaeron refused. The crypt under this floor is where that family is kept.",
		},
		readMore = { "Wowpedia: Stromgarde Keep", "Wowpedia: Thoras Trollbane", "Wowpedia: Arathor" },
	},
	{
		name = "Refuge Pointe", faction = "Alliance", levels = "30-40",
		hook = "The Alliance's last outpost in the Highlands, propping up a kingdom it cannot save.",
		lore = {
			"Refuge Pointe is a fortified camp on the road, holding the Alliance presence in Arathi. It supports the Stromgarde loyalists and shelters refugees from the city.",
			"It is a holding action and everyone there knows it. The resources needed to retake Stromgarde are not coming.",
		},
	},
	{
		name = "Hammerfall", faction = "Horde", levels = "30-40",
		hook = "An orc settlement raised where Orgrim Doomhammer fell.",
		lore = {
			"Hammerfall is named for Orgrim Doomhammer, who died here. This was an internment camp, and Doomhammer was killed during its liberation, run down by a charging knight while Thrall's diversion covered the orcs' withdrawal. Doomhammer had led the Horde through the whole of the Second War after killing Blackhand for the warchief's title.",
			"The settlement is a Horde statement: this ground is theirs now, in the birthplace of human civilisation, and the Alliance can do nothing about it.",
		},
		didYouKnow = "Doomhammer gave Thrall the title of Warchief with his last breath, and his black armour and the Doomhammer itself with it. The hammer is his own family's, not the Frostwolves': Orgrim was Blackrock clan, and he inherited it from his father.",
	},
	{
		name = "Boulderfist Hall", parent = "Arathi Highlands", faction = "Hostile",
		hook = "An ogre stronghold east of Thandol Span.",
		lore = {
			"Boulderfist Hall lies in southern Arathi Highlands, east of Thandol Span. Boulderfist ogres occupy its caves.",
			"Kor'gresh Coldrage has acquired a wand belonging to Trelane and uses blasts of ice to keep his fellows in line. Skuerto at Refuge Pointe wants the stolen wand recovered.",
		},
		readMore = { "Wowpedia: Boulderfist Hall", "Wowpedia: Wand over Fist" },
	},
	{
		name = "Witherbark Village", parent = "Arathi Highlands", faction = "Hostile",
		hook = "A forest troll village in southeastern Arathi, allied with the nearby ogres.",
		lore = {
			"Witherbark Village stands around a small lake in the southeastern Arathi Highlands. Trolls occupy the settlement and the cave behind it.",
			"The Witherbark and the Boulderfist ogres are working together against Hammerfall. Drum Fel recruits adventurers to strike at the trolls south of the outpost.",
		},
		readMore = { "Wowpedia: Witherbark Village", "Wowpedia: Call to Arms (1)" },
	},
	{
		name = "Thandol Span", parent = "Arathi Highlands", faction = "Contested",
		hook = "The dwarven bridge chain linking Khaz Modan to the north, and a strategic necessity.",
		lore = {
			"The Thandol Span is a series of enormous dwarven bridges across the chasm between the Arathi Highlands and the Wetlands. It is the only land route between Khaz Modan and the northern kingdoms.",
			"Both ends have been contested. Dark Iron dwarves have damaged sections of it deliberately, and holding the span is a permanent concern for Ironforge.",
		},
	},
	{
		name = "Go'Shek Farm", parent = "Arathi Highlands", faction = "Horde",
		hook = "A Horde-held farm in eastern Arathi, watched by Alliance investigators.",
		lore = {
			"Orcs and Forsaken occupy Go'Shek Farm near Witherbark Village. Hammerfall grunts guard the farm, where Apothecary Jorell conducts alchemical research.",
			"Alliance agents investigate the Forsaken activity here and its connection to a courier travelling toward Tarren Mill.",
		},
		readMore = { "Wowpedia: Go'Shek Farm", "Wowpedia: Hints of a New Plague? (2)", "Wowpedia: Hints of a New Plague? (3)" },
	},
	{
		name = "Faldir's Cove", parent = "Arathi Highlands", faction = "Contested",
		hook = "A cove under the cliffs with a treasure hunt stranded in it.",
		lore = {
			"Faldir's Cove is a sheltered beach on the southern coast, reachable only by a difficult descent. A Blackwater Raiders expedition out of Booty Bay came here after a sunken elven treasure and brought three ships in to lift it.",
			"Two of them went onto the reef. The Spirit of Silverpine and the Maiden's Folly are on the bottom, the Daggerspine naga killed the crews who made it into the water, and what is left of the expedition is camped on the sand with the naga massing offshore.",
		},
	},
	{
		name = "Circle of Inner Binding", parent = "Arathi Highlands", faction = "Contested",
		hook = "The strongest binding stone in Arathi, guarded by earth elementals.",
		lore = {
			"The Circle of Inner Binding lies in southern Arathi Highlands, near Stromgarde Keep. Rumbling Exiles surround the Stone of Inner Binding.",
			"It is the strongest of the four binding stones. Opening it requires keys from the other three circles.",
		},
		readMore = { "Wowpedia: Circle of Inner Binding", "Wowpedia: Stones of Binding" },
	},
	{
		name = "Northfold Manor", parent = "Arathi Highlands", faction = "Hostile",
		hook = "A Stromgarde farm the Syndicate moved into.",
		lore = {
			"Northfold Manor was a Stromgarde farm out on the northwestern edge of the Highlands. The Syndicate hold it now, which puts dispossessed Alterac nobility in a house it never owned and never lost.",
			"They are not only squatting in it. A troll shaman followed the residual traces of demonic summoning to this manor and found an amulet of bloodstone on the ground, the sort used to help a summoning along.",
		},
	},
	{
		name = "Dabyrie's Farmstead", parent = "Arathi Highlands", faction = "Alliance",
		hook = "A human farm in northern Arathi, guarded by its own militia.",
		lore = {
			"The Dabyrie family still farms this land in the northern Arathi Highlands. Labourers work the fields and militia guard the farmstead.",
			"Genavie Callow bears a bitter grudge against the family. She accuses them of stealing the few precious belongings she had left after the plague and seeks revenge.",
		},
		readMore = { "Wowpedia: Dabyrie's Farmstead", "Wowpedia: To Steal From Thieves" },
	},
	{
		name = "Drywhisker Gorge", parent = "Arathi Highlands", faction = "Hostile",
		hook = "A kobold-held gorge and cave in eastern Arathi.",
		lore = {
			"Drywhisker Gorge cuts into the mountains near Hammerfall. Drywhisker kobolds inhabit the cave at its end, where a crystal shard allows Myzrael to speak with the surface world.",
			"The cave also contains bloodstone ore. Krazek in Booty Bay seeks samples from miners willing to make the journey.",
		},
		readMore = { "Wowpedia: Drywhisker Gorge", "Wowpedia: The Princess Trapped", "Wowpedia: Favor for Krazek" },
	},
})

-- ---------------------------------------------------------------------------
-- STRANGLETHORN VALE
-- ---------------------------------------------------------------------------

Zone{
	name = "Stranglethorn Vale", continent = EK, faction = "Contested", levels = "30-45",
	hook = "A jungle grown over a fallen troll empire, with a goblin port at the bottom of it.",
	lore = {
		"Stranglethorn was the heart of the Gurubashi Empire, one of the great troll civilisations. At its height it held most of the southern continent. It broke apart in civil war after its priests brought something terrible into the world: Hakkar the Soulflayer, a blood god the Gurubashi summoned and then had to fight to contain.",
		"Its fragments are still here and still fighting each other. Bloodscalp and Skullsplitter hold opposite ends of the jungle and hate each other more than they hate outsiders. Zul'Kunda, Zul'Mamwe and the great temple of Zul'Gurub are overgrown but not empty.",
		"On top of all this sits Booty Bay, a free port run by the Blackwater Raiders and the goblin Baron Revilgaz, where Alliance and Horde do business because goblins do not care who pays. Add Nesingwary's big-game hunters, the Venture Company stripping the jungle for timber, and a mad colonel's jungle troops, and Stranglethorn is the busiest contested ground in the world.",
	},
	didYouKnow = "The Gurubashi did not worship Hakkar so much as summon him and then realise what they had done. The priests who called him up were driven out, and their descendants, the Atal'ai, are still trying to bring him back.",
	readMore = { "Wowpedia: Stranglethorn Vale", "Wowpedia: Gurubashi Empire", "Wowpedia: Hakkar the Soulflayer" },
}

SubsOf("Stranglethorn Vale", {
	{
		name = "Booty Bay", faction = "Neutral", levels = "35-45",
		hook = "A goblin free port where the Alliance and Horde trade because nobody is allowed to fight.",
		lore = {
			"Booty Bay is built into the cliffs at the southern tip of Stranglethorn and run by Baron Revilgaz and the Blackwater Raiders. It is neutral ground, enforced by bruisers who will throw anyone who starts something off the dock.",
			"The neutrality is commercial, not principled. Goblins discovered long ago that selling to both sides of a war is more profitable than joining one, and the Steamwheedle Cartel has built a small empire on that insight.",
			"The port runs a boat to Ratchet in the Barrens. In few other places is cross-faction travel just a ticket purchase.",
		},
		didYouKnow = "The Steamwheedle Cartel's neutrality is backed by force. Cartel ports have been known to turn on customers who threatened the business, and Booty Bay's bruisers are not for show.",
	},
	{
		name = "Grom'gol Base Camp", faction = "Horde", levels = "30-40",
		hook = "The Horde's beachhead in the jungle, named for Grom Hellscream.",
		lore = {
			"Grom'gol is a palisaded Horde camp on the eastern coast, linked to Orgrimmar and Undercity by zeppelin. It is the Horde's only real foothold in the southern Eastern Kingdoms.",
			"The name honours Grom Hellscream, chieftain of the Warsong clan, who drank the demon blood first and later killed the pit lord Mannoroth to free the orcs from it, dying in the act. The Horde's freedom from the Legion's corruption was bought with his life.",
		},
		didYouKnow = "Grom Hellscream's death at Ashenvale broke the blood curse on his entire race. Thrall was there.",
	},
	{
		name = "Rebel Camp", faction = "Alliance", levels = "30-38",
		hook = "An Alliance camp of soldiers who broke with a colonel who went mad in the jungle.",
		lore = {
			"The Rebel Camp is manned by troops who served under Colonel Kurzen and deserted when it became clear he had lost his mind. They are now fighting their former commander's forces.",
			"Kurzen was sent into Stranglethorn on Stormwind's business and something in the jungle, or in the trolls' influence, took him. His loyalists hold a compound in the interior.",
		},
	},
	{
		name = "Kurzen's Compound", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "A Stormwind expedition's base, held by the half of it that stayed loyal.",
		lore = {
			"The compound sits east of the Rebel Camp and was built by Colonel Kurzen's expedition on Stormwind's business. Kurzen lost his mind in the jungle, part of his force deserted over it, and the two halves have been killing each other since. He is still in here.",
			"What holds the ground is his own army turned jungle warband: commandos and jungle fighters, medicine men, headshrinkers, witch doctors and a shadow hunter, with war panthers and war tigers penned alongside them. A lumber mill runs at the front and the fighters keep their equipment in a stockpile at the back.",
			"Bookie Herod runs a book in the middle of it and keeps written records of it. That is its own comment on the state of discipline out here.",
		},
		readMore = { "Wowpedia: Kurzen's Compound", "Wowpedia: Colonel Kurzen", "Wowpedia: Rebel Camp" },
	},
	{
		name = "Zul'Gurub", parent = "Stranglethorn Vale", faction = "Hostile", levels = "60",
		hook = "The Gurubashi capital, where the Atal'ai are summoning their blood god back.",
		lore = {
			"Zul'Gurub was the heart of the Gurubashi Empire and it is the largest troll ruin in the world. The city was abandoned after the war against Hakkar tore the empire apart.",
			"It is not abandoned now. The Atal'ai priests, exiled millennia ago for calling Hakkar in the first place, have returned and are working to bring him fully into the world. The Zandalari, the trolls' oldest tribe and the keepers of their history, consider this a catastrophe and are recruiting outsiders to stop it.",
			"That the Zandalari are asking Alliance and Horde adventurers for help tells you how badly they expect this to go.",
		},
		readMore = { "Wowpedia: Zul'Gurub", "Wowpedia: Zandalar Tribe" },
	},
	{
		name = "Gurubashi Arena", parent = "Stranglethorn Vale", faction = "Contested",
		hook = "A troll fighting pit on the coast, now a free-for-all with a prize chest.",
		lore = {
			"The arena is Gurubashi construction, built for combat and standing on the west coast of the empire's own vale. Jungle stalkers have the ground around it, and Tethis works the rocks above.",
			"It has been repurposed. Short John Mithril runs the event now, and what he runs it with is a chest that opens for whoever is left standing. One trinket out of it buys the title of arena master, and twelve buys grandmaster of the Gurubashi Arena. He is glad of the blood it took.",
		},
	},
	{
		name = "Nesingwary's Expedition", parent = "Stranglethorn Vale", faction = "Neutral",
		hook = "A dwarf's hunting camp, dedicated to shooting the largest animals in the jungle.",
		lore = {
			"Hemet Nesingwary is a dwarven big-game hunter of some renown, and his Stranglethorn expedition is after the jungle's tigers, panthers and raptors.",
			"He is not here for lore, conservation or the Alliance. He is here because the animals are big. Ajeck Rouack and Barnil Stonepot hunt alongside him, and each of them wants a different trophy off the same jungle.",
		},
	},
	{
		name = "Ruins of Zul'Kunda", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "The Bloodscalp capital on the northern coast, built on Gurubashi stonework.",
		lore = {
			"Zul'Kunda is one of the old Gurubashi cities and the Bloodscalp tribe has it, so they are the empire's descendants squatting in their own ancestors' architecture. Their headhunters work this coast and the ruins of Zuuldaia along it.",
			"Gan'zulah is the chief and Nezzliok is his witchdoctor, and both of them sit deep inside the ruins. Between them they know what happened to a Darkspear child the tribe took, and that is why Grom'gol keeps a cauldron and a standing interest in their heads.",
			"The Bloodscalp are the northern power in the jungle and the Skullsplitter are the southern one, and the two are hereditary enemies. The feud is older than any human kingdom and neither tribe will say a useful word about the other without being paid in the other's skulls.",
		},
	},
	{
		name = "Ruins of Zul'Mamwe", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "The Skullsplitter seat, in the hills south of the Mosh'Ogg mound.",
		lore = {
			"Zul'Mamwe is another reoccupied Gurubashi ruin, south of the Mosh'Ogg ogre mound and ringed by mountains on every side but the north. Ana'thek is the chieftain, cruel enough that the Bloodscalp chief uses the word, and the tribe keeps a pile of trophy skulls here as it does at Balia'mah and Ziata'jai.",
			"The Skullsplitter are the Bloodscalp's mirror image and their hereditary enemy. Those skulls are currency in that quarrel: a Bloodscalp will trade what he knows for three of them, so that his spirit has slaves in the Nether.",
		},
	},
	{
		name = "Mosh'Ogg Ogre Mound", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "An ogre stronghold in eastern Stranglethorn Vale.",
		lore = {
			"Mosh'Ogg ogres occupy the mound in eastern Stranglethorn Vale. Deep inside, the ogre mage Mai'Zoth holds a powerful relic known as the Mind's Eye.",
			"A troll who knew Mai'Zoth when the Darkspears lived in the vale warns that the relic could make his already formidable magic stronger.",
		},
		readMore = { "Wowpedia: Mosh'Ogg Ogre Mound", "Wowpedia: The Mind's Eye (Horde)" },
	},
	{
		name = "Venture Co. Base Camp", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "A goblin strip mine in the jungle, run with no regard for anything.",
		lore = {
			"The Venture Company is the goblin cartel that does not bother with neutrality or reputation. Where the Steamwheedle Cartel sells to everyone, Venture Co. takes.",
			"What it is taking here is metal. The camp is a strip mine with a foreman, surveyors and tinkerers on it and iron, silver and gold cut out of the ground all around, and the Skullsplitter trolls whose jungle this is are on the slope above. The same firm is tearing up Mulgore and the Barrens on the other continent. Goblin enterprise at its least charming.",
		},
	},
	{
		name = "Jaguero Isle", parent = "Stranglethorn Vale", faction = "Contested",
		hook = "An island off the southern coast, with a chained troll princess and the ape who chained her.",
		lore = {
			"Jaguero is a small island south of Booty Bay, reachable only by swimming. It is isolated enough to have its own ecology and its own problems.",
			"Princess Poobah is on it, and she is not shipwrecked. King Mukla of the Skymane keeps her there in a shackle, he commands the beasts of the island, and the key to the chain is on him. She has got word out in a bottle and offers whoever frees her a place among her own tribe.",
		},
	},
	{
		name = "The Cape of Stranglethorn", parent = "Stranglethorn Vale", faction = "Contested",
		hook = "The southern reaches of Stranglethorn Vale, around Booty Bay.",
		lore = {
			"The cape forms the southern end of Stranglethorn Vale. Booty Bay shelters within its coast, while the jungle contains old troll ruins and the settlements of hostile bands.",
			"The Crystal Shore and the Ruins of Aboraz lie along this coast. Zanzil the Outcast and his followers inhabit Aboraz and the nearby ruins of Jubuwal.",
		},
		readMore = { "Wowpedia: The Cape of Stranglethorn", "Wowpedia: Saving Yenniku (Classic)", "Wowpedia: Zanzil's Secret (Classic)" },
	},
	{
		name = "Lake Nazferiti", parent = "Stranglethorn Vale", faction = "Contested",
		hook = "The big lake in northern Stranglethorn, with a Venture Company camp on its shore.",
		lore = {
			"Nazferiti is the largest fresh water in the vale, up in the north of the zone, and the Venture Company has its base camp on the shore. Geologists, mechanics and lumberjacks work out of it under a workboss, with Foreman Cozzle in the house.",
			"What the goblins have out on the lake is shredders, and those shredders have been fitted with a new model of fuel regulator. The Mirage Raceway would like the blueprints. The foreman keeps them in his house under lock and key, and he has turned out to be cleverer than the goblin who sent you expected.",
			"The water is no friendlier than the camp. There are snapjaw crocolisks and sharptooth frenzies in it, and lashtail raptors and mistvale gorillas come down to drink at it.",
		},
	},
	{
		name = "The Stockpile", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "The cave at the back of Kurzen's Compound, where his best troops are kept.",
		lore = {
			"The Stockpile is a cave deep at the back of Kurzen's Compound, and Kurzen keeps his special forces in it: commandoes and headshrinkers rather than the regular troops outside.",
			"Sergeant Yohwa of the rebels, who served with many of them, says plainly that they are skilled, loyal and cruel, and that going in after them is no easy task. When they are not in the cave they are out in the wilderness killing her people.",
		},
		readMore = { "Wowpedia: Stockpile", "Wowpedia: Special Forces", "Wowpedia: Kurzen's Compound" },
	},
})

-- ---------------------------------------------------------------------------
-- BADLANDS
-- ---------------------------------------------------------------------------

Zone{
	name = "Badlands", continent = EK, faction = "Contested", levels = "35-45",
	hook = "A dead red desert sitting on top of the vault where the dwarves learned they were built, not born.",
	lore = {
		"The Badlands are a wasteland of red rock and dust in the middle of Khaz Modan. They were not always like this. Something stripped this land down to bedrock, and the leading theory among the Explorers' League involves the titans' terraforming rather than any recent war.",
		"What makes the zone matter is Uldaman. It is a titan vault, sealed for most of history, and the dwarves broke into it. Inside they found the Discs of Norgannon and the record of their own creation: dwarves are descended from the earthen, beings the titans shaped out of living stone, who were later changed into flesh by a curse. Ironforge's entire modern self-understanding comes out of this hole in the ground.",
		"Everyone else wants it too. The Dark Iron dwarves hold Angor Fortress nearby, the black dragonflight has a presence at Lethlor Ravine, and the Horde maintains Kargath on the western edge. Uldaman is the most contested archaeological site in the world.",
	},
	didYouKnow = "The earthen were also the ancestors of the troggs. Of everything the digs turned up, Ironforge finds that hardest to discuss. Troggs are what the titans' work looked like before they got it right.",
	readMore = { "Wowpedia: Badlands", "Wowpedia: Uldaman", "Wowpedia: Earthen" },
}

SubsOf("Badlands", {
	{
		name = "Kargath", faction = "Horde", levels = "35-45",
		hook = "The Horde's dusty outpost in Khaz Modan, named for an orc who cut off his own hand.",
		lore = {
			"Kargath is the Horde's base in the Badlands, watching the dwarves and the Dark Irons and keeping a claim on the region. It is a hard posting in a zone with no water and no shade.",
			"The name honours Kargath Bladefist, chieftain of the Shattered Hand clan. He cut off his own hand and put a blade in its place, and both his name and his clan's come from that.",
		},
	},
	{
		name = "Uldaman", parent = "Badlands", faction = "Hostile", levels = "35-45",
		hook = "A titan vault holding the record of how the dwarves were made.",
		lore = {
			"Uldaman is one of the titans' installations, built to house their work on this world and sealed afterwards. The dwarves found it, dug in, and discovered the Discs of Norgannon.",
			"The discs are a titan record, and what they record is that the earthen, the dwarves' ancestors, were shaped from living stone to work the deep places of the world. Dwarves are not natives of Azeroth in the way they always assumed. They are a titan project.",
			"The vault has its own guardians, still functioning after all this time, and the troggs are all over the upper levels. Dwarven opinion on site is that the digging woke them: urns and idols came out of the ground and the troggs came up after them. The Explorers' League is digging anyway, and the Dark Iron are in the ruins too, holding a League prospector hostage for what he knows, because they want the titans' way of making golems.",
		},
		didYouKnow = "The vault's guardian construct is still following orders issued by beings who left this world long ago. It does not care who Ironforge is.",
		readMore = { "Wowpedia: Uldaman", "Wowpedia: Discs of Norgannon" },
	},
	{
		name = "Angor Fortress", parent = "Badlands", faction = "Hostile",
		hook = "A Dark Iron fortress overlooking the road to Uldaman.",
		lore = {
			"Angor Fortress is the Shadowforge dwarves' base of operations in the Badlands, and its purpose is Uldaman. Ironforge's reading is that striking the fortress is what would slow their presence in the vault. That is as close to a compliment as the Dark Iron get.",
			"Shadowforge warriors and chanters hold the walls in numbers with stone golems among them, a commander somewhere inside, and Ambassador Infernus standing about as a reminder of whose service the clan is in.",
			"The Dark Iron clan lost the War of the Three Hammers, fled south, and bound themselves to the fire lord Ragnaros. They have been the Bronzebeards' enemy ever since, and any dwarven dig site attracts them.",
		},
	},
	{
		name = "Lethlor Ravine", parent = "Badlands", faction = "Hostile",
		hook = "A ravine full of black dragonkin in the eastern Badlands.",
		lore = {
			"Lethlor is a deep rift at the zone's eastern edge, held by the black dragonflight. Whelps and drakes of Deathwing's brood nest here.",
			"The black dragonflight did not pick the Badlands at random. Deathwing has spent a great deal of effort on titan sites and on anything that explains how this world was made.",
		},
	},
	{
		name = "Hammertoe's Digsite", parent = "Badlands", faction = "Alliance",
		hook = "A Badlands excavation overrun by Dark Iron dwarves.",
		lore = {
			"Hammertoe's Digsite lies in the northern Badlands, outside Uldaman. Dark Iron attackers seized the excavation and killed many of its workers.",
			"A survivor nearby has lost his lucky pick to the attackers and asks for help recovering it.",
		},
		readMore = { "Wowpedia: Hammertoe's Digsite", "Wowpedia: A Dwarf and His Tools" },
	},
	{
		name = "Apocryphan's Rest", parent = "Badlands", faction = "Contested",
		hook = "A boneyard of enormous skeletons in the northern Badlands.",
		lore = {
			"The remains here are far too large to be anything local, and the Explorers' League has taken a strong interest. The usual candidates are dragons or something older.",
			"The Badlands' geology keeps producing bones nobody can account for, part of why the dwarves think this land was shaped rather than eroded.",
		},
	},
	{
		name = "Dustwind Gulch", parent = "Badlands", faction = "Contested",
		hook = "A dry gulch west of Lethlor Ravine, worked over by coyotes and troggs.",
		lore = {
			"The gulch is typical Badlands ground: no water, hard rock, and a wildlife population that has adapted to both. Crag coyotes hunt it, ridge stalkers work the air above it, and starving buzzards clean up after both.",
			"Stonevault troggs have come down into the gulch as well, seers and bashers together. It lies in the east of the zone, out toward Lethlor Ravine, and nobody has a claim on it worth defending.",
		},
	},
	{
		name = "Agmond's End", parent = "Badlands", faction = "Contested",
		hook = "A field of giant bones in the south, named for a dwarf who died in it.",
		lore = {
			"Agmond was a dwarf working the Badlands dig, and he is the Agmond of the name. He went missing, and what the search found was a trail: bloody smears across rock and sand where he had crawled some distance, and then the place he stopped.",
			"He left a word behind him. Roughly scrawled in the sandstone where he died is the name Murdaloc, a Stonevault trogg. The bonesnappers and shamans of that tribe hold the ground all around the spot, and nobody has gone out to settle it.",
		},
	},
	{
		name = "Camp Kosh", parent = "Badlands", faction = "Hostile",
		hook = "An ogre camp on the northern road.",
		lore = {
			"Camp Kosh is one of four ogre camps strung across the Badlands, holding the roads in the only way ogres know how. The Dustbelcher have this one: warriors and a pair of mystics, with a cauldron going and an excavation supply crate standing about that did not start out theirs.",
			"These are leftovers of the Second War Horde, like most ogres east of the sea, with no leadership and no plan beyond the next caravan.",
		},
	},
	{
		name = "Camp Cagg", parent = "Badlands", faction = "Hostile",
		hook = "An ogre camp in the western Badlands, close enough to Kargath to be a Horde problem.",
		lore = {
			"Camp Cagg sits close to the Horde's outpost in the west of the zone, and clearing it is Kargath's standing chore. Dustbelcher maulers and ogre mages hold it under Boss Tho'grun, with a lord among them and greater rock elementals walking the same ground.",
			"The ogres have no strategic goal. They are simply in the way and difficult to move.",
		},
	},
	{
		name = "The Dustbowl", parent = "Badlands", faction = "Contested",
		hook = "The open flats at the heart of the Badlands, with gnomes camped on them.",
		lore = {
			"The Dustbowl is the arid middle of the zone, between Kargath and the Valley of Fangs, and it is not as empty as it looks. Crag coyotes and ridge stalkers work the flats, lesser rock elementals rise out of them, giant buzzards circle above, and Dustbelcher ogres come down off the higher ground.",
			"Lotwil Veriatus has stopped out here to work on his shackles of elemental binding, which he means to let mages summon stronger elementals than they can now. Lucien Tosselwrench is camped with him and is laying in an invisibility potion and a healing potion against the day Lotwil gets it working.",
			"A handful of siege golems stand on the flats near their camp, and they are the largest things on this ground by a long way.",
		},
		readMore = { "Wowpedia: Dustbowl", "Wowpedia: Lotwil Veriatus", "Wowpedia: Lucien Tosselwrench" },
	},
})

-- ---------------------------------------------------------------------------
-- SWAMP OF SORROWS
-- ---------------------------------------------------------------------------

Zone{
	name = "Swamp of Sorrows", continent = EK, faction = "Contested", levels = "35-45",
	hook = "The orcs' first foothold on this world, with a sunken troll temple under the water.",
	lore = {
		"This swamp is where the Horde established itself. Stonard was built as an orcish base in the First and Second Wars, close to the Dark Portal, and the Horde holds it still. The orcs did not arrive as invaders of a settled land; they arrived in a swamp, built a fort, and pushed north from it.",
		"Beneath the water lies the Temple of Atal'Hakkar. The Atal'ai, the Gurubashi priests exiled for summoning Hakkar, built it here to bring their god back. The green dragonflight found out and Ysera sank the entire temple into the swamp to stop them, leaving her own dragons to guard the ruin.",
		"The Atal'ai are still down there. So is a great deal of the green dragonflight's unfinished business, and the swamp has not improved since any of it started.",
	},
	didYouKnow = "The swamp was not always swamp. The land east of here was the Black Morass, and the Dark Portal's energies turned a good part of the region into the Blasted Lands. This is the half that got wetter instead of drier.",
	readMore = { "Wowpedia: Swamp of Sorrows", "Wowpedia: Temple of Atal'Hakkar" },
}

SubsOf("Swamp of Sorrows", {
	{
		name = "Stonard", faction = "Horde", levels = "35-45",
		hook = "The Horde's oldest fort on this continent, built before the orcs ever saw Durotar.",
		lore = {
			"Stonard was an orcish war base in the First and Second Wars, a forward position between the Dark Portal and the human kingdoms. When the Horde was defeated, Stonard was one of the few holdings it never entirely lost.",
			"Thrall's Horde has reclaimed and reinforced it. For the orcs it carries real weight: it is a link to the campaign that brought them here, and one of the only places in the Eastern Kingdoms they can call theirs by right of continuous occupation.",
		},
	},
	{
		name = "The Temple of Atal'Hakkar", parent = "Swamp of Sorrows", faction = "Hostile", levels = "50-60",
		hook = "A troll temple the green dragonflight drowned to stop a god from arriving.",
		lore = {
			"The Atal'ai priests, driven out of Stranglethorn for calling Hakkar into the world, came here to try again. They built a temple to the Soulflayer in the swamp.",
			"Ysera, the green Aspect, destroyed it before they could finish, sinking the temple into the marsh and stationing her dragons to watch it. It is known now as the Sunken Temple.",
			"The guard has not held. The Atal'ai are active inside, something has gone wrong with the dragons posted there, and the temple has become one of the most dangerous ruins in the Eastern Kingdoms.",
		},
		aliases = { "Sunken Temple", "The Sunken Temple" },
		readMore = { "Wowpedia: Sunken Temple", "Wowpedia: Atal'ai" },
	},
	{
		name = "Pool of Tears", parent = "Swamp of Sorrows", faction = "Contested",
		hook = "The lake that covers the sunken temple, watched by green dragons.",
		lore = {
			"The Pool of Tears is the water that covers the Temple of Atal'Hakkar, the visible mark of what Ysera did to the place. Atal'ai ruins break the surface at the edges and run on under it.",
			"The green dragonflight is all around the pool and has been since the temple went under: scalebanes and wyrmkin in the marsh, and Somnus, who is a great deal more than that. They are watching a corrupted temple rather than guarding a lake.",
		},
	},
	{
		name = "Misty Valley", parent = "Swamp of Sorrows", faction = "Contested",
		hook = "A fog-filled valley on the swamp's northern edge.",
		lore = {
			"The valley is the route between the Swamp of Sorrows and the Blasted Lands road, and the mist here never fully clears.",
			"It is the sort of terrain where the swamp's reputation was earned.",
		},
	},
	{
		name = "Sorrowmurk", parent = "Swamp of Sorrows", faction = "Hostile",
		hook = "Murloc territory in the eastern swamp.",
		lore = {
			"Sorrowmurk is one of the swamp's larger murloc concentrations, on the water east of Stonard.",
			"The swamp's murlocs are more numerous and better organised than the coastal varieties, which the Horde at Stonard find tiresome.",
		},
	},
	{
		name = "Stagalbog", parent = "Swamp of Sorrows", faction = "Hostile",
		hook = "Dense marshland south of the Pool of Tears, with murlocs in its cave.",
		lore = {
			"The Stagalbog lies south of the Pool of Tears, against the southern mountains of the Swamp of Sorrows. Its cave is occupied by Marsh tribe murlocs under the Swamp Talker.",
		},
		readMore = { "Wowpedia: Stagalbog", "Wowpedia: Stagalbog Cave" },
	},
	{
		name = "Itharius's Cave", parent = "Swamp of Sorrows", faction = "Neutral",
		hook = "A green dragon's cave, and one of the few friendly doors in the swamp.",
		lore = {
			"Itharius is a green dragon of Ysera's flight, posted to watch the sunken temple. He has been at it a long time and he is willing to talk to outsiders about it.",
			"The green dragonflight's duty is the Emerald Dream and the natural world. A drowned temple to a blood god is squarely their business.",
		},
	},
	{
		name = "Fallow Sanctuary", parent = "Swamp of Sorrows", faction = "Hostile",
		hook = "The Lost Ones' village, in the north of the swamp.",
		lore = {
			"The sanctuary is a village of Lost Ones, the draenei who came through the Dark Portal and went feral in this swamp. Huts, campfires and a cauldron stand among the trees in the swamp's north-east, with a chieftain and a cook among them and Ongeku on the same ground. They catch or kill anyone who wanders near.",
			"What they have that others want is draenethyst, crystals sacred to their kind and taken from the Lost Ones at the Harborage who kept their minds. A caravan bound for Nethergarde Keep lost a wagon to the sanctuary as well, dragged in with a chest of wizards' reagents still aboard.",
		},
	},
	{
		name = "Splinterspear Junction", parent = "Swamp of Sorrows", faction = "Contested",
		hook = "Where the swamp road forks, with Stonard's scouts walking it.",
		lore = {
			"Splinterspear Junction is the fork in the main road through the Swamp of Sorrows. The northern branch runs past the Harborage and on to the Fallow Sanctuary, and the southern one goes down to Stonard and the path into the Blasted Lands.",
			"It is not unheld. Stonard's scouts walk this stretch on patrol, and that makes the fork Horde ground in practice even though nothing is built on it. The rest of the traffic is swamp: sorrow spinners, young sawtooth crocolisks, swamp jaguars, and Molt Thorn somewhere among them.",
		},
		readMore = { "Wowpedia: Splinterspear Junction", "Wowpedia: Stonard", "Wowpedia: The Harborage" },
	},
	{
		name = "Draenil'dur Village", parent = "Swamp of Sorrows", faction = "Hostile",
		hook = "A ruined village in the swamp with a name that is not human.",
		lore = {
			"The name is not of human or orcish origin, and what the village was before it was ruins is not well recorded.",
			"The Swamp of Sorrows has layers: trolls, then orcs, then whatever this was in between.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- THE HINTERLANDS
-- ---------------------------------------------------------------------------

Zone{
	name = "The Hinterlands", continent = EK, faction = "Contested", levels = "40-50",
	hook = "Wildhammer gryphon country, pressed up against a troll holy city that was old when Arathor was young.",
	lore = {
		"The Hinterlands are high forest in the northeast, and the Wildhammer dwarves hold them from Aerie Peak. The Wildhammers split from Ironforge in the War of the Three Hammers, went their own way, and became the Alliance's gryphon-riders. They are shamanistic, independent, and have no interest in Bronzebeard politics.",
		"Their neighbours are forest trolls, and the trolls were here first by a very long margin. The Vilebranch hold the east and south out of Jintha'Alor, and the Witherbark keep smaller villages of their own further in. Jintha'Alor on the eastern slopes is an ancient Amani city and a holy site, dedicated among other things to Shadra the spider loa. The Vilebranch are not a tribe of raiders squatting in ruins; they are living in their own city.",
		"The zone also holds Seradane, one of the green dragonflight's Emerald Dream portals, and Quel'Danil Lodge, where high elves who still speak to the Alliance maintain a presence. For a quiet-looking forest it is unusually crowded with ancient business.",
	},
	didYouKnow = "The Wildhammers tamed gryphons, which the Bronzebeards never managed. Every gryphon in Alliance service traces back to Aerie Peak.",
	readMore = { "Wowpedia: The Hinterlands", "Wowpedia: Wildhammer clan", "Wowpedia: Amani" },
}

SubsOf("The Hinterlands", {
	{
		name = "Aerie Peak", faction = "Alliance", levels = "40-50",
		hook = "The Wildhammer dwarves' mountain hold, and the home of the Alliance's gryphons.",
		lore = {
			"Aerie Peak is the Wildhammer clan's seat, built on a high crag with gryphon aeries cut into it. Falstad Wildhammer, one of the Second War's heroes, is their high thane.",
			"The Wildhammers left Ironforge after losing the War of the Three Hammers' succession and have been independent ever since. They fought in the Second and Third Wars as Alliance allies rather than Ironforge subjects, and the distinction matters to them.",
		},
	},
	{
		name = "Jintha'Alor", parent = "The Hinterlands", faction = "Hostile",
		hook = "An ancient Amani troll city terraced up a mountainside, still inhabited and still holy.",
		lore = {
			"Jintha'Alor is one of the great surviving troll cities, built in terraces up the eastern mountains. It belonged to the Amani Empire, the troll power that Arathor and the high elves fought a war of annihilation against.",
			"The Vilebranch tribe hold it now, and they hold it as a religious centre rather than a fortress of convenience. The Altar of Zul at its summit and the shrine to the spider loa Shadra are active sites of worship.",
			"Troll religion is loa-worship, and the loa are real. Shadra is not a metaphor.",
		},
		readMore = { "Wowpedia: Jintha'Alor", "Wowpedia: Shadra" },
	},
	{
		name = "Revantusk Village", faction = "Horde", levels = "40-50",
		hook = "A forest troll village on the Hinterlands coast, allied with the Horde.",
		lore = {
			"The Revantusk trolls live on the southeastern coast of the Hinterlands. They are allies of Thrall's Horde, at odds with the Vilebranch trolls and the Wildhammer dwarves.",
			"Fishing brings problems of its own. Katoom the Angler complains that saltwater snapjaws steal his bait and break his lines, and seeks help clearing them from the coast.",
		},
		readMore = { "Wowpedia: Revantusk Village", "Wowpedia: Snapjaws, Mon!", "Wowpedia: Troll Compendium/Forest Troll Tribes" },
	},
	{
		name = "Quel'Danil Lodge", parent = "The Hinterlands", faction = "Hostile",
		hook = "The high elves' listening post in the Hinterlands, and it is not idle.",
		lore = {
			"Quel'Danil is the Hinterlands high elves' centre of communication, and its ambassadors are working to build relationships with other races. What they have to trade is what they know about the Witherbark trolls holding the south of the zone. The high elves were the Alliance of Lordaeron's magical backbone in the Second War.",
			"That outreach has limits. The elves' withdrawal from the Alliance, the destruction of Quel'Thalas by Arthas and the Scourge, and the bitterness on both sides mean the lodge decides for itself who is welcome, and most arrivals are not.",
		},
	},
	{
		name = "Seradane", parent = "The Hinterlands", faction = "Hostile",
		hook = "A green dragonflight portal into the Emerald Dream, guarded and off limits.",
		lore = {
			"Seradane is one of the four great Dream portals in this world, held by the green dragonflight. The others are Twilight Grove in Duskwood, the Dream Bough in Feralas, and Bough Shadow in Ashenvale.",
			"Ysera's dragons guard it, and they do not negotiate about access. Something has been going wrong at all four portals, and the greens are stretched.",
		},
	},
	{
		name = "Shadra'Alor", parent = "The Hinterlands", faction = "Hostile",
		hook = "A troll temple to the spider loa, in the southern hills.",
		lore = {
			"Shadra'Alor is dedicated to Shadra, the spider loa, and the Vilebranch work rituals here that are intended to bring her into the world more fully.",
			"Troll religious practice is not symbolic. Bringing a loa through is the kind of thing that works. That is the recurring problem with troll ruins.",
		},
	},
	{
		name = "The Altar of Zul", parent = "The Hinterlands", faction = "Hostile",
		hook = "A Vilebranch altar on the western edge of their territory in the Hinterlands.",
		lore = {
			"The Altar of Zul stands apart from Jintha'Alor. Qiaga the Keeper and Morta'gya the Keeper guard its summit, both formidable opponents.",
			"The Vilebranch are known for sacrifices here. Gryphon Master Talonaxe sends adventurers to search the top when he fears that the trolls have captured a young gryphon.",
		},
		readMore = { "Wowpedia: Altar of Zul", "Wowpedia: The Altar of Zul (quest)" },
	},
	{
		name = "Agol'watha", parent = "The Hinterlands", faction = "Hostile",
		hook = "A troll temple in the north-east, with Vilebranch in it and oozes under it.",
		lore = {
			"Agol'watha was a temple, one of the sites in the north-east of the zone that stand with Shaol'watha nearby. It is not abandoned: Vilebranch scalpers and soothsayers hold it, and Revantusk Village wants the numbers brought down.",
			"Slime has the lower ground. Green sludges and jade oozes work the stonework the way they do at Skulk Rock along the same stretch, and the crates the Old Horde left in this corner of the forest are still standing among them.",
			"The '-watha' sites are the measure of what the Amani Empire once was. The network that supported Jintha'Alor reached across the whole of these woods.",
		},
		readMore = { "Wowpedia: Agol'watha", "Wowpedia: Cannibalistic Cousins", "Wowpedia: Vilebranch tribe" },
	},
	{
		name = "Zun'watha", parent = "The Hinterlands", faction = "Hostile",
		hook = "Witherbark troll ruins in the southwestern Hinterlands.",
		lore = {
			"Zun'watha is a Witherbark settlement in the southwestern Hinterlands. Its hideskinners and venombloods occupy the ruins.",
			"Nimboya sends adventurers against the Witherbark here and at Hiri'watha, seeking to punish what he calls the tribe's betrayal of Thrall.",
		},
		readMore = { "Wowpedia: Zun'watha", "Wowpedia: Grim Message" },
	},
	{
		name = "Skulk Rock", parent = "The Hinterlands", faction = "Hostile",
		hook = "A forest troll ruin overrun by oozes, with an abandoned Horde base in it.",
		lore = {
			"Skulk Rock is a troll ruin with a cave in it, at the head of the river in the north-east of the zone. The Old Horde put a base here during the Second War and lost it when the Alliance of Lordaeron drove them out.",
			"What holds the ruin now is slime: jade oozes and green sludges stick to the stonework in numbers, and the rumour is that something bigger is leading them. The crates the orcs left behind are still there with cases of Hinterlands honey ripple in them.",
			"It is also one of the few places anywhere that ghost mushrooms grow, which is reason enough for people to come and take their chances with the oozes.",
		},
		readMore = { "Wowpedia: Skulk Rock", "Wowpedia: A Sticky Situation", "Wowpedia: Ghost Mushroom" },
	},
	{
		name = "Plaguemist Ravine", parent = "The Hinterlands", faction = "Contested",
		hook = "A pass out of the Hinterlands' north-west, with the blight coming down it.",
		lore = {
			"The ravine is a pathway rather than a place, running north out of the Hinterlands towards Caer Darrow, and the entrance to it is in the woods west of Quel'Danil Lodge on the far side of the mountain.",
			"Nothing lives in it. A silvermane or an owlbeast wanders through and that is the whole population, which is unusual enough in this forest to be the point: the mist coming down the pass is plague, and it is the one stretch of the Hinterlands that smells like the Plaguelands rather than like itself.",
		},
	},
	{
		name = "Valorwind Lake", parent = "The Hinterlands", faction = "Contested",
		hook = "A small lake north-east of Shadra'Alor, and the only place one mushroom grows.",
		lore = {
			"Valorwind Lake is small and sits north-east of Shadra'Alor. Nothing has been built on it, and in the Hinterlands that counts as a distinction of its own.",
			"What it has is the Violet Tragan, a mushroom that grows underwater and grows nowhere else in the world. Sprinkle, a goblin in Gadgetzan, puts it in everything on the grounds that it makes anything taste good, a view she formed in childhood from her sister's cooking.",
		},
		readMore = { "Wowpedia: Valorwind Lake", "Wowpedia: Sprinkle's Secret Ingredient" },
	},
})

-- ---------------------------------------------------------------------------
-- SEARING GORGE
-- ---------------------------------------------------------------------------

Zone{
	name = "Searing Gorge", continent = EK, faction = "Contested", levels = "43-50",
	hook = "A strip-mined furnace of a valley, torn open when a Dark Iron thane reached for a fire god.",
	lore = {
		"The Searing Gorge and the Burning Steppes next door were made by a single catastrophe. The Dark Iron thane Thaurissan, losing the War of the Three Hammers and his wife with it, reached for power enough to save his kingdom and brought up Ragnaros the Firelord instead. He did not mean to. The summoning tore the mountain apart, made both of these zones out of what had been part of the Redridge Mountains, and destroyed the Dark Irons' own capital, a city that carried his name.",
		"The Dark Irons survived as Ragnaros' servants rather than his masters. They now work the Gorge for ore and metal under the Firelord's shadow, running the Cauldron and the Grimesilt digs. Nobody here outweighs them.",
		"Not all of them accept it. The Thorium Brotherhood broke away from Ragnaros' service and set up at Thorium Point, where they trade with Alliance and Horde alike. They are the only Dark Iron faction anyone outside will deal with.",
	},
	didYouKnow = "Thaurissan's summoning is the single most destructive act of magic in dwarven history, and the Dark Irons have been paying for it ever since. His line is still in charge: Emperor Dagran Thaurissan holds their seat inside Blackrock Mountain, and his wife Moira Bronzebeard is King Magni's own daughter.",
	readMore = { "Wowpedia: Searing Gorge", "Wowpedia: Dark Iron clan", "Wowpedia: Ragnaros" },
}

SubsOf("Searing Gorge", {
	{
		name = "Thorium Point", faction = "Neutral", levels = "45-55",
		hook = "The Dark Iron dwarves who walked away from Ragnaros, selling to everyone.",
		lore = {
			"The Thorium Brotherhood are Dark Irons who rejected Ragnaros' service and set out to be smiths again rather than slaves. Thorium Point is their camp, in the north-west of the Searing Gorge, and they keep it neutral in the practical sense: dwarves of both kinds and orcs work out of it, and there is an anvil and a flight path for anyone who gets that far.",
			"Overseer Oilfist runs the place. The Brotherhood's quarrel with its own past is still live, and he is the one who put out the order on Overseer Maltorius down in the Cauldron, an agent of theirs who went over to the Dark Iron.",
			"Alliance and Horde both court them, and the Brotherhood's price is usually information or materials out of Blackrock Mountain.",
		},
	},
	{
		name = "The Cauldron", parent = "Searing Gorge", faction = "Hostile",
		hook = "The Gorge's central pit, dug by slaves who will not be rescued.",
		lore = {
			"The Cauldron is the open crater at the centre of the Searing Gorge, rimmed by the Dark Iron clan's excavation machines and fortified some time after Ragnaros was summoned. Fire and magma elementals move through the crevices at the bottom of it.",
			"The digging is done by slaves. Dark Iron slavers and taskmasters hold the pit with Slave Master Blackheart working the line, and the slave workers have been driven far enough by the heat and the labour that they will attack anybody who comes at them, including anyone trying to get them out. There are mutilated and charred Dark Iron remains lying about the same ground.",
			"Inside the Cauldron is the Slag Pit. Incendosaurs occupy its lava pools, and Overseer Maltorius commands the crew down there: a Thorium Brotherhood agent who went over to the Dark Iron, which is why the Brotherhood has put out an order on him.",
		},
		readMore = { "Wowpedia: Cauldron", "Wowpedia: The Slave Pits", "Wowpedia: Overseer Maltorius" },
	},
	{
		name = "Grimesilt Dig Site", parent = "Searing Gorge", faction = "Hostile",
		hook = "A dwarven excavation seized by the Dark Irons.",
		lore = {
			"The Dark Irons have taken over Grimesilt Dig Site in Searing Gorge. Dorius Stonetender lies badly injured at the bottom of the pit and asks for help returning to Ironforge.",
			"Another worker has hidden in a nearby outhouse. Dark Iron geologists spotted him and locked him inside.",
		},
		readMore = { "Wowpedia: Grimesilt Dig Site", "Wowpedia: Suntara Stones", "Wowpedia: Caught!" },
	},
	{
		name = "Firewatch Ridge", parent = "Searing Gorge", faction = "Hostile",
		hook = "A Dark Iron camp overlooking the Cauldron.",
		lore = {
			"Firewatch Ridge overlooks the great excavation in Searing Gorge. Dark Iron dwarves, mechanical golems and flame spiders occupy the ridge.",
			"A cave in its northwestern reaches houses Twilight's Hammer cultists, including elite fire guards and geomancers.",
		},
		readMore = { "Wowpedia: Firewatch Ridge" },
	},
	{
		name = "The Slag Pit", parent = "Searing Gorge", faction = "Hostile",
		hook = "A mine deep inside the Cauldron, worked by Dark Iron slaves.",
		lore = {
			"The Slag Pit lies deep within the Cauldron excavation. It is a sweltering mine, and the Dark Iron work it with slave labour: taskmasters and slavers stand over the slave workers, Slave Master Blackheart among them, and Overseer Maltorius commands the crew.",
			"Dorius Stonetender's archaeology unit was taken down here, and his dying request was that his men be freed rather than avenged. Incendosaurs live in the lower reaches, and the altar of Suntara stands in the pit itself.",
			"The Dark Iron are hostile to anyone who interferes with the mining, which is most of what they do here. The deposits in the walls are their own ore.",
		},
		readMore = { "Wowpedia: Slag Pit", "Wowpedia: Dwarven Justice", "Wowpedia: The Cauldron" },
	},
	{
		name = "Blackchar Cave", parent = "Searing Gorge", faction = "Hostile",
		hook = "A hot cave on the Gorge's edge, worked by slaves under a fire lord's overmaster.",
		lore = {
			"Blackchar is one of the places in the Gorge where the fire comes up to meet you. The cave is held by inferno elementals and greater lava spiders, Smoldar is somewhere in it, and the walls carry dark iron along with the mithril and truesilver.",
			"The Dark Iron work it the way they work the Slag Pit, with quarry slaves down here under Overmaster Pyron, as everywhere the clan digs.",
		},
		readMore = { "Wowpedia: Blackchar Cave", "Wowpedia: Searing Gorge" },
	},
	{
		name = "The Sea of Cinders", parent = "Searing Gorge", faction = "Contested",
		hook = "A flat of ash in the southern gorge, just north of Blackrock Mountain.",
		lore = {
			"The Sea of Cinders is a level stretch at the south end of the gorge, below Blackrock Mountain. Fire and wind have been over it and nothing lives on it. The ground still smoulders, and cinders and ash come off it into the air the whole time.",
			"It is the clearest physical record of what Thaurissan's summoning did to this country. What crosses it now is the Scarshield Legion, whose sentries and grunts hold the ash in force, with lava spiders and magma elementals in the cracks and a Blackrock drake overhead.",
			"A few people have business out here anyway. Bodley keeps to himself among the cinders, and Nilith Lokrav has a guardian standing over him.",
		},
		readMore = { "Wowpedia: Sea of Cinders", "Wowpedia: Searing Gorge", "Wowpedia: Scarshield Legion" },
	},
	{
		name = "Dustfire Valley", parent = "Searing Gorge", faction = "Contested",
		hook = "The valley at the Gorge's northern end, under a gate that stays shut.",
		lore = {
			"Dustfire Valley runs north out of the Searing Gorge to the gates of Stonewrought Pass, the tunnel through to the Valley of Kings in Loch Modan. The gates are locked and nobody goes through them without a key, so the valley is a dead end rather than a road.",
			"A Dark Iron camp sits at the head of it. That is the other reason not to wander up there.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- BURNING STEPPES
-- ---------------------------------------------------------------------------

Zone{
	name = "Burning Steppes", continent = EK, faction = "Contested", levels = "50-58",
	hook = "Blasted highlands under Blackrock Mountain, where a black dragon runs an orc army from the top floor.",
	lore = {
		"The Burning Steppes were made by the same disaster as the Searing Gorge: Thaurissan's summoning of Ragnaros split the mountain and burned the highlands. What is left is ash, lava and ruin, and in the middle of it stands Blackrock Mountain.",
		"The mountain is the most dangerous address in the world. Blackrock Spire above holds the Dark Horde, orcs under Rend Blackhand who never accepted the Second War's end and still call themselves the true Horde. Blackrock Depths below holds the Dark Iron dwarves and, at the bottom, Ragnaros himself.",
		"Above both sits Nefarian, son of Deathwing. He has taken the upper Spire, and he has spent years running experiments on dragonflight blood and manipulating the orcs below him as a workforce. The Dark Horde believe they serve Rend. Rend serves Nefarian, whether he admits it or not.",
	},
	didYouKnow = "The Ruins of Thaurissan on the Steppes are the colony the Dark Irons founded here after their exile, named for the thane who then destroyed it by summoning Ragnaros. They kept their seat inside the mountain instead, and Emperor Dagran Thaurissan holds it.",
	readMore = { "Wowpedia: Burning Steppes", "Wowpedia: Blackrock Mountain", "Wowpedia: Nefarian" },
}

SubsOf("Burning Steppes", {
	{
		name = "Blackrock Mountain", parent = "Burning Steppes", faction = "Hostile", levels = "50-60",
		hook = "A volcano holding two armies, a fire lord and a black dragon, all of whom want the others dead.",
		lore = {
			"Blackrock Mountain is a single volcano containing several wars. The orcish Horde used it as its staging ground in the First and Second Wars; Anduin Lothar died fighting Orgrim Doomhammer at its gates.",
			"Now it is layered. The Dark Iron dwarves and Ragnaros hold the Depths. Above them the Dark Horde holds the Spire, and Nefarian holds the peak over that. The orcs are the dragon's. That is what the Dark Irons are really fighting.",
			"The mountain is the single densest concentration of hostile power on the continent, and neither faction is waiting it out. Thrall wants Rend Blackhand's head for calling himself warchief, and the Horde's warlord at Kargath keeps a standing list of names in the lower spire.",
		},
		readMore = { "Wowpedia: Blackrock Mountain", "Wowpedia: Blackrock Spire" },
	},
	{
		name = "Ruins of Thaurissan", parent = "Burning Steppes", faction = "Hostile",
		hook = "The remains of the Dark Iron capital destroyed by Ragnaros' summoning.",
		lore = {
			"The Dark Iron clan founded Thaurissan after its exile from Ironforge. During the War of the Three Hammers, their sorcerer-thane called upon the powers beneath the earth and unleashed Ragnaros, destroying his own city.",
			"Its ruins remain in the Burning Steppes. Royal Historian Archesonus seeks information from relics scattered among them, but assassins guard the site.",
		},
		readMore = { "Wowpedia: Ruins of Thaurissan", "Wowpedia: War of the Three Hammers (History of Warcraft)", "Wowpedia: The Smoldering Ruins of Thaurissan (2)" },
	},
	{
		name = "Flame Crest", faction = "Horde", levels = "50-58",
		hook = "The Horde's camp on the Steppes, watching Blackrock Mountain.",
		lore = {
			"Flame Crest is a small Horde outpost established to keep an eye on Blackrock Mountain and the Dark Horde inside it.",
			"Thrall's Horde and Rend's Dark Horde are not the same thing, and the Dark Horde's continued existence is an embarrassment and a threat to Orgrimmar.",
		},
	},
	{
		name = "Morgan's Vigil", faction = "Alliance", levels = "50-58",
		hook = "The Alliance's camp on the Steppes, doing the same job from the other side of the road.",
		lore = {
			"Morgan's Vigil is Stormwind's forward position on the Steppes, watching the mountain and the road east. It is small and exposed, but it is not isolated: there is a gryphon master here, a weaponsmith and someone selling food.",
			"Marshal Maxwell commands it, and his business is Blackrock Mountain. The orders that go out from this camp are about the dark iron dwarves, the Dark Horde in the spire and the hunt for Marshal Windsor.",
		},
	},
	{
		name = "Dreadmaul Rock", parent = "Burning Steppes", faction = "Hostile",
		hook = "An ogre hold on the Steppes, keeping to itself.",
		lore = {
			"Dreadmaul Rock belongs to the Firegut clan: a great rock with paths up it and a system of ogre mounds cut inside, with Gorgon'och and Hahk'Zor among the ogres on it.",
			"The Firegut keep no allies but other ogres. They sit on the same Steppes as the Dark Horde and the black dragonflight without belonging to either. Ogres came to this world with the Horde, and most of them have been on their own since it broke.",
		},
	},
	{
		name = "Altar of Storms", parent = "Burning Steppes", faction = "Hostile",
		hook = "A Second War altar in the shadow of Blackrock Mountain, still in use.",
		lore = {
			"The altars of storms were cut from captured elven runestones and used to pervert the magic in them. What the Old Horde got out of them was the ogre magi, who were given their spells at altars like this one.",
			"This altar sits below Blackrock Mountain, and the Blackrock clan has never stopped using it. Blackrock warlocks work here, with Mor'zul Bloodbringer and Gorzeeki Wildeyes keeping to themselves nearby and an alchemy set standing out in the open.",
		},
		readMore = { "Wowpedia: Altar of Storms", "Wowpedia: Ogre magi", "Wowpedia: Blackrock clan" },
	},
	{
		name = "Terror Wing Path", parent = "Burning Steppes", faction = "Hostile",
		hook = "A valley at the eastern end of the Steppes, full of black dragonkin.",
		lore = {
			"Terror Wing Path runs through the eastern Burning Steppes, at the far end of the zone from Blackrock Mountain. Whelps of the black dragonflight fill the valley and black drakes patrol its length.",
			"The dragons are not the only thing moving through. Volchan, a magma giant, wanders the path on no fixed route, and the standing advice about this valley is not to cross it alone.",
		},
	},
	{
		name = "The Pillar of Ash", parent = "Burning Steppes", faction = "Contested",
		hook = "A rock spire on the road to Blackrock Mountain, used as a landmark by everyone.",
		lore = {
			"The Pillar is the most visible feature on the Steppes after the mountain itself, and it marks the approach to Blackrock Mountain's gates.",
			"Nothing holds it and nothing is built on it. On a zone this bare that is the whole of its use: a thing you can see from a long way off and name, in country where one black slope looks much like the next.",
		},
	},
	{
		name = "Blackrock Pass", parent = "Burning Steppes", faction = "Contested",
		hook = "The gated route between Redridge and the Burning Steppes.",
		lore = {
			"Blackrock Pass links the Redridge Mountains to the Burning Steppes. A gate marks the border, beyond which the road enters the scorched lands to the north.",
		},
		readMore = { "Wowpedia: Blackrock Pass" },
	},
})

-- ---------------------------------------------------------------------------
-- WESTERN PLAGUELANDS
-- ---------------------------------------------------------------------------

Zone{
	name = "Western Plaguelands", continent = EK, faction = "Contested", levels = "51-58",
	hook = "The farmland where the plague of undeath was first planted, deliberately, in the grain.",
	lore = {
		"This was Lordaeron's granary. It is now blighted ground where the soil itself is wrong, and where the Third War began in earnest.",
		"Kel'Thuzad's Cult of the Damned distributed plagued grain through these villages from Andorhal. People ate it, died, and rose. Prince Arthas and the paladin Uther the Lightbringer came to stop it, and the investigation led Arthas north to Northrend, to Frostmourne, and to everything that followed.",
		"Uther is buried here, at a tomb near Sorrow Hill. Andorhal is the Scourge's own town, run by the lich Araj the Summoner, and the plague cauldrons standing in the fields around it answer to him. Hearthglen in the north is held by the Scarlet Crusade under Highlord Taelan Fordring, whose father Tirion was stripped of his knighthood for showing mercy to an orc.",
	},
	didYouKnow = "Caer Darrow, the island in Darrowmere Lake, was the Barov family's estate. Kel'Thuzad took it, killed the family and turned their manor into Scholomance, a school of necromancy. The Barovs are still there in a sense.",
	readMore = { "Wowpedia: Western Plaguelands", "Wowpedia: Andorhal", "Wowpedia: Uther the Lightbringer" },
}

SubsOf("Western Plaguelands", {
	{
		name = "Andorhal", parent = "Western Plaguelands", faction = "Hostile",
		hook = "The town where the plague was distributed, and the Scourge's hold on the Western Plaguelands.",
		lore = {
			"Andorhal was Lordaeron's main granary town, and the Cult of the Damned chose it for exactly that reason. The plagued grain went out from these warehouses to the whole region.",
			"The town is the lich Araj the Summoner's headquarters, and the plague cauldrons standing around the zone answer to him. Scarlet Crusade patrols work the roads north out of it, sent down from Hearthglen.",
		},
	},
	{
		name = "Hearthglen", parent = "Western Plaguelands", faction = "Hostile",
		hook = "A northern town held by the Scarlet Crusade, under a commander with a complicated father.",
		lore = {
			"Hearthglen is intact, fortified and held by the Scarlet Crusade. Its commander is Highlord Taelan Fordring, one of the Crusade's most capable and most conflicted officers.",
			"His father is Tirion Fordring, once Lord of Mardenholde Keep here, who was stripped of his title and exiled by the Alliance for sparing the life of an orc who had saved him. Tirion lives in hiding in the Plaguelands. Taelan serves an order his father would not recognise.",
		},
		didYouKnow = "Tirion Fordring was one of the five original Knights of the Silver Hand, the first paladins. The Alliance exiled him for an act of honour and the Scarlet Crusade has his son.",
	},
	{
		name = "Uther's Tomb", parent = "Western Plaguelands", faction = "Contested",
		hook = "The grave of the first paladin, in the middle of the land he died trying to save.",
		lore = {
			"Uther the Lightbringer was the first of the Knights of the Silver Hand, Arthas' mentor, and the Alliance's greatest paladin. Arthas killed him to take the urn holding his father Terenas' ashes.",
			"His tomb stands in the Plaguelands because this is where the war was. It is one of the few places in the zone that the Scourge has not managed to defile, and pilgrims still come.",
		},
	},
	{
		name = "Caer Darrow", parent = "Western Plaguelands", faction = "Hostile",
		hook = "An island estate turned into a school of necromancy.",
		lore = {
			"Caer Darrow was the Barov family's island holding in Darrowmere Lake, a wealthy and respectable estate. Kel'Thuzad talked the family into handing it over and the cultists killed them afterwards, and the manor's crypts became Scholomance.",
			"Scholomance is now the Cult of the Damned's primary teaching institution, where necromancers are trained. The Barovs' ghosts are on the island and the family's surviving relatives are still litigating the deeds.",
		},
		readMore = { "Wowpedia: Scholomance", "Wowpedia: Caer Darrow" },
	},
	{
		name = "The Writhing Haunt", parent = "Western Plaguelands", faction = "Hostile",
		hook = "A plagued farmstead, one of four the Scourge turned into blight factories.",
		lore = {
			"The Writhing Haunt is one of the four great farms of the Western Plaguelands, all of which the Scourge has converted into production sites for more blight.",
			"The farms are not ruins. They are working facilities producing something nobody wants produced.",
		},
	},
	{
		name = "Gahrron's Withering", parent = "Western Plaguelands", faction = "Hostile",
		hook = "A Scourge-held farm near the eastern edge of the Western Plaguelands.",
		lore = {
			"A plague cauldron stands in the fields at Gahrron's Withering. Wraiths and ghosts guard this farm near the border with the Eastern Plaguelands.",
			"Researchers seek a sample of the cauldron's toxins to prepare counteragents. It is one of four cauldrons targeted in the campaign against the Scourge.",
		},
		readMore = { "Wowpedia: Gahrron's Withering", "Wowpedia: Target: Gahrron's Withering (Alliance)" },
	},
	{
		name = "Felstone Field", parent = "Western Plaguelands", faction = "Hostile",
		hook = "The westernmost of the four plague farms, still under the Scourge.",
		lore = {
			"Felstone Field lies northwest of Andorhal. A plague cauldron stands in the fields, guarded by Scourge undead.",
			"The campaign against the cauldrons begins with samples of their poisons. Researchers need these to develop counteragents that can be introduced into the mixture.",
		},
		readMore = { "Wowpedia: Felstone Field", "Wowpedia: Target: Felstone Field (Alliance)", "Wowpedia: Return to Chillwind Camp" },
	},
	{
		name = "Dalson's Tears", parent = "Western Plaguelands", faction = "Hostile",
		hook = "A plague farm named for a family that is still on the property.",
		lore = {
			"Dalson's Tears was the Dalson family farm. They are still here and they have not been improved by the experience.",
			"The name is one of the bleaker pieces of naming in a zone with stiff competition.",
		},
	},
	{
		name = "Northridge Lumber Camp", parent = "Western Plaguelands", faction = "Hostile",
		hook = "A working lumber mill, run by the Scarlet Crusade and sabotaged by everyone else.",
		lore = {
			"Northridge is the Scarlet Crusade's mill, close to Hearthglen, and their timber comes from it. It is still cutting.",
			"That makes it worth attacking, and both the Alliance and the Horde have worked out that the cheapest way to do it is termites rather than soldiers.",
		},
	},
	{
		name = "Sorrow Hill", parent = "Western Plaguelands", faction = "Hostile",
		hook = "Andorhal's graveyard, and the Scourge's first line on the eastern road.",
		lore = {
			"Sorrow Hill is where Andorhal buried its dead long before the plague, rich and poor together, crypts alongside plain plots. The defence of the town then filled it faster than graves could be dug for it.",
			"The cauldrons standing in the fields around brought all of it back up. The undead on the hill now screen Andorhal's eastern approach, the one road into the town that is not fortified.",
			"Uther's tomb stands on the crown of the cemetery, raised there by the last of the townsfolk before they abandoned the place, and High Priest Thel'danis guards it.",
		},
	},
	{
		name = "Mardenholde Keep", parent = "Western Plaguelands", faction = "Hostile",
		hook = "The keep at Hearthglen, once Tirion Fordring's seat, now the Scarlet Crusade's.",
		lore = {
			"Mardenholde was the Fordring family's holding and Tirion's seat as Lord of Hearthglen. The Scarlet Crusade holds it now, with his son commanding.",
			"A paladin lord, an act of mercy, an exile, and a fanatic order living in the house afterwards. The Alliance has worked through that sequence elsewhere, but rarely so neatly.",
		},
	},
	{
		name = "The Bulwark", parent = "Western Plaguelands", faction = "Horde",
		hook = "The Forsaken's barricade on the Tirisfal border, holding the Scourge out of the west.",
		lore = {
			"The Bulwark is the Forsaken's wall and checkpoint between Tirisfal Glades and the Western Plaguelands. The front there is live.",
			"The Forsaken are the Scourge's most committed enemies, because the alternative to fighting is being reclaimed.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- EASTERN PLAGUELANDS
-- ---------------------------------------------------------------------------

Zone{
	name = "Eastern Plaguelands", continent = EK, faction = "Contested", levels = "53-60",
	hook = "Scourge heartland, with a necropolis in the sky and the last chapel of the Light holding out below.",
	lore = {
		"The Eastern Plaguelands belong to the Scourge, not as a claim but as a fact on the ground. The sky is wrong, the soil is wrong, and Stratholme in the north is the Scourge's capital in this part of the world.",
		"Stratholme is where Arthas crossed the line he never came back from. The city's population had eaten the plagued grain, and Arthas ordered them all killed before they could rise. Uther and Jaina Proudmoore refused to take part and left. Arthas did it anyway, and the purge of Stratholme is the act that finished him as a man.",
		"Against all this stands Light's Hope Chapel, held by the Argent Dawn. The Dawn is what is left of the Silver Hand and the Kirin Tor's survivors working together, and it accepts anyone, Forsaken included, who will fight the Scourge. Above Plaguewood floats Naxxramas, Kel'Thuzad's necropolis, and the clearest sign of how badly this war is going.",
	},
	didYouKnow = "The Argent Dawn is the only organisation in the world where Alliance and Horde, including the Forsaken, serve together without argument. The Scourge managed what no diplomat could.",
	readMore = { "Wowpedia: Eastern Plaguelands", "Wowpedia: Stratholme", "Wowpedia: Argent Dawn" },
}

SubsOf("Eastern Plaguelands", {
	{
		name = "Light's Hope Chapel", faction = "Neutral", levels = "53-60",
		hook = "A small chapel holding the last consecrated ground in the Plaguelands.",
		lore = {
			"Light's Hope is a modest building on ground the Scourge cannot take. Beneath it lie the remains of many of the Silver Hand's fallen, and the Light here is strong enough that the undead cannot press in at all.",
			"The Argent Dawn runs its whole campaign from this chapel. Alliance, Horde and Forsaken all work out of it, because the Dawn's only membership requirement is willingness to fight the Scourge.",
		},
	},
	{
		name = "Stratholme", parent = "Eastern Plaguelands", faction = "Hostile", levels = "58-60",
		hook = "The city Arthas purged, now the Scourge's capital and the Scarlet Crusade's obsession.",
		lore = {
			"Stratholme was Lordaeron's second city, a centre of the Church of the Holy Light, and the city where the Knights of the Silver Hand were founded. When the plagued grain reached it, Arthas ordered the city killed. Uther and Jaina walked away rather than take part; Arthas carried out the purge and then followed Mal'Ganis to Northrend.",
			"The city is now held by the Scourge under Baron Rivendare, with the Scarlet Crusade fighting for the other half under Grand Crusader Dathrohan. Two of the most fanatical forces in the world are contesting a city that is already dead.",
			"Neither side will leave while the other is standing. The fighting over the districts is constant, and anyone who walks in has both of them to deal with before long.",
		},
		readMore = { "Wowpedia: Stratholme", "Wowpedia: Culling of Stratholme" },
	},
	{
		name = "Plaguewood", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "A blighted forest beneath the floating necropolis of Naxxramas.",
		lore = {
			"Plaguewood lies south of Stratholme in the Eastern Plaguelands. Scourge forces occupy its ziggurats and slaughterhouses, while Naxxramas hangs above the forest.",
			"A rune portal in the woods provides an entrance to the necropolis. The Argent Dawn has devised an arcane disguise to pass its wards and offers assistance to those who have earned its trust.",
		},
		readMore = { "Wowpedia: Plaguewood", "Wowpedia: The Dread Citadel - Naxxramas" },
	},
	{
		name = "Tyr's Hand", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "An intact cathedral town held top to bottom by the Scarlet Crusade.",
		lore = {
			"Tyr's Hand is in better condition than anywhere else in the Plaguelands, because the Scarlet Crusade holds it in strength and has kept the Scourge out.",
			"It is also completely closed to outsiders. The Crusade treats the Argent Dawn as heretics and anyone else as infected, so an intact town full of paladins is as hostile as the undead next door.",
		},
	},
	{
		name = "Corin's Crossing", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "A crossroads market town, now a Scourge staging post.",
		lore = {
			"Corin's Crossing was a trading village at the junction of the zone's roads, and the signposts still standing in it point five ways: Quel'Thalas, Tyr's Hand, Darrowshire, Stratholme and Andorhal. Its position means almost everyone travelling the Eastern Plaguelands has to deal with it.",
			"The Scourge holds it and uses it as the hub it always was. Hate shriekers and gibbering ghouls work the streets with stitched horrors among them, and the Cult of the Damned is here in person: vile tutors and dark summoners, teaching and raising in the open.",
		},
	},
	{
		name = "The Marris Stead", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "A farmstead in the western Plaguelands of the east, and Nathanos Blightcaller's house.",
		lore = {
			"The stead is not the Scourge's. Nathanos Blightcaller lives here, the first of Sylvanas Windrunner's champions, and he holds this farm a long mile out from Light's Hope Chapel with nobody at his back.",
			"What he does from it is kill. He roams the wastes around the stead killing Scourge and Alliance alike, and he sends agents further out: to Tyr's Hand in the guise of the Scarlet Crusade, and north to the high elf lodge at Quel'Lithien for a registry that has his mortal life written in it.",
		},
	},
	{
		name = "Quel'Lithien Lodge", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "A high elf hunting lodge in the north, on the Alliance's side and nobody else's.",
		lore = {
			"Quel'Lithien stands near Northpass Tower, a lodge of rangers, woodsmen and pathstriders under Ranger Lord Hawkspear. They are the Silvermoon Remnant, and they side with the Alliance: the Alliance is welcome at the lodge, the Horde is not.",
			"Their kingdom is gone. Arthas came north through this region with the Scourge, Quel'Thalas fell and the Sunwell was defiled, and the lodge kept the Quel'Thalas Registry, which is a record of elven lives. Nathanos Blightcaller wants it, because his own mortal life is written in it, and sends Horde agents up here to take it and to leave the lodge suffering.",
			"Aurora Skycaller is outside the lodge, nearer the tower. What she says about all this is that the elves have been shattered like the artefact she is trying to mend, and she does not know whether the pieces go back together.",
		},
	},
	{
		name = "Zul'Mashar", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "A Mossflayer troll settlement threatened by the plague of undeath.",
		lore = {
			"Zul'Mashar lies in the northeastern Eastern Plaguelands. Mossflayer scouts, cannibals and shadowhunters still occupy the settlement, with Warlord Thresh'jin among them.",
			"The plague threatens the trolls from within. Hameya has written a desperate plea after infection began to overcome his will.",
		},
		readMore = { "Wowpedia: Zul'Mashar", "Wowpedia: Hameya's Plea" },
	},
	{
		name = "The Noxious Glade", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "A pocket of concentrated blight in the eastern woods.",
		lore = {
			"The Noxious Glade is one of the pockets where the Plaguelands' corruption is at its thickest, and the things standing in it are not the usual plague wildlife. Scourge champions hold the glade, the same rank of undead that fought in the battle of Darrowshire.",
			"That is why anybody comes here. The dead of Darrowshire are owed an accounting, and the champions who took part in the battle can be identified from their skulls.",
		},
	},
	{
		name = "The Undercroft", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "A crypt in the south-west, and the hideout of a gang of dead troll body-thieves.",
		lore = {
			"The Undercroft is a crypt in the south-western Plaguelands, and what lives in it is a band of undead trolls under Zaeldarr the Outcast. They come out at night, go to Light's Hope Chapel, take bodies out of the grave pit below it and carry them back here. Caretaker Alen, whose pit it is, describes this as mischief and wants the head of their leader for it.",
			"Behind the crypt there is a mound of dirt beside a wagon, with a chest buried in it and a note explaining the chest. Infiltrator Hameya wrote the note while he still could: he and his brethren ate bad meat on the road to Zul'Mashar and changed, he can feel a lich's words urging him on to infect more of his own people, and the note asks the reader to kill him and keep what is buried. He has the key.",
		},
		readMore = { "Wowpedia: Undercroft", "Wowpedia: Zaeldarr the Outcast", "Wowpedia: Hameya's Plea" },
	},
	{
		name = "Northpass Tower", parent = "Eastern Plaguelands", faction = "Contested",
		hook = "The northernmost of the zone's four towers, on the road out towards Quel'Thalas.",
		lore = {
			"Four towers stand at the Eastern Plaguelands' compass points: Northpass, Eastwall, Crown Guard and the Plaguewood tower. They were Lordaeron's watch posts, and shrines to Lordaeron still stand at the foot of this one.",
			"Northpass is the one on the northern road, and the pass it watches leads up towards what is left of Quel'Thalas. The tower is a ruin with plaguebats and plaguehounds around it.",
			"Both sides want all four. The emissaries at Light's Hope Chapel, one for the Alliance and one for the Horde, send people to take the towers and hold them as outposts, which is what the banners at each one are for.",
		},
	},
	{
		name = "Terrordale", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "A ruined town by the Plaguewood, with two unlikely residents.",
		lore = {
			"Terrordale lies in the northwest of the Eastern Plaguelands, near Stratholme. Augustus the Touched wants to reopen his shop here, while Egan works on freeing the souls trapped in Stratholme.",
			"The town itself is haunted. Patches of disturbed ground reveal the torment of its spirits, and paladins are sent here to perform exorcisms.",
		},
		readMore = { "Wowpedia: Terrordale", "Wowpedia: Augustus' Receipt Book (quest)", "Wowpedia: The Restless Souls", "Wowpedia: Exorcising Terrordale" },
	},
})

-- ---------------------------------------------------------------------------
-- DEADWIND PASS
-- ---------------------------------------------------------------------------

Zone{
	name = "Deadwind Pass", continent = EK, faction = "Contested", levels = "55-60",
	hook = "An emptied canyon road under Karazhan, the tower of the Guardian who betrayed the world.",
	lore = {
		"Deadwind Pass is the canyon between Duskwood and the Swamp of Sorrows, and hardly anyone passes through it. What population it has is ogres, who hold the canyon and are set on clearing out anyone else, with harpies in the gullies above them. There was a village in the south of the chasm once. Its people were killed, and the records on who did it are thin.",
		"The reason to come here is Karazhan. The tower was the seat of Medivh, the last Guardian of Tirisfal, an order of mages charged with defending this world from the Burning Legion. Medivh was the most powerful mortal spellcaster alive and the Legion got to him before he was born: the spirit of the demon lord Sargeras had been bound into him in the womb.",
		"Medivh opened the Dark Portal. He brought the orcish Horde to this world and let the First War happen, and he did it from this tower. His apprentice Khadgar and the knight Anduin Lothar eventually killed him here. The tower has been sealed and uninhabited since, and it has not stopped radiating whatever Medivh left in it.",
	},
	didYouKnow = "Medivh is also the reason the Alliance won the Second War. Freed of Sargeras at the end, he returned as a prophet during the Third War and assembled the alliance of humans, orcs and night elves that stopped Archimonde at Mount Hyjal. He is one of history's most consequential figures in both directions.",
	readMore = { "Wowpedia: Deadwind Pass", "Wowpedia: Karazhan", "Wowpedia: Medivh" },
}

SubsOf("Deadwind Pass", {
	{
		name = "Karazhan", parent = "Deadwind Pass", faction = "Hostile",
		hook = "Medivh's abandoned tower in southern Deadwind Pass.",
		lore = {
			"Karazhan stands in southern Deadwind Pass. It was the home of Medivh, the last Guardian of Tirisfal, and the place where Khadgar served as his apprentice.",
			"Medivh died here during the First War. The tower still stands above the deserted settlement at its foot.",
		},
		readMore = { "Wowpedia: Karazhan", "Wowpedia: The Last Guardian" },
	},
	{
		name = "Deadwind Ravine", parent = "Deadwind Pass", faction = "Contested",
		hook = "The canyon floor, with an ogre camp and a very long silence.",
		lore = {
			"The ravine is a craggy cleft running south through the mountains toward Karazhan, and the western road runs through it on the upper level, ending at the southern bridge below the tower. Deadwind ogres have camped along it, the closest thing this zone has to a population: brutes and maulers, with warlocks and an ogre mage among them.",
			"There is no inn, no flight path and no settlement in Deadwind Pass. Travellers go through without stopping. That is the pass's entire character.",
		},
	},
	{
		name = "The Vice", parent = "Deadwind Pass", faction = "Hostile",
		hook = "The ogre ground in the southern pass, mounds and camps along the Karazhan road.",
		lore = {
			"The Vice is where the Deadwind ogres live: several mounds and camps rather than one, scattered along the road south towards Karazhan. Brutes, maulers and ogre magi hold them, with Deadwind warlocks among them, and they are the only organised presence in the pass besides whatever is in the tower.",
			"Why they settled a canyon with nothing in it but restless spirits and a few vultures is not a question anybody has an answer to.",
		},
		readMore = { "Wowpedia: Vice", "Wowpedia: Deadwind Pass" },
	},
})

-- ---------------------------------------------------------------------------
-- BLASTED LANDS
-- ---------------------------------------------------------------------------

Zone{
	name = "Blasted Lands", continent = EK, faction = "Contested", levels = "45-55",
	hook = "A land burned to red glass by the Dark Portal, with the portal still standing in the middle of it.",
	lore = {
		"This was the Black Morass, a swamp at the southern end of the Eastern Kingdoms. Then Medivh and the orc warlock Gul'dan opened the Dark Portal here, and the raw energy of a tear between worlds scoured the region down to cracked red rock.",
		"The Horde came through this portal in the First War. After the Second War, the Alliance sent an expedition back through it into Draenor to finish the orcs for good. The portal was destroyed from the other side, and Turalyon, Khadgar, Danath Trollbane, Kurdran Wildhammer and Alleria Windrunner were left on the far side of it. None of them have been heard from since.",
		"Nethergarde Keep went up at Khadgar's insistence after the Second War, to watch the ruins of the portal and make certain nothing else came through. Something still did: the Burning Legion holds the Tainted Scar, with Lord Kazzak commanding the field there.",
	},
	didYouKnow = "The portal frame is still standing and still faintly active. The Alliance considers Nethergarde Keep's garrison one of the most important postings in the world, and it has been watching an empty gate for years.",
	readMore = { "Wowpedia: Blasted Lands", "Wowpedia: Dark Portal", "Wowpedia: Alliance Expedition" },
}

SubsOf("Blasted Lands", {
	{
		name = "Nethergarde Keep", faction = "Alliance", levels = "45-55",
		hook = "An Alliance fortress built to watch the Dark Portal.",
		lore = {
			"After the Second War, the Kirin Tor built Nethergarde to watch the rift left at the ruined Dark Portal. The fortress still stands in the northeastern Blasted Lands.",
			"Mages here study the portal and depend on frequent supplies. Couriers face a dangerous route from Stormwind and are needed when a shipment cannot wait for the next caravan.",
		},
		readMore = { "Wowpedia: Nethergarde Keep", "Wowpedia: Warcraft II: Beyond the Dark Portal manual", "Wowpedia: Vital Supplies (quest)", "Wowpedia: Supplies for Nethergarde" },
	},
	{
		name = "The Dark Portal", parent = "Blasted Lands", faction = "Hostile",
		hook = "The gate the orcs came through, standing dormant in the Blasted Lands.",
		lore = {
			"Medivh, under Sargeras' influence, worked with Gul'dan to open the Dark Portal between Azeroth and Draenor. The invading orcs came through it at the beginning of the First War.",
			"After the Second War, the Alliance Expedition crossed to Draenor and destroyed the portal from that side as the world broke apart. On Azeroth, the stone gateway still stands in a crater, surrounded by demons.",
		},
		readMore = { "Wowpedia: Dark Portal", "Wowpedia: The Dark Portal and the Fall of Stormwind" },
	},
	{
		name = "The Tainted Scar", parent = "Blasted Lands", faction = "Hostile",
		hook = "A demon-held crater in the west, where the Legion has set up shop outright.",
		lore = {
			"The Tainted Scar is the Burning Legion's foothold in the Blasted Lands. Lord Kazzak, a doomguard commander, holds the field there with a standing force of demons.",
			"This is not a summoning that got out of hand. It is an occupation, and the Alliance at Nethergarde does not have the strength to clear it.",
		},
	},
	{
		name = "Rise of the Defiler", parent = "Blasted Lands", faction = "Hostile",
		hook = "Craggy high ground in the middle of the Blasted Lands, held by a demon lord.",
		lore = {
			"Razelikh the Defiler keeps these mountains, and Razelikh is not his name. The name is Rakh'likh, and getting hold of it is a piece of work in itself.",
			"He does not hold the Blasted Lands alone. Three subordinates, Sevine and Allistarj and Grol, each wear a third of an amulet he made, attuned to its wearer's lifeforce, and while they stay inside the Blasted Lands none of the three can be killed at all. The same amulet, whole, is what summons him.",
			"The cost of that arrangement is paid by other people. There are eighteen stones scattered across the zone holding men bound as servants to the four of them, in what one of the bound describes as eternal torture, and they have to be broken one at a time.",
		},
	},
	{
		name = "Dreadmaul Hold", parent = "Blasted Lands", faction = "Hostile",
		hook = "The Dreadmaul ogres' hold, serving a demon out of conviction.",
		lore = {
			"The Dreadmaul clan in the Blasted Lands has bound itself to Razelikh rather than to any orcish authority.",
			"Ogres with a demon patron are more dangerous than ogres without one. That fact shapes the whole of this zone's geography.",
		},
	},
	{
		name = "Serpent's Coil", parent = "Blasted Lands", faction = "Contested",
		hook = "A winding cave in the eastern Blasted Lands, occupied by the Shadowsworn.",
		lore = {
			"Serpent's Coil is a labyrinth of caves in the eastern Blasted Lands. Archmage Allistarj operates here with his Shadowsworn followers.",
			"The Fallen Hero of the Horde remembers being imprisoned and tortured by Allistarj alongside Lieutenant Kirith. He seeks news of his missing companion within the caves.",
		},
		readMore = { "Wowpedia: Serpent's Coil", "Wowpedia: Kirith (quest)" },
	},
	{
		name = "Dreadmaul Post", parent = "Blasted Lands", faction = "Hostile",
		hook = "The Dreadmaul clan's mound in the middle of the Blasted Lands.",
		lore = {
			"Dreadmaul Post sits in the centre of the zone, on the ground between Nethergarde Keep and the Dark Portal, and the ogres on it are the heaviest the clan puts out: maulers and warlocks rather than the brutes at Dreadmaul Hold in the north. A cauldron is going in the middle of the camp.",
			"The Dreadmaul came through the Dark Portal from Draenor and never went far from it. They are still here two wars later, and felbeasts out of the Tainted Scar drift through the post from the south.",
		},
	},
	{
		name = "Garrison Armory", parent = "Blasted Lands", faction = "Contested",
		hook = "An abandoned Alliance armoury from the Second War, still full of gear.",
		lore = {
			"The armoury supplied the forces that fought the Second War's southern campaign and the expedition that went through the portal.",
			"It was left behind when the expedition did not return. There has been no reason to restock it and no one has cleared it out.",
		},
	},
	{
		name = "Altar of Storms", parent = "Blasted Lands", faction = "Hostile",
		hook = "One of the old altars of storms, north-east of the Dark Portal.",
		lore = {
			"The Old Horde raised altars like this across the lands it took, and this one stands on the ground where it first came through. Gul'dan meant to use their power against the elves' defences at Quel'Thalas, because the altars were made from the elves' own runestones.",
			"Lady Sevine holds this one now with her servants, and a stone of binding stands beside it. The Shadow Council that ran the Old Horde through Gul'dan was a warlock cabal, and altars like this one were its working equipment.",
		},
		readMore = { "Wowpedia: Altar of Storms", "Wowpedia: Lady Sevine", "Wowpedia: Shadow Council" },
	},
})

-- ---------------------------------------------------------------------------
-- FROM THE AREA SWEEP
--
-- Places the client names that had no entry until tools/area-sweep.md went
-- looking. Written as background, and deliberately NOT as questline summaries:
-- Darrowshire and the Shady Rest both have vanilla quest chains attached whose
-- turns are not given away here.
-- ---------------------------------------------------------------------------

SubsOf("Eastern Plaguelands", {
	{
		name = "Darrowshire", parent = "Eastern Plaguelands", faction = "Hostile",
		aliases = { "Ruins of Darrowshire" },
		hook = "A village destroyed in a battle its dead are still fighting.",
		lore = {
			"Darrowshire lies in the southern hills of the Eastern Plaguelands. The village made a stand against the Scourge during the Third War and lost, the battle was a massacre on both sides, and many of its defenders now serve as undead elsewhere in the region.",
			"It has not stopped. The dead of Darrowshire are still in the village fighting the same fight, and laying them to rest is one of the Argent Dawn's long-standing concerns. Doing it requires knowing exactly who did what on the day, which means the heroes, the defenders, the villains and the marauders all have to be accounted for separately.",
			"Pamela Redpath remains among the ruins. Her surviving family is searching for news of her.",
		},
		readMore = { "Wowpedia: Darrowshire", "Wowpedia: Sister Pamela", "Wowpedia: Defenders of Darrowshire" },
	},
})

SubsOf("Tirisfal Glades", {
	{
		name = "Faol's Rest", parent = "Tirisfal Glades", faction = "Contested",
		hook = "The grave of the archbishop who founded the Silver Hand, now untended.",
		lore = {
			"Alonsus Faol was Archbishop of the Church of the Holy Light. With Uther at his side he founded the Knights of the Silver Hand, the first paladins, and trained the generation who fought the orcs to a standstill.",
			"He died before the Scourge came and was spared the sight of what his own best student became: Arthas Menethil was raised in that tradition, and took up Frostmourne regardless.",
			"The grave sits in eastern Tirisfal, a short way south-west of the Scarlet Monastery. It drew mourners in numbers before the plague. Nobody tends it now, and the ground around it belongs to the Forsaken and the Scarlet Crusade, neither of whom have any use for a shrine to the other side's saint. The Scarlet raid out of a ruined tower further north, past the grave.",
		},
		readMore = { "Wowpedia: Alonsus Faol", "Wowpedia: Knights of the Silver Hand" },
	},
})

SubsOf("Silverpine Forest", {
	{
		name = "Fenris Keep", parent = "Silverpine Forest", faction = "Hostile",
		hook = "A former Lordaeron keep held by Thule Ravenclaw and the Rot Hide gnolls.",
		lore = {
			"Fenris Keep stands on Fenris Isle in Lordamere Lake. Thule Ravenclaw, a mage who betrayed his brethren and allied with the Scourge, commands the Rot Hide gnolls here.",
			"His former servant Alaric is among the victims of his magic. What Thule promised as protection from the plague instead left him trapped in undeath.",
		},
		readMore = { "Wowpedia: Fenris Keep", "Wowpedia: Thule Ravenclaw (quest)", "Wowpedia: Resting in Pieces" },
	},
})

SubsOf("Dun Morogh", {
	{
		name = "Anvilmar", parent = "Dun Morogh", faction = "Alliance",
		hook = "The first hall a new dwarf sees, carrying the name of their last High King.",
		lore = {
			"Anvilmar is the hall at the north end of Coldridge Valley, and the first settlement of any size a new dwarf comes to. The name is the interesting part. Modimus Anvilmar was High King when the dwarves were still one people and the clans answered to him together.",
			"His death ended that. There was no settled succession, and the Bronzebeards, the Wildhammers and the Dark Irons went to war over the throne. That is the War of the Three Hammers, and every dwarven grievance since turns on it.",
			"So a quiet hall full of dwarves taking their first instructions carries the name of the king whose death split the race. Nobody claims this is the hall he ruled from. The name is the whole of the connection.",
		},
		readMore = { "Wowpedia: Anvilmar", "Wowpedia: Modimus Anvilmar", "Wowpedia: War of the Three Hammers" },
	},
})

SubsOf("Alterac Mountains", {
	{
		name = "Ravenholdt Manor", parent = "Alterac Mountains", faction = "Hostile",
		hook = "A manor house that is the closest thing the world's rogues have to an address.",
		lore = {
			"Ravenholdt is run by Lord Jorach Ravenholdt, and what it runs is a network rather than an estate. Rogues who want work, training or protection come here, and the house asks about competence rather than allegiance.",
			"Its standing enemy is the Syndicate, the criminal remnant of Alterac's nobility. When Alterac betrayed the Alliance during the Second War the kingdom was dismantled, and the aristocracy that lost everything turned to organised crime rather than to honest work.",
			"So two outfits of thieves hold the same mountains, and the older one is the one with the pedigree.",
		},
		readMore = { "Wowpedia: Ravenholdt", "Wowpedia: Syndicate", "Wowpedia: Alterac" },
	},
})

SubsOf("Wetlands", {
	{
		name = "Menethil Keep", parent = "Wetlands", faction = "Alliance",
		hook = "The keep over Menethil Harbor, named for a royal line that no longer exists.",
		lore = {
			"Menethil Harbor is the Alliance's western port and the keep is what holds it. Both carry the name of Lordaeron's royal house: Terenas Menethil was the king who assembled the Alliance of Lordaeron and won the Second War.",
			"His son finished the house. Arthas Menethil took up Frostmourne, came home a death knight, and killed his father on the throne in Capital City.",
			"So a working harbour in dwarf country keeps the name of a dynasty whose last act was to destroy its own kingdom. Nobody has suggested changing it.",
			"Captain Stoutfist holds the keep itself, for Ironforge, with the Menethil sentries under him.",
		},
		readMore = { "Wowpedia: Menethil Harbor", "Wowpedia: Terenas Menethil II", "Wowpedia: Arthas Menethil" },
	},
})

SubsOf("Tirisfal Glades", {
	{
		name = "Shadow Grave", parent = "Tirisfal Glades", faction = "Horde",
		hook = "The crypt in the Deathknell graves where the Forsaken wake up.",
		lore = {
			"Shadow Grave sits at the top of a slope in the graves above Deathknell, with a path running down into the village. New Forsaken wake in here.",
			"Mordo, the caretaker, greets those who wake and sends them to the chapel below. Shadow Priest Sarvis explains their freedom from the Lich King and the war their new leader Sylvanas is fighting against the Scourge.",
		},
		readMore = { "Wowpedia: Shadow Grave", "Wowpedia: Rude Awakening" },
	},
	{
		name = "Agamand Family Crypt", parent = "Tirisfal Glades", faction = "Hostile",
		hook = "A farming family's tomb, with the family still in it and still moving.",
		lore = {
			"The Agamands were the most prosperous family in Tirisfal and held the mills north of Brill, and the crypt just north of those mills is where they buried their own. When the Scourge first came they fortified the house and persuaded the people in their employ to stay and help defend it, which went the way such decisions went in this region.",
			"Captain Dargol settled in the crypt afterwards and woke every corpse and spirit in it. The Agamands attack anyone who comes in unbidden.",
			"They are hostile to the Forsaken, which is the detail worth knowing. Not every corpse the Scourge raised was freed when Sylvanas broke away, and the ones still under the Lich King's will treat the Forsaken as traitors.",
			"So the first enemies most Forsaken fight are their own neighbours' dead.",
		},
		readMore = { "Wowpedia: Agamand Mills", "Wowpedia: Scourge" },
	},
})

SubsOf("Eastern Plaguelands", {
	{
		name = "Terrorweb Tunnel", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "A tunnel full of nerubians, running under the mountain from Terrordale to the river.",
		lore = {
			"The tunnel runs through the mountain north-west of Terrordale and comes out south at the Thondroril River. What is inside it is crypt fiends, which is to say nerubians, with horrors, walkers and a slayer among them and a nerubian overseer patrolling the length of it.",
			"The nerubians are not Lordaeron's dead. They were a civilisation of their own in Northrend, old and organised, with a subterranean empire called Azjol-Nerub. The Lich King made war on them and won, and the ones in this tunnel are what he turned them into.",
			"Their presence this far south says something about how far the Scourge reaches. Naxxramas hangs over these lands, and the army under it was assembled from more than one conquered people.",
		},
		readMore = { "Wowpedia: Terrorweb Tunnel", "Wowpedia: Nerubian", "Wowpedia: Azjol-Nerub" },
	},
})

SubsOf("Arathi Highlands", {
	{
		name = "The Tower of Arathor", parent = "Arathi Highlands", faction = "Hostile",
		hook = "A mage tower in fallen Stromgarde, occupied by ogres.",
		lore = {
			"The Tower of Arathor stands in the southwestern part of Stromgarde Keep. The archmage Trelane tried to defend it during the siege, but fled and left his possessions behind.",
			"Boulderfist ogres now occupy the tower. Trelane has asked his former apprentice, the archmage Malin, to help recover the items he lost.",
		},
		readMore = { "Wowpedia: Tower of Arathor", "Wowpedia: Malin's Request" },
	},
})

SubsOf("Stranglethorn Vale", {
	{
		name = "Blackwater Cove", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "The water Booty Bay sits in, and the far end of the Ratchet crossing.",
		lore = {
			"Blackwater Cove is the inlet at Stranglethorn's southern tip, and Booty Bay is built into the cliffs around it. The Blackwater Raiders are Baron Revilgaz's people and they run the port, so the cove carries their name rather than a pirate's.",
			"The cove is where the Ratchet boat ties up. A crate handed to the wharfmaster in the Barrens comes ashore here, and so does anyone crossing between the continents on goblin business.",
			"Pirates are on this coast, but they are not in the cove. The Bloodsail Buccaneers work the water further out, and the bay's bruisers are the reason they stay there.",
		},
		readMore = { "Wowpedia: Blackwater Cove", "Wowpedia: Booty Bay", "Wowpedia: Blackwater Raiders" },
	},
	{
		name = "Ruins of Jubuwal", parent = "Stranglethorn Vale", faction = "Contested",
		hook = "Troll ruins east of the Gurubashi Arena, occupied by Zanzil's followers.",
		lore = {
			"The Ruins of Jubuwal lie beside the main road through southern Stranglethorn Vale. Zanzil the Outcast's followers occupy the ruins here and at nearby Aboraz.",
			"Zanzil uses a mixture of jungle plants to suppress his followers' wills and strengthen their bodies. A buyer in Booty Bay is interested in samples of the concoction.",
		},
		readMore = { "Wowpedia: Ruins of Jubuwal", "Wowpedia: Zanzil's Secret (Classic)" },
	},
})

-- Stranglethorn Vale, continuing down tools/coverage.md.
SubsOf("Stranglethorn Vale", {
	{
		name = "Yojamba Isle", parent = "Stranglethorn Vale", faction = "Neutral",
		hook = "The Zandalar Tribe's camp, and the only reason anyone is being warned about Zul'Gurub.",
		lore = {
			"Yojamba Isle is a scatter of small islands off Stranglethorn's north-western corner, and the Zandalar Tribe came here deliberately. They are the oldest troll civilisation, the one the Gurubashi and the Amani and the rest all split off from, and they do not normally involve themselves in anyone else's affairs.",
			"They are involved now because of what is happening at Zul'Gurub. The Gurubashi have brought Hakkar the Soulflayer back, and the Zandalari judge a blood god loose in the world to be everybody's problem, including the Alliance's and the Horde's.",
			"So the isle is a recruiting station run by trolls, offering help to two factions that are at war with each other, against other trolls. The Zandalari are taking the longer view.",
		},
		didYouKnow = "The Gurubashi tore their own empire apart over Hakkar once before. The Atal'ai priesthood wanted him summoned bodily into the world, the empire split over it, and the priests were exiled. Zul'Gurub is them finishing the argument.",
		readMore = { "Wowpedia: Yojamba Isle", "Wowpedia: Zandalar tribe", "Wowpedia: Hakkar the Soulflayer", "Wowpedia: Zul'Gurub" },
	},
	{
		name = "Battle Ring", parent = "Stranglethorn Vale", faction = "Contested",
		hook = "The floor of the Gurubashi Arena, and the only part of it where anything goes.",
		lore = {
			"The Battle Ring is the arena floor itself, inside the Gurubashi Arena north of Booty Bay. The arena is Gurubashi work, left from the empire that held most of the southern Eastern Kingdoms, and the ring is where the fighting is permitted: the stands and the entrance ramp are not part of it.",
			"What runs in it now is a goblin's event. It is run by Short John Mithril, a goblin Bloodsail captain turned arena master, who starts a scrap over a chest of treasure every three hours on the clock, and whoever gets it open keeps what is inside.",
			"Fighters who keep coming back collect trinkets off the floor and a title to go with them. An empire's proving ground is a prize-fighting pit with a timetable.",
		},
		readMore = { "Wowpedia: Gurubashi Arena", "Wowpedia: Short John Mithril", "Wowpedia: Arena Master" },
	},
	{
		name = "Wild Shore", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "The southernmost beach in the Eastern Kingdoms, and the Bloodsail fleet is moored on it.",
		lore = {
			"This is where the continent stops. South of the Wild Shore is open water, and the Bloodsail Buccaneers keep their ships here because it is the last anchorage before that.",
			"The Bloodsail are at war with Booty Bay, which is a goblin port a short way up the coast on the other side of a rocky point. A neutral town that sells to everyone and a pirate fleet that takes from everyone cannot both be right about this stretch of water.",
			"Gorlash walks this beach. He is a giant, and he is not with the pirates; he is simply also here, and that is Stranglethorn's general arrangement.",
		},
		readMore = { "Wowpedia: Wild Shore", "Wowpedia: Bloodsail Buccaneers", "Wowpedia: Booty Bay" },
	},
	{
		name = "The Crimson Veil", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "The Bloodsail flagship, and where the fleet does its recruiting.",
		lore = {
			"The Crimson Veil is the Bloodsail Buccaneers' flagship and the middle of the three frigates moored off the Wild Shore. Fleet Master Firallon has her, with Ironpatch beside him and deckhands, swabbies, sea dogs and elder maguses aboard.",
			"Fleet Master Firallon recruits, and the qualification is simple: he wants people who are no friend of Booty Bay. A neutral goblin port that sells to everyone and a pirate fleet that takes from everyone cannot both be right about this stretch of water, and the goblins have answered by making the Bloodsail unwelcome in the one harbour worth visiting.",
			"Something odd is lying about on these decks. Cortello's Riddle turns up on them in threes, which is a treasure hunt the Bloodsail do not appear to have finished.",
		},
		readMore = { "Wowpedia: The Crimson Veil", "Wowpedia: Fleet Master Firallon", "Wowpedia: Bloodsail Buccaneers" },
		readMore = { "Wowpedia: Bloodsail Buccaneers" },
	},
	{
		name = "The Damsel's Luck", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "The easternmost Bloodsail frigate, with a gnome captain and a golem on deck.",
		lore = {
			"The Damsel's Luck lies furthest east of the three Bloodsail ships off the Wild Shore. Captain Stillwater, a gnome, has her, which is not what the rest of the fleet looks like, and Brutus the golem stands on her deck among the swabbies and deckhands.",
			"Pirate outfits on this coast are not a single organisation. The Bloodsail and the Blackwater Raiders are both here, and they mind each other a good deal more than either minds a traveller going past.",
		},
		readMore = { "Wowpedia: The Damsel's Luck", "Wowpedia: Captain Stillwater", "Wowpedia: Blackwater Raiders" },
	},
	{
		name = "The Riptide", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "The westernmost of the three Bloodsail frigates anchored off the Wild Shore.",
		lore = {
			"The Riptide is moored with the Crimson Veil and the Damsel's Luck off the Wild Shore, at the bottom end of the Eastern Kingdoms. Fleet Master Firallon runs the fleet from below decks on the Crimson Veil, with Captain Keelhaul and Captain Stillwater aboard alongside him.",
			"The Bloodsail keep their southern command post on the shore itself, and Booty Bay would like to know what is being planned there. Fleet Master Seahorn, who speaks for the Blackwater Raiders, pays for word of a raid on the port and reckons anyone who tries it may as well throw themselves off the Overlook Cliffs.",
			"Stranglethorn was Gurubashi country, then Stormwind's southern frontier, and now it is neither. Three pirate frigates anchored off the southern beach is what that has left.",
		},
		readMore = { "Wowpedia: The Riptide", "Wowpedia: Bloodsail Buccaneers", "Wowpedia: Stranglethorn Vale" },
	},
	{
		name = "Venture Co. Operations Center", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "A goblin oil platform on a jungle lake, run by the cartel that does not pretend to be neutral.",
		lore = {
			"The Venture Company put an oil platform on a lake in northern Stranglethorn, and they have it staffed with mechanics and geologists rather than soldiers. Foreman Cozzle runs it, with a workboss under him and a lumberjack about the place, so the prospecting is not the only thing they have in mind.",
			"The Venture Company is the goblin cartel that broke the pattern. Steamwheedle, who run Booty Bay and Ratchet and Gadgetzan, make their money by being neutral and useful to both sides. The Venture Company decided extraction was more profitable than arbitration.",
			"So they are the one goblin outfit that gets treated as an enemy by everybody, and they are in Stranglethorn, Mulgore, the Barrens and Desolace doing the same thing in each.",
		},
		readMore = { "Wowpedia: Venture Co. Operations Center", "Wowpedia: Venture Company", "Wowpedia: Steamwheedle Cartel" },
	},
})

SubsOf("Tirisfal Glades", {
	{
		name = "Stillwater Pond", parent = "Tirisfal Glades", faction = "Contested",
		hook = "Where the children of the glades used to swim, before the plague.",
		lore = {
			"Stillwater Pond is a small lake west of Brill, and before the Plague of Undeath it was where people came to picnic. It was also where children swam, being shallow enough for the ones not yet ready for Brightwater Lake.",
			"It is grey now and nobody comes. Wandering undead pass it and wild beasts drink from it. Under the surface the fish skeletons are still swimming.",
			"The darkhound Bayne works the banks. Tirisfal is full of places like this, but most of them were farms or mills; this one was simply somewhere pleasant, and it is the ordinariness that makes it hard to look at.",
		},
		readMore = { "Wowpedia: Stillwater Pond", "Wowpedia: Brill", "Wowpedia: Plague of Undeath" },
	},
	{
		name = "Bandarion Keep", parent = "Tirisfal Glades", faction = "Horde",
		era = "forever", spoiler = true,
		hook = "A Forsaken keep that was Dawn's Watch, and still keeps the Light.",
		lore = {
			"Bandarion Keep stands in western Tirisfal near the Whispering Forest, and it was called Dawn's Watch before. It belonged to the Kingdom of Lordaeron, then the Lordaeron army, then the Argent Dawn.",
			"Danitha Morr holds it for the Forsaken now, and the keep still keeps the Light. That combination is the whole of it: undead who were raised by the Scourge, freed by Sylvanas, and have not given up the faith they held when they were alive.",
			"The Scarlet Crusade would kill them for being corpses and the Church of the Holy Light will not have them. Holding a chapel in Tirisfal regardless is not a small decision.",
		},
		didYouKnow = "The Argent Dawn is the one organisation in these lands that takes Forsaken members, on the reasoning that anyone willing to fight the Scourge is worth having. A keep that went from Argent Dawn to Forsaken hands is that reasoning carried to its conclusion.",
		readMore = { "Wowpedia: Bandarion Keep", "Wowpedia: Argent Dawn", "Wowpedia: Forsaken" },
	},
	{
		name = "Whispering Forest", parent = "Tirisfal Glades", faction = "Contested",
		era = "forever", spoiler = true,
		hook = "Woodland under the cliff, with a ring of mushrooms at its heart and a knight who cannot leave it.",
		lore = {
			"The Whispering Forest fills a bowl in the mountains of western Tirisfal, west of Deathknell, under the cliff that carries Bandarion Keep. From the road above it is the one part of the glades that still reads as forest rather than as a plague site.",
			"Close up it is not. The stags and does here are diseased like everything else in Tirisfal, and they exist nowhere else; whatever took this place took its animals with it and then kept them.",
			"A ring of giant mushrooms stands at the centre, glowing, with mist sitting over it. A human ghost in a knight's armour walks that ring and will tell you an oath holds him there. He does not say what the oath was or who took it from him.",
			"The murlocs had been spawning inside the keep until the paladins above drove them out of it, so the Vile Fin went down to the lake and the bluffs instead. Something larger is in that water: an undead threshadon, and the Forsaken have got as far as naming it Blightsculler.",
		},
		readMore = { "Wowpedia: Whispering Forest", "Wowpedia: Bandarion Keep", "Wowpedia: Tirisfal Glades" },
	},
	{
		name = "Shadowvale", parent = "Tirisfal Glades", faction = "Hostile",
		era = "forever", spoiler = true,
		hook = "A dead village held by risen paladins who still think the undead should be put down.",
		lore = {
			"Shadowvale is a ruined village southwest of the lake in the Whispering Forest. The roofs are down, one farmhouse is still standing, and mindless undead are among the people in it.",
			"The rest call themselves the Tarnished, and they are paladins. They died, they were raised, they got their minds back, and they came out of it holding the same view of the undead that they held when they were alive. They act on it, and the people they act on are other Forsaken.",
			"A number of them served the Scarlet Crusade before they died. That is the shortest way to understand the problem. The Crusade kills the undead for being undead. Becoming undead has not altered that reasoning for these ones; it has only given them a nearer supply.",
			"That is what the order at Bandarion Keep is up against. Any Forsaken who distrusts a paladin can point down the valley at Shadowvale, and is not wrong about what is going on there.",
		},
		readMore = { "Wowpedia: Whispering Forest", "Wowpedia: Bandarion Keep", "Wowpedia: Forsaken" },
	},
})

SubsOf("Western Plaguelands", {
	{
		name = "Ruins of Andorhal", parent = "Western Plaguelands", faction = "Hostile",
		hook = "The town where the plague was handed out, held now by the lich who kept it.",
		lore = {
			"Andorhal was a working Lordaeron town and the kingdom's granary for this region. That is why it was chosen. Kel'Thuzad's Cult of the Damned seeded the grain stored here with the plague of undeath and let Lordaeron's own distribution network carry it to every village that bought bread.",
			"It worked perfectly. By the time anybody understood what the grain was doing, the north was already dying, and Arthas was riding from town to town finding the dead getting up.",
			"Araj the Summoner holds the ruins now, with ghouls, banshees and abominations around him. The town that poisoned a kingdom is a Scourge garrison and has been since.",
		},
		didYouKnow = "Andorhal is the single most consequential building site in recent history. Everything that follows, Arthas taking Frostmourne, Lordaeron's fall, the Forsaken, the Plaguelands themselves, runs back through a grain store.",
		readMore = { "Wowpedia: Andorhal", "Wowpedia: Kel'Thuzad", "Wowpedia: Cult of the Damned", "Wowpedia: Plague of Undeath" },
	},
	{
		name = "Chillwind Camp", parent = "Western Plaguelands", faction = "Alliance",
		hook = "The Alliance's foothold in the Plaguelands, and the last clean ground going north.",
		lore = {
			"Chillwind Camp sits in the south of the Western Plaguelands, and Commander Ashlam Valorfist has it. It is a camp rather than a fort because nobody is pretending this is a frontier that can be held.",
			"What it guards is the road. North of here is Andorhal, the Scourge, and the dead; south is Hillsbrad and country that still has living people in it.",
			"The Argent Dawn work out of this region too, and they are the one organisation that treats the Plaguelands as a problem to be solved rather than a border to be watched. Chillwind is where the Alliance's version of that effort starts.",
		},
		readMore = { "Wowpedia: Chillwind Camp", "Wowpedia: Argent Dawn" },
	},
})

SubsOf("Eastern Plaguelands", {
	{
		name = "Northdale", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "A destroyed town where a paladin gave up the Silver Hand.",
		lore = {
			"Northdale lies in the north-east of the Plaguelands, north of Light's Hope Chapel and short of the way into Quel'Thalas, and it is wreckage. Banshees hold it, with eyeless watchers that cannot be seen, and the lake beside it has corrupted elementals in it.",
			"The Order of the Silver Hand was decimated when Uther was killed, and Taelan Fordring was pushed back to this hamlet and made his last stand in it. His own account of the moment is that he wondered whether any of the Silver Hand were left alive and whether it mattered, and then threw down its standard and renounced everything he had known. The symbol is still on the ground where he dropped it, and his father has asked for it back. Tirion Fordring had already been stripped of his own title and exiled for sparing the life of an orc.",
			"So a father disgraced for showing mercy, and a son who decided mercy was the problem. The Scarlet Crusade is full of people who made that calculation while looking at ground like this.",
		},
		readMore = { "Wowpedia: Northdale", "Wowpedia: Taelan Fordring", "Wowpedia: Tirion Fordring", "Wowpedia: Scarlet Crusade" },
	},
})

SubsOf("The Hinterlands", {
	{
		name = "Wildhammer Keep", parent = "The Hinterlands", faction = "Alliance",
		hook = "The Wildhammer seat inside Aerie Peak, with an anvil and no forge.",
		lore = {
			"Aerie Peak is the Wildhammer dwarves' home, and this keep is the heart of it. It doubles as an inn, and there is an anvil in it but nothing to heat the metal.",
			"The Wildhammers are here because of the War of the Three Hammers. When Modimus Anvilmar died with no settled succession, the Bronzebeards, Wildhammers and Dark Irons fought over the throne. The Bronzebeards kept Ironforge, the Wildhammers came north to this peak, and the Dark Irons went south and bound themselves to Ragnaros.",
			"They keep gryphons rather than rams and they answer to themselves rather than to Ironforge. Three thousand years on, the dwarves are still three peoples.",
		},
		readMore = { "Wowpedia: Aerie Peak", "Wowpedia: Wildhammer clan", "Wowpedia: War of the Three Hammers" },
	},
})

SubsOf("Swamp of Sorrows", {
	{
		name = "The Harborage", parent = "Swamp of Sorrows", faction = "Neutral",
		hook = "A camp of refugees who came through the Dark Portal and kept their minds.",
		lore = {
			"The Harborage is in the northern marsh, and the people in it came from the other side of the Dark Portal. They call themselves the Lost Ones and they are not orcs.",
			"Most of their kind in this swamp have gone feral, and the Swamp of Sorrows is full of them. The ones here did not. Magtoor leads those who stayed sane, and what keeps them that way is draenethyst: crystals sacred to them, which the feral ones stole away into the Fallow Sanctuary. Magtoor says plainly that without the crystals his people may lose their way too, and that he has not the force to go and take them back.",
			"They are the other casualty of the First War. The orcs came through that portal as an army; these came through as refugees from the same ruined world, and nothing in the Alliance or the Horde has a place for them.",
		},
		readMore = { "Wowpedia: Harborage", "Wowpedia: Lost One", "Wowpedia: Dark Portal" },
	},
})

SubsOf("Badlands", {
	{
		name = "The Maker's Terrace", parent = "Badlands", faction = "Hostile",
		hook = "The excavation outside Uldaman's door, dug and held by Dark Iron.",
		lore = {
			"The Terrace is the dig outside the entrance to Uldaman, and for anyone coming into the Badlands from Loch Modan it is the first thing on the road. Uldaman itself is a vault older than any dwarven work.",
			"Agmond's diggers turned up carved stone urns at this site before Agmond died out here, and Prospector Ironband thinks the urns are what stirred the troggs up. They are still standing on the terrace.",
			"The Dark Iron hold the ground now. Shadowforge diggers, surveyors and ruffians work it in force and every one of them is elite, with war golems and an obsidian golem among them.",
		},
		readMore = { "Wowpedia: Maker's Terrace", "Wowpedia: Uldaman", "Wowpedia: Agmond's Fate" },
	},
})

SubsOf("Redridge Mountains", {
	{
		name = "Stonewatch Keep", parent = "Redridge Mountains", faction = "Hostile",
		hook = "Lakeshire's own keep, taken by orcs for a warlock who then turned on them.",
		lore = {
			"Stonewatch belonged to the humans of Lakeshire and guarded the pass. The warlock Morganth made an arrangement with the Blackrock orcs under Gath'Ilzogg, and between them they came into Redridge and took it.",
			"Then Morganth turned on the orcs he had just won it with. That is the ordinary end of a warlock's alliance, and the orcs who did the fighting appear not to have seen it coming.",
			"Lakeshire is still down the road, still smaller than its own keep, and still asking Stormwind for help that does not arrive. Redridge is one of the places where the regency's record looks worst.",
		},
		readMore = { "Wowpedia: Stonewatch Keep", "Wowpedia: Morganth", "Wowpedia: Blackrock clan" },
	},
	{
		name = "Stonewatch Tower", parent = "Redridge Mountains", faction = "Hostile",
		hook = "The intact watch tower beside the captured keep, with a mage's ear hidden in it.",
		lore = {
			"Stonewatch Tower is the second structure of the Stonewatch stronghold, standing beside the keep, and it is the one still intact. Both belonged to Lakeshire until the Blackrock clan took them, and Gath'Ilzogg holds the ground now.",
			"The position is the whole reason anybody wants it. The Blackrock came down out of the Burning Steppes to claim Stonewatch, and from it they maraud the country north of Lakeshire and keep the townspeople indoors. A human fort built to watch the road towards Blackrock Mountain is now held by the people it was built to watch for.",
			"The tower has a second use nobody in the keep knows about. Theocritus at the Tower of Azora wants to know why Morganth, up at the Tower of Ilgalar, is in conflict with the orcs in Stonewatch Keep, and his method is a Glyph of Azora hidden at the top of this tower, dropped into an empty liquor jar left forgotten on a pair of barrels, close enough to read the minds inside.",
		},
		readMore = { "Wowpedia: Stonewatch Tower", "Wowpedia: Looking Further", "Wowpedia: Gath'Ilzogg" },
	},
})

SubsOf("Deadwind Pass", {
	{
		name = "The Master's Cellar", parent = "Deadwind Pass", faction = "Hostile",
		hook = "The servants' cellars below Karazhan, and nobody down there has left.",
		lore = {
			"At the southern end of Deadwind Pass, under the ruins of a small village, there is a cellar system full of ghosts. The village was most likely where Karazhan's servants lived, and the tower is just north.",
			"One entrance opens into an enormous wine cellar. What is in it answers to names like Unliving Resident and Unliving Caretaker, along with damned souls and wailing spectres, and the lower section goes further down.",
			"Karazhan was Medivh's tower. Medivh was the last Guardian of Tirisfal and Sargeras was inside him from before his birth; he opened the Dark Portal and let the Horde into this world. Whatever happened to the household did not happen to them for any fault of their own.",
		},
		readMore = { "Wowpedia: Master's Cellar", "Wowpedia: Karazhan", "Wowpedia: Medivh" },
	},
	{
		name = "Deadman's Crossing", parent = "Deadwind Pass", faction = "Contested",
		hook = "A crossroads with a hanging tree and a sign telling you to turn back.",
		lore = {
			"Three roads meet here: west into Duskwood, east towards the Swamp of Sorrows, and south towards Karazhan.",
			"The junction is marked with a hangman's tree that still has a pair of corpses in it, and a signpost. The signpost says \"Turn Back!\" and, underneath, \"Abandon hope, all ye who enter here.\"",
			"Somebody went to the trouble of putting that up, and it is pointing south. Deadwind Pass is the emptiest inhabited-looking place in the Eastern Kingdoms, and the warning is the only thing in it that was written for travellers.",
		},
		readMore = { "Wowpedia: Deadman's Crossing", "Wowpedia: Deadwind Pass" },
	},
	{
		name = "Grosh'gok Compound", parent = "Deadwind Pass", faction = "Hostile",
		hook = "The largest of the Vice's caves, held by the Deadwind ogres.",
		lore = {
			"The Vice is the side canyon off the main road, and the Grosh'gok Compound is the southernmost and largest of the caves in it. Ogres hold it: Deadwind brutes and maulers, with warlocks and ogre magi behind them.",
			"Ogres in the Eastern Kingdoms are what the Old Horde left behind. Gul'dan brought them through the Dark Portal during the Second War and the collapse abandoned them here with no masters and no way home.",
		},
		readMore = { "Wowpedia: Grosh'gok Compound", "Wowpedia: Ogre", "Wowpedia: Deadwind Pass" },
	},
})

SubsOf("Dun Morogh", {
	{
		name = "Ironband's Compound", parent = "Dun Morogh", faction = "Hostile",
		hook = "A blacksmith's compound south of Helm's Bed Lake, taken by the Dark Iron.",
		lore = {
			"Sturgy Ironband taught blacksmithing here, south of Helm's Bed Lake in eastern Dun Morogh, and he was the best there was at it. Then one of his students brought him a load of strange ore. He called it umbral ore and was eager to work with it, and a band of Dark Iron dwarves came for the compound not long after it arrived and killed everyone in the place.",
			"The Dark Iron hold it now and go for anyone who comes close. One of his students wants the ore back and the master answered for. Ironforge wants something colder: Muiredon Battleforge is after a Dark Iron script, because dwarves dug in this far into Bronzebeard country, with a leader handing out orders, is a presence and not a raid.",
			"The Dark Iron are the third clan from the War of the Three Hammers, the one that lost twice: beaten for the throne, then bound to Ragnaros by their own emperor's summoning. They have spent the time since trying to get back into the mountain.",
		},
		readMore = { "Wowpedia: Ironband's Compound", "Wowpedia: Dark Iron clan", "Wowpedia: War of the Three Hammers" },
	},
	{
		name = "Steelgrill's Depot", parent = "Dun Morogh", faction = "Alliance",
		hook = "A siege engine shop north-east of Kharanos, and a haunt for tank pilots.",
		lore = {
			"Steelgrill's Depot is Beldin Steelgrill's mechanic shop, north-east of Kharanos, and he is the best siege engine tech there is. He is also hard on his tools. He gets through arclight spanners faster than anyone can supply them, and he broke his last fang-ratchet an hour before needing it to finish Pilot Stonegear's engine.",
			"The depot is where veteran tank pilots sit about, so it is worth keeping your ears open in it. Pilot Bellowfiz is stocking his tank, the Jetsteam, with a month of supplies for a long Siege Brigade run, and Pilot Stonegear has heard of a rare ore and wants it for his own engine's firepower.",
			"There is a mining trainer and an engineering trainer here as well, and Loslor Rudge sells the parts.",
		},
		readMore = { "Wowpedia: Steelgrill's Depot", "Wowpedia: Tools for Steelgrill", "Wowpedia: Beldin Steelgrill" },
	},
})

SubsOf("Elwynn Forest", {
	{
		name = "The Stonefield Farm", parent = "Elwynn Forest", faction = "Alliance",
		aliases = { "Stonefield Farm" },
		hook = "One half of a farming feud, with a child in love with the other half.",
		lore = {
			"The Stonefields farm in southern Elwynn and they loathe the Maclures next door. Nobody involved seems able to say exactly when it started or what it was about, beyond a generation of each accusing the other of theft.",
			"It has gone the way these things do. Tommy Joe Stonefield and Maybell Maclure are in love, he spends his time at the river west of the farm, and Gramma Stonefield is the one who works out that William Pestle at the inn could brew something to get Maybell Maclure off the vineyard for an afternoon.",
			"The rest of the household has its own business. Bernice Stonefield lost her necklace and is sure Billy Maclure took it, and she is right: he dropped it near the Fargodeep Mine and a big gold-toothed kobold picked it up and carried it in. Ma Stonefield wants the Brackwells' prize sow dead, because Princess keeps coming over from the pumpkin patch to eat the vegetables, and will pay for the collar as proof.",
			"Elwynn is the quietest zone in the Eastern Kingdoms and its largest ongoing dispute is between two farms over nothing. The Fargodeep Mine sits almost due south of Goldshire between the two homesteads, which is how most people find out where either of them is.",
		},
		didYouKnow = "The feud is a nod to the Hatfields and the McCoys, and the romance to Romeo and Juliet. Elwynn's writers were having a good day.",
		readMore = { "Wowpedia: Stonefield Farm", "Wowpedia: Elwynn Forest" },
	},
	{
		name = "The Maclure Vineyards", parent = "Elwynn Forest", faction = "Alliance",
		aliases = { "Maclure Vineyards" },
		hook = "The other half of the feud, and the one with the grapes.",
		lore = {
			"The Maclures grow grapes on the southern slopes of Elwynn, next door to the Stonefields, with whom they are not on speaking terms. Joshua Maclure is the vintner and Pa Maclure holds the farm.",
			"The feud has a hole in the middle of it. Maybell Maclure and Tommy Joe Stonefield are in love, and getting her off the vineyard to meet him has taken a note to William Pestle at the inn, a trip to the murlocs at Crystal Lake for crystal kelp, and a bottle of invisibility liquor brewed out of it.",
			"The rest of the rivalry runs on small grievances. Bernice Stonefield is sure Billy Maclure took her necklace, and he will say who has it in exchange for a pork belly pie that she is the one who bakes. He is usually to be found scuttling about the vines.",
			"Elwynn's real problems are elsewhere: the Defias are in the hills, kobolds are in the Fargodeep Mine almost due south of Goldshire between the two homesteads, and Hogger is in the woods. Over a dozen boars root about the vineyard rows.",
		},
		readMore = { "Wowpedia: Maclure Vineyards", "Wowpedia: Elwynn Forest" },
	},
})

SubsOf("Duskwood", {
	{
		name = "Roland's Doom", parent = "Duskwood", faction = "Hostile",
		hook = "A mine in the south-east, and where Duskwood's worgen were first found.",
		lore = {
			"The Nightbane worgen hold the mine. Gutspill leads them and Nefaru is the other one worth naming, and the Carevin family in Darkshire will tell anybody who asks that this is where the worgen first appeared, out of nowhere, before they were anywhere else in the woods.",
			"The night elf priestess Velinde Starsong is the reason the Scythe of Elune comes into it. Elune granted her the Scythe, she used it in the fight against the demons of Felwood, and then she disappeared. The Sentinels kept her chest and her journal and expected her back: she had earned their trust, and they assumed she had her reasons.",
			"Where the trail of her leads is this mine. The Rotting Orchard is next door.",
		},
		readMore = { "Wowpedia: Roland's Doom", "Wowpedia: Scythe of Elune", "Wowpedia: Velinde Starsong", "Wowpedia: Worgen" },
	},
})

SubsOf("Westfall", {
	{
		name = "Stendel's Pond", parent = "Westfall", faction = "Contested",
		hook = "A small pond southwest of Sentinel Hill, occupied by gnolls.",
		lore = {
			"Stendel's Pond lies southwest of Sentinel Hill in Westfall. Gnolls inhabit the ground around the water, with skeletons and two graves nearby.",
		},
		readMore = { "Wowpedia: Stendel's Pond" },
	},
})

SubsOf("Stormwind City", {
	{
		name = "Stormwind Harbor", parent = "Stormwind City", faction = "Alliance",
		era = "forever", spoiler = true,
		hook = "A working port and shipyard in the north-west of the city.",
		lore = {
			"The harbour is wharfs, dry docks and fortifications in Stormwind's north-western quarter, and it is where the Alliance's warships are built and its fleets put together.",
			"Stormwind has needed a navy more than once and not always had one. Kul Tiras supplied the ships for the Second War, under Daelin Proudmoore, and the Alliance has been short of hulls ever since that friendship soured.",
			"Transport ships run out of here as well as warships. A capital that was burned to the ground in the First War and rebuilt by masons it then refused to pay is now a naval power. That is a particular sort of recovery.",
		},
		readMore = { "Wowpedia: Stormwind Harbor", "Wowpedia: Stormwind City", "Wowpedia: Kul Tiras" },
	},
})

SubsOf("Searing Gorge", {
	{
		name = "Stonewrought Pass", parent = "Searing Gorge", faction = "Contested",
		hook = "A tunnel out of the gorge to Loch Modan, cut by the dwarf who built the dam.",
		lore = {
			"The pass runs from the northern end of Dustfire Valley through the mountains and comes out at the Valley of Kings in Loch Modan. It was gated at both ends, and the gates were kept shut.",
			"Franclorn Forgewright designed it. He also designed the Stonewrought Dam that holds Loch Modan, and a good deal of the other serious stonework in the Eastern Kingdoms. He was a Dark Iron.",
			"That is the awkwardness at the centre of dwarven history. The clan that bound itself to Ragnaros produced the architect the other two clans' country still runs on.",
		},
		readMore = { "Wowpedia: Stonewrought Pass", "Wowpedia: Franclorn Forgewright", "Wowpedia: Stonewrought Dam" },
	},
})

SubsOf("Loch Modan", {
	{
		name = "Stoutlager Inn", parent = "Loch Modan", faction = "Alliance",
		hook = "Thelsamar's inn, with the Hearthstove family running it and the Explorers' League in it.",
		lore = {
			"The Stoutlager is Thelsamar's inn and the Hearthstove family run it: Innkeeper Hearthstove behind the bar, Lina Hearthstove on the stables, Vidra Hearthstove about the place. A baker, a herbalist, a general goods dwarf and a tradesman all work out of the same rooms, and there is an anvil, a forge and a mailbox outside the door.",
			"Two Explorers' League dwarves, Torren Squarejaw and Jern Hornhelm, are usually in here as well, which is how a good deal of the digging in Loch Modan gets staffed.",
			"On the wall is a notice. By order of the Magistrate of Thelsamar, Chok'sul is wanted: the ogre held to be behind the attacks on the town, on the Stonewrought Dam and on the excavation site.",
		},
		readMore = { "Wowpedia: Stoutlager Inn", "Wowpedia: Thelsamar", "Wowpedia: Chok'sul" },
	},
})

SubsOf("Duskwood", {
	{
		name = "Forlorn Rowe", parent = "Duskwood", faction = "Hostile",
		hook = "A dark hill over Raven Hill Cemetery, with a necromancer's house on top.",
		lore = {
			"The Rowe is a hill on the northern edge of Raven Hill Cemetery, and it is darker than the rest of Duskwood, and that takes some doing.",
			"Morbent Fel lives on it. He is a necromancer, and the undead throughout these woods answer to him.",
			"He cannot be put down with ordinary weapons, and a detail like that turns a local problem into a campaign. The Dark Riders have been seen on this hill in conversation with him, so Duskwood's troubles are less separate than they look: the worgen, the Nightbane pack, the Scythe of Elune and the riders.",
		},
		readMore = { "Wowpedia: Forlorn Rowe", "Wowpedia: Morbent Fel", "Wowpedia: Raven Hill Cemetery" },
	},
})

SubsOf("Silverpine Forest", {
	{
		name = "The Shining Strand", parent = "Silverpine Forest", faction = "Contested",
		hook = "Silverpine's shore of Lordamere Lake, running up to the old capital.",
		lore = {
			"The Shining Strand is the lakeshore, stretching from Lordaeron's capital city in the north down to the hills that divide Silverpine from the Alterac Mountains.",
			"The Vile Fin murlocs have settlements the whole length of it and they make the walk dangerous: lakestalkers, shredders, tidecallers, tidehunters, oracles and shorecreepers, in numbers no other stretch of Silverpine has to deal with. Their hold on the Dawning Isles out in the lake is the same tribe.",
			"The capital at the north end is the Ruins of Lordaeron, with the Undercity dug out beneath it. A pleasant name for a shoreline that leads to that.",
		},
		readMore = { "Wowpedia: Shining Strand", "Wowpedia: Lordamere Lake", "Wowpedia: Silverpine Forest" },
	},
	{
		name = "The Dawning Isles", parent = "Silverpine Forest", faction = "Hostile",
		hook = "Low islands in Lordamere Lake, inhabited by murlocs and bog beasts.",
		lore = {
			"The Dawning Isles rise from Lordamere Lake beside Silverpine Forest. The plague has sickened their trees, and murlocs and bog beasts inhabit the islands.",
		},
		readMore = { "Wowpedia: The Dawning Isles" },
	},
})

SubsOf("Wetlands", {
	{
		name = "Deepwater Tavern", parent = "Wetlands", faction = "Alliance",
		hook = "Menethil Harbor's tavern, and the usual site of the bar fight.",
		lore = {
			"The Deepwater is the hub of Menethil Harbor: quests, vendors, and everyone passing through on their way to Kalimdor. Archaeologist Flagongut has been holed up in it for a while, waiting on an escort out to Whelgar's dig with a fossil he believes has a power in it.",
			"It is also where the fights happen, and a good proportion of them are started by Tapoke \"Slim\" Jahn. He is a known quantity in the harbour and nobody appears to have done anything about him.",
			"Menethil is the Alliance's western port, named for Lordaeron's royal house, run by dwarves, and jammed with people waiting for a boat. A tavern with a reliable brawl in it is the natural result.",
		},
		readMore = { "Wowpedia: Deepwater Tavern", "Wowpedia: Menethil Harbor" },
	},
})

SubsOf("Hillsbrad Foothills", {
	{
		name = "Hillsbrad", parent = "Hillsbrad Foothills", faction = "Alliance",
		aliases = { "Hillsbrad Fields" },
		hook = "The town the foothills are named for, still standing and not expected to.",
		lore = {
			"Hillsbrad town sits in the western foothills under Magistrate Burnside, and it is human, Alliance, and holding on. It was Lordaeron's before Lordaeron fell.",
			"The position is bad. Tarren Mill is a short way north and is Forsaken, Southshore is the other human holding, and the two sides have been grinding against each other across these fields for years with no front line and no resolution.",
			"These are also the foothills where Thrall was raised. Durnholde Keep is here, Aedelas Blackmoore ran the internment camps from it, and Taretha Foxton died in Hillsbrad for helping Thrall escape.",
		},
		readMore = { "Wowpedia: Hillsbrad Fields", "Wowpedia: Durnholde Keep", "Wowpedia: Taretha Foxton" },
	},
})

SubsOf("Alterac Mountains", {
	{
		name = "Dandred's Fold", parent = "Alterac Mountains", faction = "Hostile",
		hook = "A manor on the Uplands where the Syndicate's last lord keeps court.",
		lore = {
			"Dandred's Fold is a farm and manor on the western edge of the Uplands, with a harbour of its own on Lordamere Lake.",
			"Lord Aliden Perenolde is here, with his mistress Elysa and a quantity of Syndicate men. He is the last known leader of the Syndicate, and he is the son of Aiden Perenolde, the king of Alterac who sold the Alliance to the Horde during the Second War.",
			"Alterac was dismantled for that betrayal and its aristocracy turned to organised crime. Aliden holding a manor in the hills with the family name on it is the whole of what the kingdom became.",
		},
		didYouKnow = "Aliden also had Taretha Foxton's necklace. Taretha was the human girl who helped Thrall escape Durnholde and was executed for it, and the Horde wanted the necklace back badly enough to send someone for it.",
		readMore = { "Wowpedia: Dandred's Fold", "Wowpedia: Aliden Perenolde", "Wowpedia: Syndicate", "Wowpedia: Taretha Foxton" },
	},
})

SubsOf("Stranglethorn Vale", {
	{
		name = "Southern Savage Coast", parent = "Stranglethorn Vale", faction = "Contested",
		hook = "The beaches along southern Stranglethorn's western shore.",
		lore = {
			"The Southern Savage Coast follows the western side of southern Stranglethorn. The Vile Reef separates it from the Savage Coast to the north; Booty Bay and Janeiro's Point lie towards its southern end.",
			"Bloodsail pirates have been seen in the cove north of Booty Bay. The port is looking for someone to scout their position.",
		},
		readMore = { "Wowpedia: Southern Savage Coast", "Wowpedia: The Bloodsail Buccaneers (Classic)" },
	},
	{
		name = "Spirit Den", parent = "Stranglethorn Vale", faction = "Neutral",
		hook = "A hidden cave in Mistvale Valley with a witch doctor in it.",
		lore = {
			"The Spirit Den is tucked into the northern end of Mistvale Valley on the cape, and it takes finding.",
			"Witch Doctor Unbagwa works out of it, alone, and he is the one people come to about Stranglethorn fever. Its only known cure is to eat the heart of Mokk, an elusive white gorilla, and the witch doctor is the only one who can summon the beast at all.",
			"He wants a gorilla fang first. Then he talks to the spirits, and the other gorillas of the valley come to the talking as well, so whoever wanted Mokk has to stand over the witch doctor and keep them off him while he works.",
		},
		readMore = { "Wowpedia: Spirit Den", "Wowpedia: Witch Doctor Unbagwa", "Wowpedia: Stranglethorn Fever (quest)" },
	},
})

SubsOf("Tirisfal Glades", {
	{
		name = "Brill Town Hall", parent = "Tirisfal Glades", faction = "Horde",
		hook = "Brill's town hall, where a magistrate hands out work to the dead.",
		lore = {
			"The town hall is the most prominent building in Brill, and Magistrate Sevren runs the place from a podium inside it, giving out orders and errands to any Forsaken willing to take them.",
			"A town hall is a strange thing for the Forsaken to keep at all, and this is the one they keep.",
			"That is the shape of Sylvanas's project. The Forsaken do not want to be a horde of wandering dead; they want a state, with magistrates and paperwork and a hall to do it in, and Brill is where they practise.",
		},
		readMore = { "Wowpedia: Brill Town Hall", "Wowpedia: Brill", "Wowpedia: Forsaken" },
	},
})

SubsOf("Swamp of Sorrows", {
	{
		name = "Stagalbog Cave", parent = "Swamp of Sorrows", faction = "Hostile",
		hook = "A large cave in the eastern bog, held by murlocs under the Swamp Talker.",
		lore = {
			"Stagalbog Cave lies in the southern mountains of the Swamp of Sorrows. Marsh tribe murlocs occupy it, and the Swamp Talker is among them.",
			"A Horde courier was ambushed by murlocs on his way to the Blasted Lands. His account names the Swamp Talker as the one who took his orders and points towards this cave.",
		},
		readMore = { "Wowpedia: Stagalbog Cave", "Wowpedia: The Swamp Talker" },
	},
	{
		name = "Misty Reed Post", parent = "Swamp of Sorrows", faction = "Horde",
		hook = "A small Horde picket off Stonard, with ambitions.",
		lore = {
			"Misty Reed Post belongs to Stonard and sits between the Stagalbog and the southern reaches of the Misty Reed Strand. Tok'Kar has it, with Katar, a handful of Stonard hunters and a shaman.",
			"There is no flight path and there is not much of a post. Tok'Kar's stated hope is that one day it might get a burrow, or failing that a tower.",
			"Stonard is the Horde's hold in this swamp and it was an Old Horde site before Thrall's Horde reoccupied it. A picket out in the reeds hoping for a tower is what the far end of that supply line looks like.",
		},
		readMore = { "Wowpedia: Misty Reed Post", "Wowpedia: Stonard" },
	},
})

SubsOf("Deadwind Pass", {
	{
		name = "Ariden's Camp", parent = "Deadwind Pass", faction = "Hostile",
		hook = "A deserted campsite by the road through the pass, and nobody is saying whose.",
		lore = {
			"The camp sits just north of the road that carries travellers through Deadwind Pass from Duskwood to the Swamp of Sorrows. Whoever pitched it is gone and the site has been left standing.",
			"What the pass is known for is the riders. Dark Riders came out of Deadwind Pass and killed Sven Yorgen's family on their farm over in Duskwood while he was away, and a shadowy figure was seen burying something near the barn afterwards. He has been hunting them since, and what he has learned is that the riders were seen speaking with the wizard Morbent Fel at the Forlorn Rowe.",
			"Karazhan stands over all of it, a short way further into the pass, and that is as much explanation as anyone in Duskwood needs for why the riders come from here.",
		},
		readMore = { "Wowpedia: Ariden's Camp", "Wowpedia: Sven's Revenge", "Wowpedia: Deadwind Pass" },
	},
	{
		name = "Sleeping Gorge", parent = "Deadwind Pass", faction = "Contested",
		hook = "A small chasm on one of the paths to Karazhan.",
		lore = {
			"The Sleeping Gorge is a short chasm in the east of the pass. One of the ways south towards Karazhan runs along it before turning east into the Vice.",
			"Deadwind Pass is mostly geography with a tower in it. The roads here do not go to settlements, because there are none; they go to Karazhan, to an ogre mound, or back out.",
			"The name is the sort the pass collects. Nothing in Deadwind is called anything encouraging.",
		},
		readMore = { "Wowpedia: Sleeping Gorge", "Wowpedia: Deadwind Pass" },
	},
})

SubsOf("Redridge Mountains", {
	{
		name = "Render's Rock", parent = "Redridge Mountains", faction = "Hostile",
		hook = "A Blackrock cave in the north-west, named for Rend Blackhand.",
		lore = {
			"Render's Rock is a large cave near where Redridge meets the Burning Steppes, and it is full of Blackrock orcs.",
			"\"Render\" is Rend Blackhand, son of Blackhand, who was warchief of the Old Horde before Orgrim Doomhammer killed him. Rend never accepted the Second War's end, holds Blackrock Spire with his brother's old clan, and calls his people the true Horde.",
			"Corporal Keeshan is in that cave too. He was taken prisoner after the fighting at Stonewatch Keep and dragged up here, and he needs walking back down to Lakeshire rather than carried. Redridge's problems all come down the pass from this direction.",
		},
		readMore = { "Wowpedia: Render's Rock", "Wowpedia: Rend Blackhand", "Wowpedia: Dark Horde" },
	},
	{
		name = "Galardell Valley", parent = "Redridge Mountains", faction = "Hostile",
		hook = "The valley with the Tower of Ilgalar in it, where Morganth lives.",
		lore = {
			"Galardell Valley is in Redridge's north-east, and the Tower of Ilgalar stands in it. Morganth is in the tower.",
			"The gnolls filling the valley are his. Morganth gives the Shadowhide clan its orders through the pendants they wear, Magistrate Solomon has ruled that helping him is punishable by death, and Lakeshire's bounty is on the pendants themselves. Lieutenant Fangore leads the clan and will call every gnoll within earshot.",
			"He is also in conflict with the orcs holding Stonewatch, and nobody in Lakeshire has worked out why. What Theocritus has worked out, watching the tower from Elwynn through the Eye of Azora, is worse than the gnolls: Morganth is hunting the Scythe of Elune and may already have found it.",
		},
		readMore = { "Wowpedia: Galardell Valley", "Wowpedia: Morganth", "Wowpedia: Tower of Ilgalar" },
	},
	{
		name = "Redridge Canyons", parent = "Redridge Mountains", faction = "Hostile",
		hook = "Gnoll country in the north-west, with Yowler's den at the back of it.",
		lore = {
			"The canyons run through north-western Redridge and the local gnolls hold them. Yowler leads them and his den is in here.",
			"Gnolls are everywhere in the Eastern Kingdoms and are generally treated as a nuisance rather than a threat. Redridge is one of the places where that reading looks optimistic: they have numbers, they have ground, and nobody has the men to clear them.",
			"Lakeshire is the only real settlement in the zone and it is asking Stormwind for soldiers. Stormwind has other priorities, and the canyons are the result.",
		},
		readMore = { "Wowpedia: Redridge Canyons", "Wowpedia: Gnoll", "Wowpedia: Lakeshire" },
	},
})

SubsOf("The Hinterlands", {
	{
		name = "Shindigger's Camp", parent = "The Hinterlands", faction = "Alliance",
		hook = "A dwarf and a high elf sharing a camp, and that is rarer than it sounds.",
		lore = {
			"Rhapsody Shindigger was the best rider Gryphon Master Talonaxe had at Aerie Peak, until the drink. Nobody could fly like him and nobody could keep him sober, so the aviary let him go, and he set up this camp east of it to brew instead. He hiccups through every sentence.",
			"The story the aviary will not finish is the flight. He drank a whole keg of stout before taking Brohann Caskbelly, of the Explorers' League, over the Swamp of Sorrows to look for a sunken temple, went too tipsy, came off his mount, dropped straight into the water and was pulled under. He surfaced among a crowd of trolls, swam out very fast, and kept an Atal'ai tablet fragment as a souvenir. He had known the temple was down there the whole time and nobody had asked him.",
			"Gilveradin Sunchaser shares the camp and he is a high elf. When the blood elves took their new name and followed Kael'thas, a minority refused it and kept the old one, and Quel'Danil Lodge further into the zone is what they have. A high elf camped out with a cheerful Wildhammer drunk is about as settled as their position gets.",
		},
		readMore = { "Wowpedia: Shindigger's Camp", "Wowpedia: Rhapsody's Tale", "Wowpedia: Quel'Danil Lodge" },
	},
	{
		name = "Featherbeard's Hovel", parent = "The Hinterlands", faction = "Alliance",
		hook = "A house beside Aerie Peak with a dead dwarf's journal still in it.",
		lore = {
			"The hovel sits next to Aerie Peak and it was Featherbeard's home. He is not in it. His journal is still there and his remains lie out in the hills to the south-east, and that is the whole of the record.",
			"Wildhammer names run to this sort of thing, and the dwarves of Aerie Peak keep gryphons rather than rams and answer to themselves rather than Ironforge. A hovel on the slope below the keep is the ordinary housing of that arrangement.",
			"Whatever Featherbeard was doing out in those hills, it finished badly, and his house is standing empty with his notes in it. Not everything in these mountains has a war in it.",
		},
		readMore = { "Wowpedia: Featherbeard's Hovel", "Wowpedia: Aerie Peak" },
	},
})

SubsOf("Burning Steppes", {
	{
		name = "Slither Rock", parent = "Burning Steppes", faction = "Neutral",
		hook = "A cave in the far north-east that had a sarcastic black dragonspawn living in it.",
		lore = {
			"Slither Rock is small, hidden beyond the Terror Wing Path in the Burning Steppes' far corner, and for a long time one creature lived in it: Cyrus Therepentous, a black dragonspawn.",
			"He would help. That is the remarkable part. Against a shared enemy Cyrus would side with whoever turned up, and he did it while being thoroughly rude about them throughout.",
			"The black dragonflight is Deathwing's and works by infiltration rather than open war, so a black dragonspawn who simply tells you what he thinks and then assists is not behaving to type at all.",
		},
		readMore = { "Wowpedia: Slither Rock", "Wowpedia: Black dragonflight", "Wowpedia: Burning Steppes" },
	},
})

SubsOf("Wetlands", {
	{
		name = "Baradin Bay", parent = "Wetlands", faction = "Neutral",
		hook = "The stretch of the Great Sea off the continent's west coast, patrolled once by Kul Tiras.",
		lore = {
			"Baradin Bay is the water off the Wetlands coast, and Menethil Harbor sits on it. Everything that sails for Kalimdor or Theramore leaves across it.",
			"The Kul Tiran armada patrolled this bay during the Second War and after it. Kul Tiras supplied the Alliance's entire navy in that war, under Daelin Proudmoore, and the bay was effectively theirs to keep.",
			"Their wrecks are still down there. The friendship did not survive Daelin's death at Theramore, and the Alliance has been short of hulls on this coast ever since.",
		},
		readMore = { "Wowpedia: Baradin Bay", "Wowpedia: Kul Tiras", "Wowpedia: Daelin Proudmoore" },
	},
})

SubsOf("Alterac Mountains", {
	{
		name = "The Headland", parent = "Alterac Mountains", faction = "Contested",
		hook = "The third of the four ridges above Hillsbrad, with mountain lions on its slopes.",
		lore = {
			"Four ridges run down out of these mountains and stand out over Hillsbrad. Sofera's Naze is the first, Corrahn's Dagger the second, the Headland the third and Gavin's Naze the last.",
			"The Headland is mountain lion country. The Alliance entrance to Alterac Valley lies nearby, but there is no military camp on this ridge.",
		},
		readMore = { "Wowpedia: Headland" },
	},
	{
		name = "The Foothill Caverns", parent = "Alterac Mountains", faction = "Hostile",
		hook = "The cave where Helcular was killed before he could finish becoming a lich.",
		lore = {
			"The Foothill Caverns open at Darrow Hill, in the ground where Hillsbrad runs up into the Alterac Mountains. Helcular used them as his lair while he worked on turning himself into a lich, and he was almost finished when a human lynch mob found his ritual site in the hills and beat him to death.",
			"He never completed it. What he left behind is down here: the Flame of Azel and the Flame of Veraz, two of the three ceremonial pyres he built for his most powerful spell. The third, the Flame of Uzel, burns in a cave further north in the mountains.",
			"Yetis took the lair afterwards, and cave yeti and ferocious yeti hold the tunnels now. The caverns are also one of the places Alterac granite comes out of the ground.",
		},
		readMore = { "Wowpedia: Foothill Caverns", "Wowpedia: Helcular", "Wowpedia: Helcular's Revenge" },
	},
})

SubsOf("Arathi Highlands", {
	{
		name = "The Drowned Reef", parent = "Arathi Highlands", faction = "Hostile",
		hook = "A reef off the Arathi coast, strewn with wrecks and guarded by naga.",
		lore = {
			"The Drowned Reef lies off the southern shore of the Arathi Highlands. The Maiden's Folly and Spirit of Silverpine sank here after striking submerged ruins as the tide suddenly fell.",
			"Naga infest the waters, and sailors at Faldir's Cove seek the wrecks' charts and logs. Elven gems lie on the sea floor, calcified after a long time underwater.",
		},
		readMore = { "Wowpedia: The Drowned Reef", "Wowpedia: Deep Sea Salvage", "Wowpedia: Sunken Treasure (2)" },
	},
})

SubsOf("Badlands", {
	{
		name = "Camp Wurg", parent = "Badlands", faction = "Hostile",
		hook = "One of four Dustbelcher ogre camps, and the Badlands has mercenaries for hire.",
		lore = {
			"Camp Wurg is Dustbelcher ogre ground, one of four: Wurg, Cagg, Boff and Kosh, spread across the Badlands.",
			"The ogres here take work. The orcs at Kargath hired Boss Tho'grun and his band to fetch the Sign of the Earth, a key to a black dragon prison in Lethlor Ravine, and Tho'grun kept it for himself instead. His band wanders rather than holding ground, and the Kargath orcs will tell you to try Camp Boff if you are looking for them.",
			"Ogres in the Eastern Kingdoms are the Old Horde's leavings, brought through the Dark Portal by Gul'dan and abandoned when the Second War collapsed. Four camps and a mercenary contract is what they have made of that.",
		},
		readMore = { "Wowpedia: Camp Wurg", "Wowpedia: Dustbelcher", "Wowpedia: Ogre" },
	},
})

SubsOf("Dun Morogh", {
	{
		name = "North Gate Outpost", parent = "Dun Morogh", faction = "Alliance",
		hook = "The dwarves' furthest north-east post, sitting in the pass to Loch Modan.",
		lore = {
			"North Gate Outpost is the north-easternmost dwarven settlement in Dun Morogh, planted in the middle of North Gate Pass, which links this zone with Loch Modan.",
			"The mountaineers there are not fighting an enemy army. They are keeping the wildlife out of the pass, and some of their own have gone missing in the mountains looking for the larger beasts.",
			"Young dwarves and gnomes get sent out this way to learn their trade on something that bites back. It is the gentlest frontier in the Eastern Kingdoms and it still costs them people.",
		},
		readMore = { "Wowpedia: North Gate Outpost", "Wowpedia: Dun Morogh" },
	},
	{
		name = "South Gate Outpost", parent = "Dun Morogh", faction = "Alliance",
		hook = "The guard station in South Gate Pass.",
		lore = {
			"South Gate Outpost is the post that watches South Gate Pass, the lower of the two routes between Dun Morogh and Loch Modan.",
			"Two gates, two passes, two outposts. The dwarves hold Khaz Modan by holding the ways through it, and have done since long before the War of the Three Hammers split them.",
			"This is the busier of the pair, because it is the one closest to Thelsamar, and most traffic between the two zones comes through here.",
		},
		readMore = { "Wowpedia: South Gate Pass", "Wowpedia: Dun Morogh" },
	},
	{
		name = "South Gate Pass", parent = "Dun Morogh", faction = "Contested",
		hook = "The Dun Morogh end of the lower pass into Loch Modan.",
		lore = {
			"South Gate Pass runs from Dun Morogh's high mountains east into the lower hills of Loch Modan, and this is the western mouth of it.",
			"It is the pass most travellers use, because it comes out nearest Thelsamar. South Gate Outpost sits in the middle of it and counts as part of Dun Morogh, and its mountaineers have cleared the wildlife off the road. The dwarves at North Gate Outpost have never managed the same.",
			"Khaz Modan is a mountain range with dwarves in it, and almost every named place here is a way through, a way in, or a post watching one.",
		},
		readMore = { "Wowpedia: South Gate Pass", "Wowpedia: Thelsamar" },
	},
})

SubsOf("Loch Modan", {
	{
		name = "South Gate Pass", parent = "Loch Modan", faction = "Contested",
		hook = "The Loch Modan end of the same pass, nearest Thelsamar.",
		lore = {
			"This is the eastern mouth of South Gate Pass, coming out in Loch Modan's lower hills. The other end is up in Dun Morogh.",
			"Thelsamar is the closest town, which makes this the route most people take between the two zones rather than the higher North Gate Pass.",
			"Nothing is stationed in this half of the pass. South Gate Outpost and its mountaineers sit further up at the Dun Morogh end, so the eastern mouth simply opens onto the loch's lower hills.",
		},
		readMore = { "Wowpedia: South Gate Pass", "Wowpedia: Loch Modan", "Wowpedia: South Gate Outpost" },
	},
})

SubsOf("Elwynn Forest", {
	{
		name = "Northshire River", parent = "Elwynn Forest", faction = "Alliance",
		hook = "The river out of the mountains that becomes Crystal Lake.",
		lore = {
			"The Northshire River comes down out of the mountains east of Stormwind, runs through Northshire Valley past the Abbey, and empties into Crystal Lake.",
			"Northshire Abbey is where Stormwind's new recruits are taught, the valley is the first ground they walk, and the river runs through all of it. The subzone has no label on the map, so most of them never learn it has a name.",
			"The falls near the Abbey are the pleasant part of a zone that also contains the Defias, kobolds in the mines and Hogger. Elwynn is a working forest, not an idyll, but it does have this.",
		},
		readMore = { "Wowpedia: Northshire River", "Wowpedia: Northshire Abbey", "Wowpedia: Crystal Lake" },
	},
})

SubsOf("Stranglethorn Vale", {
	{
		name = "The Crystal Shore", parent = "Stranglethorn Vale", faction = "Contested",
		hook = "Sandy coast on southern Stranglethorn's eastern side, below a steep ridge.",
		lore = {
			"The Crystal Shore runs northeast from the Wild Shore, facing the eastern beaches of Jaguero Isle across the water. A steep ridge separates much of the beach from the jungle inland.",
			"The Ruins of Aboraz lie along this coast. Zanzil the Outcast and his followers occupy those ruins.",
		},
		readMore = { "Wowpedia: Crystal Shore", "Wowpedia: Saving Yenniku (Classic)" },
	},
})

SubsOf("Swamp of Sorrows", {
	{
		name = "Misty Reed Strand", parent = "Swamp of Sorrows", faction = "Contested",
		hook = "The gloomy coastline of the Swamp of Sorrows.",
		lore = {
			"The Misty Reed Strand is the beach along the Swamp of Sorrows, with driftwood, debris, crocolisks, crabs and murlocs.",
			"Stonard keeps a post towards the southern end. Along the beach, Horde adventurers hunt murlocs while Alliance visitors gather driftwood and hunt crabs.",
		},
		readMore = { "Wowpedia: Misty Reed Strand", "Wowpedia: Misty Reed Post" },
	},
})

SubsOf("Tirisfal Glades", {
	{
		name = "The North Coast", parent = "Tirisfal Glades", faction = "Hostile",
		hook = "Tirisfal's northern beach, with dead sea creatures rotting on it.",
		lore = {
			"The North Coast runs along the top edge of Tirisfal where the glades meet the Great Sea. Vile Fin murlocs have most of it, with their spawning grounds just off shore and tadpoles around the huts, and Deeb stands idle somewhere on the sand.",
			"The plague reached the water. Since the Plague of Undeath went through this region the coast has gone dark and cold, and there are dead sea creatures lying along the tideline rotting.",
			"That is the detail worth carrying away from Tirisfal. The Scourge did not only kill the people here; it got into the soil, the lakes and the sea, and the land has not recovered in the years since.",
		},
		readMore = { "Wowpedia: North Coast", "Wowpedia: Tirisfal Glades", "Wowpedia: Plague of Undeath" },
	},
	{
		name = "Whispering Shore", parent = "Tirisfal Glades", faction = "Hostile",
		hook = "A fishing spot north of the Solliden Farmstead, now held by murlocs.",
		lore = {
			"The Whispering Shore is a short stretch of coast in western Tirisfal, just up from the Solliden Farmstead. People used to fish here.",
			"Nobody does now. A band of murlocs under one called Muad has the beach and goes for anyone who comes near, and the water offshore is cold and dark with nothing left in it worth catching.",
			"The farmstead below is empty too. Tirisfal is full of small pleasant uses of land that stopped when the plague came through, and a fishing beach is one of the plainer ones. Nothing remains of what this coast used to be worth.",
		},
		readMore = { "Wowpedia: Whispering Shore", "Wowpedia: Tirisfal Glades" },
	},
})

SubsOf("Silverpine Forest", {
	{
		name = "North Tide's Run", parent = "Silverpine Forest", faction = "Contested",
		hook = "Silverpine's north-western shore, with a half-sunken ship on it.",
		lore = {
			"North Tide's Run is the name for the north-western shoreline of Silverpine, the beach and a thin band of the Great Sea beyond it.",
			"The thing anybody remembers is the ship. A Horde vessel lies partly submerged at the water's edge, and nobody has moved it or explained it. Wallace the Blind keeps a campfire beside it and sells weapons off the beach, which is a living of sorts in a forest with worgen in it and the Scarlet Crusade pushing in.",
			"Druids come here too. One half of the Pendant of the Sea Lion is in a lockbox out by the wreck, and a young druid who wants an aquatic form has to be told by somebody in Moonglade which coast to look on.",
		},
		readMore = { "Wowpedia: North Tide's Run", "Wowpedia: Silverpine Forest" },
	},
	{
		name = "South Tide's Run", parent = "Silverpine Forest", faction = "Contested",
		hook = "Silverpine's southwestern shore along the Great Sea.",
		lore = {
			"South Tide's Run is the southwestern coast of Silverpine Forest. It forms the southern counterpart to North Tide's Run along the Great Sea.",
		},
		readMore = { "Wowpedia: South Tide's Run" },
	},
})

SubsOf("Westfall", {
	{
		name = "Lighthouse", parent = "Westfall", faction = "Contested",
		aliases = { "Westfall Lighthouse", "The Lighthouse" },
		hook = "A lighthouse on the southern coast, kept now by its own keeper's ghost.",
		lore = {
			"The lighthouse stands on Westfall's far southern shore, at the end of the Longshore. Humans staffed it once, until Old Murk-Eye frightened the keeper's family away from it.",
			"They came back and relit the flame. Old Murk-Eye talked the weaker-minded murlocs into raiding the lighthouse with him a second time, and that was the end of the family.",
			"Captain Grayson is still outside it. His own life ended on the rocks below, he is entirely lucid about all of it, and with nobody left to watch the flame he has taken the job himself: oil carried up from the harvest golems inland, and the murlocs along this coast dealt with by anyone willing. Westfall is a kingdom's abandoned breadbasket, and this is the far end of the abandonment.",
		},
		readMore = { "Wowpedia: Westfall Lighthouse", "Wowpedia: Old Murk-Eye", "Wowpedia: Westfall" },
	},
})
