# Changelog

## 1.2.21

This addon had been keeping lists of its own in your saved variables, and they are
gone. It also finishes the vanilla-era sweep: the last fifteen entry records are
reviewed, every one of them needed correcting, and all 907 vanilla entries have now
been checked.

**Removed**

- Three commands and the recording behind them. `/ftn gaps` noted the names of
  places with no entry written for them. `/ftn npcs` noted the name, zone and
  creature id of anything you targeted or hovered over. `/ftn areas` asked the
  client for every place name it knows. Two of those recorders were on by
  default. They were my own tooling for deciding what to write up next, nothing was
  ever sent anywhere, and players were never recorded, only NPCs. None of that makes
  them something to keep running in your game. They have done their job: the
  worklists they built are finished with, and the write-ups they fed are written.
- The two settings that switched the recording on and off, since there is no longer
  anything to switch.
- Whatever those lists had already collected. Your settings file is read once on
  login and the old entries are deleted from it, so after one login nothing is left.
  Discoveries, statistics and every setting you have chosen are untouched.

**Fixed**

- Zuuldaia Ruins in Stranglethorn Vale was described as sitting on the southern
  coast a short walk from Booty Bay. It is at the far opposite end of the zone, up
  the western coast, and the Bloodscalp hold it in strength.
- Whispering Gardens in Tirisfal Glades was not a Lordaeron graveyard watched over
  by the Forsaken. It is the rise on the south side of the Scarlet Monastery's
  entrance, the Scarlet Crusade holds it, and there is not a single grave on it.
- Witch Hill in Dustwallow Marsh has no undead on it. It is north-west of Theramore
  up the eastern side of the marsh, Swamplight Manor stands near the middle of it,
  and Mirefin murlocs camp along the shore above.
- At the Westfall Lighthouse, Captain Grayson is a ghost. He drowned on those rocks
  himself, the lighthouse keeper's family was killed in front of him by Old
  Murk-Eye's murlocs, and he keeps the flame lit because nobody living is left to.
- Windshear Mine in the Stonetalon Mountains is not a Horde mine the goblins walked
  away from. The Venture Company is still at the mouth of it with wagons of
  explosives, and the Windshear kobolds in the shafts have geomancers and an
  overlord of their own.
- Woodpaw Den in Feralas lost an explanation of why the gnolls moved there. It came
  from a novel published long after this period. What is going on there now is
  Camp Mojache planning to kill five of the clan's alphas at once.
- The Wildmane Water Well is north of Thunder Bluff, not out in the western plains,
  and it is the last of Mulgore's three wells to be cleansed. Venture Company
  workers are standing in it, and they are what fouled it.
- Windfury Ridge holds the harpy clan's sorceresses and matriarchs rather than a
  general harpy population, and tauren and harpies have a great deal of history:
  young tauren are sent after the Windfury as a test of strength.
- Wildwind Lake is in eastern Feralas below Camp Mojache, and the camp's tauren
  answer to Thrall. The Grimtotem are in their own compound further west.
- Ziata'jai Ruins has nothing living in it. What the Skullsplitter keep out there is
  a pile of trophy skulls, and the ruin's age was being worked out from a date that
  nothing supports.
- Wildhammer Keep in Aerie Peak had the Wildhammer dwarves coming straight north
  out of the War of the Three Hammers. They founded their kingdom inside Grim Batol
  first, and lost it when Modgud died in its halls and left the mountain unlivable.
  That is why they live on a slope instead of under one.
- Xavian in Ashenvale gains what is actually happening in it, including who the
  satyrs' leaders there are and what they did with a shipment of Warsong oil.
- The Wild Shore gains the Bloodsail fleet in detail and Jaguero Isle off its
  eastern end, and loses Gorlash, who stands on a different stretch of coast.
- Zalashji's Den holds one naga rather than a colony. The Steamwheedle Cartel's
  arrangement with the Southsea pirates is protection money. The cartel pays it and
  the pirates have lately been ignoring what it buys.
- The Western Strand is worked by Torn Fin murlocs, and Southshore's own lieutenant
  would rather somebody else dealt with them. The Eastern Strand's entry had said
  the western one has naga; it does not.
- Swamplight Manor no longer says something haunts Witch Hill, which nothing in
  this period supports. "Swamp Eye" Jarl's third errand is a sword, and he will not
  say what he means to cut with it.

**Changed**

- The settings page is shorter by two checkboxes, and `/ftn` lists three fewer
  commands. Typing one of the retired commands now looks for a place of that name
  instead, the same as any other unrecognised word.

## 1.2.20

Two more rounds of the vanilla-era sweep: 50 entry records reviewed and 49 of them
corrected. The sweep now covers 892 of the 907 vanilla entries, with fifteen left.
This batch turned up a kind of mistake the earlier rounds had not: places whose
entry had invented an owner out of the place name itself.

**Fixed**

- Twilight Vale in Darkshore has nothing to do with the Twilight's Hammer. It is the
  name of the zone's southern forests, after the half-light the coast sits in, and
  what is in the woods is Blackwood furbolgs, moonstalkers and sick deer.
- There is no Vul'Gol tribe. The ogres at the Vul'Gol Ogre Mound are Splinter Fist,
  led by Zzarc' Vul, who the mound is named after, and no worgen are pressing in on
  them. Humans farmed the basin once and the ruined farmhouses are still there.
- Eleven more places had the wrong occupants or the wrong owner. The Uplands are the
  Syndicate's strongest ground, not Crushridge ogre country. The Undercroft is
  Zaeldarr the Outcast's hideout, and his undead trolls are the ones stealing bodies
  out of Light's Hope Chapel's grave pit rather than necromancers working a
  graveyard. At the back of Kurzen's Compound, the Stockpile is where his special forces are
  kept, not a smugglers' cache with changing owners. The Dust
  Plains are Westfall's southernmost ground, with Riverpaw gnoll camps and Mortwake's
  Tower on the eastern edge. Stonemaul ogres built the Den of Flame as their
  mound, and the black dragons burned them out of it. The Shining Strand still has the
  Vile Fin murlocs along its whole length. Silt that travels as though alive is what the
  Shifting Mire is named for, and nobody keeps its routes marked. Thelgen Rock is a
  spider cave with volatile ore in the walls, not a flooded mine. Thorn Hill has the
  Crossroads' own stolen supply crates stacked up on it. The Dragonmurk has Onyxia's
  brood scattered across it, while her lair is in the Wyrmbog. The Ruins of Stardust
  are a holy place on a lake island, gone yellow with Felwood's rot.
- Seven places moved to where they actually are: the Tidus Stair is stone terraces
  above the Merchant Coast rather than a formation below the surface, Valorwind Lake
  is a small lake north-east of Shadra'Alor rather than the Hinterlands' main lake,
  the Verdantis River is in central Feralas south-east of Dire Maul, Thunder Falls is
  a ravine in north-western Elwynn, the Ruined Reaches are Azshara's southern coast
  near Durotar, the Rolling Plains cover southern Mulgore from Bloodhoof Village to
  the Barrens border, and Thistlefur Village is east of the Zoram Strand.
- The Valley of Kings faces south. Its two statues are Madoran Bronzebeard and
  Khardros Wildhammer, raised by their sons over the pass into the southlands as a
  warning and a reminder of what the Dark Irons paid, and Mountaineer Pebblebitty
  keeps the gate to the Searing Gorge locked.
- Stonewatch Tower is still standing and is being used against the keep beside it. A
  mage in Elwynn has a glyph hidden at the top of it, in a forgotten liquor jar.
- The Tranquil Gardens are not guarded. The dead are up and walking in the cemetery,
  and the Insane Ghoul in it has Blind Mary's looking glass.

**Removed**

- Advice meant for players rather than lore, and claims the period does not make.
  Thoras Trollbane did not withdraw Stromgarde from the Alliance because Lordaeron
  "would not act on the internment camps": he wanted every orc in them executed and
  withdrew when Terenas refused. Thrall was not born in an internment camp.
  Staghelm Point is named for one of the two Staghelms and nobody knows which.
- The Scarab Wall no longer carries its own name or a two-part construction. Both
  come from a book published long after this period, and a 1.12 player could not have
  heard either. What the entry keeps is that the night elves and the bronze
  dragonflight raised the wall together at the end of the War of the Shifting Sands.
- Invented history and motives are gone from the Vice, the Sludge Fen, the Tradesmen's
  Terrace, Westbrook Garrison, the Crystal Vale, the Darkened Bank, Terror Run,
  Tkashi Ruins and the Savage Coast. Among them: ogres indifferent to history, a
  goblin cartel with no central authority to pressure, night elves with no money
  economy, a garrison holding the border against its own citizens, and the Cenarion
  Circle watching a valley it has no presence in.

**Changed**

- The three Twilight's Hammer camps in Silithus were all repeating the same paragraph
  about the Old Gods. What tells them apart is the wind stones standing in each: a
  cultist communes through them to reach the Abyssal Council, and only the top of the
  Twilight's Council may use a greater stone to speak to its lords. Twilight Outpost
  is pitched against the Scarab Wall itself.
- Many entries gained what the game actually gives them. Valgan's Field is the wheat
  farm where Arugal stayed before the war, with his spellbooks still in it and Dalar
  Dawnweaver wanting the Remedy of Arugal out of them. The Zoram Strand has Talen,
  who lost an ancient statuette to the naga and needs the Ring of Zoram to open it.
  Thelsamar has the blood sausage recipe it is famous for. The Venture Co. Mine was
  refused mining rights and dug anyway. The Stonefield Farm has Gramma Stonefield's
  scheme, Bernice's necklace and the prize sow eating Ma Stonefield's vegetables.
  Thorium Point has Overseer Oilfist, who put the order out on the man running the
  Cauldron. The Writhing Deep has the two-front war the Woodpaw battle plans revealed.
  A great tree on an island in Jademir Lake is what the Dream Bough is. The
  Slithering Scar is the Gorishi's. Terror Run has the expedition that was nearly eaten setting up camp.
- Southridge Beach is marked hostile rather than contested, which is what naga ground
  means in practice.

## 1.2.19

Two more rounds of the vanilla-era sweep: 50 entry records reviewed and 46 of them
corrected. The sweep now covers 842 of the 907 vanilla entries. Three more entries
turned out to be duplicates of entries the addon already had, including two Elwynn
farms that had each been written up twice.

**Fixed**

- Nine places had the wrong occupants. The Silver Stream Mine ran dry long ago and
  was turned into a Miners' League store; the kobolds in it are on the dwarves'
  tools, and there were never any troggs. The Cleft is a Gnarlpine den under Ursal
  the Mauler with captured druids held in it, not a split in Teldrassil's bark.
  Stonewatch Falls has a small murloc camp at the bottom of the pool; the Blackrock
  orcs and Shadowhide gnolls are up the hill at the keep. Slaughter Hollow is an
  ogre mound with a caged gnome selling engineering supplies inside it. The Shrine
  of the Deceiver holds Jaedenar's cultists, adepts and guardians, while the Shadow
  Council's warlocks are up in Shadow Hold. The Thalassian Base Camp is a blood elf
  dig, not a high elf camp. Southridge Beach is naga ground. Splinterspear Junction
  is patrolled by Stonard's scouts rather than held by nobody. The Dead Acre was
  burned by the Defias, and harvest reapers and the Foe Reaper 4000 work its fields.
