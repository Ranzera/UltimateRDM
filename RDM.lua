include("organizer-lib")
--[[
    Add to Chat Colors: Red: 167, Orange: 003, Green: 204, Purple: 209
    
    Text Undulation color 50 230 20;

    ROAD MAP
	
	Ranged Attacks
	
	Keybinds
	
	Organize Vars and Functions
    
    create handling for spirit/avatar perpetuation cost gear locking/idling while /SMN
]]--

function get_sets()

	-------------------------------
	--     Player Configured     --
	--         Variables         --
	-------------------------------
	
	
	BaseMP = 594 -- Your MP, naked, with a subjob that has no MP.
 -- #SubjobVars - Search this hashtag to reach the Subjob configuration settings
	ConvertMerits = 5 -- Number of upgrades to Convert Recast
    FPSMode = 60 -- change to 30 if using 30 FPS mode
	send_command('config FrameRateDivisor 1') -- 60 FPS. Switch to 2, to default to 30 FPS

    local Status_X = 1169
    local Status_Y = 93

    Menu_X = 2257
    Menu_Y = 1002

    Selector_X = Menu_X - 20
    Selector_Y = Menu_Y + 40
    
	-- Default Menu settings and positions
    Menu = "Weapons"
    Weapon = "MP"
    MeleeGear = "AccuracyHaste"
    HasteAccTuning = 0
    EnmityMode = "Off"
    IdleMode = "Balanced"
    EnfeebleMode = "Potency/Haste"
    ElementalMode = "Macc"
    ForceSwapThreshold = 0

	-------------------------------
	--         Build Menu        --
	--       and Status Bar      --
	-------------------------------

    send_command('wait .000;Text Status      create;wait .001;Text Status      pos '..  Status_X..' '..  Status_Y       ..';wait .001;Text Status      color 230  50   0;wait .001;Text Status      bg_alpha 255;wait .001;Text Status      size 30;wait .001;Text Status      font "Courier New";wait .001;Text Status      bold true')
	send_command('wait .007;Text Sublimation create;wait .001;Text Sublimation pos '..    Menu_X..' '..    Menu_Y       ..';wait .001;Text Sublimation color 200 200 200;wait .001;Text Sublimation bg_alpha 190;wait .001;Text Sublimation size 14;wait .001;Text Sublimation font "Courier New";wait .001;Text Sublimation bold true')
    send_command('wait .014;Text Undulation  create;wait .001;Text Undulation  pos '..    Menu_X..' '..    Menu_Y +  23 ..';wait .001;Text Undulation  color 50  230  20;wait .001;Text Undulation  bg_alpha 190;wait .001;Text Undulation  size 14;wait .001;Text Undulation  font "Courier New";wait .001;Text Undulation  bold true')
    send_command('wait .021;Text Weapons     create;wait .001;Text Weapons     pos '..    Menu_X..' '..    Menu_Y +  45 ..';wait .001;Text Weapons     color 200 200 200;wait .001;Text Weapons     bg_alpha 190;wait .001;Text Weapons     size 14;wait .001;Text Weapons     font "Courier New";wait .001;Text Weapons     bold true')
    send_command('wait .028;Text Gearset     create;wait .001;Text Gearset     pos '..    Menu_X..' '..    Menu_Y +  68 ..';wait .001;Text Gearset     color 200 200 200;wait .001;Text Gearset     bg_alpha 190;wait .001;Text Gearset     size 14;wait .001;Text Gearset     font "Courier New";wait .001;Text Gearset     bold true')
    send_command('wait .035;Text Tuning      create;wait .001;Text Tuning      pos '..    Menu_X..' '..    Menu_Y +  91 ..';wait .001;Text Tuning      color 200 200 200;wait .001;Text Tuning      bg_alpha 190;wait .001;Text Tuning      size 14;wait .001;Text Tuning      font "Courier New";wait .001;Text Tuning      bold true')
    send_command('wait .042;Text Enmity      create;wait .001;Text Enmity      pos '..    Menu_X..' '..    Menu_Y + 114 ..';wait .001;Text Enmity      color 200 200 200;wait .001;Text Enmity      bg_alpha 190;wait .001;Text Enmity      size 14;wait .001;Text Enmity      font "Courier New";wait .001;Text Enmity      bold true')
    send_command('wait .049;Text Enfeebling  create;wait .001;Text Enfeebling  pos '..    Menu_X..' '..    Menu_Y + 137 ..';wait .001;Text Enfeebling  color 200 200 200;wait .001;Text Enfeebling  bg_alpha 190;wait .001;Text Enfeebling  size 14;wait .001;Text Enfeebling  font "Courier New";wait .001;Text Enfeebling  bold true')
    send_command('wait .056;Text Elemental   create;wait .001;Text Elemental   pos '..    Menu_X..' '..    Menu_Y + 160 ..';wait .001;Text Elemental   color 200 200 200;wait .001;Text Elemental   bg_alpha 190;wait .001;Text Elemental   size 14;wait .001;Text Elemental   font "Courier New";wait .001;Text Elemental   bold true')
    send_command('wait .063;Text ForceSwaps  create;wait .001;Text ForceSwaps  pos '..    Menu_X..' '..    Menu_Y + 183 ..';wait .001;Text ForceSwaps  color 200 200 200;wait .001;Text ForceSwaps  bg_alpha 190;wait .001;Text ForceSwaps  size 14;wait .001;Text ForceSwaps  font "Courier New";wait .001;Text ForceSwaps  bold true')
    send_command('wait .070;Text Idle        create;wait .001;Text Idle        pos '..    Menu_X..' '..    Menu_Y + 205 ..';wait .001;Text Idle        color 200 200 200;wait .001;Text Idle        bg_alpha 190;wait .001;Text Idle        size 14;wait .001;Text Idle        font "Courier New";wait .001;Text Idle        bold true')
    send_command('wait .077;Text Selector    create;wait .001;Text Selector    pos '..Selector_X..' '..Selector_Y       ..';wait .001;Text Selector    color 200 200 200;wait .001;Text Selector    bg_alpha   0;wait .001;Text Selector    size 20;wait .001;Text Selector    font "Courier New";wait .001;Text Selector    bold true')
    send_command('wait .084;Text Selector    text >')

	-------------------------------
	--          Hot Keys         --
	-------------------------------
	
    send_command('wait .100;Keyboard_Bind Pause gs c ToggleUndulations;') -- Pause Key Toggles UndulationsEnabled
    send_command('wait .101;Keyboard_Bind !Pageup gs c PrevMenu;')        -- Alt + PageUp   moves menu cursor Up
    send_command('wait .102;Keyboard_Bind !Pagedown gs c NextMenu;')      -- Alt + PageDown moves menu cursor Down
    send_command('wait .103;Keyboard_Bind !Delete gs c --;')              -- Alt + Delete   shifts menu value to the left
    send_command('wait .104;Keyboard_Bind !End gs c ++;')                 -- Alt + End      shifts menu value to the right

--[[
	Keyboard_Bind !z gs c PDT
	Keyboard_Bind !x gs c MDT


    Keyboard_Bind ^5 gs c FPS30
    Keyboard_Bind ^6 gs c FPS60


	Keyboard_Bind @1 gs c TaruModeOn
	Keyboard_Bind @2 gs c TaruModeOff
	Keyboard_Bind !^1 gs c MPLock;
	Keyboard_Bind !^2 gs c Reset;
	Keyboard_Bind !^3 gs c Convert;gs disable all;wait 15;gs enable all;
	Keyboard_Bind !^9 gs c ToggleEmergencyTank
	Keyboard_Bind ^insert gs c MenuOn
	Keyboard_Bind !insert gs c MenuOff
--]]

	-------------------------------
	--     Internal Variables    --
	-------------------------------
    if     player.status == "Idle" then
        undulationFrequency = 450
    elseif player.status == "Resting" then
        undulationFrequency = 270
        RestingStarted = os.time()
    elseif player.status == "Engaged" then
        undulationFrequency = 130
    end

    undulate = {counter=0}
    Sublimation = {counter=0}
    mov = {counter=0}
    if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
        mov.x = windower.ffxi.get_mob_by_index(player.index).x
        mov.y = windower.ffxi.get_mob_by_index(player.index).y
        mov.z = windower.ffxi.get_mob_by_index(player.index).z
    end
    moving = false

    SubJobMP = 0
    Weakened = 0
    PreviousSetName = ""
    IdleSetName = ""
    
    LockMP = 0
    MDTLevel = 0
    PDTLevel = 0
    PanicLevel = 0
    
    UndulationsEnabled = 1
    RestingStarted = 0
    RestingBuffer = 0
    LastConvert = 0
    SublimationStarted = 0
    SublimationCharge = 0
    
    CastingSpell = 0
    SetMagicModes()
    MenuEnabled = 1
    DrawMenu(.09)
    MeleeMode = "Off"
    FencerSwapTPThreshold = 910
    EmergencyTank = "Off"
	EmergencyTankMemory = {}
	TaruMode = "Off"
    
	-- Check for Weakness on startup
	if buffactive['weakness'] then Weakened = (BaseMP + SubJobMP) * .75
	else                           Weakened = 0                         end
	-- Check for Subjob Restriction on startup
	if buffactive['SJ Restriction'] then SubJobMP = 0
    else                                 set_SubJobVars(player.sub_job) end
    
    Weaknesses = {}
    Weaknesses['Fire'] = 'Water'
    Weaknesses['Ice'] = 'Fire'
    Weaknesses['Wind'] = 'Ice'
    Weaknesses['Earth'] = 'Wind'
    Weaknesses['Lightning'] = 'Earth'
    Weaknesses['Water'] = 'Lightning'
    Weaknesses['Light'] = 'Dark'
    Weaknesses['Dark'] = 'Light'

	-------------------------------
    --                           --
	--         Gear Sets         --
    --                           --
	-------------------------------

    sets.IdleSet = {}
    sets.lockstyle = {}
    sets.MaxMP = {}
    sets.TaruMP = {}
    sets.Convert = {}
    sets.HMP = {}
    sets.idle = {}
    sets.PDTidle = {}
    sets.MDTidle = {}
    sets.PDT = {}
    sets.MDT = {}
    sets.FastPants = {}
    sets.FencerRing = {}
    sets.BalrahnRing = {}
    sets.UrgentRefresh = {}
    sets.precast = {}
    sets.midcast = {}
    sets.midcast.ConserveMP = {}
    sets.midcast.MGS  = {}
    sets.midcast.Haste = {}
    sets.midcast.DINT = {}
    sets.midcast.DINTObi = {}
    sets.midcast.EINTMacc = {}
    sets.midcast.EINTHaste = {}
    sets.midcast.EMNDMacc = {}
    sets.midcast.EMNDPotency = {}
    sets.midcast.Enhancing = {}
    sets.midcast.NINTMacc = {}
    sets.midcast.NINTMaccObi = {}
    sets.midcast.NINTPotency = {}
    sets.midcast.NINTPotencyObi = {}
    sets.midcast.HMND = {}
    sets.midcast.Stoneskin = {}
    sets.midcast.CHA = {}
    sets.midcast.Spikes = {}
    sets.midcast.EleDebuffs = {}
    sets.midcast.Enmity = {}
    sets.Accuracy = {}
    sets.AccHaste = {}
    sets.PDTHaste = {}
    sets.PDTMelee = {}
    sets.EvaHaste = {}
    sets.ws = {}
    sets.ws['Shining Strike'] = {}
    sets.ws['Evisceration'] = {}
    sets.ws['Gust Slash'] = {}
    sets.ws['Cyclone'] = {}
    sets.ws['Fast Blade'] = {}
    sets.ws['Burning Blade'] = {}
    sets.ws['Red Lotus Blade'] = {}
    sets.ws['Vorpal Blade'] = {}
    sets.ws['Shining Blade'] = {}
    sets.ws['Seraph Blade'] = {}
    sets.ws['Death Blossom'] = {}
    sets.aftercast = {}

    sets.Weapons = {}
    sets.Weapons.Fire = {main="Vulcan's Staff", sub="Bugard Strap +1"}
    sets.Weapons.Fire.MP = 10
    sets.Weapons.Ice = {main="Aquilo's Staff", sub="Bugard Strap +1"}
    sets.Weapons.Ice.MP = 10
    sets.Weapons.Wind = {main="Auster's Staff", sub="Bugard Strap +1"}
    sets.Weapons.Wind.MP = 10
    sets.Weapons.Earth = {main="Terra's Staff", sub="Bugard Strap +1"}
    sets.Weapons.Earth.MP = 10
    sets.Weapons.Lightning = {main="Jupiter's Staff", sub="Bugard Strap +1"}
    sets.Weapons.Lightning.MP = 10
    sets.Weapons.Water = {main="Neptune's Staff", sub="Bugard Strap +1"}
    sets.Weapons.Water.MP = 10
    sets.Weapons.Light = {main="Apollo's Staff", sub="Bugard Strap +1"}
    sets.Weapons.Light.MP = 10
    sets.Weapons.Dark = {main="Pluto's Staff", sub="Bugard Strap +1"}
    sets.Weapons.Dark.MP = 10
    sets.Weapons.MDB = {main="Kebbie", sub="Bugard Strap +1"}
    sets.Weapons.MDB.MP = 10
    sets.Weapons.MP = {main="Fencing Degen", sub="Astral Aspis"}
    sets.Weapons.MP.MP = 35
    sets.Weapons.JoyJustice = {main="Joyeuse", sub="Justice Sword"}
    sets.Weapons.JoyJustice.MP = 0
    sets.Weapons.JusticeJoy = {main="Justice Sword", sub="Joyeuse"}
    sets.Weapons.JusticeJoy.MP = 0
    sets.Weapons.JoyKraken = {main="Joyeuse", sub="Kraken Club"}
    sets.Weapons.JoyKraken.MP = 0
    sets.Weapons.EnhanceKraken = {main="Enhancing Sword", sub="Kraken Club"}
    sets.Weapons.EnhanceKraken.MP = 0
    sets.Weapons.Sword = {main="Joyeuse", sub="Genbu's Shield"}
    sets.Weapons.Sword.MP = 0
    sets.Weapons.Dagger = {main="Hornetneedle", sub="Genbu's Shield"}
    sets.Weapons.Dagger.MP = 0
    sets.Weapons.Club = {main="Kraken Club", sub="Genbu's Shield"}
    sets.Weapons.Club.MP = 0
    sets.Weapons.Enmity = {main="Macuahuitl +1", sub="Genbu's Shield"}
    sets.Weapons.Enmity.MP = 0

    sets.Obis = {}
    sets.Obis['Fire'] = {waist="Penitent's Rope"}
    sets.Obis['Ice'] = {waist="Hyorin Obi"}
    sets.Obis['Wind'] = {waist="Penitent's Rope"}
    sets.Obis['Earth'] = {waist="Penitent's Rope"}
    sets.Obis['Lightning'] = {waist="Penitent's Rope"}
    sets.Obis['Water'] = {waist="Penitent's Rope"}
    sets.Obis['Light'] = {waist="Penitent's Rope"}
    sets.Obis['Dark'] = {waist="Anrin Obi"}
    
    send_command('wait 5;input /lockstyleset 1')


--//gs equip sets.MaxMP
------------------------------
--                          --
--        Lockstyle         --
--                          --
------------------------------
    sets.lockstyle = set_combine(sets.MaxMP, 
                                 sets.Weapons.Fire,{
                                 head="Dls. Chapeau +1",
                                 body="Dls. Tabard +1",
                                 hands="Dls. Gloves +1",
                                 legs="Blood Cuisses",
                                 feet="Duelist's Boots"})
                                 
                                 
------------------------------
--          #MaxMP          --
--          Max MP          --
--                          --
------------------------------
    -- MP:1002 --
    sets.MaxMP = {ammo="Hedgehog Bomb",
                  ammoMP=30,
                  head="Walahra Turban",
                  headMP=30,
                  neck="Beak Necklace +1",
                  neckMP=22,
                  ear1="Astral Earring",
                  ear1MP=25,
                  ear2="Loquacious Earring",
                  ear2MP=30,
                  body="Dalmatica",
                  bodyMP=50,
                  hands="Dls. Gloves +1",
                  handsMP=23,
                  lring="Serket Ring",
                  lringMP=50,
                  rring="Vilma's Ring",
                  rringMP=25,
                  back="Intensifying Cape",
                  backMP=30,
                  waist="Hierarch Belt",
                  waistMP=48,
                  legs="Goliard Trews",
                  legsMP=28,
                  feet="Llwyd's Clogs",
                  feetMP=23}
    sets.MaxMP.MP = 414
    
    
------------------------------
--                          --
--         Taru MP          --
--                          --
------------------------------
    -- MP:1084 --
    sets.TaruMP = set_combine(sets.MaxMP, {hands="Zenith Mitts",
                                           legs="Zenith Slacks",
                                           feet="Zenith Pumps"})
    sets.TaruMP.MP = sets.MaxMP.MP - (sets.MaxMP.handsMP - 50) - (sets.MaxMP.legsMP - 50) - (sets.MaxMP.feetMP - 50)


------------------------------
--          #Rest           --
--           Rest           --
--                          --
------------------------------
    --MP:1018 | HMP: 14 | Refresh: 1 | MDB + 5  --
    sets.HMP[0] =                          sets.Weapons.Dark
    sets.HMP[0].MP = sets.MaxMP.MP + sets.Weapons.Dark.MP
    sets.HMP[0].MPH = 14
    -- MP:1002 | HMP: 14 | Refresh: 2 | MDB + 5 | PDT -3%  --
    sets.HMP[1] = set_combine(sets.MaxMP, {head="Dls. Chapeau +1",
                                           legs="Goliard Trews"})
    sets.HMP[1].MP = sets.MaxMP.MP - (sets.MaxMP.headMP - 14) - (sets.MaxMP.legsMP - 28)
    sets.HMP[1].MPH = 14
    -- MP:986 | HMP: 19 | Refresh: 1 | PDT -3% --
    sets.HMP[2] = set_combine(sets.HMP[1],{body="Wlk. Tabard +1"})
    sets.HMP[2].MP = sets.HMP[1].MP - (sets.MaxMP.bodyMP - 34)
    sets.HMP[2].MPH = 19
    -- MP:963 | HMP: 22 | Refresh: 1 | PDT -3% --
    sets.HMP[3] = set_combine(sets.HMP[2],{feet="Goliard Clogs"})
    sets.HMP[3].MP = sets.HMP[2].MP - (sets.MaxMP.feetMP - 0)
    sets.HMP[3].MPH = 22
    -- MP:938 | HMP: 24 | Refresh: 1 | PDT -3% --
    sets.HMP[4] = set_combine(sets.HMP[3],{ear1="Relaxing Earring"})
    sets.HMP[4].MP = sets.HMP[3].MP - (sets.MaxMP.ear1MP - 0)
    sets.HMP[4].MPH = 24
    -- MP:908 | HMP: 25 | Refresh: 1 | PDT -3% --
    sets.HMP[5] = set_combine(sets.HMP[4],{ear2="Boroka Earring"})
    sets.HMP[5].MP = sets.HMP[4].MP - (sets.MaxMP.ear2MP - 0)
    sets.HMP[5].MPH = 25
    -- MP:860 | HMP: 27 | Refresh: 1 | PDT -3% --
    sets.HMP[6] = set_combine(sets.HMP[5],{waist="Duelist's Belt"})
    sets.HMP[6].MP = sets.HMP[5].MP - (sets.MaxMP.waistMP - 0)
    sets.HMP[6].MPH = 27
    -- MP:837 | HMP: 28 | Refresh: 1 | PDT -3% --
    sets.HMP[7] = set_combine(sets.HMP[6],{hands="Genie Gages"})
    sets.HMP[7].MP = sets.HMP[6].MP - (sets.MaxMP.handsMP - 0)
    sets.HMP[7].MPH = 28
    -- MP:812 | HMP: 28 | Refresh: 1 | Conditional! Refresh or MDT - 4% | PDT -3% --
    sets.HMP[8] = set_combine(sets.HMP[7],{rring="Merman's Ring"})  -- Logic for Balrahn's Ring swap is in the brains
    sets.HMP[8].MP = sets.HMP[7].MP - (sets.MaxMP.rringMP - 0)
    sets.HMP[8].MPH = 28
    -- MP:782 | HMP: 28 | Refresh: 1 | Conditional! Refresh or MDT - 4% | PDT -9%/15% --
    sets.HMP[9] = set_combine(sets.HMP[8],{back="Umbra Cape"})
    sets.HMP[9].MP = sets.HMP[8].MP - (sets.MaxMP.backMP - 0)
    sets.HMP[9].MPH = 28
    -- MP:732 | HMP: 28 | Refresh: 1 | Conditional! Refresh or MDT - 4% | MDT - 4% | PDT -9%/15% --
    sets.HMP[10]= set_combine(sets.HMP[9],{lring="Merman's Ring"})
    sets.HMP[10].MP= sets.HMP[9].MP - (sets.MaxMP.lringMP - 0)
    sets.HMP[10].MPH= 28
    

------------------------------
--          #Idle           --
--           Idle           --
--                          --
------------------------------
	-- sets.Weapons.Earth used in main slot when not in melee mode
    -- MP:991 | Refresh: 2 | MDB + 5 | PDT -20% --
    sets.idle[0] = set_combine(sets.MaxMP,  {head="Dls. Chapeau +1"})
    sets.idle[0].MP = sets.MaxMP.MP - (sets.MaxMP.headMP - 14)
    -- MP:966 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDB + 5 | PDT -20% --
    sets.idle[1] = set_combine(sets.idle[0],{rring="Merman's Ring"})  -- Logic for Balrahn's Ring swap is in the brains
    sets.idle[1].MP = sets.idle[0].MP - (sets.MaxMP.rringMP - 0)
    -- MP:936 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDB + 5 | PDT -26%/32% --
    sets.idle[2] = set_combine(sets.idle[1],{back="Umbra Cape"})
    sets.idle[2].MP = sets.idle[1].MP - (sets.MaxMP.backMP - 0)
    -- MP:906 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT - 2% | MDB + 5 | PDT -26%/32% --
    sets.idle[3] = set_combine(sets.idle[2],{ear2="Merman's Earring"})
    sets.idle[3].MP = sets.idle[2].MP - (sets.MaxMP.ear2MP - 0)
    -- MP:881 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT - 4% | MDB + 5 | PDT -26%/32% --
    sets.idle[4] = set_combine(sets.idle[3],{ear1="Merman's Earring"})
    sets.idle[4].MP = sets.idle[3].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:831 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT - 8% | MDB + 5 | PDT -26%/32% --
    sets.idle[5] = set_combine(sets.idle[4],{lring="Merman's Ring"})
    sets.idle[5].MP = sets.idle[4].MP - (sets.MaxMP.lringMP - 0)
    -- MP:808 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT -10% | MDB + 5 | PDT -26%/32% --
    sets.idle[6] = set_combine(sets.idle[5],{feet="Coral Greaves +1"})
    sets.idle[6].MP = sets.idle[5].MP - (sets.MaxMP.feetMP - 0)
    -- MP:785 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT -12% | MDB + 5 | PDT -26%/32% --
    sets.idle[7] = set_combine(sets.idle[6],{hands="Coral Fng. Gnt. +1"})
    sets.idle[7].MP = sets.idle[6].MP - (sets.MaxMP.handsMP - 0)
    -- MP:785 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT -12% | MDB + 5 | PDT -26%/32% --
    sets.idle[8] = sets.idle[7] -- float piece for Avatar Perpetuation Cost
    sets.idle[8].MP = sets.idle[7].MP
    

------------------------------
--         #PDTIdle         --
--         PDT idle         --
--                          --
------------------------------
	-- sets.Weapons.Earth used in main slot when not in melee mode
    -- MP:991 | Refresh: 2 | MDB + 5 | PDT -20% --
    sets.PDTidle[0] = set_combine(sets.MaxMP,     {head="Dls. Chapeau +1"})
    sets.PDTidle[0].MP = sets.MaxMP.MP      - (sets.MaxMP.headMP - 14)
    -- MP:966 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDB + 5 | PDT -20% --
    sets.PDTidle[1] = set_combine(sets.PDTidle[0],{rring="Merman's Ring"})  -- Logic for Balrahn's Ring swap is in the brains Merman's Jelly
    sets.PDTidle[1].MP = sets.PDTidle[0].MP - (sets.MaxMP.rringMP - 0)
    -- MP:936 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDB + 5 | PDT -26%/32% --
    sets.PDTidle[2] = set_combine(sets.PDTidle[1],{back="Umbra Cape"})
    sets.PDTidle[2].MP = sets.PDTidle[1].MP - (sets.MaxMP.backMP - 0)
    -- MP:906 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT - 2% | MDB + 5 | PDT -26%/32% --
    sets.PDTidle[3] = set_combine(sets.PDTidle[2],{ear2="Merman's Earring"})
    sets.PDTidle[3].MP = sets.PDTidle[2].MP - (sets.MaxMP.ear2MP - 0)
    -- MP:881 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT - 4% | MDB + 5 | PDT -26%/32% --
    sets.PDTidle[4] = set_combine(sets.PDTidle[3],{ear1="Merman's Earring"})
    sets.PDTidle[4].MP = sets.PDTidle[3].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:831 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT - 4% | MDB + 5 | PDT -31%/37% --
    sets.PDTidle[5] = set_combine(sets.PDTidle[4],{lring="Jelly Ring"})
    sets.PDTidle[5].MP = sets.PDTidle[4].MP - (sets.MaxMP.lringMP - 0)
    -- MP:808 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT - 4% | MDB + 5 | PDT -33%/39% --
    sets.PDTidle[6] = set_combine(sets.PDTidle[5],{feet="Dst. Leggings +1"})
    sets.PDTidle[6].MP = sets.PDTidle[5].MP - (sets.MaxMP.feetMP - 0)
    -- MP:785 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT - 4% | MDB + 5 | PDT -35%/41% --
    sets.PDTidle[7] = set_combine(sets.PDTidle[6],{hands="Dst. Mittens +1"})
    sets.PDTidle[7].MP = sets.PDTidle[6].MP - (sets.MaxMP.handsMP - 0)
    -- MP:785 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT - 4% | MDB + 5 | PDT -35%/41% --
    sets.PDTidle[8] = sets.PDTidle[7] -- float piece for Avatar Perpetuation Cost
    sets.PDTidle[8].MP = sets.PDTidle[7].MP
    

------------------------------
--         #MDTIdle         --
--         MDT idle         --
--                          --
------------------------------
	-- sets.Weapons.MDB used in main slot when not in melee mode
    -- MP:991 | Refresh: 2 | MDB +10 --
    sets.MDTidle[0] = set_combine(sets.MaxMP,     {head="Dls. Chapeau +1"})
    sets.MDTidle[0].MP = sets.MaxMP.MP      - (sets.MaxMP.headMP - 14)
    -- MP:966 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDB +10 --
    sets.MDTidle[1] = set_combine(sets.MDTidle[0],{rring="Merman's Ring"})  -- Logic for Balrahn's Ring swap is in the brains Merman's Jelly
    sets.MDTidle[1].MP = sets.MDTidle[0].MP - (sets.MaxMP.rringMP - 0)
    -- MP:960 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDB +10 --
    sets.MDTidle[2] = set_combine(sets.MDTidle[1],{back="Lamia Mantle"})
    sets.MDTidle[2].MP = sets.MDTidle[1].MP - (sets.MaxMP.backMP - 24)
    -- MP:930 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT - 2% | MDB +10 --
    sets.MDTidle[3] = set_combine(sets.MDTidle[2],{ear2="Merman's Earring"})
    sets.MDTidle[3].MP = sets.MDTidle[2].MP - (sets.MaxMP.ear2MP - 0)
    -- MP:905 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT - 4% | MDB +10 --
    sets.MDTidle[4] = set_combine(sets.MDTidle[3],{ear1="Merman's Earring"})
    sets.MDTidle[4].MP = sets.MDTidle[3].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:855 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT - 8% | MDB +10 --
    sets.MDTidle[5] = set_combine(sets.MDTidle[4],{lring="Merman's Ring"})
    sets.MDTidle[5].MP = sets.MDTidle[4].MP - (sets.MaxMP.lringMP - 0)
    -- MP:832 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT -10% | MDB +10 --
    sets.MDTidle[6] = set_combine(sets.MDTidle[5],{feet="Coral Greaves +1"})
    sets.MDTidle[6].MP = sets.MDTidle[5].MP - (sets.MaxMP.feetMP - 0)
    -- MP:809 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT -12% | MDB +10 --
    sets.MDTidle[7] = set_combine(sets.MDTidle[6],{hands="Coral Fng. Gnt. +1"})
    sets.MDTidle[7].MP = sets.MDTidle[6].MP - (sets.MaxMP.handsMP - 0)
    -- MP:782 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT -15% | MDB +10 --
    sets.MDTidle[8] = set_combine(sets.MDTidle[7],{legs="Coral Cuisses +1"})
    sets.MDTidle[8].MP = sets.MDTidle[7].MP - (sets.MaxMP.legsMP - 0)
    -- MP:782 | Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT -15% | MDB +10 --
    sets.MDTidle[9] = sets.MDTidle[8] -- float piece for Avatar Perpetuation Cost
    sets.MDTidle[9].MP = sets.MDTidle[8].MP


-------------------------------
--         #PDTPanic         --
--   Physical Damage Taken   --
--                           --
-------------------------------
	-- sets.Weapons.Earth used in main slot when not in melee mode
	-- Additional PDT -3% when not moving
    -- MP:977 | PDT -26%/32% --
    sets.PDT[0] = set_combine(sets.MaxMP, {back="Umbra Cape"})
    sets.PDT[0].MP = sets.MaxMP.MP  - (sets.MaxMP.backMP - 0)
    -- MP:947 | PDT -31%/37% --
    sets.PDT[1] = set_combine(sets.PDT[0],{rring="Jelly Ring"})
    sets.PDT[1].MP = sets.PDT[0].MP - (sets.MaxMP.rringMP - 0)
    -- MP:929 | PDT -33%/39% --
    sets.PDT[2] = set_combine(sets.PDT[1],{hands="Dst. Mittens +1"})
    sets.PDT[2].MP = sets.PDT[1].MP - (sets.MaxMP.handsMP - 0)
    -- MP:907 | PDT -35%/41% --
    sets.PDT[3] = set_combine(sets.PDT[2],{feet="Dst. Leggings +1"})
    sets.PDT[3].MP = sets.PDT[2].MP - (sets.MaxMP.feetMP - 0)
    -- MP:877 | PDT -37%/43% --
    sets.PDT[4] = set_combine(sets.PDT[3],{head="Darksteel Cap +1"})
    sets.PDT[4].MP = sets.PDT[3].MP - (sets.MaxMP.headMP - 0)
    -- MP:827 | PDT -41%/48% --
    sets.PDT[5] = set_combine(sets.PDT[4],{body="Dst. Harness +1"})
    sets.PDT[5].MP = sets.PDT[4].MP - (sets.MaxMP.bodyMP - 0)
	
	
-------------------------------
--                           --
--        Fast Pants         --
--                           --
-------------------------------
    sets.FastPants = {legs="Blood Cuisses"}
	
	
-------------------------------
--                           --
--       Fencer's Ring       --
--                           --
-------------------------------
    sets.FencerRing = {rring="Toreador's Ring", lring="Fencer's Ring"}
	
	
-------------------------------
--                           --
--      Balrahn's Ring       --
--  Use this if you have it  --
-------------------------------
    sets.BalrahnRing = {rring="Balrahn's Ring"}
	
	
-------------------------------
--      Urgent Refresh       --
-- This set overrides Melee  --
--  pieces when low MP and   --
--      Convert is down      --
-------------------------------
    sets.UrgentRefresh = {head="Dls. Chapeau +1", body="Dalmatica"}


-------------------------------
--         #MDTPanic         --
--     Magic Damage Taken    --
--                           --
-------------------------------
	-- sets.Weapons.MDB used in main slot when not in melee mode
    --MP:1002 | MDT - 0% | MDB +13 --
    sets.MDT[0] = set_combine(sets.MaxMP, {back="Lamia Mantle"})
    sets.MDT[0].MP = sets.MaxMP.MP  - (sets.MaxMP.backMP - 24)
    -- MP:977 | MDT - 4% | MDB +13 --
    sets.MDT[1] = set_combine(sets.MDT[0],{rring="Merman's Ring"})
    sets.MDT[1].MP = sets.MDT[0].MP - (sets.MaxMP.rringMP - 0)
    -- MP:952 | MDT - 6% | MDB +13 --
    sets.MDT[2] = set_combine(sets.MDT[1],{ear1="Merman's Earring"})
    sets.MDT[2].MP = sets.MDT[1].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:922 | MDT - 8% | MDB +13 --
    sets.MDT[3] = set_combine(sets.MDT[2],{ear2="Merman's Earring"})
    sets.MDT[3].MP = sets.MDT[2].MP - (sets.MaxMP.ear2MP - 0)
    -- MP:899 | MDT -10% | MDB +13 --
    sets.MDT[4] = set_combine(sets.MDT[3],{feet="Coral Greaves +1"})
    sets.MDT[4].MP = sets.MDT[3].MP - (sets.MaxMP.feetMP - 0)
    -- MP:876 | MDT -12% | MDB +13 --
    sets.MDT[5] = set_combine(sets.MDT[4],{hands="Coral Fng. Gnt. +1"})
    sets.MDT[5].MP = sets.MDT[4].MP - (sets.MaxMP.handsMP - 0)
    -- MP:846 | MDT -14% | MDB +13 --
    sets.MDT[6] = set_combine(sets.MDT[5],{head="Coral Visor +1"})
    sets.MDT[6].MP = sets.MDT[5].MP - (sets.MaxMP.headMP - 0)
    -- MP:796 | MDT -18% | MDB +13 --
    sets.MDT[7] = set_combine(sets.MDT[6],{lring="Merman's Ring"})
    sets.MDT[7].MP = sets.MDT[6].MP - (sets.MaxMP.lringMP - 0)
    -- MP:746 | MDT -22% | MDB + 8 --
    sets.MDT[8] = set_combine(sets.MDT[7],{body="Cor. Scale Mail +1"})
    sets.MDT[8].MP = sets.MDT[7].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:718 | MDT -25% | MDB + 8 --
    sets.MDT[9] = set_combine(sets.MDT[8],{legs="Coral Cuisses +1"})
    sets.MDT[9].MP = sets.MDT[8].MP - (sets.MaxMP.legsMP - 0)


------------------------------
--        #ConserveMP       --
--        Conserve MP       --
--                          --
------------------------------
	-- sets.Weapons.Earth used in main slot when not in melee mode
    --MP:1000 | Conserve MP +5 | PDT -23% --
    sets.midcast.ConserveMP[0] = set_combine(sets.MaxMP,                {body="Goliard Saio"})
    sets.midcast.ConserveMP[0].MP = sets.MaxMP.MP                 - (sets.MaxMP.bodyMP - 42)
    -- MP:970 | Conserve MP +5 | PDT -29%/35% --
    sets.midcast.ConserveMP[1] = set_combine(sets.midcast.ConserveMP[0],{back="Umbra Cape"})
    sets.midcast.ConserveMP[1].MP = sets.midcast.ConserveMP[0].MP - (sets.MaxMP.backMP - 0)
    -- MP:945 | Conserve MP +5 | PDT -34%/40% --
    sets.midcast.ConserveMP[2] = set_combine(sets.midcast.ConserveMP[1],{rring="Jelly Ring"})
    sets.midcast.ConserveMP[2].MP = sets.midcast.ConserveMP[1].MP - (sets.MaxMP.rringMP - 0)
    -- MP:922 | Conserve MP +5 | PDT -37%/42% --
    sets.midcast.ConserveMP[3] = set_combine(sets.midcast.ConserveMP[2],{hands="Dst. Mittens +1"})
    sets.midcast.ConserveMP[3].MP = sets.midcast.ConserveMP[2].MP - (sets.MaxMP.handsMP - 0)
    -- MP:899 | Conserve MP +5 | PDT -38%/44% --
    sets.midcast.ConserveMP[4] = set_combine(sets.midcast.ConserveMP[3],{feet="Dst. Leggings +1"})
    sets.midcast.ConserveMP[4].MP = sets.midcast.ConserveMP[3].MP - (sets.MaxMP.legsMP - 0)
    -- MP:869 | Conserve MP +5 | PDT -40%/46% --
    sets.midcast.ConserveMP[5] = set_combine(sets.midcast.ConserveMP[4],{head="Darksteel Cap +1"})
    sets.midcast.ConserveMP[5].MP = sets.midcast.ConserveMP[4].MP - (sets.MaxMP.headMP - 0)


