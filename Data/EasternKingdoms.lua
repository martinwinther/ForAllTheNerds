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
		didYouKnow = "Thermaplugg had run the numbers and expected to lose about three gnomes in ten, after which he would be the obvious candidate for High Tinker. He lost closer to eight. In Tinker Town it is still spoken of as a rumour. The gnomes would much rather it stayed one.",
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
	didYouKnow = "The Defias grievance is entirely legitimate. The masons did the work, Stormwind did not pay, and the noble who argued hardest against paying was Lady Katrana Prestor, who has the young king's regent's ear and is not what she appears to be.",
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
		hook = "Duskwood's largest graveyard, and the reason the Night Watch exists.",
		lore = {
			"Generations of the county's dead are buried here, and in Duskwood that is a liability rather than a memorial. The necromancer Morbent Fel took an interest in the place and the consequences are still walking.",
			"Among them is Mor'Ladim, who was a father looking for his daughter before he died and has not entirely stopped. The Watch considers him the zone's most dangerous single resident.",
		},
		didYouKnow = "Mor'Ladim's daughter is buried in this cemetery. He is still looking for her, and he kills anyone he meets while doing it.",
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
			"The Scarlet Crusade's leadership here is not what it claims to be. The crusaders dying in the streets have not been told.",
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