- The Pools of Vision are the Forsaken's own corner of Thunder Bluff, with the Royal
  Apothecary Society, a mage trainer, priest trainers and a Defilers emissary in
  them. Spirit Rise above is still where the tauren teach shamanism.
- The Terrace of Repose is the Scarlet Crusade's ground at the Scarlet Monastery
  gate, one of the few places in northern Lordaeron the plague never reached, with
  hedges growing and a fountain running clean. It is not a burial terrace.
- Steelgrill's Depot is a siege engine shop and a haunt for veteran tank pilots.
  Beldin Steelgrill breaks more arclight spanners than anyone can supply him with.
- Six places moved to where they actually are: Sar'theris Strand is the whole of
  Desolace's coast rather than one northern beach, Stonebull Lake wraps around
  Bloodhoof Village in central Mulgore, Sundown Marsh is the deepest part of the
  Wetlands in the north-west, the Shrine of Remulos is in north-western Moonglade a
  short walk from Nighthaven, Shimmer Ridge is north of Kharanos, and Shadowthread
  Cave is in the corner of Shadowglen rather than down in Teldrassil's roots.
- Stonewatch Tower is still standing and is being used against the keep beside it.
  A mage in Elwynn has a glyph hidden at the top of it, in a forgotten liquor jar,
  to find out why Morganth is in conflict with the orcs inside.
- Shadowglen is centred on Aldrassil, with Tenaron Stormgrip at the top of the tree
  and a moonwell in the clearing. Its grells are tainted by fel moss, which is also
  what became of the furbolgs who used to live in those hills.
- Shadowprey Village is a fishing village before it is anything else, and the
  Darkened Bank's notable residents are two refugees with a campfire.

**Removed**

- Advice meant for players rather than lore. The Shrine of the Dormant Flame no
  longer tells you the view is the best in Durotar and that jumping off is unwise,
  and the Stoutlager Inn is no longer the most popular room in Loch Modan.
- The Stonewrought Dam and the South Gate passes were not designed by Franclorn
  Forgewright. He invented the stonewrought method of architecture, and that is as
  far as this period takes it.
- Troll witch doctors no longer deal in the loa. What Witch Doctor Unbagwa does is
  summon Mokk, the white gorilla whose heart is the only known cure for Stranglethorn
  fever, and the other gorillas come to the spirit-talking.
- Invented history and motives are gone from the Canals, the Crystal Vale, Terror
  Run, the Darkened Bank, Silverwing Grove, the Kodo Graveyard and Tethris Aran.
  Among them: a statue along Stormwind's canals that is actually in the Valley of
  Heroes, the Cenarion Circle watching the Crystal Vale, Marshal's Refuge issuing
  standing orders, smugglers using river crossings nobody patrols, and the Ashenvale
  war being the oldest fight on the continent.
- Thrall was not born in an internment camp, and Theramore is not described as the
  only human settlement on Kalimdor that chose to live beside the Horde.

**Changed**

- Three entries were duplicates and each has been merged into the one the game's own
  name matches. The Thalassian Vanguard Camp is folded into the Thalassian Base
  Camp, and the two Elwynn farms written up twice over are folded into The Stonefield
  Farm and The Maclure Vineyards. All three old names are kept as aliases, so `/ftn`
  still answers to them.
- Southridge Beach is marked hostile rather than contested, which is what naga
  ground means in practice.
- Many entries gained what the game actually gives them. The Shady Rest Inn has
  James Hyal, the blackened shield nailed to its chimney, the hoofprints and the
  badge in the rubble, and two investigations running separately out of Theramore
  and Brackenwall. Silverwing Grove is where the Alliance enters Warsong Gulch.
  Scrabblescrew's Camp has the kodo kombobulator, the Gizelton Caravan that belongs
  to somebody else, and a rival goblin collecting bones. Shindigger's Camp has the
  gryphon rider who found the sunken temple by falling into it drunk. The Cauldron
  has the Slag Pit, and slaves who have been driven far enough to attack anyone who
  comes for them, rescuers included. The Crimson Veil is the Bloodsail flagship and
  does the fleet's recruiting. Terror Run has the expedition that was nearly eaten
  setting up camp, and the only red power crystals in the world. The Den has Gornek,
  a trainer for every class and no trade trainers at all. The Commons has the
  battleground emissaries. Spirit Rock has the sapta, drunk in a holy place and
  nowhere else. Satyrnaar has the Bleakheart and a soulgem of the Cult of the Dark
  Strand. Sentry Point is the first tower outside Theramore and where the search for
  a missing soldier begins.

## 1.2.18

Four more rounds of the vanilla-era sweep: 100 entry records reviewed and 93 of
them corrected. The sweep now covers 795 of the 910 vanilla entries. This batch
turned up something new, three entries that were duplicates of entries the addon
already had, and two places that exist only in Forever and had been written up as
though they were vanilla.

**Fixed**

- Seventeen places had the wrong occupants. The Frayfeather are hippogryphs, not
  harpies. Fallow Sanctuary is the Lost Ones' village. Eastmoon Ruins are
  troll-built with a wandering Dunemaul party in them. Demont's Place is a
  Riverpaw gnoll camp, and the Defias camp the entry described belongs to the
  Dagger Hills. The Ironstone Plateau holds fledgling pterrordax and all four
  power crystals, not elementals. Lake Nazferiti has the Venture Company's base
  camp on it. The Jagged Reef is Azshara's northern coast itself, with Storm Bay
  naga coming up onto the beach. Nethander Stead is abandoned and held by Mudsnout
  gnolls, with mushrooms growing in its fields. The Mizjah Ruins are held by
  Mosh'Ogg ogres ambushing Grom'gol's caravans to Stonard. Mystral Lake is full of
  befouled water elementals, not furbolgs. Mirror Lake has Defias in the trees,
  not kobolds. Mazra'Alor is the ziggurat at the heart of Zul'Mashar, held by
  Mossflayer trolls. Saltspray Glen is a raptor nesting ground. The Ruins of
  Isildien are held by the Gordunni in clan strength. Rocktusk Farm is the Horde's
  pig farm west of Orgrimmar, and the Razormane are a zone away. Rethban Caverns
  have Redridge gnolls in them. The Ruins of Solarsal stand on Sardor Isle with
  Hatecrest naga on them.
- Heroes' Vigil is the monument on the island in Stone Cairn Lake, held by Defias
  rogue wizards, rather than a hilltop raised for the soldiers of the Alliance
  Expedition.
- The Oracle Glade's oracle is a tree. The Oracle Tree reports by shedding its
  bark for somebody to carry to Darnassus, the first and most powerful of
  Teldrassil's moonwells is under its boughs, and the harpies nesting round the
  glade killed a runner carrying one of those reports.
- Eleven places moved to where they actually are: Dustbelch Grotto to the
  south-western Badlands, Dustwind Gulch to the east by Lethlor Ravine, Frostsaber
  Rock and Dun Mandarr to northern and southern Winterspring, Fungal Rock to the
  crater's north-eastern wall, Golakka Hot Springs to the west, the Ice Thistle
  Hills to south-east of Everlook, Grizzlepaw Ridge to the hills above Thelsamar,
  Jasperlode Mine to the foothills north of the Tower of Azora, the Lower Wilds to
  the eastern end of Feralas, and Nightsong Woods to the eastern half of Ashenvale.
- The Eastern Strand looks at Daggerspine naga, not at Purgation Isle, which is at
  the far other end of the Hillsbrad coast. Lake Mereldar is south of Corin's
  Crossing with the Scarlet Crusade on its shore, not beside Light's Hope Chapel.
  North Gate Pass connects Loch Modan with Dun Morogh, which is what our own North
  Gate Outpost entry had been saying all along.
- Dreadmist Den is a cave on Dreadmist Peak rather than under it, and the Dunemaul
  Compound's leader is Gor'marok the Ravager.
- Ironforge's Military Ward trains warriors and hunters in the Hall of Arms.
  Paladins are taught in the Mystic Ward and the gryphons come from the
  Wildhammers.

**Removed**

- Fallen Sky Lake is no longer an impact crater with the Legion raining infernals
  across Ashenvale. The name has a better reason: night elves gathered moonstones
  here until the shadethicket came, and the treants' oracle has the fallen stones
  on the island.
- Foothold Citadel no longer has the room where Jaina's father died. That account
  comes from a novel published in 2011. What the keep does have is Captain Garran
  Vimes, the guard rolls and the deserters still loyal to the admiral.
- Iceflow Lake's shipwreck under the ice is gone, and so are Jasperlode Mine's
  exhausted gemstone seams and unfinished survey, Fargodeep's abandoned richer
  seams, the tower on Dreadmist Peak, and Lake Elune'ara's wards.
- The Gates of Ironforge are no longer the only way into the city. The Deeprun
  Tram has run under the mountains from Stormwind since launch.
- The Gurubashi Arena is not run by goblins. Short John Mithril runs the event,
  and the game calls him the pirate who runs it.
- Invented history, motives and institutions are gone from the Jadefire Glen, the
  Lion's Pride Inn, Maclure Vineyards, Longshore, Nightsong Woods, Red Rocks,
  Plaguemist Ravine, Ridgepoint Tower and Razorwind Canyon. Among them: the lion
  on the inn's sign standing for Anduin Lothar, a feud nobody can explain,
  Wildhammers watching a ravine that nothing lives in, and harpies descended from
  Aviana's servants.

**Changed**

- Three entries were duplicates of entries that already existed, and each has been
  merged into the one the game's own name matches. Legashi Encampment is folded
  into Legash Encampment, the Ruins of Darrowshire into Darrowshire, and the Old
  Dalaran Ruins into Dalaran Crater. All three old names are kept as aliases, so
  `/ftn` still answers to them.
- Galak Camp and Legashi Stronghold are Forever's own places rather than vanilla
  ones, and are now marked as Forever content, which means they are hidden by
  default with the rest of it.
- O'Breen's Encampment is renamed O'Breen's Camp, which is what the game calls it,
  and is now the stranded treasure expedition's camp at Faldir's Cove rather than
  a Syndicate camp.
- Several entries gained what the game actually gives them. The Gates of Uldum have
  the pedestal, the Stone Watcher that refuses entry and the missing Plates of
  Uldum. The Hall of Explorers has its library, Prospector Stormpike and the Discs
  of Norgannon brought back from Uldaman. Ironband's Compound has the umbral ore
  and what happened to Sturgy Ironband's students. Ortell's Hideout has a
  Twilight's Hammer deserter decoding his old sect's post. The Rise of the Defiler
  has Razelikh's triad, the amulet that keeps all three of them alive and the
  eighteen stones that hold men bound to them. Zul'Kunda and Zul'Mamwe have the two
  halves of the Bloodscalp and Skullsplitter feud.