------------------------------
--          #MGS            --
--           MGS            --
--                          --
------------------------------
    --MP:1000 --
    sets.midcast.MGS[0] = set_combine(sets.MaxMP,         sets.midcast.ConserveMP[1])
    sets.midcast.MGS[0].MP = sets.midcast.ConserveMP[1].MP
    -- MP:970 --
    sets.midcast.MGS[1] = set_combine(sets.midcast.MGS[0],{back="Skulker's Cape"})
    sets.midcast.MGS[1].MP = sets.midcast.MGS[0].MP - (sets.MaxMP.backMP - 0)
    -- MP:947 --
    sets.midcast.MGS[2] = set_combine(sets.midcast.MGS[1],{feet="Dream Boots +1"})
    sets.midcast.MGS[2].MP = sets.midcast.MGS[1].MP - (sets.MaxMP.feetMP - 0)
    -- MP:924 --
    sets.midcast.MGS[3] = set_combine(sets.midcast.MGS[2],{hands="Dream Mittens +1"})
    sets.midcast.MGS[3].MP = sets.midcast.MGS[2].MP - (sets.MaxMP.handsMP - 0)


-------------------------------
--          #Haste           --
--           Haste           --
--                           --
-------------------------------
	-- sets.Weapons.Earth used in main slot when not in melee mode
    --MP:1004 | FastCast 20% | Haste  9% | PDT -20% --
    sets.midcast.Haste[0] = set_combine(sets.MaxMP,           {body="Goliard Saio"})
    sets.midcast.Haste[0].MP = sets.MaxMP.MP            - (sets.MaxMP.bodyMP - 42)
    -- MP:981 | FastCast 20% | Haste 12% | PDT -20% --
    sets.midcast.Haste[1] = set_combine(sets.midcast.Haste[0],{hands="Dusk Gloves"})
    sets.midcast.Haste[1].MP = sets.midcast.Haste[0].MP - (sets.MaxMP.handsMP - 0)
    -- MP:933 | FastCast 20% | Haste 18% | PDT -20% --
    sets.midcast.Haste[2] = set_combine(sets.midcast.Haste[1],{waist="Speed Belt"})
    sets.midcast.Haste[2].MP = sets.midcast.Haste[1].MP - (sets.MaxMP.waistMP - 0)
    -- MP:910 | FastCast 20% | Haste 20% | PDT -20% --
    sets.midcast.Haste[3] = set_combine(sets.midcast.Haste[2],{feet="Dusk Ledelsens"})
    sets.midcast.Haste[3].MP = sets.midcast.Haste[2].MP - (sets.MaxMP.feetMP - 0)
    -- MP:878 | FastCast 20% | Haste 23% | PDT -20% --
    sets.midcast.Haste[4] = set_combine(sets.midcast.Haste[3],{legs="Tatsu. Sitagoromo"})
    sets.midcast.Haste[4].MP = sets.midcast.Haste[3].MP - (sets.MaxMP.legsMP - 0)
    -- MP:848 | FastCast 20% | Haste 23% | PDT -26%/32% --
    sets.midcast.Haste[5] = set_combine(sets.midcast.Haste[4],{back="Umbra Cape"})
    sets.midcast.Haste[5].MP = sets.midcast.Haste[4].MP - (sets.MaxMP.backMP - 0)
    -- MP:823 | FastCast 20% | Haste 23% | PDT -31%/37% --
    sets.midcast.Haste[6] = set_combine(sets.midcast.Haste[5],{rring="Jelly Ring"})
    sets.midcast.Haste[6].MP = sets.midcast.Haste[5].MP - (sets.MaxMP.rringMP - 0)

-------------------------------
--         #FastCast         --
--         Fast Cast         --
--                           --
-------------------------------
    -- MP:983 | FastCast 42% --
    sets.precast.fastcast = {head="Wlk. Chapeau +1",
                             body="Dls. Tabard +1",
                             ear2="Loquacious Earring"}
    sets.precast.fastcast.MP = sets.MaxMP.MP - (sets.MaxMP.headMP - 25) - (sets.MaxMP.bodyMP - 30) - (sets.MaxMP.ear2MP - 30)


