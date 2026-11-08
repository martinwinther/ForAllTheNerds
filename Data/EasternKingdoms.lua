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
		hook = "A sheltered training vale where Stormwind has taught its recruits for three generations.",
		lore = {
			"The valley is a natural bowl in the hills north of Goldshire, and the Church chose it for exactly that. Steep sides, one road in, good water. It has been Stormwind's training ground for new soldiers, clerics and mages for as long as the kingdom has needed them.",
			"It has not always been safe. During the First War orcs came through this valley on their way to the city and left the Abbey a shell. The kobolds now infesting Echo Ridge Mine are a nuisance by comparison, so green recruits are sent to deal with them.",
		},
	},
	{
		name = "Northshire Abbey", faction = "Alliance", levels = "1-5",
		hook = "Home of the Brotherhood of Northshire, healers who ended up fighting the First War with the Light.",
		lore = {
			"The Abbey belongs to the Brotherhood of Northshire, a clerical order of priests and paladins, and the Church of the Holy Light in the southern kingdoms grew out of it. During the First War its clerics were sent to war as healers and found themselves turning the Light on the orcish Horde as well. They were not soldiers and the war went badly for them.",
			"The orcs destroyed the Abbey in the First War and the brotherhood was devastated with it. Archbishop Alonsus Faol oversaw the rebuilding, and Faol went on to found the Knights of the Silver Hand as the Church's fighting arm, with Uther named the first of the paladins. The order that grew out of the Second War owes more to him than to anyone.",
		},
		didYouKnow = "Recruits are still trained here, under the eye of an order that the First War very nearly finished off. Archbishop Benedictus runs the Church from the Cathedral in Stormwind these days; the Abbey is where it started.",
	},
	{
		name = "Goldshire", faction = "Alliance", levels = "5-12",
		hook = "A lumber town on the crossroads, and the first real tavern most Stormwind soldiers ever drink in.",
		lore = {
			"Goldshire exists because of the crossroads. The road from Stormwind to Westfall meets the road south to Duskwood here, and the forest around it is good timber. It is a working town: a smith, a mill, an inn, a militia barracks, and the magistrate who handles everything from land disputes to the standing bounty on a gnoll named Hogger.",
			"The Lion's Pride Inn is the social centre of the whole region. Soldiers posted to Elwynn, caravan guards, and anybody walking south toward the dark woods all stop here first. Innkeeper Farley has heard every rumour in the kingdom twice.",
		},
		didYouKnow = "The town's militia is badly understrength. Most of Stormwind's veterans died in the First War or never came home from Draenor after the Second, and the kingdom has been short of soldiers ever since.",
	},
	{
		name = "Lion's Pride Inn", parent = "Elwynn Forest", faction = "Alliance",
		hook = "Goldshire's inn, under a lion sigil, and the busiest crossroads tavern in the kingdom.",
		lore = {
			"The lion is Stormwind's own sigil, and that is as much as the inn's sign actually tells you. Lion of Azeroth was Sir Anduin Lothar's name among his own soldiers, earned in the Second War from the sight of his shield cutting through the orc ranks; he had covered the retreat from Stormwind in the First and he died at Blackrock Spire in the Second. Whether the innkeeper had him in mind is not recorded.",
			"Practically, it is the last comfortable bed between Stormwind and the Dark Woods, so everybody stops. The gossip here is the closest thing Elwynn has to a newspaper.",
		},
	},
	{
		name = "Fargodeep Mine", parent = "Elwynn Forest", faction = "Hostile",
		hook = "A worked-out Stormwind mine, now a kobold warren nobody has bothered to clear properly.",
		lore = {
			"Fargodeep was a legitimate Stormwind mining operation, one of several shallow workings in the Elwynn hills. When the richer seams gave out the kingdom walked away, and kobolds moved into the empty tunnels the way they always do.",
			"Kobolds are not an invasion so much as a persistent infestation. They are drawn to candles and dark places, they dig compulsively, and they breed faster than the militia can clear them. Every few years somebody declares the mine cleaned out. It never lasts.",
		},
	},
	{
		name = "Jasperlode Mine", parent = "Elwynn Forest", faction = "Hostile",
		hook = "A narrow mine east of Crystal Lake where the kobold tunnels run deeper than the survey maps admit.",
		lore = {
			"Jasperlode was dug for gemstone rather than ore, hence the tight, winding shafts. The surveyors who mapped it never finished the job, and the kobolds have since extended it well past anything on record.",
			"Stormwind's standing instruction to the Goldshire militia is to keep the entrance clear and not pursue them in. Recruits are sent here precisely because the mouth of the mine is safe and the depths are somebody else's problem.",
		},
	},
	{
		name = "Crystal Lake", parent = "Elwynn Forest", faction = "Contested",
		hook = "Elwynn's largest lake, clear enough to be named for it and murloc-infested enough to be avoided.",
		lore = {
			"The lake feeds the streams that water half of Elwynn's farmland. The murloc problem is more than cosmetic. Murlocs came up the rivers from the coast and established nests on the shoreline. They defend territory with a vigour the local fishermen find unreasonable.",
			"Nobody is quite sure where murlocs come from or what they want. They build, they speak something, they use crude tools, and they appear on coastlines and lakeshores across the world with no obvious origin. Stormwind's scholars have mostly settled on not thinking about it.",
		},
	},
	{
		name = "Stone Cairn Lake", parent = "Elwynn Forest", faction = "Contested",
		hook = "A lake ringed by old standing stones, with a Riverpaw gnoll camp squatting among them.",
		lore = {
			"The cairns are older than the Kingdom of Azeroth and nobody has a convincing explanation for them. Guesses run to the earliest human settlers, or to whoever was here before them. Ironforge's Explorers' League would like a look, but has more interesting digs elsewhere.",
			"The Riverpaw gnolls have made camp here because it is defensible and close to the roads. Gnolls are opportunists, organised just enough to raid and never enough to hold ground.",
		},
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
		hook = "The timber camp that is rebuilding Stormwind, one cartload at a time.",
		lore = {
			"Stormwind City was burned to the ground in the First War and the reconstruction has eaten timber for decades. Eastvale is where most of it comes from. The camp runs hard, and the loggers are pushing further east into the forest than is really safe.",
			"That expansion keeps running into the local wildlife and the occasional orc scouting party out of the Redridge Mountains. The camp's foremen would like more militia. They are not getting more militia.",
		},
	},
	{
		name = "Tower of Azora", parent = "Elwynn Forest", faction = "Alliance",
		hook = "A mage's tower on the eastern road, home to Stormwind's most distractible arcane scholar.",
		lore = {
			"Azora is a working arcanist's tower rather than an institution. Theocritus and his apprentices study here, far enough from Stormwind's Mage Quarter to do as they like and close enough to send for supplies.",
			"Independent towers like this one were far more common before the Second War. The Kirin Tor's consolidation of magical study in Dalaran pulled most serious practitioners north, and the ones who stayed south tended to be eccentrics, specialists, or both.",
		},
	},
	{
		name = "Mirror Lake", parent = "Elwynn Forest", faction = "Alliance",
		hook = "The still lake west of the Tower of Azora, with an orchard that supplies half of Stormwind's cider.",
		lore = {
			"Mirror Lake and its orchard are among the most productive bits of land in Elwynn, which is why the kobolds working their way out of the nearby hills are treated as a serious nuisance rather than a curiosity.",
			"The name is literal and old. Few places in Elwynn carry one that came through the First War unchanged.",
		},
	},
	{
		name = "Ridgepoint Tower", parent = "Elwynn Forest", faction = "Alliance",
		hook = "A watchtower on the Redridge border, built to warn the kingdom about orcs coming down the pass.",
		lore = {
			"The eastern border of Elwynn is the line where the forest meets the Redridge Mountains, and Redridge has a Blackrock orc problem. Ridgepoint is one of a chain of towers meant to see trouble coming and get word to Stormwind before it arrives.",
			"The chain is undermanned. Most of the towers hold a handful of guards and a signal fire, and the kingdom is relying on the orcs of Redridge being too disorganised to push west in force.",
		},
	},
	{
		name = "Westbrook Garrison", parent = "Elwynn Forest", faction = "Alliance",
		hook = "The fortified gate between Elwynn and Westfall, now the kingdom's line against the Defias.",
		lore = {
			"Westbrook was built to watch the western road. It now has a far more awkward job: the Defias Brotherhood operating out of Westfall are not foreign invaders but Stormwind's own former stonemasons, and the garrison is effectively holding the border against its own citizens.",
			"The Riverpaw gnolls in the hills nearby are the simpler half of the garrison's work, and the half the soldiers prefer to talk about.",
		},
	},
	{
		name = "Valley of Heroes", parent = "Stormwind City", faction = "Alliance",
		hook = "The approach to Stormwind, lined with statues of the Second War's commanders.",
		lore = {
			"The statues honour the leaders of the Alliance of Lordaeron who turned back the Horde in the Second War: among them Anduin Lothar, Turalyon, Danath Trollbane, Kurdran Wildhammer and Khadgar. Every one of them is tied to the campaign that saved the human kingdoms after Stormwind had already fallen once.",
			"Several of them never came home. When the Alliance Expedition went through the Dark Portal into Draenor and the portal was destroyed behind them, Turalyon, Khadgar, Danath and Kurdran were on the far side. Stormwind has no idea what became of them.",
		},
		didYouKnow = "Lothar's statue is the centrepiece because he is the reason there is a Stormwind to walk into. He covered the retreat from this city in the First War and died holding the line at Blackrock Spire in the Second.",
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
		hook = "The Thunderbrew family's brewery, and a pillar of the dwarven economy.",
		lore = {
			"Dwarven brewing is not a joke to dwarves. The Thunderbrews are one of several families whose stout is exported across the Alliance, and the distillery at Kharanos is their flagship operation.",
			"Beer here occupies roughly the position that tea occupies elsewhere: it is how business gets done, how disputes get settled, and how an Ironforge dwarf judges whether a stranger is worth talking to.",
		},
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
		hook = "A frozen lake west of Kharanos, with a Frostmane camp on the shore and a shipwreck under the ice.",
		lore = {
			"Iceflow is the largest body of water in Dun Morogh and stays frozen most of the year. The dwarves fish it through the ice and the Frostmane trolls raid the fishermen. That exchange is the basic rhythm of life in this zone.",
			"The lake sits on the road west toward Gnomeregan. The traffic through here has become much stranger since the city fell.",
		},
	},
	{
		name = "Gnomeregan", parent = "Dun Morogh", faction = "Hostile", levels = "24-34",
		hook = "The gnomish capital, flooded with radiation by its own leader to kill the troggs invading it.",
		lore = {
			"Gnomeregan was the technological wonder of the Alliance: a vertical city of machinery dug into the mountain, built and run by gnomes. When troggs broke into the lower levels, High Tinker Mekkatorque's advisor Sicco Thermaplugg proposed flooding the city with radiation to purge them.",
			"It worked on the troggs. It also irradiated the gnomes. Something like four-fifths of the gnomish population died or was warped into leper gnomes, and Thermaplugg sealed himself inside and took the city for himself. The survivors fled to Ironforge, where the dwarves took them in.",
			"The gnomes have not given up on retaking it. Mekkatorque is openly recruiting anyone willing to go down into the irradiated levels, and the entrance is crawling with takers.",
		},
		didYouKnow = "In Tinker Town it is said, carefully and not too loudly, that Thermaplugg knew what the radiation would do before he proposed it. The gnomes would much rather that stayed a rumour.",
		readMore = { "Wowpedia: Gnomeregan", "Wowpedia: Sicco Thermaplugg" },
	},
	{
		name = "The Grizzled Den", parent = "Dun Morogh", faction = "Contested",
		hook = "A bear cave east of Kharanos, and a rite of passage for Ironforge's hunters.",
		lore = {
			"The Den is exactly what it sounds like and has been used as a training ground by Ironforge hunters for generations. Dun Morogh's bears are large, bad-tempered and plentiful.",
			"It is also where young dwarves are sent to prove they can handle themselves without a gun crew backing them up.",
		},
	},
	{
		name = "Misty Pine Refuge", parent = "Dun Morogh", faction = "Alliance",
		hook = "A quiet hunters' camp in the pines, as close to peaceful as this mountain gets.",
		lore = {
			"The refuge is a seasonal hunting camp rather than a settlement, used by Ironforge's hunters working the northern woods. There is no mine here. In Dun Morogh that counts as remarkable.",
			"It has become more useful than intended as a waypoint for travellers avoiding the main road and whatever the Frostmane are doing on it that week.",
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
	didYouKnow = "Tirisfal means roughly 'the trust of the fallen' in an older tongue, and the region gave its name to the Guardians of Tirisfal, the order of mages that produced Medivh.",
	readMore = { "Wowpedia: Tirisfal Glades", "Wowpedia: Forsaken", "Wowpedia: Arthas Menethil" },
}

SubsOf("Tirisfal Glades", {
	{
		name = "Deathknell", faction = "Horde", levels = "1-5",
		hook = "A ruined village the Forsaken use to work out which of their new dead can still think.",
		lore = {
			"Deathknell was an ordinary Lordaeron hamlet. It is now the place where newly risen Forsaken wake up, and where Undercity's deathguards sort the ones who have their minds back from the ones who are simply animate.",
			"The distinction matters enormously to the Forsaken. Free will is the only thing separating them from the Scourge, and they test for it the moment someone sits up.",
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
		didYouKnow = "The Forsaken have left the throne room much as they found it. They hold their court in the crypts below instead. Nobody is spared the walk past it.",
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
		hook = "A spider-choked cave near Deathknell, used as a first test for new Forsaken.",
		lore = {
			"The hollow is a nest of unusually large spiders in the hills near Deathknell. It is close, contained, and lethal enough to be a real test. Forsaken who have just regained their minds are sent here first.",
			"Tirisfal's wildlife has not been improved by the plague. A great deal of what lives here now is bigger and meaner than it was when this was farmland.",
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
		hook = "A Tirisfal farm still being worked, after a fashion, by the dead family that owned it.",
		lore = {
			"Some Forsaken went back to their own homes and carried on. The Balnir farmstead is one of the places where that happened, and the horses are still being bred.",
			"It is one of the few sights in Tirisfal that is quietly sad rather than horrifying. Forsaken tend not to comment on it.",
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
		hook = "A funerary terrace above the coast, built for Lordaeron's honoured dead.",
		lore = {
			"The terrace was a dignified place to inter those the kingdom wished to remember. Lordaeron took its dead seriously. In the years before the plague that turned out to be a dangerous habit.",
			"What rests here now mostly does not rest. The Forsaken find the architecture more interesting than the occupants.",
		},
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
	didYouKnow = "Gilneas sealed itself behind the Greymane Wall rather than help fight the Second War. Nobody outside has heard anything reliable from behind it since.",
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
			"The keep belonged to Baron Silverlaine, a Lordaeron noble, and was offered as a base to the Dalaran mages sent to hold Silverpine. Archmage Arugal was among them. When the Scourge pressed in, Arugal reached into another world and pulled worgen through to fight for him.",
			"They turned on the keep first. Silverlaine and his household were killed or cursed, and Arugal, broken by what he had done and by what the worgen had made of him, took up residence as their mad patron. The castle has been theirs since.",
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
			"King Genn Greymane had the wall built across the isthmus and withdrew Gilneas from the Alliance rather than commit to the Second War. It is a serious piece of engineering and it has held shut for years.",
			"What is going on behind it is a genuine unknown. The Forsaken have probed it, the worgen curse has spread near it, and nothing has come out.",
		},
	},
	{
		name = "Fenris Isle", parent = "Silverpine Forest", faction = "Hostile",
		hook = "An island keep in Lordamere Lake, held by worgen and whatever else washed up.",
		lore = {
			"Fenris Keep sits on an island in Lordamere Lake and was another Lordaeron holding. The worgen reached it, and it has been theirs ever since.",
			"Its isolation suits people who would rather not be found, and it has drawn an assortment of Scourge, worgen and worse.",
		},
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
		hook = "A worked-out Lordaeron mine where the Forsaken are quietly digging for something else.",
		lore = {
			"The mine was a legitimate Lordaeron operation that has been abandoned, reoccupied and fought over since the plague. Dark iron, undead and Forsaken interests have all overlapped here.",
			"The Forsaken's Royal Apothecary Society has a habit of taking over disused mines. They are large, defensible, and nobody asks what the smell is.",
		},
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
			"The militia is farmers, labourers and a handful of veterans. They are holding a zone against an organised criminal army with the resources of a county fair, and they know precisely how little help is coming from Stormwind.",
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
		hook = "One of the last Westfall farms still being worked, by a couple too stubborn to leave.",
		lore = {
			"The Furlbrows are holding on where most of their neighbours have walked away. Their pumpkins are one of the few crops still coming out of Westfall, and the Defias steal from them regularly.",
			"Their deed has been stolen more than once, and recovering it has fallen to passing strangers rather than to anyone wearing a tabard.",
		},
	},
	{
		name = "Saldean's Farm", parent = "Westfall", faction = "Alliance",
		hook = "A working farm near Sentinel Hill, supplying the militia that protects it.",
		lore = {
			"The Saldeans are among the holdouts who still feed Westfall's defenders. The arrangement is informal and mutual: the militia keeps the Defias off the farm, the farm keeps the militia fed.",
			"No kingdom features anywhere in that arrangement, and Westfall has got used to the fact.",
		},
	},
	{
		name = "The Jansen Stead", parent = "Westfall", faction = "Contested",
		hook = "An abandoned farmstead, its scarecrows gone wrong.",
		lore = {
			"The Jansen family left like most of Westfall's tenants. What they left behind has not stayed inert: the harvest golems and scarecrows across these fields have been animated by something, and they attack anyone who comes near.",
			"The usual explanation blames the harvest watchers on experimental Stormwind engineering abandoned in place. Nobody has produced a better one.",
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
		hook = "Broken hills in southern Westfall, full of gnolls and Defias scouts.",
		lore = {
			"The Dagger Hills are rough country on the way to the Duskwood border, and they have never been settled or farmed. Riverpaw gnolls use them, and so do the Defias.",
			"For the militia at Sentinel Hill they are mainly a direction: the one trouble arrives from, over and over, with nothing on the far side worth garrisoning.",
		},
	},
	{
		name = "Alexston Farmstead", parent = "Westfall", faction = "Hostile",
		hook = "An abandoned farm the Defias use as a forward camp.",
		lore = {
			"Another emptied Westfall holding, now occupied. The Defias have taken over enough farmsteads to garrison the countryside between them.",
			"The farms were not destroyed. They were simply left, and somebody else moved in.",
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
		"The real work here is archaeology. After Uldaman, Ironforge became convinced that the titans left records across these mountains, and the Explorers' League has dig sites all over the valley. Ironband's Excavation Site is the largest. The League's premise is that dwarves were made rather than born, and every artefact supporting it lands in Ironforge as a theological event.",
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
			"The town handles the practical side of the Explorers' League's work in the valley, and is full of dwarves with strong opinions about potsherds.",
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
		hook = "The Explorers' League's main dig in the valley, and the troggs are already in it.",
		lore = {
			"Prospector Ironband's team is digging into what they believe is a titan-built structure. The finds have been good enough to justify the expense and dangerous enough to justify the guards.",
			"The guards have not been sufficient. Troggs broke into the lower works, the standard outcome of digging anywhere in these mountains.",
		},
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
		hook = "An ogre hold in the northern hills, where something is making the ogres organised.",
		lore = {
			"The Mo'grosh clan have held this ground for a long time without being much of a threat, because ogres are strong and stupid in roughly equal measure. That has changed. They have started raiding with intent.",
			"The dwarves' working theory is that the clan has got hold of something it does not understand. Ogres with an artefact is a worse problem than ogres with a club.",
		},
	},
	{
		name = "Silver Stream Mine", parent = "Loch Modan", faction = "Hostile",
		hook = "A silver mine the troggs took, with the miners' tools still lying where they dropped them.",
		lore = {
			"Silver Stream was a productive dwarven mine until troggs came up through the floor of it. The dwarves got out; the equipment did not.",
			"Ironforge wants it back. Nobody in Thelsamar is volunteering to be first down the shaft.",
		},
	},
	{
		name = "Valley of Kings", parent = "Loch Modan", faction = "Alliance",
		hook = "The great carved gateway between Dun Morogh and Loch Modan.",
		lore = {
			"The valley is the road between the dwarven heartland and the loch, and the dwarves have carved it accordingly. The statuary is a statement about who owns these mountains.",
			"It is also a chokepoint, and it has been fortified as one for as long as Ironforge has had enemies to the east.",
		},
	},
	{
		name = "Grizzlepaw Ridge", parent = "Loch Modan", faction = "Contested",
		hook = "Bear country on the loch's southern slopes.",
		lore = {
			"The ridge is the densest bear population in the valley and a long-standing hunting ground for the Farstrider Lodge.",
			"Loch Modan's bears are a staple of the local economy: hide, meat and a steady supply of stories.",
		},
	},
	{
		name = "North Gate Pass", parent = "Loch Modan", faction = "Contested",
		hook = "The northern road out of the valley, watched because of what uses it.",
		lore = {
			"North Gate carries traffic out of Loch Modan toward the Badlands road and the eastern mountains. It is the route the Mo'grosh use to come down out of the hills.",
			"The dwarves garrison the gates and accept that the ogres will keep trying.",
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
		hook = "The keep built to guard Stormwind's eastern approach, now the orcs' forward base.",
		lore = {
			"Stonewatch Keep commands the pass between Redridge and the Burning Steppes. Stormwind built it precisely to stop orcs coming down that road, and the orcs took it.",
			"Gath'Ilzogg holds it now. Losing Stonewatch means Redridge has no defensible line at all, and Lakeshire is the next thing down the hill.",
		},
	},
	{
		name = "Tower of Ilgalar", parent = "Redridge Mountains", faction = "Hostile",
		hook = "A mage tower on the lake's south shore, whose occupant is doing something he will not explain.",
		lore = {
			"Ilgalar is another of the independent arcane towers that dot the southern kingdoms. Its current master, Morganth, arrived with credentials and has since made himself extremely unwelcome.",
			"The suspicion in Lakeshire is that he is involved in whatever the orcs and the gnolls are coordinating. That would make him the only person in Redridge with a plan.",
		},
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
		hook = "A sawmill overrun by gnolls, and a reminder of how far Lakeshire has shrunk.",
		lore = {
			"Alther's Mill was part of Lakeshire's timber operation until the Redridge gnolls took it. It has not been retaken.",
			"The mill's loss is a small thing compared to Stonewatch, but it is the kind of small thing that adds up to a county quietly giving ground.",
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
		hook = "A Blackrock orc camp in the hills, openly flying the Dark Horde's colours.",
		lore = {
			"The camp is one of several Blackrock positions in Redridge's high ground, and the orcs here are not hiding. They are holding ground and waiting on orders.",
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
		"Duskwood was called Grand Hamlet's county and it was ordinary human farmland and woodland south of Elwynn. It is now permanently dark, wrapped in a mist that does not lift, and the trees have gone wrong.",
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
			"The town is run by the Night Watch and a town council with a deep suspicion of outsiders, magic and anything that happens after dark. They have earned all three. Lord Ello Ebonlocke commands the Watch, and his authority here outweighs anything Stormwind sends.",
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
			"Among them is Mor'Ladim, who was a father looking for his daughter before he died and has not entirely stopped. The Watch considers him the zone's most dangerous single resident.",
		},
		didYouKnow = "Mor'Ladim had a family in Darkshire before he died, which the Night Watch considers the worst thing about him. He kills anyone he meets now, and some of the watch knew him.",
	},
	{
		name = "Twilight Grove", parent = "Duskwood", faction = "Hostile",
		hook = "A green clearing in a dead forest, and a doorway into the Emerald Dream.",
		lore = {
			"Twilight Grove is one of the Great Trees' groves, a place where the Emerald Dream presses against the waking world. It should be the healthiest ground in Duskwood. It is not.",
			"The green dragon set to watch over it has been corrupted, and the Nightmare leaking through the portal is a strong candidate for what soured these woods in the first place. Druids who understand what they are looking at here do not stay long.",
		},
		readMore = { "Wowpedia: Twilight Grove", "Wowpedia: Emerald Dream" },
	},
	{
		name = "Vul'Gol Ogre Mound", parent = "Duskwood", faction = "Hostile",
		hook = "An ogre mound in the western woods, with worgen pressing in on it.",
		lore = {
			"The Vul'Gol ogres held this mound before the darkness came and have carried on holding it since, apparently without noticing the difference.",
			"They now have competition. Worgen have spread into Duskwood, and the ogres are finding the new neighbours harder to deal with than the Night Watch ever was.",
		},
	},
	{
		name = "Manor Mistmantle", parent = "Duskwood", faction = "Contested",
		hook = "A noble family's manor on the hill, emptied by whatever happened to the rest of the county.",
		lore = {
			"The Mistmantles were local gentry. Their manor stands above Darkshire and is no longer occupied by anyone the family would recognise.",
			"Duskwood's abandoned estates are a recurring feature. The money left when the sun did.",
		},
	},
	{
		name = "Addle's Stead", parent = "Duskwood", faction = "Hostile",
		hook = "A burned-out farm in the eastern woods, now a nest of things that used to be farmhands.",
		lore = {
			"Addle's Stead is one of several outlying farms the county lost. The buildings burned and what is there now is not farming.",
			"The Night Watch has written it off, as they do with anything more than a patrol's reach from the road.",
		},
	},
	{
		name = "The Yorgen Farmstead", parent = "Duskwood", faction = "Hostile",
		hook = "An abandoned farm with worgen in the barn.",
		lore = {
			"The Yorgen place is another lost holding, and it has become one of the clearest signs that Duskwood's worgen population is not a rumour.",
			"How worgen reached this far south from Silverpine is an open question in Darkshire, and not a comforting one.",
		},
	},
	{
		name = "Tranquil Gardens Cemetery", parent = "Duskwood", faction = "Contested",
		hook = "Darkshire's own graveyard, watched far more closely than the name suggests.",
		lore = {
			"The Gardens serve Darkshire itself, and the Night Watch guards them with real attention. A rising in this cemetery would be a disaster rather than a patrol.",
			"The town's funeral customs have changed since the darkness came, and not subtly. Nobody in Darkshire buries anybody casually.",
		},
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
		hook = "The northern shore of Duskwood's river, facing Westfall across the water.",
		lore = {
			"The bank is the boundary between Duskwood's gloom and Westfall's dust, and the difference across a single river is startling.",
			"Smugglers and Defias both use the crossings here, since neither the Night Watch nor the People's Militia has anything to spare for river patrol.",
		},
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
		"Above it all sits Grim Batol. The Wildhammer dwarves founded it and then lost it to a curse rather than to an army: during the War of the Three Hammers the Dark Iron sorceress Modgud laid one on the fortress, and although Khardros Wildhammer killed her for it the curse outlived her. The Wildhammers came back, found the place unlivable, and went north to Aerie Peak instead.",
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
		hook = "A dwarven town at the Thandol Span, taken by Dark Iron and Syndicate forces.",
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
		name = "Angerfang Encampment", parent = "Wetlands", faction = "Hostile",
		hook = "A Dragonmaw war camp pressing west toward Menethil.",
		lore = {
			"Angerfang is the Dragonmaw's forward base against the Alliance port, and it stages raids rather than sitting still.",
			"The clan's goal appears to be Menethil Harbor itself. Taking it would cut the Alliance's sea link between the continents.",
		},
	},
	{
		name = "Whelgar's Excavation Site", parent = "Wetlands", faction = "Alliance",
		hook = "An Explorers' League dig in the marsh, turning up dragon bones and raptor trouble.",
		lore = {
			"Whelgar's team came for the fossils. The Wetlands have an unusually rich bed of very large bones, and the League wants to know what they belonged to and when.",
			"The dig has been overrun by raptors and murlocs more than once, the usual career trajectory for an Explorers' League site.",
		},
	},
	{
		name = "Thelgen Rock", parent = "Wetlands", faction = "Hostile",
		hook = "A flooded mine shaft full of things the water brought in.",
		lore = {
			"Thelgen Rock was a dwarven working that the marsh reclaimed. When the water came in, the mine became a cave system, and the cave system acquired tenants.",
			"The Wetlands work to one rule above all others: anything built here eventually becomes swamp.",
		},
	},
	{
		name = "Ironbeard's Tomb", parent = "Wetlands", faction = "Contested",
		hook = "A dwarven tomb in the marsh, looted by everything with hands.",
		lore = {
			"The tomb honours a dwarf whose name has outlasted his story. It is one of several dwarven burial sites scattered through the lowlands from the days when this was securely Khaz Modan's territory.",
			"It has been thoroughly robbed. The Explorers' League would call that a tragedy; the Dark Irons would call it Tuesday.",
		},
	},
	{
		name = "The Lost Fleet", parent = "Wetlands", faction = "Contested",
		hook = "A graveyard of wrecked ships on the northern shore, and nobody agrees whose they were.",
		lore = {
			"A substantial number of vessels came to grief on this coastline and the hulls are still there, half in the water. Candidates include Second War transports and Alliance ships lost in the storms off Khaz Modan.",
			"Murlocs and worse have colonised the wrecks. The salvage is good and the odds are not.",
		},
	},
	{
		name = "Bluegill Marsh", parent = "Wetlands", faction = "Hostile",
		hook = "A murloc territory on the coast that the Alliance port would rather not have next door.",
		lore = {
			"The Bluegill murlocs hold the coastal marsh west of the main road and raid toward Menethil Harbor. They are organised enough to have a name and a hierarchy. Most murloc populations do not get that far.",
			"Menethil's garrison treats them as a permanent chore rather than a war.",
		},
	},
	{
		name = "Mosshide Fen", parent = "Wetlands", faction = "Hostile",
		hook = "Gnoll country in the central marsh, astride the road north.",
		lore = {
			"The Mosshide gnolls hold the fen and tax the road through it in the manner of gnolls everywhere, which is to say by ambush.",
			"They have also been digging up the Explorers' League's sites, apparently out of curiosity. The League's dwarves have taken it personally.",
		},
	},
	{
		name = "Raptor Ridge", parent = "Wetlands", faction = "Hostile",
		hook = "A ridge full of raptors, which in the Wetlands means very large raptors.",
		lore = {
			"The ridge holds the zone's densest raptor population. Khaz Modan's raptors are smaller than Stranglethorn's but considerably more numerous here.",
			"The Explorers' League's interest in the local bone beds and the living raptors on the ridge are probably related, and the League is working on it.",
		},
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
			"Southshore is a working port on Lordamere Lake's southern coast and the Alliance's anchor in Hillsbrad. It has an inn, a dock and a garrison that exists because of Tarren Mill.",
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
		hook = "A silver mine in the western hills, worked now by the Syndicate.",
		lore = {
			"Azurelode was a legitimate Hillsbrad mine. The Syndicate, which is what is left of Alterac's nobility after their kingdom was destroyed, has taken it over and runs it with forced labour.",
			"The Syndicate are bandits with heraldry. They lost a kingdom and have been financing a grudge ever since.",
		},
	},
	{
		name = "Purgation Isle", parent = "Hillsbrad Foothills", faction = "Hostile",
		hook = "An island off the coast where the Scarlet Crusade does things it will not do on the mainland.",
		lore = {
			"Purgation Isle is a small island in the bay south of Southshore, and the Scarlet Crusade has made it a private site. The name is not metaphorical.",
			"What goes on there is some distance past what the Church of the Holy Light would sanction. That gap is what defines the Scarlet Crusade.",
		},
	},
	{
		name = "Thoradin's Wall", parent = "Hillsbrad Foothills", faction = "Contested",
		hook = "The ancient wall Arathor built against the trolls, still standing across the hills.",
		lore = {
			"Thoradin's Wall was raised by the Arathorian Empire to hold back the Amani trolls. Few human structures anywhere are older. It marks the border between Hillsbrad and the Arathi Highlands.",
			"The empire that raised it has been gone for millennia and the wall has not. Arathor built to last, whatever else it failed at.",
		},
		didYouKnow = "Thoradin was the first human to unite the tribes into one nation. Every human kingdom, including Stormwind, descends from the empire he founded at Strom.",
	},
	{
		name = "Nethander Stead", parent = "Hillsbrad Foothills", faction = "Contested",
		hook = "A Hillsbrad farm caught between two armies and farming anyway.",
		lore = {
			"The Nethander place is one of the holdings still being worked in the middle of the Southshore-Tarren Mill war. The farmers' position is that the crops do not care who is winning.",
			"Hillsbrad's farmland is good. Both sides want the hills and neither will burn them.",
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
		name = "Southpoint Tower", parent = "Hillsbrad Foothills", faction = "Contested",
		hook = "A watchtower on the southern road, changing hands often enough that nobody repaints it.",
		lore = {
			"Southpoint watches the road between Hillsbrad and the Alterac foothills. It is a small, valuable piece of ground on a contested route.",
			"Towers like this one get taken, retaken and garrisoned with whoever is nearest. Its current occupants are a matter of recent news rather than record.",
		},
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
		hook = "What is left of the Kirin Tor's city after a demon lord stepped on it.",
		lore = {
			"Dalaran was the magocracy, home of the Kirin Tor and the finest centre of arcane learning in the world. Its Violet Citadel trained Medivh, Khadgar, Jaina Proudmoore, Kel'Thuzad and most of the archmages whose decisions shaped the last two wars.",
			"During the Legion's invasion, Archimonde destroyed it. The mages threw everything they had into a magical shield and he simply broke it and crushed the city. What remains is a crater under a containment dome, patrolled by the surviving Kirin Tor to keep people out and whatever is left in.",
			"The Kirin Tor has not disbanded. Its archmages are scattered and it has no city, but the order still considers itself responsible for magic in this world.",
		},
		didYouKnow = "Kel'Thuzad was a Kirin Tor archmage before he founded the Cult of the Damned. Dalaran expelled him for studying necromancy. He went to Northrend, found the Lich King, and brought back the plague that destroyed Lordaeron.",
		readMore = { "Wowpedia: Dalaran", "Wowpedia: Kirin Tor" },
	},
	{
		name = "Ruins of Alterac", parent = "Alterac Mountains", faction = "Hostile",
		hook = "The capital of a kingdom that was taken off the map for treason.",
		lore = {
			"This was Alterac's seat of government. After Perenolde's betrayal was exposed, the kingdom was broken up and the city was left to rot rather than resettled.",
			"The Syndicate holds the ruins now. For them it is not a ruin, it is a claim.",
		},
	},
	{
		name = "Strahnbrad", parent = "Alterac Mountains", faction = "Hostile",
		hook = "A hill town raided so often that the Syndicate effectively administers it.",
		lore = {
			"Strahnbrad was an ordinary Alterac town. Its position in the hills made it a natural target and the Syndicate has been working it over for years.",
			"Anyone remembering the Third War will recognise the name: Strahnbrad was one of the first places Arthas was sent to defend when the orcish raids began, long before the plague.",
		},
	},
	{
		name = "Crushridge Hold", parent = "Alterac Mountains", faction = "Hostile",
		hook = "An ogre hold in the eastern mountains, squatting in Alterac's abandoned stonework.",
		lore = {
			"The Crushridge ogres moved into the vacuum left when Alterac was dissolved, and they have been fighting the Syndicate for the hills ever since.",
			"Ogres taking over a dead kingdom's buildings is a recurring image in the Eastern Kingdoms. They rarely maintain the plumbing.",
		},
	},
	{
		name = "Sofera's Naze", parent = "Alterac Mountains", faction = "Hostile",
		hook = "A hilltop ruin with a Syndicate camp and an unusually literate ghost problem.",
		lore = {
			"The naze is a rocky outcrop with old Alterac stonework on it, now used by the Syndicate. The dead here have not settled.",
			"Alterac's collapse left a great many people unburied and a great many grievances unresolved, and the mountains show it.",
		},
	},
	{
		name = "Chillwind Point", parent = "Alterac Mountains", faction = "Contested",
		hook = "A high pass on the Plaguelands border, watched by whoever can spare the men.",
		lore = {
			"Chillwind Point sits where the Alterac Mountains meet the Western Plaguelands: the obvious place to watch for Scourge coming west.",
			"It changes hands and garrisons. The Alliance keeps trying to hold the line here because the alternative is the Scourge in Hillsbrad.",
		},
	},
	{
		name = "Slaughter Hollow", parent = "Alterac Mountains", faction = "Hostile",
		hook = "A gorge the Crushridge ogres use for exactly what the name suggests.",
		lore = {
			"The hollow is an ogre killing ground in the eastern mountains. The Crushridge are not subtle and the name is descriptive.",
			"Travellers using the mountain roads learn the geography of places to avoid quickly or not at all.",
		},
	},
	{
		name = "Growless Cave", parent = "Alterac Mountains", faction = "Contested",
		hook = "A bear cave in the western hills, named by somebody with a sense of humour.",
		lore = {
			"The cave is a den for the mountains' bears, which are large, numerous, and the least political threat in Alterac.",
			"In a zone defined by treason, exile and organised crime, the bears come as something of a relief.",
		},
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
		"Strom became Stromgarde, and Stromgarde held on longer than most. It has now collapsed too. The city is a three-way battlefield between the Syndicate, the Boulderfist ogres, and the remnant of its own garrison under Commander Trollbane's heirs. The Alliance holds a single outpost at Refuge Pointe and little else.",
		"The Horde is here too, at Hammerfall in the east. Those are orcs freed from the internment camps who settled where Orgrim Doomhammer, the Horde's second warchief, was killed. They have made it a permanent holding.",
	},
	didYouKnow = "The Trollbane line gave the Alliance one of its great Second War commanders, Danath Trollbane, who went through the Dark Portal with the Alliance Expedition and never came back. Stromgarde has been running out of Trollbanes ever since.",
	readMore = { "Wowpedia: Arathi Highlands", "Wowpedia: Stromgarde", "Wowpedia: Arathor" },
}

SubsOf("Arathi Highlands", {
	{
		name = "Stromgarde Keep", parent = "Arathi Highlands", faction = "Hostile",
		hook = "The oldest human city in the world, now split three ways and losing.",
		lore = {
			"Stromgarde is built on Strom, Thoradin's capital and the birthplace of human nationhood. It was still a functioning kingdom within living memory, and one of the Alliance of Lordaeron's founding members.",
			"It has fallen apart. The Syndicate holds part of the city, the Boulderfist ogres hold another part, and the surviving Stromgarde garrison holds what it can. None of the three is gaining ground, and the Alliance has not intervened.",
			"For a human player, this is an uncomfortable place to stand. The ruins are the foundation of their own civilisation and the kingdom that sits on them is being carved up by bandits.",
		},
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
		didYouKnow = "Doomhammer's weapon, the Doomhammer itself, passed to Thrall. It had belonged to his father Durotan's clan before that.",
	},
	{
		name = "Boulderfist Hall", parent = "Arathi Highlands", faction = "Hostile",
		hook = "The Boulderfist ogres' hold, and one of the three claimants to Stromgarde.",
		lore = {
			"The Boulderfist clan is the largest ogre power in the Highlands and the reason Stromgarde's collapse became a rout. They have numbers and they have taken part of the city.",
			"Ogres in the Eastern Kingdoms are the Horde's old leavings: brought over by Gul'dan during the Second War and left behind when it ended.",
		},
	},
	{
		name = "Witherbark Village", parent = "Arathi Highlands", faction = "Hostile",
		hook = "A forest troll village, descendants of the empire Arathor broke.",
		lore = {
			"The Witherbark are Amani forest trolls, and their presence here is older than any human claim. Arathor's entire founding war was against the Amani Empire, which once held this whole region.",
			"The trolls lost that war and never accepted the result. From their perspective Stromgarde's ruin is a long-overdue correction.",
		},
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
		name = "Go'Shek Farm", parent = "Arathi Highlands", faction = "Hostile",
		hook = "A Highlands farm taken over by the Syndicate as a staging post.",
		lore = {
			"Go'Shek was a working farm serving Stromgarde. The Syndicate took it, and it now supports their operations across the central Highlands.",
			"The Highlands' farms are the clearest measure of Stromgarde's decline. They were feeding a kingdom; now they are feeding bandits.",
		},
	},
	{
		name = "Faldir's Cove", parent = "Arathi Highlands", faction = "Contested",
		hook = "A hidden cove on the southern coast, used by people who do not want harbours.",
		lore = {
			"Faldir's Cove is a sheltered beach reachable only by a difficult descent, ideal for smuggling and for ships that would rather not be seen.",
			"There are wrecks here and there is treasure, and both have attracted the attention of pirates working this coast.",
		},
	},
	{
		name = "Circle of Inner Binding", parent = "Arathi Highlands", faction = "Contested",
		hook = "One of four ancient stone circles ringing the Highlands, and nobody is sure who raised them.",
		lore = {
			"Four circles stand in the Highlands: Inner, Outer, East and West Binding. They are clearly deliberate and clearly old, and most who study them come away thinking they predate Arathor.",
			"Mages and cultists both take an interest in them. Arcane energy collects at the circles. That has attracted exactly the people you would not want collecting arcane energy.",
		},
	},
	{
		name = "Northfold Manor", parent = "Arathi Highlands", faction = "Hostile",
		hook = "A noble estate turned Syndicate house.",
		lore = {
			"Northfold belonged to one of Stromgarde's noble families. The Syndicate now uses it, returning the house to dispossessed nobility of a sort, just not the ones who owned it.",
			"The Highlands are littered with these: good stone houses with the wrong people in them.",
		},
	},
	{
		name = "Dabyrie's Farmstead", parent = "Arathi Highlands", faction = "Contested",
		hook = "A working Highlands farm, holding out between the Syndicate and the Horde.",
		lore = {
			"The Dabyrie family still farm this land in the middle of a three-cornered war. It takes a particular sort of nerve.",
			"Their position on the central road means everyone passes through and nobody protects them.",
		},
	},
	{
		name = "Drywhisker Gorge", parent = "Arathi Highlands", faction = "Hostile",
		hook = "A kobold-infested mine gorge in the east, close to Hammerfall.",
		lore = {
			"Drywhisker is a mining gorge whose kobold population has become a real problem for the Horde at Hammerfall rather than a nuisance.",
			"Kobolds spread wherever there are tunnels and candles, and the Highlands have both.",
		},
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
			"The port runs boats to Ratchet in the Barrens and ships further afield. In few other places is cross-faction travel just a ticket purchase.",
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
		hook = "A Stormwind expedition's base, now held by the colonel who stopped taking orders.",
		lore = {
			"The compound was built by Colonel Kurzen's expedition as a legitimate Alliance operation in the jungle. It is now a fortified camp of troops loyal to a commander the Alliance considers a liability.",
			"Kurzen's forces include trolls and jungle creatures as well as human soldiers. Stormwind has speculated endlessly about what exactly happened to him.",
		},
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
			"The arena is genuine Gurubashi construction, built for the empire's blood sports. The trolls took combat as a religious as well as a political matter.",
			"It has been repurposed. Goblins run a periodic open brawl here with a chest for whoever is left standing: a very Booty Bay solution to an ancient monument.",
		},
	},
	{
		name = "Nesingwary's Expedition", parent = "Stranglethorn Vale", faction = "Neutral",
		hook = "A dwarf's hunting camp, dedicated to shooting the largest animals in the jungle.",
		lore = {
			"Hemet Nesingwary is a dwarven big-game hunter of some renown, and his Stranglethorn expedition is after the jungle's tigers, panthers and raptors.",
			"He is not here for lore, conservation or the Alliance. He is here because the animals are big, and he has made a career of it across the world.",
		},
	},
	{
		name = "Ruins of Zul'Kunda", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "A Bloodscalp troll city on the northern coast, built on Gurubashi stonework.",
		lore = {
			"Zul'Kunda is one of the old Gurubashi cities, now occupied by the Bloodscalp tribe. The trolls living in it are the empire's descendants squatting in their own ancestors' architecture.",
			"The Bloodscalp are the northern power in the jungle and they are at war with the Skullsplitter in the south, and that feud has done more to keep the trolls off the roads than any Alliance patrol.",
		},
	},
	{
		name = "Ruins of Zul'Mamwe", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "A Skullsplitter city in the southern jungle, half swallowed by the trees.",
		lore = {
			"Zul'Mamwe is the Skullsplitter tribe's seat, another reoccupied Gurubashi ruin in the south of the vale.",
			"The Skullsplitter are the Bloodscalp's mirror image and their hereditary enemy. The feud is older than any human kingdom.",
		},
	},
	{
		name = "Mosh'Ogg Ogre Mound", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "An ogre mound in the eastern jungle, holding ground nobody else wants badly enough.",
		lore = {
			"The Mosh'Ogg have established themselves in the eastern vale, among the trolls and the Venture Company's logging operations.",
			"They are a third party in a jungle that already had too many, and their main contribution is making the eastern road worse.",
		},
	},
	{
		name = "Venture Co. Base Camp", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "A goblin logging operation stripping the jungle with no regard for anything.",
		lore = {
			"The Venture Company is the goblin cartel that does not bother with neutrality or reputation. Where the Steamwheedle Cartel sells to everyone, Venture Co. takes. It is clear-cutting Stranglethorn for timber.",
			"They are the same firm that built Edwin VanCleef's warship in the Deadmines and that is tearing up Mulgore and the Barrens on the other continent. Goblin enterprise at its least charming.",
		},
	},
	{
		name = "Jaguero Isle", parent = "Stranglethorn Vale", faction = "Contested",
		hook = "An island off the southern coast, with a stranded noblewoman and a very large ape.",
		lore = {
			"Jaguero is a small island south of Booty Bay, reachable only by swimming or by boat. It is isolated enough to have its own ecology and its own problems.",
			"A shipwrecked Stormwind noblewoman is stuck there, and the island's dominant resident is an enormous gorilla that stands between her and the shore.",
		},
	},
	{
		name = "The Cape of Stranglethorn", parent = "Stranglethorn Vale", faction = "Contested",
		hook = "The southern tip of the continent, where the jungle finally runs into the sea.",
		lore = {
			"The cape is the far southern end of the Eastern Kingdoms, and Booty Bay is built into it. Beyond here is open water and the Great Sea.",
			"It is the most southerly ground an adventurer can stand on in this half of the world, a natural stop for people who collect such things.",
		},
	},
	{
		name = "Lake Nazferiti", parent = "Stranglethorn Vale", faction = "Contested",
		hook = "The great jungle lake at Stranglethorn's heart, with Gurubashi ruins on every shore.",
		lore = {
			"Nazferiti is the vale's largest body of fresh water and the Gurubashi built all around it. The ruins ringing the lake were a dense part of the empire.",
			"The lake is now troll territory, raptor territory and crocolisk territory in roughly equal measure.",
		},
	},
	{
		name = "The Stockpile", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "A cave of stolen goods on the northern coast, run by whoever currently holds it.",
		lore = {
			"The Stockpile is a smugglers' and bandits' cache in the northern jungle. Its contents and its owners change regularly.",
			"Stranglethorn has no law outside Booty Bay's docks, and places like this are the practical consequence.",
		},
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
			"The name honours Kargath Bladefist, chieftain of the Shattered Hand clan, who was held in a gladiator pit and severed his own hand to escape, replacing it with a blade. The Shattered Hand took their name from the act.",
		},
	},
	{
		name = "Uldaman", parent = "Badlands", faction = "Hostile", levels = "35-45",
		hook = "A titan vault holding the record of how the dwarves were made.",
		lore = {
			"Uldaman is one of the titans' installations, built to house their work on this world and sealed afterwards. The dwarves found it, dug in, and discovered the Discs of Norgannon.",
			"The discs are a titan record, and what they record is that the earthen, the dwarves' ancestors, were shaped from living stone to work the deep places of the world. Dwarves are not natives of Azeroth in the way they always assumed. They are a titan project.",
			"The vault has its own guardians, still functioning after all this time, and the troggs that infest the upper levels are the earthen experiment's failures. The Explorers' League is digging anyway.",
		},
		didYouKnow = "The vault's guardian construct is still following orders issued by beings who left this world long ago. It does not care who Ironforge is.",
		readMore = { "Wowpedia: Uldaman", "Wowpedia: Discs of Norgannon" },
	},
	{
		name = "Angor Fortress", parent = "Badlands", faction = "Hostile",
		hook = "A Dark Iron fortress overlooking the road to Uldaman.",
		lore = {
			"Angor Fortress is the Dark Iron dwarves' position in the Badlands, and its purpose is Uldaman. The Dark Irons want the vault's contents as badly as Ironforge does.",
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
		hook = "An Explorers' League dig outside Uldaman, and the survivors are not having a good time.",
		lore = {
			"Hammertoe's team was excavating the approaches to Uldaman when things went badly. Troggs and Dark Iron interference have left the dig in a poor state.",
			"The League's losses in the Badlands are substantial and Ironforge keeps sending more dwarves. The vault is considered worth it.",
		},
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
		hook = "A dry gulch near Kargath, picked over by scavengers and scorpids.",
		lore = {
			"The gulch is typical Badlands ground: no water, hard rock, and a wildlife population that has adapted to both.",
			"It sits on the route between Kargath and the Uldaman road, so it sees more traffic than it deserves.",
		},
	},
	{
		name = "Agmond's End", parent = "Badlands", faction = "Contested",
		hook = "Another field of giant bones, and the end of whoever Agmond was.",
		lore = {
			"Agmond's End is a bone field in the southern Badlands. The name suggests somebody died finding it. The zone does nothing to argue otherwise.",
			"Dark Iron and Horde scouts both pass through, and neither is interested in the palaeontology.",
		},
	},
	{
		name = "Camp Kosh", parent = "Badlands", faction = "Hostile",
		hook = "An ogre camp on the northern road.",
		lore = {
			"Camp Kosh is one of three ogre camps strung across the Badlands, holding the roads in the only way ogres know how.",
			"These are leftovers of the Second War Horde, like most ogres east of the sea, with no leadership and no plan beyond the next caravan.",
		},
	},
	{
		name = "Camp Cagg", parent = "Badlands", faction = "Hostile",
		hook = "An ogre camp in the western Badlands, close enough to Kargath to be a Horde problem.",
		lore = {
			"Camp Cagg sits close to the Horde's outpost. Clearing it is Kargath's standing chore.",
			"The ogres have no strategic goal. They are simply in the way and difficult to move.",
		},
	},
	{
		name = "The Dustbowl", parent = "Badlands", faction = "Contested",
		hook = "The open flats at the heart of the Badlands, with nothing in them at all.",
		lore = {
			"The Dustbowl is the emptiest ground in a zone made of empty ground. There is no water, no cover and no reason to stop.",
			"Travellers cross it because the alternative is going around, and the Badlands are wider than they look.",
		},
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
		hook = "The flooded crater above the sunken temple.",
		lore = {
			"The Pool of Tears is the water that covers the Temple of Atal'Hakkar. It is the visible mark of what Ysera did to the place.",
			"The naga have taken an interest in the pool. Nothing improves once they do.",
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
		hook = "A bog in the southeast with an Atal'ai presence in the caves.",
		lore = {
			"Stagalbog's caves are used by the Atal'ai, who have never confined themselves to the sunken temple alone.",
			"The cult is larger and better established in this swamp than anybody outside it realises.",
		},
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
		hook = "A troll settlement in the southern swamp.",
		lore = {
			"The sanctuary holds forest trolls in the swamp's south, another fragment of the troll presence that long predates the orcs or the humans here.",
			"Trolls were on this continent first, everywhere, and the swamp is no exception.",
		},
	},
	{
		name = "Splinterspear Junction", parent = "Swamp of Sorrows", faction = "Contested",
		hook = "A road junction in the swamp, held by nobody in particular.",
		lore = {
			"The junction is where the swamp's usable tracks meet: a natural ambush point and a natural camp site, depending on who arrived first.",
			"Control of it shifts. The swamp does not support permanent garrisons well.",
		},
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
		"Their neighbours are the Vilebranch forest trolls, and the trolls were here first by a very long margin. Jintha'Alor on the eastern slopes is an ancient Amani city and a holy site, dedicated among other things to Shadra the spider loa. The Vilebranch are not a tribe of raiders squatting in ruins; they are living in their own city.",
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
		hook = "A forest troll village that joined the Horde, on a coast full of trolls who did not.",
		lore = {
			"The Revantusk are forest trolls who allied with Thrall's Horde, which makes them unusual twice over: forest trolls have little love for orcs, and the Amani tribes have little love for anyone.",
			"Their village on the eastern coast is the Horde's only real presence in the Hinterlands, and it exists because the Revantusk decided the Vilebranch and the dwarves were worse options.",
		},
	},
	{
		name = "Quel'Danil Lodge", parent = "The Hinterlands", faction = "Hostile",
		hook = "A high elf lodge in the woods, and a reminder that not all elves withdrew.",
		lore = {
			"Quel'Danil was a high elven outpost maintained by elves who kept ties to the Alliance after Quel'Thalas largely withdrew from it. The high elves were the Alliance of Lordaeron's magical backbone in the Second War.",
			"Relations have soured badly. The elves' withdrawal from the Alliance, the destruction of Quel'Thalas by Arthas and the Scourge, and the bitterness on both sides have left places like this one isolated and hostile to visitors.",
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
		hook = "A high altar above Jintha'Alor, at the top of the terraces.",
		lore = {
			"The Altar of Zul crowns Jintha'Alor and is the holiest ground in the Vilebranch's city. 'Zul' marks a priest or prophet in the troll tongue, and the altar's name places it at the centre of their religion.",
			"Reaching it means climbing the full height of the city, past everything and everyone in it.",
		},
	},
	{
		name = "Agol'watha", parent = "The Hinterlands", faction = "Hostile",
		hook = "Troll ruins in the northern forest.",
		lore = {
			"Agol'watha is one of several smaller Amani sites scattered through the Hinterlands' woods, part of the network that supported Jintha'Alor.",
			"The '-watha' sites are ruins rather than living settlements, and the forest has been taking them back for a long time.",
		},
	},
	{
		name = "Zun'watha", parent = "The Hinterlands", faction = "Hostile",
		hook = "Overgrown troll ruins in the western woods.",
		lore = {
			"Another of the Hinterlands' abandoned Amani sites, now mostly trees and fallen stone.",
			"The density of troll ruins here is a measure of how much of this continent the Amani Empire once held.",
		},
	},
	{
		name = "Skulk Rock", parent = "The Hinterlands", faction = "Hostile",
		hook = "A cave of very large spiders, a short walk from the trolls' shrines to the spider loa.",
		lore = {
			"Skulk Rock holds a substantial spider population, close to the Vilebranch's shrines to the spider loa.",
			"The trolls' relationship with these spiders is religious. The spiders' relationship with travellers is simpler.",
		},
	},
	{
		name = "Plaguemist Ravine", parent = "The Hinterlands", faction = "Contested",
		hook = "A ravine where the Plaguelands' corruption is leaking over the border.",
		lore = {
			"The ravine sits on the Hinterlands' northwestern edge, nearest the Plaguelands, and the blight has started reaching into it.",
			"The Wildhammers are watching it closely. What happened to Lordaeron is not something they intend to let spread into their forest.",
		},
	},
	{
		name = "Valorwind Lake", parent = "The Hinterlands", faction = "Contested",
		hook = "A clear lake in the central forest, below Aerie Peak.",
		lore = {
			"Valorwind is the Hinterlands' main lake and sits in the valley below the Wildhammer hold.",
			"It is one of the more pleasant places in the zone, mostly meaning the trolls have not built anything on it.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- SEARING GORGE
-- ---------------------------------------------------------------------------

Zone{
	name = "Searing Gorge", continent = EK, faction = "Contested", levels = "43-50",
	hook = "A strip-mined furnace of a valley, torn open when a Dark Iron emperor summoned a fire god.",
	lore = {
		"The Searing Gorge and the Burning Steppes next door were made by a single catastrophe. Emperor Dagran Thaurissan of the Dark Iron dwarves, losing a war on two fronts, summoned Ragnaros the Firelord to fight for him. Ragnaros arrived, the summoning tore the mountain apart, and the blast created both zones and sank Thaurissan's capital into the molten depths as Blackrock Depths.",
		"The Dark Irons survived as Ragnaros' servants rather than his masters. They now work the Gorge for ore and metal under the Firelord's shadow, running the Cauldron and the Grimesilt digs. Nobody here outweighs them.",
		"Not all of them accept it. The Thorium Brotherhood broke away from Ragnaros' service and set up at Thorium Point, where they trade with Alliance and Horde alike. They are the only Dark Iron faction anyone outside will deal with.",
	},
	didYouKnow = "Thaurissan's summoning is the single most destructive act of magic in dwarven history, and the Dark Irons have been paying for it ever since. His own wife, Moira Bronzebeard, is King Magni's daughter, and she is in Blackrock Depths.",
	readMore = { "Wowpedia: Searing Gorge", "Wowpedia: Dark Iron clan", "Wowpedia: Ragnaros" },
}

SubsOf("Searing Gorge", {
	{
		name = "Thorium Point", faction = "Neutral", levels = "45-55",
		hook = "The Dark Iron dwarves who walked away from Ragnaros, selling to everyone.",
		lore = {
			"The Thorium Brotherhood are Dark Irons who rejected Ragnaros' service and set out to be smiths again rather than slaves. Thorium Point is their camp, and they keep it neutral.",
			"They are the best metalworkers in the world and they know it. Alliance and Horde both court them, and the Brotherhood's price is usually information or materials from Blackrock Mountain.",
		},
	},
	{
		name = "The Cauldron", parent = "Searing Gorge", faction = "Hostile",
		hook = "The great open pit at the Gorge's centre, worked by Dark Irons and lit from below.",
		lore = {
			"The Cauldron is the Gorge's central crater and the heart of Dark Iron industry here. It is an open-cast operation on a scale that would impress Ironforge, if Ironforge could bear to look.",
			"Beneath it is Blackrock Mountain's western approach. The Cauldron is a doorway as well as a mine.",
		},
	},
	{
		name = "Grimesilt Dig Site", parent = "Searing Gorge", faction = "Hostile",
		hook = "A Dark Iron excavation run with press-ganged labour.",
		lore = {
			"The Grimesilt dig is a Dark Iron operation, and the Dark Irons do not pay wages. The site runs on coerced labour and the overseers are not interested in complaints.",
			"What they are digging for is not advertised. In a zone created by a botched summoning, that is a worrying omission.",
		},
	},
	{
		name = "Firewatch Ridge", parent = "Searing Gorge", faction = "Hostile",
		hook = "A Dark Iron position on the northern ridge, full of fire magic.",
		lore = {
			"Firewatch Ridge is held by Dark Iron sorcerers and elementalists working directly in Ragnaros' service.",
			"Dark Iron magic runs to fire and binding. They are not shamans; they compel elementals rather than ask them, and the elements in this region are correspondingly hostile.",
		},
	},
	{
		name = "The Slag Pit", parent = "Searing Gorge", faction = "Hostile",
		hook = "A waste pit of molten slag, with things living in it.",
		lore = {
			"The Slag Pit is where the Gorge's industry dumps what it cannot use. Fire elementals and worse have taken up residence in the runoff.",
			"The Dark Irons regard this as acceptable. They regard most things as acceptable.",
		},
	},
	{
		name = "Blackchar Cave", parent = "Searing Gorge", faction = "Hostile",
		hook = "A cave of fire elementals on the Gorge's edge.",
		lore = {
			"Blackchar is one of several places in the Gorge where the elemental plane of fire presses close enough that its inhabitants simply walk through.",
			"Ragnaros' presence under this mountain has thinned the boundary, and the Dark Irons have made no attempt to repair it.",
		},
	},
	{
		name = "The Sea of Cinders", parent = "Searing Gorge", faction = "Contested",
		hook = "A plain of ash where nothing has grown since the mountain broke.",
		lore = {
			"The Sea of Cinders is the ash field left by Thaurissan's summoning. It has not recovered in all the years since and shows no sign of starting.",
			"It is the clearest physical record of what happened here, and the Dark Irons walk across it daily without comment.",
		},
	},
	{
		name = "Dustfire Valley", parent = "Searing Gorge", faction = "Contested",
		hook = "A scorched valley on the Gorge's southern edge.",
		lore = {
			"Dustfire is the route between the Searing Gorge and the Badlands, as dry and hot as everything else here.",
			"Travellers between Khaz Modan and Blackrock Mountain pass through, and that is most of the traffic this zone gets.",
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
	didYouKnow = "The Ruins of Thaurissan on the Steppes are what is left of the Dark Iron capital's surface. The rest of the city sank into the mountain and became Blackrock Depths, with Thaurissan's heirs still living in it.",
	readMore = { "Wowpedia: Burning Steppes", "Wowpedia: Blackrock Mountain", "Wowpedia: Nefarian" },
}

SubsOf("Burning Steppes", {
	{
		name = "Blackrock Mountain", parent = "Burning Steppes", faction = "Hostile", levels = "50-60",
		hook = "A volcano holding two armies, a fire lord and a black dragon, all of whom want the others dead.",
		lore = {
			"Blackrock Mountain is a single volcano containing several wars. The orcish Horde used it as its staging ground in the First and Second Wars; Anduin Lothar died fighting Orgrim Doomhammer at its gates.",
			"Now it is layered. The Dark Iron dwarves and Ragnaros hold the Depths. The Dark Horde holds the Spire. Nefarian holds the Spire's upper reaches and plays the others against each other. None of these parties are allies.",
			"The mountain is the single densest concentration of hostile power on the continent, and both the Alliance and the Horde have decided to treat it as somebody else's problem for now.",
		},
		readMore = { "Wowpedia: Blackrock Mountain", "Wowpedia: Blackrock Spire" },
	},
	{
		name = "Ruins of Thaurissan", parent = "Burning Steppes", faction = "Hostile",
		hook = "The surface remains of the Dark Iron capital, burned by its own emperor's summoning.",
		lore = {
			"Thaurissan was the Dark Iron clan's city after they fled south from Ironforge. Emperor Dagran Thaurissan ruled it, and his summoning of Ragnaros destroyed it.",
			"What you see on the Steppes is the part that stayed above ground. The rest went down with the mountain and is now Blackrock Depths, where the emperor's line still holds court.",
		},
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
			"Morgan's Vigil is Stormwind's forward position on the Steppes, watching the mountain and the road east.",
			"It is small, exposed and about as far from reinforcement as an Alliance posting gets.",
		},
	},
	{
		name = "Dreadmaul Rock", parent = "Burning Steppes", faction = "Hostile",
		hook = "An ogre hold on the Steppes, allied with the Dark Horde.",
		lore = {
			"The Dreadmaul ogres hold this rock and work alongside the Blackrock orcs. Most ogre clans never manage an arrangement that functional.",
			"Ogres were brought to this world by the Horde and the ones who stayed near Blackrock Mountain never really left the Horde's orbit.",
		},
	},
	{
		name = "Altar of Storms", parent = "Burning Steppes", faction = "Hostile",
		hook = "A demonic altar left over from the Horde's warlock era.",
		lore = {
			"The Altar of Storms is one of several such sites raised by orcish warlocks during the Horde's campaigns, when the Shadow Council and Gul'dan's influence ran the clans.",
			"Thrall's Horde has outlawed warlock practice of this kind, but the altars are still standing and still being used by people who do not take orders from Orgrimmar.",
		},
	},
	{
		name = "Terror Wing Path", parent = "Burning Steppes", faction = "Hostile",
		hook = "A pass full of black dragonkin, on the approach to the mountain.",
		lore = {
			"Terror Wing Path is black dragonflight territory, which on the Steppes means Nefarian's. Drakes and dragonspawn patrol it.",
			"Nefarian's work in the Spire needs space and privacy, and the Steppes supply both. These patrols are how he keeps the second one.",
		},
	},
	{
		name = "The Pillar of Ash", parent = "Burning Steppes", faction = "Contested",
		hook = "A rock spire on the road to Blackrock Mountain, used as a landmark by everyone.",
		lore = {
			"The Pillar is the most visible feature on the Steppes after the mountain itself, and it marks the approach to Blackrock Mountain's gates.",
			"Every army that has marched on or out of the mountain has passed it, and that is a considerable number of armies.",
		},
	},
	{
		name = "Blackrock Pass", parent = "Burning Steppes", faction = "Contested",
		hook = "The road between the Burning Steppes and Redridge.",
		lore = {
			"Blackrock Pass is the route down out of the Steppes toward Redridge and, beyond it, Elwynn and Stormwind. It is the road the Blackrock orcs use.",
			"Stonewatch Keep at the far end was built to close this pass. The orcs took Stonewatch, so the pass is open.",
		},
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
		"Uther is buried here, at a tomb near Sorrow Hill. Andorhal is a four-way battleground between the Scourge, the Forsaken, the Scarlet Crusade and the Argent Dawn. Hearthglen in the north is held by the Scarlet Crusade under Highlord Taelan Fordring, whose father Tirion was stripped of his knighthood for showing mercy to an orc.",
	},
	didYouKnow = "Caer Darrow, the island in Darrowmere Lake, was the Barov family's estate. Kel'Thuzad took it, killed the family and turned their manor into Scholomance, a school of necromancy. The Barovs are still there in a sense.",
	readMore = { "Wowpedia: Western Plaguelands", "Wowpedia: Andorhal", "Wowpedia: Uther the Lightbringer" },
}

SubsOf("Western Plaguelands", {
	{
		name = "Andorhal", parent = "Western Plaguelands", faction = "Hostile",
		hook = "The town where the plague was distributed, now fought over by four separate factions.",
		lore = {
			"Andorhal was Lordaeron's main granary town, and the Cult of the Damned chose it for exactly that reason. The plagued grain went out from these warehouses to the whole region.",
			"The town is now a four-cornered battlefield: Scourge forces under Araj the Summoner, Forsaken agents, the Scarlet Crusade, and the Argent Dawn all have a presence and none of them will leave.",
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
			"Caer Darrow was the Barov family's island holding in Darrowmere Lake, a wealthy and respectable estate. Kel'Thuzad acquired it by murdering the family, and converted the manor's crypts into Scholomance.",
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
		hook = "Another of the four plague farms, still in operation.",
		lore = {
			"Gahrron's was a farm with a name and a family. It is now a Scourge blight works like its three neighbours.",
			"The Argent Dawn's long-term campaign in this zone comes down to shutting these four farms down.",
		},
	},
	{
		name = "Felstone Field", parent = "Western Plaguelands", faction = "Hostile",
		hook = "The westernmost of the four plague farms.",
		lore = {
			"Felstone Field completes the set of four with Dalson's Tears, Gahrron's Withering and the Writhing Haunt.",
			"Each has a cauldron at its centre. Destroying them is the Argent Dawn's standing request to anyone passing through.",
		},
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
		hook = "A logging camp overrun by the Scourge, with the loggers still working.",
		lore = {
			"Northridge supplied timber to the region. The Scourge took it, and the workforce has been repurposed rather than replaced.",
			"It sits on the road to Hearthglen, making it the Scarlet Crusade's problem as well.",
		},
	},
	{
		name = "Sorrow Hill", parent = "Western Plaguelands", faction = "Hostile",
		hook = "A mass burial ground below Uther's tomb.",
		lore = {
			"Sorrow Hill holds the dead of the plague's first wave, buried in numbers that made individual graves impossible.",
			"Being a mass grave in the Plaguelands, it has not stayed quiet. The proximity to Uther's tomb is a bitter joke the land is playing.",
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
			"Stratholme was Lordaeron's second city, a centre of the Church of the Holy Light, and the seat of the Knights of the Silver Hand. When the plagued grain reached it, Arthas ordered the city killed. Uther and Jaina walked away rather than take part; Arthas carried out the purge and then followed Mal'Ganis to Northrend.",
			"The city is now held by the Scourge under Baron Rivendare, with the Scarlet Crusade fighting for the other half under Grand Crusader Dathrohan. Two of the most fanatical forces in the world are contesting a city that is already dead.",
			"The Scarlet Crusade's rank and file are told very little by their own command. They are dying in these streets under orders they have no standing to question.",
		},
		readMore = { "Wowpedia: Stratholme", "Wowpedia: Culling of Stratholme" },
	},
	{
		name = "Plaguewood", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "A dead forest under Naxxramas, which is floating overhead.",
		lore = {
			"Plaguewood is the blighted forest in the zone's north, and Kel'Thuzad's necropolis Naxxramas hangs in the air above it.",
			"Naxxramas is a flying fortress of the Scourge and Kel'Thuzad's personal seat. It sits there in plain view from the road, and nobody has been able to do a thing about it.",
		},
	},
	{
		name = "Ruins of Darrowshire", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "A village destroyed in a battle its dead are still fighting.",
		lore = {
			"Darrowshire was a village that made a stand against the Scourge and lost. The battle was a massacre on both sides, and it has not stopped.",
			"The dead of Darrowshire are still in the village, still fighting the same fight. Laying them to rest is one of the Argent Dawn's long-standing concerns, and it requires knowing exactly who did what on the day.",
		},
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
			"Corin's Crossing was a trading village at the junction of the zone's roads. The Scourge holds it and uses it as the hub it always was.",
			"Its position means almost everyone travelling the Eastern Plaguelands has to deal with it.",
		},
	},
	{
		name = "The Marris Stead", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "A farmstead turned Scourge outpost, close to Light's Hope.",
		lore = {
			"The Marris Stead is a Scourge-held farm uncomfortably near the Argent Dawn's chapel, which is deliberate.",
			"The Scourge keeps pressure on Light's Hope constantly without ever being able to take it.",
		},
	},
	{
		name = "Quel'Lithien Lodge", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "A high elf lodge in the north, guarding a border that no longer exists.",
		lore = {
			"The elves at Quel'Lithien were posted to watch the southern approach to Quel'Thalas. Then Arthas came north through this region with the Scourge and destroyed their kingdom anyway.",
			"The survivors here have grown bitter and dangerous. Their homeland is gone, the Sunwell was defiled, and they blame the humans who failed to hold the line.",
		},
	},
	{
		name = "Zul'Mashar", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "Troll ruins in the northeast, now Scourge-infested.",
		lore = {
			"Zul'Mashar is an Amani troll site, predating everything human in this region by a long way. The Scourge has taken it like everything else.",
			"The trolls' holdings in the north were already in decline before the plague. The Scourge simply finished the job.",
		},
	},
	{
		name = "The Noxious Glade", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "A pocket of concentrated blight in the eastern woods.",
		lore = {
			"The Noxious Glade is one of the places where the Plaguelands' corruption is at its thickest, and the things living in it reflect that.",
			"The Argent Dawn maps these pockets carefully. They are where the blight is being actively maintained rather than merely lingering.",
		},
	},
	{
		name = "The Undercroft", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "A crypt near Darrowshire, raided by necromancers.",
		lore = {
			"The Undercroft is a burial site the Scourge's necromancers have been working, by which anyone local means harvesting.",
			"Every graveyard in this zone is a resource to the Scourge, and the Dawn cannot guard them all.",
		},
	},
	{
		name = "Northpass Tower", parent = "Eastern Plaguelands", faction = "Contested",
		hook = "One of four towers ringing the zone, worth holding for the view.",
		lore = {
			"Four towers stand at the Eastern Plaguelands' compass points: Northpass, Eastwall, Crown Guard and the Plaguewood tower. They were Lordaeron's watch posts.",
			"They change hands between the Scourge and whoever is contesting them, and holding them gives real advantage over the zone's roads.",
		},
	},
	{
		name = "Terrordale", parent = "Eastern Plaguelands", faction = "Hostile",
		hook = "A ruined town in the far north, abandoned even by the standards of this zone.",
		lore = {
			"Terrordale was a Lordaeron town on the road north toward Quel'Thalas. It was destroyed when the Scourge came through and has been left to rot.",
			"It is close enough to Stratholme to be well inside Scourge territory and far enough from anything useful to be ignored.",
		},
	},
})

-- ---------------------------------------------------------------------------
-- DEADWIND PASS
-- ---------------------------------------------------------------------------

Zone{
	name = "Deadwind Pass", continent = EK, faction = "Contested", levels = "55-60",
	hook = "An emptied canyon road under Karazhan, the tower of the Guardian who betrayed the world.",
	lore = {
		"Deadwind Pass is the canyon between Duskwood and the Swamp of Sorrows, and almost nothing lives in it. There was a village here once. There is not now, and the records on why are thin.",
		"The reason to come here is Karazhan. The tower was the seat of Medivh, the last Guardian of Tirisfal, an order of mages charged with defending this world from the Burning Legion. Medivh was the most powerful mortal spellcaster alive and the Legion got to him before he was born: the spirit of the demon lord Sargeras had been bound into him in the womb.",
		"Medivh opened the Dark Portal. He brought the orcish Horde to this world and let the First War happen, and he did it from this tower. His apprentice Khadgar and the knight Anduin Lothar eventually killed him here. The tower has been sealed and uninhabited since, and it has not stopped radiating whatever Medivh left in it.",
	},
	didYouKnow = "Medivh is also the reason the Alliance won the Second War. Freed of Sargeras at the end, he returned as a prophet during the Third War and assembled the alliance of humans, orcs and night elves that stopped Archimonde at Mount Hyjal. He is one of history's most consequential figures in both directions.",
	readMore = { "Wowpedia: Deadwind Pass", "Wowpedia: Karazhan", "Wowpedia: Medivh" },
}

SubsOf("Deadwind Pass", {
	{
		name = "Karazhan", parent = "Deadwind Pass", faction = "Hostile",
		hook = "The last Guardian's tower, sealed, and still not quiet.",
		lore = {
			"Karazhan was Medivh's home and workshop, built where ley lines converge. The Guardians of Tirisfal placed it here on purpose; the tower is a magical instrument as much as a residence.",
			"Medivh died in it. Nobody has successfully claimed it since, and the few expeditions that have gone in have not come back with a coherent account of what is inside.",
			"Mages and the Kirin Tor's remnants watch the tower from a distance. There is general agreement that someone will eventually have to go in and find out what Medivh left behind.",
		},
		didYouKnow = "Medivh's mother Aegwynn was Guardian before him, and she killed an avatar of Sargeras in Northrend. Binding his spirit into her unborn son was his revenge for it.",
	},
	{
		name = "Deadwind Ravine", parent = "Deadwind Pass", faction = "Contested",
		hook = "The canyon floor, with an ogre camp and a very long silence.",
		lore = {
			"The ravine carries the only road through the pass. Deadwind ogres have camped along it, the closest thing this zone has to a population.",
			"There is no inn, no flight path and no settlement in Deadwind Pass. Travellers go through without stopping. That is the pass's entire character.",
		},
	},
	{
		name = "The Vice", parent = "Deadwind Pass", faction = "Hostile",
		hook = "A narrow cleft off the main road, held by ogres.",
		lore = {
			"The Vice is a side canyon the Deadwind ogres use as a camp. It is the only organised presence in the pass besides whatever is in the tower.",
			"Ogres are indifferent to history. Nothing else could live next to Karazhan so comfortably.",
		},
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
		hook = "A Kirin Tor fortress built to watch the Dark Portal and never stand down.",
		lore = {
			"Archmage Khadgar wanted a permanent watch on the Dark Portal and would not let the subject drop, so the kingdoms of the Alliance of Lordaeron paid for one. The Kirin Tor staffed it. The stonework is the Stonemasons' Guild's, raised under a foreman named Edwin VanCleef. Hold on to that if you have been anywhere near Westfall.",
			"The posting is thankless. The mages and soldiers here have spent years watching a broken gate, fighting off demons from the Tainted Scar, and receiving very little attention from a world with newer problems.",
		},
	},
	{
		name = "The Dark Portal", parent = "Blasted Lands", faction = "Hostile",
		hook = "The gate the orcs came through, standing broken in a crater of its own making.",
		lore = {
			"Medivh, under Sargeras' influence, worked with Gul'dan to open this portal between Azeroth and the orcs' dying homeworld of Draenor. The First War came through it.",
			"After the Second War the Alliance Expedition went the other way and destroyed it from the Draenor side. The frame remains, and so does the crater its opening burned into the land.",
			"Demons gather near it. Whether that is because the portal still leaks or simply because the Legion likes the symbolism is an open question at Nethergarde.",
		},
		readMore = { "Wowpedia: Dark Portal" },
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
		hook = "A rise held by the demon Razelikh and his ogre servants.",
		lore = {
			"Razelikh the Defiler is a demon who has carved out his own territory here, served by the Dreadmaul ogres who worship him.",
			"The Blasted Lands have become a place where individual demons set up principalities. That is what becomes of a region nobody has the resources to hold.",
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
		hook = "A coiled rock formation in the east, infested with basilisks.",
		lore = {
			"The Serpent's Coil is a natural formation, and the basilisks that live in it are among the few creatures that have adapted to the Blasted Lands rather than being imported into them.",
			"The zone's native wildlife is scarce, strange and uniformly hostile. Nothing here is accidental.",
		},
	},
	{
		name = "Dreadmaul Post", parent = "Blasted Lands", faction = "Hostile",
		hook = "An ogre camp on the road, taxing the route to the portal.",
		lore = {
			"Dreadmaul Post sits on the main road through the Blasted Lands and the ogres there make travelling it expensive.",
			"The Nethergarde garrison clears the road periodically. The ogres come back.",
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
		hook = "One of the old orcish demonic altars, in the shadow of the portal.",
		lore = {
			"The Horde's warlocks raised altars like this across their conquests, and this one sits close to where they first arrived.",
			"The Shadow Council that ran the Old Horde through Gul'dan was a warlock cabal. Altars like this one were its infrastructure.",
		},
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
		hook = "A village the Scourge destroyed, with its dead still standing in it.",
		lore = {
			"Darrowshire was an ordinary village in what was then Lordaeron's eastern countryside. When the Scourge came through during the Third War it was destroyed, and the militia that stood to meet it was killed to the last.",
			"What is left is foundations, and the dead. The Plaguelands are full of places like this; Darrowshire is the one the living still argue about, because enough of the story survived for people to want it settled.",
			"That argument is a thing to walk into rather than be told. The village is quiet now, and it is not empty.",
		},
		readMore = { "Wowpedia: Darrowshire", "Wowpedia: Eastern Plaguelands" },
	},
})

SubsOf("Tirisfal Glades", {
	{
		name = "Faol's Rest", parent = "Tirisfal Glades", faction = "Contested",
		hook = "The grave of the archbishop who founded the Silver Hand, now untended.",
		lore = {
			"Alonsus Faol was Archbishop of the Church of the Holy Light and the man who answered the Second War by inventing an answer to it. With Uther at his side he founded the Knights of the Silver Hand, the first paladins, and trained the generation who fought the orcs to a standstill.",
			"He died before the Scourge came and was spared the sight of what his own best student became: Arthas Menethil was raised in that tradition, and took up Frostmourne regardless.",
			"The grave sits in eastern Tirisfal, a short way from the Scarlet Monastery. It was a place of pilgrimage once. Nobody tends it now, and the ground around it belongs to the Forsaken and the Scarlet Crusade, neither of whom have any use for a shrine to the other side's saint.",
		},
		readMore = { "Wowpedia: Alonsus Faol", "Wowpedia: Knights of the Silver Hand" },
	},
})

SubsOf("Silverpine Forest", {
	{
		name = "Fenris Keep", parent = "Silverpine Forest", faction = "Hostile",
		hook = "A keep on an island in Lordamere Lake, taken by a Kirin Tor mage who went over to the Scourge.",
		lore = {
			"Fenris Keep stands on Fenris Isle, out in Lordamere Lake, and it mattered: a sizeable part of Lordaeron's standing military was quartered here.",
			"It fell in the Third War, and not to an army. Thule Ravenclaw was a young and ambitious mage of the Kirin Tor who threw in with the Scourge, took the keep, and made himself master of the local gnolls. The Rot Hide are his doing.",
			"An ambitious apprentice deciding the Scourge was the better offer was not unusual. Kel'Thuzad made the same calculation at the top of the Kirin Tor, and Dalaran is a ruin inside a dome because of it.",
		},
		readMore = { "Wowpedia: Fenris Keep", "Wowpedia: Thule Ravenclaw", "Wowpedia: Rot Hide" },
	},
})

SubsOf("Dun Morogh", {
	{
		name = "Anvilmar", parent = "Dun Morogh", faction = "Alliance",
		hook = "The hall the dwarves lived in before Ironforge, and the name of their last High King.",
		lore = {
			"Anvilmar is where the dwarves were before they were three peoples. Modimus Anvilmar was High King when they were still one, ruling from a hall rather than from a mountain, and the clans answered to him together.",
			"His death ended that. There was no settled succession, and the Bronzebeards, the Wildhammers and the Dark Irons went to war over the throne. That is the War of the Three Hammers, and every dwarven grievance since turns on it.",
			"The hall is a quiet place for new dwarves to start out from, and that is a mild irony. Everything that divided their people began with the question of who got to sit in it.",
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
	{
		name = "Old Dalaran Ruins", parent = "Alterac Mountains", faction = "Contested",
		hook = "What is left outside the dome, where the magocracy used to stand.",
		lore = {
			"Dalaran was the greatest school of arcane learning in the world, and Archimonde destroyed it in an afternoon at the end of the Third War. He broke the city to get at what the Kirin Tor had been keeping and then marched on Hyjal, where he died.",
			"The surviving magi raised a dome over the worst of it. These ruins are the ground outside that, left uncovered.",
			"The city brought a great deal of this on itself. Kel'Thuzad was one of its own, the Cult of the Damned was founded by a member of the Council of Six, and the Kirin Tor's habit of studying things it should have destroyed is the thread running through all of it.",
		},
		readMore = { "Wowpedia: Dalaran", "Wowpedia: Archimonde", "Wowpedia: Kel'Thuzad" },
	},
})

SubsOf("Wetlands", {
	{
		name = "Menethil Keep", parent = "Wetlands", faction = "Alliance",
		hook = "The keep over Menethil Harbour, named for a royal line that no longer exists.",
		lore = {
			"Menethil Harbour is the Alliance's western port and the keep is what holds it. Both carry the name of Lordaeron's royal house: Terenas Menethil was the king who assembled the Alliance of Lordaeron and won the Second War.",
			"His son finished the house. Arthas Menethil took up Frostmourne, came home a death knight, and killed his father on the throne in Capital City.",
			"So a working harbour in dwarf country keeps the name of a dynasty whose last act was to destroy its own kingdom. Nobody has suggested changing it.",
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
			"That is the whole of the Forsaken condition in one room. They were buried as Lordaeron's dead, raised by the Scourge as its property, and then freed when Sylvanas Windrunner broke the Lich King's hold on a part of his own army.",
			"Free is a strained word for it. They remember who they were, their families are alive and want nothing to do with them, and the Church of the Holy Light considers them an abomination. Waking in a crypt is the gentlest part of the arrangement.",
		},
		readMore = { "Wowpedia: Deathknell", "Wowpedia: Forsaken", "Wowpedia: Sylvanas Windrunner" },
	},
	{
		name = "Agamand Family Crypt", parent = "Tirisfal Glades", faction = "Hostile",
		hook = "A farming family's tomb, with the family still in it and still moving.",
		lore = {
			"The Agamands held the mills north of Brill for generations, and the crypt is where they buried their own. The Scourge came through Tirisfal and raised the lot of them.",
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
			"The tunnel runs through the mountain north-west of Terrordale and comes out south at the Thondroril River. What is inside it is crypt fiends, which is to say nerubians.",
			"The nerubians are not Lordaeron's dead. They were a civilisation of their own in Northrend, old and organised, with a subterranean empire called Azjol-Nerub. The Lich King made war on them and won, and the ones in this tunnel are what he turned them into.",
			"Their presence this far south says something about how far the Scourge reaches. Naxxramas hangs over these lands, and the army under it was assembled from more than one conquered people.",
		},
		readMore = { "Wowpedia: Terrorweb Tunnel", "Wowpedia: Nerubian", "Wowpedia: Azjol-Nerub" },
	},
})

SubsOf("Arathi Highlands", {
	{
		name = "The Tower of Arathor", parent = "Arathi Highlands", faction = "Alliance",
		hook = "A tower named for the empire every human kingdom broke off from.",
		lore = {
			"Arathor was the first human nation, founded at Strom when the scattered tribes united under the Arathi. Every human kingdom since is a piece of it: Stormwind, Lordaeron, Alterac, Gilneas, Kul Tiras and Dalaran were all Arathorian colonies that outgrew the parent.",
			"Strom became Stromgarde, and Stromgarde is a ruin in these highlands held in three parts by its own army, the Syndicate and the Boulderfist ogres. The kingdom that invented human unity could not hold its own capital.",
			"Arathor's other legacy is the magi. The Arathi taught high elves' magic to a hundred selected humans and founded Dalaran on the result, and that bargain is behind a great deal of what followed.",
		},
		readMore = { "Wowpedia: Arathor", "Wowpedia: Stromgarde", "Wowpedia: Strom" },
	},
})

SubsOf("Stranglethorn Vale", {
	{
		name = "Blackwater Cove", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "A pirate anchorage on a coast where every other power has already failed.",
		lore = {
			"The Blackwater Raiders work this coast, and Stranglethorn suits them: dense jungle, no government, and a neutral goblin port at Booty Bay buying whatever comes in without asking.",
			"Piracy here is a symptom. Stranglethorn was Gurubashi troll empire, then it was Stormwind's southern frontier, and now it is neither. Nobody's writ runs in the jungle, so everybody's does.",
			"The Raiders are not even the only pirates. The Bloodsail Buccaneers are also on this coast and the two outfits hate each other considerably more than either hates a traveller.",
		},
		readMore = { "Wowpedia: Blackwater Raiders", "Wowpedia: Stranglethorn Vale" },
	},
	{
		name = "Ruins of Jubuwal", parent = "Stranglethorn Vale", faction = "Contested",
		hook = "Gurubashi stonework on the coast, from an empire that covered this whole jungle.",
		lore = {
			"The Gurubashi were the great troll empire of the south, and Stranglethorn was the heart of it. The ruins scattered through this jungle are all theirs, and there are a great many of them.",
			"What broke the empire was internal. The Gurubashi split in a war over the worship of Hakkar the Soulflayer, a blood god the Atal'ai priesthood wanted to summon bodily into the world. The empire tore itself apart over it and the Atal'ai were exiled.",
			"They did not give up. The Temple of Atal'Hakkar in the Swamp of Sorrows was their attempt at finishing the job, and Zul'Gurub is where the argument was finally won by the wrong side.",
		},
		readMore = { "Wowpedia: Gurubashi", "Wowpedia: Hakkar the Soulflayer", "Wowpedia: Atal'ai" },
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
		hook = "The floor of the Gurubashi Arena, where the sand used to be muddy with troll blood.",
		lore = {
			"The Battle Ring is the arena floor itself, inside the Gurubashi Arena north of Booty Bay. The arena is Gurubashi work, left from the empire that held most of the southern Eastern Kingdoms.",
			"In its own time the fights here were to the death, and the accounts describe the sand as muddy with it. Once a generation the best troll fighters from across the world came to this ring to settle who they were.",
			"What happens in it now is run by a goblin called Short John Mithril and is a good deal less lethal. An empire's proving ground is a prize-fighting pit with an entry fee.",
		},
		didYouKnow = "The arena has a story attached: find a blood-red amulet here at midnight and a demon will have eaten your soul by sunrise. Nobody at Booty Bay discourages the telling of it.",
		readMore = { "Wowpedia: Gurubashi Arena", "Wowpedia: Gurubashi" },
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
		hook = "One of three Bloodsail frigates moored off the Wild Shore.",
		lore = {
			"The Bloodsail Buccaneers keep three frigates at the Wild Shore, and this is one of them. The others are the Damsel's Luck and the Riptide.",
			"Three ships is a fleet by the standards of this coast, and that is what makes the Bloodsail a political problem rather than a nuisance. Booty Bay can police a jungle road. It cannot police the sea.",
			"The goblins' answer has been to make the Bloodsail unwelcome in the one port worth visiting. That has pushed the pirates further into taking what they need rather than buying it.",
		},
		readMore = { "Wowpedia: Bloodsail Buccaneers" },
	},
	{
		name = "The Damsel's Luck", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "The easternmost of the Bloodsail frigates, with a crew aboard worth knowing about.",
		lore = {
			"The Damsel's Luck lies furthest east of the three Bloodsail ships at the Wild Shore. Captain Stillwater has her, and the Brashtide Crew are aboard.",
			"Pirate outfits on this coast are not a single organisation. The Bloodsail and the Blackwater Raiders are both here and they loathe each other considerably more than either troubles about a passing traveller.",
			"That is the reason piracy persists in Stranglethorn rather than being settled one way or the other. There is nobody to negotiate with.",
		},
		readMore = { "Wowpedia: The Damsel's Luck", "Wowpedia: Bloodsail Buccaneers" },
	},
	{
		name = "The Riptide", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "The third Bloodsail frigate, on the last stretch of coast before the open sea.",
		lore = {
			"The Riptide is moored with the Crimson Veil and the Damsel's Luck off the Wild Shore, at the bottom end of the Eastern Kingdoms.",
			"The position is the point. Everything sailing between Kalimdor and the Eastern Kingdoms passes this cape, and Booty Bay exists because the goblins worked that out first. The Bloodsail worked it out second and arrived with hulls instead of a harbour.",
			"Stranglethorn was Gurubashi country, then Stormwind's southern frontier, and now it is neither. Three pirate frigates on the southern beach is what the absence of a government looks like.",
		},
		readMore = { "Wowpedia: Bloodsail Buccaneers", "Wowpedia: Stranglethorn Vale" },
	},
	{
		name = "Venture Co. Operations Center", parent = "Stranglethorn Vale", faction = "Hostile",
		hook = "A goblin oil platform on a jungle lake, run by the cartel that does not pretend to be neutral.",
		lore = {
			"The Venture Company put an oil platform on a lake in northern Stranglethorn, and they have it staffed with mechanics and geologists rather than soldiers. They are prospecting.",
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
			"Northdale lies north of Light's Hope Chapel, below the way into Quel'Thalas, and it is wreckage. Banshees hold it, with eyeless watchers that cannot be seen, and the lake beside it has corrupted elementals in it.",
			"Taelan Fordring renounced the Order of the Silver Hand here and went to the Scarlet Crusade. He was Tirion Fordring's son, and Tirion had already been stripped of his own title and exiled for sparing the life of an orc.",
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
			"Most of their kind in this swamp have gone feral, and the Swamp of Sorrows is full of them. The ones here did not. Magtoor leads those who stayed sane, they hold to the Holy Light, and they are trying to make something of a camp in a marsh nobody else wants.",
			"They are the other casualty of the First War. The orcs came through that portal as an army; these came through as refugees from the same ruined world, and nothing in the Alliance or the Horde has a place for them.",
		},
		readMore = { "Wowpedia: Harborage", "Wowpedia: Lost One", "Wowpedia: Dark Portal" },
	},
})

SubsOf("Badlands", {
	{
		name = "The Maker's Terrace", parent = "Badlands", faction = "Hostile",
		hook = "The excavation outside Uldaman's door, patrolled by Dark Irons.",
		lore = {
			"The Terrace is the dig outside the entrance to Uldaman, and for anyone coming into the Badlands from Loch Modan it is the first thing on the road.",
			"\"The Maker\" is the titans. Uldaman is one of their vaults, and what the Explorers' League found inside it was the Discs of Norgannon and the record of the earthen: living stone, shaped by the titans, and the dwarves' own ancestors. Ironforge has not been the same since reading it.",
			"The Dark Iron patrol the Terrace now. They are dwarves too, and the same record is theirs, which does not appear to have made them any friendlier about who gets to read it.",
		},
		readMore = { "Wowpedia: Maker's Terrace", "Wowpedia: Uldaman", "Wowpedia: Titan", "Wowpedia: Earthen" },
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
		hook = "The tower of the Stonewatch stronghold, on the same captured ground.",
		lore = {
			"The tower is the other half of Stonewatch, and it fell with the keep when the Blackrock orcs came through for Morganth.",
			"The position is the whole reason anybody wants it. Stonewatch sits on the pass, and the pass is the way between Redridge and the Burning Steppes, and the Steppes are Blackrock Mountain's doorstep.",
			"So a human fort built to watch the road to Blackrock is now held by the people it was watching for.",
		},
		readMore = { "Wowpedia: Stonewatch", "Wowpedia: Blackrock clan" },
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
			"The Vice is a run of caves in Deadwind Pass, and the Grosh'gok Compound is the southernmost and the biggest. Ogres hold it.",
			"Ogres in the Eastern Kingdoms are what the Old Horde left behind. Gul'dan brought them through the Dark Portal during the Second War and the collapse abandoned them here with no masters and no way home.",
			"A pass with Karazhan at one end and an ogre mound at the other, and almost nobody living in between. Nothing has been resolved in Deadwind Pass; it has simply been left.",
		},
		readMore = { "Wowpedia: Grosh'gok Compound", "Wowpedia: Ogre", "Wowpedia: Deadwind Pass" },
	},
})

SubsOf("Dun Morogh", {
	{
		name = "Ironband's Compound", parent = "Dun Morogh", faction = "Hostile",
		hook = "A dig south of Helm's Bed Lake that the Dark Iron have taken over.",
		lore = {
			"Sturgy Ironband had this compound in eastern Dun Morogh, and it is Dark Iron ground now. They attack anyone who comes close.",
			"Dark Irons this far into Bronzebeard country is not a raid, it is a presence, and Ironforge wants evidence of it. That is the sort of errand the city hands to whoever is willing.",
			"The Dark Iron are the third clan from the War of the Three Hammers, the one that lost twice: beaten for the throne, then bound to Ragnaros by their own emperor's summoning. They have spent the time since trying to get back into the mountain.",
		},
		readMore = { "Wowpedia: Ironband's Compound", "Wowpedia: Dark Iron clan", "Wowpedia: War of the Three Hammers" },
	},
	{
		name = "Steelgrill's Depot", parent = "Dun Morogh", faction = "Alliance",
		hook = "Miners and engineers east of Kharanos, with Gnomeregan on their minds.",
		lore = {
			"Steelgrill's Depot is a small working settlement just outside Kharanos: trainers, vendors, and the sort of machinery dwarven and gnomish engineering produces when nobody is stopping it.",
			"Gnomeregan is the thing hanging over it. The gnomes' city was lost to the troggs, and Sicco Thermaplugg's answer was to flood it with radiation rather than surrender it, killing most of his own people.",
			"The survivors live in Ironforge's Tinker Town now, and retaking the city is an ongoing project rather than an abandoned one. A depot full of engineers near the mountain is part of that.",
		},
		readMore = { "Wowpedia: Steelgrill's Depot", "Wowpedia: Gnomeregan", "Wowpedia: Sicco Thermaplugg" },
	},
})

SubsOf("Elwynn Forest", {
	{
		name = "The Stonefield Farm", parent = "Elwynn Forest", faction = "Alliance",
		hook = "One half of a farming feud, with a child in love with the other half.",
		lore = {
			"The Stonefields farm in southern Elwynn, and they loathe the Maclures next door. Nobody involved seems able to say exactly when it started or what it was about.",
			"It has gone the way these things do. A Stonefield child and a Maclure child have fallen in love, and the two families are the last to work it out.",
			"Elwynn is the quietest zone in the Eastern Kingdoms and its largest ongoing dispute is between two farms over nothing. That is worth appreciating, given what the rest of the continent is dealing with.",
		},
		didYouKnow = "The feud is a nod to the Hatfields and the McCoys, and the romance to Romeo and Juliet. Elwynn's writers were having a good day.",
		readMore = { "Wowpedia: Stonefield Farm", "Wowpedia: Elwynn Forest" },
	},
	{
		name = "The Maclure Vineyards", parent = "Elwynn Forest", faction = "Alliance",
		hook = "The other half of the feud, and the one with the grapes.",
		lore = {
			"The Maclures keep vineyards in southern Elwynn, next door to the Stonefields, with whom they are not on speaking terms.",
			"The quarrel is inherited rather than reasoned, and both households are entirely committed to it. Meanwhile their children have made other arrangements.",
			"Elwynn does have real problems: the Defias are in the hills, kobolds are in the mines, and Hogger is in the woods. The vineyard feud is not one of them, and it is the one the neighbours talk about.",
		},
		readMore = { "Wowpedia: Maclure Vineyards", "Wowpedia: Elwynn Forest" },
	},
})

SubsOf("Duskwood", {
	{
		name = "Roland's Doom", parent = "Duskwood", faction = "Hostile",
		hook = "A mine in the south-east where the Scythe of Elune changed hands.",
		lore = {
			"Velinde Starsong died in this mine. She was a night elf priestess of Elune and she had the Scythe of Elune, an artefact she had been using to set worgen loose in these woods against the Scourge and worse.",
			"She lost control of it, and then she lost her life here. The Scythe was found afterwards by a man named Jitters, and the finding of it brought more worgen, and in time the Dark Riders, down on Duskwood and Darkshire.",
			"The permanent dark over this zone is not weather. Gutspill and Nefaru of the Nightbane pack work out of the mine now, and the Rotting Orchard is next door.",
		},
		readMore = { "Wowpedia: Roland's Doom", "Wowpedia: Scythe of Elune", "Wowpedia: Velinde Starsong", "Wowpedia: Worgen" },
	},
})

SubsOf("Westfall", {
	{
		name = "Stendel's Pond", parent = "Westfall", faction = "Contested",
		hook = "A pond with gnolls round it, two graves beside it, and bones in the shallows.",
		lore = {
			"Stendel's Pond sits south-west of Sentinel Hill. There are gnolls around it, scattered remains, and two graves.",
			"The water is probably not drinkable. Nobody has posted a notice; the graves are the notice.",
			"Westfall was Stormwind's breadbasket and is now the place the kingdom forgot. The farms are empty, the Defias have the mill country, and a poisoned pond with two burials beside it does not rate as news here.",
		},
		readMore = { "Wowpedia: Stendel's Pond", "Wowpedia: Westfall" },
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
		hook = "Thelsamar's inn, and the most popular room in Loch Modan.",
		lore = {
			"The Stoutlager is in Thelsamar, with an innkeeper, vendors and people handing out work. It is the place in this zone where everyone ends up.",
			"Loch Modan earns a comfortable inn. The Stonewrought Dam holds the loch, the dwarves have held this valley since before the Three Hammers, and the troubles here are troggs and the Mo'grosh ogres rather than anything existential.",
			"It is one of the few zones in the Eastern Kingdoms where the local difficulty is a nuisance instead of a catastrophe, and the inn reflects that.",
		},
		readMore = { "Wowpedia: Stoutlager Inn", "Wowpedia: Thelsamar", "Wowpedia: Loch Modan" },
	},
})

SubsOf("Duskwood", {
	{
		name = "Forlorn Rowe", parent = "Duskwood", faction = "Hostile",
		hook = "A dark hill over Raven Hill Cemetery, with a necromancer's house on top.",
		lore = {
			"The Rowe is a hill on the northern edge of Raven Hill Cemetery, and it is darker than the rest of Duskwood, and that takes some doing.",
			"Morbent Fel lives on it. He is a necromancer, and the undead throughout these woods answer to him; the graveyard below is his supply.",
			"He cannot be put down with ordinary weapons, and a detail like that turns a local problem into a campaign. Duskwood has the worgen, the Nightbane pack, the Scythe of Elune and the Dark Riders, and this is the quieter half of its trouble.",
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
			"The Vile Fin murlocs had settlements all along it and made the walk genuinely dangerous. They have since moved out to the Dawning Isles, improving the strand and ruining the islands.",
			"The capital at the north end is the Ruins of Lordaeron, with the Undercity dug out beneath it. A pleasant name for a shoreline that leads to that.",
		},
		readMore = { "Wowpedia: Shining Strand", "Wowpedia: Lordamere Lake", "Wowpedia: Silverpine Forest" },
	},
	{
		name = "The Dawning Isles", parent = "Silverpine Forest", faction = "Hostile",
		hook = "Low islands in Lordamere Lake that the plague reached and the murlocs took.",
		lore = {
			"The Dawning Isles were a set of low keys rising out of Lordamere Lake, and by every account they were lovely.",
			"Then the Plague of Undeath got into them. The trees turned sickly, bog beasts moved through, and the islands stopped being anywhere anyone went.",
			"The Vile Fin murlocs now hold them outright, having left the Shining Strand to do it. Their numbers on the isles are considerable, and nothing else is competing for the ground.",
		},
		readMore = { "Wowpedia: Dawning Isles", "Wowpedia: Plague of Undeath", "Wowpedia: Vile Fin" },
	},
})

SubsOf("Wetlands", {
	{
		name = "Deepwater Tavern", parent = "Wetlands", faction = "Alliance",
		hook = "Menethil Harbour's tavern, and the usual site of the bar fight.",
		lore = {
			"The Deepwater is the hub of Menethil Harbour: quests, a first aid trainer, vendors, and everyone passing through on their way to Kalimdor.",
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
		hook = "The western beaches of the cape, from Booty Bay up to the Vile Reef.",
		lore = {
			"The Southern Savage Coast is the shallow water and beach along the cape's western side, where the South Seas come in. It runs from the Wild Shore past Booty Bay and Janeiro's Point and stops at the Vile Reef, which separates it from the Savage Coast proper further north.",
			"Naga work this whole shoreline. So do the Bloodsail, from their anchorage at the southern end, and the goblins out of Booty Bay, who sell to everybody and police nothing beyond their own harbour wall.",
			"The reef is the reason the coast has two names. It is also the reason a great many ships have not made it past.",
		},
		readMore = { "Wowpedia: Southern Savage Coast", "Wowpedia: Booty Bay", "Wowpedia: Naga" },
	},
	{
		name = "Spirit Den", parent = "Stranglethorn Vale", faction = "Neutral",
		hook = "A hidden cave in Mistvale Valley with a witch doctor in it.",
		lore = {
			"The Spirit Den is tucked into the northern end of Mistvale Valley on the cape, and it takes finding.",
			"Witch Doctor Unbagwa works out of it. Troll witch doctors deal in the loa and in the older practice the Gurubashi empire ran on. That puts him in a different line of business from the priests at Zul'Gurub.",
			"People come to him about Stranglethorn fever, among other things. In this jungle a hidden cave with a practitioner in it is a more reliable arrangement than a surgery on a road.",
		},
		readMore = { "Wowpedia: Spirit Den", "Wowpedia: Witch doctor", "Wowpedia: Gurubashi" },
	},
})

SubsOf("Tirisfal Glades", {
	{
		name = "Brill Town Hall", parent = "Tirisfal Glades", faction = "Horde",
		hook = "Brill's town hall, where a magistrate hands out work to the dead.",
		lore = {
			"The town hall is the most prominent building in Brill, and Magistrate Sevren runs the place from a podium inside it, giving out orders and errands to any Forsaken willing to take them.",
			"It is one of only two town halls the Forsaken are known to operate anywhere. The other is the Defiler's Den.",
			"That is the shape of Sylvanas's project. The Forsaken do not want to be a horde of wandering dead; they want a state, with magistrates and paperwork and a hall to do it in, and Brill is where they practise.",
		},
		readMore = { "Wowpedia: Brill Town Hall", "Wowpedia: Brill", "Wowpedia: Forsaken" },
	},
})

SubsOf("Swamp of Sorrows", {
	{
		name = "Stagalbog Cave", parent = "Swamp of Sorrows", faction = "Hostile",
		hook = "A large cave in the eastern bog, held by murlocs under a Swamp Talker.",
		lore = {
			"Stagalbog Cave sits in the Stagalbog in the east of the swamp, and the Marsh tribe murlocs have it, with their leader the Swamp Talker inside.",
			"Murlocs are easy to dismiss and consistently should not be. They have tribes, leaders, titles and ritual, and \"Swamp Talker\" is a role rather than a name.",
			"The Swamp of Sorrows was not always a swamp. This was fertile country before the Dark Portal opened in it and the land went wrong, and everything living here now arrived after that.",
		},
		readMore = { "Wowpedia: Stagalbog Cave", "Wowpedia: Murloc", "Wowpedia: Swamp of Sorrows" },
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
		hook = "The deserted camp of the man who led the Dark Riders, before the curse took him.",
		lore = {
			"Ariden set this camp up just north of the road through the pass, and it is empty now. What he was doing from it was selling forged Medivh artefacts.",
			"Then he was cursed, and he became the leader of the Dark Riders. They are the horsemen who ride out of Deadwind Pass, and it was their arrival in Duskwood, after the Scythe of Elune changed hands at Roland's Doom, that helped put that forest under permanent dark.",
			"So the camp is where a fraudster set up shop next to Karazhan and got exactly what selling Medivh's name in Medivh's shadow had always been going to get him.",
		},
		readMore = { "Wowpedia: Ariden's Camp", "Wowpedia: Dark Riders", "Wowpedia: Karazhan", "Wowpedia: Medivh" },
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
			"Corporal Keeshan is in that cave too, in a bad way, and needs getting back to Lakeshire. Redridge's problems all come down the pass from this direction.",
		},
		readMore = { "Wowpedia: Render's Rock", "Wowpedia: Rend Blackhand", "Wowpedia: Dark Horde" },
	},
	{
		name = "Galardell Valley", parent = "Redridge Mountains", faction = "Hostile",
		hook = "The valley with the Tower of Ilgalar in it, where Morganth lives.",
		lore = {
			"Galardell Valley is in Redridge's north-east, and the Tower of Ilgalar stands in it. Morganth is in the tower.",
			"He is the warlock who brought the Blackrock orcs into Redridge to take Stonewatch and then turned on them once the keep was his. A tower in a gnoll-infested valley is where that leaves him.",
			"The gnolls are a problem in their own right, and Lieutenant Fangore among them will call every one within earshot. Lakeshire is dealing with orcs on one side and this on the other.",
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
			"Rhapsody Shindigger keeps this small camp in the Hinterlands, and he is drunk. Gilveradin Sunchaser is there with him, and he is a high elf.",
			"The high elves are the quiet tragedy of the Alliance. When the blood elves took their new name and followed Kael'thas, a minority refused and kept the old one, and they have no kingdom, no city and very little standing anywhere.",
			"Quel'Danil Lodge is further into the zone and is theirs. A high elf camped out with a cheerful Wildhammer drunk is about as settled as their position gets.",
		},
		readMore = { "Wowpedia: Shindigger's Camp", "Wowpedia: High elf", "Wowpedia: Quel'Danil Lodge" },
	},
	{
		name = "Featherbeard's Hovel", parent = "The Hinterlands", faction = "Alliance",
		hook = "A house beside Aerie Peak that was somebody's and now is not.",
		lore = {
			"The hovel sits next to Aerie Peak and it was Featherbeard's home. That is the whole of the record.",
			"Wildhammer names run to this sort of thing, and the dwarves of Aerie Peak keep gryphons rather than rams and answer to themselves rather than Ironforge. A hovel on the slope below the keep is the ordinary housing of that arrangement.",
			"Whatever Featherbeard did, it is finished, and the place is just a house now. Not everything in these mountains has a war in it.",
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
			"Baradin Bay is the water off the western side of the central Eastern Kingdoms, reaching from Dun Morogh's north-west down the coast. Menethil Harbour is on it, and so are Stromgarde Keep and Southshore.",
			"The Kul Tiran armada patrolled this bay during the Second War and after it. Kul Tiras supplied the Alliance's entire navy in that war, under Daelin Proudmoore, and the bay was effectively theirs to keep.",
			"Their wrecks are still down there. The friendship did not survive Daelin's death at Theramore, and the Alliance has been short of hulls on this coast ever since.",
		},
		readMore = { "Wowpedia: Baradin Bay", "Wowpedia: Kul Tiras", "Wowpedia: Daelin Proudmoore" },
	},
})

SubsOf("Alterac Mountains", {
	{
		name = "The Headland", parent = "Alterac Mountains", faction = "Alliance",
		hook = "A Stormpike training camp on the third of Hillsbrad's four fingers.",
		lore = {
			"The Headland is one of the ridges running down out of the mountains above Hillsbrad, and the Stormpike dwarves have put a training camp on it: instructors, a drill sergeant, and recruits being taught their trade.",
			"The Alliance way into Alterac Valley is close by, and the camp is there because of it. The Stormpike Guard are digging in the valley north of here and the Frostwolf orcs want them out, and both sides have been feeding soldiers into it for years.",
			"Alterac Valley is not a war either faction declared. It is a mining dispute that has acquired generals.",
		},
		readMore = { "Wowpedia: Headland", "Wowpedia: Stormpike Guard", "Wowpedia: Alterac Valley" },
	},
	{
		name = "The Foothill Caverns", parent = "Alterac Mountains", faction = "Hostile",
		hook = "The cave where Helcular made himself a lich after a mob had killed him.",
		lore = {
			"The Foothill Caverns lie in Darrow Hill, and Helcular used them. He was working on turning himself into a lich, and he had a ritual site up in the hills until a human lynch mob found it and beat him to death.",
			"Dying did not stop the project. He finished it in this cave instead, which is the sort of outcome a lynch mob does not plan for.",
			"The Flame of Azel and the Flame of Veraz were kept down here too. Hillsbrad looks like farmland with a feud in it, and a good deal of what is actually going on is underground.",
		},
		readMore = { "Wowpedia: Foothill Caverns", "Wowpedia: Helcular", "Wowpedia: Lich" },
	},
})

SubsOf("Arathi Highlands", {
	{
		name = "The Drowned Reef", parent = "Arathi Highlands", faction = "Hostile",
		hook = "A reef off the southern shore with a sunken elven city under it.",
		lore = {
			"The Drowned Reef has taken a great many ships. The Maiden's Folly and the Spirit of Silverpine are both down there, and they are the ones anybody remembers the names of.",
			"Underneath the water there is a city. It is elven, it is ancient, and it is ruined, and the Daggerspine naga live in it now.",
			"Which puts the Arathi Highlands in the same story as half of Kalimdor. The Sundering drowned coastline everywhere, the naga are the Highborne who went down with it, and they are coming back up wherever there is a ruin to occupy.",
		},
		readMore = { "Wowpedia: Drowned Reef", "Wowpedia: Daggerspine", "Wowpedia: Naga" },
	},
})

SubsOf("Badlands", {
	{
		name = "Camp Wurg", parent = "Badlands", faction = "Hostile",
		hook = "One of four Dustbelcher ogre camps, with a boss who visited all of them.",
		lore = {
			"Camp Wurg is Dustbelcher ogre ground, one of four: Wurg, Cagg, Boff and Kosh, spread across the Badlands.",
			"Boss Tho'grun did not sit in any of them. He patrolled between the four, which is more organisation than ogres are usually credited with.",
			"Ogres in the Eastern Kingdoms are the Old Horde's leavings, brought through the Dark Portal by Gul'dan and abandoned when the Second War collapsed. Four camps and a circuit-riding chieftain is what they have made of that.",
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
			"It is the pass most travellers use, because it comes out nearest Thelsamar. The South Gate Outpost sits in it, keeping an eye on who goes through.",
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
			"Loch Modan is held by the Stonewrought Dam and by these passes. Both are dwarven engineering, and both were designed by Franclorn Forgewright, who was a Dark Iron.",
		},
		readMore = { "Wowpedia: South Gate Pass", "Wowpedia: Loch Modan", "Wowpedia: Franclorn Forgewright" },
	},
})

SubsOf("Elwynn Forest", {
	{
		name = "Northshire River", parent = "Elwynn Forest", faction = "Alliance",
		hook = "The river out of the mountains that becomes Crystal Lake.",
		lore = {
			"The Northshire River comes down out of the mountains east of Stormwind, runs through Northshire Valley past the Abbey, and empties into Crystal Lake.",
			"Every human the Alliance fields from this kingdom starts beside it. Northshire Abbey is where new recruits are taught, the valley is the first ground they walk, and the river is the thing running through all of it.",
			"The falls near the Abbey are the pleasant part of a zone that also contains the Defias, kobolds in the mines and Hogger. Elwynn is a working forest, not an idyll, but it does have this.",
		},
		readMore = { "Wowpedia: Northshire River", "Wowpedia: Northshire Abbey", "Wowpedia: Crystal Lake" },
	},
})

SubsOf("Stranglethorn Vale", {
	{
		name = "The Crystal Shore", parent = "Stranglethorn Vale", faction = "Contested",
		hook = "Sandy coast on the cape's south-east, cut off from inland by cliffs.",
		lore = {
			"The Crystal Shore follows the cape's south-eastern side, from the Wild Shore up to the cliffs where the cape meets northern Stranglethorn. The South Seas wash against it, and against the eastern beaches of Jaguero Isle across the strait.",
			"A steep rise separates most of it from the jungle behind, so the beach is its own place rather than an edge of the forest.",
			"That isolation is why the coast is worth anything to the people using it. Pirates, naga and goblins all want shoreline that the inland cannot easily reach.",
		},
		readMore = { "Wowpedia: Crystal Shore", "Wowpedia: Jaguero Isle", "Wowpedia: Stranglethorn Vale" },
	},
})

SubsOf("Swamp of Sorrows", {
	{
		name = "Misty Reed Strand", parent = "Swamp of Sorrows", faction = "Contested",
		hook = "The swamp's coastline, and there is almost nothing on it.",
		lore = {
			"The Misty Reed Strand is the beach along the Swamp of Sorrows: a long stretch of very little, with driftwood, debris, crocolisks, crabs and murlocs.",
			"The gloom is the swamp's own. This was good country before the Dark Portal opened inland and the land turned, and the coast went with the rest of it.",
			"Stonard keeps a picket out towards the southern end at the Misty Reed Post, hoping for a tower. Nothing else is competing for the shoreline.",
		},
		readMore = { "Wowpedia: Misty Reed Strand", "Wowpedia: Swamp of Sorrows", "Wowpedia: Stonard" },
	},
})