- Entries that contradicted each other or repeated each other have been reconciled:
  Camp Kosh counts four Badlands ogre camps rather than three, Dustwallow Bay no
  longer repeats Tidefury Cove's paragraph, the Western Pylon drops the clause the
  Eastern one had already lost, Grosh'gok Compound stops restating Deadwind Pass,
  and Rage Scar Hold stops restating the Lower Wilds.

## 1.2.17

Five more rounds of the vanilla-era sweep: 126 entry records reviewed and
123 of them corrected, with nothing removed. The sweep now covers 700 of the 915 vanilla
entries. This batch turned up an unusual number of places whose entry named the
wrong occupants entirely, and a run of entries that quietly disagreed with each
other.

**Fixed**

- The Slag Pit is the slave-worked Dark Iron mine inside the Cauldron, with
  Overseer Maltorius over the crew, rather than a waste pit of molten slag.
- The Grizzled Den is a wendigo cave south-west of Kharanos, not a bear cave
  east of it, and the invented Ironforge hunter tradition is gone.
- Six places had the wrong tenants: Kal'ai Ruins hold Murkgill murlocs, not
  Bloodscalp trolls; the Nek'mani Wellspring is guarded by naga; the Ravaged
  Caravan is the Venture Company's own wreck; Southmoon Ruins are held by
  Dunemaul ogres; Stone Cairn Lake has Defias rogue wizards on its island; and
  Timbermaw Post is in the hands of the corrupted Winterfall, which is the
  point of the place.
- Skulk Rock is an ooze-ridden forest troll ruin with an abandoned Second War
  Horde base in it, not a cave of spiders.
- Crystalvein Mine is held by basilisks behind a sign telling people to keep
  out, not by Colonel Kurzen's forces. Kurzen's Compound now says plainly that
  he lost his mind and half his force deserted over it.
- Several places moved to where they actually are: the Noxious Lair to
  south-western Tanaris, the Marshlands to the crater's south-east, the High
  Wilderness to a forest in western Feralas held by Gordunni ogres, Venomweb
  Vale to eastern Tirisfal below the Scarlet Monastery, the Skittering Dark to
  a mine in northern Silverpine, the Rotting Orchard to southern Duskwood, the
  Dawning Wood Catacombs to beneath Raven Hill Cemetery, Darkmist Cavern to a
  mine in the north-west of Dustwallow, Cragpool Lake to Windshear Crag, Bear's
  Head to Azshara's south-eastern mountains, Blackwood Lake to the Eastern
  Plaguelands, and Darrow Hill to the south-west of Tarren Mill.
- Chillwind Point is a small rise with an ancient troll ruin and Bath'rah the
  Windwatcher on it. The job it used to be given belongs to Chillwind Camp.
- The Foothill Caverns no longer have Helcular finishing his transformation
  into a lich. The lynch mob killed him before he could.
- The Lost Fleet is named: the Third Fleet of Kul Tiras, burned and sunk by red
  dragons under orcish control, with First Mate Fitzsimmons the only survivor
  and Captain Halyndor still walking the Intrepid.
- Lost Rigger Cove has the arrangement the right way round. The Steamwheedle
  cartel pays the pirates protection money, and the pirates have stopped
  honouring what it bought.
- The Tower of Ilgalar is in the eastern foothills of Redridge, and Morganth
  commands the Shadowhide gnolls outright rather than being suspected of it.
- Cold Hearth Manor is a central Tirisfal farmstead whose people all died of
  the plague, with two Forsaken tailors now trading out of the farmhouse.
- Lake Kel'Theril, Valor's Rest, the Ravencrest Monument, Lariss Pavilion, the
  Broken Pillar, Bael'dun Keep, Camp Narache, Corin's Crossing, Darrowmere Lake,
  the Golden Plains, the Hidden Grove, the Ivar Patch, the Weeping Cave, the
  Abyssal Sands, Black Channel Marsh, the Agamand Family Crypt, Boulder'gor,
  Brightwater Lake, Brightwood Grove, Bluefen, Crushridge Hold, the Battle Ring,
  the Bloodsail Compound, the Sea of Cinders, Shaol'watha, Agol'watha,
  Boulderslide Ravine, the Thunderbrew Distillery, Wyrmbog and others replace
  invented history, motives and superlatives with what the places hold.

**Removed**

- The Oracle Glade no longer has Malfurion Stormrage meditating in it. That
  comes from a novel published years after this period.
- The Battle Ring's once-a-generation troll rite and its blood-red amulet
  legend are gone. Both come from a book published in 2020. What replaced them
  is the arena as it works here: the fighting is confined to the floor, and a
  chest is fought over every three hours.
- Ariden's Camp no longer carries a biography of Ariden. He is named nowhere in
  this period, and what the camp has instead is the Dark Riders as Duskwood
  actually knows them.
- The Maker's Terrace no longer gives away what the Explorers' League found
  inside Uldaman, which is a questline's ending.
- Invented practices and institutions that no source supports are gone from the
  Fungal Vale, the Weeping Cave, the Marshlands, the Pools of Vision, the
  Rogues' Quarter, the Quagmire, Bluefen, Bal'lal Ruins and Stone Cairn Lake.

**Changed**

- Nine pairs of entries that contradicted each other have been reconciled.
  Wellspring Lake and Wellspring River had the water running opposite ways, and
  the river runs out of the lake. Lake Kel'Theril disagreed with the Ruins of
  Kel'Theril about why the Highborne are cursed there. Stone Cairn Lake invented
  mysterious cairns when the lake is named for Heroes' Vigil, which has its own
  entry. Aldrassil disagreed with Darnassus and Teldrassil about which Aspects
  refused to bless the tree. Darrowmere Lake had the Barov estate changing hands
  the wrong way round. Chillwind Point had Chillwind Camp's job. Cliffspring
  Falls and Cliffspring River now agree about which feeds which, Boulderslide
  Ravine points at the cavern at its end instead of repeating it, and Timbermaw
  Hold and Timbermaw Post no longer say the same two sentences.
- Where one invention had been copied into a second entry, both are now gone:
  the Argent Dawn blight-mapping practice, Stranglethorn's claim that nothing
  has been built there since the Gurubashi, and Dustwallow's wildlife as the
  reason the zone stayed thinly settled.

## 1.2.16

Another 25 vanilla entries reviewed and corrected, bringing the sweep to
574 of 915 entries. No entries were removed.

**Fixed**

- Serpent's Coil describes caves occupied by Allistarj and the Shadowsworn,
  replacing the incorrect basilisk rock formation.
- The Ruins of Thaurissan distinguish the sorcerer-thane who summoned Ragnaros
  from Emperor Dagran. The claim that the city sank into Blackrock Depths is gone.
- Dor'Danil describes Forsaken poisoning and the druids' severed spirits.
  Stormrage Barrow Dens uses the Third War account of Malfurion's awakening.
- Raynewood Retreat describes its great tree and original guardians. Ravenwind
  is correctly placed in northern Feralas, and Jubuwal beside the inland road.
- Revantusk Village describes its alliance with the Horde. The Crossroads no
  longer includes the later Northwatch attack, and the Dawning Isles retain
  their original bog beasts alongside the murlocs.
- Staghelm Point describes its original watcher and bronze drake. Stendel's
  Pond no longer presents speculation about poisoned water as fact.
- Other entries replace unsupported history, motives and superlatives with
  details from original quests, including Eldarath, Ordil'Aran, Saldean's Farm,
  Sargeron, Shadow Hold, Southwind Village and the Drowned Reef.

## 1.2.15

Two more rounds of the vanilla-era sweep: 50 entries reviewed and corrected,
with nothing removed. The sweep now covers 549 of the 915 vanilla entries.

**Fixed**

- Go'Shek Farm correctly describes its Horde occupants and is marked Horde.
  Dabyrie's Farmstead describes its militia and is marked Alliance.
- Deep Elem Mine houses worgen under Grimson the Pale. Fenris Isle is held by
  Rot Hide gnolls, and Fire Scar Shrine describes its demons and orc warlock.
- Growless Cave houses yeti. Lost Point describes Theramore deserters, and
  Manor Mistmantle describes Stalvan and the undead on his property.
- Hive'Zora is in western Silithus; its invented tunnel connection to Un'Goro
  is gone. Mazthoril, Mist's Edge and Owl Wing Thicket have corrected geography.
- Felstone Field and Gahrron's Withering describe poison sampling and
  counteragent research instead of simply destroying their plague cauldrons.
- The Pools of Vision entry now agrees with Thunder Bluff's account of its
  Forsaken trainers and apothecary. Moonglade welcomes both druid races without
  claiming that fighting or internal disagreements never occur there.
- Demon Fall Canyon correctly describes Grom's monument. Karazhan,
  Northshire Abbey and Nethergarde Keep no longer include unsupported history
  or details drawn from later sources.
- Other entries replace invented motives, superlatives and creature behaviour
  with details from vanilla quests and locations, including the silithid hives,
  Ironband's excavation, Jaedenar, Plaguewood and Raptor Ridge.

## 1.2.14

Two more rounds of the vanilla-era sweep: 50 entries reviewed, 47 corrected
and two removed. After accounting for duplicate entries, the sweep covers
499 of the 915 remaining vanilla entries.

**Fixed**

- Thunder Bluff correctly places Forsaken trainers in the Pools of Vision.
  Its two entries now agree on the city's founding and inhabitants.
- The Tower of Arathor describes its ogre occupation and is marked hostile.
  Bronzebeard Encampment describes its silithid research and is marked neutral.
- Balia'mah Ruins belongs to the Skullsplitter trolls. Zun'watha is inhabited
  by Witherbark trolls, and Zul'Mashar still has living Mossflayer inhabitants
  threatened by the plague.
- The eastern, inner and outer binding circles describe their water, earth
  and air elemental guardians. Browman Mill is a lumber mill.
- Thunderhorn and Winterhoof Water Wells describe their poisoned water and
  cleansing preparations. Tor'kren Farm describes Misha's search for her son.
- Bladefist Bay no longer claims a later harbour. Bitter Reaches describes
  wildlife and mountain giants, and the Shrine of Aessina is correctly placed
  west of Astranaar.
- Wailing Caverns takes its name from steam fissures, and its account includes
  the disciples trying to wake Naralex. The Maul no longer invents a connection
  between arena ownership and ogre kingship.
- Other entries replace unsupported motives, historical claims and superlatives
  with details from vanilla sources, including Astranaar, Bael Modan, Cenarion
  Hold, Champions' Hall and the Undercity quarters.

**Removed**

- Thieves Camp and Witherbark Caverns were planned beta locations. Their
  unsupported entries have been removed; Witherbark Village still describes
  its actual cave.

## 1.2.13

Two more rounds of the vanilla-era sweep: 50 entries reviewed and 47 corrected,
with nothing removed. The sweep now covers 450 of the 917 vanilla entries.

**Fixed**

- Oneiros no longer borrows Dreamer's Rest from Cataclysm. The Ruins of Alterac
  belong to Mug'thol and the Crushridge ogres, and Noonshade Ruins to the
  Wastewander bandits.