------------------------------
--          #DINT           --
--           Dark           --
--                          --
------------------------------
    -- MP:987 | INT + 6 | Dark Skill + 7 --
    sets.midcast.DINT[0] = set_combine(sets.MaxMP,          {neck="Dark Torque"})
    sets.midcast.DINT[0].MP = sets.MaxMP.MP           - (sets.MaxMP.neckMP - 0)
    -- MP:982 | INT + 6 | Dark Skill +12 --
    sets.midcast.DINT[1] = set_combine(sets.midcast.DINT[0],{back="Merciful Cape"})
    sets.midcast.DINT[1].MP = sets.midcast.DINT[0].MP - (sets.MaxMP.backMP - 25)
    -- MP:959 | INT +10 | Dark Skill +12 | MAcc + 2 --
    sets.midcast.DINT[2] = set_combine(sets.midcast.DINT[1],{feet="Goliard Clogs"})
    sets.midcast.DINT[2].MP = sets.midcast.DINT[1].MP - (sets.MaxMP.feetMP - 0)
    -- MP:929 | INT +10 | Dark Skill +12 | MAcc + 7 | Haste + 2% --
    sets.midcast.DINT[3] = set_combine(sets.midcast.DINT[2],{head="Nashira Turban"})
    sets.midcast.DINT[3].MP = sets.midcast.DINT[2].MP - (sets.MaxMP.headMP - 0)
    -- MP:904 | INT +14 | Dark Skill +12 | MAcc + 7 | Haste + 2% --
    sets.midcast.DINT[4] = set_combine(sets.midcast.DINT[3],{rring="Snow Ring"})
    sets.midcast.DINT[4].MP = sets.midcast.DINT[3].MP - (sets.MaxMP.rringMP - 0)
    -- MP:854 | INT +14 | Dark Skill +12 | MAcc +12 | Haste + 2% --
    sets.midcast.DINT[5] = set_combine(sets.midcast.DINT[4],{ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.midcast.DINT[5].MP = sets.midcast.DINT[4].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    -- MP:804 | INT +14 | Dark Skill +15 | MAcc +12 | Haste + 2% --
    sets.midcast.DINT[6] = set_combine(sets.midcast.DINT[5],{body="Glamor Jupon"})
    sets.midcast.DINT[6].MP = sets.midcast.DINT[5].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:772 | INT +22 | Dark Skill +15 | MAcc +12 | Haste + 2% --
    sets.midcast.DINT[7] = set_combine(sets.midcast.DINT[6],{legs="Mahatma Slops"})
    sets.midcast.DINT[7].MP = sets.midcast.DINT[6].MP - (sets.MaxMP.legsMP - 0)
    -- MP:752 | INT +17 | Dark Skill +15 | MAcc +16 | Haste + 2% --
    sets.midcast.DINT[8] = set_combine(sets.midcast.DINT[7],{hands="Goliard Cuffs"})
    sets.midcast.DINT[8].MP = sets.midcast.DINT[7].MP - (sets.MaxMP.handsMP - 0)
    -- MP:704 | INT +22 | Dark Skill +15 | MAcc +16 | Haste + 2% --
    sets.midcast.DINT[9] = set_combine(sets.midcast.DINT[8],{waist="Penitent's Rope"})
    sets.midcast.DINT[9].MP = sets.midcast.DINT[8].MP - (sets.MaxMP.waistMP - 0)
    -- MP:654 | INT +27 | Dark Skill +15 | MAcc +16 | Haste + 2% --
    sets.midcast.DINT[10]= set_combine(sets.midcast.DINT[9],{lring="Snow Ring"})
    sets.midcast.DINT[10].MP= sets.midcast.DINT[9].MP - (sets.MaxMP.lringMP - 0)
    -- MP:634 | INT +29 | Dark Skill +15 | MAcc +16 | Haste + 2% --
    sets.midcast.DINT[11]= set_combine(sets.midcast.DINT[10],{ammo="Phantom Tathlum"})
    sets.midcast.DINT[11].MP= sets.midcast.DINT[10].MP - (sets.MaxMP.ammoMP - 10)


------------------------------
--         #ObiDINT         --
--           Dark           --
--           Obi            --
------------------------------
    -- MP:987 | INT + 6 | Dark Skill + 7 --
    sets.midcast.DINTObi[0] = set_combine(sets.MaxMP,             {neck="Dark Torque"})
    sets.midcast.DINTObi[0].MP = sets.MaxMP.MP              - (sets.MaxMP.neckMP - 0)
    -- MP:982 | INT + 6 | Dark Skill +12 --
    sets.midcast.DINTObi[1] = set_combine(sets.midcast.DINTObi[0],{back="Merciful Cape"})
    sets.midcast.DINTObi[1].MP = sets.midcast.DINTObi[0].MP - (sets.MaxMP.backMP - 25)
    -- MP:934 | INT + 6 | Dark Skill +12 --
    sets.midcast.DINTObi[2] = set_combine(sets.midcast.DINTObi[1],{waist="Penitent's Rope"})
    sets.midcast.DINTObi[2].MP = sets.midcast.DINTObi[1].MP - (sets.MaxMP.waistMP - 0)
    -- MP:911 | INT +10 | Dark Skill +12 | MAcc + 2 --
    sets.midcast.DINTObi[3] = set_combine(sets.midcast.DINTObi[2],{feet="Goliard Clogs"})
    sets.midcast.DINTObi[3].MP = sets.midcast.DINTObi[2].MP - (sets.MaxMP.feetMP - 0)
    -- MP:881 | INT +10 | Dark Skill +12 | MAcc + 7 | Haste + 2% --
    sets.midcast.DINTObi[4] = set_combine(sets.midcast.DINTObi[3],{head="Nashira Turban"})
    sets.midcast.DINTObi[4].MP = sets.midcast.DINTObi[3].MP - (sets.MaxMP.headMP - 0)
    -- MP:856 | INT +14 | Dark Skill +12 | MAcc + 7 | Haste + 2% --
    sets.midcast.DINTObi[5] = set_combine(sets.midcast.DINTObi[4],{rring="Snow Ring"})
    sets.midcast.DINTObi[5].MP = sets.midcast.DINTObi[4].MP - (sets.MaxMP.rringMP - 0)
    -- MP:806 | INT +14 | Dark Skill +12 | MAcc +12 | Haste + 2% --
    sets.midcast.DINTObi[6] = set_combine(sets.midcast.DINTObi[5],{ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.midcast.DINTObi[6].MP = sets.midcast.DINTObi[5].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    -- MP:756 | INT +14 | Dark Skill +15 | MAcc +12 | Haste + 2% --
    sets.midcast.DINTObi[7] = set_combine(sets.midcast.DINTObi[6],{body="Glamor Jupon"})
    sets.midcast.DINTObi[7].MP = sets.midcast.DINTObi[6].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:724 | INT +22 | Dark Skill +15 | MAcc +12 | Haste + 2% --
    sets.midcast.DINTObi[8] = set_combine(sets.midcast.DINTObi[7],{legs="Mahatma Slops"})
    sets.midcast.DINTObi[8].MP = sets.midcast.DINTObi[7].MP - (sets.MaxMP.legsMP - 0)
    -- MP:704 | INT +17 | Dark Skill +15 | MAcc +16 | Haste + 2% --
    sets.midcast.DINTObi[9] = set_combine(sets.midcast.DINTObi[8],{hands="Goliard Cuffs"})
    sets.midcast.DINTObi[9].MP = sets.midcast.DINTObi[8].MP - (sets.MaxMP.handsMP - 0)
    -- MP:654 | INT +22 | Dark Skill +15 | MAcc +16 | Haste + 2% --
    sets.midcast.DINTObi[10]= set_combine(sets.midcast.DINTObi[9],{lring="Snow Ring"})
    sets.midcast.DINTObi[10].MP= sets.midcast.DINTObi[9].MP- (sets.MaxMP.lringMP - 0)
    -- MP:634 | INT +24 | Dark Skill +15 | MAcc +16 | Haste + 2% --
    sets.midcast.DINTObi[11]= set_combine(sets.midcast.DINTObi[10],{ammo="Phantom Tathlum"})
    sets.midcast.DINTObi[11].MP= sets.midcast.DINTObi[10].MP- (sets.MaxMP.ammoMP - 10)


-------------------------------
--         #EINTMacc         --
--      Enfeebling (INT)     --
--           MAcc            --
-------------------------------
    -- MP:993 | INT + 6 | Enfeebling Skill +15 --
    sets.midcast.EINTMacc[0] = set_combine(sets.MaxMP,              {head="Dls. Chapeau +1"})
    sets.midcast.EINTMacc[0].MP = sets.MaxMP.MP               - (sets.MaxMP.headMP - 14)
    -- MP:977 | INT + 6 | Enfeebling Skill +30 --
    sets.midcast.EINTMacc[1] = set_combine(sets.midcast.EINTMacc[0],{body="Wlk. Tabard +1"})
    sets.midcast.EINTMacc[1].MP = sets.midcast.EINTMacc[0].MP - (sets.MaxMP.bodyMP - 34)
    -- MP:955 | INT + 6 | Enfeebling Skill +37 --
    sets.midcast.EINTMacc[2] = set_combine(sets.midcast.EINTMacc[1],{neck="Enfeebling Torque"})
    sets.midcast.EINTMacc[2].MP = sets.midcast.EINTMacc[1].MP - (sets.MaxMP.neckMP - 0)
    -- MP:932 | INT +10 | Enfeebling Skill +37 | MAcc + 2 --
    sets.midcast.EINTMacc[3] = set_combine(sets.midcast.EINTMacc[2],{feet="Goliard Clogs"})
    sets.midcast.EINTMacc[3].MP = sets.midcast.EINTMacc[2].MP - (sets.MaxMP.feetMP - 0)
    -- MP:907 | INT +15 | Enfeebling Skill +37 | MAcc + 2 --
    sets.midcast.EINTMacc[4] = set_combine(sets.midcast.EINTMacc[3],{rring="Snow Ring"})
    sets.midcast.EINTMacc[4].MP = sets.midcast.EINTMacc[3].MP - (sets.MaxMP.rringMP - 0)
    -- MP:875 | INT +23 | Enfeebling Skill +37 | MAcc + 2 --
    sets.midcast.EINTMacc[5] = set_combine(sets.midcast.EINTMacc[4],{legs="Mahatma Slops"})
    sets.midcast.EINTMacc[5].MP = sets.midcast.EINTMacc[4].MP - (sets.MaxMP.legsMP - 0)
    -- MP:855 | INT +27 | Enfeebling Skill +37 | MAcc + 2 --
    sets.midcast.EINTMacc[6] = set_combine(sets.midcast.EINTMacc[5],{back="Prism Cape"})
    sets.midcast.EINTMacc[6].MP = sets.midcast.EINTMacc[5].MP - (sets.MaxMP.backMP - 10)
    -- MP:807 | INT +32 | Enfeebling Skill +37 | MAcc + 2 --
    sets.midcast.EINTMacc[7] = set_combine(sets.midcast.EINTMacc[6],{waist="Penitent's Rope"})
    sets.midcast.EINTMacc[7].MP = sets.midcast.EINTMacc[6].MP - (sets.MaxMP.waistMP - 0)
    -- MP:757 | INT +37 | Enfeebling Skill +37 | MAcc + 2 --
    sets.midcast.EINTMacc[8] = set_combine(sets.midcast.EINTMacc[7],{lring="Snow Ring"})
    sets.midcast.EINTMacc[8].MP = sets.midcast.EINTMacc[7].MP - (sets.MaxMP.lringMP - 0)
    -- MP:707 | INT +37 | Enfeebling Skill +37 | MAcc + 7 --
    sets.midcast.EINTMacc[9] = set_combine(sets.midcast.EINTMacc[8],{ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.midcast.EINTMacc[9].MP = sets.midcast.EINTMacc[8].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    -- MP:687 | INT +32 | Enfeebling Skill +37 | MAcc +11 --
    sets.midcast.EINTMacc[10]= set_combine(sets.midcast.EINTMacc[9],{hands="Goliard Cuffs"})
    sets.midcast.EINTMacc[10].MP= sets.midcast.EINTMacc[9].MP - (sets.MaxMP.handsMP - 0)
    -- MP:667 | INT +34 | Enfeebling Skill +37 | MAcc +11 --
    sets.midcast.EINTMacc[11]= set_combine(sets.midcast.EINTMacc[10],{ammo="Phantom Tathlum"})
    sets.midcast.EINTMacc[11].MP= sets.midcast.EINTMacc[10].MP- (sets.MaxMP.ammoMP - 10)


-------------------------------
--        #EINTHaste         --
--      Enfeebling (INT)     --
--           Haste           --
-------------------------------
    -- MP:996 | INT + 6 | Enfeebling Skill +15 --
    sets.midcast.EINTHaste[0] = set_combine(sets.MaxMP,               {head="Dls. Chapeau +1"})
    sets.midcast.EINTHaste[0].MP = sets.MaxMP.MP                - (sets.MaxMP.headMP - 14)
    -- MP:980 | INT + 6 | Enfeebling Skill +30 --
    sets.midcast.EINTHaste[1] = set_combine(sets.midcast.EINTHaste[0],{body="Wlk. Tabard +1"})
    sets.midcast.EINTHaste[1].MP = sets.midcast.EINTHaste[0].MP - (sets.MaxMP.bodyMP - 34)
    -- MP:958 | INT + 6 | Enfeebling Skill +37 --
    sets.midcast.EINTHaste[2] = set_combine(sets.midcast.EINTHaste[1],{neck="Enfeebling Torque"})
    sets.midcast.EINTHaste[2].MP = sets.midcast.EINTHaste[1].MP - (sets.MaxMP.neckMP - 0)
    -- MP:926 | INT + 6 | Enfeebling Skill +42 | MAcc +3 | Haste + 2% --
    sets.midcast.EINTHaste[3] = set_combine(sets.midcast.EINTHaste[2],{legs="Nashira Seraweels"})
    sets.midcast.EINTHaste[3].MP = sets.midcast.EINTHaste[2].MP - (sets.MaxMP.legsMP - 0)
    -- MP:903 | INT + 1 | Enfeebling Skill +42 | MAcc +3 | Haste + 5% --
    sets.midcast.EINTHaste[4] = set_combine(sets.midcast.EINTHaste[3],{hands="Dusk Gloves"})
    sets.midcast.EINTHaste[4].MP = sets.midcast.EINTHaste[3].MP - (sets.MaxMP.handsMP - 0)
    -- MP:855 | INT + 1 | Enfeebling Skill +42 | MAcc +3 | Haste +11% --
    sets.midcast.EINTHaste[5] = set_combine(sets.midcast.EINTHaste[4],{waist="Speed Belt"})
    sets.midcast.EINTHaste[5].MP = sets.midcast.EINTHaste[4].MP - (sets.MaxMP.waistMP - 0)
    -- MP:832 | INT + 1 | Enfeebling Skill +42 | MAcc +3 | Haste +13% --
    sets.midcast.EINTHaste[6] = set_combine(sets.midcast.EINTHaste[5],{feet="Dusk Ledelsens"})
    sets.midcast.EINTHaste[6].MP = sets.midcast.EINTHaste[5].MP - (sets.MaxMP.feetMP - 0)
    -- MP:807 | INT + 5 | Enfeebling Skill +42 | MAcc +3 | Haste +13% --
    sets.midcast.EINTHaste[7] = set_combine(sets.midcast.EINTHaste[6],{rring="Snow Ring"})
    sets.midcast.EINTHaste[7].MP = sets.midcast.EINTHaste[6].MP - (sets.MaxMP.rringMP - 0)
    -- MP:787 | INT + 9 | Enfeebling Skill +42 | MAcc +3 | Haste +13% --
    sets.midcast.EINTHaste[8] = set_combine(sets.midcast.EINTHaste[7],{back="Prism Cape"})
    sets.midcast.EINTHaste[8].MP = sets.midcast.EINTHaste[7].MP - (sets.MaxMP.backMP - 10)
    -- MP:737 | INT + 9 | Enfeebling Skill +42 | MAcc +8 | Haste +13% --
    sets.midcast.EINTHaste[9] = set_combine(sets.midcast.EINTHaste[8],{ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.midcast.EINTHaste[9].MP = sets.midcast.EINTHaste[8].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    -- MP:687 | INT +14 | Enfeebling Skill +42 | MAcc +8 | Haste +13% --
    sets.midcast.EINTHaste[10]= set_combine(sets.midcast.EINTHaste[9],{lring="Snow Ring"})
    sets.midcast.EINTHaste[10].MP= sets.midcast.EINTHaste[9].MP - (sets.MaxMP.lringMP - 0)
    -- MP:667 | INT +16 | Enfeebling Skill +42 | MAcc +8 | Haste +13% --
    sets.midcast.EINTHaste[11]= set_combine(sets.midcast.EINTHaste[10],{ammo="Phantom Tathlum"})
    sets.midcast.EINTHaste[11].MP= sets.midcast.EINTHaste[10].MP- (sets.MaxMP.ammoMP - 10)


-------------------------------
--         #EMNDMacc         --
--      Enfeebling (MND)     --
--           MAcc            --
-------------------------------
    --MP:1009 | MND + 9 --
    sets.midcast.EMNDMacc[0] = set_combine(sets.MaxMP,              {legs="Custom Slacks",
                                                                     feet="Errant Pigaches"})
    sets.midcast.EMNDMacc[0].MP = sets.MaxMP.MP - (sets.MaxMP.legsMP - 32) - (sets.MaxMP.feetMP - 20)
    -- MP:993 | MND +12 | Enfeebling Skill +15 --
    sets.midcast.EMNDMacc[1] = set_combine(sets.midcast.EMNDMacc[0],{head="Dls. Chapeau +1"})
    sets.midcast.EMNDMacc[1].MP = sets.midcast.EMNDMacc[0].MP - (sets.MaxMP.headMP - 14)
    -- MP:977 | MND +12 | Enfeebling Skill +30 --
    sets.midcast.EMNDMacc[2] = set_combine(sets.midcast.EMNDMacc[1],{body="Wlk. Tabard +1"})
    sets.midcast.EMNDMacc[2].MP = sets.midcast.EMNDMacc[1].MP - (sets.MaxMP.bodyMP - 34)
    -- MP:955 | MND +12 | Enfeebling Skill +37 --
    sets.midcast.EMNDMacc[3] = set_combine(sets.midcast.EMNDMacc[2],{neck="Enfeebling Torque"})
    sets.midcast.EMNDMacc[3].MP = sets.midcast.EMNDMacc[2].MP - (sets.MaxMP.neckMP - 0)
    -- MP:941 | MND +18 | Enfeebling Skill +37 --
    sets.midcast.EMNDMacc[4] = set_combine(sets.midcast.EMNDMacc[3],{hands="Dvt. Mitts +1"})
    sets.midcast.EMNDMacc[4].MP = sets.midcast.EMNDMacc[3].MP - (sets.MaxMP.handsMP - 9)
    -- MP:909 | MND +15 | Enfeebling Skill +42 | MAcc + 3 | Haste + 2% --
    sets.midcast.EMNDMacc[5] = set_combine(sets.midcast.EMNDMacc[4],{legs="Nashira Seraweels"})
    sets.midcast.EMNDMacc[5].MP = sets.midcast.EMNDMacc[4].MP - (sets.MaxMP.legsMP - 0)
    -- MP:884 | MND +19 | Enfeebling Skill +42 | MAcc + 3 | Haste + 2% --
    sets.midcast.EMNDMacc[6] = set_combine(sets.midcast.EMNDMacc[5],{rring="Aqua Ring"})
    sets.midcast.EMNDMacc[6].MP = sets.midcast.EMNDMacc[5].MP - (sets.MaxMP.rringMP - 0)
    -- MP:864 | MND +23 | Enfeebling Skill +42 | MAcc + 3 | Haste + 2% --
    sets.midcast.EMNDMacc[7] = set_combine(sets.midcast.EMNDMacc[6],{back="Prism Cape"})
    sets.midcast.EMNDMacc[7].MP = sets.midcast.EMNDMacc[6].MP - (sets.MaxMP.backMP - 10)
    -- MP:814 | MND +23 | Enfeebling Skill +42 | MAcc + 8 | Haste + 2% --
    sets.midcast.EMNDMacc[8] = set_combine(sets.midcast.EMNDMacc[7],{ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.midcast.EMNDMacc[8].MP = sets.midcast.EMNDMacc[7].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    -- MP:766 | MND +28 | Enfeebling Skill +42 | MAcc + 8 | Haste + 2% --
    sets.midcast.EMNDMacc[9] = set_combine(sets.midcast.EMNDMacc[8],{waist="Penitent's Rope"})
    sets.midcast.EMNDMacc[9].MP = sets.midcast.EMNDMacc[8].MP - (sets.MaxMP.waistMP - 0)
    -- MP:716 | MND +33 | Enfeebling Skill +42 | MAcc + 8 | Haste + 2% --
    sets.midcast.EMNDMacc[10]= set_combine(sets.midcast.EMNDMacc[9],{lring="Aqua Ring"})
    sets.midcast.EMNDMacc[10].MP= sets.midcast.EMNDMacc[9].MP - (sets.MaxMP.lringMP - 0)
    -- MP:696 | MND +32 | Enfeebling Skill +42 | MAcc +10 | Haste + 2% --
    sets.midcast.EMNDMacc[11]= set_combine(sets.midcast.EMNDMacc[10],{feet="Goliard Clogs"})
    sets.midcast.EMNDMacc[11].MP= sets.midcast.EMNDMacc[10].MP- (sets.MaxMP.feetMP - 0)
    -- MP:666 | MND +33 | Enfeebling Skill +42 | MAcc +10 | Haste + 2% --
    sets.midcast.EMNDMacc[12]= set_combine(sets.midcast.EMNDMacc[11],{ammo="Jasper Tathlum"})
    sets.midcast.EMNDMacc[12].MP= sets.midcast.EMNDMacc[11].MP- (sets.MaxMP.ammoMP - 0)


-------------------------------
--        #EMNDPotency       --
--      Enfeebling (MND)     --
--          Potency          --
-------------------------------
    --MP:1009 | MND + 9 --
    sets.midcast.EMNDPotency[0] = set_combine(sets.MaxMP,                 {legs="Custom Slacks",
                                                                           feet="Errant Pigaches"})
    sets.midcast.EMNDPotency[0].MP = sets.MaxMP.MP - (sets.MaxMP.legsMP - 32) - (sets.MaxMP.feetMP - 20)
    -- MP:993 | MND +12 | Enfeebling Skill +15 --
    sets.midcast.EMNDPotency[1] = set_combine(sets.midcast.EMNDPotency[0],{head="Dls. Chapeau +1"})
    sets.midcast.EMNDPotency[1].MP = sets.midcast.EMNDPotency[0].MP - (sets.MaxMP.headMP - 14)
    -- MP:971 | MND +12 | Enfeebling Skill +22 --
    sets.midcast.EMNDPotency[2] = set_combine(sets.midcast.EMNDPotency[1],{neck="Enfeebling Torque"})
    sets.midcast.EMNDPotency[2].MP = sets.midcast.EMNDPotency[1].MP - (sets.MaxMP.neckMP - 0)
    -- MP:957 | MND +18 | Enfeebling Skill +22 --
    sets.midcast.EMNDPotency[3] = set_combine(sets.midcast.EMNDPotency[2],{hands="Dvt. Mitts +1"})
    sets.midcast.EMNDPotency[3].MP = sets.midcast.EMNDPotency[2].MP - (sets.MaxMP.handsMP - 9)
    -- MP:907 | MND +28 | Enfeebling Skill +22 --
    sets.midcast.EMNDPotency[4] = set_combine(sets.midcast.EMNDPotency[3],{body="Errant Hpl."})
    sets.midcast.EMNDPotency[4].MP = sets.midcast.EMNDPotency[3].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:882 | MND +33 | Enfeebling Skill +22 --
    sets.midcast.EMNDPotency[5] = set_combine(sets.midcast.EMNDPotency[4],{rring="Aqua Ring"})
    sets.midcast.EMNDPotency[5].MP = sets.midcast.EMNDPotency[4].MP - (sets.MaxMP.rringMP - 0)
    -- MP:862 | MND +37 | Enfeebling Skill +22 --
    sets.midcast.EMNDPotency[6] = set_combine(sets.midcast.EMNDPotency[5],{back="Prism Cape"})
    sets.midcast.EMNDPotency[6].MP = sets.midcast.EMNDPotency[5].MP - (sets.MaxMP.backMP - 10)
    -- MP:830 | MND +42 | Enfeebling Skill +22 --
    sets.midcast.EMNDPotency[7] = set_combine(sets.midcast.EMNDPotency[6],{legs="Mahatma Slops"})
    sets.midcast.EMNDPotency[7].MP = sets.midcast.EMNDPotency[6].MP - (sets.MaxMP.legsMP - 0)
    -- MP:782 | MND +47 | Enfeebling Skill +22 --
    sets.midcast.EMNDPotency[8] = set_combine(sets.midcast.EMNDPotency[7],{waist="Penitent's Rope"})
    sets.midcast.EMNDPotency[8].MP = sets.midcast.EMNDPotency[7].MP - (sets.MaxMP.waistMP - 0)
    -- MP:732 | MND +52 | Enfeebling Skill +22 --
    sets.midcast.EMNDPotency[9] = set_combine(sets.midcast.EMNDPotency[8],{lring="Aqua Ring"})
    sets.midcast.EMNDPotency[9].MP = sets.midcast.EMNDPotency[8].MP - (sets.MaxMP.lringMP - 0)
    -- MP:707 | MND +54 | Enfeebling Skill +22 --
    sets.midcast.EMNDPotency[10]= set_combine(sets.midcast.EMNDPotency[9],{ear1="Cmn. Earring"})
    sets.midcast.EMNDPotency[10].MP= sets.midcast.EMNDPotency[9].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:677 | MND +56 | Enfeebling Skill +22 --
    sets.midcast.EMNDPotency[11]= set_combine(sets.midcast.EMNDPotency[10],{ear2="Cmn. Earring"})
    sets.midcast.EMNDPotency[11].MP= sets.midcast.EMNDPotency[10].MP- (sets.MaxMP.ear2MP - 0)
    -- MP:647 | MND +57 | Enfeebling Skill +22 --
    sets.midcast.EMNDPotency[12]= set_combine(sets.midcast.EMNDPotency[11],{ammo="Jasper Tathlum"})
    sets.midcast.EMNDPotency[12].MP= sets.midcast.EMNDPotency[11].MP- (sets.MaxMP.ammoMP - 0)


-------------------------------
--        #Enhancing         --
--         Enhancing         --
--                           --
-------------------------------
	-- sets.Weapons.Earth used in main slot when not in melee mode
    --MP:1012 | Enhancing Skill +15 | PDT -20% --
    sets.midcast.Enhancing[0] = set_combine(sets.MaxMP,               {hands="Dls. Gloves +1"})
    sets.midcast.Enhancing[0].MP = sets.MaxMP.MP                - (sets.MaxMP.handsMP - 23)
    -- MP:993 | Enhancing Skill +30 | PDT -20% --
    sets.midcast.Enhancing[1] = set_combine(sets.midcast.Enhancing[0],{legs="Warlock's Tights"})
    sets.midcast.Enhancing[1].MP = sets.midcast.Enhancing[0].MP - (sets.MaxMP.legsMP - 13)
    -- MP:988 | Enhancing Skill +35 | PDT -20% --
    sets.midcast.Enhancing[2] = set_combine(sets.midcast.Enhancing[1],{back="Merciful Cape"})
    sets.midcast.Enhancing[2].MP = sets.midcast.Enhancing[1].MP - (sets.MaxMP.backMP - 25)
    -- MP:966 | Enhancing Skill +42 | PDT -20% --
    sets.midcast.Enhancing[3] = set_combine(sets.midcast.Enhancing[2],{neck="Enhancing Torque"})
    sets.midcast.Enhancing[3].MP = sets.midcast.Enhancing[2].MP - (sets.MaxMP.neckMP - 0)
    -- MP:916 | Enhancing Skill +45 | PDT -20% --
    sets.midcast.Enhancing[4] = set_combine(sets.midcast.Enhancing[3],{body="Glamor Jupon"})
    sets.midcast.Enhancing[4].MP = sets.midcast.Enhancing[3].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:891 | Enhancing Skill +45 | PDT -25% --
    sets.midcast.Enhancing[5] = set_combine(sets.midcast.Enhancing[4],{rring="Jelly Ring"})
    sets.midcast.Enhancing[5].MP = sets.midcast.Enhancing[4].MP - (sets.MaxMP.rringMP - 0)
    -- MP:869 | Enhancing Skill +45 | PDT -25% --
    sets.midcast.Enhancing[6] = set_combine(sets.midcast.Enhancing[5],{feet="Dst. Leggings +1"})
    sets.midcast.Enhancing[6].MP = sets.midcast.Enhancing[5].MP - (sets.MaxMP.feetMP - 0)
    -- MP:839 | Enhancing Skill +45 | PDT -25% --
    sets.midcast.Enhancing[7] = set_combine(sets.midcast.Enhancing[6],{head="Darksteel Cap +1"})
    sets.midcast.Enhancing[7].MP = sets.midcast.Enhancing[6].MP - (sets.MaxMP.headMP - 0)
    

-------------------------------
--         #NINTMacc         --
--         Elemental         --
--           MAcc            --
-------------------------------
    --MP:1004 | INT +11 | Elemental Skill +10 --
    sets.midcast.NINTMacc[0] = set_combine(sets.MaxMP,              {head="Wlk. Chapeau +1"})
    sets.midcast.NINTMacc[0].MP = sets.MaxMP.MP               - (sets.MaxMP.headMP - 25)
    -- MP:988 | INT +11 | Elemental Skill +20 --
    sets.midcast.NINTMacc[1] = set_combine(sets.midcast.NINTMacc[0],{legs="Duelist's Tights"})
    sets.midcast.NINTMacc[1].MP = sets.midcast.NINTMacc[0].MP - (sets.MaxMP.legsMP - 16)
    -- MP:966 | INT +11 | Elemental Skill +27 --
    sets.midcast.NINTMacc[2] = set_combine(sets.midcast.NINTMacc[1],{neck="Elemental Torque"})
    sets.midcast.NINTMacc[2].MP = sets.midcast.NINTMacc[1].MP - (sets.MaxMP.neckMP - 0)
    -- MP:961 | INT +11 | Elemental Skill +32--
    sets.midcast.NINTMacc[3] = set_combine(sets.midcast.NINTMacc[2],{back="Merciful Cape"})
    sets.midcast.NINTMacc[3].MP = sets.midcast.NINTMacc[2].MP - (sets.MaxMP.neckMP - 25)
    -- MP:911 | INT +21 | Elemental Skill +32 --
    sets.midcast.NINTMacc[4] = set_combine(sets.midcast.NINTMacc[3],{body="Errant Hpl."})
    sets.midcast.NINTMacc[4].MP = sets.midcast.NINTMacc[3].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:888 | INT +25 | Elemental Skill +32 | MAcc + 2 --
    sets.midcast.NINTMacc[5] = set_combine(sets.midcast.NINTMacc[4],{feet="Goliard Clogs"})
    sets.midcast.NINTMacc[5].MP = sets.midcast.NINTMacc[4].MP - (sets.MaxMP.feetMP - 0)
    -- MP:838 | INT +25 | Elemental Skill +32 | MAB +5 | MAcc + 7 --
    sets.midcast.NINTMacc[6] = set_combine(sets.midcast.NINTMacc[5],{ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.midcast.NINTMacc[6].MP = sets.midcast.NINTMacc[5].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    -- MP:813 | INT +30 | Elemental Skill +32 | MAB +5 | MAcc + 7 --
    sets.midcast.NINTMacc[7] = set_combine(sets.midcast.NINTMacc[6],{rring="Snow Ring"})
    sets.midcast.NINTMacc[7].MP = sets.midcast.NINTMacc[6].MP - (sets.MaxMP.rringMP - 0)
    -- MP:793 | INT +25 | Elemental Skill +32 | MAB +9 | MAcc +11 --
    sets.midcast.NINTMacc[8] = set_combine(sets.midcast.NINTMacc[7],{hands="Goliard Cuffs"})
    sets.midcast.NINTMacc[8].MP = sets.midcast.NINTMacc[7].MP - (sets.MaxMP.handsMP - 0)
    -- MP:745 | INT +30 | Elemental Skill +32 | MAB +9 | MAcc +11 --
    sets.midcast.NINTMacc[9] = set_combine(sets.midcast.NINTMacc[8],{waist="Penitent's Rope"})
    sets.midcast.NINTMacc[9].MP = sets.midcast.NINTMacc[8].MP - (sets.MaxMP.waistMP - 0)
    -- MP:695 | INT +35 | Elemental Skill +32 | MAB +9 | MAcc +11 --
    sets.midcast.NINTMacc[10]= set_combine(sets.midcast.NINTMacc[9],{lring="Snow Ring"})
    sets.midcast.NINTMacc[10].MP= sets.midcast.NINTMacc[9].MP- (sets.MaxMP.lringMP - 0)
    -- MP:675 | INT +37 | Elemental Skill +32 | MAB +9 | MAcc +11 --
    sets.midcast.NINTMacc[11]= set_combine(sets.midcast.NINTMacc[10],{ammo="Phantom Tathlum"})
    sets.midcast.NINTMacc[11].MP= sets.midcast.NINTMacc[10].MP- (sets.MaxMP.ammoMP - 10)


-------------------------------
--       #ObiNINTMacc        --
--         Elemental         --
--         MAcc Obi          --
-------------------------------
    --MP:1004 | INT +11 | Elemental Skill +10 --
    sets.midcast.NINTMaccObi[0] = set_combine(sets.MaxMP,                 {head="Wlk. Chapeau +1"})
    sets.midcast.NINTMaccObi[0].MP = sets.MaxMP.MP                  - (sets.MaxMP.headMP - 25)
    -- MP:988 | INT +11 | Elemental Skill +20 --
    sets.midcast.NINTMaccObi[1] = set_combine(sets.midcast.NINTMaccObi[0],{legs="Duelist's Tights"})
    sets.midcast.NINTMaccObi[1].MP = sets.midcast.NINTMaccObi[0].MP - (sets.MaxMP.legsMP - 16)
    -- MP:966 | INT +11 | Elemental Skill +27 --
    sets.midcast.NINTMaccObi[2] = set_combine(sets.midcast.NINTMaccObi[1],{neck="Elemental Torque"})
    sets.midcast.NINTMaccObi[2].MP = sets.midcast.NINTMaccObi[1].MP - (sets.MaxMP.neckMP - 0)
    -- MP:961 | INT +11 | Elemental Skill +32 --
    sets.midcast.NINTMaccObi[3] = set_combine(sets.midcast.NINTMaccObi[2],{back="Merciful Cape"})
    sets.midcast.NINTMaccObi[3].MP = sets.midcast.NINTMaccObi[2].MP - (sets.MaxMP.backMP - 25)
    -- MP:913 | INT +11 | Elemental Skill +32 --
    sets.midcast.NINTMaccObi[4] = set_combine(sets.midcast.NINTMaccObi[3],{waist="Penitent's Rope"})
    sets.midcast.NINTMaccObi[4].MP = sets.midcast.NINTMaccObi[3].MP - (sets.MaxMP.waistMP - 0)
    -- MP:863 | INT +21 | Elemental Skill +32 --
    sets.midcast.NINTMaccObi[5] = set_combine(sets.midcast.NINTMaccObi[4],{body="Errant Hpl."})
    sets.midcast.NINTMaccObi[5].MP = sets.midcast.NINTMaccObi[4].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:840 | INT +25 | Elemental Skill +32 | MAcc + 2 --
    sets.midcast.NINTMaccObi[6] = set_combine(sets.midcast.NINTMaccObi[5],{feet="Goliard Clogs"})
    sets.midcast.NINTMaccObi[6].MP = sets.midcast.NINTMaccObi[5].MP - (sets.MaxMP.feetMP - 0)
    -- MP:790 | INT +25 | Elemental Skill +32 | MAB +5 | MAcc + 7 --
    sets.midcast.NINTMaccObi[7] = set_combine(sets.midcast.NINTMaccObi[6],{ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.midcast.NINTMaccObi[7].MP = sets.midcast.NINTMaccObi[6].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    -- MP:765 | INT +30 | Elemental Skill +32 | MAB +5 | MAcc + 7 --
    sets.midcast.NINTMaccObi[8] = set_combine(sets.midcast.NINTMaccObi[7],{rring="Snow Ring"})
    sets.midcast.NINTMaccObi[8].MP = sets.midcast.NINTMaccObi[7].MP - (sets.MaxMP.rringMP - 0)
    -- MP:745 | INT +25 | Elemental Skill +32 | MAB +9 | MAcc +11 --
    sets.midcast.NINTMaccObi[9] = set_combine(sets.midcast.NINTMaccObi[8],{hands="Goliard Cuffs"})
    sets.midcast.NINTMaccObi[9].MP = sets.midcast.NINTMaccObi[8].MP - (sets.MaxMP.handsMP - 0)
    -- MP:695 | INT +30 | Elemental Skill +32 | MAB +9 | MAcc +11 --
    sets.midcast.NINTMaccObi[10]= set_combine(sets.midcast.NINTMaccObi[9],{lring="Snow Ring"})
    sets.midcast.NINTMaccObi[10].MP= sets.midcast.NINTMaccObi[9].MP- (sets.MaxMP.lringMP - 0)
    -- MP:675 | INT +32 | Elemental Skill +32 | MAB +9 | MAcc +11 --
    sets.midcast.NINTMaccObi[11]= set_combine(sets.midcast.NINTMaccObi[10],{ammo="Phantom Tathlum"})
    sets.midcast.NINTMaccObi[11].MP= sets.midcast.NINTMaccObi[10].MP- (sets.MaxMP.ammoMP - 10)


-------------------------------
--       #NINTPotency        --
--         Elemental         --
--          Potency          --
-------------------------------
    --MP:1004 | INT +11 | Elemental Skill +10 --
    sets.midcast.NINTPotency[0] = set_combine(sets.MaxMP,                 {head="Wlk. Chapeau +1"})
    sets.midcast.NINTPotency[0].MP = sets.MaxMP.MP                  - (sets.MaxMP.headMP - 25)
    -- MP:988 | INT +11 | Elemental Skill +20 --
    sets.midcast.NINTPotency[1] = set_combine(sets.midcast.NINTPotency[0],{legs="Duelist's Tights"})
    sets.midcast.NINTPotency[1].MP = sets.midcast.NINTPotency[0].MP - (sets.MaxMP.legsMP - 16)
    -- MP:938 | INT +21 | Elemental Skill +20 --
    sets.midcast.NINTPotency[2] = set_combine(sets.midcast.NINTPotency[1],{body="Errant Hpl."})
    sets.midcast.NINTPotency[2].MP = sets.midcast.NINTPotency[1].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:930 | INT +21 | Elemental Skill +20 | MAB + 4 --
    sets.midcast.NINTPotency[3] = set_combine(sets.midcast.NINTPotency[2],{feet="Duelist's Boots"})
    sets.midcast.NINTPotency[3].MP = sets.midcast.NINTPotency[2].MP - (sets.MaxMP.feetMP - 15)
    -- MP:920 | INT +23 | Elemental Skill +20 | MAB + 5 --
    sets.midcast.NINTPotency[4] = set_combine(sets.midcast.NINTPotency[3],{neck="Solon Torque"})
    sets.midcast.NINTPotency[4].MP = sets.midcast.NINTPotency[3].MP - (sets.MaxMP.neckMP - 12)
    -- MP:895 | INT +23 | Elemental Skill +20 | MAB +10 --
    sets.midcast.NINTPotency[5] = set_combine(sets.midcast.NINTPotency[4],{ear1="Moldavite Earring"})
    sets.midcast.NINTPotency[5].MP = sets.midcast.NINTPotency[4].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:870 | INT +28 | Elemental Skill +20 | MAB +10 --
    sets.midcast.NINTPotency[6] = set_combine(sets.midcast.NINTPotency[5],{rring="Snow Ring"})
    sets.midcast.NINTPotency[6].MP = sets.midcast.NINTPotency[5].MP - (sets.MaxMP.rringMP - 0)
    -- MP:850 | INT +32 | Elemental Skill +20 | MAB +10 --
    sets.midcast.NINTPotency[7] = set_combine(sets.midcast.NINTPotency[6],{back="Prism Cape"})
    sets.midcast.NINTPotency[7].MP = sets.midcast.NINTPotency[6].MP - (sets.MaxMP.backMP - 10)
    -- MP:830 | INT +27 | Elemental Skill +20 | MAB +14 | MAcc +4 --
    sets.midcast.NINTPotency[8] = set_combine(sets.midcast.NINTPotency[7],{hands="Goliard Cuffs"})
    sets.midcast.NINTPotency[8].MP = sets.midcast.NINTPotency[7].MP - (sets.MaxMP.handsMP - 0)
    -- MP:782 | INT +32 | Elemental Skill +20 | MAB +14 | MAcc +4 --
    sets.midcast.NINTPotency[9] = set_combine(sets.midcast.NINTPotency[8],{waist="Penitent's Rope"})
    sets.midcast.NINTPotency[9].MP = sets.midcast.NINTPotency[8].MP - (sets.MaxMP.waistMP - 0)
    -- MP:732 | INT +37 | Elemental Skill +20 | MAB +14 | MAcc +4 --
    sets.midcast.NINTPotency[10]= set_combine(sets.midcast.NINTPotency[9],{lring="Snow Ring"})
    sets.midcast.NINTPotency[10].MP= sets.midcast.NINTPotency[9].MP- (sets.MaxMP.lringMP - 0)
    -- MP:712 | INT +39 | Elemental Skill +20 | MAB +14 | MAcc +4 --
    sets.midcast.NINTPotency[11]= set_combine(sets.midcast.NINTPotency[10],{ammo="Phantom Tathlum"})
    sets.midcast.NINTPotency[11].MP= sets.midcast.NINTPotency[10].MP- (sets.MaxMP.ammoMP - 10)
    -- MP:687 | INT +41 | Elemental Skill +20 | MAB +14 | MAcc +4 --
    sets.midcast.NINTPotency[12]= set_combine(sets.midcast.NINTPotency[11],{ear2="Morion Earring +1"})
    sets.midcast.NINTPotency[12].MP= sets.midcast.NINTPotency[11].MP- (sets.MaxMP.ear2MP - 5)
    -- MP:695 | INT +39 | Elemental Skill +20 | MAB +21 | MAcc +4 --
    sets.midcast.NINTPotency[13]= set_combine(sets.midcast.NINTPotency[12],{neck="Uggalepih Pendant"})
    sets.midcast.NINTPotency[13].MP= sets.midcast.NINTPotency[12].MP- (12 - 20) -- Second Neck Swap


-------------------------------
--      #ObiNINTPotency      --
--         Elemental         --
--        Potency Obi        --
-------------------------------
    --MP:1004 | INT +11 | Elemental Skill +10 --
    sets.midcast.NINTPotencyObi[0] = set_combine(sets.MaxMP,                    {head="Wlk. Chapeau +1"})
    sets.midcast.NINTPotencyObi[0].MP = sets.MaxMP.MP                     - (sets.MaxMP.headMP - 25)
    -- MP:988 | INT +11 | Elemental Skill +20 --
    sets.midcast.NINTPotencyObi[1] = set_combine(sets.midcast.NINTPotencyObi[0],{legs="Duelist's Tights"})
    sets.midcast.NINTPotencyObi[1].MP = sets.midcast.NINTPotencyObi[0].MP - (sets.MaxMP.legsMP - 16)
    -- MP:940 | INT +16 | Elemental Skill +20 | MAB +10 --
    sets.midcast.NINTPotencyObi[2] = set_combine(sets.midcast.NINTPotencyObi[1],{waist="Penitent's Rope"})
    sets.midcast.NINTPotencyObi[2].MP = sets.midcast.NINTPotencyObi[1].MP - (sets.MaxMP.waistMP - 0)
    -- MP:890 | INT +26 | Elemental Skill +20 --
    sets.midcast.NINTPotencyObi[3] = set_combine(sets.midcast.NINTPotencyObi[2],{body="Errant Hpl."})
    sets.midcast.NINTPotencyObi[3].MP = sets.midcast.NINTPotencyObi[2].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:882 | INT +26 | Elemental Skill +20 | MAB + 4 --
    sets.midcast.NINTPotencyObi[4] = set_combine(sets.midcast.NINTPotencyObi[3],{feet="Duelist's Boots"})
    sets.midcast.NINTPotencyObi[4].MP = sets.midcast.NINTPotencyObi[3].MP - (sets.MaxMP.feetMP - 15)
    -- MP:872 | INT +28 | Elemental Skill +20 | MAB + 5 --
    sets.midcast.NINTPotencyObi[5] = set_combine(sets.midcast.NINTPotencyObi[4],{neck="Solon Torque"})
    sets.midcast.NINTPotencyObi[5].MP = sets.midcast.NINTPotencyObi[4].MP - (sets.MaxMP.neckMP - 12)
    -- MP:847 | INT +28 | Elemental Skill +20 | MAB +10 --
    sets.midcast.NINTPotencyObi[6] = set_combine(sets.midcast.NINTPotencyObi[5],{ear1="Moldavite Earring"})
    sets.midcast.NINTPotencyObi[6].MP = sets.midcast.NINTPotencyObi[5].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:822 | INT +33 | Elemental Skill +20 | MAB +10 --
    sets.midcast.NINTPotencyObi[7] = set_combine(sets.midcast.NINTPotencyObi[6],{rring="Snow Ring"})
    sets.midcast.NINTPotencyObi[7].MP = sets.midcast.NINTPotencyObi[6].MP - (sets.MaxMP.rringMP - 0)
    -- MP:802 | INT +27 | Elemental Skill +20 | MAB +14 | MAcc +4 --
    sets.midcast.NINTPotencyObi[8] = set_combine(sets.midcast.NINTPotencyObi[7],{hands="Goliard Cuffs"})
    sets.midcast.NINTPotencyObi[8].MP = sets.midcast.NINTPotencyObi[7].MP - (sets.MaxMP.handsMP - 0)
    -- MP:782 | INT +37 | Elemental Skill +20 | MAB +14 | MAcc +4 --
    sets.midcast.NINTPotencyObi[9] = set_combine(sets.midcast.NINTPotencyObi[8],{back="Prism Cape"})
    sets.midcast.NINTPotencyObi[9].MP = sets.midcast.NINTPotencyObi[8].MP - (sets.MaxMP.backMP - 10)
    -- MP:732 | INT +42 | Elemental Skill +20 | MAB +14 | MAcc +4 --
    sets.midcast.NINTPotencyObi[10]= set_combine(sets.midcast.NINTPotencyObi[9],{lring="Snow Ring"})
    sets.midcast.NINTPotencyObi[10].MP= sets.midcast.NINTPotencyObi[9].MP - (sets.MaxMP.lringMP - 0)
    -- MP:712 | INT +44 | Elemental Skill +20 | MAB +14 | MAcc +4 --
    sets.midcast.NINTPotencyObi[11]= set_combine(sets.midcast.NINTPotencyObi[10],{ammo="Phantom Tathlum"})
    sets.midcast.NINTPotencyObi[11].MP= sets.midcast.NINTPotencyObi[10].MP- (sets.MaxMP.ammoMP - 10)
    -- MP:687 | INT +46 | Elemental Skill +20 | MAB +14 | MAcc +4 --
    sets.midcast.NINTPotencyObi[12]= set_combine(sets.midcast.NINTPotencyObi[11],{ear2="Morion Earring +1"})
    sets.midcast.NINTPotencyObi[12].MP= sets.midcast.NINTPotencyObi[11].MP- (sets.MaxMP.ear2MP - 5)
    -- MP:695 | INT +44 | Elemental Skill +20 | MAB +21 | MAcc +4 --
    sets.midcast.NINTPotencyObi[13]= set_combine(sets.midcast.NINTPotencyObi[12],{neck="Uggalepih Pendant"})
    sets.midcast.NINTPotencyObi[13].MP= sets.midcast.NINTPotencyObi[12].MP- (12 - 20) -- Second Neck Swap


-------------------------------
--           #HMND           --
--          Healing          --
--                           --
-------------------------------
    --MP:1006 | MND +11 | Enmity - 5 | Haste 5% --
    sets.midcast.HMND[0] = set_combine(sets.MaxMP,          {hands="Errant Cuffs",
                                                             legs="Custom Slacks",
                                                             feet="Errant Pigaches"})
    sets.midcast.HMND[0].MP = sets.MaxMP.MP - (sets.MaxMP.handsMP - 20) - (sets.MaxMP.legsMP - 32) - (sets.MaxMP.feetMP - 20)
    -- MP:998 | MND +11 | Enmity -10 | Haste 9% --
    sets.midcast.HMND[1] = set_combine(sets.midcast.HMND[0],{body="Goliard Saio"})
    sets.midcast.HMND[1].MP = sets.midcast.HMND[0].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:968 | MND +11 | Enmity -15 | Haste 6% --
    sets.midcast.HMND[2] = set_combine(sets.midcast.HMND[1],{head="Nashira Turban"})
    sets.midcast.HMND[2].MP = sets.midcast.HMND[1].MP - (sets.MaxMP.headMP - 0)
    -- MP:936 | MND +16 | Enmity -19 | Haste 6% --
    sets.midcast.HMND[3] = set_combine(sets.midcast.HMND[2],{legs="Mahatma Slops"})
    sets.midcast.HMND[3].MP = sets.midcast.HMND[2].MP - (sets.MaxMP.legsMP - 0)
    -- MP:916 | MND +16 | Enmity -21 | Haste 7% --
    sets.midcast.HMND[4] = set_combine(sets.midcast.HMND[3],{hands="Nashira Gages"})
    sets.midcast.HMND[4].MP = sets.midcast.HMND[3].MP - (20 - 0) -- Second Hands Swap
    -- MP:868 | MND +21 | Enmity -24 | Haste 7% --
    sets.midcast.HMND[5] = set_combine(sets.midcast.HMND[4],{waist="Penitent's Rope"})
    sets.midcast.HMND[5].MP = sets.midcast.HMND[4].MP - (sets.MaxMP.waistMP - 0)
    -- MP:848 | MND +25 | Enmity -24 | Haste 7% --
    sets.midcast.HMND[6] = set_combine(sets.midcast.HMND[5],{back="Prism Cape"})
    sets.midcast.HMND[6].MP = sets.midcast.HMND[5].MP - (sets.MaxMP.backMP - 10)
    -- MP:823 | MND +30 | Enmity -24 | Haste 7% --
    sets.midcast.HMND[7] = set_combine(sets.midcast.HMND[6],{rring="Aqua Ring"})
    sets.midcast.HMND[7].MP = sets.midcast.HMND[6].MP - (sets.MaxMP.rringMP - 0)
    -- MP:801 | MND +35 | Enmity -24 | Haste 7% --
    sets.midcast.HMND[8] = set_combine(sets.midcast.HMND[7],{neck="Faith Torque"})
    sets.midcast.HMND[8].MP = sets.midcast.HMND[7].MP - (sets.MaxMP.neckMP - 0)
    -- MP:751 | MND +40 | Enmity -24 | Haste 7% --
    sets.midcast.HMND[9] = set_combine(sets.midcast.HMND[8],{lring="Aqua Ring"})
    sets.midcast.HMND[9].MP = sets.midcast.HMND[8].MP - (sets.MaxMP.lringMP - 0)
    -- MP:726 | MND +42 | Enmity -24 | Haste 7% --
    sets.midcast.HMND[10]= set_combine(sets.midcast.HMND[9],{ear1="Cmn. Earring"})
    sets.midcast.HMND[10].MP= sets.midcast.HMND[9].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:696 | MND +44 | Enmity -24 | Haste 7% --
    sets.midcast.HMND[11]= set_combine(sets.midcast.HMND[10],{ear2="Cmn. Earring"})
    sets.midcast.HMND[11].MP= sets.midcast.HMND[10].MP- (sets.MaxMP.ear2MP - 0)


-------------------------------
--        #Stoneskin         --
--         Stoneskin         --
--                           --
-------------------------------
	-- sets.Weapons.Earth used in main slot when not in melee mode
    -- MP:999 | MND + 0 | Enhancing Skill +15 | Haste + 9% --
    sets.midcast.Stoneskin[0] = set_combine(sets.MaxMP,               {body="Goliard Saio"})
    sets.midcast.Stoneskin[0].MP = sets.MaxMP.MP                - (sets.MaxMP.bodyMP - 42)
    -- MP:974 | MND + 5 | Enhancing Skill +15 | Haste + 9% --
    sets.midcast.Stoneskin[1] = set_combine(sets.midcast.Stoneskin[0],{rring="Aqua Ring"})
    sets.midcast.Stoneskin[1].MP = sets.midcast.Stoneskin[0].MP - (sets.MaxMP.rringMP - 0)
    -- MP:947 | MND + 7 | Enhancing Skill +15 | Haste +12% --
    sets.midcast.Stoneskin[2] = set_combine(sets.midcast.Stoneskin[1],{legs="Tatsu. Sitagoromo"})
    sets.midcast.Stoneskin[2].MP = sets.midcast.Stoneskin[1].MP - (sets.MaxMP.legsMP - 0)
    -- MP:924 | MND + 7 | Enhancing Skill + 0 | Haste +15% --
    sets.midcast.Stoneskin[3] = set_combine(sets.midcast.Stoneskin[2],{hands="Dusk Gloves"})
    sets.midcast.Stoneskin[3].MP = sets.midcast.Stoneskin[2].MP - (sets.MaxMP.handsMP - 0)
    -- MP:904 | MND +11 | Enhancing Skill + 0 | Haste +15% --
    sets.midcast.Stoneskin[4] = set_combine(sets.midcast.Stoneskin[3],{back="Prism Cape"})
    sets.midcast.Stoneskin[4].MP = sets.midcast.Stoneskin[3].MP - (sets.MaxMP.backMP - 10)
    -- MP:881 | MND +11 | Enhancing Skill + 0 | Haste +17% --
    sets.midcast.Stoneskin[5] = set_combine(sets.midcast.Stoneskin[4],{feet="Dusk Ledelsens"})
    sets.midcast.Stoneskin[5].MP = sets.midcast.Stoneskin[4].MP - (sets.MaxMP.feetMP - 0)
    -- MP:859 | MND +16 | Enhancing Skill + 0 | Haste +17% --
    sets.midcast.Stoneskin[6] = set_combine(sets.midcast.Stoneskin[5],{neck="Faith Torque"})
    sets.midcast.Stoneskin[6].MP = sets.midcast.Stoneskin[5].MP - (sets.MaxMP.neckMP - 0)
    -- MP:809 | MND +21 | Enhancing Skill + 0 | Haste +17% --
    sets.midcast.Stoneskin[7] = set_combine(sets.midcast.Stoneskin[6],{lring="Aqua Ring"})
    sets.midcast.Stoneskin[7].MP = sets.midcast.Stoneskin[6].MP - (sets.MaxMP.lringMP - 0)
    -- MP:761 | MND +21 | Enhancing Skill + 0 | Haste +23% --
    sets.midcast.Stoneskin[8] = set_combine(sets.midcast.Stoneskin[7],{waist="Speed Belt"})
    sets.midcast.Stoneskin[8].MP = sets.midcast.Stoneskin[7].MP - (sets.MaxMP.waistMP - 0)
    -- MP:736 | MND +23 | Enhancing Skill + 0 | Haste +23% --
    sets.midcast.Stoneskin[9] = set_combine(sets.midcast.Stoneskin[8],{ear1="Cmn. Earring"})
    sets.midcast.Stoneskin[9].MP = sets.midcast.Stoneskin[8].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:706 | MND +25 | Enhancing Skill + 0 | Haste +23% --
    sets.midcast.Stoneskin[10]= set_combine(sets.midcast.Stoneskin[9],{ear2="Cmn. Earring"})
    sets.midcast.Stoneskin[10].MP= sets.midcast.Stoneskin[9].MP- (sets.MaxMP.ear2MP - 0)
    -- MP:676 | MND +26 | Enhancing Skill + 0 | Haste +23% --
    sets.midcast.Stoneskin[11]= set_combine(sets.midcast.Stoneskin[10],{ammo="Jasper Tathlum"})
    sets.midcast.Stoneskin[11].MP= sets.midcast.Stoneskin[10].MP- (sets.MaxMP.ammoMP - 0)


-------------------------------
--           #CHA            --
--         Charisma          --
--                           --
-------------------------------
    --MP:1006 | CHA + 1 | Enmity - 5 | Haste 5% --
    sets.midcast.CHA[0] = set_combine(sets.MaxMP,           {hands="Errant Cuffs",
                                                             feet="Errant Pigaches"})
    sets.midcast.CHA[0].MP = sets.MaxMP.MP - (sets.MaxMP.handsMP - 20) - (sets.MaxMP.feetMP - 20)
    -- MP:956 | CHA +11 | Enmity - 8 | Haste 5% --
    sets.midcast.CHA[1] = set_combine(sets.midcast.CHA[0],{body="Errant Hpl."})
    sets.midcast.CHA[1].MP = sets.midcast.CHA[0].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:946 | CHA +16 | Enmity -12 | Haste 0% --
    sets.midcast.CHA[2] = set_combine(sets.midcast.CHA[1],{head="Goliard Chapeau"})
    sets.midcast.CHA[2].MP = sets.midcast.CHA[1].MP - (sets.MaxMP.headMP - 20)
    -- MP:914 | CHA +23 | Enmity -16 | Haste 0% --
    sets.midcast.CHA[3] = set_combine(sets.midcast.CHA[2],{legs="Mahatma Slops"})
    sets.midcast.CHA[3].MP = sets.midcast.CHA[2].MP - (sets.MaxMP.legsMP - 0)
    -- MP:894 | CHA +23 | Enmity -18 | Haste 1% --
    sets.midcast.CHA[4] = set_combine(sets.midcast.CHA[3],{hands="Nashira Gages"})
    sets.midcast.CHA[4].MP = sets.midcast.CHA[3].MP - (20 - 0) -- Second Hands Swap
    -- MP:859 | CHA +28 | Enmity -18 | Haste 1% --
    sets.midcast.CHA[5] = set_combine(sets.midcast.CHA[4],{waist="Rainbow Obi"})
    sets.midcast.CHA[5].MP = sets.midcast.CHA[4].MP - (sets.MaxMP.waistMP - 0)
    -- MP:829 | CHA +38 | Enmity -18 | Haste 1% --
    sets.midcast.CHA[6] = set_combine(sets.midcast.CHA[5],{back="Jester's Cape +1"})
    sets.midcast.CHA[6].MP = sets.midcast.CHA[5].MP - (sets.MaxMP.backMP - 0)
    -- MP:809 | CHA +42 | Enmity -16 | Haste 1% --
    sets.midcast.CHA[7] = set_combine(sets.midcast.CHA[6],{feet="Goliard Clogs"})
    sets.midcast.CHA[7].MP = sets.midcast.CHA[6].MP - (sets.MaxMP.feetMP - 0)
    -- MP:787 | CHA +45 | Enmity -16 | Haste 1% --
    sets.midcast.CHA[8] = set_combine(sets.midcast.CHA[7],{neck="Bird Whistle"})
    sets.midcast.CHA[8].MP = sets.midcast.CHA[7].MP - (sets.MaxMP.neckMP - 0)


------------------------------
--         #Spikes          --
--          Spikes          --
--                          --
------------------------------
    --MP:1004 | INT +11 --
    sets.midcast.Spikes[0] = set_combine(sets.MaxMP,            {head="Wlk. Chapeau +1"})
    sets.midcast.Spikes[0].MP = sets.MaxMP.MP             - (sets.MaxMP.headMP - 25)
    -- MP:982 | INT +14 --
    sets.midcast.Spikes[1] = set_combine(sets.midcast.Spikes[0],{neck="Philomath Stole"})
    sets.midcast.Spikes[1].MP = sets.midcast.Spikes[0].MP - (sets.MaxMP.neckMP - 0)
    -- MP:932 | INT +24 --
    sets.midcast.Spikes[2] = set_combine(sets.midcast.Spikes[1],{body="Errant Hpl."})
    sets.midcast.Spikes[2].MP = sets.midcast.Spikes[1].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:919 | INT +28 --
    sets.midcast.Spikes[3] = set_combine(sets.midcast.Spikes[2],{feet="Goliard Clogs"})
    sets.midcast.Spikes[3].MP = sets.midcast.Spikes[2].MP - (sets.MaxMP.feetMP - 0)
    -- MP:884 | INT +33 --
    sets.midcast.Spikes[4] = set_combine(sets.midcast.Spikes[3],{rring="Snow Ring"})
    sets.midcast.Spikes[4].MP = sets.midcast.Spikes[3].MP - (sets.MaxMP.rringMP - 0)
    -- MP:852 | INT +41 --
    sets.midcast.Spikes[5] = set_combine(sets.midcast.Spikes[4],{legs="Mahatma Slops"})
    sets.midcast.Spikes[5].MP = sets.midcast.Spikes[4].MP - (sets.MaxMP.legsMP - 0)
    -- MP:832 | INT +45 --
    sets.midcast.Spikes[6] = set_combine(sets.midcast.Spikes[5],{back="Prism Cape"})
    sets.midcast.Spikes[6].MP = sets.midcast.Spikes[5].MP - (sets.MaxMP.backMP - 10)
    -- MP:784 | INT +50 --
    sets.midcast.Spikes[7] = set_combine(sets.midcast.Spikes[6],{waist="Penitent's Rope"})
    sets.midcast.Spikes[7].MP = sets.midcast.Spikes[6].MP - (sets.MaxMP.waistMP - 0)
    -- MP:734 | INT +55 --
    sets.midcast.Spikes[8] = set_combine(sets.midcast.Spikes[7],{lring="Snow Ring"})
    sets.midcast.Spikes[8].MP = sets.midcast.Spikes[7].MP - (sets.MaxMP.lringMP - 0)
    -- MP:714 | INT +57 --
    sets.midcast.Spikes[9] = set_combine(sets.midcast.Spikes[8],{ear1="Morion Earring +1"})
    sets.midcast.Spikes[9].MP = sets.midcast.Spikes[8].MP - (sets.MaxMP.ear1MP - 5)
    -- MP:688 | INT +58 --
    sets.midcast.Spikes[10]= set_combine(sets.midcast.Spikes[9],{ear2="Morion Earring"})
    sets.midcast.Spikes[10].MP= sets.midcast.Spikes[9].MP - (sets.MaxMP.ear2MP - 4)
    -- MP:668 | INT +60 --
    sets.midcast.Spikes[11]= set_combine(sets.midcast.Spikes[10],{ammo="Phantom Tathlum"})
    sets.midcast.Spikes[11].MP= sets.midcast.Spikes[10].MP- (sets.MaxMP.ammoMP - 10)
    

------------------------------
--       #EleDebuffs        --
--    Elemental Debuffs     --
--                          --
------------------------------
    --MP:1004 | INT +11 | Elemental Skill +10 --
    sets.midcast.EleDebuffs[0] = set_combine(sets.MaxMP,                {head="Wlk. Chapeau +1"})
    sets.midcast.EleDebuffs[0].MP = sets.MaxMP.MP                 - (sets.MaxMP.headMP - 25)
    -- MP:982 | INT +11 | Elemental Skill +17 --
    sets.midcast.EleDebuffs[1] = set_combine(sets.midcast.EleDebuffs[0],{neck="Elemental Torque"})
    sets.midcast.EleDebuffs[1].MP = sets.midcast.EleDebuffs[0].MP - (sets.MaxMP.neckMP - 0)
    -- MP:932 | INT +11 | Elemental Skill +27 --
    sets.midcast.EleDebuffs[2] = set_combine(sets.midcast.EleDebuffs[1],{legs="Duelist's Tights"})
    sets.midcast.EleDebuffs[2].MP = sets.midcast.EleDebuffs[1].MP - (sets.MaxMP.legsMP - 16)
    -- MP:909 | INT +15 | Elemental Skill +27 | MAcc +2 --
    sets.midcast.EleDebuffs[3] = set_combine(sets.midcast.EleDebuffs[2],{feet="Goliard Clogs"})
    sets.midcast.EleDebuffs[3].MP = sets.midcast.EleDebuffs[2].MP - (sets.MaxMP.feetMP - 0)
    -- MP:884 | INT +20 | Elemental Skill +27 | MAcc +2 --
    sets.midcast.EleDebuffs[4] = set_combine(sets.midcast.EleDebuffs[3],{rring="Snow Ring"})
    sets.midcast.EleDebuffs[4].MP = sets.midcast.EleDebuffs[3].MP - (sets.MaxMP.rringMP - 0)
    -- MP:852 | INT +38 | Elemental Skill +27 | MAcc +2 --
    sets.midcast.EleDebuffs[5] = set_combine(sets.midcast.EleDebuffs[4],{body="Errant Hpl."})
    sets.midcast.EleDebuffs[5].MP = sets.midcast.EleDebuffs[4].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:832 | INT +42 | Elemental Skill +27 | MAcc +2 --
    sets.midcast.EleDebuffs[6] = set_combine(sets.midcast.EleDebuffs[5],{back="Prism Cape"})
    sets.midcast.EleDebuffs[6].MP = sets.midcast.EleDebuffs[5].MP - (sets.MaxMP.backMP - 10)
    -- MP:784 | INT +47 | Elemental Skill +27 | MAcc +2 --
    sets.midcast.EleDebuffs[7] = set_combine(sets.midcast.EleDebuffs[6],{waist="Penitent's Rope"})
    sets.midcast.EleDebuffs[7].MP = sets.midcast.EleDebuffs[6].MP - (sets.MaxMP.waistMP - 0)
    -- MP:734 | INT +52 | Elemental Skill +27 | MAcc +2 --
    sets.midcast.EleDebuffs[8] = set_combine(sets.midcast.EleDebuffs[7],{lring="Snow Ring"})
    sets.midcast.EleDebuffs[8].MP = sets.midcast.EleDebuffs[7].MP - (sets.MaxMP.lringMP - 0)
    -- MP:714 | INT +54 | Elemental Skill +27 | MAcc +2 --
    sets.midcast.EleDebuffs[9] = set_combine(sets.midcast.EleDebuffs[8],{ear1="Morion Earring +1"})
    sets.midcast.EleDebuffs[9].MP = sets.midcast.EleDebuffs[8].MP - (sets.MaxMP.ear1MP - 5)
    -- MP:688 | INT +55 | Elemental Skill +27 | MAcc +2 --
    sets.midcast.EleDebuffs[10]= set_combine(sets.midcast.EleDebuffs[9],{ear2="Morion Earring"})
    sets.midcast.EleDebuffs[10].MP= sets.midcast.EleDebuffs[9].MP - (sets.MaxMP.ear2MP - 4)
    -- MP:668 | INT +57 | Elemental Skill +27 | MAcc +2 --
    sets.midcast.EleDebuffs[11]= set_combine(sets.midcast.EleDebuffs[10],{ammo="Phantom Tathlum"})
    sets.midcast.EleDebuffs[11].MP= sets.midcast.EleDebuffs[10].MP- (sets.MaxMP.ammoMP - 10)
    

-------------------------------
--         #Enmity           --
--          Enmity           --
--                           --
-------------------------------
	-- sets.Weapons.Enmity used in main slot when not in melee mode
    -- MP:999 | Enmity + 1 | Haste + 5% --
    sets.midcast.Enmity[0] = set_combine(sets.MaxMP,            {ear1="Hades Earring +1"})
    sets.midcast.Enmity[0].MP = sets.MaxMP.MP             - (sets.MaxMP.ear1MP - 0)
    -- MP:981 | Enmity + 3 | Haste + 5% --
    sets.midcast.Enmity[1] = set_combine(sets.midcast.Enmity[0],{ear2="Hades Earring +1"})
    sets.midcast.Enmity[1].MP = sets.midcast.Enmity[0].MP - (sets.MaxMP.ear2MP - 0)
    -- MP:960 | Enmity + 6 | Haste + 5% --
    sets.midcast.Enmity[2] = set_combine(sets.midcast.Enmity[1],{neck="Harmonia's Torque"})
    sets.midcast.Enmity[2].MP = sets.midcast.Enmity[1].MP - (sets.MaxMP.neckMP - 0)
    -- MP:936 | Enmity + 6 | Haste + 8% --
    sets.midcast.Enmity[3] = set_combine(sets.midcast.Enmity[2],{hands="Dusk Gloves"})
    sets.midcast.Enmity[3].MP = sets.midcast.Enmity[2].MP - (sets.MaxMP.handsMP - 0)
    -- MP:906 | Enmity +10 | Haste + 8% --
    sets.midcast.Enmity[4] = set_combine(sets.midcast.Enmity[3],{back="Toreador's Cape"})
    sets.midcast.Enmity[4].MP = sets.midcast.Enmity[3].MP - (sets.MaxMP.backMP - 0)
    -- MP:883 | Enmity +10 | Haste +10% --
    sets.midcast.Enmity[5] = set_combine(sets.midcast.Enmity[4],{feet="Dusk Ledelsens"})
    sets.midcast.Enmity[5].MP = sets.midcast.Enmity[4].MP - (sets.MaxMP.feetMP - 0)
    -- MP:851 | Enmity +10 | Haste +13% --
    sets.midcast.Enmity[6] = set_combine(sets.midcast.Enmity[5],{legs="Tatsu. Sitagoromo"})
    sets.midcast.Enmity[6].MP = sets.midcast.Enmity[5].MP - (sets.MaxMP.legsMP - 0)
    -- MP:826 | Enmity +12 | Haste +13% --
    sets.midcast.Enmity[7] = set_combine(sets.midcast.Enmity[6],{rring="Mermaid Ring"})
    sets.midcast.Enmity[7].MP = sets.midcast.Enmity[6].MP - (sets.MaxMP.rringMP - 0)
    -- MP:778 | Enmity +16 | Haste +13% --
    sets.midcast.Enmity[8] = set_combine(sets.midcast.Enmity[7],{waist="Trance Belt"})
    sets.midcast.Enmity[8].MP = sets.midcast.Enmity[7].MP - (sets.MaxMP.waistMP - 0)
    -- MP:748 | Enmity +18 | Haste + 8% --
    sets.midcast.Enmity[9] = set_combine(sets.midcast.Enmity[8],{head="Baron's Chapeau"})
    sets.midcast.Enmity[9].MP = sets.midcast.Enmity[8].MP - (sets.MaxMP.headMP - 0)
    -- MP:728 | Enmity +19 | Haste + 8% --
    sets.midcast.Enmity[10]= set_combine(sets.midcast.Enmity[9],{ammo="Phantom Tathlum"})
    sets.midcast.Enmity[10].MP= sets.midcast.Enmity[9].MP- (sets.MaxMP.ammoMP - 10)
    -- MP:678 | Enmity +19 | Haste + 8% | PDT + 4% --
    sets.midcast.Enmity[11]= set_combine(sets.midcast.Enmity[10],{body="Dst. Harness +1"})
    sets.midcast.Enmity[11].MP= sets.midcast.Enmity[10].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:628 | Enmity +19 | Haste + 8% | PDT + 9% --
    sets.midcast.Enmity[12]= set_combine(sets.midcast.Enmity[11],{lring="Jelly Ring"})
    sets.midcast.Enmity[12].MP= sets.midcast.Enmity[11].MP - (sets.MaxMP.lringMP - 0)
    

-------------------------------
--         #Accuracy         --
--          Accuracy         --
--                           --
-------------------------------
    -- MP:977 | Accuracy +10 --
    sets.Accuracy[0] = set_combine(sets.MaxMP,       {Head="Optical Hat"})
    sets.Accuracy[0].MP = sets.MaxMP.MP             - (sets.MaxMP.headMP - 0)
    -- MP:929 | Accuracy +22 | Attack + 4 --
    sets.Accuracy[1] = set_combine(sets.Accuracy[0], {waist="Virtuoso Belt"})
    sets.Accuracy[1].MP = sets.Accuracy[0].MP - (sets.MaxMP.waistMP - 0)
    -- MP:879 | Accuracy +34 | Attack + 4 --
    sets.Accuracy[2] = set_combine(sets.Accuracy[1], {body="Scp. Harness +1"})
    sets.Accuracy[2].MP = sets.Accuracy[1].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:852 | Accuracy +41 | Attack + 4 --
    sets.Accuracy[3] = set_combine(sets.Accuracy[2], {legs="Tatsu. Sitagoromo"})
    sets.Accuracy[3].MP = sets.Accuracy[2].MP - (sets.MaxMP.legsMP - 0)
    -- MP:830 | Accuracy +51 | Attack + 4 --
    sets.Accuracy[4] = set_combine(sets.Accuracy[3], {neck="Peacock Charm"})
    sets.Accuracy[4].MP = sets.Accuracy[3].MP - (sets.MaxMP.neckMP - 0)
    -- MP:800 | Accuracy +58 | Attack + 4 --
    sets.Accuracy[5] = set_combine(sets.Accuracy[4], {back="Beak Mantle"})
    sets.Accuracy[5].MP = sets.Accuracy[4].MP - (sets.MaxMP.backMP - 0)
    -- MP:725 | Accuracy +72 | Attack + 4 --
    sets.Accuracy[6] = set_combine(sets.Accuracy[5], {lring="Toreador's Ring", rring="Toreador's Ring"})
    sets.Accuracy[6].MP = sets.Accuracy[5].MP - (sets.MaxMP.lringMP - 0) - (sets.MaxMP.rringMP - 0)
    -- MP:702 | Accuracy +76 | Attack + 4 --
    sets.Accuracy[7] = set_combine(sets.Accuracy[6], {hands="Goliard Cuffs"})
    sets.Accuracy[7].MP = sets.Accuracy[6].MP - (sets.MaxMP.handsMP - 0)
    -- MP:679 | Accuracy +76 | DEX + 4 | Attack + 4 --
    sets.Accuracy[8] = set_combine(sets.Accuracy[7], {feet="Goliard Clogs"})
    sets.Accuracy[8].MP = sets.Accuracy[7].MP - (sets.MaxMP.feetMP - 0)
    -- MP:654 | Accuracy +76 | DEX + 4 | Attack + 4 | Sword Skill + 5 --
    sets.Accuracy[9] = set_combine(sets.Accuracy[8], {ear1="Suppanomimi"})
    sets.Accuracy[9].MP = sets.Accuracy[8].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:624 | Accuracy +77 | DEX + 4 | Attack + 2 | Sword Skill + 5 --
    sets.Accuracy[10]= set_combine(sets.Accuracy[9], {ear2="Optical Earring"})
    sets.Accuracy[10].MP= sets.Accuracy[9].MP - (sets.MaxMP.ear2MP - 0)
    -- MP:594 | Accuracy +80 | DEX + 4 | Attack + 2 | Sword Skill + 5 --
    sets.Accuracy[11]= set_combine(sets.Accuracy[10],{ammo="Astrolabe"})
    sets.Accuracy[11].MP= sets.Accuracy[10].MP- (sets.MaxMP.ammoMP - 0)
    

-------------------------------
--         #AccHaste         --
--     TP Accuracy Haste     --
--                           --
-------------------------------
    -- MP:999 | Haste  9% --
    sets.AccHaste[0] = set_combine(sets.MaxMP,       {body="Goliard Saio"})
    sets.AccHaste[0].MP = sets.MaxMP.MP       - (sets.MaxMP.bodyMP - 42)
    -- MP:972 | Haste 12% | Accuracy + 7 --
    sets.AccHaste[1] = set_combine(sets.AccHaste[0], {legs="Tatsu. Sitagoromo"})
    sets.AccHaste[1].MP = sets.AccHaste[0].MP - (sets.MaxMP.legsMP - 0)
    -- MP:949 | Haste 15% | Accuracy + 7 | Attack + 5 --
    sets.AccHaste[2] = set_combine(sets.AccHaste[1], {hands="Dusk Gloves"})
    sets.AccHaste[2].MP = sets.AccHaste[1].MP - (sets.MaxMP.handsMP - 0)
    -- MP:926 | Haste 17% | Accuracy + 7 | Attack + 9 --
    sets.AccHaste[3] = set_combine(sets.AccHaste[2], {feet="Dusk Ledelsens"})
    sets.AccHaste[3].MP = sets.AccHaste[2].MP - (sets.MaxMP.feetMP - 0)
    -- MP:878 | Haste 23% | Accuracy + 7 | Attack + 9 --
    sets.AccHaste[4] = set_combine(sets.AccHaste[3], {waist="Speed Belt"})
    sets.AccHaste[4].MP = sets.AccHaste[3].MP - (sets.MaxMP.waistMP - 0)
    -- MP:856 | Haste 23% | Accuracy +17 | Attack + 9 --
    sets.AccHaste[5] = set_combine(sets.AccHaste[4], {neck="Peacock Charm"})
    sets.AccHaste[5].MP = sets.AccHaste[4].MP - (sets.MaxMP.neckMP - 0)
    -- MP:826 | Haste 23% | Accuracy +24 | Attack + 9 --
    sets.AccHaste[6] = set_combine(sets.AccHaste[5], {back="Beak Mantle"})
    sets.AccHaste[6].MP = sets.AccHaste[5].MP - (sets.MaxMP.backMP - 0)
    -- MP:751 | Haste 23% | Accuracy +36 | Attack +15 --
    sets.AccHaste[7] = set_combine(sets.AccHaste[6], {lring="Lava's Ring", rring="Kusha's Ring"})
    sets.AccHaste[7].MP = sets.AccHaste[6].MP - (sets.MaxMP.lringMP - 0) - (sets.MaxMP.rringMP - 0)
    -- MP:726 | Haste 23% | Accuracy +36 | Attack +15 | Sword Skill + 5 --
    sets.AccHaste[8] = set_combine(sets.AccHaste[7], {ear1="Suppanomimi"})
    sets.AccHaste[8].MP = sets.AccHaste[7].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:696 | Haste 23% | Accuracy +36 | Attack +15 | Sword Skill + 5 | Double Attack +5% or Attack + 6 --
    sets.AccHaste[9] = set_combine(sets.AccHaste[8], {ear2="Merman's Earring"}) -- Hollow Earring
    sets.AccHaste[9].MP = sets.AccHaste[8].MP - (sets.MaxMP.ear2MP - 0)
    -- MP:666 | Haste 23% | Accuracy +39 | Attack +15 | Sword Skill + 5 | Double Attack +5% or Attack + 6 --
    sets.AccHaste[10]= set_combine(sets.AccHaste[9],{ammo="Astrolabe"})
    sets.AccHaste[10].MP= sets.AccHaste[9].MP - (sets.MaxMP.ammoMP - 0)
    -- MP:666 | Haste 23% | Accuracy +41 | Attack + 9 | Sword Skill + 5 | Double Attack +5% or Attack + 6 --
	
	-- These last 2 swaps are enabled/disabled by the menu --
    sets.AccHaste[11]= set_combine(sets.AccHaste[10],{rring="Toreador's Ring", lring="Toreador's Ring"})
    sets.AccHaste[11].MP= sets.AccHaste[10].MP -- no change
    -- MP:666 | Haste 19% | Accuracy +53 | Attack + 9 | Sword Skill + 5 | Double Attack +5% or Attack + 6 --
    sets.AccHaste[12]= set_combine(sets.AccHaste[11],{body="Scp. Harness +1"})
    sets.AccHaste[12].MP= sets.AccHaste[11].MP- (42 - 0) -- Second Body Swap
    

-------------------------------
--         #PDTHaste         --
--      TP Brick Haste       --
--                           --
-------------------------------
    -- MP:999 | Haste  9% --
    sets.PDTHaste[0] = set_combine(sets.MaxMP,       {body="Goliard Saio"})
    sets.PDTHaste[0].MP = sets.MaxMP.MP       - (sets.MaxMP.bodyMP - 42)
    -- MP:972 | Haste 12% | Accuracy + 7 --
    sets.PDTHaste[1] = set_combine(sets.PDTHaste[0], {legs="Tatsu. Sitagoromo"})
    sets.PDTHaste[1].MP = sets.PDTHaste[0].MP - (sets.MaxMP.legsMP - 0)
    -- MP:949 | Haste 15% | Accuracy + 7 | Attack + 5 --
    sets.PDTHaste[2] = set_combine(sets.PDTHaste[1], {hands="Dusk Gloves"})
    sets.PDTHaste[2].MP = sets.PDTHaste[1].MP - (sets.MaxMP.handsMP - 0)
    -- MP:926 | Haste 17% | Accuracy + 7 | Attack + 9 --
    sets.PDTHaste[3] = set_combine(sets.PDTHaste[2], {feet="Dusk Ledelsens"})
    sets.PDTHaste[3].MP = sets.PDTHaste[2].MP - (sets.MaxMP.feetMP - 0)
    -- MP:878 | Haste 23% | Accuracy + 7 | Attack + 9 --
    sets.PDTHaste[4] = set_combine(sets.PDTHaste[3], {waist="Speed Belt"})
    sets.PDTHaste[4].MP = sets.PDTHaste[3].MP - (sets.MaxMP.waistMP - 0)
    -- MP:856 | Haste 23% | Accuracy +17 | Attack + 9 --
    sets.PDTHaste[5] = set_combine(sets.PDTHaste[4], {neck="Peacock Charm"})
    sets.PDTHaste[5].MP = sets.PDTHaste[4].MP - (sets.MaxMP.neckMP - 0)
    -- MP:826 | Haste 23% | Accuracy +17 | Attack + 9 | PDT -6%/-12% --
    sets.PDTHaste[6] = set_combine(sets.PDTHaste[5], {back="Umbra Cape"})
    sets.PDTHaste[6].MP = sets.PDTHaste[5].MP - (sets.MaxMP.backMP - 0)
    -- MP:801 | Haste 23% | Accuracy +17 | Attack + 9 | PDT -11%/-17% --
    sets.PDTHaste[7] = set_combine(sets.PDTHaste[6], {rring="Jelly Ring"})
    sets.PDTHaste[7].MP = sets.PDTHaste[6].MP - (sets.MaxMP.rringMP - 0)
    -- MP:776 | Haste 23% | Accuracy +17 | Attack + 9 | Sword Skill + 5 | PDT -11%/-17% --
    sets.PDTHaste[8] = set_combine(sets.PDTHaste[7], {ear1="Suppanomimi"})
    sets.PDTHaste[8].MP = sets.PDTHaste[7].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:746 | Haste 23% | Accuracy +17 | Attack + 9 | Sword Skill + 5 | Double Attack +5% | PDT -11%/-17% --
    sets.PDTHaste[9] = set_combine(sets.PDTHaste[8], {ear2="Brutal Earring"})
    sets.PDTHaste[9].MP = sets.PDTHaste[8].MP - (sets.MaxMP.ear2MP - 0)
    -- MP:716 | Haste 23% | Accuracy +20 | Attack + 9 | Sword Skill + 5 | Double Attack +5% | PDT -11%/-17% --
    sets.PDTHaste[10]= set_combine(sets.PDTHaste[9],{ammo="Astrolabe"})
    sets.PDTHaste[10].MP= sets.PDTHaste[9].MP - (sets.MaxMP.ammoMP - 0)
    

-------------------------------
--         #EvaHaste         --
--      TP Evasion Haste     --
--                           --
-------------------------------
    -- MP:999 | Haste  9% --
    sets.EvaHaste[0] = set_combine(sets.MaxMP,       {body="Goliard Saio"})
    sets.EvaHaste[0].MP = sets.MaxMP.MP       - (sets.MaxMP.bodyMP - 42)
    -- MP:972 | Haste 12% | Accuracy + 7 --
    sets.EvaHaste[1] = set_combine(sets.EvaHaste[0], {legs="Tatsu. Sitagoromo"})
    sets.EvaHaste[1].MP = sets.EvaHaste[0].MP - (sets.MaxMP.legsMP - 0)
    -- MP:949 | Haste 15% | Accuracy + 7 | Attack + 5 --
    sets.EvaHaste[2] = set_combine(sets.EvaHaste[1], {hands="Dusk Gloves"})
    sets.EvaHaste[2].MP = sets.EvaHaste[1].MP - (sets.MaxMP.handsMP - 0)
    -- MP:926 | Haste 17% | Accuracy + 7 | Attack + 9 --
    sets.EvaHaste[3] = set_combine(sets.EvaHaste[2], {feet="Dusk Ledelsens"})
    sets.EvaHaste[3].MP = sets.EvaHaste[2].MP - (sets.MaxMP.feetMP - 0)
    -- MP:878 | Haste 23% | Accuracy + 7 | Attack + 9 --
    sets.EvaHaste[4] = set_combine(sets.EvaHaste[3], {waist="Speed Belt"})
    sets.EvaHaste[4].MP = sets.EvaHaste[3].MP - (sets.MaxMP.waistMP - 0)
    -- MP:848 | Haste 18% | Accuracy +17 | Attack + 9 | Evasion +10 --
    sets.EvaHaste[5] = set_combine(sets.EvaHaste[4], {head="Optical Hat"})
    sets.EvaHaste[5].MP = sets.EvaHaste[4].MP - (sets.MaxMP.headMP - 0)
    -- MP:806 | Haste 14% | Accuracy +29 | Attack + 9 | Evasion +20 --
    sets.EvaHaste[6] = set_combine(sets.EvaHaste[5], {body="Scp. Harness +1"})
    sets.EvaHaste[6].MP = sets.EvaHaste[5].MP - (42 - 0) -- Second Body Swap
    -- MP:784 | Haste 14% | Accuracy +39 | Attack + 9 | Evasion +20 --
    sets.EvaHaste[7] = set_combine(sets.EvaHaste[6],{neck="Peacock Charm"})
    sets.EvaHaste[7].MP = sets.EvaHaste[6].MP - (sets.MaxMP.neckMP - 0)
    -- MP:754 | Haste 14% | Accuracy +39 | Attack + 9 | Evasion +29 --
    sets.EvaHaste[8] = set_combine(sets.EvaHaste[7],{back="Toreador's Cape"})
    sets.EvaHaste[8].MP = sets.EvaHaste[7].MP - (sets.MaxMP.backMP - 0)
    -- MP:729 | Haste 14% | Accuracy +39 | Attack + 9 | Evasion +29 | PDT -5% --
    sets.EvaHaste[9] = set_combine(sets.EvaHaste[8],{rring="Jelly Ring"})
    sets.EvaHaste[9].MP = sets.EvaHaste[8].MP - (sets.MaxMP.rringMP - 0)
    -- MP:704 | Haste 14% | Accuracy +39 | Attack + 9 | Evasion +29 | PDT -5% | AGI +3 --
    sets.EvaHaste[10]= set_combine(sets.EvaHaste[9],{ear1="Drone Earring"})
    sets.EvaHaste[10].MP= sets.EvaHaste[9].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:674 | Haste 14% | Accuracy +39 | Attack + 9 | Evasion +29 | PDT -5% | AGI +6 --
    sets.EvaHaste[11]= set_combine(sets.EvaHaste[10],{ear2="Drone Earring"})
    sets.EvaHaste[11].MP= sets.EvaHaste[10].MP- (sets.MaxMP.ear2MP - 0)
    -- MP:644 | Haste 14% | Accuracy +42 | Attack + 9 | Evasion +29 | PDT -5% | AGI +6 --
    sets.EvaHaste[12]= set_combine(sets.EvaHaste[11],{ammo="Astrolabe"})
    sets.EvaHaste[12].MP= sets.EvaHaste[11].MP- (sets.MaxMP.ammoMP - 0)
    

-------------------------------
--        #PDTMelee          --
--         TP Brick          --
--                           --
-------------------------------
    --MP:1008 | PDT -3% --
    sets.PDTMelee[0] = set_combine(sets.MaxMP,       {legs="Goliard Trews"})
    sets.PDTMelee[0].MP = sets.MaxMP.MP       - (sets.MaxMP.legsMP - 28)
    -- MP:978 | PDT -9%/-15% --
    sets.PDTMelee[1] = set_combine(sets.PDTMelee[0], {back="Umbra Cape"})
    sets.PDTMelee[1].MP = sets.PDTMelee[0].MP - (sets.MaxMP.backMP - 0)
    -- MP:953 | PDT -14%/-20% --
    sets.PDTMelee[2] = set_combine(sets.PDTMelee[1], {rring="Jelly Ring"})
    sets.PDTMelee[2].MP = sets.PDTMelee[1].MP - (sets.MaxMP.rringMP - 0)
    -- MP:930 | PDT -16%/-22% --
    sets.PDTMelee[3] = set_combine(sets.PDTMelee[2], {hands="Dst. Mittens +1"})
    sets.PDTMelee[3].MP = sets.PDTMelee[2].MP - (sets.MaxMP.handsMP - 0)
    -- MP:907 | PDT -18%/-24% --
    sets.PDTMelee[4] = set_combine(sets.PDTMelee[3], {feet="Dst. Leggings +1"})
    sets.PDTMelee[4].MP = sets.PDTMelee[3].MP - (sets.MaxMP.feetMP - 0)
    -- MP:857 | PDT -22%/-28% --
    sets.PDTMelee[5] = set_combine(sets.PDTMelee[4], {body="Dst. Harness +1"})
    sets.PDTMelee[5].MP = sets.PDTMelee[4].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:827 | PDT -24%/-30% --
    sets.PDTMelee[6] = set_combine(sets.PDTMelee[5], {head="Darksteel Cap +1"})
    sets.PDTMelee[6].MP = sets.PDTMelee[5].MP - (sets.MaxMP.headMP - 0)
    -- MP:805 | PDT -24%/-30% | Accuracy +10 --
    sets.PDTMelee[7] = set_combine(sets.PDTMelee[6], {neck="Peacock Charm"})
    sets.PDTMelee[7].MP = sets.PDTMelee[6].MP - (sets.MaxMP.neckMP - 0)
    -- MP:757 | PDT -24%/-30% | Accuracy +22 | Attack + 4 --
    sets.PDTMelee[8] = set_combine(sets.PDTMelee[7], {waist="Virtuoso Belt"})
    sets.PDTMelee[8].MP = sets.PDTMelee[7].MP - (sets.MaxMP.waistMP - 0)
    -- MP:707 | PDT -24%/-30% | Accuracy +29 | Attack + 4 --
    sets.PDTMelee[9] = set_combine(sets.PDTMelee[8], {lring="Toreador's Ring"})
    sets.PDTMelee[9].MP = sets.PDTMelee[8].MP - (sets.MaxMP.lringMP - 0)
    -- MP:677 | PDT -24%/-30% | Accuracy +32 | Attack + 4 --
    sets.PDTMelee[10]= set_combine(sets.PDTMelee[9], {ammo="Astrolabe"})
    sets.PDTMelee[10].MP= sets.PDTMelee[9].MP - (sets.MaxMP.ammoMP - 0)
    -- MP:652 | PDT -24%/-30% | Accuracy +32 | Attack + 4 | Sword Skill + 5 --
    sets.PDTMelee[11]= set_combine(sets.PDTMelee[10],{ear1="Suppanomimi"})
    sets.PDTMelee[11].MP= sets.PDTMelee[10].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:622 | PDT -24%/-30% | Accuracy +32 | Attack + 4 | Sword Skill + 5 | Double Attack +5% --
    sets.PDTMelee[12]= set_combine(sets.PDTMelee[11],{ear2="Brutal Earring"})
    sets.PDTMelee[12].MP= sets.PDTMelee[11].MP - (sets.MaxMP.ear2MP - 0)


-------------------------------
--       #WeaponSkill        --
--      Shining Strike       --
--     40% STR / 40% MND     --
-------------------------------
    --MP:1005 | MND + 6 --
    sets.ws['Shining Strike'][0] = set_combine(sets.MaxMP,                   {feet="Errant Pigaches"})
    sets.ws['Shining Strike'][0].MP = sets.MaxMP.MP                   - (sets.MaxMP.feetMP - 20)
    -- MP:995 | MND +11 --
    sets.ws['Shining Strike'][1] = set_combine(sets.ws['Shining Strike'][0], {Head="Goliard Chapeau"})
    sets.ws['Shining Strike'][1].MP = sets.ws['Shining Strike'][0].MP - (sets.MaxMP.headMP - 20)
    -- MP:981 | MND +17 --
    sets.ws['Shining Strike'][2] = set_combine(sets.ws['Shining Strike'][1], {hands="Dvt. Mitts +1"})
    sets.ws['Shining Strike'][2].MP = sets.ws['Shining Strike'][1].MP - (sets.MaxMP.handsMP - 9)
    -- MP:956 | MND +21 | STR + 2 --
    sets.ws['Shining Strike'][3] = set_combine(sets.ws['Shining Strike'][2], {rring="Aqua Ring"})
    sets.ws['Shining Strike'][3].MP = sets.ws['Shining Strike'][2].MP - (sets.MaxMP.rringMP - 0)
    -- MP:936 | MND +25 | STR + 2 --
    sets.ws['Shining Strike'][4] = set_combine(sets.ws['Shining Strike'][3], {back="Prism Cape"})
    sets.ws['Shining Strike'][4].MP = sets.ws['Shining Strike'][3].MP - (sets.MaxMP.backMP - 10)
    -- MP:921 | MND +28 | STR + 2 --
    sets.ws['Shining Strike'][5] = set_combine(sets.ws['Shining Strike'][4], {legs="Warlock's Tights"})
    sets.ws['Shining Strike'][5].MP = sets.ws['Shining Strike'][4].MP - (sets.MaxMP.legsMP - 13)
    -- MP:899 | MND +33 | STR + 2 --
    sets.ws['Shining Strike'][6] = set_combine(sets.ws['Shining Strike'][5], {neck="Faith Torque"})
    sets.ws['Shining Strike'][6].MP = sets.ws['Shining Strike'][5].MP - (sets.MaxMP.neckMP - 0)
    -- MP:849 | MND +33 | STR + 2 | MAB + 5 | MAcc + 5 --
    sets.ws['Shining Strike'][7] = set_combine(sets.ws['Shining Strike'][6], {ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.ws['Shining Strike'][7].MP = sets.ws['Shining Strike'][6].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    -- MP:801 | MND +38 | STR + 2 | MAB + 5 | MAcc + 5 --
    sets.ws['Shining Strike'][8] = set_combine(sets.ws['Shining Strike'][7], {waist="Penitent's Rope"})
    sets.ws['Shining Strike'][8].MP = sets.ws['Shining Strike'][7].MP - (sets.MaxMP.waistMP - 0)
    -- MP:751 | MND +43 | STR + 4 | MAB + 5 | MAcc + 5 --
    sets.ws['Shining Strike'][9] = set_combine(sets.ws['Shining Strike'][8], {lring="Aqua Ring"})
    sets.ws['Shining Strike'][9].MP = sets.ws['Shining Strike'][8].MP - (sets.MaxMP.lringMP - 0)
    -- MP:701 | MND +53 | STR - 3 | MAB + 5 | MAcc + 5 --
    sets.ws['Shining Strike'][10]= set_combine(sets.ws['Shining Strike'][9], {body="Errant Hpl."})
    sets.ws['Shining Strike'][10].MP= sets.ws['Shining Strike'][9].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:671 | MND +54 | STR - 3 | MAB + 5 | MAcc + 5 --
    sets.ws['Shining Strike'][11]= set_combine(sets.ws['Shining Strike'][10],{ammo="Jasper Tathlum"})
    sets.ws['Shining Strike'][11].MP= sets.ws['Shining Strike'][10].MP - (sets.MaxMP.ammoMP - 0)
    sets.ws['Shining Strike'][12]= sets.ws['Shining Strike'][11]
    sets.ws['Shining Strike'][12].MP= sets.ws['Shining Strike'][11].MP


-------------------------------
--        #WeaponSkill       --
--        Evisceration       --
--          50% DEX          --
-------------------------------
    -- MP:957 | Accuracy +12 --
    sets.ws['Evisceration'][0] = set_combine(sets.MaxMP,                {body="Scp. Harness +1"})
    sets.ws['Evisceration'][0].MP = sets.MaxMP.MP                 - (sets.MaxMP.bodyMP - 0)
    -- MP:909 | Accuracy +24 | Attack + 4 --
    sets.ws['Evisceration'][1] = set_combine(sets.ws['Evisceration'][0],{waist="Virtuoso Belt"})
    sets.ws['Evisceration'][1].MP = sets.ws['Evisceration'][0].MP - (sets.MaxMP.waistMP - 0)
    -- MP:890 | Accuracy +24 | DEX + 3 | STR + 3 | Attack + 4 --
    sets.ws['Evisceration'][2] = set_combine(sets.ws['Evisceration'][1],{hands="Custom M Gloves"})
    sets.ws['Evisceration'][2].MP = sets.ws['Evisceration'][1].MP - (sets.MaxMP.handsMP - 4)
    -- MP:868 | Accuracy +24 | DEX + 6 | STR + 6 | Attack + 4 --
    sets.ws['Evisceration'][3] = set_combine(sets.ws['Evisceration'][2],{neck="Spike Necklace"})
    sets.ws['Evisceration'][3].MP = sets.ws['Evisceration'][2].MP - (sets.MaxMP.neckMP - 0)
    -- MP:843 | Accuracy +24 | DEX +11 | STR +11 | Attack + 4 --
    sets.ws['Evisceration'][4] = set_combine(sets.ws['Evisceration'][3],{rring="Rajas Ring"})
    sets.ws['Evisceration'][4].MP = sets.ws['Evisceration'][3].MP - (sets.MaxMP.rringMP - 0)
    -- MP:832 | Accuracy +24 | DEX +16 | STR +11 | Attack + 4 --
    sets.ws['Evisceration'][5] = set_combine(sets.ws['Evisceration'][4],{legs="Duelist's Tights"})
    sets.ws['Evisceration'][5].MP = sets.ws['Evisceration'][4].MP - (sets.MaxMP.legsMP - 16)
    -- MP:809 | Accuracy +24 | DEX +20 | STR +11 | Attack + 4 --
    sets.ws['Evisceration'][6] = set_combine(sets.ws['Evisceration'][5],{feet="Goliard Clogs"})
    sets.ws['Evisceration'][6].MP = sets.ws['Evisceration'][5].MP - (sets.MaxMP.feetMP - 0)
    -- MP:779 | Accuracy +24 | DEX +23 | STR +11 | Attack + 4 --
    sets.ws['Evisceration'][7] = set_combine(sets.ws['Evisceration'][6],{Head="Emperor Hairpin"})
    sets.ws['Evisceration'][7].MP = sets.ws['Evisceration'][6].MP - (sets.MaxMP.headMP - 0)
    -- MP:749 | Accuracy +24 | DEX +23 | STR +14 | Attack +19 --
    sets.ws['Evisceration'][8] = set_combine(sets.ws['Evisceration'][7],{back="Forager's Mantle"})
    sets.ws['Evisceration'][8].MP = sets.ws['Evisceration'][7].MP - (sets.MaxMP.backMP - 0)
    -- MP:724 | Accuracy +24 | DEX +23 | STR +14 | Attack +25 --
    sets.ws['Evisceration'][9] = set_combine(sets.ws['Evisceration'][8],{ear1="Merman's Earring"})
    sets.ws['Evisceration'][9].MP = sets.ws['Evisceration'][8].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:694 | Accuracy +24 | DEX +23 | STR +14 | Attack +31 --
    sets.ws['Evisceration'][10]= set_combine(sets.ws['Evisceration'][9],{ear2="Merman's Earring"})
    sets.ws['Evisceration'][10].MP= sets.ws['Evisceration'][9].MP - (sets.MaxMP.ear2MP - 0)
    -- MP:644 | Accuracy +24 | DEX +23 | STR +16 | Attack +31 --
    sets.ws['Evisceration'][11]= set_combine(sets.ws['Evisceration'][10],{lring="Courage Ring"})
    sets.ws['Evisceration'][11].MP= sets.ws['Evisceration'][10].MP - (sets.MaxMP.lringMP - 0)
    -- MP:614 | Accuracy +27 | DEX +23 | STR +17 | Attack +31 --
    sets.ws['Evisceration'][12]= set_combine(sets.ws['Evisceration'][11],{ammo="Astrolabe"})
    sets.ws['Evisceration'][12].MP= sets.ws['Evisceration'][11].MP - (sets.MaxMP.ammoMP - 0)


-------------------------------
--        #WeaponSkill       --
--         Gust Slash        --
--     40% DEX / 40% INT     --
-------------------------------
    
    -- MP:993 | INT + 5 | DEX + 5 --
    sets.ws['Gust Slash'][0] = set_combine(sets.MaxMP,               {legs="Duelist's Tights"})
    sets.ws['Gust Slash'][0].MP = sets.MaxMP.MP               - (sets.MaxMP.legsMP - 16)
    -- MP:970 | INT + 9 | DEX + 9 | MAcc +2 --
    sets.ws['Gust Slash'][1] = set_combine(sets.ws['Gust Slash'][0], {hands="Goliard Clogs"})
    sets.ws['Gust Slash'][1].MP = sets.ws['Gust Slash'][0].MP - (sets.MaxMP.feetMP - 0)
    -- MP:965 | INT +14 | DEX + 9 | MAcc +2 --
    sets.ws['Gust Slash'][2] = set_combine(sets.ws['Gust Slash'][1], {head="Wlk. Chapeau +1"})
    sets.ws['Gust Slash'][2].MP = sets.ws['Gust Slash'][1].MP - (sets.MaxMP.headMP - 25)
    -- MP:940 | INT +19 | DEX + 9 | MAcc +2 --
    sets.ws['Gust Slash'][3] = set_combine(sets.ws['Gust Slash'][2], {rring="Snow Ring"})
    sets.ws['Gust Slash'][3].MP = sets.ws['Gust Slash'][2].MP - (sets.MaxMP.rringMP - 0)
    -- MP:920 | INT +23 | DEX + 9 | MAcc +2 --
    sets.ws['Gust Slash'][4] = set_combine(sets.ws['Gust Slash'][3], {back="Prism Cape"})
    sets.ws['Gust Slash'][4].MP = sets.ws['Gust Slash'][3].MP - (sets.MaxMP.backMP - 10)
    -- MP:898 | INT +23 | DEX + 9 | MAcc +2 --
    sets.ws['Gust Slash'][5] = set_combine(sets.ws['Gust Slash'][4], {neck="Philomath Stole"})
    sets.ws['Gust Slash'][5].MP = sets.ws['Gust Slash'][4].MP - (sets.MaxMP.neckMP - 0)
    -- MP:850 | INT +28 | DEX + 9 | MAcc +2 --
    sets.ws['Gust Slash'][6] = set_combine(sets.ws['Gust Slash'][5], {waist="Penitent's Rope"})
    sets.ws['Gust Slash'][6].MP = sets.ws['Gust Slash'][5].MP - (sets.MaxMP.waistMP - 0)
    -- MP:830 | INT +30 | DEX + 9 | MAcc +2 --
    sets.ws['Gust Slash'][7] = set_combine(sets.ws['Gust Slash'][6], {ear1="Morion Earring +1"})
    sets.ws['Gust Slash'][7].MP = sets.ws['Gust Slash'][6].MP - (sets.MaxMP.ear1MP - 5)
    -- MP:780 | INT +35 | DEX + 9 | MAcc +2 --
    sets.ws['Gust Slash'][8] = set_combine(sets.ws['Gust Slash'][7], {lring="Snow Ring"})
    sets.ws['Gust Slash'][8].MP = sets.ws['Gust Slash'][7].MP - (sets.MaxMP.lringMP - 0)
    -- MP:730 | INT +45 | DEX + 2 | MAcc +2 --
    sets.ws['Gust Slash'][9] = set_combine(sets.ws['Gust Slash'][8], {body="Errant Hpl."})
    sets.ws['Gust Slash'][9].MP = sets.ws['Gust Slash'][8].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:704 | INT +46 | DEX + 2 | MAcc +2 --
    sets.ws['Gust Slash'][10]= set_combine(sets.ws['Gust Slash'][9],{ear2="Morion Earring"})
    sets.ws['Gust Slash'][10].MP= sets.ws['Gust Slash'][9].MP - (sets.MaxMP.ear2MP - 4)
    -- MP:684 | INT +47 | DEX + 2 | MAcc +2 --
    sets.ws['Gust Slash'][11]= set_combine(sets.ws['Gust Slash'][10],{ammo="Phantom Tathlum"})
    sets.ws['Gust Slash'][11].MP= sets.ws['Gust Slash'][10].MP - (sets.MaxMP.ammoMP - 10)
    sets.ws['Gust Slash'][12]= sets.ws['Gust Slash'][11]
    sets.ws['Gust Slash'][12].MP= sets.ws['Gust Slash'][11].MP
    
    
-------------------------------
--       #WeaponSkill        --
--          Cyclone          --
--     40% DEX / 40% INT     --
-------------------------------
    sets.ws['Cyclone'][0] = sets.ws['Gust Slash'][0]
    sets.ws['Cyclone'][0].MP = sets.ws['Gust Slash'][0].MP
    sets.ws['Cyclone'][1] = sets.ws['Gust Slash'][1]
    sets.ws['Cyclone'][1].MP = sets.ws['Gust Slash'][1].MP
    sets.ws['Cyclone'][2] = sets.ws['Gust Slash'][2]
    sets.ws['Cyclone'][2].MP = sets.ws['Gust Slash'][2].MP
    sets.ws['Cyclone'][3] = sets.ws['Gust Slash'][3]
    sets.ws['Cyclone'][3].MP = sets.ws['Gust Slash'][3].MP
    sets.ws['Cyclone'][4] = sets.ws['Gust Slash'][4]
    sets.ws['Cyclone'][4].MP = sets.ws['Gust Slash'][4].MP
    sets.ws['Cyclone'][5] = set_combine(sets.ws['Gust Slash'][5],{neck="Thunder Gorget"})
    sets.ws['Cyclone'][5].MP = sets.ws['Gust Slash'][5].MP
    sets.ws['Cyclone'][6] = set_combine(sets.ws['Gust Slash'][6],{neck="Thunder Gorget"})
    sets.ws['Cyclone'][6].MP = sets.ws['Gust Slash'][6].MP
    sets.ws['Cyclone'][7] = set_combine(sets.ws['Gust Slash'][7],{neck="Thunder Gorget"})
    sets.ws['Cyclone'][7].MP = sets.ws['Gust Slash'][7].MP
    sets.ws['Cyclone'][8] = set_combine(sets.ws['Gust Slash'][8],{neck="Thunder Gorget"})
    sets.ws['Cyclone'][8].MP = sets.ws['Gust Slash'][8].MP
    sets.ws['Cyclone'][9] = set_combine(sets.ws['Gust Slash'][9],{neck="Thunder Gorget"})
    sets.ws['Cyclone'][9].MP = sets.ws['Gust Slash'][9].MP
    sets.ws['Cyclone'][10] = set_combine(sets.ws['Gust Slash'][10],{neck="Thunder Gorget"})
    sets.ws['Cyclone'][10].MP= sets.ws['Gust Slash'][10].MP
    sets.ws['Cyclone'][11] = set_combine(sets.ws['Gust Slash'][11],{neck="Thunder Gorget"})
    sets.ws['Cyclone'][11].MP= sets.ws['Gust Slash'][11].MP
    sets.ws['Cyclone'][12] = set_combine(sets.ws['Gust Slash'][12],{neck="Thunder Gorget"})
    sets.ws['Cyclone'][12].MP= sets.ws['Gust Slash'][12].MP


-------------------------------
--       #WeaponSkill        --
--        Fast Blade         --
--     40% STR 40% DEX       --
-------------------------------
    -- MP:977 | Accuracy +10 --
    sets.ws['Fast Blade'][0] = set_combine(sets.MaxMP,              {Head="Optical Hat"})
    sets.ws['Fast Blade'][0].MP = sets.MaxMP.MP               - (sets.MaxMP.headMP - 0)
    -- MP:927 | Accuracy +13 | Attack +18 --
    sets.ws['Fast Blade'][1] = set_combine(sets.ws['Fast Blade'][0],{body="Assault Jerkin"})
    sets.ws['Fast Blade'][1].MP = sets.ws['Fast Blade'][0].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:879 | Accuracy +25 | Attack +22 --
    sets.ws['Fast Blade'][2] = set_combine(sets.ws['Fast Blade'][1],{waist="Virtuoso Belt"})
    sets.ws['Fast Blade'][2].MP = sets.ws['Fast Blade'][1].MP - (sets.MaxMP.waistMP - 0)
    -- MP:854 | Accuracy +25 | Sword Skill + 5 | Attack +22 --
    sets.ws['Fast Blade'][3] = set_combine(sets.ws['Fast Blade'][2],{ear1="Suppanomimi"})
    sets.ws['Fast Blade'][3].MP = sets.ws['Fast Blade'][2].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:835 | Accuracy +25 | Sword Skill + 5 | STR + 3 | DEX + 3 | Attack +22 --
    sets.ws['Fast Blade'][4] = set_combine(sets.ws['Fast Blade'][3],{hands="Custom M Gloves"})
    sets.ws['Fast Blade'][4].MP = sets.ws['Fast Blade'][3].MP - (sets.MaxMP.handsMP - 4)
    -- MP:813 | Accuracy +25 | Sword Skill + 5 | STR + 6 | DEX + 6 | Attack +22 -- 
    sets.ws['Fast Blade'][5] = set_combine(sets.ws['Fast Blade'][4],{neck="Spike Necklace"})
    sets.ws['Fast Blade'][5].MP = sets.ws['Fast Blade'][4].MP - (sets.MaxMP.neckMP - 0)
    -- MP:788 | Accuracy +25 | Sword Skill + 5 | STR +11 | DEX +11 | Attack +22 --
    sets.ws['Fast Blade'][6] = set_combine(sets.ws['Fast Blade'][5],{rring="Rajas Ring"})
    sets.ws['Fast Blade'][6].MP = sets.ws['Fast Blade'][5].MP - (sets.MaxMP.rringMP - 0)
    -- MP:738 | Accuracy +25 | Sword Skill + 5 | STR +13 | DEX +12 | Attack +22 --
    sets.ws['Fast Blade'][7] = set_combine(sets.ws['Fast Blade'][6],{lring="Courage Ring"})
    sets.ws['Fast Blade'][7].MP = sets.ws['Fast Blade'][6].MP - (sets.MaxMP.lringMP - 0)
    -- MP:727 | Accuracy +32 | Sword Skill + 5 | STR +13 | DEX +12 | Attack +22 --
    sets.ws['Fast Blade'][8] = set_combine(sets.ws['Fast Blade'][7],{legs="Tatsu. Sitagoromo"})
    sets.ws['Fast Blade'][8].MP = sets.ws['Fast Blade'][7].MP - (sets.MaxMP.legsMP - 0)
    -- MP:704 | Accuracy +32 | Sword Skill + 5 | STR +13 | DEX +12 | Attack +26 --
    sets.ws['Fast Blade'][9] = set_combine(sets.ws['Fast Blade'][8],{feet="Dusk Ledelsens"})
    sets.ws['Fast Blade'][9].MP = sets.ws['Fast Blade'][8].MP - (sets.MaxMP.feetMP - 0)
    -- MP:674 | Accuracy +32 | Sword Skill + 5 | STR +16 | DEX +12 | Attack +41 --
    sets.ws['Fast Blade'][10]= set_combine(sets.ws['Fast Blade'][9],{back="Forager's Mantle"})
    sets.ws['Fast Blade'][10].MP= sets.ws['Fast Blade'][9].MP - (sets.MaxMP.backMP - 10)
    -- MP:644 | Accuracy +35 | Sword Skill + 5 | STR +17 | DEX +12 | Attack +41 --
    sets.ws['Fast Blade'][11]= set_combine(sets.ws['Fast Blade'][10],{ammo="Astrolabe"})
    sets.ws['Fast Blade'][11].MP= sets.ws['Fast Blade'][10].MP - (sets.MaxMP.ammoMP - 0)
    -- MP:614 | Accuracy +35 | Sword Skill + 5 | STR +17 | DEX +12 | Attack +41 | Double Attack +5% --
    sets.ws['Fast Blade'][12]= set_combine(sets.ws['Fast Blade'][11],{ear2="Brutal Earring"})
    sets.ws['Fast Blade'][12].MP= sets.ws['Fast Blade'][11].MP - (sets.MaxMP.ear2MP - 0)


-------------------------------
--       #WeaponSkill        --
--       Burning Blade       --
--     40% STR / 40% INT     --
-------------------------------
    -- MP:980 | INT +10 | MAcc +2 --
    sets.ws['Burning Blade'][0] = set_combine(sets.MaxMP,                 {feet="Goliard Clogs"})
    sets.ws['Burning Blade'][0].MP = sets.MaxMP.MP                  - (sets.MaxMP.feetMP - 0)
    -- MP:975 | INT +15 | MAcc +2 --
    sets.ws['Burning Blade'][1] = set_combine(sets.ws['Burning Blade'][0],{head="Wlk. Chapeau +1"})
    sets.ws['Burning Blade'][1].MP = sets.ws['Burning Blade'][0].MP - (sets.MaxMP.headMP - 25)
    -- MP:925 | INT +15 | MAcc +2 | MAB +5 --
    sets.ws['Burning Blade'][2] = set_combine(sets.ws['Burning Blade'][1],{ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.ws['Burning Blade'][2].MP = sets.ws['Burning Blade'][1].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    -- MP:900 | INT +17 | MAcc +2 | MAB +5 --
    sets.ws['Burning Blade'][3] = set_combine(sets.ws['Burning Blade'][2],{rring="Eremite's Ring +1"})
    sets.ws['Burning Blade'][3].MP = sets.ws['Burning Blade'][2].MP - (sets.MaxMP.rringMP - 0)
    -- MP:880 | INT +21 | MAcc +2 MAB +5 --
    sets.ws['Burning Blade'][4] = set_combine(sets.ws['Burning Blade'][3],{back="Prism Cape"})
    sets.ws['Burning Blade'][4].MP = sets.ws['Burning Blade'][3].MP - (sets.MaxMP.backMP - 10)
    -- MP:858 | INT +24 | MAcc +2 | MAB +5 --
    sets.ws['Burning Blade'][5] = set_combine(sets.ws['Burning Blade'][4],{neck="Philomath Stole"})
    sets.ws['Burning Blade'][5].MP = sets.ws['Burning Blade'][4].MP - (sets.MaxMP.neckMP - 0)
    -- MP:831 | INT +32 | MAcc +2 | STR - 6 | MAB +5 --
    sets.ws['Burning Blade'][6] = set_combine(sets.ws['Burning Blade'][5],{legs="Mahatma Slops"})
    sets.ws['Burning Blade'][6].MP = sets.ws['Burning Blade'][5].MP - (sets.MaxMP.legsMP - 0)
    -- MP:783 | INT +33 | MAcc +2 | STR - 6 | MAB +5 --
    sets.ws['Burning Blade'][7] = set_combine(sets.ws['Burning Blade'][6],{waist="Penitent's Rope"})
    sets.ws['Burning Blade'][7].MP = sets.ws['Burning Blade'][6].MP - (sets.MaxMP.waistMP - 0)
    -- MP:733 | INT +36 | MAcc +2 | STR - 6 | MAB +5 --
    sets.ws['Burning Blade'][8] = set_combine(sets.ws['Burning Blade'][7],{lring="Eremite's Ring +1"})
    sets.ws['Burning Blade'][8].MP = sets.ws['Burning Blade'][7].MP - (sets.MaxMP.lringMP - 0)
    -- MP:683 | INT +46 | MAcc +2 | STR -13 | MAB +5 --
    sets.ws['Burning Blade'][9] = set_combine(sets.ws['Burning Blade'][8],{body="Errant Hpl."})
    sets.ws['Burning Blade'][9].MP = sets.ws['Burning Blade'][8].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:663 | INT +48 | MAcc +2 | STR -13 | MAB +5 --
    sets.ws['Burning Blade'][10]= set_combine(sets.ws['Burning Blade'][9],{ammo="Phantom Tathlum"})
    sets.ws['Burning Blade'][10].MP= sets.ws['Burning Blade'][9].MP - (sets.MaxMP.ammoMP - 10)
    sets.ws['Burning Blade'][11]= sets.ws['Burning Blade'][10]
    sets.ws['Burning Blade'][11].MP= sets.ws['Burning Blade'][10].MP
    sets.ws['Burning Blade'][12]= sets.ws['Burning Blade'][11]
    sets.ws['Burning Blade'][12].MP= sets.ws['Burning Blade'][11].MP


-------------------------------
--       #WeaponSkill        --
--      Red Lotus Blade      --
--     40% STR / 40% INT     --
-------------------------------
    sets.ws['Red Lotus Blade'][0] = sets.ws['Burning Blade'][0]
    sets.ws['Red Lotus Blade'][0].MP = sets.ws['Burning Blade'][0].MP
    sets.ws['Red Lotus Blade'][1] = sets.ws['Burning Blade'][1]
    sets.ws['Red Lotus Blade'][1].MP = sets.ws['Burning Blade'][1].MP
    sets.ws['Red Lotus Blade'][2] = sets.ws['Burning Blade'][2]
    sets.ws['Red Lotus Blade'][2].MP = sets.ws['Burning Blade'][2].MP
    sets.ws['Red Lotus Blade'][3] = sets.ws['Burning Blade'][3]
    sets.ws['Red Lotus Blade'][3].MP = sets.ws['Burning Blade'][3].MP
    sets.ws['Red Lotus Blade'][4] = sets.ws['Burning Blade'][4]
    sets.ws['Red Lotus Blade'][4].MP = sets.ws['Burning Blade'][4].MP
    sets.ws['Red Lotus Blade'][5] = set_combine(sets.ws['Burning Blade'][5],{neck="Thunder Gorget"})
    sets.ws['Red Lotus Blade'][5].MP = sets.ws['Burning Blade'][5].MP
    sets.ws['Red Lotus Blade'][6] = set_combine(sets.ws['Burning Blade'][6],{neck="Thunder Gorget"})
    sets.ws['Red Lotus Blade'][6].MP = sets.ws['Burning Blade'][6].MP
    sets.ws['Red Lotus Blade'][7] = set_combine(sets.ws['Burning Blade'][7],{neck="Thunder Gorget"})
    sets.ws['Red Lotus Blade'][7].MP = sets.ws['Burning Blade'][7].MP
    sets.ws['Red Lotus Blade'][8] = set_combine(sets.ws['Burning Blade'][8],{neck="Thunder Gorget"})
    sets.ws['Red Lotus Blade'][8].MP = sets.ws['Burning Blade'][8].MP
    sets.ws['Red Lotus Blade'][9] = set_combine(sets.ws['Burning Blade'][9],{neck="Thunder Gorget"})
    sets.ws['Red Lotus Blade'][9].MP = sets.ws['Burning Blade'][9].MP
    sets.ws['Red Lotus Blade'][10] = set_combine(sets.ws['Burning Blade'][10],{neck="Thunder Gorget"})
    sets.ws['Red Lotus Blade'][10].MP= sets.ws['Burning Blade'][10].MP
    sets.ws['Red Lotus Blade'][11] = set_combine(sets.ws['Burning Blade'][11],{neck="Thunder Gorget"})
    sets.ws['Red Lotus Blade'][11].MP= sets.ws['Burning Blade'][11].MP
    sets.ws['Red Lotus Blade'][12] = set_combine(sets.ws['Burning Blade'][12],{neck="Thunder Gorget"})
    sets.ws['Red Lotus Blade'][12].MP= sets.ws['Burning Blade'][12].MP
    

-------------------------------
--       #WeaponSkill        --
--       Vorpal Blade        --
--         60% STR           --
-------------------------------
    -- MP:977 | Accuracy +10 --
    sets.ws['Vorpal Blade'][0] = set_combine(sets.MaxMP,                {Head="Optical Hat"})
    sets.ws['Vorpal Blade'][0].MP = sets.MaxMP.MP                 - (sets.MaxMP.headMP - 0)
    -- MP:927 | Accuracy +13 | Attack +18 --
    sets.ws['Vorpal Blade'][1] = set_combine(sets.ws['Vorpal Blade'][0],{body="Assault Jerkin"})
    sets.ws['Vorpal Blade'][1].MP = sets.ws['Vorpal Blade'][0].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:879 | Accuracy +25 | Attack +22 --
    sets.ws['Vorpal Blade'][2] = set_combine(sets.ws['Vorpal Blade'][1],{waist="Virtuoso Belt"})
    sets.ws['Vorpal Blade'][2].MP = sets.ws['Vorpal Blade'][1].MP - (sets.MaxMP.waistMP - 0)
    -- MP:854 | Accuracy +25 | Sword Skill + 5 | Attack +22 --
    sets.ws['Vorpal Blade'][3] = set_combine(sets.ws['Vorpal Blade'][2],{ear1="Suppanomimi"})
    sets.ws['Vorpal Blade'][3].MP = sets.ws['Vorpal Blade'][2].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:835 | Accuracy +25 | Sword Skill + 5 | STR + 3 | DEX + 3 | Attack +22 --
    sets.ws['Vorpal Blade'][4] = set_combine(sets.ws['Vorpal Blade'][3],{hands="Custom M Gloves"})
    sets.ws['Vorpal Blade'][4].MP = sets.ws['Vorpal Blade'][3].MP - (sets.MaxMP.handsMP - 4)
    -- MP:813 | Accuracy +35 | Sword Skill + 5 | STR + 3 | DEX + 3 | Attack +22 | FTP +.1 --
    sets.ws['Vorpal Blade'][5] = set_combine(sets.ws['Vorpal Blade'][4],{neck="Thunder Gorget"})
    sets.ws['Vorpal Blade'][5].MP = sets.ws['Vorpal Blade'][4].MP - (sets.MaxMP.neckMP - 0)
    -- MP:788 | Accuracy +35 | Sword Skill + 5 | STR + 8 | DEX + 8 | Attack +22 | FTP +.1 --
    sets.ws['Vorpal Blade'][6] = set_combine(sets.ws['Vorpal Blade'][5],{rring="Rajas Ring"})
    sets.ws['Vorpal Blade'][6].MP = sets.ws['Vorpal Blade'][5].MP - (sets.MaxMP.rringMP - 0)
    -- MP:738 | Accuracy +35 | Sword Skill + 5 | STR +10 | DEX + 9 | Attack +22 | FTP +.1 --
    sets.ws['Vorpal Blade'][7] = set_combine(sets.ws['Vorpal Blade'][6],{lring="Courage Ring"})
    sets.ws['Vorpal Blade'][7].MP = sets.ws['Vorpal Blade'][6].MP - (sets.MaxMP.lringMP - 0)
    -- MP:727 | Accuracy +42 | Sword Skill + 5 | STR +10 | DEX + 9 | Attack +22 | FTP +.1 --
    sets.ws['Vorpal Blade'][8] = set_combine(sets.ws['Vorpal Blade'][7],{legs="Tatsu. Sitagoromo"})
    sets.ws['Vorpal Blade'][8].MP = sets.ws['Vorpal Blade'][7].MP - (sets.MaxMP.legsMP - 0)
    -- MP:704 | Accuracy +42 | Sword Skill + 5 | STR +10 | DEX + 9 | Attack +26 | FTP +.1 --
    sets.ws['Vorpal Blade'][9] = set_combine(sets.ws['Vorpal Blade'][8],{feet="Dusk Ledelsens"})
    sets.ws['Vorpal Blade'][9].MP = sets.ws['Vorpal Blade'][8].MP - (sets.MaxMP.feetMP - 0)
    -- MP:674 | Accuracy +42 | Sword Skill + 5 | STR +13 | DEX + 9 | Attack +41 | FTP +.1 --
    sets.ws['Vorpal Blade'][10]= set_combine(sets.ws['Vorpal Blade'][9],{back="Forager's Mantle"})
    sets.ws['Vorpal Blade'][10].MP= sets.ws['Vorpal Blade'][9].MP - (sets.MaxMP.backMP - 0)
    -- MP:644 | Accuracy +45 | Sword Skill + 5 | STR +14 | DEX + 9 | Attack +41 | FTP +.1 --
    sets.ws['Vorpal Blade'][11]= set_combine(sets.ws['Vorpal Blade'][10],{ammo="Astrolabe"})
    sets.ws['Vorpal Blade'][11].MP= sets.ws['Vorpal Blade'][10].MP - (sets.MaxMP.ammoMP - 0)
    -- MP:614 | Accuracy +45 | Sword Skill + 5 | STR +14 | DEX + 9 | Attack +41 | FTP +.1 | Double Attack +5% --
    sets.ws['Vorpal Blade'][12]= set_combine(sets.ws['Vorpal Blade'][11],{ear2="Brutal Earring"})
    sets.ws['Vorpal Blade'][12].MP= sets.ws['Vorpal Blade'][11].MP - (sets.MaxMP.ear2MP - 0)


-------------------------------
--       #WeaponSkill        --
--       Shining Blade       --
--     40% STR / 40% MND     --
-------------------------------
    sets.ws['Shining Blade'][0] = sets.ws['Shining Strike'][0]
    sets.ws['Shining Blade'][0].MP = sets.ws['Shining Strike'][0].MP
    sets.ws['Shining Blade'][1] = sets.ws['Shining Strike'][1]
    sets.ws['Shining Blade'][1].MP = sets.ws['Shining Strike'][1].MP
    sets.ws['Shining Blade'][2] = sets.ws['Shining Strike'][2]
    sets.ws['Shining Blade'][2].MP = sets.ws['Shining Strike'][2].MP
    sets.ws['Shining Blade'][3] = sets.ws['Shining Strike'][3]
    sets.ws['Shining Blade'][3].MP = sets.ws['Shining Strike'][3].MP
    sets.ws['Shining Blade'][4] = sets.ws['Shining Strike'][4]
    sets.ws['Shining Blade'][4].MP = sets.ws['Shining Strike'][4].MP
    sets.ws['Shining Blade'][5] = sets.ws['Shining Strike'][5]
    sets.ws['Shining Blade'][5].MP = sets.ws['Shining Strike'][5].MP
    sets.ws['Shining Blade'][6] = set_combine(sets.ws['Shining Strike'][6],{neck="Faith Torque"})
    sets.ws['Shining Blade'][6].MP = sets.ws['Shining Strike'][6].MP
    sets.ws['Shining Blade'][7] = set_combine(sets.ws['Shining Strike'][7],{neck="Faith Torque"})
    sets.ws['Shining Blade'][7].MP = sets.ws['Shining Strike'][7].MP
    sets.ws['Shining Blade'][8] = set_combine(sets.ws['Shining Strike'][8],{neck="Faith Torque"})
    sets.ws['Shining Blade'][8].MP = sets.ws['Shining Strike'][8].MP
    sets.ws['Shining Blade'][9] = set_combine(sets.ws['Shining Strike'][9],{neck="Faith Torque"})
    sets.ws['Shining Blade'][9].MP = sets.ws['Shining Strike'][9].MP
    sets.ws['Shining Blade'][10]= set_combine(sets.ws['Shining Strike'][10],{neck="Faith Torque"})
    sets.ws['Shining Blade'][10].MP= sets.ws['Shining Strike'][10].MP
    sets.ws['Shining Blade'][11]= set_combine(sets.ws['Shining Strike'][11],{neck="Faith Torque"})
    sets.ws['Shining Blade'][11].MP= sets.ws['Shining Strike'][11].MP
    sets.ws['Shining Blade'][12]= set_combine(sets.ws['Shining Strike'][12],{neck="Faith Torque"})
    sets.ws['Shining Blade'][12].MP= sets.ws['Shining Strike'][12].MP


-------------------------------
--        #WeaponSkill       --
--        Seraph Blade       --
--     40% STR / 40% MND     --
-------------------------------
    sets.ws['Seraph Blade'][0] = sets.ws['Shining Blade'][0]
    sets.ws['Seraph Blade'][0].MP = sets.ws['Shining Blade'][0].MP
    sets.ws['Seraph Blade'][1] = sets.ws['Shining Blade'][1]
    sets.ws['Seraph Blade'][1].MP = sets.ws['Shining Blade'][1].MP
    sets.ws['Seraph Blade'][2] = sets.ws['Shining Blade'][2]
    sets.ws['Seraph Blade'][2].MP = sets.ws['Shining Blade'][2].MP
    sets.ws['Seraph Blade'][3] = sets.ws['Shining Blade'][3]
    sets.ws['Seraph Blade'][3].MP = sets.ws['Shining Blade'][3].MP
    sets.ws['Seraph Blade'][4] = sets.ws['Shining Blade'][4]
    sets.ws['Seraph Blade'][4].MP = sets.ws['Shining Blade'][4].MP
    sets.ws['Seraph Blade'][5] = sets.ws['Shining Blade'][5]
    sets.ws['Seraph Blade'][5].MP = sets.ws['Shining Blade'][5].MP
    sets.ws['Seraph Blade'][6] = sets.ws['Shining Blade'][6]
    sets.ws['Seraph Blade'][6].MP = sets.ws['Shining Blade'][6].MP
    sets.ws['Seraph Blade'][7] = sets.ws['Shining Blade'][7]
    sets.ws['Seraph Blade'][7].MP = sets.ws['Shining Blade'][7].MP
    sets.ws['Seraph Blade'][8] = sets.ws['Shining Blade'][8]
    sets.ws['Seraph Blade'][8].MP = sets.ws['Shining Blade'][8].MP
    sets.ws['Seraph Blade'][9] = sets.ws['Shining Blade'][9]
    sets.ws['Seraph Blade'][9].MP = sets.ws['Shining Blade'][9].MP
    sets.ws['Seraph Blade'][10] = sets.ws['Shining Blade'][10]
    sets.ws['Seraph Blade'][10].MP= sets.ws['Shining Blade'][10].MP
    sets.ws['Seraph Blade'][11] = sets.ws['Shining Blade'][11]
    sets.ws['Seraph Blade'][11].MP= sets.ws['Shining Blade'][11].MP
    sets.ws['Seraph Blade'][12] = sets.ws['Shining Blade'][12]
    sets.ws['Seraph Blade'][12].MP= sets.ws['Shining Blade'][12].MP


-------------------------------
--       #WeaponSkill        --
--       Death Blossom       --
--     30% STR / 50% MND     --
-------------------------------
    -- MP:1004 | MND + 5 --
    sets.ws['Death Blossom'][0] = set_combine(sets.MaxMP,                  {feet="Errant Pigaches"}) -- Rutter Sabatons (Morrigan's Pigaches)
    sets.ws['Death Blossom'][0].MP = sets.MaxMP.MP                  - (sets.MaxMP.feetMP - 20)
    -- MP:982 | Accuracy +10 | MND + 5 | FTP +.1 --
    sets.ws['Death Blossom'][1] = set_combine(sets.ws['Death Blossom'][0], {neck="Thunder Gorget"})
    sets.ws['Death Blossom'][1].MP = sets.ws['Death Blossom'][0].MP - (sets.MaxMP.neckMP - 0)
    -- MP:952 | Accuracy +20 | MND + 5 | FTP +.1 --
    sets.ws['Death Blossom'][2] = set_combine(sets.ws['Death Blossom'][1], {Head="Optical Hat"}) -- (Selenian Cap: +4 STR & +15 WS acc, +10 acc & 5 att)
    sets.ws['Death Blossom'][2].MP = sets.ws['Death Blossom'][1].MP - (sets.MaxMP.headMP - 0)
    -- MP:904 | Accuracy +32 | MND + 5 | FTP +.1 --
    sets.ws['Death Blossom'][3] = set_combine(sets.ws['Death Blossom'][2], {waist="Virtuoso Belt"}) -- Warwolf Belt
    sets.ws['Death Blossom'][3].MP = sets.ws['Death Blossom'][2].MP - (sets.MaxMP.waistMP - 0)
    -- MP:854 | Accuracy +35 | Attack +18 | MND + 5 | FTP +.1 --
    sets.ws['Death Blossom'][4] = set_combine(sets.ws['Death Blossom'][3], {body="Assault Jerkin"}) -- (Morrigan's Robe)
    sets.ws['Death Blossom'][4].MP = sets.ws['Death Blossom'][3].MP - (sets.MaxMP.bodyMP - 0)
    -- MP:822 | Accuracy +42 | Attack +18 | MND + 7 | FTP +.1 --
    sets.ws['Death Blossom'][5] = set_combine(sets.ws['Death Blossom'][4], {legs="Tatsu. Sitagoromo"}) -- Pahluwan Seraweels (Morrigan's Slops)
    sets.ws['Death Blossom'][5].MP = sets.ws['Death Blossom'][4].MP - (sets.MaxMP.legsMP - 0)
    -- MP:792 | Accuracy +42 | Attack +33 | STR + 3 | MND + 7 | FTP +.1 --
    sets.ws['Death Blossom'][6] = set_combine(sets.ws['Death Blossom'][5], {back="Forager's Mantle"})
    sets.ws['Death Blossom'][6].MP = sets.ws['Death Blossom'][5].MP - (sets.MaxMP.backMP - 0)
    -- MP:769 | Accuracy +42 | Attack +33 | STR +14 | DEX - 6 | MND + 7 | FTP +.1 --
    sets.ws['Death Blossom'][7] = set_combine(sets.ws['Death Blossom'][6], {hands="Alkyoneus's Brc."})
    sets.ws['Death Blossom'][7].MP = sets.ws['Death Blossom'][6].MP - (sets.MaxMP.handsMP - 0)
    -- MP:744 | Accuracy +42 | Attack +33 | Sword Skill + 5 | STR +14 | DEX - 6 | MND + 7 | FTP +.1 --
    sets.ws['Death Blossom'][8] = set_combine(sets.ws['Death Blossom'][7], {ear1="Suppanomimi"})
    sets.ws['Death Blossom'][8].MP = sets.ws['Death Blossom'][7].MP - (sets.MaxMP.ear1MP - 0)
    -- MP:719 | Accuracy +42 | Attack +33 | Sword Skill + 5 | STR +16 | DEX - 8 | MND +12 | FTP +.1 --
    sets.ws['Death Blossom'][9] = set_combine(sets.ws['Death Blossom'][8], {rring="Aqua Ring"})
    sets.ws['Death Blossom'][9].MP = sets.ws['Death Blossom'][8].MP - (sets.MaxMP.rringMP - 0)
    -- MP:689 | Accuracy +45 | Attack +33 | Sword Skill + 5 | STR +17 | DEX - 8 | MND +12 | FTP +.1 --
    sets.ws['Death Blossom'][10]= set_combine(sets.ws['Death Blossom'][9], {ammo="Astrolabe"})
    sets.ws['Death Blossom'][10].MP= sets.ws['Death Blossom'][9].MP - (sets.MaxMP.ammoMP - 0)
    -- MP:639 | Accuracy +45 | Attack +33 | Sword Skill + 5 | STR +19 | DEX -10 | MND +17 | FTP +.1 --
    sets.ws['Death Blossom'][11]= set_combine(sets.ws['Death Blossom'][10],{lring="Aqua Ring"})
    sets.ws['Death Blossom'][11].MP= sets.ws['Death Blossom'][10].MP- (sets.MaxMP.lringMP - 0)
    -- MP:609 | Accuracy +45 | Attack +33 | Sword Skill + 5 | STR +19 | DEX -10 | MND +17 | FTP +.1 | Double Attack +5% --
    sets.ws['Death Blossom'][12]= set_combine(sets.ws['Death Blossom'][11],{ear2="Brutal Earring"})
    sets.ws['Death Blossom'][12].MP= sets.ws['Death Blossom'][11].MP- (sets.MaxMP.ear2MP - 0)


end

function configureTPsets()

    if Weapon == 'JoyJustice' or Weapon == 'JusticeJoy' then
    
        sets.Accuracy[9] = set_combine(sets.Accuracy[8], {ear1="Suppanomimi"})
        sets.Accuracy[10]= set_combine(sets.Accuracy[9], {ear2="Brutal Earring"})
        sets.Accuracy[11]= set_combine(sets.Accuracy[10],{ammo="Virtue Stone"})
        sets.AccHaste[8] = set_combine(sets.AccHaste[7], {ear1="Suppanomimi"})
        sets.AccHaste[9] = set_combine(sets.AccHaste[8], {ear2="Brutal Earring"})
        sets.AccHaste[10]= set_combine(sets.AccHaste[9], {ammo="Virtue Stone"})
        sets.PDTHaste[8] = set_combine(sets.PDTHaste[7], {ear1="Suppanomimi"})
        sets.PDTHaste[9] = set_combine(sets.PDTHaste[8], {ear2="Brutal Earring"})
        sets.PDTHaste[10]= set_combine(sets.PDTHaste[9], {ammo="Virtue Stone"})
        sets.PDTMelee[11]= set_combine(sets.PDTMelee[10],{ear1="Suppanomimi"})
        sets.PDTMelee[12]= set_combine(sets.PDTMelee[11],{ear2="Brutal Earring"})
        
    elseif Weapon == 'JoyKraken' or Weapon == 'EnhanceKraken' then
    
        sets.Accuracy[9] = set_combine(sets.Accuracy[8], {ear1="Suppanomimi"})
        sets.Accuracy[10]= set_combine(sets.Accuracy[9], {ear2="Optical Earring"})
        sets.Accuracy[11]= set_combine(sets.Accuracy[10],{ammo="Astrolabe"})
        sets.AccHaste[8] = set_combine(sets.AccHaste[7], {ear1="Suppanomimi"})
        sets.AccHaste[9] = set_combine(sets.AccHaste[8], {ear2="Optical Earring"})
        sets.AccHaste[10]= set_combine(sets.AccHaste[9], {ammo="Astrolabe"})
        sets.PDTHaste[8] = set_combine(sets.PDTHaste[7], {ear1="Suppanomimi"})
        sets.PDTHaste[9] = set_combine(sets.PDTHaste[8], {ear2="Optical Earring"})
        sets.PDTHaste[10]= set_combine(sets.PDTHaste[9], {ammo="Astrolabe"})
        sets.PDTMelee[11]= set_combine(sets.PDTMelee[10],{ear1="Suppanomimi"})
        sets.PDTMelee[12]= set_combine(sets.PDTMelee[11],{ear2="Optical Earring"})
        
    elseif Weapon == 'Sword' or Weapon == 'Enmity' then
    
        sets.Accuracy[9] = set_combine(sets.Accuracy[8], {ear1="Suppanomimi"})
        sets.Accuracy[10]= set_combine(sets.Accuracy[9], {ear2="Brutal Earring"})
        sets.Accuracy[11]= set_combine(sets.Accuracy[10],{ammo="Astrolabe"})
        sets.AccHaste[8] = set_combine(sets.AccHaste[7], {ear1="Suppanomimi"})
        sets.AccHaste[9] = set_combine(sets.AccHaste[8], {ear2="Brutal Earring"})
        sets.AccHaste[10]= set_combine(sets.AccHaste[9], {ammo="Astrolabe"})
        sets.PDTHaste[8] = set_combine(sets.PDTHaste[7], {ear1="Suppanomimi"})
        sets.PDTHaste[9] = set_combine(sets.PDTHaste[8], {ear2="Brutal Earring"})
        sets.PDTHaste[10]= set_combine(sets.PDTHaste[9], {ammo="Astrolabe"})
        sets.PDTMelee[11]= set_combine(sets.PDTMelee[10],{ear1="Suppanomimi"})
        sets.PDTMelee[12]= set_combine(sets.PDTMelee[11],{ear2="Brutal Earring"})
        
    elseif Weapon == 'Dagger' or Weapon == 'MP' then
    
        sets.Accuracy[9] = set_combine(sets.Accuracy[8], {ear1="Merman's Earring"})
        sets.Accuracy[10]= set_combine(sets.Accuracy[9], {ear2="Brutal Earring"})
        sets.Accuracy[11]= set_combine(sets.Accuracy[10],{ammo="Astrolabe"})
        sets.AccHaste[8] = set_combine(sets.AccHaste[7], {ear1="Merman's Earring"})
        sets.AccHaste[9] = set_combine(sets.AccHaste[8], {ear2="Brutal Earring"})
        sets.AccHaste[10]= set_combine(sets.AccHaste[9], {ammo="Astrolabe"})
        sets.PDTHaste[8] = set_combine(sets.PDTHaste[7], {ear1="Merman's Earring"})
        sets.PDTHaste[9] = set_combine(sets.PDTHaste[8], {ear2="Brutal Earring"})
        sets.PDTHaste[10]= set_combine(sets.PDTHaste[9], {ammo="Astrolabe"})
        sets.PDTMelee[11]= set_combine(sets.PDTMelee[10],{ear1="Merman's Earring"})
        sets.PDTMelee[12]= set_combine(sets.PDTMelee[11],{ear2="Brutal Earring"})
        
    elseif Weapon == 'Club' then
    
        sets.Accuracy[9] = set_combine(sets.Accuracy[8], {ear1="Merman's Earring"})
        sets.Accuracy[10]= set_combine(sets.Accuracy[9], {ear2="Optical Earring"})
        sets.Accuracy[11]= set_combine(sets.Accuracy[10],{ammo="Astrolabe"})
        sets.AccHaste[8] = set_combine(sets.AccHaste[7], {ear1="Merman's Earring"})
        sets.AccHaste[9] = set_combine(sets.AccHaste[8], {ear2="Optical Earring"})
        sets.AccHaste[10]= set_combine(sets.AccHaste[9], {ammo="Astrolabe"})
        sets.PDTHaste[8] = set_combine(sets.PDTHaste[7], {ear1="Merman's Earring"})
        sets.PDTHaste[9] = set_combine(sets.PDTHaste[8], {ear2="Optical Earring"})
        sets.PDTHaste[10]= set_combine(sets.PDTHaste[9], {ammo="Astrolabe"})
        sets.PDTMelee[11]= set_combine(sets.PDTMelee[10],{ear1="Merman's Earring"})
        sets.PDTMelee[12]= set_combine(sets.PDTMelee[11],{ear2="Optical Earring"})
        
    end
		
	sets.Accuracy[9].MP = sets.Accuracy[8].MP - (sets.MaxMP.ear1MP - 0)
	sets.Accuracy[10].MP= sets.Accuracy[9].MP - (sets.MaxMP.ear2MP - 0)
	sets.Accuracy[11].MP= sets.Accuracy[10].MP- (sets.MaxMP.ammoMP - 0)
	sets.AccHaste[8].MP = sets.AccHaste[7].MP - (sets.MaxMP.ear1MP - 0)
	sets.AccHaste[9].MP = sets.AccHaste[8].MP - (sets.MaxMP.ear2MP - 0)
	sets.AccHaste[10].MP= sets.AccHaste[9].MP - (sets.MaxMP.ammoMP - 0)
	sets.AccHaste[11]= set_combine(sets.AccHaste[10],{rring="Toreador's Ring", lring="Toreador's Ring"})
	sets.AccHaste[11].MP= sets.AccHaste[10].MP- (sets.MaxMP.lringMP - 0) - (sets.MaxMP.rringMP - 0)
	sets.AccHaste[12]= set_combine(sets.AccHaste[11],{body="Scp. Harness +1"})
	sets.AccHaste[12].MP= sets.AccHaste[11].MP- (sets.MaxMP.bodyMP - 0)
	sets.PDTHaste[8].MP = sets.PDTHaste[7].MP - (sets.MaxMP.ear1MP - 0)
	sets.PDTHaste[9].MP = sets.PDTHaste[8].MP - (sets.MaxMP.ear2MP - 0)
	sets.PDTHaste[10].MP= sets.PDTHaste[9].MP - (sets.MaxMP.ammoMP - 0)
	sets.PDTMelee[11].MP= sets.PDTMelee[10].MP- (sets.MaxMP.ear1MP - 0)
	sets.PDTMelee[12].MP= sets.PDTMelee[11].MP- (sets.MaxMP.ear2MP - 0)

end

--send_command('input /echo ------- '..player.mp..' is my mp before cast -------')

function precast(spell)

    PreviousSetName = ""
    IdleSetName = ""

    if EnmityMode == "Off" and
	   CastingSpell == 0 and
	   player.status == 'Engaged' and 
      (string.find(spell.type,'Magic') or
       string.find(spell.type,'Ninjutsu') or
       string.find(spell.type,'Summon')) then
       -- equip(sets.MeleeMPBuffer)
    end
    
    if sets.ws[spell.english] then -- #WeaponSkill
    
        if     ForceSwapThreshold == 100 or player.mp <= BaseMP + sets.ws[spell.name][12].MP + SubJobMP - Weakened then equip(sets.ws[spell.name][12])
        elseif                              player.mp <= BaseMP + sets.ws[spell.name][11].MP + SubJobMP - Weakened then equip(sets.ws[spell.name][11])
        elseif                              player.mp <= BaseMP + sets.ws[spell.name][10].MP + SubJobMP - Weakened then equip(sets.ws[spell.name][10])
        elseif ForceSwapThreshold == 75  or player.mp <= BaseMP + sets.ws[spell.name][9].MP  + SubJobMP - Weakened then equip(sets.ws[spell.name][9])
        elseif                              player.mp <= BaseMP + sets.ws[spell.name][8].MP  + SubJobMP - Weakened then equip(sets.ws[spell.name][8])
        elseif                              player.mp <= BaseMP + sets.ws[spell.name][7].MP  + SubJobMP - Weakened then equip(sets.ws[spell.name][7])
        elseif ForceSwapThreshold == 50  or player.mp <= BaseMP + sets.ws[spell.name][6].MP  + SubJobMP - Weakened then equip(sets.ws[spell.name][6])
        elseif                              player.mp <= BaseMP + sets.ws[spell.name][5].MP  + SubJobMP - Weakened then equip(sets.ws[spell.name][5])
        elseif                              player.mp <= BaseMP + sets.ws[spell.name][4].MP  + SubJobMP - Weakened then equip(sets.ws[spell.name][4])
        elseif ForceSwapThreshold == 25  or player.mp <= BaseMP + sets.ws[spell.name][3].MP  + SubJobMP - Weakened then equip(sets.ws[spell.name][3])
        elseif                              player.mp <= BaseMP + sets.ws[spell.name][2].MP  + SubJobMP - Weakened then equip(sets.ws[spell.name][2])
        elseif                              player.mp <= BaseMP + sets.ws[spell.name][1].MP  + SubJobMP - Weakened then equip(sets.ws[spell.name][1])
        elseif                              player.mp <= BaseMP + sets.ws[spell.name][0].MP  + SubJobMP - Weakened then equip(sets.ws[spell.name][0]) end
        
    elseif spell.english == 'Quickstep' or 
           spell.english == 'Box Step' or 
           spell.english == 'Desperate Flourish' then -- #Accuracy

        if     ForceSwapThreshold == 100 or player.mp <= BaseMP + sets.Accuracy[11].MP + SubJobMP - Weakened then equip(sets.Accuracy[11])
        elseif                              player.mp <= BaseMP + sets.Accuracy[10].MP + SubJobMP - Weakened then equip(sets.Accuracy[10])
        elseif                              player.mp <= BaseMP + sets.Accuracy[9].MP  + SubJobMP - Weakened then equip(sets.Accuracy[9])
        elseif ForceSwapThreshold == 75  or player.mp <= BaseMP + sets.Accuracy[8].MP  + SubJobMP - Weakened then equip(sets.Accuracy[8])
        elseif                              player.mp <= BaseMP + sets.Accuracy[7].MP  + SubJobMP - Weakened then equip(sets.Accuracy[7])
        elseif                              player.mp <= BaseMP + sets.Accuracy[6].MP  + SubJobMP - Weakened then equip(sets.Accuracy[6])
        elseif ForceSwapThreshold == 50  or player.mp <= BaseMP + sets.Accuracy[5].MP  + SubJobMP - Weakened then equip(sets.Accuracy[5])
        elseif                              player.mp <= BaseMP + sets.Accuracy[4].MP  + SubJobMP - Weakened then equip(sets.Accuracy[4])
        elseif                              player.mp <= BaseMP + sets.Accuracy[3].MP  + SubJobMP - Weakened then equip(sets.Accuracy[3])
        elseif ForceSwapThreshold == 25  or player.mp <= BaseMP + sets.Accuracy[2].MP  + SubJobMP - Weakened then equip(sets.Accuracy[2])
        elseif                              player.mp <= BaseMP + sets.Accuracy[1].MP  + SubJobMP - Weakened then equip(sets.Accuracy[1])
        elseif                              player.mp <= BaseMP + sets.Accuracy[0].MP  + SubJobMP - Weakened then equip(sets.Accuracy[0]) end
        
    elseif string.find(spell.english,'Curing Waltz') or 
           string.find(spell.english,'Divine Waltz') then
           
        if EnmityMode == "Off" then -- #CHA
        
            if     player.mp <= BaseMP + sets.midcast.CHA[8].MP  + SubJobMP - Weakened then equip(sets.midcast.CHA[8])
            elseif player.mp <= BaseMP + sets.midcast.CHA[7].MP  + SubJobMP - Weakened then equip(sets.midcast.CHA[7])
            elseif player.mp <= BaseMP + sets.midcast.CHA[6].MP  + SubJobMP - Weakened then equip(sets.midcast.CHA[6])
            elseif player.mp <= BaseMP + sets.midcast.CHA[5].MP  + SubJobMP - Weakened then equip(sets.midcast.CHA[5])
            elseif player.mp <= BaseMP + sets.midcast.CHA[4].MP  + SubJobMP - Weakened then equip(sets.midcast.CHA[4])
            elseif player.mp <= BaseMP + sets.midcast.CHA[3].MP  + SubJobMP - Weakened then equip(sets.midcast.CHA[3])
            elseif player.mp <= BaseMP + sets.midcast.CHA[2].MP  + SubJobMP - Weakened then equip(sets.midcast.CHA[2])
            elseif player.mp <= BaseMP + sets.midcast.CHA[1].MP  + SubJobMP - Weakened then equip(sets.midcast.CHA[1])
            elseif player.mp <= BaseMP + sets.midcast.CHA[0].MP  + SubJobMP - Weakened then equip(sets.midcast.CHA[0]) end
            
        else -- EnmityMode == "On" #Enmity
            
            if                                  player.mp <= BaseMP + sets.midcast.Enmity[12].MP + SubJobMP - Weakened then equip(sets.midcast.Enmity[12])
            elseif                              player.mp <= BaseMP + sets.midcast.Enmity[11].MP + SubJobMP - Weakened then equip(sets.midcast.Enmity[11])
            elseif ForceSwapThreshold == 100 or player.mp <= BaseMP + sets.midcast.Enmity[10].MP + SubJobMP - Weakened then equip(sets.midcast.Enmity[10])
            elseif                              player.mp <= BaseMP + sets.midcast.Enmity[9].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[9])
            elseif                              player.mp <= BaseMP + sets.midcast.Enmity[8].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[8])
            elseif ForceSwapThreshold ==  75 or player.mp <= BaseMP + sets.midcast.Enmity[7].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[7])
            elseif                              player.mp <= BaseMP + sets.midcast.Enmity[6].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[6])
            elseif                              player.mp <= BaseMP + sets.midcast.Enmity[5].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[5])
            elseif ForceSwapThreshold ==  50 or player.mp <= BaseMP + sets.midcast.Enmity[4].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[4])
            elseif                              player.mp <= BaseMP + sets.midcast.Enmity[3].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[3])
            elseif                              player.mp <= BaseMP + sets.midcast.Enmity[2].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[2])
            elseif ForceSwapThreshold ==  25 or player.mp <= BaseMP + sets.midcast.Enmity[1].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[1])
            elseif                              player.mp <= BaseMP + sets.midcast.Enmity[0].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[0]) end
        
        end
		
	elseif spell.english == "Sublimation" then
	
		if buffactive['Sublimation: Activated'] or buffactive['Sublimation: Complete'] then
		
			send_command('wait .00;Text Sublimation text ""')
			send_command('wait .01;Text Sublimation color 200 200 200')
			send_command('wait .02;Text Sublimation bg_color 0 0 0')
			
		else
		
			send_command('wait .000;Text Sublimation text ""')
			send_command('wait .001;Text Sublimation color 240 80 40')
			send_command('wait .002;Text Sublimation bg_color 20 20 120')
		
		end
        
    elseif CastingSpell == 0 and
          (string.find(spell.type,'Magic') or 
           string.find(spell.type,'Ninjutsu') or 
           string.find(spell.type,'Summon')) then -- #FastCast
    
        if     EnmityMode == "Off" and (ForceSwapThreshold >= 25 or player.mp <= BaseMP + sets.precast.fastcast.MP + sets.Weapons[Weapon].MP + SubJobMP - Weakened) then equip(set_combine(sets.MaxMP, sets.precast.fastcast)) 
		elseif EnmityMode == "On"                                                                                                                                   then equip(                        sets.precast.fastcast)  end
        
    elseif spell.english == 'Convert' then
        
        LastConvert = os.time()
        
    end
    
end

function midcast(spell)

    if CastingSpell == 0 then
    
        CastingSpell = 1
        
        if spell.skill == "Enhancing Magic" then
        
            if  string.find(spell.english,'En') or 
                string.find(spell.english,'Phalanx') or 
                string.find(spell.english,'Bar') then -- #Enhancing
            
                if     player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons.Earth.MP + SubJobMP - Weakened and MeleeMode == "Off" then equip(sets.Weapons.Earth)
                elseif                                                                                       MeleeMode == "Off" then equip(sets.Weapons.MP) end
            
                if     player.mp <= BaseMP + sets.midcast.Enhancing[7].MP + SubJobMP - Weakened then equip(sets.midcast.Enhancing[7])
                elseif player.mp <= BaseMP + sets.midcast.Enhancing[6].MP + SubJobMP - Weakened then equip(sets.midcast.Enhancing[6])
                elseif player.mp <= BaseMP + sets.midcast.Enhancing[5].MP + SubJobMP - Weakened then equip(sets.midcast.Enhancing[5])
                elseif player.mp <= BaseMP + sets.midcast.Enhancing[4].MP + SubJobMP - Weakened then equip(sets.midcast.Enhancing[4])
                elseif player.mp <= BaseMP + sets.midcast.Enhancing[3].MP + SubJobMP - Weakened then equip(sets.midcast.Enhancing[3])
                elseif player.mp <= BaseMP + sets.midcast.Enhancing[2].MP + SubJobMP - Weakened then equip(sets.midcast.Enhancing[2])
                elseif player.mp <= BaseMP + sets.midcast.Enhancing[1].MP + SubJobMP - Weakened then equip(sets.midcast.Enhancing[1])
                elseif player.mp <= BaseMP + sets.midcast.Enhancing[0].MP + SubJobMP - Weakened then equip(sets.midcast.Enhancing[0]) end
                
            elseif string.find(spell.english,'Spikes') then -- #Spikes
               
                --[[
                for i=12, 0, -1 do
                    if player.mp <= sets.midcast.Spikes[i].MP + SubJobMP - Weakened then
                        equip(sets.midcast.Spikes[i]) 
                        break
                    end
                end
                --]]
            
                if     player.mp <= BaseMP + sets.midcast.Spikes[11].MP + SubJobMP - Weakened then equip(sets.midcast.Spikes[11])
                elseif player.mp <= BaseMP + sets.midcast.Spikes[10].MP + SubJobMP - Weakened then equip(sets.midcast.Spikes[10])
                elseif player.mp <= BaseMP + sets.midcast.Spikes[9].MP  + SubJobMP - Weakened then equip(sets.midcast.Spikes[9])
                elseif player.mp <= BaseMP + sets.midcast.Spikes[8].MP  + SubJobMP - Weakened then equip(sets.midcast.Spikes[8])
                elseif player.mp <= BaseMP + sets.midcast.Spikes[7].MP  + SubJobMP - Weakened then equip(sets.midcast.Spikes[7])
                elseif player.mp <= BaseMP + sets.midcast.Spikes[6].MP  + SubJobMP - Weakened then equip(sets.midcast.Spikes[6])
                elseif player.mp <= BaseMP + sets.midcast.Spikes[5].MP  + SubJobMP - Weakened then equip(sets.midcast.Spikes[5])
                elseif player.mp <= BaseMP + sets.midcast.Spikes[4].MP  + SubJobMP - Weakened then equip(sets.midcast.Spikes[4])
                elseif player.mp <= BaseMP + sets.midcast.Spikes[3].MP  + SubJobMP - Weakened then equip(sets.midcast.Spikes[3])
                elseif player.mp <= BaseMP + sets.midcast.Spikes[2].MP  + SubJobMP - Weakened then equip(sets.midcast.Spikes[2])
                elseif player.mp <= BaseMP + sets.midcast.Spikes[1].MP  + SubJobMP - Weakened then equip(sets.midcast.Spikes[1])
                elseif player.mp <= BaseMP + sets.midcast.Spikes[0].MP  + SubJobMP - Weakened then equip(sets.midcast.Spikes[0]) end
            
            elseif EnmityMode == "Off" and
                  (spell.english == 'Blink' or
                   spell.english == 'Erase' or
                   spell.english == 'Haste' or
                   spell.english == 'Refresh' or
                   string.find(spell.english,'Regen')) or
                   string.find(spell.english,'Utsusemi') then -- #Haste
            
                if     player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons.Earth.MP + SubJobMP - Weakened and MeleeMode == "Off" then equip(sets.Weapons.Earth)
                elseif                                                                                       MeleeMode == "Off" then equip(sets.Weapons.MP) end
            
                if     player.mp <= BaseMP + sets.midcast.Haste[6].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[6])
                elseif player.mp <= BaseMP + sets.midcast.Haste[5].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[5])
                elseif player.mp <= BaseMP + sets.midcast.Haste[4].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[4])
                elseif player.mp <= BaseMP + sets.midcast.Haste[3].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[3])
                elseif player.mp <= BaseMP + sets.midcast.Haste[2].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[2])
                elseif player.mp <= BaseMP + sets.midcast.Haste[1].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[1])
                elseif player.mp <= BaseMP + sets.midcast.Haste[0].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[0]) end
            
            elseif EnmityMode == "Off" and -- #ConserveMP
                  (string.find(spell.english,'Protect') or
                   string.find(spell.english,'Shell')) then
            
                if     player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons.Earth.MP + SubJobMP - Weakened and MeleeMode == "Off" then equip(sets.Weapons.Earth)
                elseif                                                                                       MeleeMode == "Off" then equip(sets.Weapons.MP) end
                    
                if     player.mp <= BaseMP + sets.midcast.ConserveMP[5].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[5])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[4].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[4])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[3].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[3])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[2].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[2])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[1].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[1])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[0].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[0]) end
            
            elseif spell.english == 'Deodorize' or
                   spell.english == 'Invisible' or
                   spell.english == 'Sneak' then -- #MGS
            
                if     player.mp <= BaseMP + sets.midcast.MGS[3].MP + SubJobMP - Weakened then equip(sets.midcast.MGS[3])
                elseif player.mp <= BaseMP + sets.midcast.MGS[2].MP + SubJobMP - Weakened then equip(sets.midcast.MGS[2])
                elseif player.mp <= BaseMP + sets.midcast.MGS[1].MP + SubJobMP - Weakened then equip(sets.midcast.MGS[1])
                elseif player.mp <= BaseMP + sets.midcast.MGS[0].MP + SubJobMP - Weakened then equip(sets.midcast.MGS[0]) end
                
            elseif spell.english == 'Stoneskin' and 
			      (EnmityMode == "Off" or 
				   player.status == 'Idle' or 
				   Utsusemi_Check() == true) then -- #Stoneskin
            
                if     player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons.Earth.MP + SubJobMP - Weakened and MeleeMode == "Off" then equip(sets.Weapons.Earth)
                elseif                                                                                       MeleeMode == "Off" then equip(sets.Weapons.MP) end
        
                if     player.mp <= BaseMP + sets.midcast.Stoneskin[11].MP + SubJobMP - Weakened then equip(sets.midcast.Stoneskin[11])
                elseif player.mp <= BaseMP + sets.midcast.Stoneskin[10].MP + SubJobMP - Weakened then equip(sets.midcast.Stoneskin[10])
                elseif player.mp <= BaseMP + sets.midcast.Stoneskin[9].MP  + SubJobMP - Weakened then equip(sets.midcast.Stoneskin[9])
                elseif player.mp <= BaseMP + sets.midcast.Stoneskin[8].MP  + SubJobMP - Weakened then equip(sets.midcast.Stoneskin[8])
                elseif player.mp <= BaseMP + sets.midcast.Stoneskin[7].MP  + SubJobMP - Weakened then equip(sets.midcast.Stoneskin[7])
                elseif player.mp <= BaseMP + sets.midcast.Stoneskin[6].MP  + SubJobMP - Weakened then equip(sets.midcast.Stoneskin[6])
                elseif player.mp <= BaseMP + sets.midcast.Stoneskin[5].MP  + SubJobMP - Weakened then equip(sets.midcast.Stoneskin[5])
                elseif player.mp <= BaseMP + sets.midcast.Stoneskin[4].MP  + SubJobMP - Weakened then equip(sets.midcast.Stoneskin[4])
                elseif player.mp <= BaseMP + sets.midcast.Stoneskin[3].MP  + SubJobMP - Weakened then equip(sets.midcast.Stoneskin[3])
                elseif player.mp <= BaseMP + sets.midcast.Stoneskin[2].MP  + SubJobMP - Weakened then equip(sets.midcast.Stoneskin[2])
                elseif player.mp <= BaseMP + sets.midcast.Stoneskin[1].MP  + SubJobMP - Weakened then equip(sets.midcast.Stoneskin[1])
                elseif player.mp <= BaseMP + sets.midcast.Stoneskin[0].MP  + SubJobMP - Weakened then equip(sets.midcast.Stoneskin[0]) end
            
            end
        
        elseif spell.skill == "Enfeebling Magic" then
            
            if spell.type == "WhiteMagic" and EnmityMode == "Off" then
            
                if string.find(spell.english,'Dia') then -- #ConserveMP
            
                    if     player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons.Earth.MP + SubJobMP - Weakened and MeleeMode == "Off" then equip(sets.Weapons.Earth)
                    elseif                                                                                       MeleeMode == "Off" then equip(sets.Weapons.MP) end
                        
                    if     player.mp <= BaseMP + sets.midcast.ConserveMP[5].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[5])
                    elseif player.mp <= BaseMP + sets.midcast.ConserveMP[4].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[4])
                    elseif player.mp <= BaseMP + sets.midcast.ConserveMP[3].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[3])
                    elseif player.mp <= BaseMP + sets.midcast.ConserveMP[2].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[2])
                    elseif player.mp <= BaseMP + sets.midcast.ConserveMP[1].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[1])
                    elseif player.mp <= BaseMP + sets.midcast.ConserveMP[0].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[0]) end
                
                else
                
                    if EnfeebleMode == "Potency/Haste" and 
					  (string.find(spell.english,'Slow') or 
					   string.find(spell.english,'Paralyze')) then -- #EMNDPotency
        
                        if                                  player.mp <= BaseMP + sets.midcast.EMNDPotency[12].MP + SubJobMP - Weakened then equip(sets.midcast.EMNDPotency[12])
                        elseif ForceSwapThreshold == 100 or player.mp <= BaseMP + sets.midcast.EMNDPotency[11].MP + SubJobMP - Weakened then equip(sets.midcast.EMNDPotency[11])
                        elseif                              player.mp <= BaseMP + sets.midcast.EMNDPotency[10].MP + SubJobMP - Weakened then equip(sets.midcast.EMNDPotency[10])
                        elseif                              player.mp <= BaseMP + sets.midcast.EMNDPotency[9].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDPotency[9])
                        elseif ForceSwapThreshold == 75  or player.mp <= BaseMP + sets.midcast.EMNDPotency[8].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDPotency[8])
                        elseif                              player.mp <= BaseMP + sets.midcast.EMNDPotency[7].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDPotency[7])
                        elseif                              player.mp <= BaseMP + sets.midcast.EMNDPotency[6].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDPotency[6])
                        elseif ForceSwapThreshold == 50  or player.mp <= BaseMP + sets.midcast.EMNDPotency[5].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDPotency[5])
                        elseif                              player.mp <= BaseMP + sets.midcast.EMNDPotency[4].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDPotency[4])
                        elseif                              player.mp <= BaseMP + sets.midcast.EMNDPotency[3].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDPotency[3])
                        elseif ForceSwapThreshold == 25  or player.mp <= BaseMP + sets.midcast.EMNDPotency[2].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDPotency[2])
                        elseif                              player.mp <= BaseMP + sets.midcast.EMNDPotency[1].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDPotency[1])
                        elseif                              player.mp <= BaseMP + sets.midcast.EMNDPotency[0].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDPotency[0]) end
                    
                    else -- #EMNDMacc
        
                        if                                  player.mp <= BaseMP + sets.midcast.EMNDMacc[12].MP + SubJobMP - Weakened then equip(sets.midcast.EMNDMacc[12])
                        elseif ForceSwapThreshold == 100 or player.mp <= BaseMP + sets.midcast.EMNDMacc[11].MP + SubJobMP - Weakened then equip(sets.midcast.EMNDMacc[11])
                        elseif                              player.mp <= BaseMP + sets.midcast.EMNDMacc[10].MP + SubJobMP - Weakened then equip(sets.midcast.EMNDMacc[10])
                        elseif                              player.mp <= BaseMP + sets.midcast.EMNDMacc[9].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDMacc[9])
                        elseif ForceSwapThreshold == 75  or player.mp <= BaseMP + sets.midcast.EMNDMacc[8].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDMacc[8])
                        elseif                              player.mp <= BaseMP + sets.midcast.EMNDMacc[7].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDMacc[7])
                        elseif                              player.mp <= BaseMP + sets.midcast.EMNDMacc[6].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDMacc[6])
                        elseif ForceSwapThreshold == 50  or player.mp <= BaseMP + sets.midcast.EMNDMacc[5].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDMacc[5])
                        elseif                              player.mp <= BaseMP + sets.midcast.EMNDMacc[4].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDMacc[4])
                        elseif                              player.mp <= BaseMP + sets.midcast.EMNDMacc[3].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDMacc[3])
                        elseif ForceSwapThreshold == 25  or player.mp <= BaseMP + sets.midcast.EMNDMacc[2].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDMacc[2])
                        elseif                              player.mp <= BaseMP + sets.midcast.EMNDMacc[1].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDMacc[1])
                        elseif                              player.mp <= BaseMP + sets.midcast.EMNDMacc[0].MP  + SubJobMP - Weakened then equip(sets.midcast.EMNDMacc[0]) end
                    
                    end
        
                    if (ForceSwapThreshold >= 25 or player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons[spell.element].MP + SubJobMP - Weakened) and MeleeMode == "Off" then equip(sets.Weapons[spell.element]) end
                
                end
            
            elseif spell.type == "BlackMagic" then
            
                if EnmityMode == "On" and (string.find(spell.english,'Blind') or 
                                           string.find(spell.english,'Dispel') or
                                           string.find(spell.english,'Gravity') or
                                           string.find(spell.english,'Sleep')) then -- #Enmity
                    
                    if     player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons.Enmity.MP + SubJobMP - Weakened and MeleeMode == "Off" then equip(sets.Weapons.Enmity)
                    elseif                                                                                        MeleeMode == "Off" then equip(sets.Weapons.MP) end
            
                    if                                  player.mp <= BaseMP + sets.midcast.Enmity[12].MP + SubJobMP - Weakened then equip(sets.midcast.Enmity[12])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[11].MP + SubJobMP - Weakened then equip(sets.midcast.Enmity[11])
                    elseif ForceSwapThreshold == 100 or player.mp <= BaseMP + sets.midcast.Enmity[10].MP + SubJobMP - Weakened then equip(sets.midcast.Enmity[10])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[9].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[9])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[8].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[8])
                    elseif ForceSwapThreshold ==  75 or player.mp <= BaseMP + sets.midcast.Enmity[7].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[7])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[6].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[6])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[5].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[5])
                    elseif ForceSwapThreshold ==  50 or player.mp <= BaseMP + sets.midcast.Enmity[4].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[4])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[3].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[3])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[2].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[2])
                    elseif ForceSwapThreshold ==  25 or player.mp <= BaseMP + sets.midcast.Enmity[1].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[1])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[0].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[0]) end
            
                elseif EnfeebleMode == "Potency/Haste" and (string.find(spell.english,'Bind') or
                                                            string.find(spell.english,'Gravity') or
                                                            string.find(spell.english,'Sleep')) then -- #EINTHaste
            
                    if     ForceSwapThreshold == 100 or player.mp <= BaseMP + sets.midcast.EINTHaste[11].MP + SubJobMP - Weakened then equip(sets.midcast.EINTHaste[11])
                    elseif                              player.mp <= BaseMP + sets.midcast.EINTHaste[10].MP + SubJobMP - Weakened then equip(sets.midcast.EINTHaste[10])
                    elseif                              player.mp <= BaseMP + sets.midcast.EINTHaste[9].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTHaste[9])
                    elseif ForceSwapThreshold ==  75 or player.mp <= BaseMP + sets.midcast.EINTHaste[8].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTHaste[8])
                    elseif                              player.mp <= BaseMP + sets.midcast.EINTHaste[7].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTHaste[7])
                    elseif                              player.mp <= BaseMP + sets.midcast.EINTHaste[6].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTHaste[6])
                    elseif ForceSwapThreshold ==  50 or player.mp <= BaseMP + sets.midcast.EINTHaste[5].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTHaste[5])
                    elseif                              player.mp <= BaseMP + sets.midcast.EINTHaste[4].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTHaste[4])
                    elseif                              player.mp <= BaseMP + sets.midcast.EINTHaste[3].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTHaste[3])
                    elseif ForceSwapThreshold ==  25 or player.mp <= BaseMP + sets.midcast.EINTHaste[2].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTHaste[2])
                    elseif                              player.mp <= BaseMP + sets.midcast.EINTHaste[1].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTHaste[1])
                    elseif                              player.mp <= BaseMP + sets.midcast.EINTHaste[0].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTHaste[0]) end
        
                    if (ForceSwapThreshold >= 25 or player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons[spell.element].MP + SubJobMP - Weakened) and MeleeMode == "Off" then equip(sets.Weapons[spell.element]) end
                    
                else-- #EINTMacc
                    
                    if     ForceSwapThreshold == 100 or player.mp <= BaseMP + sets.midcast.EINTMacc[11].MP + SubJobMP - Weakened then equip(sets.midcast.EINTMacc[11])
                    elseif                              player.mp <= BaseMP + sets.midcast.EINTMacc[10].MP + SubJobMP - Weakened then equip(sets.midcast.EINTMacc[10])
                    elseif                              player.mp <= BaseMP + sets.midcast.EINTMacc[9].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTMacc[9])
                    elseif ForceSwapThreshold ==  75 or player.mp <= BaseMP + sets.midcast.EINTMacc[8].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTMacc[8])
                    elseif                              player.mp <= BaseMP + sets.midcast.EINTMacc[7].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTMacc[7])
                    elseif                              player.mp <= BaseMP + sets.midcast.EINTMacc[6].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTMacc[6])
                    elseif ForceSwapThreshold ==  50 or player.mp <= BaseMP + sets.midcast.EINTMacc[5].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTMacc[5])
                    elseif                              player.mp <= BaseMP + sets.midcast.EINTMacc[4].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTMacc[4])
                    elseif                              player.mp <= BaseMP + sets.midcast.EINTMacc[3].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTMacc[3])
                    elseif ForceSwapThreshold ==  25 or player.mp <= BaseMP + sets.midcast.EINTMacc[2].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTMacc[2])
                    elseif                              player.mp <= BaseMP + sets.midcast.EINTMacc[1].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTMacc[1])
                    elseif                              player.mp <= BaseMP + sets.midcast.EINTMacc[0].MP  + SubJobMP - Weakened then equip(sets.midcast.EINTMacc[0]) end
        
                    if (ForceSwapThreshold >= 25 or player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons[spell.element].MP + SubJobMP - Weakened) and MeleeMode == "Off" then equip(sets.Weapons[spell.element]) end
                    
                end
            
            end
        
        elseif spell.skill == "Elemental Magic" then
            
            if EnmityMode == "Off" and
              (spell.english == 'Burn' or
               spell.english == 'Frost' or
               spell.english == 'Choke' or
               spell.english == 'Rasp' or
               spell.english == 'Shock' or
               spell.english == 'Drown') then -- #EleDebuffs
               
                if     player.mp <= BaseMP + sets.midcast.EleDebuffs[11].MP + SubJobMP - Weakened then equip(sets.midcast.EleDebuffs[11])
                elseif player.mp <= BaseMP + sets.midcast.EleDebuffs[10].MP + SubJobMP - Weakened then equip(sets.midcast.EleDebuffs[10])
                elseif player.mp <= BaseMP + sets.midcast.EleDebuffs[9].MP  + SubJobMP - Weakened then equip(sets.midcast.EleDebuffs[9])
                elseif player.mp <= BaseMP + sets.midcast.EleDebuffs[8].MP  + SubJobMP - Weakened then equip(sets.midcast.EleDebuffs[8])
                elseif player.mp <= BaseMP + sets.midcast.EleDebuffs[7].MP  + SubJobMP - Weakened then equip(sets.midcast.EleDebuffs[7])
                elseif player.mp <= BaseMP + sets.midcast.EleDebuffs[6].MP  + SubJobMP - Weakened then equip(sets.midcast.EleDebuffs[6])
                elseif player.mp <= BaseMP + sets.midcast.EleDebuffs[5].MP  + SubJobMP - Weakened then equip(sets.midcast.EleDebuffs[5])
                elseif player.mp <= BaseMP + sets.midcast.EleDebuffs[4].MP  + SubJobMP - Weakened then equip(sets.midcast.EleDebuffs[4])
                elseif player.mp <= BaseMP + sets.midcast.EleDebuffs[3].MP  + SubJobMP - Weakened then equip(sets.midcast.EleDebuffs[3])
                elseif player.mp <= BaseMP + sets.midcast.EleDebuffs[2].MP  + SubJobMP - Weakened then equip(sets.midcast.EleDebuffs[2])
                elseif player.mp <= BaseMP + sets.midcast.EleDebuffs[1].MP  + SubJobMP - Weakened then equip(sets.midcast.EleDebuffs[1])
                elseif player.mp <= BaseMP + sets.midcast.EleDebuffs[0].MP  + SubJobMP - Weakened then equip(sets.midcast.EleDebuffs[0]) end
                
            elseif ElementalMode == "Potency" then
            
                if weathercheck(spell.element) == 'None' then -- #NINTPotency
            
                    if                                  player.mp - spell.mp_cost <= (BaseMP + sets.midcast.NINTPotency[13].MP + SubJobMP - Weakened) * .5 then equip(sets.midcast.NINTPotency[13])
                    elseif ForceSwapThreshold == 100 or player.mp                 <=  BaseMP + sets.midcast.NINTPotency[12].MP + SubJobMP - Weakened       then equip(sets.midcast.NINTPotency[12])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotency[11].MP + SubJobMP - Weakened       then equip(sets.midcast.NINTPotency[11])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotency[10].MP + SubJobMP - Weakened       then equip(sets.midcast.NINTPotency[10])
                    elseif ForceSwapThreshold ==  75 or player.mp                 <=  BaseMP + sets.midcast.NINTPotency[9].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotency[9])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotency[8].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotency[8])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotency[7].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotency[7])
                    elseif ForceSwapThreshold ==  50 or player.mp                 <=  BaseMP + sets.midcast.NINTPotency[6].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotency[6])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotency[5].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotency[5])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotency[4].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotency[4])
                    elseif ForceSwapThreshold ==  25 or player.mp                 <=  BaseMP + sets.midcast.NINTPotency[3].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotency[3])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotency[2].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotency[2])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotency[1].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotency[1])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotency[0].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotency[0]) end
                
                else -- #ObiNINTPotency
            
                    if                                  player.mp - spell.mp_cost <= (BaseMP + sets.midcast.NINTPotencyObi[13].MP + SubJobMP - Weakened) * .5 then equip(sets.midcast.NINTPotencyObi[13], sets.Obis[spell.element])
                    elseif ForceSwapThreshold == 100 or player.mp                 <=  BaseMP + sets.midcast.NINTPotencyObi[12].MP + SubJobMP - Weakened       then equip(sets.midcast.NINTPotencyObi[12], sets.Obis[spell.element])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotencyObi[11].MP + SubJobMP - Weakened       then equip(sets.midcast.NINTPotencyObi[11], sets.Obis[spell.element])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotencyObi[10].MP + SubJobMP - Weakened       then equip(sets.midcast.NINTPotencyObi[10], sets.Obis[spell.element])
                    elseif ForceSwapThreshold ==  75 or player.mp                 <=  BaseMP + sets.midcast.NINTPotencyObi[9].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotencyObi[9],  sets.Obis[spell.element])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotencyObi[8].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotencyObi[8],  sets.Obis[spell.element])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotencyObi[7].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotencyObi[7],  sets.Obis[spell.element])
                    elseif ForceSwapThreshold ==  50 or player.mp                 <=  BaseMP + sets.midcast.NINTPotencyObi[6].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotencyObi[6],  sets.Obis[spell.element])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotencyObi[5].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotencyObi[5],  sets.Obis[spell.element])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotencyObi[4].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotencyObi[4],  sets.Obis[spell.element])
                    elseif ForceSwapThreshold ==  25 or player.mp                 <=  BaseMP + sets.midcast.NINTPotencyObi[3].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotencyObi[3],  sets.Obis[spell.element])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotencyObi[2].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotencyObi[2])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotencyObi[1].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotencyObi[1])
                    elseif                              player.mp                 <=  BaseMP + sets.midcast.NINTPotencyObi[0].MP  + SubJobMP - Weakened       then equip(sets.midcast.NINTPotencyObi[0]) end
                
                end
            
            else-- ElementalMode == "Macc"
            
                if weathercheck(spell.element) == 'None' then -- #NINTMacc
            
                    if     ForceSwapThreshold == 100 or player.mp <= BaseMP + sets.midcast.NINTMacc[11].MP + SubJobMP - Weakened then equip(sets.midcast.NINTMacc[11])
                    elseif                              player.mp <= BaseMP + sets.midcast.NINTMacc[10].MP + SubJobMP - Weakened then equip(sets.midcast.NINTMacc[10])
                    elseif                              player.mp <= BaseMP + sets.midcast.NINTMacc[9].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMacc[9])
                    elseif ForceSwapThreshold ==  75 or player.mp <= BaseMP + sets.midcast.NINTMacc[8].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMacc[8])
                    elseif                              player.mp <= BaseMP + sets.midcast.NINTMacc[7].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMacc[7])
                    elseif                              player.mp <= BaseMP + sets.midcast.NINTMacc[6].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMacc[6])
                    elseif ForceSwapThreshold ==  50 or player.mp <= BaseMP + sets.midcast.NINTMacc[5].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMacc[5])
                    elseif                              player.mp <= BaseMP + sets.midcast.NINTMacc[4].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMacc[4])
                    elseif                              player.mp <= BaseMP + sets.midcast.NINTMacc[3].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMacc[3])
                    elseif ForceSwapThreshold ==  25 or player.mp <= BaseMP + sets.midcast.NINTMacc[2].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMacc[2])
                    elseif                              player.mp <= BaseMP + sets.midcast.NINTMacc[1].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMacc[1])
                    elseif                              player.mp <= BaseMP + sets.midcast.NINTMacc[0].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMacc[0]) end
                
                else -- #ObiNINTMacc
            
                    if     ForceSwapThreshold == 100 or player.mp <= BaseMP + sets.midcast.NINTMaccObi[11].MP + SubJobMP - Weakened then equip(sets.midcast.NINTMaccObi[11], sets.Obis[spell.element])
                    elseif                              player.mp <= BaseMP + sets.midcast.NINTMaccObi[10].MP + SubJobMP - Weakened then equip(sets.midcast.NINTMaccObi[10], sets.Obis[spell.element])
                    elseif                              player.mp <= BaseMP + sets.midcast.NINTMaccObi[9].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMaccObi[9],  sets.Obis[spell.element])
                    elseif ForceSwapThreshold ==  75 or player.mp <= BaseMP + sets.midcast.NINTMaccObi[8].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMaccObi[8],  sets.Obis[spell.element])
                    elseif                              player.mp <= BaseMP + sets.midcast.NINTMaccObi[7].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMaccObi[7],  sets.Obis[spell.element])
                    elseif                              player.mp <= BaseMP + sets.midcast.NINTMaccObi[6].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMaccObi[6],  sets.Obis[spell.element])
                    elseif ForceSwapThreshold ==  50 or player.mp <= BaseMP + sets.midcast.NINTMaccObi[5].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMaccObi[5],  sets.Obis[spell.element])
                    elseif                              player.mp <= BaseMP + sets.midcast.NINTMaccObi[4].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMaccObi[4],  sets.Obis[spell.element])
                    elseif                              player.mp <= BaseMP + sets.midcast.NINTMaccObi[3].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMaccObi[3])
                    elseif ForceSwapThreshold ==  25 or player.mp <= BaseMP + sets.midcast.NINTMaccObi[2].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMaccObi[2])
                    elseif                              player.mp <= BaseMP + sets.midcast.NINTMaccObi[1].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMaccObi[1])
                    elseif                              player.mp <= BaseMP + sets.midcast.NINTMaccObi[0].MP  + SubJobMP - Weakened then equip(sets.midcast.NINTMaccObi[0]) end
                
                end
            
            end
        
            if (ForceSwapThreshold >= 25 or player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons[spell.element].MP + SubJobMP - Weakened) and MeleeMode == "Off" then equip(sets.Weapons[spell.element]) end
            
        elseif spell.skill == "Healing Magic" then
        
            if string.find(spell.english,'Reraise') and EnmityMode == "Off" then -- #ConserveMP
            
                if     player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons.Earth.MP + SubJobMP - Weakened and MeleeMode == "Off" then equip(sets.Weapons.Earth)
                elseif                                                                                       MeleeMode == "Off" then equip(sets.Weapons.MP) end
                    
                if     player.mp <= BaseMP + sets.midcast.ConserveMP[5].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[5])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[4].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[4])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[3].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[3])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[2].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[2])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[1].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[1])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[0].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[0]) end
            
            elseif (string.find(spell.english,'na') or string.find(spell.english,'Raise')) and EnmityMode == "Off" then -- #Haste
            
                if     player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons.Earth.MP + SubJobMP - Weakened and MeleeMode == "Off" then equip(sets.Weapons.Earth)
                elseif                                                                                       MeleeMode == "Off" then equip(sets.Weapons.MP) end
            
                if     player.mp <= BaseMP + sets.midcast.Haste[6].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[6])
                elseif player.mp <= BaseMP + sets.midcast.Haste[5].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[5])
                elseif player.mp <= BaseMP + sets.midcast.Haste[4].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[4])
                elseif player.mp <= BaseMP + sets.midcast.Haste[3].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[3])
                elseif player.mp <= BaseMP + sets.midcast.Haste[2].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[2])
                elseif player.mp <= BaseMP + sets.midcast.Haste[1].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[1]) 
                elseif player.mp <= BaseMP + sets.midcast.Haste[0].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[0]) end
            
            elseif string.find(spell.english,'Cur') then
            
                if EnmityMode == "Off" then -- #HMND
                
                    if     player.mp <= BaseMP + sets.midcast.HMND[11].MP + SubJobMP - Weakened then equip(sets.midcast.HMND[11])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[10].MP + SubJobMP - Weakened then equip(sets.midcast.HMND[10])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[9].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[9])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[8].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[8])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[7].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[7])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[6].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[6])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[5].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[5])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[4].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[4])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[3].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[3])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[2].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[2])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[1].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[1])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[0].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[0]) end
                    
                    if     player.mp <= BaseMP + sets.midcast.HMND[5].MP + SubJobMP - Weakened and weathercheck(spell.element) ~= 'None' then equip(sets.Obis[spell.element]) end
                    
                else -- #Enmity
            
                    if                                  player.mp <= BaseMP + sets.midcast.Enmity[12].MP + SubJobMP - Weakened then equip(sets.midcast.Enmity[12])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[11].MP + SubJobMP - Weakened then equip(sets.midcast.Enmity[11])
                    elseif ForceSwapThreshold == 100 or player.mp <= BaseMP + sets.midcast.Enmity[10].MP + SubJobMP - Weakened then equip(sets.midcast.Enmity[10])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[9].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[9])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[8].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[8])
                    elseif ForceSwapThreshold ==  75 or player.mp <= BaseMP + sets.midcast.Enmity[7].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[7])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[6].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[6])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[5].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[5])
                    elseif ForceSwapThreshold ==  50 or player.mp <= BaseMP + sets.midcast.Enmity[4].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[4])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[3].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[3])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[2].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[2])
                    elseif ForceSwapThreshold ==  25 or player.mp <= BaseMP + sets.midcast.Enmity[1].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[1])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[0].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[0]) end
                
                end
        
                if (ForceSwapThreshold >= 25 or player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons[spell.element].MP + SubJobMP - Weakened) and MeleeMode == "Off" then equip(sets.Weapons[spell.element]) end
        
            end
        
        elseif spell.skill == "Dark Magic" and EnmityMode == "Off" then
		
			local AspirBuffer = 0
            
            if spell.english == "Tractor" then -- #ConserveMP
            
                if     player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons.Earth.MP + SubJobMP - Weakened and MeleeMode == "Off" then equip(sets.Weapons.Earth)
                elseif                                                                                       MeleeMode == "Off" then equip(sets.Weapons.MP) end
                    
                if     player.mp <= BaseMP + sets.midcast.ConserveMP[5].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[5])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[4].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[4])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[3].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[3])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[2].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[2])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[1].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[1])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[0].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[0]) end
            
            elseif spell.english == "Drain" or
                   spell.english == "Aspir" then
                   
                if spell.english == "Aspir" then AspirBuffer = 150 end -- Leave room for Aspir to recover MP --
                
                if weathercheck(spell.element) == 'None' then -- #DINT
            
                    if     player.mp <= BaseMP + sets.midcast.DINT[11].MP + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINT[11])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[10].MP + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINT[10])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[9].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINT[9])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[8].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINT[8])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[7].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINT[7])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[6].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINT[6])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[5].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINT[5])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[4].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINT[4])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[3].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINT[3])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[2].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINT[2])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[1].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINT[1])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[0].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINT[0]) end
                    
                else -- #ObiDINT
                
                    AspirBuffer = AspirBuffer * 1.15
            
                    if     player.mp <= BaseMP + sets.midcast.DINTObi[11].MP + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINTObi[11], sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[10].MP + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINTObi[10], sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[9].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINTObi[9],  sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[8].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINTObi[8],  sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[7].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINTObi[7],  sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[6].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINTObi[6],  sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[5].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINTObi[5],  sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[4].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINTObi[4],  sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[3].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINTObi[3],  sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[2].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINTObi[2],  sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[1].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINTObi[1])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[0].MP  + SubJobMP - Weakened - AspirBuffer then equip(sets.midcast.DINTObi[0]) end
                
                end
            
            else
                
                if weathercheck(spell.element) == 'None' then -- #DINT
            
                    if     player.mp <= BaseMP + sets.midcast.DINT[11].MP + SubJobMP - Weakened then equip(sets.midcast.DINT[11])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[10].MP + SubJobMP - Weakened then equip(sets.midcast.DINT[10])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[9].MP  + SubJobMP - Weakened then equip(sets.midcast.DINT[9])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[8].MP  + SubJobMP - Weakened then equip(sets.midcast.DINT[8])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[7].MP  + SubJobMP - Weakened then equip(sets.midcast.DINT[7])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[6].MP  + SubJobMP - Weakened then equip(sets.midcast.DINT[6])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[5].MP  + SubJobMP - Weakened then equip(sets.midcast.DINT[5])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[4].MP  + SubJobMP - Weakened then equip(sets.midcast.DINT[4])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[3].MP  + SubJobMP - Weakened then equip(sets.midcast.DINT[3])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[2].MP  + SubJobMP - Weakened then equip(sets.midcast.DINT[2])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[1].MP  + SubJobMP - Weakened then equip(sets.midcast.DINT[1])
                    elseif player.mp <= BaseMP + sets.midcast.DINT[0].MP  + SubJobMP - Weakened then equip(sets.midcast.DINT[0]) end
                    
                else -- #ObiDINT
            
                    if     player.mp <= BaseMP + sets.midcast.DINTObi[11].MP + SubJobMP - Weakened then equip(sets.midcast.DINTObi[11], sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[10].MP + SubJobMP - Weakened then equip(sets.midcast.DINTObi[10], sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[9].MP  + SubJobMP - Weakened then equip(sets.midcast.DINTObi[9],  sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[8].MP  + SubJobMP - Weakened then equip(sets.midcast.DINTObi[8],  sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[7].MP  + SubJobMP - Weakened then equip(sets.midcast.DINTObi[7],  sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[6].MP  + SubJobMP - Weakened then equip(sets.midcast.DINTObi[6],  sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[5].MP  + SubJobMP - Weakened then equip(sets.midcast.DINTObi[5],  sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[4].MP  + SubJobMP - Weakened then equip(sets.midcast.DINTObi[4],  sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[3].MP  + SubJobMP - Weakened then equip(sets.midcast.DINTObi[3],  sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[2].MP  + SubJobMP - Weakened then equip(sets.midcast.DINTObi[2],  sets.Obis[spell.element])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[1].MP  + SubJobMP - Weakened then equip(sets.midcast.DINTObi[1])
                    elseif player.mp <= BaseMP + sets.midcast.DINTObi[0].MP  + SubJobMP - Weakened then equip(sets.midcast.DINTObi[0]) end
                
                end
            
            end
        
            if (ForceSwapThreshold >= 25 or player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons[spell.element].MP + SubJobMP - Weakened) and MeleeMode == "Off" then equip(sets.Weapons[spell.element]) end
        
        elseif spell.skill == "Blue Magic" then
        
            if spell.english == "Battle Dance" or
               spell.english == "Bludgeon" or
               spell.english == "Claw Cyclone" or
               spell.english == "Grand Slam" or
               spell.english == "Helldive" or
               spell.english == "Screwdriver" or
               spell.english == "Smite of Rage" then -- #Accuracy

                if     ForceSwapThreshold == 100 or player.mp <= BaseMP + sets.Accuracy[11].MP + SubJobMP - Weakened then equip(sets.Accuracy[11])
                elseif                              player.mp <= BaseMP + sets.Accuracy[10].MP + SubJobMP - Weakened then equip(sets.Accuracy[10])
                elseif                              player.mp <= BaseMP + sets.Accuracy[9].MP  + SubJobMP - Weakened then equip(sets.Accuracy[9])
                elseif ForceSwapThreshold == 75  or player.mp <= BaseMP + sets.Accuracy[8].MP  + SubJobMP - Weakened then equip(sets.Accuracy[8])
                elseif                              player.mp <= BaseMP + sets.Accuracy[7].MP  + SubJobMP - Weakened then equip(sets.Accuracy[7])
                elseif                              player.mp <= BaseMP + sets.Accuracy[6].MP  + SubJobMP - Weakened then equip(sets.Accuracy[6])
                elseif ForceSwapThreshold == 50  or player.mp <= BaseMP + sets.Accuracy[5].MP  + SubJobMP - Weakened then equip(sets.Accuracy[5])
                elseif                              player.mp <= BaseMP + sets.Accuracy[4].MP  + SubJobMP - Weakened then equip(sets.Accuracy[4])
                elseif                              player.mp <= BaseMP + sets.Accuracy[3].MP  + SubJobMP - Weakened then equip(sets.Accuracy[3])
                elseif ForceSwapThreshold == 25  or player.mp <= BaseMP + sets.Accuracy[2].MP  + SubJobMP - Weakened then equip(sets.Accuracy[2])
                elseif                              player.mp <= BaseMP + sets.Accuracy[1].MP  + SubJobMP - Weakened then equip(sets.Accuracy[1])
                elseif                              player.mp <= BaseMP + sets.Accuracy[0].MP  + SubJobMP - Weakened then equip(sets.Accuracy[0]) end
            
            elseif spell.english == "Healing Breeze" or
                   spell.english == "Pollen" or
                   spell.english == "Wild Carrot" then
                               
                if EnmityMode == "Off" then -- #HMND
                
                    if     player.mp <= BaseMP + sets.midcast.HMND[11].MP + SubJobMP - Weakened then equip(sets.midcast.HMND[11])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[10].MP + SubJobMP - Weakened then equip(sets.midcast.HMND[10])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[9].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[9])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[8].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[8])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[7].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[7])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[6].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[6])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[5].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[5])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[4].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[4])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[3].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[3])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[2].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[2])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[1].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[1])
                    elseif player.mp <= BaseMP + sets.midcast.HMND[0].MP  + SubJobMP - Weakened then equip(sets.midcast.HMND[0]) end
                    
                else -- #Enmity
            
                    if                                  player.mp <= BaseMP + sets.midcast.Enmity[12].MP + SubJobMP - Weakened then equip(sets.midcast.Enmity[12])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[11].MP + SubJobMP - Weakened then equip(sets.midcast.Enmity[11])
                    elseif ForceSwapThreshold == 100 or player.mp <= BaseMP + sets.midcast.Enmity[10].MP + SubJobMP - Weakened then equip(sets.midcast.Enmity[10])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[9].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[9])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[8].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[8])
                    elseif ForceSwapThreshold ==  75 or player.mp <= BaseMP + sets.midcast.Enmity[7].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[7])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[6].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[6])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[5].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[5])
                    elseif ForceSwapThreshold ==  50 or player.mp <= BaseMP + sets.midcast.Enmity[4].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[4])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[3].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[3])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[2].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[2])
                    elseif ForceSwapThreshold ==  25 or player.mp <= BaseMP + sets.midcast.Enmity[1].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[1])
                    elseif                              player.mp <= BaseMP + sets.midcast.Enmity[0].MP  + SubJobMP - Weakened then equip(sets.midcast.Enmity[0]) end
                
                end
                
                if player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons[Light].MP + SubJobMP - Weakened and MeleeMode == "Off" then equip(sets.Weapons[Light]) end
                
            else -- #ConserveMP
            
                if     player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons.Earth.MP + SubJobMP - Weakened and MeleeMode == "Off" then equip(sets.Weapons.Earth)
                elseif                                                                                       MeleeMode == "Off" then equip(sets.Weapons.MP) end
                    
                if     player.mp <= BaseMP + sets.midcast.ConserveMP[5].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[5])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[4].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[4])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[3].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[3])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[2].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[2])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[1].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[1])
                elseif player.mp <= BaseMP + sets.midcast.ConserveMP[0].MP + SubJobMP - Weakened then equip(sets.midcast.ConserveMP[0]) end
            
            end
        
        end
    end