- Stonemaul Ruins describes the Firemane dragonkin who drove the ogres out.
  Stagalbog's caves house murlocs. The Altar of Zul is a separate Vilebranch
  site, not the summit of Jintha'Alor.
- Mirror Lake Orchard acknowledges its Defias occupants and is marked hostile.
  Southpoint Tower describes the Horde reconnaissance post and Deathstalker
  Lesh, with its faction corrected to Horde.
- Stromgarde's account includes the supplies sent from Southshore. The
  Apothecarium's plague research names both its human and Scourge targets.
- Lakeridge Highway, Starfall Village and Steamwheedle Port have corrected
  geography. The Green Belt describes the Wetlands marsh and the Greenwarden,
  rather than borrowing the nearby excavation's story.
- Sen'jin Village's history distinguishes the trolls' original island home from
  the Echo Isles. Terrordale includes Augustus, Egan and the spirits there.
- Other entries replace unsupported motives, sweeping claims and invented
  history with details from vanilla quests, creatures and locations, including
  the Headland, the Dark Portal, the Great Lift and the Great Forge.

## 1.2.12

Two more rounds of the vanilla-era sweep: 50 entries reviewed and 29 corrected,
with nothing removed this time. These were the smaller places, the farms and
lakes and single huts, and the errors in them were mostly invented colour rather
than the wrong expansion. Several of the fixes turned two entries into one story.

**Fixed**

- The Balnir Farmstead in Tirisfal was being worked, after a fashion, by the dead
  family that owned it, with the horses still bred. It is a Scourge haven, which
  is what the Forsaken call it themselves, and they send patrols east from the
  Bulwark against the bleeding horrors and wandering spirits in it. The Scarlet
  Crusade raids from the ruined tower alongside. The snapdragons in the beds are
  the only thing on the farm carrying on as before.
- Bathran's Haunt in Ashenvale was satyr ground, with two paragraphs on where
  satyrs come from. The Forsaken are there: an apothecary with herbalists, seekers
  and a few thugs, and the night elf who hears about it calls that very troubling
  indeed. The ruins are named for a plant that grew in them and cured ailments of
  the spirit, which is a reasonable thing for an apothecary to want.
- Bloodhoof Village was Cairne's. Cairne rules from Thunder Bluff; the one in the
  village is his son Baine, and what is on his desk is the Palemane gnolls south
  and west of it and the dwarven quarry to the north-west, not the Venture Company.
- Camp Aparaje was a tauren camp putting its effort into harpies. It is three
  people with a campfire and a rack of smoked meat, a troll butcher among them,
  ringed by Grimtotem, and a rescued tauren is walked back to it.
- Jaguero Isle had a shipwrecked Stormwind noblewoman. Princess Poobah is a troll,
  who speaks of her tribe and her ancestors, and she is not shipwrecked: King
  Mukla of the Skymane keeps her in a shackle and carries the key himself.
- Alcaz Island had a very important prisoner on it. In this period it is the
  Strashaz naga under Tidelord Rrurgaz, with Doctor Weavil and his flying machine
  living among them, and what outsiders come for is bloodkelp.
- Baradin Bay was drawn across half a continent, with Stromgarde Keep and
  Southshore on it. It is the water off the Wetlands coast with Menethil Harbor on
  it and nothing else. Southshore is inland on Lordamere Lake.
- Agmond's End said only that the name suggests somebody died finding it. The game
  says who and how: Agmond was a dwarf off the Badlands dig, the search found the
  bloody smears where he had crawled, and the word scrawled in the sandstone where
  he stopped is the name of the trogg that killed him.
- Boulderslide Cavern had the kobolds' crystals carrying a trace of earthen magic.
  There is a resonite cask standing deep in the cave with an earthen asleep inside
  it, by name, and the kobolds have been mining around him.
- Kormek's Hut was a single hut with nothing else in Desolace between Nijel's
  Point and Shadowprey. Ghost Walker Post is also in Desolace, and the hut itself
  is a trade: a goblin buys kodo bones ten at a time out of the graveyard to the
  south, a caravan takes them to the coast, and they come back as furniture,
  musical instruments and blasting powder.
- The Kodo Graveyard said the bones were being harvested without saying by whom.
  It is the same trade, named now, which makes the tauren view of it easier to
  take seriously.
- Direforge Hill was a Dark Iron foothold in the highlands with Ironforge doing
  nothing about it. The hill is in the Wetlands, Balgaras the Foul holds it, and
  the dwarves who looked into him put a price on his ear.
- Gnomeregan had it whispered in Tinker Town that Thermaplugg knew what the
  radiation would do. Mekkatorque says it outright: he trusted the man, he was
  betrayed, and what he asks of volunteers is to kill the betrayer.
- Galak Hold called itself the Galak clan's seat, and Splithoof Crag is their
  stronghold. The hold is one of their positions.
- Gavin's Naze had the rare lion Araga wandering the length of Hillsbrad. She
  holds one spot up on the ridge among the ordinary mountain lions, in the Alterac
  Mountains.
- The Ruins of Kel'Theril had the Sundering destroying the city, and its Highborne
  haunting it by choice rather than under a curse. It is a curse and they earned
  it: the highborne there stole the Crystal of Zin-Malor meaning to siphon its
  power, it shattered, and the pieces went under the ice of the lake. They are
  still looking for them, and the elf who can mend the crystal is a continent away
  outside Quel'Lithien Lodge.
- The Dalaran Crater entry had the Violet Citadel training Medivh, which nothing
  in this period says of him. What it says now is who did study there, and that
  the Kirin Tor outside the crater are summoners working with bound elementals.
- Blackrock Depths called Moira the Dark Iron empress. Her own nameplate reads
  Princess of Ironforge, and what holds her at Thaurissan's side is a spell.
- Twelve more entries had a claim with no source behind it, each now replaced by
  what the game does say. Alexston Farmstead is being plundered rather than
  garrisoned, with the sacks of oats still stacked in it. Amberstill Ranch loses
  rams to one named worg on the hillside, not to Frostmane raids. Ameth'Aran's
  night elves do not know exactly who its ghosts were; they have two stone tablets
  and few other records. Blackwood Den's furbolgs are fouling the Cliffspring
  River, and the night elves suspect they are not the root of it. The Circle of
  West Binding has a stone at its centre, and three of the four circles hold keys
  meant for the fourth. Corrahn's Dagger is in the Alterac Mountains, not the
  Hillsbrad hills. Deathknell's risen are sorted by the crypt's own undertaker,
  and those who do not wake go into the fire. The Falfarren River has no bog
  beasts in it. Frostfire Hot Springs has a researcher who cannot find the source
  of the water and Winterfall furbolgs drawn to it, rather than shaman. Grol'dom
  Farm's quilboar raids are not recorded; the warrens are simply its nearest
  neighbours. Highperch's wyvern nests have sun-scorched egg shells under them,
  which is what anyone climbs up for. And the Bael'dun Digsite was right that the
  tauren answer is to break the diggers' picks, but the diggers are Bael'dun's own
  rather than the Bael Modan expedition, and Baine's second objection is that the
  digging will enrage Mulgore's kodos.
- Smaller additions, where an entry was true but thin: Everlook has two flight
  masters, one for each side, standing within sight of each other; the Deepwater
  Tavern has an archaeologist waiting in it for an escort out to Whelgar's dig;
  Ghost Walker Post is a few braves with a macecrafter and a leatherworker, and
  dying kodo walk past it on their way south; Elder Rise seats Magatha Grimtotem
  as elder crone; and Menethil Keep is held for Ironforge by Captain Stoutfist and
  the Menethil sentries.

## 1.2.11

Two more rounds of the vanilla-era sweep: 50 entries reviewed, 39 of them
carrying something wrong, and one removed. The method keeps improving. The 1.12
world database turns out to hold a table of named locations with coordinates, and
the game's own signposts are objects with the place name on them, so a place with
nobody standing in it can now be found and checked like any other.

**Removed**

- The Red Reaches. It is a stretch of the Blasted Lands coast added in a later
  expansion, and it does not exist as a place in either client this addon runs on,
  so the entry could never have come up. The Blasted Lands in this period have
  Nethergarde Keep, the Dark Portal, the Tainted Scar, the Altar of Storms, the
  Rise of the Defiler, Serpent's Coil, Dreadmaul Hold, Dreadmaul Post and the
  Garrison Armory, and no named coast.

**Fixed**

- Quel'Lithien Lodge had the high elves there grown bitter and dangerous, blaming
  the humans who failed to hold the line. They are on the Alliance's side in this
  period and hostile to the Horde, and the Horde is the side that raids them, for
  a registry of elven lives that Nathanos Blightcaller wants because his own
  mortal life is written in it. The wretched, hostile version of the lodge belongs
  to a later expansion.
- The Marris Stead was a Scourge-held farm pressing on Light's Hope Chapel. It is
  Nathanos Blightcaller's own house, he is the first of Sylvanas's champions, and
  he kills Scourge and Alliance alike from it. It also sits a long mile from
  Light's Hope rather than next door.
- The Ruins of Kel'Theril had the Sundering destroying the city, and the Highborne
  haunting it by choice rather than under a curse. It is a curse and they earned
  it: the highborne of that city stole the Crystal of Zin-Malor meaning to siphon
  its power, it shattered, and the pieces went under the ice of the lake. They are
  still looking for them.
- The Twin Colossals had a Grimtotem camp between the peaks. The Grimtotem are a
  mile south, west of Camp Mojache. What is at the foot of the western peak is
  Rexxar and his bear Misha, and the harpies above are the Northspring.
- Lake Falathim was ground the Sentinels hold without having to fight for it. It
  is murloc water. The Saltspittle have the shore and the shallows, and the night
  elf scholar Teronis, who went missing here, is still lying on the bank.
- Maestra's Post was a Sentinel camp on Ashenvale's southern border, watching the
  Barrens road. It is at the opposite corner of the forest, by the Darkshore
  border, and it is a junction with signposts and three people on it. The one who
  matters is Delgren the Purifier, working against the Dark Strand cult at the
  Tower of Althalaxx.
- The Pool of Tears had the naga taking an interest. The green dragonflight is all
  around it, and has been since Ysera sank the temple under it. Somnus is the one
  worth avoiding.
- Misty Pine Refuge was a seasonal hunting camp for Ironforge's hunters. It is one
  house with a fire, three chairs and Father Gavin of the Argent Dawn in it, and
  nothing else for a hundred yards.
- The Ruins of Constellas had the night elves writing Felwood off. The Jadefire
  satyrs hold the ruins under Xavathras, there is a corrupted moonwell in there
  bringing forth more of them, and the Emerald Circle is fighting for the place
  and says plainly that the land was once theirs.
- Roland's Doom had the Scythe of Elune found by a man named Jitters, and the Dark
  Riders coming down on Duskwood in time. Jitters is the frightened man at Raven
  Hill in a different story, and no Dark Rider exists in this period at all. What
  is true is that the Nightbane worgen hold the mine under Gutspill, and that the
  Carevins of Darkshire say the worgen were first found there.
- The Yorgen Farmstead asked how worgen reached Duskwood from Silverpine. They did
  not: the same Carevin account puts their first appearance at Roland's Doom, in
  the south-east of the zone.
- Splithoof Crag was one centaur holding among others at the canyon's western end.
  It is the Galak clan's stronghold, against the northern wall, and Splithoof Hold
  inside it guards a relic from the time of the centaurs' creation.
- The Ruins of Aboraz explained its drowned lower levels with the Sundering
  raising the sea. Nothing supports that, and the entry said nothing about who is
  there: Zanzil the Outcast holds the ruins with the dead he has raised, and keeps
  a Darkspear captive.
- The Venture Co. Base Camp was clear-cutting Stranglethorn for timber. It is a
  strip mine, cutting iron, silver and gold out of the ground, with the
  Skullsplitter trolls on the slope above. The company's loggers are in Stonetalon.
- Uldaman had the troggs as the earthen experiment's failures. The dwarves on site
  say the digging woke them: urns and idols came out of the ground and the troggs
  came up after. The Dark Iron are in the ruins too, holding a League prospector
  for what he knows about titan golems.
- Whelgar's Excavation Site was turning up dragon bones. It is turning up titan
  script. The tablet Whelgar has reads of a divine plan, a doomed prophecy, and
  Old Gods chained beneath the land.
- Zul'Farrak held a captured Alliance force. It holds Sergeant Bly's band of
  ill-reputed treasure hunters, who went in on their own account, and tablets of
  the prophecy of Mosh'aru.
- Seven more entries had the wrong place or the wrong people, each now matched to
  what the 1.12 game says. Ranazjar Isle is a mile north of Shadowprey rather than
  in sight of it, and the naga on it are the Slitherblade. Mosshide Fen is in the
  eastern marsh, and the complaint against the gnolls is that they trample it and
  fell too much wood, not that they ambush the road. Night Web's Hollow is a gold
  mine the Forsaken cannot work for spiders, not a test for new Forsaken. Northpass
  Tower is the northernmost of the zone's four towers, on the road out towards
  Quel'Thalas, and both factions want all four as outposts. Prospector Remtravel is
  alone at his dig with stone golems walking it. Silverwind Refuge has trainers,
  vendors and a lake full of befouled water elementals rather than the Warsong on
  both sides. The Noxious Glade holds Scourge champions from the battle of
  Darrowshire.
- Six entries were short of what is actually there, and now say it. Lake Mennar is
  ringed by the blue dragonflight rather than being one of Azshara's quiet spots.
  The Lakkari Tar Pits have tar elementals walking about in them. Marshal's Refuge
  is a non-aligned expedition in Williden Marshal's own words, not an Explorers'
  League camp, and it has a flight path and goblin bruisers keeping order.
  Morgan's Vigil has a gryphon master, a weaponsmith and Marshal Maxwell running
  the campaign against Blackrock Mountain. Sentinel Hill's militia has a captain,
  protectors, a quartermaster and a scout, and a recruit joins as a pledge sworn
  to the Light. Talonbranch Glade has a druid trainer, a hunter trainer and a pet
  trainer as well as its hippogryphs.
- Smaller trims, where a claim had no source: the Barrens no longer blames the
  Sundering for drying out, the Stagnant Oasis has a fissure under it rather than
  something wrong with its water, Thistleshrub Valley loses an Explorers' League
  theory about titan work, Thunder Ridge gains the Burning Blade warlock camped in
  it and loses a paragraph about shaman, the Scarab Dais now says the scepter
  shattered after Fandral Staghelm's betrayal and was divided among the four
  Aspects, the Temple Gardens explain that Darnassus imports its moonwell water in
  phials from Teldrassil, and the Pillar of Ash stops claiming every army in
  history marched past it.

## 1.2.10

Two more rounds of the vanilla-era sweep, and the heaviest pair so far: 42 of the
50 entries reviewed were carrying something wrong. The reason is a better method.
The 1.12 world database records the map position of every creature and every
object in the game, so the question of who holds a place can be settled by
listing what is standing there rather than by reading an article written for a
later version of the game.

**Fixed**

- The Dry Hills were gnoll country in the western Barrens. They are harpy
  country: the Witchwing nest in the hills at the zone's northwestern corner and
  raid the caravan road below, and Serena Bloodfeather leads them. No gnoll tribe
  is recorded anywhere in the Barrens.
- Forlorn Ridge was a ridge of ruins in the south of Azshara, picked over by
  satyrs. It is the mountain that dominates the west of the zone. Azshara's
  satyrs camp at Haldarr and Legash, and its ruins are down on the coast.
- Solliden Farmstead had the farmers dead and walking the fields. They are alive.
  This is one of the few places in Tirisfal where the native farmers survived the
  plague, and the Forsaken send recruits to steal their pumpkins.
- The Valley of Heroes gave its statues as the Second War's commanders with Lothar
  at the centre. The five are Turalyon, Kurdran Wildhammer, Khadgar, Danath
  Trollbane and Alleria Windrunner, all of them leaders of the Alliance Expedition
  through the Dark Portal, and not one of them is Lothar. The entry now names all
  five and says what became of them.
- Ragefire Chasm had the Burning Blade cult in it. The cult below Orgrimmar is the
  Searing Blade. The Burning Blade is Durotar's, and the game names both in a
  single sentence to keep them apart.
- Blackrock Spire had Rend and Nefarian as separate powers minding their own
  business. Thrall says plainly that Rend's claims rest on the black
  dragonflight's protection, and Rend's own letter calls Nefarian the master. The
  Blackrock Mountain entry was built on the same error and is fixed with it.
- Faldir's Cove had pirates drawn to the wrecks. The wrecks are a Blackwater
  Raiders expedition out of Booty Bay that went onto the reef after sunken elven
  treasure. The Daggerspine naga killed the survivors in the water, and the rest
  are stranded ashore.
- The Echo Isles had Zalazane taking the mind of any troll who goes back. He
  sends his own trolls the other way instead, to hex Sen'jin's people and drag
  them under his sway.
- Felpaw Village belonged to the Felpaw tribe. There is no such tribe. The village
  is the Deadwood's, under Chieftain Bloodmaw, and Felpaw is the name of the local
  wolves and scavengers.
- Sorrow Hill was a mass grave with Uther's tomb standing nearby by unhappy
  accident. The hill is Andorhal's cemetery and was named before the plague, and
  the last of the townsfolk raised the tomb on its crown deliberately. High Priest
  Thel'danis keeps watch over it.
- The Jansen Stead had its harvest golems animated by something unexplained and
  blamed on abandoned Stormwind engineering. They are machines. The explanations
  on offer locally are goblin manufacture or Defias money.
- Northfold Manor was a noble family's estate. It is a farm on the northwestern
  edge of the Highlands, Stromgarde's until the Syndicate took it, and the thing
  worth knowing about it is the demonic summoning traced there.
- Terror Wing Path was a pass on the approach to Blackrock Mountain. It is a
  valley at the eastern end of the Burning Steppes, the far side of the zone from
  the mountain, with whelps and drakes in it and Volchan roaming.
- The Eastvale Logging Camp was troubled by orc scouting parties out of Redridge.
  Its troubles are wolves, bears and delivery deadlines. No orc appears anywhere
  near Elwynn in this period.
- Naxxramas floated unassailable. The Argent Dawn attunes raiders into it, and the
  four wings are the spider, plague, construct and military quarters, with the
  frostwyrm lair above them. The old line counted the frostwyrm lair as a wing and
  left the spider quarter out.
- Azurelode Mine was Syndicate ground worked by forced labour. It is an Alliance
  mine, worked and guarded, with a foreman, four more foremen and twenty-two
  miners in it. The Forsaken want it shut because it supplies the Alliance
  armories.
- Dreadmaul Rock had the Dreadmaul ogres on it, working alongside the Blackrock
  orcs. The Firegut clan holds the rock. The Dreadmaul are the Blasted Lands clan,
  as this addon's own Dreadmaul Hold entry says, and the Firegut keep no allies
  except other ogres.
- Alther's Mill had been taken by the Redridge gnolls. The gnolls are in the
  Redridge Canyons. The mill is abandoned and full of spiders and dire condors,
  and what happens there now is Alliance rogues cracking a lockbox for their
  certificate of thievery.
- Dustfire Valley was the route between the Searing Gorge and the Badlands. It
  runs north to the gates of Stonewrought Pass, and in this period those gates are
  locked and need a key, so it is a dead end.
- Janeiro's Point was a headland on Stranglethorn's eastern shore north of
  Grom'gol. It is a small island in the water outside Booty Bay with the giant
  goblin statue on it, and a sea giant for company.
- The East Pillar had a pond at the summit with a giant makura in it called
  Diamond Head, and Gregan Brewspewer up there watching it. Diamond Head is out
  in the sea off the Feralas coast, a long way from the colossals and well below
  the waterline, and Gregan is on the ground. What is up on the summit is a view,
  and Kalin Windflight selling parachutes to people who took the one-way teleport.
- Furlbrow's Pumpkin Farm was still being worked by a couple too stubborn to
  leave. The Furlbrows fled. They are camped out on the road, Farmer Furlbrow left
  his pocket watch behind in the farmhouse, and Defias smugglers and harvest
  watchers have the fields.
- The Bay of Storms was naga ground, with Azshara's court coming ashore in it. It
  is the stretch of the Great Sea off the zone's eastern coast, holding hydras, a
  sea giant, murlocs and a very old turtle, exactly as this addon's own entries
  for Scalebeard's Cave, Hetaera's Clutch and the Temple of Arkkoran describe.
- The Grove of the Ancients had several Ancients in it, serving as garrison and
  advisors. There is one. Onu is an Ancient of Lore, sitting in a ruined temple
  with two merchants and a sleeping druid.
- Chill Breeze Valley was a wolf-hunting ground north of the main road. It is
  western Dun Morogh, between Gnomeregan and Kharanos, with crag boars and
  wendigos in it, and Old Icebeard at the end holding a stolen meat locker he
  cannot get open.
- Helm's Bed Lake had dwarves fishing through the ice and the Frostmane
  interrupting them. The hole in the ice is kept open for fresh water. The trouble
  around the lake is Rockjaw troggs and a Dark Iron camp to the south.
- Ironstone Camp was worked by people who do not advertise what for. It is Moktar
  Krin's Horde war party, sent against the Explorers' League at the Rustmaul dig
  and now fighting the silithid the digging let out.
- Eastwall Tower had sightlines and columns of Scourge. Both factions keep an
  emissary at Light's Hope Chapel handing out orders to seize and rebuild all four
  of the Plaguelands towers.
- Gelkis Village put the clan's hills near Maraudon and had them holding
  themselves the senior centaur line. Maraudon is Maraudine ground. The Gelkis
  ravine is in the south-west of Desolace, and the Bolgan's Hole entry pointed the
  wrong way about the same ground and is fixed with it.
- Camp Mojache put the Grimtotem at the Twin Colossals. The Feralas Grimtotem are
  west of the camp, well short of the colossals.
- Gunstan's Post had a handful of dwarves and a dig. Gunstan is there alone with a
  campfire and a book.
- Ironforge had the discovery of Uldaman bringing the Explorers' League into
  being. It happened the other way round. Magni turned dwarven industry to
  archaeology and helped create the League, and Uldaman came out of that.