end


function aftercast(spell)

    CastingSpell = 0
    undulate.counter = 0
    
    PreviousSetName = ""
    IdleSetName = ""

    if spell.english ~= 'Convert' then
    
		equip(sets.MaxMP)
        send_command('wait .2;gs c Determine_Idle_Set')
        
    end
    
end

function status_change(new,old)

    undulate.counter = 0
    
    PreviousSetName = ""
    IdleSetName = ""
    
    if     new == "Idle" then
        undulationFrequency = 450
    elseif new == "Resting" then
        undulationFrequency = 270
        RestingStarted = os.time()
    elseif new == "Engaged" then
        undulationFrequency = 130
    end
    
    if FPSMode == 30 then undulationFrequency = undulationFrequency * .5 end
    
	equip(sets.MaxMP)
    send_command('wait .2;gs c Determine_Idle_Set')
    
end


function self_command(command)

    undulate.counter = 0

    if     command == 'Reset' then
        
        MDTLevel = 0
        PDTLevel = 0
        CastingSpell = 0
        PreviousSetName = ""
        IdleSetName = ""
        
        if PanicLevel == 1 or LockMP == 1 then
            PanicLevel = 0
            LockMP = 0
            send_command('gs enable all')
        end
    
    elseif command == 'MDT' then
    
        if MDTLevel == 0 then
            
            PDTLevel = 0
            MDTLevel = 1
            
            if PanicLevel == 1 then
                send_command('gs enable all') -- Allow to switch panic set, without reseting
            end
            
        elseif MDTLevel == 1 then
        
            PanicLevel = 1
            
        end
    
    elseif command == 'PDT' then
    
        if PDTLevel == 0 then
        
            MDTLevel = 0
            PDTLevel = 1
            
            if PanicLevel == 1 then
                send_command('gs enable all') -- Allow to switch panic set, without reseting
            end
            
        elseif PDTLevel == 1 then
        
            PanicLevel = 1
            
        end
        
    elseif command == 'MPLock' then
    
        if MeleeMode == "Off" then equip(sets.Weapons.MP) end
		
		if TaruMode == "Off" then equip(sets.MaxMP)
		else                      equip(sets.TaruMP) end
    
        if LockMP == 1 then
            
            send_command('gs disable all')
            
        end
        
        LockMP = 1
        undulate.counter = 0
        
    elseif command == 'TaruModeOn' then
    
        if MeleeMode == "Off" then equip(sets.Weapons.MP) end
        equip(sets.TaruMP)
        
        TaruMode = "On"
		
        undulate.counter = 0
        
    elseif command == 'TaruModeOff' then
    
        TaruMode = "Off"
        
    elseif command == 'Convert' then
    
        if MeleeMode == "Off" then equip(sets.Weapons.MP) end
        equip(sets.Convert)
        
    elseif command == 'ToggleEmergencyTank' then
    
        if EmergencyTank == 'Off' then
			EmergencyTankMemory = {MemberElementalMode = ElementalMode,
								   MemberEnfeebleMode = EnfeebleMode,
								   MemberMeleeGear = MeleeGear,
								   MemberEnmityMode = EnmityMode}
            ElementalMode = "Macc"
            EnfeebleMode = "Macc"
            MeleeGear = "Brick"
            EnmityMode = "On"
            EmergencyTank = "On"
            send_command('Text Status text Tank Mode')
            send_command('Text Gearset color 230 50 0')
            send_command('Text Enmity color 230 50 0')
            send_command('Text Enfeebling color 230 50 0')
            send_command('Text Elemental color 230 50 0')
        else
            SetMagicModes()
            ElementalMode = EmergencyTankMemory.MemberElementalMode
            EnfeebleMode = EmergencyTankMemory.MemberEnfeebleMode
            MeleeGear = EmergencyTankMemory.MemberMeleeGear
            EnmityMode = EmergencyTankMemory.MemberEnmityMode
            EmergencyTank = "Off"
            send_command('Text Status text')
            send_command('Text Gearset color 200 200 200')
            send_command('Text Enmity color 200 200 200')
            send_command('Text Enfeebling color 200 200 200')
            send_command('Text Elemental color 200 200 200')
        end
        
    elseif command == 'ToggleUndulations' then
        
        if UndulationsEnabled == 0 then
            send_command('Text Undulation color 50 230 20')
            UndulationsEnabled = 1
        else
            send_command('Text Undulation color 230 50 0')
            UndulationsEnabled = 0
        end
        
    elseif command == 'MenuOff' then
    
        MenuEnabled = 0
        send_command('Text Selector text')
        
    elseif command == 'MenuOn' then
    
        MenuEnabled = 1
        send_command('Text Selector text >')
        
    elseif command == 'PrevMenu' then
        -- Handle Menu Wrapping top to bottom
        if Selector_Y == Menu_Y + 40 then Selector_Y = Menu_Y + (23 * 7) + 40 -- 23 Pixels per menu entry, 7 menu entries + 40 pixels for the offset
        else                              Selector_Y = Selector_Y - 23        end
        
        send_command('Text Selector pos '.. Selector_X .. ' ' .. Selector_Y)
        
        if     Menu == 'Weapons'    then Menu = "Idle"
        elseif Menu == 'MeleeGear'  then Menu = "Weapons"
        elseif Menu == 'Tuning'     then Menu = "MeleeGear"
        elseif Menu == 'Enmity'     then Menu = "Tuning"
        elseif Menu == 'Enfeebling' then Menu = "Enmity"
        elseif Menu == 'Elemental'  then Menu = "Enfeebling"
        elseif Menu == 'ForceSwaps' then Menu = "Elemental"
        elseif Menu == 'Idle'       then Menu = "ForceSwaps" end
        
    elseif command == 'NextMenu' then
        -- Handle Menu Wrapping bottom to top
        if Selector_Y == Menu_Y + (23 * 7) + 40 then Selector_Y = Menu_Y + 40 -- the reverse of the above
        else                                         Selector_Y = Selector_Y + 23 end
        
        send_command('Text Selector pos '.. Selector_X .. ' ' .. Selector_Y)
            
        if     Menu == 'Weapons'    then Menu = "MeleeGear"
        elseif Menu == 'MeleeGear'  then Menu = "Tuning"
        elseif Menu == 'Tuning'     then Menu = "Enmity"
        elseif Menu == 'Enmity'     then Menu = "Enfeebling"
        elseif Menu == 'Enfeebling' then Menu = "Elemental"
        elseif Menu == 'Elemental'  then Menu = "ForceSwaps"
        elseif Menu == 'ForceSwaps' then Menu = "Idle"
        elseif Menu == 'Idle'       then Menu = "Weapons" end
        
    elseif command == '++' then
            
        if     Menu == 'Weapons' then
            
            if Weapon == 'MP' then
                MeleeMode = "On"
                Weapon = "JoyKraken"
                FencerSwapTPThreshold = 800
                equip(sets.Weapons.JoyKraken)
            elseif Weapon == 'JoyKraken' then
                MeleeMode = "On"
                Weapon = "JoyJustice"
                FencerSwapTPThreshold = 850
                equip(sets.Weapons.JoyJustice)
            elseif Weapon == 'JoyJustice' then
                MeleeMode = "On"
                Weapon = "EnhanceKraken"
                FencerSwapTPThreshold = 800
                equip(sets.Weapons.MP)
                equip(sets.Weapons.EnhanceKraken)
            elseif Weapon == 'EnhanceKraken' then
                MeleeMode = "On"
                Weapon = "Sword"
                FencerSwapTPThreshold = 945
                equip(sets.Weapons.Sword)
            elseif Weapon == 'Sword' then
                MeleeMode = "On"
                Weapon = "Dagger"
                FencerSwapTPThreshold = 950
                equip(sets.Weapons.Dagger)
            elseif Weapon == 'Dagger' then
                MeleeMode = "On"
                Weapon = "Club"
                FencerSwapTPThreshold = 950
                equip(sets.Weapons.Club)
            elseif Weapon == 'Club' then
                MeleeMode = "On"
                Weapon = "Enmity"
                FencerSwapTPThreshold = 945
                equip(sets.Weapons.Enmity)
            elseif Weapon == 'Enmity' then
                MeleeMode = "On"
                Weapon = "JusticeJoy"
                FencerSwapTPThreshold = 850
                equip(sets.Weapons.JusticeJoy)
            elseif Weapon == 'JusticeJoy' then
                MeleeMode = "Off"
                Weapon = "MP"
                FencerSwapTPThreshold = 910
                equip(sets.Weapons.MP)
            end
            
            configureTPsets()
            SetMagicModes()
            
        elseif Menu == 'MeleeGear' then
            
            if     MeleeGear == "Accuracy" then
                MeleeGear = "AccuracyHaste"
            elseif MeleeGear == "AccuracyHaste" then
                MeleeGear = "BrickHaste"
            elseif MeleeGear == "BrickHaste" then
                MeleeGear = "EvasionHaste"
            elseif MeleeGear == "EvasionHaste" then
                MeleeGear = "Evasion"
            elseif MeleeGear == "Evasion" then
                MeleeGear = "Brick"
            elseif MeleeGear == "Brick" then
                MeleeGear = "Accuracy"
            end
            
        elseif Menu == 'Tuning' then
		
			if HasteAccTuning < 2 then HasteAccTuning = HasteAccTuning + 1 end
        
        elseif Menu == 'Enmity' then
    
            EnmityMode = "On"
            
        elseif Menu == 'Enfeebling' then
            
            EnfeebleMode = "Macc"
            
        elseif Menu == 'Elemental' then
            
            ElementalMode = "Macc"
            
        elseif Menu == 'ForceSwaps' then
            
            if ForceSwapThreshold <= 75 then ForceSwapThreshold = ForceSwapThreshold + 25 end
    
        elseif Menu == 'Idle' then
            
            if     IdleMode == "Balanced" then
                IdleMode = "PDT"
            elseif IdleMode == "PDT" then
                IdleMode = "MDT"
            elseif IdleMode == "MDT" then
                IdleMode = "MDT"
            end
            
            
        end
    
    elseif command == '--' then
            
        if     Menu == 'Weapons' then
            
            if Weapon == 'MP' then
                MeleeMode = "On"
                Weapon = "JusticeJoy"
                FencerSwapTPThreshold = 850
                equip(sets.Weapons.JusticeJoy)
            elseif Weapon == 'JoyKraken' then
                MeleeMode = "Off"
                Weapon = "MP"
                FencerSwapTPThreshold = 910
                equip(sets.Weapons.MP)
            elseif Weapon == 'JoyJustice' then
                MeleeMode = "On"
                Weapon = "JoyKraken"
                FencerSwapTPThreshold = 800
                equip(sets.Weapons.MP)
                equip(sets.Weapons.JoyKraken)
            elseif Weapon == 'EnhanceKraken' then
                MeleeMode = "On"
                Weapon = "JoyJustice"
                FencerSwapTPThreshold = 850
                equip(sets.Weapons.JoyJustice)
            elseif Weapon == 'Sword' then
                MeleeMode = "On"
                Weapon = "EnhanceKraken"
                FencerSwapTPThreshold = 800
                equip(sets.Weapons.EnhanceKraken)
            elseif Weapon == 'Dagger' then
                MeleeMode = "On"
                Weapon = "Sword"
                FencerSwapTPThreshold = 945
                equip(sets.Weapons.Sword)
            elseif Weapon == 'Club' then
                MeleeMode = "On"
                Weapon = "Dagger"
                FencerSwapTPThreshold = 950
                equip(sets.Weapons.Dagger)
            elseif Weapon == 'Enmity' then
                MeleeMode = "On"
                Weapon = "Club"
                FencerSwapTPThreshold = 850
                equip(sets.Weapons.Club)
            elseif Weapon == 'JusticeJoy' then
                MeleeMode = "On"
                Weapon = "Enmity"
                FencerSwapTPThreshold = 945
                equip(sets.Weapons.Enmity)
            end
            
            configureTPsets()
            SetMagicModes()
            
        elseif Menu == 'MeleeGear' then
            
            if     MeleeGear == "Accuracy" then
                MeleeGear = "Brick"
            elseif MeleeGear == "AccuracyHaste" then
                MeleeGear = "Accuracy"
            elseif MeleeGear == "BrickHaste" then
                MeleeGear = "AccuracyHaste"
            elseif MeleeGear == "EvasionHaste" then
                MeleeGear = "BrickHaste"
            elseif MeleeGear == "Evasion" then
                MeleeGear = "EvasionHaste"
            elseif MeleeGear == "Brick" then
                MeleeGear = "Evasion"
            end
            
        elseif Menu == 'Tuning' then
		
			if HasteAccTuning > 0 then HasteAccTuning = HasteAccTuning - 1 end
            
        elseif Menu == 'Enmity' then
    
            EnmityMode = "Off"
            
        elseif Menu == 'Enfeebling' then
            
            EnfeebleMode = "Potency/Haste"
            
        elseif Menu == 'Elemental' then
            
            ElementalMode = "Potency"
            
        elseif Menu == 'ForceSwaps' then
            
            if ForceSwapThreshold >= 25 then ForceSwapThreshold = ForceSwapThreshold - 25 end
    
        elseif Menu == 'Idle' then
        
            if     IdleMode == "Balanced" then
                IdleMode = "Balanced"
            elseif IdleMode == "PDT" then
                IdleMode = "Balanced"
            elseif IdleMode == "MDT" then
                IdleMode = "PDT"
            end
            
        end
    
    elseif command == 'FPS30' then
    
        FPSMode = 30
		send_command('config FrameRateDivisor 2')
    
    elseif command == 'FPS60' then
    
        FPSMode = 60
		send_command('config FrameRateDivisor 1')
    
    elseif command == 'Determine_Idle_Set' then
    
        determine_idle_set()
        
    else
    
        windower.add_to_chat(123,'Dear God, what did you send me?!')
        return
        
    end
    
    if command == 'PrevMenu' or command == 'NextMenu' or command == 'MenuOff' or command == 'MenuOn' or command == '++' or command == '--' or command == 'ToggleUndulations' or command == 'ToggleEmergencyTank' then DrawMenu(0) end
    
    if CastingSpell == 0 and (command == 'Reset' or command == 'MDT' or command == 'PDT') then determine_idle_set() end

end


function DrawMenu(delay)

    if MenuEnabled == 1 then

        if     UndulationsEnabled == 1 then send_command('wait '.. delay .. ';Text Undulation text "  Undulating   "')
        else                                send_command('wait '.. delay .. ';Text Undulation text "Not Undulating "') end

        if     Weapon == "MP" then            send_command('wait '.. delay + .001 .. ';Text Weapons text "    Spells     "')
        elseif Weapon == 'JoyJustice' then    send_command('wait '.. delay + .001 .. ';Text Weapons text "Joyeuse Justice"')
        elseif Weapon == 'JusticeJoy' then    send_command('wait '.. delay + .001 .. ';Text Weapons text "Justice Joyeuse"')
        elseif Weapon == 'JoyKraken' then     send_command('wait '.. delay + .001 .. ';Text Weapons text "Joyeuse Kraken "')
        elseif Weapon == 'EnhanceKraken' then send_command('wait '.. delay + .001 .. ';Text Weapons text "Enhance Kraken "')
        elseif Weapon == "Sword" then         send_command('wait '.. delay + .001 .. ';Text Weapons text " Joyeuse Genbu "')
        elseif Weapon == "Dagger" then        send_command('wait '.. delay + .001 .. ';Text Weapons text " Hornet Genbu  "')
        elseif Weapon == "Club" then          send_command('wait '.. delay + .001 .. ';Text Weapons text " Kraken Genbu  "')
        elseif Weapon == "Enmity" then        send_command('wait '.. delay + .001 .. ';Text Weapons text " Beaver Genbu  "') end
        
        if     MeleeGear == "Accuracy" then      send_command('wait '.. delay + .002 .. ';Text Gearset text "Accuracy       "')
        elseif MeleeGear == "AccuracyHaste" then send_command('wait '.. delay + .002 .. ';Text Gearset text "Haste/Accuracy "')
        elseif MeleeGear == "BrickHaste" then    send_command('wait '.. delay + .002 .. ';Text Gearset text "Brick/Haste    "')
        elseif MeleeGear == "EvasionHaste" then  send_command('wait '.. delay + .002 .. ';Text Gearset text "Evasion/Haste  "')
        elseif MeleeGear == "Evasion" then       send_command('wait '.. delay + .002 .. ';Text Gearset text "Evasion        "')
        elseif MeleeGear == "Brick" then         send_command('wait '.. delay + .002 .. ';Text Gearset text "Brick          "') end
        
        if     HasteAccTuning == 0 then send_command('wait '.. delay + .003 .. ';Text Tuning text "++ Haste/Acc --"')
        elseif HasteAccTuning == 1 then send_command('wait '.. delay + .003 .. ';Text Tuning text "++ Haste/Acc +-"')
        elseif HasteAccTuning == 2 then send_command('wait '.. delay + .003 .. ';Text Tuning text "-+ Haste/Acc ++"') end
        
        if   EnmityMode == "Off" then send_command('wait '.. delay + .004 .. ';Text Enmity text "Enmity Off     "')
        else                          send_command('wait '.. delay + .004 .. ';Text Enmity text "Enmity On      "') end
        
        if   EnfeebleMode == 'Potency/Haste' then send_command('wait '.. delay + .005 .. ';Text Enfeebling text "Potency Enfeebs"')
        else                                      send_command('wait '.. delay + .005 .. ';Text Enfeebling text "Macc Enfeebles "') end
        
        if   ElementalMode == 'Potency' then send_command('wait '.. delay + .006 .. ';Text Elemental text "Potency Nukes  "')
        else                                 send_command('wait '.. delay + .006 .. ';Text Elemental text "Macc Nukes     "') end
        
        if     ForceSwapThreshold == 0 then   send_command('wait '.. delay + .007 .. ';Text ForceSwaps text "0% Force Swap  "')
        elseif ForceSwapThreshold == 100 then send_command('wait '.. delay + .007 .. ';Text ForceSwaps text "100% Force Swap"')
        else                                  send_command('wait '.. delay + .007 .. ';Text ForceSwaps text "'..ForceSwapThreshold..'% Force Swap "') end
        
        if     IdleMode == "Balanced" then send_command('wait '.. delay + .008 .. ';Text Idle text "Balanced Idle  "')
        elseif IdleMode == "PDT" then      send_command('wait '.. delay + .008 .. ';Text Idle text "PDT Idle       "')
        elseif IdleMode == "MDT" then      send_command('wait '.. delay + .008 .. ';Text Idle text "MDT Idle       "') end
        
    else
        send_command('wait '.. delay .. ';Text Undulation text')
        send_command('wait '.. delay .. ';Text Weapons text')
        send_command('wait '.. delay .. ';Text Gearset text')
        send_command('wait '.. delay .. ';Text Tuning text')
        send_command('wait '.. delay .. ';Text Enmity text')
        send_command('wait '.. delay .. ';Text Enfeebling text')
        send_command('wait '.. delay .. ';Text Elemental text')
        send_command('wait '.. delay .. ';Text ForceSwaps text')
        send_command('wait '.. delay .. ';Text Idle text')
    end
    