**Removed**

Six claims could not be supported from anything in this period, so they are gone
rather than reworded into something vaguer:

- Northshire Valley had the Church picking the valley for its steep sides and good
  water, and teaching there for three generations. What the entry says now is the
  walled southern pass, the river out to Crystal Lake and Marshal McBride's
  garrison.
- The Temple of the Moon had Elune's nature unclear even to her own priesthood,
  and the Sisters as the oldest institution the night elves have.
- Razorfen Kraul had the quilboar cultivating thorns grown where Agamaggan's blood
  fell, at a scale no other warren matches. The Downs is the quilboar capital. The
  entry had also left out Charlga Razorflank, who rules the Kraul.
- Razorfen Downs was the oldest of the quilboar sites.
- Stratholme had the Scarlet rank and file told very little by their own command,
  and gave the city as the Silver Hand's seat. The sourced fact is that the order
  was founded there.
- The Ruins of Lordaeron had nobody spared the walk past a throne room that is not
  on the way in.

## 1.2.9

Two more rounds of the vanilla-era sweep. One entry turned out to describe a town
that does not exist in this period and has been removed; the rest are entries that
named the wrong people or explained something that needed no explaining.

**Removed**

- Whisperwind Grove. It is the Emerald Circle's capital in a later expansion and
  is in neither client this addon runs on, so the entry could never have come up.
  The Circle's holdings in this period are the Emerald Sanctuary in southern
  Felwood and Wildheart Point.

**Fixed**

- The Northridge Lumber Camp was a logging camp overrun by the Scourge. The
  Scarlet Crusade runs the mill and their timber comes from it, which is why both
  the Alliance and the Horde send people to wreck it, and the method is termites
  rather than soldiers.
- Quel'Danil Lodge was isolated and sulking after the high elves' falling-out with
  the Alliance. It is their centre of communication in the Hinterlands, and its
  ambassadors are working to build relationships with other races, trading what
  they know about the Witherbark trolls. It is still no friendlier to arrivals.
- Scholomance had Kel'Thuzad taking the Barov estate by murdering the family. He
  promised immortality to anyone who would serve the Lich King, the Barovs
  believed him and handed over the keep and its crypts, and the cultists killed
  them afterwards. The Caer Darrow entry had its own wrong version of the same
  story and is fixed with it.
- The High Seat had three thrones in it. Three thrones belong to a council that
  sits only after Magni is lost, which is a later expansion. Here Magni holds
  Ironforge alone, from one throne.
- Anvilmar was the hall the dwarves lived in before Ironforge. It is the first
  settlement a new dwarf reaches, at the north end of Coldridge Valley, and
  nothing identifies it as Modimus Anvilmar's seat. The history of Modimus and
  the War of the Three Hammers is unchanged; only the claim about the building is
  gone.
- Kargath had its namesake held in a gladiator pit. That account belongs to a much
  later expansion. What the entry says now is that Kargath Bladefist cut off his
  own hand and put a blade in its place, and that both his name and his clan's
  come from it.
- Maraudon had Theradras keeping Zaetar's remains. The centaur killed him and hold
  the remains, and Theradras is down in the caverns with them. The Valley of
  Spears entry repeated the old version and is fixed too.
- Kolkar Crag was in northern Durotar raiding down from the Barrens. It is a
  craggy gorge in the south of the zone, with the Barrens below it rather than
  above.
- Scalebeard's Cave explained an empty cave by saying its turtle was out hunting
  in the Great Sea. Nothing says that. Scalebeard is simply not there most of the
  time, and he does not trouble anyone who walks in on him.
- The Isle of Dread said its chimaerok have the place to themselves. The Hatecrest
  naga have cut Shalzaru's Lair into the island's northern end, which this addon's
  own Shalzaru's Lair entry describes.

## 1.2.8

More of the vanilla-era sweep. The fixes in 1.2.6 and 1.2.7 were mostly places
described as they are in a later expansion. These are mostly different: entries
that named the wrong people, the wrong creatures or the wrong ground, and a
number of sentences that read like lore and turned out to have no source at all.

**Fixed**

- Purgation Isle was a private site of the Scarlet Crusade. There is no Scarlet
  Crusade on the island. It is a cemetery island of condemned dead who all served
  the Light, paladins, clerics, monks and mages, and an ogre necromancer named
  Kormok made use of them.
- The Mirage Raceway was run by two rival goblin outfits. It was built by the
  goblin Pozzik and the gnome Fizzle Brassbolts out of an argument about whose
  people build the better machine, and they keep a camp each at opposite ends of
  the track. Weazel's Crater beside it said the same wrong thing and is fixed too.
- Camp Wurg had Boss Tho'grun patrolling between the four Badlands ogre camps. The
  orcs at Kargath hired him to fetch the Sign of the Earth and he kept it instead,
  and his band wanders rather than holding ground. Camp Boff counted only three of
  the four camps and now counts four.
- Hammerfall said the Doomhammer had belonged to Durotan's clan. Orgrim was
  Blackrock clan and had the hammer from his own father, and it passed to Thrall
  with the title of Warchief and Orgrim's black armour.
- The Burning Steppes had the Dark Iron capital sinking into the mountain to become
  Blackrock Depths. Thaurissan was a colony on the surface and the thane's
  summoning destroyed it. The Searing Gorge told the same story and also credited
  the summoning to Emperor Dagran Thaurissan, who is the emperor holding the Dark
  Irons' seat now, not the thane who called up Ragnaros a long time before him.
- Kodo Rock had an invented lesson about finding a stone. It is a shaman shrine,
  and what young tauren come here to do is drink the Earth Sapta, which has to be
  taken in a holy place and nowhere else.
- Duskwood called the zone Grand Hamlet's county. Grand Hamlet is the old name of
  Darkshire, as the same entry says further down.
- Blackwater Cove was a pirate anchorage. It is the inlet Booty Bay is built
  around and the far end of the Ratchet crossing, and the Blackwater Raiders are
  Baron Revilgaz's people who run the port.
- The Greymane Wall had Gilneas refusing to fight the Second War. Gilneas fought
  it and then left the Alliance over the bill for the orc internment camps and
  Nethergarde Keep. The Silverpine Forest entry said the same thing and is fixed
  with it.
- The Harborage had Magtoor's Lost Ones holding to the Holy Light. What keeps them
  from going feral is draenethyst, crystals sacred to them that the feral ones
  stole away into the Fallow Sanctuary.
- The Southern Barrens now names the crone Charlga Razorflank mustering an army
  inside Razorfen Kraul, and the Bristleback holding Agama'gor off the road west
  of Camp Taurajo. It also records that the tauren lived in the southern Barrens
  for decades and held the land holy before they were driven off it.
- The Shimmering Flats were drained by the Sundering and had a low-grade argument
  about digging rights. It is a dried lake bed with a wrecked ship still lying in
  it, and the dwarves held the Rustmaul Dig Site until a Horde raiding party under
  Moktar Krin came at them and a silithid hive drove both sides off.
- The Talondeep Path was a tunnel nobody was watching. The tunnel is empty, but
  Mystral Lake at the Ashenvale end has come alive and traffic between the two
  zones is at a standstill because of it.
- Hiri'watha was Vilebranch ground. It is Witherbark, one of their smaller
  villages alongside Zun'watha, and the Hinterlands entry no longer gives all the
  zone's trolls to the Vilebranch either.
- The Ruins of Mathystra were held by furbolgs. The Stormscale naga have them,
  with highborne relics scattered through the ruins and ghost sabers on the site.
- The Isle of Dread had the gorillas and great cats of the mainland jungle. What
  is on it is chimaerok, and their meat is the best food anyone can cook.
- High Rise was Thunder Bluff's residential and trade mesa. That is the lower and
  middle rise. The High Rise is the top of the central mesa, where Cairne
  Bloodhoof lives and where a tauren who finishes the Rites of the Earthmother is
  sent.
- Shadowsong Shrine was unremarkable ruins in Azshara's interior. It is a
  ruin-covered hill in the west of the zone, and the Highborne Apparitions and
  Highborne Lichlings on it range over the ground around it.
- Northwatch Hold was a Kul Tiras and Stormwind position. It is Theramore and Kul
  Tiras, and the Horde's complaint about it is that the guns are hitting anything
  in range.
- Mor'Ladim at Raven Hill Cemetery was a father looking for his daughter. Morgan
  Ladimore came home from Lordaeron to a wasted county and no family left to find,
  went mad, and took his own life. The body was raised afterwards and it walks: he
  keeps a meandering circuit through the cemetery, attacks Watchmen on patrol, and
  the Night Watch has lost strong people to him. His grave at Forlorn Rowe is
  empty.
- The Decrepit Ferry had nothing afloat and worgen on Fenris Isle. The boat is
  there and it is heaped with wrapped corpses, the Scourge hold the shore, and the
  Rot Hide are mixed up in it.
- Addle's Stead was a farm in Duskwood's eastern woods full of former farmhands.
  It is in the south-west of the zone, and what walks there are Forlorn Spirits
  the Night Watch takes for Defias dead.
- The Temple of Arkkoran was dedicated to a sea creature the naga revere. It was
  built as a temple of Elune, and what sits at the top of it now is the sea giant
  Arkkoroc, with murlocs and makrura guarding the way up.
- Hetaera's Clutch had hydras that were only Hetaera's children. Hetaera roams it
  herself, three-headed, and Arkkoroc up at the temple calls her a false god who
  claims to rule the oceans.
- Brill Town Hall called the Defiler's Den the Forsaken's only other town hall.
  The Defiler's Den is in Arathi Basin and is named for the Horde side there.
- The Field of Giants explained its bones with the age before the Sundering, which
  no source offers. What lives on the field now is silithid, raising mounds and
  laying eggs, and the Horde at the Crossroads has taken an interest in how
  intelligent they seem.
- Blackthorn Ridge left its quilboar unnamed. They are Razormane, the ridge sits a
  short way north of Razorfen Kraul, and the orc shaman Brine is camped on it above
  a pool of unusually clean water.
- The Gates of Ahn'Qiraj had Fandral Staghelm refusing the Scepter of the Shifting
  Sands. Anachronos put it in his hands. He took it, and then he broke it.
- Loch Modan gave the Explorers' League dig sites all over the valley. There is
  one, Ironband's Excavation Site in the east, with troggs in it.
- Deadwind Pass said almost nothing lives in it. Ogres hold the canyon and mean to
  clear out everyone else, with harpies in the gullies above them.
- Nesingwary's Expedition had Hemet hunting across the world. Stranglethorn is the
  only camp he has in this period, and Ajeck Rouack and Barnil Stonepot hunt with
  him.
- Winterspring put Mazthoril beneath Frostsaber Rock. Mazthoril is the deep icy
  cavern in the middle of the zone, near Lake Kel'Theril, and Frostsaber Rock is
  out west where the frostsaber pride is.
- The Valley of Honor held the Ring of Valor. That arena belongs to a later
  expansion. The quarter trains Orgrimmar's warriors and hunters out of the Hall
  of the Brave and the Hunter's Hall.