end


windower.raw_register_event('prerender',function()

    undulate.counter = undulate.counter + 1
    mov.counter = mov.counter + 1
	--if player.sub_job == "SCH" then Sublimation.counter = Sublimation.counter + 1 end
	Sublimation.counter = Sublimation.counter + 1
    
    if mov.counter>10 then
        local pl = windower.ffxi.get_mob_by_index(player.index)
        if pl and pl.x and mov.x then
            local movement = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 ) > 0.1
            if movement and not moving then
                moving = true
                send_command('gs c Determine_Idle_Set')
            elseif not movement and moving then
                moving = false
                send_command('gs c Determine_Idle_Set')
            end
        end
        if pl and pl.x then
            mov.x = pl.x
            mov.y = pl.y
            mov.z = pl.z
        end
        mov.counter = 0
    end
	
	
	if (FPSMode == 30 and Sublimation.counter >= 90) or (FPSMode==60 and Sublimation.counter >= 180) then
		
		if     buffactive['Sublimation: Activated'] then
		
			local ChargeDelta =  0
			SublimationCharge = math.floor((os.time() - SublimationStarted) / 3) * 2

			if     SublimationCharge <= 130 then -- Text Sublimation color 240 80 40
			
				ChargeDelta = SublimationCharge / 130
				
				RedBG    = 240 + (255 - 240) * ChargeDelta
				YellowBG =  80 + (255 -  80) * ChargeDelta
				BlueBG   =  40
				
				send_command('Text Sublimation color ' .. RedBG .. ' ' .. YellowBG .. ' ' .. BlueBG) -- Red Text to Yellow Text
				send_command('Text Sublimation bg_color 20 20 120') -- Blue Background
			
			elseif SublimationCharge <= 260 then -- Text Sublimation color 255 255 40
			
				ChargeDelta = (SublimationCharge - 130) / 130
				
				RedBG    = 255 - (255 -  60) * ChargeDelta
				YellowBG = 255 - (255 - 230) * ChargeDelta
				BlueBG   =  40
				
				send_command('Text Sublimation color ' .. RedBG .. ' ' .. YellowBG .. ' ' .. BlueBG) -- Yellow Text to Green Text
				send_command('Text Sublimation bg_color 20 20 120') -- Blue Background
			
			else -- Text Sublimation color 60 230 40
				
				send_command('Text Sublimation color 60 230 40') -- Green Text
				send_command('Text Sublimation bg_color 20 20 120') -- Blue Background
			
			end
			
		elseif buffactive['Sublimation: Complete'] then
		
			local ChargeDelta = SublimationCharge / 260
		
			if ChargeDelta > .35 and ChargeDelta < .65 then send_command('Text Sublimation color 255 255 255') -- White Text
			else                                            send_command('Text Sublimation color 200 200 200') end -- Light Grey Text

			if     SublimationCharge <= 130 then -- Text Sublimation bg_color 130 20 20
			
				ChargeDelta = SublimationCharge / 130
				
				RedBG    = 130 + (150 - 130) * ChargeDelta
				YellowBG =  20 + (150 -  20) * ChargeDelta
				BlueBG   =  20
				
				send_command('Text Sublimation bg_color ' .. RedBG .. ' ' .. YellowBG .. ' ' .. BlueBG) -- Red Background to Yellow Background
			
			elseif SublimationCharge <= 260 then -- Text Sublimation bg_color 150 150 20
			
				ChargeDelta = (SublimationCharge - 130) / 130
				
				RedBG    = 150 - (150 -  30) * ChargeDelta
				YellowBG = 150 - (150 - 100) * ChargeDelta
				BlueBG   =  20
				
				send_command('Text Sublimation bg_color ' .. RedBG .. ' ' .. YellowBG .. ' ' .. BlueBG) -- Yellow Background to Green Background
			
			else -- Text Sublimation bg_color 30 100 20
				
				send_command('Text Sublimation bg_color 30 100 20') -- Green Background
			
			end
		
		else
		
			SublimationCharge = 0
			
			--send_command('Text Sublimation bg_color 0 0 0')
		
		end
		
		if MenuEnabled == 1 then
		
			if     SublimationCharge ==  0 then send_command('Text Sublimation text ""')
			elseif SublimationCharge <  10 then send_command('Text Sublimation text "       ' .. SublimationCharge .. 'mp     "')
			elseif SublimationCharge < 100 then send_command('Text Sublimation text "      ' .. SublimationCharge .. 'mp     "')
			else                                send_command('Text Sublimation text "     ' .. SublimationCharge .. 'mp     "') end
			
		end
		
		Sublimation.counter = 0
	
	end
    
    if undulate.counter > undulationFrequency then
    
        if UndulationsEnabled == 1 then
            send_command('gs c Determine_Idle_Set')
        end
        
        undulate.counter = 0
    end
    
end)


function SetMagicModes()

    if MeleeMode == 'On' or
      (world.zone == 'Al\'Taieu' or
       world.zone == 'Attohwa Chasm' or
       world.zone == 'Balga\'s Dais' or
       world.zone == 'Behemoth\'s Dominion' or
       world.zone == 'Caedarva Mire' or
       world.zone == 'Dragon\'s Aery' or
       world.zone == 'Grand Palace of Hu\'Xzoi' or
       world.zone == 'Horlais Peak' or
       world.zone == 'King Ranperre\'s Tomb' or
       world.zone == 'Mount Zhayolm' or
       world.zone == 'Ru\'Aun Gardens' or
       world.zone == 'The Garden of Ru\'Hmet' or
       world.zone == 'The Shrine of Ru\'Avitau' or
       world.zone == 'Uleguerand Range' or
       world.zone == 'Ve\'Lugannon Palace' or
       world.zone == 'Wajaom Woodlands') then
       
        EnfeebleMode = "Macc"
        ElementalMode = "Macc"
        
    elseif world.zone == 'Apollyon' or
           string.find(world.zone,'Dynamis') or
           world.zone == 'Ifrit\'s Cauldron' or
           world.zone == 'Qu\'Bia Arena' or
           string.find(world.zone,'Remnants') or
           world.zone == 'Temenos' or
           world.zone == 'Valley of Sorrows' then
           
        EnfeebleMode = "Potency/Haste"
        ElementalMode = "Macc"
    
    else
    
        EnfeebleMode = "Potency/Haste"
        ElementalMode = "Potency"
    
    end
    