- Emberstrife's Den called Deathwing's artefact the Dragon Soul. Here it is the
  Demon Soul, which this addon's Wetlands entry already called it.
- Brambleblade Ravine was a warren in the southern hills. It is east of Camp
  Narache in Mulgore, under Chief Sharptusk Thornmantle, and it is where young
  tauren are sent for the Rite of Strength.
- Teldrassil had Malfurion Stormrage opposing the planting of the tree. He was
  missing, which is why Fandral Staghelm could do it. Nozdormu refused his
  blessing and chided Staghelm for his arrogance, and Alexstrasza refused with
  him. The tree was also described as decades old when it was grown after the
  Third War.
- Feathermoon Stronghold was built on Sardor Isle. The stronghold has its own
  island, and Sardor Isle lies further out with Hatecrest naga on it. The Sardor
  Isle entry claimed the stronghold in return and now describes the naga.
- Marshal's Refuge in Un'Goro Crater was a joint expedition of dwarves and gnomes.
  It is a mixed camp under Williden Marshal, who is human.
- Mulgore said the tauren's druids were trained by Cenarius himself. Tauren
  druidism is recent, and the night elves of the Cenarion Circle still call them
  young in the ways of Cenarius.
- Tirisfal Glades gave the region's name a meaning no source in this period
  supports. What is sourced, and what the entry now says, is that the Guardians of
  Tirisfal took their name from the place their founders met in.
- Stromgarde's surviving garrison answered to "Commander Trollbane's heirs". No
  such rank exists. Thoras Trollbane is dead and his son Prince Galen Trollbane
  holds a few districts of the city.
- Shadowfang Keep had Baron Silverlaine offering his castle to the Dalaran mages.
  Arugal was sent to hold Silverpine, his worgen turned on the wizards, and they
  besieged the keep.
- The Wetlands had Khardros Wildhammer killing Modgud for the curse she laid on
  Grim Batol. She laid it as she died, after he struck her down.
- Tanaris counted three titan installations while naming two. Uldum and Uldaman
  are the two this period knows about.
- Western Plaguelands repeated the four-cornered battle at Andorhal that 1.2.7
  fixed in the Andorhal entry. The Scourge hold the town under Araj the Summoner.
- Darkshore and the Tower of Althalaxx called the tower the Shadow Council's. The
  warlocks in it are the Cult of the Dark Strand under Athrikus Narassin, and a
  journal taken off them is what ties the cult to the Council.

**Changed**

- Several pairs of entries that quietly contradicted each other have been
  reconciled: Blackwater Cove against Booty Bay, Camp Boff against Camp Wurg,
  Hiri'watha against the Hinterlands, the Rustmaul Dig Site against the Shimmering
  Flats, the Searing Gorge against the Burning Steppes, and Western Plaguelands
  against Andorhal. Where two entries disagreed, one of them was wrong, and that
  turned out to be the most reliable way to find these.
- The Temple of Arkkoran and Hetaera's Clutch are now written as the pair they
  are. Arkkoroc sits at the top of the temple and wants the heads of the hydra
  that roams the clutch, and neither entry used to know about the other.

## 1.2.7

The vanilla-era sweep continued. Every fix below is the same mistake: a place
was written up from an article whose opening paragraph describes a later
expansion, so the entry named something that is not there yet in this period.

**Fixed**

- Silverwind Refuge was a Horde outpost with an inn and a flight master, with
  night elf dead outside it. The Alliance hold it in this period, under Sentinel
  Velene Starstrike, and the entry was coloured for the wrong faction in game as
  well as wrong in its text.
- The Valley of Strength was given Orgrimmar's zeppelin towers. The towers stand
  outside the gates, in Durotar.
- Booty Bay ran boats to Ratchet "and ships further afield". There is one
  passenger route out of the bay, and it goes to Ratchet.
- Rut'theran Village had boats to Auberdine. It has one ship, the Moonspray.
- Jaguero Isle could be reached by swimming or by boat. No boat goes there.
- Southshore sat on the southern coast of Lordamere Lake. It is a port on
  Baradin Bay, which is what this addon's own Baradin Bay entry already said.
- Andorhal was a four-cornered battlefield of Scourge, Forsaken, Scarlet Crusade
  and Argent Dawn. The Scourge hold the town, the lich Araj the Summoner runs it
  and the plague cauldrons answer to him, and the Scarlet Crusade works the roads
  north out of Hearthglen. The Western Plaguelands entry said the same thing and
  has been corrected with it.
- Darkshire had Lord Ello Ebonlocke commanding the Night Watch. He is the Mayor
  of Darkshire. Commander Althea Ebonlocke leads the Night Watch.
- Dun Modr was held by Dark Iron and Syndicate forces together. The Syndicate is
  not there.
- Sandsorrow Watch was a Horde post. It is a neutral camp in a tower, with
  Sandfury trolls holding the ground around it.
- Wavestrider Beach had naga on it and a paragraph about their highborne descent.
  There are no naga on that coast in this period. There are steeljaw snappers.
- Bolgan's Hole was a cave held by whoever reached it first, in a zone said to
  have only two settlements. It is inside Gelkis Village and holds the Gelkis
  khan, Khan Shaka, and Desolace has Ghost Walker Post as well.
- Teldrassil had Malfurion Stormrage opposing the planting of the tree. He was
  missing, and that is why Fandral Staghelm was able to do it. The dragons are
  who refused: Nozdormu would not give his blessing and chided Staghelm for his
  arrogance, and Alexstrasza refused with him. The tree was also described as a
  few decades old, when it was grown after the Third War.
- Feathermoon Stronghold was built on Sardor Isle. The stronghold has its own
  island, and Sardor Isle lies further out with Hatecrest naga on it. The Sardor
  Isle entry claimed the stronghold in return and now describes the naga.
- Marshal's Refuge in Un'Goro Crater was a joint expedition of dwarves and
  gnomes. It is a mixed camp under Williden Marshal, who is human.
- Mulgore said the tauren's druids were trained by Cenarius himself. Tauren
  druidism is recent: the Cenarion Circle took them in after the Third War, and
  the night elves there still call them young in the ways of Cenarius.
- Tirisfal Glades gave the region's name a meaning no source in this period
  supports. The entry now keeps what is sourced, which is that the Guardians of
  Tirisfal took their name from the place their founders met in.
- Stromgarde's surviving garrison answered to "Commander Trollbane's heirs". No
  such rank exists. Thoras Trollbane is dead and his son Prince Galen Trollbane
  holds a few districts of the city.
- Shadowfang Keep had Baron Silverlaine offering his castle to the Dalaran mages.
  Arugal was sent to hold Silverpine, his worgen turned on the wizards, and they
  besieged the keep.
- The Wetlands had Khardros Wildhammer killing Modgud for the curse she laid on
  Grim Batol. She laid it as she died, after he struck her down, which is why the
  Wildhammers won the battle and still could not live there.
- Tanaris counted three titan installations while naming two. Uldum and Uldaman
  are the two this period knows about.
- Darkshore and the Tower of Althalaxx called the tower the Shadow Council's. The
  warlocks in it are the Cult of the Dark Strand under Athrikus Narassin, and the
  Sentinels watching them say plainly that they have never heard of the group.
  A journal taken off the cultists is what ties them to the Shadow Council.
- The Valley of Honor held the Ring of Valor. That arena arrives in a later
  expansion. The quarter trains Orgrimmar's warriors and hunters out of the Hall
  of the Brave and the Hunter's Hall, and holds the city's forges.
- Emberstrife's Den called Deathwing's artefact the Dragon Soul. That is the name
  a later expansion gives it. Here it is the Demon Soul, which this addon's
  Wetlands entry already called it.
- Brambleblade Ravine was a warren in the southern hills. It is east of Camp
  Narache in Mulgore, under Chief Sharptusk Thornmantle, and it is where young
  tauren are sent for the Rite of Strength.
- Winterspring put Mazthoril beneath Frostsaber Rock. Mazthoril is the deep icy
  cavern in the middle of the zone, near Lake Kel'Theril. Frostsaber Rock is out
  west, and the frostsaber pride is what is there.
- Nesingwary's Expedition said Hemet had made a career of big-game hunting across
  the world. Stranglethorn is the only camp he has in this period. Ajeck Rouack
  and Barnil Stonepot hunt with him.
- Deadwind Pass said almost nothing lives in it. Ogres hold the canyon and mean
  to clear out everyone else, with harpies in the gullies above them.
- Loch Modan gave the Explorers' League dig sites all over the valley. There is
  one, Ironband's Excavation Site in the east, and Prospector Ironband is
  recruiting for Uldaman out of it.

**Changed**

- The check that keeps the lore inside this period used to be a list of terms
  somebody had already found to be wrong, which could only ever catch a repeat.
  It is now a ledger of every proper noun the entries use, each with the source
  that proves it belongs here, and a name that is not in it fails the build. That
  is how most of the fixes above were found.

## 1.2.6

**Fixed**

- Auberdine listed a third boat, on "the Azuremyst route north". That crossing
  does not open until a later expansion. The port has two boats in this period:
  Rut'theran Village at the foot of Teldrassil, and Menethil Harbor in the
  Wetlands.
- The Damsel's Luck credited her crew to the Brashtide Crew, who belong to a
  later expansion. Captain Stillwater has her, and the crew are Bloodsail like
  the other two ships off the Wild Shore.
- Sishir Canyon was described as the road to the Ruins of Eldre'thar. Those
  ruins are not there yet. The canyon runs off the main Stonetalon road, and the
  Deepmoss spiders have it.
- Fray Island had the Southsea Freebooters holding the place under Cap'n Garvey
  before Klannoc Macleod. Garvey arrives later, so the order was backwards too.
  Klannoc runs the challenges and the test he sets is the Affray.
- Thorn Hill named Tortusk as the quilboar leading the Razormane there. He
  arrives later as well. The settlement has no named leader in this period.
- Gnomeregan, the Deeprun Tram and Steelgrill's Depot all called the gnome who
  flooded the city Sicco Thermaplugg. Here he is Mekgineer Thermaplugg, which is
  the only name the game gives him.
- Skywatcher Plateau is Forever content but was not flagged as such, so it
  appeared even with Forever lore switched off, which is the default.
- Menethil Harbor was spelled Menethil Harbour in five places.

**Removed**

- The Sludgewerks. It is a goblin base from a later expansion and is in neither
  of the clients this addon runs on, so the entry could never have come up.


## 1.2.5

**Fixed**

- The Southern Barrens and the Gold Road both described the Great Divide, the
  lava chasm that splits the Barrens. It is not there yet in this period: what
  divides the two halves is a dried-up riverbed, and the Gold Road crosses it
  on a bridge and becomes the Southern Gold Road on the far side.
- The Headland was written up as a Stormpike training camp with instructors and
  a drill sergeant on it. The dwarves are not there yet either. It is a ridge
  with mountain lions on it, and now says so.
- Southbreak Shore credited the pirates to Captain Dreadbeard, who is from a
  later version of that beach. The Southsea Freebooters hold the north end, and
  there are sea giants in the surf.