end


windower.register_event('zone change',function()

    SetMagicModes()
    DrawMenu(0)

end)


function sub_job_change(new,old)
	set_SubJobVars(new)
	send_command('wait 2;input /lockstyleset 1')
end


function buff_change(name,gain,buff_details)

    if name == "weakness" then
    
        if   gain == true then Weakened = (BaseMP + SubJobMP) * .75
        else                   Weakened = 0 end
		
	elseif name == "SJ Restriction" then
	
        if   gain == true then SubJobMP = 0
        else                   set_SubJobVars(player.sub_job) end
		
	elseif name == "Sublimation: Activated" and gain == true then
	
		SublimationStarted = os.time()
		
	elseif name == "Sublimation: Complete" and gain == false then
	
		send_command('wait .00;Text Sublimation text ""')
    
    end

end


function determine_idle_set()

    sets.IdleSet = {}
    PreviousSetName = IdleSetName
    IdleSetName = ""

    -- Guestimate amount of refresh in 12 seconds
    local Buffer = 4 * guesstimate_Refresh()

    if MDTLevel == 1 then -- #MDTPanic
        
        if PanicLevel == 1 then
        
            sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[9])
            IdleSetName = "MDT9"
        
        else
        
            if     player.mp + Buffer <= BaseMP + sets.MDT[8].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[8]);  IdleSetName = "MDT8"
            elseif player.mp + Buffer <= BaseMP + sets.MDT[7].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[7]);  IdleSetName = "MDT7"
            elseif player.mp + Buffer <= BaseMP + sets.MDT[6].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[6]);  IdleSetName = "MDT6"
            elseif player.mp + Buffer <= BaseMP + sets.MDT[5].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[5]);  IdleSetName = "MDT5"
            elseif player.mp + Buffer <= BaseMP + sets.MDT[4].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[4]);  IdleSetName = "MDT4"
            elseif player.mp + Buffer <= BaseMP + sets.MDT[3].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[3]);  IdleSetName = "MDT3"
            elseif player.mp + Buffer <= BaseMP + sets.MDT[2].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[2]);  IdleSetName = "MDT2"
            elseif player.mp + Buffer <= BaseMP + sets.MDT[1].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[1]);  IdleSetName = "MDT1"
            elseif player.mp + Buffer <= BaseMP + sets.MDT[0].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[0]);  IdleSetName = "MDT0"
            elseif player.mp          <= BaseMP + sets.MaxMP.MP   + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);   IdleSetName = "MaxMP" end
        
            if moving == false and player.mp + Buffer <= BaseMP + sets.MDT[9].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet, sets.MDT[9]);   IdleSetName = IdleSetName .. "|Stationary"
            else                                                                                            sets.IdleSet = set_combine(sets.IdleSet, sets.FastPants);IdleSetName = IdleSetName .. "|Moving" end
            
        end
        
        if     player.mp + Buffer <= BaseMP + sets.MaxMP.MP + sets.Weapons.MDB.MP + SubJobMP - Weakened and MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons.MDB);IdleSetName = IdleSetName .. "|SetWeapon"
        elseif                                                                                              MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons.MP); IdleSetName = IdleSetName .. "|MPWeapon" end
    
    elseif PDTLevel == 1 then -- #PDTPanic
        
        if PanicLevel == 1 then
            
            sets.IdleSet = set_combine(sets.IdleSet,sets.PDT[5])
            IdleSetName = "PDT5"
        
        else
        
            if     player.mp + Buffer <= BaseMP + sets.PDT[5].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDT[5]); IdleSetName = "PDT5"
            elseif player.mp + Buffer <= BaseMP + sets.PDT[4].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDT[4]); IdleSetName = "PDT4"
            elseif player.mp + Buffer <= BaseMP + sets.PDT[3].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDT[3]); IdleSetName = "PDT3"
            elseif player.mp + Buffer <= BaseMP + sets.PDT[2].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDT[2]); IdleSetName = "PDT2"
            elseif player.mp + Buffer <= BaseMP + sets.PDT[1].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDT[1]); IdleSetName = "PDT1"
            elseif player.mp + Buffer <= BaseMP + sets.PDT[0].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDT[0]); IdleSetName = "PDT0"
            elseif player.mp          <= BaseMP + sets.MaxMP.MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);  IdleSetName = "MaxMP" end
        
            if moving == true then sets.IdleSet = set_combine(sets.IdleSet, sets.FastPants);IdleSetName = IdleSetName .. "|Moving" end
            
        end
        
        if     player.mp + Buffer <= BaseMP + sets.MaxMP.MP + sets.Weapons.Earth.MP + SubJobMP - Weakened and MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons.Earth);IdleSetName = IdleSetName .. "|SetWeapon"
        elseif                                                                                                MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons.MP);   IdleSetName = IdleSetName .. "|MPWeapon" end
    
    elseif player.status == 'Engaged' and CastingSpell == 0 then
        
        if     MeleeGear == 'Accuracy' then -- #Accuracy
        
            if     ForceSwapThreshold == 100 or player.mp + Buffer <= BaseMP + sets.Accuracy[11].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[11]); IdleSetName = "Accuracy11"
            elseif                              player.mp + Buffer <= BaseMP + sets.Accuracy[10].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[10]); IdleSetName = "Accuracy10"
            elseif                              player.mp + Buffer <= BaseMP + sets.Accuracy[9].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[9]);  IdleSetName = "Accuracy9"
            elseif ForceSwapThreshold ==  75 or player.mp + Buffer <= BaseMP + sets.Accuracy[8].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[8]);  IdleSetName = "Accuracy8"
            elseif                              player.mp + Buffer <= BaseMP + sets.Accuracy[7].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[7]);  IdleSetName = "Accuracy7"
            elseif                              player.mp + Buffer <= BaseMP + sets.Accuracy[6].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[6]);  IdleSetName = "Accuracy6"
            elseif ForceSwapThreshold ==  50 or player.mp + Buffer <= BaseMP + sets.Accuracy[5].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[5]);  IdleSetName = "Accuracy5"
            elseif                              player.mp + Buffer <= BaseMP + sets.Accuracy[4].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[4]);  IdleSetName = "Accuracy4"
            elseif                              player.mp + Buffer <= BaseMP + sets.Accuracy[3].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[3]);  IdleSetName = "Accuracy3"
            elseif ForceSwapThreshold ==  25 or player.mp + Buffer <= BaseMP + sets.Accuracy[2].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[2]);  IdleSetName = "Accuracy2"
            elseif                              player.mp + Buffer <= BaseMP + sets.Accuracy[1].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[1]);  IdleSetName = "Accuracy1"
            elseif                              player.mp + Buffer <= BaseMP + sets.Accuracy[0].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[0]);  IdleSetName = "Accuracy0"
            else                                                                                                               sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);        IdleSetName = "MaxMP" end
    
        elseif MeleeGear == 'AccuracyHaste' then -- #AccHaste
        
            if         HasteAccTuning ==   2 and player.mp + Buffer <= BaseMP + sets.AccHaste[12].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[12]); IdleSetName = "AccHaste12"
            elseif     HasteAccTuning ==   1 and player.mp + Buffer <= BaseMP + sets.AccHaste[11].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[11]); IdleSetName = "AccHaste11"
            elseif ForceSwapThreshold == 100 or  player.mp + Buffer <= BaseMP + sets.AccHaste[10].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[10]); IdleSetName = "AccHaste10"
            elseif                               player.mp + Buffer <= BaseMP + sets.AccHaste[9].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[9]);  IdleSetName = "AccHaste9"
            elseif ForceSwapThreshold ==  75 or  player.mp + Buffer <= BaseMP + sets.AccHaste[8].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[8]);  IdleSetName = "AccHaste8"
            elseif                               player.mp + Buffer <= BaseMP + sets.AccHaste[7].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[7]);  IdleSetName = "AccHaste7"
            elseif                               player.mp + Buffer <= BaseMP + sets.AccHaste[6].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[6]);  IdleSetName = "AccHaste6"
            elseif ForceSwapThreshold ==  50 or  player.mp + Buffer <= BaseMP + sets.AccHaste[5].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[5]);  IdleSetName = "AccHaste5"
            elseif                               player.mp + Buffer <= BaseMP + sets.AccHaste[4].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[4]);  IdleSetName = "AccHaste4"
            elseif                               player.mp + Buffer <= BaseMP + sets.AccHaste[3].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[3]);  IdleSetName = "AccHaste3"
            elseif ForceSwapThreshold ==  25 or  player.mp + Buffer <= BaseMP + sets.AccHaste[2].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[2]);  IdleSetName = "AccHaste2"
            elseif                               player.mp + Buffer <= BaseMP + sets.AccHaste[1].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[1]);  IdleSetName = "AccHaste1"
            elseif                               player.mp + Buffer <= BaseMP + sets.AccHaste[0].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[0]);  IdleSetName = "AccHaste0"
            else                                                                                                                sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);        IdleSetName = "MaxMP" end
            
            if HasteAccTuning < 1 then
				if player.tp < FencerSwapTPThreshold and
				  (buffactive['enfire'] or
				   buffactive['enblizzard'] or
				   buffactive['enaero'] or
				   buffactive['enstone'] or
				   buffactive['enthunder'] or
				   buffactive['enwater'] or
				   buffactive['enfire II'] or
				   buffactive['enblizzard II'] or
				   buffactive['enaero II'] or
				   buffactive['enstone II'] or
				   buffactive['enthunder II'] or
				   buffactive['enwater II']) and
				 ((player.sub_job == "DNC" and player.hp <= 849 and player.mp + Buffer < 200 and os.time() - LastConvert < 500) or
				  (player.sub_job == "DNC" and player.hp <= 914 and player.mp + Buffer <= BaseMP + sets.AccHaste[10].MP + SubJobMP - Weakened) or
				   player.hpp <= 75) then
					sets.IdleSet = set_combine(sets.IdleSet, sets.FencerRing)
					IdleSetName = IdleSetName .. "|Fencer"
				end
			end
        
        elseif MeleeGear == 'BrickHaste' then -- #PDTHaste
        
            if     ForceSwapThreshold == 100 or player.mp + Buffer <= BaseMP + sets.PDTHaste[10].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[10]); IdleSetName = "PDTHaste10"
            elseif                              player.mp + Buffer <= BaseMP + sets.PDTHaste[9].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[9]);  IdleSetName = "PDTHaste9"
            elseif ForceSwapThreshold ==  75 or player.mp + Buffer <= BaseMP + sets.PDTHaste[8].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[8]);  IdleSetName = "PDTHaste8"
            elseif                              player.mp + Buffer <= BaseMP + sets.PDTHaste[7].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[7]);  IdleSetName = "PDTHaste7"
            elseif                              player.mp + Buffer <= BaseMP + sets.PDTHaste[6].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[6]);  IdleSetName = "PDTHaste6"
            elseif ForceSwapThreshold ==  50 or player.mp + Buffer <= BaseMP + sets.PDTHaste[5].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[5]);  IdleSetName = "PDTHaste5"
            elseif                              player.mp + Buffer <= BaseMP + sets.PDTHaste[4].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[4]);  IdleSetName = "PDTHaste4"
            elseif                              player.mp + Buffer <= BaseMP + sets.PDTHaste[3].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[3]);  IdleSetName = "PDTHaste3"
            elseif ForceSwapThreshold ==  25 or player.mp + Buffer <= BaseMP + sets.PDTHaste[2].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[2]);  IdleSetName = "PDTHaste2"
            elseif                              player.mp + Buffer <= BaseMP + sets.PDTHaste[1].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[1]);  IdleSetName = "PDTHaste1"
            elseif                              player.mp + Buffer <= BaseMP + sets.PDTHaste[0].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[0]);  IdleSetName = "PDTHaste0"
            else                                                                                                               sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);        IdleSetName = "MaxMP" end
            
        elseif MeleeGear == 'EvasionHaste' then -- #EvaHaste
        
            if     ForceSwapThreshold == 100 or player.mp + Buffer <= BaseMP + sets.EvaHaste[12].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[12]); IdleSetName = "EvaHaste12"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[11].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[11]); IdleSetName = "EvaHaste11"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[10].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[10]); IdleSetName = "EvaHaste10"
            elseif ForceSwapThreshold ==  75 or player.mp + Buffer <= BaseMP + sets.EvaHaste[9].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[9]);  IdleSetName = "EvaHaste9"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[8].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[8]);  IdleSetName = "EvaHaste8"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[7].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[7]);  IdleSetName = "EvaHaste7"
            elseif ForceSwapThreshold ==  50 or player.mp + Buffer <= BaseMP + sets.EvaHaste[6].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[6]);  IdleSetName = "EvaHaste6"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[5].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[5]);  IdleSetName = "EvaHaste5"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[4].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[4]);  IdleSetName = "EvaHaste4"
            elseif ForceSwapThreshold ==  25 or player.mp + Buffer <= BaseMP + sets.EvaHaste[3].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[3]);  IdleSetName = "EvaHaste3"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[2].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[2]);  IdleSetName = "EvaHaste2"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[1].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[1]);  IdleSetName = "EvaHaste1"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[0].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[0]);  IdleSetName = "EvaHaste0"
            else                                                                                                               sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);        IdleSetName = "MaxMP" end
            
        elseif MeleeGear == 'Brick' then -- #PDTMelee
        
            if     ForceSwapThreshold == 100 or EnmityMode == "On" or player.mp + Buffer <= BaseMP + sets.PDTMelee[12].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[12]); IdleSetName = "PDTMelee12"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[11].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[11]); IdleSetName = "PDTMelee11"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[10].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[10]); IdleSetName = "PDTMelee10"
            elseif ForceSwapThreshold ==  75 or                       player.mp + Buffer <= BaseMP + sets.PDTMelee[9].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[9]);  IdleSetName = "PDTMelee9"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[8].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[8]);  IdleSetName = "PDTMelee8"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[7].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[7]);  IdleSetName = "PDTMelee7"
            elseif ForceSwapThreshold ==  50 or                       player.mp + Buffer <= BaseMP + sets.PDTMelee[6].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[6]);  IdleSetName = "PDTMelee6"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[5].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[5]);  IdleSetName = "PDTMelee5"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[4].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[4]);  IdleSetName = "PDTMelee4"
            elseif ForceSwapThreshold ==  25 or                       player.mp + Buffer <= BaseMP + sets.PDTMelee[3].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[3]);  IdleSetName = "PDTMelee3"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[2].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[2]);  IdleSetName = "PDTMelee2"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[1].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[1]);  IdleSetName = "PDTMelee1"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[0].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[0]);  IdleSetName = "PDTMelee0"
            else                                                                                                                                     sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);        IdleSetName = "MaxMP" end
            
        end
        
        if moving == true then sets.IdleSet = set_combine(sets.IdleSet, sets.FastPants); IdleSetName = IdleSetName .. "|Moving" end
        
        if player.mp + Buffer < 200 and os.time() - LastConvert < 600 - (ConvertMerits * 20) and MeleeGear ~= 'Brick' then
            sets.IdleSet = set_combine(sets.IdleSet, sets.UrgentRefresh)
            
            IdleSetName = IdleSetName .. "|UrgentRefresh"
            
            if (string.find(world.zone,'Ashu') or
                string.find(world.zone,'Ilrusi') or
                string.find(world.zone,'Lebros') or
                string.find(world.zone,'Leujaoam') or
                string.find(world.zone,'Nyzul') or
                string.find(world.zone,'Periqia') or
                string.find(world.zone,'Remnants') or
                string.find(world.zone,'Training')) then
                
                sets.IdleSet = set_combine(sets.IdleSet, sets.BalrahnRing)
                
            end
        end
    
    elseif player.status == 'Resting' then -- #Rest
    
        local RestingBuffer = math.floor((os.time() - RestingStarted - 10) * .2) -- ticks grow by 2mp per rest tick, first tick takes 20 seconds
        RestingBuffer = 23 + (RestingBuffer > 0 and RestingBuffer or 0) -- start at 23mp but add nothing until first tick
		
        if     player.mp + Buffer + RestingBuffer + sets.HMP[10].MPH <= BaseMP + sets.HMP[10].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[10]); IdleSetName = "HMP10"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[9].MPH  <= BaseMP + sets.HMP[9].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[9]);  IdleSetName = "HMP9"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[8].MPH  <= BaseMP + sets.HMP[8].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[8]);  IdleSetName = "HMP8"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[7].MPH  <= BaseMP + sets.HMP[7].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[7]);  IdleSetName = "HMP7"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[6].MPH  <= BaseMP + sets.HMP[6].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[6]);  IdleSetName = "HMP6"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[5].MPH  <= BaseMP + sets.HMP[5].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[5]);  IdleSetName = "HMP5"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[4].MPH  <= BaseMP + sets.HMP[4].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[4]);  IdleSetName = "HMP4"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[3].MPH  <= BaseMP + sets.HMP[3].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[3]);  IdleSetName = "HMP3"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[2].MPH  <= BaseMP + sets.HMP[2].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[2]);  IdleSetName = "HMP2"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[1].MPH  <= BaseMP + sets.HMP[1].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[1]);  IdleSetName = "HMP1"
        elseif player.mp + Buffer + RestingBuffer                    >= BaseMP + sets.MaxMP.MP   + SubJobMP - Weakened and TaruMode == "On" then sets.IdleSet = set_combine(sets.IdleSet,sets.TaruMP);  IdleSetName = "TaruMP"
        else                                                                                                                                     sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);   IdleSetName = "MaxMP" end
        
        if     player.mp + Buffer + RestingBuffer + sets.HMP[0].MPH  <= BaseMP + sets.HMP[0].MP  + SubJobMP - Weakened and MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[0]);    IdleSetName = IdleSetName .. "|SetWeapon"
        elseif                                                                                                             MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons.MP);IdleSetName = IdleSetName .. "|MPWeapon" end
        
        if player.mp + Buffer + RestingBuffer + sets.HMP[5].MPH <= BaseMP + sets.HMP[5].MP + SubJobMP - Weakened and (string.find(world.zone,'Ashu') or
                                                                                                                      string.find(world.zone,'Ilrusi') or
                                                                                                                      string.find(world.zone,'Lebros') or
                                                                                                                      string.find(world.zone,'Leujaoam') or
                                                                                                                      string.find(world.zone,'Nyzul') or
                                                                                                                      string.find(world.zone,'Periqia') or
                                                                                                                      string.find(world.zone,'Remnants') or
                                                                                                                      string.find(world.zone,'Training')) then
            sets.IdleSet = set_combine(sets.IdleSet, sets.BalrahnRing)
        end
    
    elseif player.status == 'Idle' and CastingSpell == 0 then
            
        if IdleMode == "Balanced" then -- #Idle
            
            if     player.mp + Buffer <= BaseMP + sets.idle[7].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.idle[7]); IdleSetName = "idle7"
            elseif player.mp + Buffer <= BaseMP + sets.idle[6].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.idle[6]); IdleSetName = "idle6"
            elseif player.mp + Buffer <= BaseMP + sets.idle[5].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.idle[5]); IdleSetName = "idle5"
            elseif player.mp + Buffer <= BaseMP + sets.idle[4].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.idle[4]); IdleSetName = "idle4"
            elseif player.mp + Buffer <= BaseMP + sets.idle[3].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.idle[3]); IdleSetName = "idle3"
            elseif player.mp + Buffer <= BaseMP + sets.idle[2].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.idle[2]); IdleSetName = "idle2"
            elseif player.mp + Buffer <= BaseMP + sets.idle[1].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.idle[1]); IdleSetName = "idle1"
            elseif player.mp + Buffer <= BaseMP + sets.idle[0].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.idle[0]); IdleSetName = "idle0"
            elseif player.mp + Buffer >= BaseMP + sets.MaxMP.MP   + SubJobMP - Weakened and TaruMode == "On" then sets.IdleSet = set_combine(sets.IdleSet,sets.TaruMP);  IdleSetName = "TaruMP"
            else                                                                                                  sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);   IdleSetName = "MaxMP" end

            if     pet.isvalid and player.sub_job == "SMN" and player.mp + Buffer <= BaseMP + sets.MaxMP.MP + sets.Weapons[pet.element].MP + SubJobMP - Weakened and MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons[pet.element]);IdleSetName = IdleSetName .. "|AvatarWeapon";
            elseif                                             player.mp + Buffer <= BaseMP + sets.MaxMP.MP + sets.Weapons.Earth.MP        + SubJobMP - Weakened and MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons.Earth);       IdleSetName = IdleSetName .. "|SetWeapon"
            elseif                                                                                                                                                   MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons.MP);          IdleSetName = IdleSetName .. "|MPWeapon" end
        
        elseif IdleMode == "PDT" then -- #PDTIdle
        
            if     player.mp + Buffer <= BaseMP + sets.PDTidle[7].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTidle[7]); IdleSetName = "PDTidle7"
            elseif player.mp + Buffer <= BaseMP + sets.PDTidle[6].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTidle[6]); IdleSetName = "PDTidle6"
            elseif player.mp + Buffer <= BaseMP + sets.PDTidle[5].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTidle[5]); IdleSetName = "PDTidle5"
            elseif player.mp + Buffer <= BaseMP + sets.PDTidle[4].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTidle[4]); IdleSetName = "PDTidle4"
            elseif player.mp + Buffer <= BaseMP + sets.PDTidle[3].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTidle[3]); IdleSetName = "PDTidle3"
            elseif player.mp + Buffer <= BaseMP + sets.PDTidle[2].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTidle[2]); IdleSetName = "PDTidle2"
            elseif player.mp + Buffer <= BaseMP + sets.PDTidle[1].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTidle[1]); IdleSetName = "PDTidle1"
            elseif player.mp + Buffer <= BaseMP + sets.PDTidle[0].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTidle[0]); IdleSetName = "PDTidle0"
            elseif player.mp + Buffer >= BaseMP + sets.MaxMP.MP      + SubJobMP - Weakened and TaruMode == "On" then sets.IdleSet = set_combine(sets.IdleSet,sets.TaruMP);     IdleSetName = "TaruMP"
            else                                                                                                     sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);      IdleSetName = "MaxMP" end
        
            if     pet.isvalid and player.sub_job == "SMN" and player.mp + Buffer <= BaseMP + sets.MaxMP.MP + sets.Weapons[pet.element].MP + SubJobMP - Weakened and MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons[pet.element]);IdleSetName = IdleSetName .. "|AvatarWeapon";
            elseif                                             player.mp + Buffer <= BaseMP + sets.MaxMP.MP + sets.Weapons.Earth.MP + SubJobMP - Weakened and MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons.Earth);              IdleSetName = IdleSetName .. "|SetWeapon"
            elseif                                                                                                                                            MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons.MP);                 IdleSetName = IdleSetName .. "|MPWeapon" end
        
        else--IdleMode == "MDT" #MDTIdle
        
            if     player.mp + Buffer <= BaseMP + sets.MDTidle[8].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[8]); IdleSetName = "MDTidle8"
            elseif player.mp + Buffer <= BaseMP + sets.MDTidle[7].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[7]); IdleSetName = "MDTidle7"
            elseif player.mp + Buffer <= BaseMP + sets.MDTidle[6].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[6]); IdleSetName = "MDTidle6"
            elseif player.mp + Buffer <= BaseMP + sets.MDTidle[5].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[5]); IdleSetName = "MDTidle5"
            elseif player.mp + Buffer <= BaseMP + sets.MDTidle[4].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[4]); IdleSetName = "MDTidle4"
            elseif player.mp + Buffer <= BaseMP + sets.MDTidle[3].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[3]); IdleSetName = "MDTidle3"
            elseif player.mp + Buffer <= BaseMP + sets.MDTidle[2].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[2]); IdleSetName = "MDTidle2"
            elseif player.mp + Buffer <= BaseMP + sets.MDTidle[1].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[1]); IdleSetName = "MDTidle1"
            elseif player.mp + Buffer <= BaseMP + sets.MDTidle[0].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[0]); IdleSetName = "MDTidle0"
            elseif player.mp + Buffer >= BaseMP + sets.MaxMP.MP      + SubJobMP - Weakened and TaruMode == "On" then sets.IdleSet = set_combine(sets.IdleSet,sets.TaruMP);     IdleSetName = "TaruMP"
            else                                                                                                     sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);      IdleSetName = "MaxMP" end
        
            if     pet.isvalid and player.sub_job == "SMN" and player.mp + Buffer <= BaseMP + sets.MaxMP.MP + sets.Weapons[pet.element].MP + SubJobMP - Weakened and MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons[pet.element]);IdleSetName = IdleSetName .. "|AvatarWeapon";
            elseif                                             player.mp + Buffer <= BaseMP + sets.MaxMP.MP + sets.Weapons.MDB.MP + SubJobMP - Weakened and MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons.MDB);                  IdleSetName = IdleSetName .. "|SetWeapon"
            elseif                                                                                                                                          MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons.MP);                   IdleSetName = IdleSetName .. "|MPWeapon" end
        
        end
        
        if     TaruMode == "Off" and IdleMode ~= "MDT" and (moving == true or player.hp >= 999) then sets.IdleSet = set_combine(sets.IdleSet, sets.FastPants);IdleSetName = IdleSetName .. "|Moving"
        elseif TaruMode == "Off" and IdleMode == "MDT" and  moving == true                      then sets.IdleSet = set_combine(sets.IdleSet, sets.FastPants);IdleSetName = IdleSetName .. "|Moving" end
		
        if player.mp + Buffer <= BaseMP + sets.idle[2].MP + SubJobMP - Weakened and (
                                                                                     string.find(world.zone,'Ashu') or
                                                                                     string.find(world.zone,'Ilrusi') or
                                                                                     string.find(world.zone,'Lebros') or
                                                                                     string.find(world.zone,'Leujaoam') or
                                                                                     string.find(world.zone,'Nyzul') or
                                                                                     string.find(world.zone,'Periqia') or
                                                                                     string.find(world.zone,'Remnants') or
                                                                                     string.find(world.zone,'Training')
                                                                                    ) then 
            sets.IdleSet = set_combine(sets.IdleSet, sets.BalrahnRing)
        end
        
    end
    
    if IdleSetName ~= "" and PreviousSetName ~= IdleSetName then
    
        equip(sets.IdleSet)
        
    end
    
    if PanicLevel == 1 then
        send_command('gs disable all')
    end
    
end

function set_Avatar_Perpetuation_Cost()

end


function set_SubJobVars(Subjob) -- #SubjobVars

	-- if your Subjobs aren't leveled, they won't have the same MP as below, put yours here.
        if Subjob == 'BLM' then SubJobMP = 97
    elseif Subjob == 'BLU' then SubJobMP = 59
    elseif Subjob == 'DRK' then SubJobMP = 21
    elseif Subjob == 'PLD' then SubJobMP = 21
    elseif Subjob == 'SCH' then SubJobMP = 69 -- nice
    elseif Subjob == 'SMN' then SubJobMP =115
    elseif Subjob == 'WHM' then SubJobMP = 78
    else                        SubJobMP =  0 end
    
	-- if you have different sets of gear to maximize your converts, configure that here. Otherwise comment out this section.
    if Subjob == 'BLM' or
       Subjob == 'SCH' or
       Subjob == 'SMN' or
       Subjob == 'WHM' then
        sets.Convert = {ammo="Hedgehog Bomb",
                        head="Walahra Turban",
                        neck="Beak Necklace +1",
                        ear1="Astral Earring",
                        ear2="Loquacious Earring",
                        body="Goliard Saio",
                        hands="Zenith Mitts",
                        lring="Nasatya's Ring",
                        rring="Dasra's Ring",
                        back="Intensifying Cape",
                        waist="Hierarch Belt",
                        legs="Blood Cuisses",
                        feet="Llwyd's Clogs"}
    else
        sets.Convert = {ammo="Hedgehog Bomb",
                        head="Walahra Turban",
                        neck="Beak Necklace +1",
                        ear1="Astral Earring",
                        ear2="Loquacious Earring",
                        body="Goliard Saio",
                        hands="Zenith Mitts",
                        lring="Serket Ring",
                        rring="Vilma's Ring",
                        back="Intensifying Cape",
                        waist="Hierarch Belt",
                        legs="Blood Cuisses",
                        feet="Llwyd's Clogs"}
    end
    
end


function weathercheck(spell_element)
    
    local ElementalStrength = 0
    
    if                spell_element  == world.weather_element then ElementalStrength = ElementalStrength + world.weather_intensity
    elseif Weaknesses[spell_element] == world.weather_element then ElementalStrength = ElementalStrength - world.weather_intensity
    end
    
    if                spell_element  == world.day_element then ElementalStrength = ElementalStrength + 1
    elseif Weaknesses[spell_element] == world.day_element then ElementalStrength = ElementalStrength - 1
    end
    
    if ElementalStrength >= 1 and sets.Obis[spell_element]['waist'] ~= "Penitent's Rope" then return spell_element
    else                                                                                      return 'None'
    end
    
end

function Utsusemi_Check()
    for key,value in pairs(player.buff_details) do
        if player.buff_details[key].id == 66 or (player.buff_details[key].id >= 444 and player.buff_details[key].id <= 446) then -- Copy Image
            return true
        end
    end
end


function guesstimate_Refresh()

    local Ballads = 0
    local RefreshPotency = 1 -- Leave a little extra room for unexpected lag, hiccups, etc.
    
    for key,value in pairs(player.buff_details) do
    
        if player.buff_details[key].id == 43 then -- Refresh
            
            RefreshPotency = RefreshPotency + 3
            
        elseif player.buff_details[key].id == 196 then -- Ballad
        
            if Ballads == 0 then
            
                RefreshPotency = RefreshPotency + 2
                Ballads = 1
                
            else
                RefreshPotency = RefreshPotency + 1
            end
            
        elseif player.buff_details[key].id == 324 then -- Evokers
        
            RefreshPotency = RefreshPotency + 3
            
        end
    end
	
    if player.mp <= sets.idle[2].MP + SubJobMP - Weakened then -- Gear Refresh
    
        RefreshPotency = RefreshPotency + 2
        
    else
    
        RefreshPotency = RefreshPotency + 1
    
    end
        
    return RefreshPotency
	
end

function file_unload(file_name)

    send_command("wait .001;Text Status delete")
    send_command('wait .002;Text Weapons delete')
    send_command('wait .003;Text Gearset delete')
    send_command('wait .004;Text Tuning delete')
    send_command('wait .005;Text Enmity delete')
    send_command('wait .006;Text Enfeebling delete')
    send_command('wait .007;Text Elemental delete')
    send_command('wait .008;Text ForceSwaps delete')
    send_command('wait .009;Text Idle delete')
    send_command('wait .010;Text Selector delete')
    send_command('wait .011;Text Undulation delete')
    send_command('wait .012;Text Sublimation delete')
	
    send_command('wait .020;Keyboard_Unbind Pause')
    send_command('wait .021;Keyboard_Unbind !Pageup')
    send_command('wait .022;Keyboard_Unbind !Pagedown')
    send_command('wait .023;Keyboard_Unbind !Delete')
    send_command('wait .024;Keyboard_Unbind !End')
    
end