- Gavin's Naze named the wrong four ridges above Hillsbrad. The four are
  Sofera's Naze, Corrahn's Dagger, the Headland and Gavin's Naze, in that
  order, and only three of them are named after people.
- Shandris Feathermoon was called General. She commands Feathermoon Stronghold
  and the rank came later.


## 1.2.4

**Added**

- Eighteen more places, taking the total to 940. Ashenvale, Tirisfal Glades and
  the Wetlands now have every place in them written up, and thirty-eight of the
  sixty-three zones are complete.
- Four in the old world: the Sanctum in Stromgarde Keep, the chapel Prince Galen
  Trollbane keeps to with the stair down to his family's crypt; Gavin's Naze in
  the Alterac Mountains, last of the four named ridges over Hillsbrad and the
  only one nobody ever took; the Galak Camp in Mulgore, where centaur are
  sitting on tauren ground for no reason anybody has given; and the Warsong
  Labor Camp in Ashenvale, which is not the Warsong Lumber Camp and had been
  left out for fear of writing up the wrong one.
- Fourteen of Forever's, background only and hidden until you turn that on.
  Three in Riverglades: Ashwood's Fall, Terral's Watch and Wheeler's Grange.
  Two in Tirisfal Glades: the Whispering Forest, with its ring of mushrooms and
  the knight who cannot leave it, and Shadowvale below, held by paladins who
  came back from the grave still convinced the undead should be put down. Two in
  Mulgore: Camp Gev'rek, where the Earthen Ring brought the Windshapers into the
  Horde, and the Gloomrise, where the dead are talking. Two in the Wetlands:
  Dragonmaw Retreat and the Drunken Dwarf, a watchtower turned into a pub. Two
  on Mount Hyjal: the Cradle of Tranquility, where a dread raven Wild God has
  settled, and Mourning's Rest, where a vulture Wild God is losing patience with
  the dead for walking about. Three on Zephras Isle: the Ruins of Ban'aethal, a
  smiths' town that fell into the sky and emptied in a night; the Bandit
  Hideout, where the island's thieves keep the windstones they take; and the
  Rohashi Spires, standing in open air above the shrine and carrying the name of
  one of Al'Akir's own.
- Most of these had nothing written about them anywhere when the Forever zones
  were first filled in. The wiki has been catching up since, and looking again
  found them.
- Every place still left blank now has a reason recorded for it. Most were cut
  before the game was released and were never anywhere a player could stand. The
  rest are Forever's, and nothing has been written about them yet anywhere we
  can read.

## 1.2.3

**Added**

- Eight more places in Ashenvale: Xavian, the Zoram Strand, Kargathia Keep, the
  Ruins of Ordil'Aran, Bloodtooth Camp, Silverwind Refuge, Forest Song and the
  Shady Nook. Ashenvale was the emptiest zone in the game and now has five left.
- Seven more in Stranglethorn Vale: Yojamba Isle, the Battle Ring, the Wild
  Shore, the three Bloodsail frigates moored off it, and the Venture Co.
  Operations Center.
- Six more in Mulgore and Tirisfal Glades: the Bael'dun Digsite, Kodo Rock and
  the Skywatcher Plateau; Gunther's Retreat, the Gallows' End Tavern and the
  Crusader Outpost.
- Twelve more across Feralas, Dustwallow Marsh, Azshara and Durotar: both of the
  Twin Colossals, Oneiros, the Writhing Deep, Woodpaw Den and Shalzaru's Lair;
  the Foothold Citadel and Swamplight Manor; the Ruined Reaches, Rethress
  Sanctum and the Legashi Encampment; and the Shrine of the Dormant Flame.
- Eleven more in the Barrens, Thousand Needles and Tirisfal Glades: the
  Mor'shan Rampart and Base Camp, the Gold Road, Fray Island, the Raptor
  Grounds and Honor's Stand; Splithoof Hold, the Tahonda Ruins and the Rustmaul
  Dig Site; and Stillwater Pond. The Barrens has one place left unwritten.
- Bandarion Keep in Tirisfal Glades, which is Forever's own addition to an old
  zone, so it is hidden with the rest of the Forever material until you turn
  that on.
- Twenty-eight more across eighteen zones, taking the total to 903 places.
  Among them the Ruins of Andorhal, Northdale, Roland's Doom, the Master's
  Cellar, Deadman's Crossing, the Maker's Terrace, Stonewatch Keep and Tower,
  Wildhammer Keep, the Harborage, both halves of the Stonefield and Maclure
  feud, the Ruins of Kel'Theril, Aldrassil, the Oracle Glade, the Shrine of the
  Deceiver, Bloodvenom Falls and the Pools of Vision.
- Twenty more, taking the total to 923 places. Among them the Darkspear Strand
  where the trolls came ashore, Spirit Rock and the Hidden Path above the orc
  starting valley, Dandred's Fold, Hillsbrad town, the Bones of Grakkarond,
  Tidefury Cove, Forlorn Rowe, the Stonewrought Pass and the Dawning Isles.
- Nineteen more, taking the total to 942 places. Among them Ariden's Camp,
  Render's Rock, Galardell Valley, the Silverwing Outpost, the Falfarren River,
  both ends of the Talondeep Path, Slither Rock, Baradin Bay, the Brill Town
  Hall and the Misty Reed Post.
- Twenty-five more, taking the total to 967 places. Among them the Foothill
  Caverns, the Drowned Reef, both ends of South Gate Pass, the Northshire
  River, Dustwind Cave, the Ravaged Twilight Camp, Windshear Mine, Gunstan's
  Post, the Moon Horror Den and the Southern Barrens.
- The last seven places in the old world: the North Coast, the Whispering
  Shore, both Tide's Runs, the Westfall lighthouse, the Weathered Nook and
  Ashenvale's moonwells. Every place the game names in the old world now has
  something written for it, unless no source for it exists anywhere.
- Walking into Scholomance, Dun Algaz or Raven Hill Cemetery now works
  whichever name the game reports. The client calls them the School of
  Necromancy, the Algaz Gate, and simply "The Cemetary".

## 1.2.2

**Added**

- 41 more places in Forever's new zones, taking the total from 757 to 798.
  Mount Hyjal, Riverglades, Shen'dralas and Zephras Isle all have proper
  write-ups now instead of a zone entry and a handful of locations. Background
  only, like the rest of the Forever material, and still hidden until you turn
  them on.
- The Zephras Isle write-up was wrong and has been redone. The Skyborne are
  exiles from Eldre'Thalas, which is Dire Maul, and the wind spirits who raised
  their island into the sky have since disappeared.
- 29 more places across the old world, found by checking every area name the
  game knows against what was written: Darrowshire, Faol's Rest, Fenris Keep,
  Anvilmar, Ravenholdt Manor, the Old Dalaran Ruins and Menethil Keep in the
  Eastern Kingdoms; the Temple of Zin-Malor, Bael Modan, the Shady Rest Inn,
  Emberstrife's Den, Uldum, the Dream Bough, the Maul, the Valley of Spears,
  Kolkar Village and the Den in Kalimdor. Then Shadow Grave, the Agamand Family
  Crypt, the Terrorweb Tunnel, the Tower of Arathor, Blackwater Cove and the
  Ruins of Jubuwal; and Demon Fall Ridge, the Dor'Danil Barrow Den, the Shrine
  of the Fallen Warrior, the Twilight Outpost, Ghost Walker Post and the Razor
  Hill Barracks.
- Four places that were missing and should not have been: the Deeprun Tram, the
  Gates of Ahn'Qiraj, Champions' Hall and the Hall of Legends. The Tram was
  mentioned in six other write-ups and had none of its own, and the addon had
  Ahn'Qiraj, its Ruins and its Temple but not the wall across the front of them.
- Every zone in the game now has at least three places written up. Forever's
  four were the last ones short.
- `/ftn areas` asks the game for every place name it knows and says which of
  them have nothing written for them yet. Unlike `/ftn gaps` it does not wait
  for you to walk anywhere; it covers the whole world in one go, Forever's new
  zones included.
- `/ftn npcs` notes the characters you target or hover over, together with the
  zone and the spot they were standing in, and the game's own id number for
  each. It is groundwork for writing characters up: the point is to build the
  list from who is actually in the world rather than from a list made somewhere
  else. Only NPCs are recorded, never other players or their pets. Nothing is
  sent anywhere, `/ftn npcs clear` empties the list, and it can be turned off
  in the settings.

## 1.2.1

**Fixed**

- The settings page ran off the bottom of the window and the controls that did
  not fit were drawn across the screen. It scrolls now.
- On some clients the settings page came up completely empty.

## 1.2.0

**Added**

- 123 more towns, ruins and landmarks, taking the total from 626 places to 757.
  Every zone now has at least nine written up, except Forever's four new zones.
- Entries for Forever's nine new dungeons: Hall of Thanes, Ruins of Lordaeron,
  Excavation Site, City of Dalaran, The Drowned City, Krol'dok Stronghold,
  Alcaz Prison, Blackmaw Hold and Shaper's Terrace. Background only, like the
  rest of the Forever material.
- `/ftn gaps` lists places you have stood in that have nothing written for them
  yet. It is there so the missing ones can be found and filled in. Nothing is
  sent anywhere, `/ftn gaps clear` empties the list, and the whole thing can be
  turned off in the settings.
- `/ftn stats` says how many of those have piled up.
- Walking into a place whose only entry is hidden by the Forever setting now
  tells you so, instead of showing nothing at all.

**Fixed**

- Removed some potential spoilers.
- Dungeons were listed as having nothing written for them even when they did.

## 1.1.0

**Fixed**

- The minimap button sat inside the minimap's border instead of outside it.
  Squared-off minimaps are handled properly too.

**Added**

- Two sliders in `/ftn config` for the minimap button: where it sits around the
  edge, and how far out. It was always draggable as well, which nothing told
  you; the tooltip now does.
- Flight paths are quiet. A taxi route crosses dozens of places in a couple of
  minutes, and 1.0.0 announced every one of them and counted them as visited,
  which used up the "only the first time I ever visit" flag on places you had
  never actually stood in. Nothing is announced or counted while you are flying,
  and the place you land in is announced when you dismount. There is a setting
  to put the old behaviour back.
- Source references are clickable. The game will not open a browser, so
  clicking one gives you the full web address in a box with the text already
  selected, ready to copy. They point at warcraft.wiki.gg; a setting switches
  them to wowpedia.fandom.com.

## 1.0.0

First release. 626 places written up: 50 zones, 562 towns, ruins and landmarks,
and 14 dungeons, raids and battlegrounds.

- A fading card on arrival with one line about the place, click for the full
  write-up.
- `/ftn` for where you are, `/ftn <name>` to look anything up, `/ftn list` to
  browse by continent.
- Lore stops at patch 1.12, and goes back through Warcraft I-III and the
  pre-WoW history. Nothing from The Burning Crusade onward, and no questline
  spoilers.
- Forever's four new zones are included but hidden behind `/ftn forever on`, and
  written as background only.
- Settings for when it speaks up, how long the card lingers, repeat
  suppression, combat suppression and text size.
