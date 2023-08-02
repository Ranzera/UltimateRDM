--[[
8888888b.                                                     d8b          888     888 888  888    d8b                        888
888   Y88b                                                    88P          888     888 888  888    Y8P                        888
888    888                                                    8P           888     888 888  888                               888
888   d88P  8888b.  88888b.  88888888  .d88b.  888d888 8888b. " .d8888b    888     888 888  888888 888 88888b.d88b.   8888b.  888888  .d88b.
8888888P"      "88b 888 "88b    d88P  d8P  Y8b 888P"      "88b  88K        888     888 888  888    888 888 "888 "88b     "88b 888    d8P  Y8b
888 T88b   .d888888 888  888   d88P   88888888 888    .d888888  "Y8888b.   888     888 888  888    888 888  888  888 .d888888 888    88888888
888  T88b  888  888 888  888  d88P    Y8b.     888    888  888       X88   Y88b. .d88P 888  Y88b.  888 888  888  888 888  888 Y88b.  Y8b.
888   T88b "Y888888 888  888 88888888  "Y8888  888    "Y888888  888888P'    "Y88888P"  "Y8b. "Y888 888 888  888  888 "Y888888  "Y888  "Y8888

                                   8888888b.                888   888b     d888
                                   888   Y88b               888   8888b   d8888
                                   888    888               888   88888b.d88888
                                   888   d88P  .d88b.   .d88888   888Y88888P888  8888b.   .d88b.   .d88b.
                                   8888888P"  d8P  Y8b d88" 888   888 Y888P 888     "88b d88P"88b d8P  Y8b
                                   888 T88b   88888888 888  888   888  Y8P  888 .d888888 888  888 88888888
                                   888  T88b  Y8b.     Y8b. 888   888   "   888 888  888 Y8b. 888 Y8b.
                                   888   T88b  "Y8888   "Y888P"   888       888 "Y888888  "Y88888  "Y8888
                                                                                              888
                                                                                         Y8b.d88P
                                                                                          "Y88P"

Read the README.md or this won't work correctly AND you won't understand why!
]]--
include("organizer-lib")

function get_sets()
-------------------------------
--     Player Configured     --
--         Variables         --
-------------------------------

 -- #SubjobVars - Search this hashtag to reach the Subjob configuration settings
 
    BaseMP = 594      -- Your MP, naked, with a subjob that has no MP.
    ConvertMerits = 5 -- Number of upgrades to Convert Recast
    MeleePerpCost = 0 -- Switch for allowing avatar perpetuation cost gear to take priority over melee sets. 1 is on, 0 is off.
    FPSMode = 60      -- change to 30 if using 30 FPS mode
    
    send_command('config FrameRateDivisor 1') -- 60 FPS. Switch to 2, to default to 30 FPS
    
    send_command('wait 5;input /lockstyleset 1') -- automatically uses an in game equipment set defined in the macros config, to use as a lockset

-------------------------------
--                           --
--          Hot Keys         --
--                           --
-------------------------------

    -- Undulation Hot Key
    send_command('wait .000;Keyboard_Bind  Pause    gs c ToggleUndulations') --        Pause    Toggles UndulationsEnabled
    -- Menu Hot Keys
  --send_command('wait .001;Keyboard_Bind !insert   gs c MenuOn')            -- Alt  & insert   Unhides the Menu
  --send_command('wait .002;Keyboard_Bind ^insert   gs c MenuOff')           -- Ctrl & insert   Hides the Menu
    send_command('wait .003;Keyboard_Bind !Pageup   gs c PrevMenu')          -- Alt  & PageUp   moves menu cursor Up
    send_command('wait .004;Keyboard_Bind !Pagedown gs c NextMenu')          -- Alt  & PageDown moves menu cursor Down
    send_command('wait .005;Keyboard_Bind !Delete   gs c --')                -- Alt  & Delete   shifts menu value to the left
    send_command('wait .006;Keyboard_Bind !End      gs c ++')                -- Alt  & End      shifts menu value to the right
    -- FPS Hot Keys
    send_command('wait .007;Keyboard_Bind !numpad-  gs c FPS30')             -- Alt & Numpad -  Sets 30 FPS Mode
    send_command('wait .008;Keyboard_Bind !numpad+  gs c FPS60')             -- Alt & Numpad +  Sets 60 FPS Mode
    -- Gear Hot Keys
  --send_command('wait .009;Keyboard_Bind !^1 gs c MPLock')                  -- Ctrl & Alt & 1  Forces Max MP set equip, sending twice locks Max MP set
  --send_command('wait .010;Keyboard_Bind !^2 gs c Reset')                   -- Ctrl & Alt & 2  Resets all locked gear modes
  --send_command('wait .011;Keyboard_Bind !^3 gs c Convert')                 -- Ctrl & Alt & 3  Equips and locks the Convert set for 15 seconds, can be escaped early by using the Reset hotkey.
  --send_command('wait .012;Keyboard_Bind !^9 gs c ToggleEmergencyTank')     -- Ctrl & Alt & 9  Toggles on an EmergencyTank mode, which automatically changes to tank like settings. Resets when toggled again.
  --
  --send_command('wait .013;Keyboard_Bind @1 gs c TaruModeOn')               --    windows & 1  Allows for idling in an HP sacrificing, max MP set. Useful for anticipated MP Restores.
  --send_command('wait .014;Keyboard_Bind @2 gs c TaruModeOff')              --    windows & 2  Turns off Taru Mode
  --
  --send_command('wait .015;Keyboard_Bind !x gs c PDT')                      --        Alt & x  Swaps to a Physical Defense focused set, eschewing Refresh pieces. Sending once allows gear swaps, sending twice locks the set.
  --send_command('wait .016;Keyboard_Bind !z gs c MDT')                      --        Alt & z  Swaps to a Magical Defense focused set, eschewing Refresh pieces. Sending once allows gear swaps, sending twice locks the set.


-------------------------------
--        Default Menu       --
--   positions and settings  --
-------------------------------

    local Status_X = 1169          -- Status Bar X Position
    local Status_Y = 93            -- Status Bar Y Position

    Menu_X = 2257                  -- Menu X Position
    Menu_Y = 1002                  -- Menu Y Position

    Selector_X = Menu_X - 20       -- Menu Cursor X Offset
    Selector_Y = Menu_Y + 40       -- Menu Cursor Y Offset
    
    MenuEnabled = 1                -- default Menu display State. 1 is displayed, 0 is hidden.
    Menu = "Weapons"               -- default Menu position ["Weapons", "MeleeGear", "Tuning", "Enmity", "Enfeebling", "Elemental", "ForceSwaps", "Idle"]
    Weapon = "MP"                  -- default Weapon, go to #WeaponSets for values
    MeleeMode = "Off"              -- default melee mode setting. This should be "Off" if using the "MP" weapon as a default. This should be "On" if using any other weapon as a default.
    MeleeGear = "AccuracyHaste"    -- default Melee Set ["Accuracy", "AccuracyHaste", "BrickHaste", "EvasionHaste", "Evasion", "Brick"]
    AccHasteTuning = 0             -- default tuning for #AccHaste set [0, 1, 2]
    EnmityMode = "Off"             -- default enmity mode ["Off", "On"]
    IdleMode = "Balanced"          -- default idle set ["Balanced", "PDT", "MDT"]
    EnfeebleMode = "Potency/Haste" -- default enfeeble magic mode ["Potency/Haste", "Macc"]
    ElementalMode = "Macc"         -- default elemental magic mode ["Potency", "Macc"]
    ForceSwapThreshold = 0         -- default value for forced equipment swap thresholds [0, 25, 50, 75, 100]
    UndulationsEnabled = 1         -- default state of idle equipment undulations [1, 0]
    

-------------------------------
--         Build Menu        --
--       and Status Bar      --
-------------------------------

    send_command('wait .100;Text Status      create;wait .001;Text Status      pos '..  Status_X..' '..  Status_Y       ..';wait .001;Text Status      color 230  50   0;wait .001;Text Status      bg_alpha 255;wait .001;Text Status      size 30;wait .001;Text Status      font "Courier New";wait .001;Text Status      bold true')
    send_command('wait .107;Text Sublimation create;wait .001;Text Sublimation pos '..    Menu_X..' '..    Menu_Y       ..';wait .001;Text Sublimation color 200 200 200;wait .001;Text Sublimation bg_alpha 190;wait .001;Text Sublimation size 14;wait .001;Text Sublimation font "Courier New";wait .001;Text Sublimation bold true')
    send_command('wait .114;Text Undulation  create;wait .001;Text Undulation  pos '..    Menu_X..' '..    Menu_Y +  23 ..';wait .001;Text Undulation  color  50 230  20;wait .001;Text Undulation  bg_alpha 190;wait .001;Text Undulation  size 14;wait .001;Text Undulation  font "Courier New";wait .001;Text Undulation  bold true')
    send_command('wait .121;Text Weapons     create;wait .001;Text Weapons     pos '..    Menu_X..' '..    Menu_Y +  45 ..';wait .001;Text Weapons     color 200 200 200;wait .001;Text Weapons     bg_alpha 190;wait .001;Text Weapons     size 14;wait .001;Text Weapons     font "Courier New";wait .001;Text Weapons     bold true')
    send_command('wait .128;Text Gearset     create;wait .001;Text Gearset     pos '..    Menu_X..' '..    Menu_Y +  68 ..';wait .001;Text Gearset     color 200 200 200;wait .001;Text Gearset     bg_alpha 190;wait .001;Text Gearset     size 14;wait .001;Text Gearset     font "Courier New";wait .001;Text Gearset     bold true')
    send_command('wait .135;Text Tuning      create;wait .001;Text Tuning      pos '..    Menu_X..' '..    Menu_Y +  91 ..';wait .001;Text Tuning      color 200 200 200;wait .001;Text Tuning      bg_alpha 190;wait .001;Text Tuning      size 14;wait .001;Text Tuning      font "Courier New";wait .001;Text Tuning      bold true')
    send_command('wait .142;Text Enmity      create;wait .001;Text Enmity      pos '..    Menu_X..' '..    Menu_Y + 114 ..';wait .001;Text Enmity      color 200 200 200;wait .001;Text Enmity      bg_alpha 190;wait .001;Text Enmity      size 14;wait .001;Text Enmity      font "Courier New";wait .001;Text Enmity      bold true')
    send_command('wait .149;Text Enfeebling  create;wait .001;Text Enfeebling  pos '..    Menu_X..' '..    Menu_Y + 137 ..';wait .001;Text Enfeebling  color 200 200 200;wait .001;Text Enfeebling  bg_alpha 190;wait .001;Text Enfeebling  size 14;wait .001;Text Enfeebling  font "Courier New";wait .001;Text Enfeebling  bold true')
    send_command('wait .156;Text Elemental   create;wait .001;Text Elemental   pos '..    Menu_X..' '..    Menu_Y + 160 ..';wait .001;Text Elemental   color 200 200 200;wait .001;Text Elemental   bg_alpha 190;wait .001;Text Elemental   size 14;wait .001;Text Elemental   font "Courier New";wait .001;Text Elemental   bold true')
    send_command('wait .163;Text ForceSwaps  create;wait .001;Text ForceSwaps  pos '..    Menu_X..' '..    Menu_Y + 183 ..';wait .001;Text ForceSwaps  color 200 200 200;wait .001;Text ForceSwaps  bg_alpha 190;wait .001;Text ForceSwaps  size 14;wait .001;Text ForceSwaps  font "Courier New";wait .001;Text ForceSwaps  bold true')
    send_command('wait .170;Text Idle        create;wait .001;Text Idle        pos '..    Menu_X..' '..    Menu_Y + 205 ..';wait .001;Text Idle        color 200 200 200;wait .001;Text Idle        bg_alpha 190;wait .001;Text Idle        size 14;wait .001;Text Idle        font "Courier New";wait .001;Text Idle        bold true')
    send_command('wait .177;Text Selector    create;wait .001;Text Selector    pos '..Selector_X..' '..Selector_Y       ..';wait .001;Text Selector    color 200 200 200;wait .001;Text Selector    bg_alpha   0;wait .001;Text Selector    size 20;wait .001;Text Selector    font "Courier New";wait .001;Text Selector    bold true')
    send_command('wait .184;Text Selector    text >')

-------------------------------
--     Internal Variables    --
--        and Startup        --
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
    
    LockMP = 0
    MDTLevel = 0
    PDTLevel = 0
    PanicLevel = 0
    
    RestingStarted = 0
    RestingBuffer = 0
    LastConvert = 0
    SublimationStarted = 0
    SublimationCharge = 0
    
    PreviousSetName = ""
    IdleSetName = ""
    CastingSpell = 0
    PetExists = 0
    SetMagicModes()
    DrawMenu(.185)
    FencerSwapTPThreshold = 910
    EmergencyTankMemory = {}
    EmergencyTank = "Off"
    TaruMode = "Off"
    
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
    sets.PerpetuationCost = {}
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
    sets.Raccuracy = {}
    sets.Accuracy = {}
    sets.AccHaste = {}
    sets.PDTHaste = {}
    sets.PDTMelee = {}
    sets.EvaHaste = {}
    sets.ws = {}
    sets.ws['Sidewinder'] = {}
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

    -- #WeaponSets
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
    sets.Weapons.EnhanceJoy = {main="Enhancing Sword", sub="Joyeuse"}
    sets.Weapons.EnhanceJoy.MP = 0
    sets.Weapons.JoyGenbu = {main="Joyeuse", sub="Genbu's Shield"}
    sets.Weapons.JoyGenbu.MP = 0
    sets.Weapons.CeremonialGenbu = {main="Ceremonial Dagger", sub="Genbu's Shield"}
    sets.Weapons.CeremonialGenbu.MP = 0
    sets.Weapons.Dagger = {main="Hornetneedle", sub="Genbu's Shield"}
    sets.Weapons.Dagger.MP = 0
    sets.Weapons.Club = {main="Kraken Club", sub="Genbu's Shield"}
    sets.Weapons.Club.MP = 0
    sets.Weapons.Enmity = {main="Macuahuitl +1", sub="Genbu's Shield"}
    sets.Weapons.Enmity.MP = 0

    sets.Obis = {}
    sets.Obis['None'] = {waist="Penitent's Rope"} -- Use your regular nuking belt here and also in any of the elemental obi's you do not have
    sets.Obis['Fire'] = {waist="Penitent's Rope"}
    sets.Obis['Ice'] = {waist="Hyorin Obi"}
    sets.Obis['Wind'] = {waist="Penitent's Rope"}
    sets.Obis['Earth'] = {waist="Penitent's Rope"}
    sets.Obis['Lightning'] = {waist="Penitent's Rope"}
    sets.Obis['Water'] = {waist="Penitent's Rope"}
    sets.Obis['Light'] = {waist="Penitent's Rope"}
    sets.Obis['Dark'] = {waist="Anrin Obi"}
                                 
                                 
------------------------------
--          #MaxMP          --
--          Max MP          --
--                          --
------------------------------
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
    sets.MaxMP.MP = 414 -- add together the MP from the individual slots above
    
    
------------------------------
--                          --
--         Taru MP          --
--                          --
------------------------------
    sets.TaruMP = set_combine(sets.MaxMP, {hands="Zenith Mitts",
                                           legs="Zenith Slacks",
                                           feet="Zenith Pumps"})
    sets.TaruMP.MP = sets.MaxMP.MP - (sets.MaxMP.handsMP - 50) - (sets.MaxMP.legsMP - 50) - (sets.MaxMP.feetMP - 50)


------------------------------
--          #Rest           --
--           Rest           --
--                          --
------------------------------
    -- HMP: 28 | Refresh: 1 | Conditional! Refresh or MDT - 4% | MDT - 4% | PDT -9%/15% --
    sets.HMP[0] =                          sets.Weapons.Dark
    sets.HMP[0].MP = sets.MaxMP.MP + sets.Weapons.Dark.MP
    sets.HMP[0].MPH = 14
    sets.HMP[1] = set_combine(sets.MaxMP, {head="Dls. Chapeau +1"})
    sets.HMP[1].MP = sets.MaxMP.MP - (sets.MaxMP.headMP - 14)
    sets.HMP[1].MPH = 14
    sets.HMP[2] = set_combine(sets.HMP[1],{body="Wlk. Tabard +1"})
    sets.HMP[2].MP = sets.HMP[1].MP - (sets.MaxMP.bodyMP - 34)
    sets.HMP[2].MPH = 19
    sets.HMP[3] = set_combine(sets.HMP[2],{feet="Goliard Clogs"})
    sets.HMP[3].MP = sets.HMP[2].MP - (sets.MaxMP.feetMP - 0)
    sets.HMP[3].MPH = 22
    sets.HMP[4] = set_combine(sets.HMP[3],{ear1="Relaxing Earring"})
    sets.HMP[4].MP = sets.HMP[3].MP - (sets.MaxMP.ear1MP - 0)
    sets.HMP[4].MPH = 24
    sets.HMP[5] = set_combine(sets.HMP[4],{ear2="Boroka Earring"})
    sets.HMP[5].MP = sets.HMP[4].MP - (sets.MaxMP.ear2MP - 0)
    sets.HMP[5].MPH = 25
    sets.HMP[6] = set_combine(sets.HMP[5],{waist="Duelist's Belt"})
    sets.HMP[6].MP = sets.HMP[5].MP - (sets.MaxMP.waistMP - 0)
    sets.HMP[6].MPH = 27
    sets.HMP[7] = set_combine(sets.HMP[6],{hands="Genie Gages"})
    sets.HMP[7].MP = sets.HMP[6].MP - (sets.MaxMP.handsMP - 0)
    sets.HMP[7].MPH = 28
    sets.HMP[8] = set_combine(sets.HMP[7],{rring="Merman's Ring"})  -- Logic for Balrahn's Ring swap is in the brains
    sets.HMP[8].MP = sets.HMP[7].MP - (sets.MaxMP.rringMP - 0)
    sets.HMP[8].MPH = 28
    sets.HMP[9] = set_combine(sets.HMP[8],{back="Umbra Cape"})
    sets.HMP[9].MP = sets.HMP[8].MP - (sets.MaxMP.backMP - 0)
    sets.HMP[9].MPH = 28
    sets.HMP[10]= set_combine(sets.HMP[9],{lring="Merman's Ring"})
    sets.HMP[10].MP= sets.HMP[9].MP - (sets.MaxMP.lringMP - 0)
    sets.HMP[10].MPH= 28
    

------------------------------
--          #Idle           --
--           Idle           --
--                          --
------------------------------
    -- sets.Weapons.Earth (PDT -20%) used in main slot when not in melee mode
    -- Additional PDT -3% when not moving
    -- Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT -12% | MDB + 5 | PDT -6%/12% --
    sets.idle[0] = set_combine(sets.MaxMP,  {head="Dls. Chapeau +1"})
    sets.idle[0].MP = sets.MaxMP.MP   - (sets.MaxMP.headMP - 14)
    sets.idle[1] = set_combine(sets.idle[0],{rring="Merman's Ring"})  -- Logic for Balrahn's Ring swap is in the brains
    sets.idle[1].MP = sets.idle[0].MP - (sets.MaxMP.rringMP - 0)
    sets.idle[2] = set_combine(sets.idle[1],{back="Umbra Cape"})
    sets.idle[2].MP = sets.idle[1].MP - (sets.MaxMP.backMP - 0)
    sets.idle[3] = set_combine(sets.idle[2],{ear2="Merman's Earring"})
    sets.idle[3].MP = sets.idle[2].MP - (sets.MaxMP.ear2MP - 0)
    sets.idle[4] = set_combine(sets.idle[3],{ear1="Merman's Earring"})
    sets.idle[4].MP = sets.idle[3].MP - (sets.MaxMP.ear1MP - 0)
    sets.idle[5] = set_combine(sets.idle[4],{lring="Merman's Ring"})
    sets.idle[5].MP = sets.idle[4].MP - (sets.MaxMP.lringMP - 0)
    sets.idle[6] = set_combine(sets.idle[5],{feet="Coral Greaves +1"})
    sets.idle[6].MP = sets.idle[5].MP - (sets.MaxMP.feetMP - 0)
    sets.idle[7] = set_combine(sets.idle[6],{hands="Coral Fng. Gnt. +1"})
    sets.idle[7].MP = sets.idle[6].MP - (sets.MaxMP.handsMP - 0)
    sets.idle[8] = sets.idle[7] -- float piece for Avatar Perpetuation Cost
    sets.idle[8].MP = sets.idle[7].MP
    

------------------------------
--         #PDTIdle         --
--         PDT idle         --
--                          --
------------------------------
    -- sets.Weapons.Earth (PDT -20%) used in main slot when not in melee mode
    -- Additional PDT -3% when not moving
    -- Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT - 4% | MDB + 5 | PDT -15%/21% --
    sets.PDTidle[0] = set_combine(sets.MaxMP,     {head="Dls. Chapeau +1"})
    sets.PDTidle[0].MP = sets.MaxMP.MP      - (sets.MaxMP.headMP - 14)
    sets.PDTidle[1] = set_combine(sets.PDTidle[0],{rring="Merman's Ring"})  -- Logic for Balrahn's Ring swap is in the brains
    sets.PDTidle[1].MP = sets.PDTidle[0].MP - (sets.MaxMP.rringMP - 0)
    sets.PDTidle[2] = set_combine(sets.PDTidle[1],{back="Umbra Cape"})
    sets.PDTidle[2].MP = sets.PDTidle[1].MP - (sets.MaxMP.backMP - 0)
    sets.PDTidle[3] = set_combine(sets.PDTidle[2],{ear2="Merman's Earring"})
    sets.PDTidle[3].MP = sets.PDTidle[2].MP - (sets.MaxMP.ear2MP - 0)
    sets.PDTidle[4] = set_combine(sets.PDTidle[3],{ear1="Merman's Earring"})
    sets.PDTidle[4].MP = sets.PDTidle[3].MP - (sets.MaxMP.ear1MP - 0)
    sets.PDTidle[5] = set_combine(sets.PDTidle[4],{lring="Jelly Ring"})
    sets.PDTidle[5].MP = sets.PDTidle[4].MP - (sets.MaxMP.lringMP - 0)
    sets.PDTidle[6] = set_combine(sets.PDTidle[5],{feet="Dst. Leggings +1"})
    sets.PDTidle[6].MP = sets.PDTidle[5].MP - (sets.MaxMP.feetMP - 0)
    sets.PDTidle[7] = set_combine(sets.PDTidle[6],{hands="Dst. Mittens +1"})
    sets.PDTidle[7].MP = sets.PDTidle[6].MP - (sets.MaxMP.handsMP - 0)
    sets.PDTidle[8] = sets.PDTidle[7] -- float piece for Avatar Perpetuation Cost
    sets.PDTidle[8].MP = sets.PDTidle[7].MP
    

------------------------------
--         #MDTIdle         --
--         MDT idle         --
--                          --
------------------------------
    -- sets.Weapons.MDB (MDB + 5) used in main slot when not in melee mode
    -- Refresh: 2 | Conditional! Refresh or MDT - 4% | MDT -15% | MDB +10 --
    sets.MDTidle[0] = set_combine(sets.MaxMP,     {head="Dls. Chapeau +1"})
    sets.MDTidle[0].MP = sets.MaxMP.MP      - (sets.MaxMP.headMP - 14)
    sets.MDTidle[1] = set_combine(sets.MDTidle[0],{rring="Merman's Ring"})  -- Logic for Balrahn's Ring swap is in the brains
    sets.MDTidle[1].MP = sets.MDTidle[0].MP - (sets.MaxMP.rringMP - 0)
    sets.MDTidle[2] = set_combine(sets.MDTidle[1],{back="Lamia Mantle"})
    sets.MDTidle[2].MP = sets.MDTidle[1].MP - (sets.MaxMP.backMP - 24)
    sets.MDTidle[3] = set_combine(sets.MDTidle[2],{ear2="Merman's Earring"})
    sets.MDTidle[3].MP = sets.MDTidle[2].MP - (sets.MaxMP.ear2MP - 0)
    sets.MDTidle[4] = set_combine(sets.MDTidle[3],{ear1="Merman's Earring"})
    sets.MDTidle[4].MP = sets.MDTidle[3].MP - (sets.MaxMP.ear1MP - 0)
    sets.MDTidle[5] = set_combine(sets.MDTidle[4],{lring="Merman's Ring"})
    sets.MDTidle[5].MP = sets.MDTidle[4].MP - (sets.MaxMP.lringMP - 0)
    sets.MDTidle[6] = set_combine(sets.MDTidle[5],{feet="Coral Greaves +1"})
    sets.MDTidle[6].MP = sets.MDTidle[5].MP - (sets.MaxMP.feetMP - 0)
    sets.MDTidle[7] = set_combine(sets.MDTidle[6],{hands="Coral Fng. Gnt. +1"})
    sets.MDTidle[7].MP = sets.MDTidle[6].MP - (sets.MaxMP.handsMP - 0)
    sets.MDTidle[8] = set_combine(sets.MDTidle[7],{legs="Coral Cuisses +1"})
    sets.MDTidle[8].MP = sets.MDTidle[7].MP - (sets.MaxMP.legsMP - 0)
    sets.MDTidle[9] = sets.MDTidle[8] -- float piece for Avatar Perpetuation Cost
    sets.MDTidle[9].MP = sets.MDTidle[8].MP


-------------------------------
--         #PDTPanic         --
--   Physical Damage Taken   --
--                           --
-------------------------------
    -- sets.Weapons.Earth (PDT -20%) used in main slot when not in melee mode
    -- Additional PDT -3% when not moving
    -- PDT -21%/27% --
    sets.PDT[0] = set_combine(sets.MaxMP, {back="Umbra Cape"})
    sets.PDT[0].MP = sets.MaxMP.MP  - (sets.MaxMP.backMP - 0)
    sets.PDT[1] = set_combine(sets.PDT[0],{rring="Jelly Ring"})
    sets.PDT[1].MP = sets.PDT[0].MP - (sets.MaxMP.rringMP - 0)
    sets.PDT[2] = set_combine(sets.PDT[1],{hands="Dst. Mittens +1"})
    sets.PDT[2].MP = sets.PDT[1].MP - (sets.MaxMP.handsMP - 0)
    sets.PDT[3] = set_combine(sets.PDT[2],{feet="Dst. Leggings +1"})
    sets.PDT[3].MP = sets.PDT[2].MP - (sets.MaxMP.feetMP - 0)
    sets.PDT[4] = set_combine(sets.PDT[3],{head="Darksteel Cap +1"})
    sets.PDT[4].MP = sets.PDT[3].MP - (sets.MaxMP.headMP - 0)
    sets.PDT[5] = set_combine(sets.PDT[4],{body="Dst. Harness +1"})
    sets.PDT[5].MP = sets.PDT[4].MP - (sets.MaxMP.bodyMP - 0)


-------------------------------
--         #MDTPanic         --
--     Magic Damage Taken    --
--                           --
-------------------------------
    -- sets.Weapons.MDB (MDB + 5) used in main slot when not in melee mode
    -- MDT -25% | MDB + 8 --
    sets.MDT[0] = set_combine(sets.MaxMP, {back="Lamia Mantle"})
    sets.MDT[0].MP = sets.MaxMP.MP  - (sets.MaxMP.backMP - 24)
    sets.MDT[1] = set_combine(sets.MDT[0],{rring="Merman's Ring"})
    sets.MDT[1].MP = sets.MDT[0].MP - (sets.MaxMP.rringMP - 0)
    sets.MDT[2] = set_combine(sets.MDT[1],{ear1="Merman's Earring"})
    sets.MDT[2].MP = sets.MDT[1].MP - (sets.MaxMP.ear1MP - 0)
    sets.MDT[3] = set_combine(sets.MDT[2],{ear2="Merman's Earring"})
    sets.MDT[3].MP = sets.MDT[2].MP - (sets.MaxMP.ear2MP - 0)
    sets.MDT[4] = set_combine(sets.MDT[3],{feet="Coral Greaves +1"})
    sets.MDT[4].MP = sets.MDT[3].MP - (sets.MaxMP.feetMP - 0)
    sets.MDT[5] = set_combine(sets.MDT[4],{hands="Coral Fng. Gnt. +1"})
    sets.MDT[5].MP = sets.MDT[4].MP - (sets.MaxMP.handsMP - 0)
    sets.MDT[6] = set_combine(sets.MDT[5],{head="Coral Visor +1"})
    sets.MDT[6].MP = sets.MDT[5].MP - (sets.MaxMP.headMP - 0)
    sets.MDT[7] = set_combine(sets.MDT[6],{lring="Merman's Ring"})
    sets.MDT[7].MP = sets.MDT[6].MP - (sets.MaxMP.lringMP - 0)
    sets.MDT[8] = set_combine(sets.MDT[7],{body="Cor. Scale Mail +1"})
    sets.MDT[8].MP = sets.MDT[7].MP - (sets.MaxMP.bodyMP - 0)
    sets.MDT[9] = set_combine(sets.MDT[8],{legs="Coral Cuisses +1"})
    sets.MDT[9].MP = sets.MDT[8].MP - (sets.MaxMP.legsMP - 0)
    
    
-------------------------------
--                           --
--        Fast Pants         --
--                           --
-------------------------------
    sets.FastPants = {legs="Blood Cuisses"}
    
    
-------------------------------
--        #FencerRing        --
--       Fencer's Ring       --
--  requires HP calc/config  --
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


------------------------------
--        #ConserveMP       --
--        Conserve MP       --
--                          --
------------------------------
    -- sets.Weapons.Earth (PDT -20%) used in main slot when not in melee mode
    -- Conserve MP +5 | PDT -20%/26% --
    sets.midcast.ConserveMP[0] = set_combine(sets.MaxMP,                {body="Goliard Saio"})
    sets.midcast.ConserveMP[0].MP = sets.MaxMP.MP                 - (sets.MaxMP.bodyMP - 42)
    sets.midcast.ConserveMP[1] = set_combine(sets.midcast.ConserveMP[0],{back="Umbra Cape"})
    sets.midcast.ConserveMP[1].MP = sets.midcast.ConserveMP[0].MP - (sets.MaxMP.backMP - 0)
    sets.midcast.ConserveMP[2] = set_combine(sets.midcast.ConserveMP[1],{rring="Jelly Ring"})
    sets.midcast.ConserveMP[2].MP = sets.midcast.ConserveMP[1].MP - (sets.MaxMP.rringMP - 0)
    sets.midcast.ConserveMP[3] = set_combine(sets.midcast.ConserveMP[2],{hands="Dst. Mittens +1"})
    sets.midcast.ConserveMP[3].MP = sets.midcast.ConserveMP[2].MP - (sets.MaxMP.handsMP - 0)
    sets.midcast.ConserveMP[4] = set_combine(sets.midcast.ConserveMP[3],{feet="Dst. Leggings +1"})
    sets.midcast.ConserveMP[4].MP = sets.midcast.ConserveMP[3].MP - (sets.MaxMP.legsMP - 0)
    sets.midcast.ConserveMP[5] = set_combine(sets.midcast.ConserveMP[4],{head="Darksteel Cap +1"})
    sets.midcast.ConserveMP[5].MP = sets.midcast.ConserveMP[4].MP - (sets.MaxMP.headMP - 0)


------------------------------
--          #MGS            --
--           MGS            --
--                          --
------------------------------
    sets.midcast.MGS[0] = set_combine(sets.MaxMP,         sets.midcast.ConserveMP[1])
    sets.midcast.MGS[0].MP = sets.midcast.ConserveMP[1].MP
    sets.midcast.MGS[1] = set_combine(sets.midcast.MGS[0],{back="Skulker's Cape"})
    sets.midcast.MGS[1].MP = sets.midcast.MGS[0].MP - (sets.MaxMP.backMP - 0)
    sets.midcast.MGS[2] = set_combine(sets.midcast.MGS[1],{feet="Dream Boots +1"})
    sets.midcast.MGS[2].MP = sets.midcast.MGS[1].MP - (sets.MaxMP.feetMP - 0)
    sets.midcast.MGS[3] = set_combine(sets.midcast.MGS[2],{hands="Dream Mittens +1"})
    sets.midcast.MGS[3].MP = sets.midcast.MGS[2].MP - (sets.MaxMP.handsMP - 0)


-------------------------------
--          #Haste           --
--           Haste           --
--                           --
-------------------------------
    -- sets.Weapons.Earth (PDT -20%) used in main slot when not in melee mode
    -- FastCast 20% | Haste 23% | PDT -11%/17% --
    sets.midcast.Haste[0] = set_combine(sets.MaxMP,           {body="Goliard Saio"})
    sets.midcast.Haste[0].MP = sets.MaxMP.MP            - (sets.MaxMP.bodyMP - 42)
    sets.midcast.Haste[1] = set_combine(sets.midcast.Haste[0],{hands="Dusk Gloves"})
    sets.midcast.Haste[1].MP = sets.midcast.Haste[0].MP - (sets.MaxMP.handsMP - 0)
    sets.midcast.Haste[2] = set_combine(sets.midcast.Haste[1],{waist="Speed Belt"})
    sets.midcast.Haste[2].MP = sets.midcast.Haste[1].MP - (sets.MaxMP.waistMP - 0)
    sets.midcast.Haste[3] = set_combine(sets.midcast.Haste[2],{feet="Dusk Ledelsens"})
    sets.midcast.Haste[3].MP = sets.midcast.Haste[2].MP - (sets.MaxMP.feetMP - 0)
    sets.midcast.Haste[4] = set_combine(sets.midcast.Haste[3],{legs="Tatsu. Sitagoromo"})
    sets.midcast.Haste[4].MP = sets.midcast.Haste[3].MP - (sets.MaxMP.legsMP - 0)
    sets.midcast.Haste[5] = set_combine(sets.midcast.Haste[4],{back="Umbra Cape"})
    sets.midcast.Haste[5].MP = sets.midcast.Haste[4].MP - (sets.MaxMP.backMP - 0)
    sets.midcast.Haste[6] = set_combine(sets.midcast.Haste[5],{rring="Jelly Ring"})
    sets.midcast.Haste[6].MP = sets.midcast.Haste[5].MP - (sets.MaxMP.rringMP - 0)

    
-------------------------------
--         #FastCast         --
--         Fast Cast         --
--                           --
-------------------------------
    -- FastCast 42% --
    sets.precast.fastcast = {head="Wlk. Chapeau +1",
                             body="Dls. Tabard +1",
                             ear2="Loquacious Earring"}
    sets.precast.fastcast.MP = sets.MaxMP.MP - (sets.MaxMP.headMP - 25) - (sets.MaxMP.bodyMP - 30) - (sets.MaxMP.ear2MP - 30)


------------------------------
--          #DINT           --
--           Dark           --
--                          --
------------------------------
    -- INT +29 | Dark Skill +15 | MAcc +16 | Haste + 2% --
    sets.midcast.DINT[0] = set_combine(sets.MaxMP,          {neck="Dark Torque"})
    sets.midcast.DINT[0].MP = sets.MaxMP.MP           - (sets.MaxMP.neckMP - 0)
    sets.midcast.DINT[1] = set_combine(sets.midcast.DINT[0],{back="Merciful Cape"})
    sets.midcast.DINT[1].MP = sets.midcast.DINT[0].MP - (sets.MaxMP.backMP - 25)
    sets.midcast.DINT[2] = set_combine(sets.midcast.DINT[1],{feet="Goliard Clogs"})
    sets.midcast.DINT[2].MP = sets.midcast.DINT[1].MP - (sets.MaxMP.feetMP - 0)
    sets.midcast.DINT[3] = set_combine(sets.midcast.DINT[2],{head="Nashira Turban"})
    sets.midcast.DINT[3].MP = sets.midcast.DINT[2].MP - (sets.MaxMP.headMP - 0)
    sets.midcast.DINT[4] = set_combine(sets.midcast.DINT[3],{rring="Snow Ring"})
    sets.midcast.DINT[4].MP = sets.midcast.DINT[3].MP - (sets.MaxMP.rringMP - 0)
    sets.midcast.DINT[5] = set_combine(sets.midcast.DINT[4],{ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.midcast.DINT[5].MP = sets.midcast.DINT[4].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    sets.midcast.DINT[6] = set_combine(sets.midcast.DINT[5],{body="Glamor Jupon"})
    sets.midcast.DINT[6].MP = sets.midcast.DINT[5].MP - (sets.MaxMP.bodyMP - 0)
    sets.midcast.DINT[7] = set_combine(sets.midcast.DINT[6],{legs="Mahatma Slops"})
    sets.midcast.DINT[7].MP = sets.midcast.DINT[6].MP - (sets.MaxMP.legsMP - 0)
    sets.midcast.DINT[8] = set_combine(sets.midcast.DINT[7],{hands="Goliard Cuffs"})
    sets.midcast.DINT[8].MP = sets.midcast.DINT[7].MP - (sets.MaxMP.handsMP - 0)
    sets.midcast.DINT[9] = set_combine(sets.midcast.DINT[8],{waist="Penitent's Rope"})
    sets.midcast.DINT[9].MP = sets.midcast.DINT[8].MP - (sets.MaxMP.waistMP - 0)
    sets.midcast.DINT[10]= set_combine(sets.midcast.DINT[9],{lring="Snow Ring"})
    sets.midcast.DINT[10].MP= sets.midcast.DINT[9].MP - (sets.MaxMP.lringMP - 0)
    sets.midcast.DINT[11]= set_combine(sets.midcast.DINT[10],{ammo="Phtm. Tathlum"})
    sets.midcast.DINT[11].MP= sets.midcast.DINT[10].MP - (sets.MaxMP.ammoMP - 10)


------------------------------
--         #ObiDINT         --
--           Dark           --
--           Obi            --
------------------------------
    -- INT +24 | Dark Skill +15 | MAcc +16 | Haste + 2% --
    sets.midcast.DINTObi[0] = set_combine(sets.MaxMP,             {neck="Dark Torque"})
    sets.midcast.DINTObi[0].MP = sets.MaxMP.MP              - (sets.MaxMP.neckMP - 0)
    sets.midcast.DINTObi[1] = set_combine(sets.midcast.DINTObi[0],{back="Merciful Cape"})
    sets.midcast.DINTObi[1].MP = sets.midcast.DINTObi[0].MP - (sets.MaxMP.backMP - 25)
    sets.midcast.DINTObi[2] = set_combine(sets.midcast.DINTObi[1],{waist="Penitent's Rope"})
    sets.midcast.DINTObi[2].MP = sets.midcast.DINTObi[1].MP - (sets.MaxMP.waistMP - 0)
    sets.midcast.DINTObi[3] = set_combine(sets.midcast.DINTObi[2],{feet="Goliard Clogs"})
    sets.midcast.DINTObi[3].MP = sets.midcast.DINTObi[2].MP - (sets.MaxMP.feetMP - 0)
    sets.midcast.DINTObi[4] = set_combine(sets.midcast.DINTObi[3],{head="Nashira Turban"})
    sets.midcast.DINTObi[4].MP = sets.midcast.DINTObi[3].MP - (sets.MaxMP.headMP - 0)
    sets.midcast.DINTObi[5] = set_combine(sets.midcast.DINTObi[4],{rring="Snow Ring"})
    sets.midcast.DINTObi[5].MP = sets.midcast.DINTObi[4].MP - (sets.MaxMP.rringMP - 0)
    sets.midcast.DINTObi[6] = set_combine(sets.midcast.DINTObi[5],{ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.midcast.DINTObi[6].MP = sets.midcast.DINTObi[5].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    sets.midcast.DINTObi[7] = set_combine(sets.midcast.DINTObi[6],{body="Glamor Jupon"})
    sets.midcast.DINTObi[7].MP = sets.midcast.DINTObi[6].MP - (sets.MaxMP.bodyMP - 0)
    sets.midcast.DINTObi[8] = set_combine(sets.midcast.DINTObi[7],{legs="Mahatma Slops"})
    sets.midcast.DINTObi[8].MP = sets.midcast.DINTObi[7].MP - (sets.MaxMP.legsMP - 0)
    sets.midcast.DINTObi[9] = set_combine(sets.midcast.DINTObi[8],{hands="Goliard Cuffs"})
    sets.midcast.DINTObi[9].MP = sets.midcast.DINTObi[8].MP - (sets.MaxMP.handsMP - 0)
    sets.midcast.DINTObi[10]= set_combine(sets.midcast.DINTObi[9],{lring="Snow Ring"})
    sets.midcast.DINTObi[10].MP= sets.midcast.DINTObi[9].MP- (sets.MaxMP.lringMP - 0)
    sets.midcast.DINTObi[11]= set_combine(sets.midcast.DINTObi[10],{ammo="Phtm. Tathlum"})
    sets.midcast.DINTObi[11].MP= sets.midcast.DINTObi[10].MP- (sets.MaxMP.ammoMP - 10)


-------------------------------
--         #EINTMacc         --
--      Enfeebling (INT)     --
--           MAcc            --
-------------------------------
    -- INT +25 | Enfeebling Skill +42 | MAcc +12 | Haste + 2% --
    sets.midcast.EINTMacc[0] = set_combine(sets.MaxMP,              {head="Dls. Chapeau +1"})
    sets.midcast.EINTMacc[0].MP = sets.MaxMP.MP               - (sets.MaxMP.headMP - 14)
    sets.midcast.EINTMacc[1] = set_combine(sets.midcast.EINTMacc[0],{body="Wlk. Tabard +1"})
    sets.midcast.EINTMacc[1].MP = sets.midcast.EINTMacc[0].MP - (sets.MaxMP.bodyMP - 34)
    sets.midcast.EINTMacc[2] = set_combine(sets.midcast.EINTMacc[1],{neck="Enfeebling Torque"})
    sets.midcast.EINTMacc[2].MP = sets.midcast.EINTMacc[1].MP - (sets.MaxMP.neckMP - 0)
    sets.midcast.EINTMacc[3] = set_combine(sets.midcast.EINTMacc[2],{legs="Nashira Seraweels"})
    sets.midcast.EINTMacc[3].MP = sets.midcast.EINTMacc[2].MP - (sets.MaxMP.legsMP - 0)
    sets.midcast.EINTMacc[4] = set_combine(sets.midcast.EINTMacc[3],{feet="Goliard Clogs"})
    sets.midcast.EINTMacc[4].MP = sets.midcast.EINTMacc[3].MP - (sets.MaxMP.feetMP - 0)
    sets.midcast.EINTMacc[5] = set_combine(sets.midcast.EINTMacc[4],{rring="Snow Ring"})
    sets.midcast.EINTMacc[5].MP = sets.midcast.EINTMacc[4].MP - (sets.MaxMP.rringMP - 0)
    sets.midcast.EINTMacc[6] = set_combine(sets.midcast.EINTMacc[5],{back="Prism Cape"})
    sets.midcast.EINTMacc[6].MP = sets.midcast.EINTMacc[5].MP - (sets.MaxMP.backMP - 10)
    sets.midcast.EINTMacc[7] = set_combine(sets.midcast.EINTMacc[6],{waist="Penitent's Rope"})
    sets.midcast.EINTMacc[7].MP = sets.midcast.EINTMacc[6].MP - (sets.MaxMP.waistMP - 0)
    sets.midcast.EINTMacc[8] = set_combine(sets.midcast.EINTMacc[7],{lring="Snow Ring"})
    sets.midcast.EINTMacc[8].MP = sets.midcast.EINTMacc[7].MP - (sets.MaxMP.lringMP - 0)
    sets.midcast.EINTMacc[9] = set_combine(sets.midcast.EINTMacc[8],{ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.midcast.EINTMacc[9].MP = sets.midcast.EINTMacc[8].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    sets.midcast.EINTMacc[10]= set_combine(sets.midcast.EINTMacc[9],{hands="Goliard Cuffs"})
    sets.midcast.EINTMacc[10].MP= sets.midcast.EINTMacc[9].MP - (sets.MaxMP.handsMP - 0)
    sets.midcast.EINTMacc[11]= set_combine(sets.midcast.EINTMacc[10],{ammo="Phtm. Tathlum"})
    sets.midcast.EINTMacc[11].MP= sets.midcast.EINTMacc[10].MP- (sets.MaxMP.ammoMP - 10)


-------------------------------
--        #EINTHaste         --
--      Enfeebling (INT)     --
--           Haste           --
-------------------------------
    -- INT +16 | Enfeebling Skill +42 | MAcc +8 | Haste +13% --
    sets.midcast.EINTHaste[0] = set_combine(sets.MaxMP,               {head="Dls. Chapeau +1"})
    sets.midcast.EINTHaste[0].MP = sets.MaxMP.MP                - (sets.MaxMP.headMP - 14)
    sets.midcast.EINTHaste[1] = set_combine(sets.midcast.EINTHaste[0],{body="Wlk. Tabard +1"})
    sets.midcast.EINTHaste[1].MP = sets.midcast.EINTHaste[0].MP - (sets.MaxMP.bodyMP - 34)
    sets.midcast.EINTHaste[2] = set_combine(sets.midcast.EINTHaste[1],{neck="Enfeebling Torque"})
    sets.midcast.EINTHaste[2].MP = sets.midcast.EINTHaste[1].MP - (sets.MaxMP.neckMP - 0)
    sets.midcast.EINTHaste[3] = set_combine(sets.midcast.EINTHaste[2],{legs="Nashira Seraweels"})
    sets.midcast.EINTHaste[3].MP = sets.midcast.EINTHaste[2].MP - (sets.MaxMP.legsMP - 0)
    sets.midcast.EINTHaste[4] = set_combine(sets.midcast.EINTHaste[3],{hands="Dusk Gloves"})
    sets.midcast.EINTHaste[4].MP = sets.midcast.EINTHaste[3].MP - (sets.MaxMP.handsMP - 0)
    sets.midcast.EINTHaste[5] = set_combine(sets.midcast.EINTHaste[4],{waist="Speed Belt"})
    sets.midcast.EINTHaste[5].MP = sets.midcast.EINTHaste[4].MP - (sets.MaxMP.waistMP - 0)
    sets.midcast.EINTHaste[6] = set_combine(sets.midcast.EINTHaste[5],{feet="Dusk Ledelsens"})
    sets.midcast.EINTHaste[6].MP = sets.midcast.EINTHaste[5].MP - (sets.MaxMP.feetMP - 0)
    sets.midcast.EINTHaste[7] = set_combine(sets.midcast.EINTHaste[6],{rring="Snow Ring"})
    sets.midcast.EINTHaste[7].MP = sets.midcast.EINTHaste[6].MP - (sets.MaxMP.rringMP - 0)
    sets.midcast.EINTHaste[8] = set_combine(sets.midcast.EINTHaste[7],{back="Prism Cape"})
    sets.midcast.EINTHaste[8].MP = sets.midcast.EINTHaste[7].MP - (sets.MaxMP.backMP - 10)
    sets.midcast.EINTHaste[9] = set_combine(sets.midcast.EINTHaste[8],{ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.midcast.EINTHaste[9].MP = sets.midcast.EINTHaste[8].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    sets.midcast.EINTHaste[10]= set_combine(sets.midcast.EINTHaste[9],{lring="Snow Ring"})
    sets.midcast.EINTHaste[10].MP= sets.midcast.EINTHaste[9].MP - (sets.MaxMP.lringMP - 0)
    sets.midcast.EINTHaste[11]= set_combine(sets.midcast.EINTHaste[10],{ammo="Phtm. Tathlum"})
    sets.midcast.EINTHaste[11].MP= sets.midcast.EINTHaste[10].MP- (sets.MaxMP.ammoMP - 10)


-------------------------------
--         #EMNDMacc         --
--      Enfeebling (MND)     --
--           MAcc            --
-------------------------------
    -- MND +33 | Enfeebling Skill +42 | MAcc +10 | Haste + 2% --
    sets.midcast.EMNDMacc[0] = set_combine(sets.MaxMP,              {legs="Custom Slacks",
                                                                     feet="Errant Pigaches"})
    sets.midcast.EMNDMacc[0].MP = sets.MaxMP.MP - (sets.MaxMP.legsMP - 32) - (sets.MaxMP.feetMP - 20)
    sets.midcast.EMNDMacc[1] = set_combine(sets.midcast.EMNDMacc[0],{head="Dls. Chapeau +1"})
    sets.midcast.EMNDMacc[1].MP = sets.midcast.EMNDMacc[0].MP - (sets.MaxMP.headMP - 14)
    sets.midcast.EMNDMacc[2] = set_combine(sets.midcast.EMNDMacc[1],{body="Wlk. Tabard +1"})
    sets.midcast.EMNDMacc[2].MP = sets.midcast.EMNDMacc[1].MP - (sets.MaxMP.bodyMP - 34)
    sets.midcast.EMNDMacc[3] = set_combine(sets.midcast.EMNDMacc[2],{neck="Enfeebling Torque"})
    sets.midcast.EMNDMacc[3].MP = sets.midcast.EMNDMacc[2].MP - (sets.MaxMP.neckMP - 0)
    sets.midcast.EMNDMacc[4] = set_combine(sets.midcast.EMNDMacc[3],{hands="Dvt. Mitts +1"})
    sets.midcast.EMNDMacc[4].MP = sets.midcast.EMNDMacc[3].MP - (sets.MaxMP.handsMP - 9)
    sets.midcast.EMNDMacc[5] = set_combine(sets.midcast.EMNDMacc[4],{legs="Nashira Seraweels"})
    sets.midcast.EMNDMacc[5].MP = sets.midcast.EMNDMacc[4].MP - (sets.MaxMP.legsMP - 0)
    sets.midcast.EMNDMacc[6] = set_combine(sets.midcast.EMNDMacc[5],{rring="Aqua Ring"})
    sets.midcast.EMNDMacc[6].MP = sets.midcast.EMNDMacc[5].MP - (sets.MaxMP.rringMP - 0)
    sets.midcast.EMNDMacc[7] = set_combine(sets.midcast.EMNDMacc[6],{back="Prism Cape"})
    sets.midcast.EMNDMacc[7].MP = sets.midcast.EMNDMacc[6].MP - (sets.MaxMP.backMP - 10)
    sets.midcast.EMNDMacc[8] = set_combine(sets.midcast.EMNDMacc[7],{ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.midcast.EMNDMacc[8].MP = sets.midcast.EMNDMacc[7].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    sets.midcast.EMNDMacc[9] = set_combine(sets.midcast.EMNDMacc[8],{waist="Penitent's Rope"})
    sets.midcast.EMNDMacc[9].MP = sets.midcast.EMNDMacc[8].MP - (sets.MaxMP.waistMP - 0)
    sets.midcast.EMNDMacc[10]= set_combine(sets.midcast.EMNDMacc[9],{lring="Aqua Ring"})
    sets.midcast.EMNDMacc[10].MP= sets.midcast.EMNDMacc[9].MP - (sets.MaxMP.lringMP - 0)
    sets.midcast.EMNDMacc[11]= set_combine(sets.midcast.EMNDMacc[10],{feet="Goliard Clogs"})
    sets.midcast.EMNDMacc[11].MP= sets.midcast.EMNDMacc[10].MP- (sets.MaxMP.feetMP - 0)
    sets.midcast.EMNDMacc[12]= set_combine(sets.midcast.EMNDMacc[11],{ammo="Jasper Tathlum"})
    sets.midcast.EMNDMacc[12].MP= sets.midcast.EMNDMacc[11].MP- (sets.MaxMP.ammoMP - 0)


-------------------------------
--        #EMNDPotency       --
--      Enfeebling (MND)     --
--          Potency          --
-------------------------------
    -- MND +57 | Enfeebling Skill +22 --
    sets.midcast.EMNDPotency[0] = set_combine(sets.MaxMP,                 {legs="Custom Slacks",
                                                                           feet="Errant Pigaches"})
    sets.midcast.EMNDPotency[0].MP = sets.MaxMP.MP - (sets.MaxMP.legsMP - 32) - (sets.MaxMP.feetMP - 20)
    sets.midcast.EMNDPotency[1] = set_combine(sets.midcast.EMNDPotency[0],{head="Dls. Chapeau +1"})
    sets.midcast.EMNDPotency[1].MP = sets.midcast.EMNDPotency[0].MP - (sets.MaxMP.headMP - 14)
    sets.midcast.EMNDPotency[2] = set_combine(sets.midcast.EMNDPotency[1],{neck="Enfeebling Torque"})
    sets.midcast.EMNDPotency[2].MP = sets.midcast.EMNDPotency[1].MP - (sets.MaxMP.neckMP - 0)
    sets.midcast.EMNDPotency[3] = set_combine(sets.midcast.EMNDPotency[2],{hands="Dvt. Mitts +1"})
    sets.midcast.EMNDPotency[3].MP = sets.midcast.EMNDPotency[2].MP - (sets.MaxMP.handsMP - 9)
    sets.midcast.EMNDPotency[4] = set_combine(sets.midcast.EMNDPotency[3],{body="Errant Hpl."})
    sets.midcast.EMNDPotency[4].MP = sets.midcast.EMNDPotency[3].MP - (sets.MaxMP.bodyMP - 0)
    sets.midcast.EMNDPotency[5] = set_combine(sets.midcast.EMNDPotency[4],{rring="Aqua Ring"})
    sets.midcast.EMNDPotency[5].MP = sets.midcast.EMNDPotency[4].MP - (sets.MaxMP.rringMP - 0)
    sets.midcast.EMNDPotency[6] = set_combine(sets.midcast.EMNDPotency[5],{back="Prism Cape"})
    sets.midcast.EMNDPotency[6].MP = sets.midcast.EMNDPotency[5].MP - (sets.MaxMP.backMP - 10)
    sets.midcast.EMNDPotency[7] = set_combine(sets.midcast.EMNDPotency[6],{legs="Mahatma Slops"})
    sets.midcast.EMNDPotency[7].MP = sets.midcast.EMNDPotency[6].MP - (sets.MaxMP.legsMP - 0)
    sets.midcast.EMNDPotency[8] = set_combine(sets.midcast.EMNDPotency[7],{waist="Penitent's Rope"})
    sets.midcast.EMNDPotency[8].MP = sets.midcast.EMNDPotency[7].MP - (sets.MaxMP.waistMP - 0)
    sets.midcast.EMNDPotency[9] = set_combine(sets.midcast.EMNDPotency[8],{lring="Aqua Ring"})
    sets.midcast.EMNDPotency[9].MP = sets.midcast.EMNDPotency[8].MP - (sets.MaxMP.lringMP - 0)
    sets.midcast.EMNDPotency[10]= set_combine(sets.midcast.EMNDPotency[9],{ear1="Cmn. Earring"})
    sets.midcast.EMNDPotency[10].MP= sets.midcast.EMNDPotency[9].MP - (sets.MaxMP.ear1MP - 0)
    sets.midcast.EMNDPotency[11]= set_combine(sets.midcast.EMNDPotency[10],{ear2="Cmn. Earring"})
    sets.midcast.EMNDPotency[11].MP= sets.midcast.EMNDPotency[10].MP- (sets.MaxMP.ear2MP - 0)
    sets.midcast.EMNDPotency[12]= set_combine(sets.midcast.EMNDPotency[11],{ammo="Jasper Tathlum"})
    sets.midcast.EMNDPotency[12].MP= sets.midcast.EMNDPotency[11].MP- (sets.MaxMP.ammoMP - 0)


-------------------------------
--        #Enhancing         --
--         Enhancing         --
--                           --
-------------------------------
    -- sets.Weapons.Earth (PDT -20%) used in main slot when not in melee mode
    -- Enhancing Skill +45 | PDT -9% --
    sets.midcast.Enhancing[0] = set_combine(sets.MaxMP,               {hands="Dls. Gloves +1"})
    sets.midcast.Enhancing[0].MP = sets.MaxMP.MP                - (sets.MaxMP.handsMP - 23)
    sets.midcast.Enhancing[1] = set_combine(sets.midcast.Enhancing[0],{legs="Warlock's Tights"})
    sets.midcast.Enhancing[1].MP = sets.midcast.Enhancing[0].MP - (sets.MaxMP.legsMP - 13)
    sets.midcast.Enhancing[2] = set_combine(sets.midcast.Enhancing[1],{back="Merciful Cape"})
    sets.midcast.Enhancing[2].MP = sets.midcast.Enhancing[1].MP - (sets.MaxMP.backMP - 25)
    sets.midcast.Enhancing[3] = set_combine(sets.midcast.Enhancing[2],{neck="Enhancing Torque"})
    sets.midcast.Enhancing[3].MP = sets.midcast.Enhancing[2].MP - (sets.MaxMP.neckMP - 0)
    sets.midcast.Enhancing[4] = set_combine(sets.midcast.Enhancing[3],{body="Glamor Jupon"})
    sets.midcast.Enhancing[4].MP = sets.midcast.Enhancing[3].MP - (sets.MaxMP.bodyMP - 0)
    sets.midcast.Enhancing[5] = set_combine(sets.midcast.Enhancing[4],{rring="Jelly Ring"})
    sets.midcast.Enhancing[5].MP = sets.midcast.Enhancing[4].MP - (sets.MaxMP.rringMP - 0)
    sets.midcast.Enhancing[6] = set_combine(sets.midcast.Enhancing[5],{feet="Dst. Leggings +1"})
    sets.midcast.Enhancing[6].MP = sets.midcast.Enhancing[5].MP - (sets.MaxMP.feetMP - 0)
    sets.midcast.Enhancing[7] = set_combine(sets.midcast.Enhancing[6],{head="Darksteel Cap +1"})
    sets.midcast.Enhancing[7].MP = sets.midcast.Enhancing[6].MP - (sets.MaxMP.headMP - 0)
    

-------------------------------
--         #NINTMacc         --
--         Elemental         --
--           MAcc            --
-------------------------------
    -- INT +37 | Elemental Skill +32 | MAB +9 | MAcc +11 --
    sets.midcast.NINTMacc[0] = set_combine(sets.MaxMP,              {head="Wlk. Chapeau +1"})
    sets.midcast.NINTMacc[0].MP = sets.MaxMP.MP               - (sets.MaxMP.headMP - 25)
    sets.midcast.NINTMacc[1] = set_combine(sets.midcast.NINTMacc[0],{legs="Duelist's Tights"})
    sets.midcast.NINTMacc[1].MP = sets.midcast.NINTMacc[0].MP - (sets.MaxMP.legsMP - 16)
    sets.midcast.NINTMacc[2] = set_combine(sets.midcast.NINTMacc[1],{neck="Elemental Torque"})
    sets.midcast.NINTMacc[2].MP = sets.midcast.NINTMacc[1].MP - (sets.MaxMP.neckMP - 0)
    sets.midcast.NINTMacc[3] = set_combine(sets.midcast.NINTMacc[2],{back="Merciful Cape"})
    sets.midcast.NINTMacc[3].MP = sets.midcast.NINTMacc[2].MP - (sets.MaxMP.neckMP - 25)
    sets.midcast.NINTMacc[4] = set_combine(sets.midcast.NINTMacc[3],{body="Errant Hpl."})
    sets.midcast.NINTMacc[4].MP = sets.midcast.NINTMacc[3].MP - (sets.MaxMP.bodyMP - 0)
    sets.midcast.NINTMacc[5] = set_combine(sets.midcast.NINTMacc[4],{feet="Goliard Clogs"})
    sets.midcast.NINTMacc[5].MP = sets.midcast.NINTMacc[4].MP - (sets.MaxMP.feetMP - 0)
    sets.midcast.NINTMacc[6] = set_combine(sets.midcast.NINTMacc[5],{ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.midcast.NINTMacc[6].MP = sets.midcast.NINTMacc[5].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    sets.midcast.NINTMacc[7] = set_combine(sets.midcast.NINTMacc[6],{rring="Snow Ring"})
    sets.midcast.NINTMacc[7].MP = sets.midcast.NINTMacc[6].MP - (sets.MaxMP.rringMP - 0)
    sets.midcast.NINTMacc[8] = set_combine(sets.midcast.NINTMacc[7],{hands="Goliard Cuffs"})
    sets.midcast.NINTMacc[8].MP = sets.midcast.NINTMacc[7].MP - (sets.MaxMP.handsMP - 0)
    sets.midcast.NINTMacc[9] = set_combine(sets.midcast.NINTMacc[8],{waist="Penitent's Rope"})
    sets.midcast.NINTMacc[9].MP = sets.midcast.NINTMacc[8].MP - (sets.MaxMP.waistMP - 0)
    sets.midcast.NINTMacc[10]= set_combine(sets.midcast.NINTMacc[9],{lring="Snow Ring"})
    sets.midcast.NINTMacc[10].MP= sets.midcast.NINTMacc[9].MP- (sets.MaxMP.lringMP - 0)
    sets.midcast.NINTMacc[11]= set_combine(sets.midcast.NINTMacc[10],{ammo="Phtm. Tathlum"})
    sets.midcast.NINTMacc[11].MP= sets.midcast.NINTMacc[10].MP- (sets.MaxMP.ammoMP - 10)


-------------------------------
--       #ObiNINTMacc        --
--         Elemental         --
--         MAcc Obi          --
-------------------------------
    -- INT +32 | Elemental Skill +32 | MAB +9 | MAcc +11 --
    sets.midcast.NINTMaccObi[0] = set_combine(sets.MaxMP,                 {head="Wlk. Chapeau +1"})
    sets.midcast.NINTMaccObi[0].MP = sets.MaxMP.MP                  - (sets.MaxMP.headMP - 25)
    sets.midcast.NINTMaccObi[1] = set_combine(sets.midcast.NINTMaccObi[0],{legs="Duelist's Tights"})
    sets.midcast.NINTMaccObi[1].MP = sets.midcast.NINTMaccObi[0].MP - (sets.MaxMP.legsMP - 16)
    sets.midcast.NINTMaccObi[2] = set_combine(sets.midcast.NINTMaccObi[1],{neck="Elemental Torque"})
    sets.midcast.NINTMaccObi[2].MP = sets.midcast.NINTMaccObi[1].MP - (sets.MaxMP.neckMP - 0)
    sets.midcast.NINTMaccObi[3] = set_combine(sets.midcast.NINTMaccObi[2],{back="Merciful Cape"})
    sets.midcast.NINTMaccObi[3].MP = sets.midcast.NINTMaccObi[2].MP - (sets.MaxMP.backMP - 25)
    sets.midcast.NINTMaccObi[4] = set_combine(sets.midcast.NINTMaccObi[3],{waist="Penitent's Rope"})
    sets.midcast.NINTMaccObi[4].MP = sets.midcast.NINTMaccObi[3].MP - (sets.MaxMP.waistMP - 0)
    sets.midcast.NINTMaccObi[5] = set_combine(sets.midcast.NINTMaccObi[4],{body="Errant Hpl."})
    sets.midcast.NINTMaccObi[5].MP = sets.midcast.NINTMaccObi[4].MP - (sets.MaxMP.bodyMP - 0)
    sets.midcast.NINTMaccObi[6] = set_combine(sets.midcast.NINTMaccObi[5],{feet="Goliard Clogs"})
    sets.midcast.NINTMaccObi[6].MP = sets.midcast.NINTMaccObi[5].MP - (sets.MaxMP.feetMP - 0)
    sets.midcast.NINTMaccObi[7] = set_combine(sets.midcast.NINTMaccObi[6],{ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.midcast.NINTMaccObi[7].MP = sets.midcast.NINTMaccObi[6].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    sets.midcast.NINTMaccObi[8] = set_combine(sets.midcast.NINTMaccObi[7],{rring="Snow Ring"})
    sets.midcast.NINTMaccObi[8].MP = sets.midcast.NINTMaccObi[7].MP - (sets.MaxMP.rringMP - 0)
    sets.midcast.NINTMaccObi[9] = set_combine(sets.midcast.NINTMaccObi[8],{hands="Goliard Cuffs"})
    sets.midcast.NINTMaccObi[9].MP = sets.midcast.NINTMaccObi[8].MP - (sets.MaxMP.handsMP - 0)
    sets.midcast.NINTMaccObi[10]= set_combine(sets.midcast.NINTMaccObi[9],{lring="Snow Ring"})
    sets.midcast.NINTMaccObi[10].MP= sets.midcast.NINTMaccObi[9].MP- (sets.MaxMP.lringMP - 0)
    sets.midcast.NINTMaccObi[11]= set_combine(sets.midcast.NINTMaccObi[10],{ammo="Phtm. Tathlum"})
    sets.midcast.NINTMaccObi[11].MP= sets.midcast.NINTMaccObi[10].MP- (sets.MaxMP.ammoMP - 10)


-------------------------------
--       #NINTPotency        --
--         Elemental         --
--          Potency          --
-------------------------------
    -- INT +44 | Elemental Skill +20 | MAB +21 | MAcc +4 --
    sets.midcast.NINTPotency[0] = set_combine(sets.MaxMP,                 {head="Wlk. Chapeau +1"})
    sets.midcast.NINTPotency[0].MP = sets.MaxMP.MP                  - (sets.MaxMP.headMP - 25)
    sets.midcast.NINTPotency[1] = set_combine(sets.midcast.NINTPotency[0],{legs="Duelist's Tights"})
    sets.midcast.NINTPotency[1].MP = sets.midcast.NINTPotency[0].MP - (sets.MaxMP.legsMP - 16)
    sets.midcast.NINTPotency[2] = set_combine(sets.midcast.NINTPotency[1],{body="Errant Hpl."})
    sets.midcast.NINTPotency[2].MP = sets.midcast.NINTPotency[1].MP - (sets.MaxMP.bodyMP - 0)
    sets.midcast.NINTPotency[3] = set_combine(sets.midcast.NINTPotency[2],{feet="Duelist's Boots"})
    sets.midcast.NINTPotency[3].MP = sets.midcast.NINTPotency[2].MP - (sets.MaxMP.feetMP - 15)
    sets.midcast.NINTPotency[4] = set_combine(sets.midcast.NINTPotency[3],{neck="Solon Torque"})
    sets.midcast.NINTPotency[4].MP = sets.midcast.NINTPotency[3].MP - (sets.MaxMP.neckMP - 12)
    sets.midcast.NINTPotency[5] = set_combine(sets.midcast.NINTPotency[4],{ear1="Moldavite Earring"})
    sets.midcast.NINTPotency[5].MP = sets.midcast.NINTPotency[4].MP - (sets.MaxMP.ear1MP - 0)
    sets.midcast.NINTPotency[6] = set_combine(sets.midcast.NINTPotency[5],{rring="Snow Ring"})
    sets.midcast.NINTPotency[6].MP = sets.midcast.NINTPotency[5].MP - (sets.MaxMP.rringMP - 0)
    sets.midcast.NINTPotency[7] = set_combine(sets.midcast.NINTPotency[6],{back="Prism Cape"})
    sets.midcast.NINTPotency[7].MP = sets.midcast.NINTPotency[6].MP - (sets.MaxMP.backMP - 10)
    sets.midcast.NINTPotency[8] = set_combine(sets.midcast.NINTPotency[7],{hands="Goliard Cuffs"})
    sets.midcast.NINTPotency[8].MP = sets.midcast.NINTPotency[7].MP - (sets.MaxMP.handsMP - 0)
    sets.midcast.NINTPotency[9] = set_combine(sets.midcast.NINTPotency[8],{waist="Penitent's Rope"})
    sets.midcast.NINTPotency[9].MP = sets.midcast.NINTPotency[8].MP - (sets.MaxMP.waistMP - 0)
    sets.midcast.NINTPotency[10]= set_combine(sets.midcast.NINTPotency[9],{lring="Snow Ring"})
    sets.midcast.NINTPotency[10].MP= sets.midcast.NINTPotency[9].MP- (sets.MaxMP.lringMP - 0)
    sets.midcast.NINTPotency[11]= set_combine(sets.midcast.NINTPotency[10],{ammo="Phtm. Tathlum"})
    sets.midcast.NINTPotency[11].MP= sets.midcast.NINTPotency[10].MP- (sets.MaxMP.ammoMP - 10)
    sets.midcast.NINTPotency[12]= set_combine(sets.midcast.NINTPotency[11],{ear2="Morion Earring +1"})
    sets.midcast.NINTPotency[12].MP= sets.midcast.NINTPotency[11].MP- (sets.MaxMP.ear2MP - 5)
    sets.midcast.NINTPotency[13]= set_combine(sets.midcast.NINTPotency[12],{neck="Uggalepih Pendant"})
    sets.midcast.NINTPotency[13].MP= sets.midcast.NINTPotency[12].MP- (12 - 20) -- Second Neck Swap


-------------------------------
--      #ObiNINTPotency      --
--         Elemental         --
--        Potency Obi        --
-------------------------------
    -- INT +39 | Elemental Skill +20 | MAB +21 | MAcc +4 --
    sets.midcast.NINTPotencyObi[0] = set_combine(sets.MaxMP,                    {head="Wlk. Chapeau +1"})
    sets.midcast.NINTPotencyObi[0].MP = sets.MaxMP.MP                     - (sets.MaxMP.headMP - 25)
    sets.midcast.NINTPotencyObi[1] = set_combine(sets.midcast.NINTPotencyObi[0],{legs="Duelist's Tights"})
    sets.midcast.NINTPotencyObi[1].MP = sets.midcast.NINTPotencyObi[0].MP - (sets.MaxMP.legsMP - 16)
    sets.midcast.NINTPotencyObi[2] = set_combine(sets.midcast.NINTPotencyObi[1],{waist="Penitent's Rope"})
    sets.midcast.NINTPotencyObi[2].MP = sets.midcast.NINTPotencyObi[1].MP - (sets.MaxMP.waistMP - 0)
    sets.midcast.NINTPotencyObi[3] = set_combine(sets.midcast.NINTPotencyObi[2],{body="Errant Hpl."})
    sets.midcast.NINTPotencyObi[3].MP = sets.midcast.NINTPotencyObi[2].MP - (sets.MaxMP.bodyMP - 0)
    sets.midcast.NINTPotencyObi[4] = set_combine(sets.midcast.NINTPotencyObi[3],{feet="Duelist's Boots"})
    sets.midcast.NINTPotencyObi[4].MP = sets.midcast.NINTPotencyObi[3].MP - (sets.MaxMP.feetMP - 15)
    sets.midcast.NINTPotencyObi[5] = set_combine(sets.midcast.NINTPotencyObi[4],{neck="Solon Torque"})
    sets.midcast.NINTPotencyObi[5].MP = sets.midcast.NINTPotencyObi[4].MP - (sets.MaxMP.neckMP - 12)
    sets.midcast.NINTPotencyObi[6] = set_combine(sets.midcast.NINTPotencyObi[5],{ear1="Moldavite Earring"})
    sets.midcast.NINTPotencyObi[6].MP = sets.midcast.NINTPotencyObi[5].MP - (sets.MaxMP.ear1MP - 0)
    sets.midcast.NINTPotencyObi[7] = set_combine(sets.midcast.NINTPotencyObi[6],{rring="Snow Ring"})
    sets.midcast.NINTPotencyObi[7].MP = sets.midcast.NINTPotencyObi[6].MP - (sets.MaxMP.rringMP - 0)
    sets.midcast.NINTPotencyObi[8] = set_combine(sets.midcast.NINTPotencyObi[7],{hands="Goliard Cuffs"})
    sets.midcast.NINTPotencyObi[8].MP = sets.midcast.NINTPotencyObi[7].MP - (sets.MaxMP.handsMP - 0)
    sets.midcast.NINTPotencyObi[9] = set_combine(sets.midcast.NINTPotencyObi[8],{back="Prism Cape"})
    sets.midcast.NINTPotencyObi[9].MP = sets.midcast.NINTPotencyObi[8].MP - (sets.MaxMP.backMP - 10)
    sets.midcast.NINTPotencyObi[10]= set_combine(sets.midcast.NINTPotencyObi[9],{lring="Snow Ring"})
    sets.midcast.NINTPotencyObi[10].MP= sets.midcast.NINTPotencyObi[9].MP - (sets.MaxMP.lringMP - 0)
    sets.midcast.NINTPotencyObi[11]= set_combine(sets.midcast.NINTPotencyObi[10],{ammo="Phtm. Tathlum"})
    sets.midcast.NINTPotencyObi[11].MP= sets.midcast.NINTPotencyObi[10].MP- (sets.MaxMP.ammoMP - 10)
    sets.midcast.NINTPotencyObi[12]= set_combine(sets.midcast.NINTPotencyObi[11],{ear2="Morion Earring +1"})
    sets.midcast.NINTPotencyObi[12].MP= sets.midcast.NINTPotencyObi[11].MP- (sets.MaxMP.ear2MP - 5)
    sets.midcast.NINTPotencyObi[13]= set_combine(sets.midcast.NINTPotencyObi[12],{neck="Uggalepih Pendant"})
    sets.midcast.NINTPotencyObi[13].MP= sets.midcast.NINTPotencyObi[12].MP- (12 - 20) -- Second Neck Swap


-------------------------------
--           #HMND           --
--          Healing          --
--                           --
-------------------------------
    -- MND +44 | Enmity -24 | Haste 7% --
    sets.midcast.HMND[0] = set_combine(sets.MaxMP,          {hands="Errant Cuffs",
                                                             legs="Custom Slacks",
                                                             feet="Errant Pigaches"})
    sets.midcast.HMND[0].MP = sets.MaxMP.MP - (sets.MaxMP.handsMP - 20) - (sets.MaxMP.legsMP - 32) - (sets.MaxMP.feetMP - 20)
    sets.midcast.HMND[1] = set_combine(sets.midcast.HMND[0],{body="Goliard Saio"})
    sets.midcast.HMND[1].MP = sets.midcast.HMND[0].MP - (sets.MaxMP.bodyMP - 0)
    sets.midcast.HMND[2] = set_combine(sets.midcast.HMND[1],{head="Nashira Turban"})
    sets.midcast.HMND[2].MP = sets.midcast.HMND[1].MP - (sets.MaxMP.headMP - 0)
    sets.midcast.HMND[3] = set_combine(sets.midcast.HMND[2],{legs="Mahatma Slops"})
    sets.midcast.HMND[3].MP = sets.midcast.HMND[2].MP - (sets.MaxMP.legsMP - 0)
    sets.midcast.HMND[4] = set_combine(sets.midcast.HMND[3],{hands="Nashira Gages"})
    sets.midcast.HMND[4].MP = sets.midcast.HMND[3].MP - (20 - 0) -- Second Hands Swap
    sets.midcast.HMND[5] = set_combine(sets.midcast.HMND[4],{waist="Penitent's Rope"})
    sets.midcast.HMND[5].MP = sets.midcast.HMND[4].MP - (sets.MaxMP.waistMP - 0)
    sets.midcast.HMND[6] = set_combine(sets.midcast.HMND[5],{back="Prism Cape"})
    sets.midcast.HMND[6].MP = sets.midcast.HMND[5].MP - (sets.MaxMP.backMP - 10)
    sets.midcast.HMND[7] = set_combine(sets.midcast.HMND[6],{rring="Aqua Ring"})
    sets.midcast.HMND[7].MP = sets.midcast.HMND[6].MP - (sets.MaxMP.rringMP - 0)
    sets.midcast.HMND[8] = set_combine(sets.midcast.HMND[7],{neck="Faith Torque"})
    sets.midcast.HMND[8].MP = sets.midcast.HMND[7].MP - (sets.MaxMP.neckMP - 0)
    sets.midcast.HMND[9] = set_combine(sets.midcast.HMND[8],{lring="Aqua Ring"})
    sets.midcast.HMND[9].MP = sets.midcast.HMND[8].MP - (sets.MaxMP.lringMP - 0)
    sets.midcast.HMND[10]= set_combine(sets.midcast.HMND[9],{ear1="Cmn. Earring"})
    sets.midcast.HMND[10].MP= sets.midcast.HMND[9].MP - (sets.MaxMP.ear1MP - 0)
    sets.midcast.HMND[11]= set_combine(sets.midcast.HMND[10],{ear2="Cmn. Earring"})
    sets.midcast.HMND[11].MP= sets.midcast.HMND[10].MP- (sets.MaxMP.ear2MP - 0)


-------------------------------
--        #Stoneskin         --
--         Stoneskin         --
--                           --
-------------------------------
    -- sets.Weapons.Earth (PDT -20%) used in main slot when not in melee mode
    -- MND +26 | Haste +23% --
    sets.midcast.Stoneskin[0] = set_combine(sets.MaxMP,               {body="Goliard Saio"})
    sets.midcast.Stoneskin[0].MP = sets.MaxMP.MP                - (sets.MaxMP.bodyMP - 42)
    sets.midcast.Stoneskin[1] = set_combine(sets.midcast.Stoneskin[0],{rring="Aqua Ring"})
    sets.midcast.Stoneskin[1].MP = sets.midcast.Stoneskin[0].MP - (sets.MaxMP.rringMP - 0)
    sets.midcast.Stoneskin[2] = set_combine(sets.midcast.Stoneskin[1],{legs="Tatsu. Sitagoromo"})
    sets.midcast.Stoneskin[2].MP = sets.midcast.Stoneskin[1].MP - (sets.MaxMP.legsMP - 0)
    sets.midcast.Stoneskin[3] = set_combine(sets.midcast.Stoneskin[2],{hands="Dusk Gloves"})
    sets.midcast.Stoneskin[3].MP = sets.midcast.Stoneskin[2].MP - (sets.MaxMP.handsMP - 0)
    sets.midcast.Stoneskin[4] = set_combine(sets.midcast.Stoneskin[3],{back="Prism Cape"})
    sets.midcast.Stoneskin[4].MP = sets.midcast.Stoneskin[3].MP - (sets.MaxMP.backMP - 10)
    sets.midcast.Stoneskin[5] = set_combine(sets.midcast.Stoneskin[4],{feet="Dusk Ledelsens"})
    sets.midcast.Stoneskin[5].MP = sets.midcast.Stoneskin[4].MP - (sets.MaxMP.feetMP - 0)
    sets.midcast.Stoneskin[6] = set_combine(sets.midcast.Stoneskin[5],{neck="Faith Torque"})
    sets.midcast.Stoneskin[6].MP = sets.midcast.Stoneskin[5].MP - (sets.MaxMP.neckMP - 0)
    sets.midcast.Stoneskin[7] = set_combine(sets.midcast.Stoneskin[6],{lring="Aqua Ring"})
    sets.midcast.Stoneskin[7].MP = sets.midcast.Stoneskin[6].MP - (sets.MaxMP.lringMP - 0)
    sets.midcast.Stoneskin[8] = set_combine(sets.midcast.Stoneskin[7],{waist="Speed Belt"})
    sets.midcast.Stoneskin[8].MP = sets.midcast.Stoneskin[7].MP - (sets.MaxMP.waistMP - 0)
    sets.midcast.Stoneskin[9] = set_combine(sets.midcast.Stoneskin[8],{ear1="Cmn. Earring"})
    sets.midcast.Stoneskin[9].MP = sets.midcast.Stoneskin[8].MP - (sets.MaxMP.ear1MP - 0)
    sets.midcast.Stoneskin[10]= set_combine(sets.midcast.Stoneskin[9],{ear2="Cmn. Earring"})
    sets.midcast.Stoneskin[10].MP= sets.midcast.Stoneskin[9].MP- (sets.MaxMP.ear2MP - 0)
    sets.midcast.Stoneskin[11]= set_combine(sets.midcast.Stoneskin[10],{ammo="Jasper Tathlum"})
    sets.midcast.Stoneskin[11].MP= sets.midcast.Stoneskin[10].MP- (sets.MaxMP.ammoMP - 0)


-------------------------------
--           #CHA            --
--         Charisma          --
--                           --
-------------------------------
    -- CHA +45 | Enmity -16 | Haste 1% --
    sets.midcast.CHA[0] = set_combine(sets.MaxMP,         {hands="Errant Cuffs",
                                                           feet="Errant Pigaches"})
    sets.midcast.CHA[0].MP = sets.MaxMP.MP - (sets.MaxMP.handsMP - 20) - (sets.MaxMP.feetMP - 20)
    sets.midcast.CHA[1] = set_combine(sets.midcast.CHA[0],{body="Errant Hpl."})
    sets.midcast.CHA[1].MP = sets.midcast.CHA[0].MP - (sets.MaxMP.bodyMP - 0)
    sets.midcast.CHA[2] = set_combine(sets.midcast.CHA[1],{head="Goliard Chapeau"})
    sets.midcast.CHA[2].MP = sets.midcast.CHA[1].MP - (sets.MaxMP.headMP - 20)
    sets.midcast.CHA[3] = set_combine(sets.midcast.CHA[2],{legs="Mahatma Slops"})
    sets.midcast.CHA[3].MP = sets.midcast.CHA[2].MP - (sets.MaxMP.legsMP - 0)
    sets.midcast.CHA[4] = set_combine(sets.midcast.CHA[3],{hands="Nashira Gages"})
    sets.midcast.CHA[4].MP = sets.midcast.CHA[3].MP - (20 - 0) -- Second Hands Swap
    sets.midcast.CHA[5] = set_combine(sets.midcast.CHA[4],{waist="Rainbow Obi"})
    sets.midcast.CHA[5].MP = sets.midcast.CHA[4].MP - (sets.MaxMP.waistMP - 0)
    sets.midcast.CHA[6] = set_combine(sets.midcast.CHA[5],{back="Jester's Cape +1"})
    sets.midcast.CHA[6].MP = sets.midcast.CHA[5].MP - (sets.MaxMP.backMP - 0)
    sets.midcast.CHA[7] = set_combine(sets.midcast.CHA[6],{feet="Goliard Clogs"})
    sets.midcast.CHA[7].MP = sets.midcast.CHA[6].MP - (sets.MaxMP.feetMP - 0)
    sets.midcast.CHA[8] = set_combine(sets.midcast.CHA[7],{neck="Bird Whistle"})
    sets.midcast.CHA[8].MP = sets.midcast.CHA[7].MP - (sets.MaxMP.neckMP - 0)


------------------------------
--         #Spikes          --
--          Spikes          --
--                          --
------------------------------
    -- INT +60 --
    sets.midcast.Spikes[0] = set_combine(sets.MaxMP,            {head="Wlk. Chapeau +1"})
    sets.midcast.Spikes[0].MP = sets.MaxMP.MP             - (sets.MaxMP.headMP - 25)
    sets.midcast.Spikes[1] = set_combine(sets.midcast.Spikes[0],{neck="Philomath Stole"})
    sets.midcast.Spikes[1].MP = sets.midcast.Spikes[0].MP - (sets.MaxMP.neckMP - 0)
    sets.midcast.Spikes[2] = set_combine(sets.midcast.Spikes[1],{body="Errant Hpl."})
    sets.midcast.Spikes[2].MP = sets.midcast.Spikes[1].MP - (sets.MaxMP.bodyMP - 0)
    sets.midcast.Spikes[3] = set_combine(sets.midcast.Spikes[2],{feet="Goliard Clogs"})
    sets.midcast.Spikes[3].MP = sets.midcast.Spikes[2].MP - (sets.MaxMP.feetMP - 0)
    sets.midcast.Spikes[4] = set_combine(sets.midcast.Spikes[3],{rring="Snow Ring"})
    sets.midcast.Spikes[4].MP = sets.midcast.Spikes[3].MP - (sets.MaxMP.rringMP - 0)
    sets.midcast.Spikes[5] = set_combine(sets.midcast.Spikes[4],{legs="Mahatma Slops"})
    sets.midcast.Spikes[5].MP = sets.midcast.Spikes[4].MP - (sets.MaxMP.legsMP - 0)
    sets.midcast.Spikes[6] = set_combine(sets.midcast.Spikes[5],{back="Prism Cape"})
    sets.midcast.Spikes[6].MP = sets.midcast.Spikes[5].MP - (sets.MaxMP.backMP - 10)
    sets.midcast.Spikes[7] = set_combine(sets.midcast.Spikes[6],{waist="Penitent's Rope"})
    sets.midcast.Spikes[7].MP = sets.midcast.Spikes[6].MP - (sets.MaxMP.waistMP - 0)
    sets.midcast.Spikes[8] = set_combine(sets.midcast.Spikes[7],{lring="Snow Ring"})
    sets.midcast.Spikes[8].MP = sets.midcast.Spikes[7].MP - (sets.MaxMP.lringMP - 0)
    sets.midcast.Spikes[9] = set_combine(sets.midcast.Spikes[8],{ear1="Morion Earring +1"})
    sets.midcast.Spikes[9].MP = sets.midcast.Spikes[8].MP - (sets.MaxMP.ear1MP - 5)
    sets.midcast.Spikes[10]= set_combine(sets.midcast.Spikes[9],{ear2="Morion Earring"})
    sets.midcast.Spikes[10].MP= sets.midcast.Spikes[9].MP - (sets.MaxMP.ear2MP - 4)
    sets.midcast.Spikes[11]= set_combine(sets.midcast.Spikes[10],{ammo="Phtm. Tathlum"})
    sets.midcast.Spikes[11].MP= sets.midcast.Spikes[10].MP- (sets.MaxMP.ammoMP - 10)
    

------------------------------
--       #EleDebuffs        --
--    Elemental Debuffs     --
--                          --
------------------------------
    -- INT +57 | Elemental Skill +27 | MAcc +2 --
    sets.midcast.EleDebuffs[0] = set_combine(sets.MaxMP,                {head="Wlk. Chapeau +1"})
    sets.midcast.EleDebuffs[0].MP = sets.MaxMP.MP                 - (sets.MaxMP.headMP - 25)
    sets.midcast.EleDebuffs[1] = set_combine(sets.midcast.EleDebuffs[0],{neck="Elemental Torque"})
    sets.midcast.EleDebuffs[1].MP = sets.midcast.EleDebuffs[0].MP - (sets.MaxMP.neckMP - 0)
    sets.midcast.EleDebuffs[2] = set_combine(sets.midcast.EleDebuffs[1],{legs="Duelist's Tights"})
    sets.midcast.EleDebuffs[2].MP = sets.midcast.EleDebuffs[1].MP - (sets.MaxMP.legsMP - 16)
    sets.midcast.EleDebuffs[3] = set_combine(sets.midcast.EleDebuffs[2],{feet="Goliard Clogs"})
    sets.midcast.EleDebuffs[3].MP = sets.midcast.EleDebuffs[2].MP - (sets.MaxMP.feetMP - 0)
    sets.midcast.EleDebuffs[4] = set_combine(sets.midcast.EleDebuffs[3],{rring="Snow Ring"})
    sets.midcast.EleDebuffs[4].MP = sets.midcast.EleDebuffs[3].MP - (sets.MaxMP.rringMP - 0)
    sets.midcast.EleDebuffs[5] = set_combine(sets.midcast.EleDebuffs[4],{body="Errant Hpl."})
    sets.midcast.EleDebuffs[5].MP = sets.midcast.EleDebuffs[4].MP - (sets.MaxMP.bodyMP - 0)
    sets.midcast.EleDebuffs[6] = set_combine(sets.midcast.EleDebuffs[5],{back="Prism Cape"})
    sets.midcast.EleDebuffs[6].MP = sets.midcast.EleDebuffs[5].MP - (sets.MaxMP.backMP - 10)
    sets.midcast.EleDebuffs[7] = set_combine(sets.midcast.EleDebuffs[6],{waist="Penitent's Rope"})
    sets.midcast.EleDebuffs[7].MP = sets.midcast.EleDebuffs[6].MP - (sets.MaxMP.waistMP - 0)
    sets.midcast.EleDebuffs[8] = set_combine(sets.midcast.EleDebuffs[7],{lring="Snow Ring"})
    sets.midcast.EleDebuffs[8].MP = sets.midcast.EleDebuffs[7].MP - (sets.MaxMP.lringMP - 0)
    sets.midcast.EleDebuffs[9] = set_combine(sets.midcast.EleDebuffs[8],{ear1="Morion Earring +1"})
    sets.midcast.EleDebuffs[9].MP = sets.midcast.EleDebuffs[8].MP - (sets.MaxMP.ear1MP - 5)
    sets.midcast.EleDebuffs[10]= set_combine(sets.midcast.EleDebuffs[9],{ear2="Morion Earring"})
    sets.midcast.EleDebuffs[10].MP= sets.midcast.EleDebuffs[9].MP - (sets.MaxMP.ear2MP - 4)
    sets.midcast.EleDebuffs[11]= set_combine(sets.midcast.EleDebuffs[10],{ammo="Phtm. Tathlum"})
    sets.midcast.EleDebuffs[11].MP= sets.midcast.EleDebuffs[10].MP- (sets.MaxMP.ammoMP - 10)
    

-------------------------------
--         #Enmity           --
--          Enmity           --
--                           --
-------------------------------
    -- sets.Weapons.Enmity (Enmity + 4) used in main slot when not in melee mode
    -- Enmity +19 | Haste + 8% | PDT + 9% --
    sets.midcast.Enmity[0] = set_combine(sets.MaxMP,            {ear1="Hades Earring +1"})
    sets.midcast.Enmity[0].MP = sets.MaxMP.MP             - (sets.MaxMP.ear1MP - 0)
    sets.midcast.Enmity[1] = set_combine(sets.midcast.Enmity[0],{ear2="Hades Earring +1"})
    sets.midcast.Enmity[1].MP = sets.midcast.Enmity[0].MP - (sets.MaxMP.ear2MP - 0)
    sets.midcast.Enmity[2] = set_combine(sets.midcast.Enmity[1],{neck="Harmonia's Torque"})
    sets.midcast.Enmity[2].MP = sets.midcast.Enmity[1].MP - (sets.MaxMP.neckMP - 0)
    sets.midcast.Enmity[3] = set_combine(sets.midcast.Enmity[2],{hands="Dusk Gloves"})
    sets.midcast.Enmity[3].MP = sets.midcast.Enmity[2].MP - (sets.MaxMP.handsMP - 0)
    sets.midcast.Enmity[4] = set_combine(sets.midcast.Enmity[3],{back="Toreador's Cape"})
    sets.midcast.Enmity[4].MP = sets.midcast.Enmity[3].MP - (sets.MaxMP.backMP - 0)
    sets.midcast.Enmity[5] = set_combine(sets.midcast.Enmity[4],{feet="Dusk Ledelsens"})
    sets.midcast.Enmity[5].MP = sets.midcast.Enmity[4].MP - (sets.MaxMP.feetMP - 0)
    sets.midcast.Enmity[6] = set_combine(sets.midcast.Enmity[5],{legs="Tatsu. Sitagoromo"})
    sets.midcast.Enmity[6].MP = sets.midcast.Enmity[5].MP - (sets.MaxMP.legsMP - 0)
    sets.midcast.Enmity[7] = set_combine(sets.midcast.Enmity[6],{rring="Mermaid Ring"})
    sets.midcast.Enmity[7].MP = sets.midcast.Enmity[6].MP - (sets.MaxMP.rringMP - 0)
    sets.midcast.Enmity[8] = set_combine(sets.midcast.Enmity[7],{waist="Trance Belt"})
    sets.midcast.Enmity[8].MP = sets.midcast.Enmity[7].MP - (sets.MaxMP.waistMP - 0)
    sets.midcast.Enmity[9] = set_combine(sets.midcast.Enmity[8],{head="Baron's Chapeau"})
    sets.midcast.Enmity[9].MP = sets.midcast.Enmity[8].MP - (sets.MaxMP.headMP - 0)
    sets.midcast.Enmity[10]= set_combine(sets.midcast.Enmity[9],{ammo="Phtm. Tathlum"})
    sets.midcast.Enmity[10].MP= sets.midcast.Enmity[9].MP- (sets.MaxMP.ammoMP - 10)
    sets.midcast.Enmity[11]= set_combine(sets.midcast.Enmity[10],{body="Dst. Harness +1"})
    sets.midcast.Enmity[11].MP= sets.midcast.Enmity[10].MP - (sets.MaxMP.bodyMP - 0)
    sets.midcast.Enmity[12]= set_combine(sets.midcast.Enmity[11],{lring="Jelly Ring"})
    sets.midcast.Enmity[12].MP= sets.midcast.Enmity[11].MP - (sets.MaxMP.lringMP - 0)
    

-------------------------------
--        #Raccuracy         --
--      Ranged Accuracy      --
--    Hopefully your gear    --
--         is better         --
-------------------------------
    -- Raccuracy +44 | AGI +12 | STR +14 | Rattack + 0 --
    sets.Raccuracy[0] = set_combine(sets.MaxMP,        {neck="Peacock Charm"})
    sets.Raccuracy[0].MP = sets.MaxMP.MP        - (sets.MaxMP.neckMP - 0)
    sets.Raccuracy[1] = set_combine(sets.Raccuracy[0], {Head="Optical Hat"})
    sets.Raccuracy[1].MP = sets.Raccuracy[0].MP - (sets.MaxMP.headMP - 0)
    sets.Raccuracy[2] = set_combine(sets.Raccuracy[1], {rring="Merman's Ring"})
    sets.Raccuracy[2].MP = sets.Raccuracy[1].MP - (sets.MaxMP.rringMP - 0)
    sets.Raccuracy[3] = set_combine(sets.Raccuracy[2], {lring="Merman's Ring"})
    sets.Raccuracy[3].MP = sets.Raccuracy[2].MP - (sets.MaxMP.lringMP - 0)
    sets.Raccuracy[4] = set_combine(sets.Raccuracy[3], {legs="Pln. Seraweels"})
    sets.Raccuracy[4].MP = sets.Raccuracy[3].MP - (sets.MaxMP.legsMP - 0)
    sets.Raccuracy[5] = set_combine(sets.Raccuracy[4], {feet="Custom M Boots"})
    sets.Raccuracy[5].MP = sets.Raccuracy[4].MP - (sets.MaxMP.feetMP - 0)
    sets.Raccuracy[6] = set_combine(sets.Raccuracy[5], {ear1="Drone Earring"})
    sets.Raccuracy[6].MP = sets.Raccuracy[5].MP - (sets.MaxMP.ear1MP - 0)
    sets.Raccuracy[7] = set_combine(sets.Raccuracy[6], {ear2="Drone Earring"})
    sets.Raccuracy[7].MP = sets.Raccuracy[6].MP - (sets.MaxMP.ear2MP - 0)
    sets.Raccuracy[8] = set_combine(sets.Raccuracy[7], {body="Dls. Tabard +1"})
    sets.Raccuracy[8].MP = sets.Raccuracy[7].MP - (sets.MaxMP.bodyMP - 0)
    sets.Raccuracy[9] = set_combine(sets.Raccuracy[8], {hands="Custom M Gloves"})
    sets.Raccuracy[9].MP = sets.Raccuracy[8].MP - (sets.MaxMP.handsMP - 0)
    sets.Raccuracy[10]= set_combine(sets.Raccuracy[9], {waist="Warwolf Belt"})
    sets.Raccuracy[10].MP= sets.Raccuracy[9].MP - (sets.MaxMP.waistMP - 0)
    sets.Raccuracy[11]= set_combine(sets.Raccuracy[10],{back="Forager's Mantle"})
    sets.Raccuracy[11].MP= sets.Raccuracy[10].MP- (sets.MaxMP.backMP - 0)
    

-------------------------------
--         #Accuracy         --
--          Accuracy         --
--                           --
-------------------------------
    -- Accuracy +80 | DEX + 4 | Attack + 2 | Sword Skill + 5 --
    sets.Accuracy[0] = set_combine(sets.MaxMP,       {Head="Optical Hat"})
    sets.Accuracy[0].MP = sets.MaxMP.MP       - (sets.MaxMP.headMP - 0)
    sets.Accuracy[1] = set_combine(sets.Accuracy[0], {waist="Virtuoso Belt"})
    sets.Accuracy[1].MP = sets.Accuracy[0].MP - (sets.MaxMP.waistMP - 0)
    sets.Accuracy[2] = set_combine(sets.Accuracy[1], {body="Scp. Harness +1"})
    sets.Accuracy[2].MP = sets.Accuracy[1].MP - (sets.MaxMP.bodyMP - 0)
    sets.Accuracy[3] = set_combine(sets.Accuracy[2], {legs="Tatsu. Sitagoromo"})
    sets.Accuracy[3].MP = sets.Accuracy[2].MP - (sets.MaxMP.legsMP - 0)
    sets.Accuracy[4] = set_combine(sets.Accuracy[3], {neck="Peacock Charm"})
    sets.Accuracy[4].MP = sets.Accuracy[3].MP - (sets.MaxMP.neckMP - 0)
    sets.Accuracy[5] = set_combine(sets.Accuracy[4], {back="Beak Mantle"})
    sets.Accuracy[5].MP = sets.Accuracy[4].MP - (sets.MaxMP.backMP - 0)
    sets.Accuracy[6] = set_combine(sets.Accuracy[5], {lring="Toreador's Ring", rring="Toreador's Ring"})
    sets.Accuracy[6].MP = sets.Accuracy[5].MP - (sets.MaxMP.lringMP - 0) - (sets.MaxMP.rringMP - 0)
    sets.Accuracy[7] = set_combine(sets.Accuracy[6], {hands="Goliard Cuffs"})
    sets.Accuracy[7].MP = sets.Accuracy[6].MP - (sets.MaxMP.handsMP - 0)
    sets.Accuracy[8] = set_combine(sets.Accuracy[7], {feet="Goliard Clogs"})
    sets.Accuracy[8].MP = sets.Accuracy[7].MP - (sets.MaxMP.feetMP - 0)
    sets.Accuracy[9] = set_combine(sets.Accuracy[8], {ear1="Suppanomimi"})
    sets.Accuracy[9].MP = sets.Accuracy[8].MP - (sets.MaxMP.ear1MP - 0)
    sets.Accuracy[10]= set_combine(sets.Accuracy[9], {ear2="Optical Earring"})
    sets.Accuracy[10].MP= sets.Accuracy[9].MP - (sets.MaxMP.ear2MP - 0)
    sets.Accuracy[11]= set_combine(sets.Accuracy[10],{ammo="Astrolabe"})
    sets.Accuracy[11].MP= sets.Accuracy[10].MP- (sets.MaxMP.ammoMP - 0)
    

-------------------------------
--         #AccHaste         --
--     TP Accuracy Haste     --
--                           --
-------------------------------
    -- Haste 23% | Accuracy +41 | Attack + 9 | Sword Skill + 5 | Double Attack +5% or Attack + 6 --
    sets.AccHaste[0] = set_combine(sets.MaxMP,       {body="Goliard Saio"})
    sets.AccHaste[0].MP = sets.MaxMP.MP       - (sets.MaxMP.bodyMP - 42)
    sets.AccHaste[1] = set_combine(sets.AccHaste[0], {legs="Tatsu. Sitagoromo"})
    sets.AccHaste[1].MP = sets.AccHaste[0].MP - (sets.MaxMP.legsMP - 0)
    sets.AccHaste[2] = set_combine(sets.AccHaste[1], {hands="Dusk Gloves"})
    sets.AccHaste[2].MP = sets.AccHaste[1].MP - (sets.MaxMP.handsMP - 0)
    sets.AccHaste[3] = set_combine(sets.AccHaste[2], {feet="Dusk Ledelsens"})
    sets.AccHaste[3].MP = sets.AccHaste[2].MP - (sets.MaxMP.feetMP - 0)
    sets.AccHaste[4] = set_combine(sets.AccHaste[3], {waist="Speed Belt"})
    sets.AccHaste[4].MP = sets.AccHaste[3].MP - (sets.MaxMP.waistMP - 0)
    sets.AccHaste[5] = set_combine(sets.AccHaste[4], {neck="Peacock Charm"})
    sets.AccHaste[5].MP = sets.AccHaste[4].MP - (sets.MaxMP.neckMP - 0)
    sets.AccHaste[6] = set_combine(sets.AccHaste[5], {back="Beak Mantle"})
    sets.AccHaste[6].MP = sets.AccHaste[5].MP - (sets.MaxMP.backMP - 0)
    sets.AccHaste[7] = set_combine(sets.AccHaste[6], {lring="Lava's Ring", rring="Kusha's Ring"})
    sets.AccHaste[7].MP = sets.AccHaste[6].MP - (sets.MaxMP.lringMP - 0) - (sets.MaxMP.rringMP - 0)
    sets.AccHaste[8] = set_combine(sets.AccHaste[7], {ear1="Suppanomimi"})
    sets.AccHaste[8].MP = sets.AccHaste[7].MP - (sets.MaxMP.ear1MP - 0)
    sets.AccHaste[9] = set_combine(sets.AccHaste[8], {ear2="Merman's Earring"}) -- Hollow Earring
    sets.AccHaste[9].MP = sets.AccHaste[8].MP - (sets.MaxMP.ear2MP - 0)
    sets.AccHaste[10]= set_combine(sets.AccHaste[9],{ammo="Astrolabe"})
    sets.AccHaste[10].MP= sets.AccHaste[9].MP - (sets.MaxMP.ammoMP - 0)
    -- These last 2 swaps are enabled/disabled by the menu --
    sets.AccHaste[11]= set_combine(sets.AccHaste[10],{rring="Toreador's Ring", lring="Toreador's Ring"})
    sets.AccHaste[11].MP= sets.AccHaste[10].MP -- no change
    -- Haste 19% | Accuracy +55 | Attack + 3 | Sword Skill + 5 | Double Attack +5% or Attack + 6 --
    sets.AccHaste[12]= set_combine(sets.AccHaste[11],{body="Scp. Harness +1"})
    sets.AccHaste[12].MP= sets.AccHaste[11].MP- (42 - 0) -- Second Body Swap
    

-------------------------------
--         #PDTHaste         --
--      TP Brick Haste       --
--                           --
-------------------------------
    -- Haste 23% | Accuracy +20 | Attack + 9 | Sword Skill + 5 | Double Attack +5% | PDT -11%/-17% --
    sets.PDTHaste[0] = set_combine(sets.MaxMP,       {body="Goliard Saio"})
    sets.PDTHaste[0].MP = sets.MaxMP.MP       - (sets.MaxMP.bodyMP - 42)
    sets.PDTHaste[1] = set_combine(sets.PDTHaste[0], {legs="Tatsu. Sitagoromo"})
    sets.PDTHaste[1].MP = sets.PDTHaste[0].MP - (sets.MaxMP.legsMP - 0)
    sets.PDTHaste[2] = set_combine(sets.PDTHaste[1], {hands="Dusk Gloves"})
    sets.PDTHaste[2].MP = sets.PDTHaste[1].MP - (sets.MaxMP.handsMP - 0)
    sets.PDTHaste[3] = set_combine(sets.PDTHaste[2], {feet="Dusk Ledelsens"})
    sets.PDTHaste[3].MP = sets.PDTHaste[2].MP - (sets.MaxMP.feetMP - 0)
    sets.PDTHaste[4] = set_combine(sets.PDTHaste[3], {waist="Speed Belt"})
    sets.PDTHaste[4].MP = sets.PDTHaste[3].MP - (sets.MaxMP.waistMP - 0)
    sets.PDTHaste[5] = set_combine(sets.PDTHaste[4], {neck="Peacock Charm"})
    sets.PDTHaste[5].MP = sets.PDTHaste[4].MP - (sets.MaxMP.neckMP - 0)
    sets.PDTHaste[6] = set_combine(sets.PDTHaste[5], {back="Umbra Cape"})
    sets.PDTHaste[6].MP = sets.PDTHaste[5].MP - (sets.MaxMP.backMP - 0)
    sets.PDTHaste[7] = set_combine(sets.PDTHaste[6], {rring="Jelly Ring"})
    sets.PDTHaste[7].MP = sets.PDTHaste[6].MP - (sets.MaxMP.rringMP - 0)
    sets.PDTHaste[8] = set_combine(sets.PDTHaste[7], {ear1="Suppanomimi"})
    sets.PDTHaste[8].MP = sets.PDTHaste[7].MP - (sets.MaxMP.ear1MP - 0)
    sets.PDTHaste[9] = set_combine(sets.PDTHaste[8], {ear2="Brutal Earring"})
    sets.PDTHaste[9].MP = sets.PDTHaste[8].MP - (sets.MaxMP.ear2MP - 0)
    sets.PDTHaste[10]= set_combine(sets.PDTHaste[9],{ammo="Astrolabe"})
    sets.PDTHaste[10].MP= sets.PDTHaste[9].MP - (sets.MaxMP.ammoMP - 0)
    

-------------------------------
--         #EvaHaste         --
--      TP Evasion Haste     --
--                           --
-------------------------------
    -- Haste 14% | Accuracy +42 | Attack + 9 | Evasion +29 | PDT -5% | AGI +6 --
    sets.EvaHaste[0] = set_combine(sets.MaxMP,       {body="Goliard Saio"})
    sets.EvaHaste[0].MP = sets.MaxMP.MP       - (sets.MaxMP.bodyMP - 42)
    sets.EvaHaste[1] = set_combine(sets.EvaHaste[0], {legs="Tatsu. Sitagoromo"})
    sets.EvaHaste[1].MP = sets.EvaHaste[0].MP - (sets.MaxMP.legsMP - 0)
    sets.EvaHaste[2] = set_combine(sets.EvaHaste[1], {hands="Dusk Gloves"})
    sets.EvaHaste[2].MP = sets.EvaHaste[1].MP - (sets.MaxMP.handsMP - 0)
    sets.EvaHaste[3] = set_combine(sets.EvaHaste[2], {feet="Dusk Ledelsens"})
    sets.EvaHaste[3].MP = sets.EvaHaste[2].MP - (sets.MaxMP.feetMP - 0)
    sets.EvaHaste[4] = set_combine(sets.EvaHaste[3], {waist="Speed Belt"})
    sets.EvaHaste[4].MP = sets.EvaHaste[3].MP - (sets.MaxMP.waistMP - 0)
    sets.EvaHaste[5] = set_combine(sets.EvaHaste[4], {head="Optical Hat"})
    sets.EvaHaste[5].MP = sets.EvaHaste[4].MP - (sets.MaxMP.headMP - 0)
    sets.EvaHaste[6] = set_combine(sets.EvaHaste[5], {body="Scp. Harness +1"})
    sets.EvaHaste[6].MP = sets.EvaHaste[5].MP - (42 - 0) -- Second Body Swap
    sets.EvaHaste[7] = set_combine(sets.EvaHaste[6],{neck="Peacock Charm"})
    sets.EvaHaste[7].MP = sets.EvaHaste[6].MP - (sets.MaxMP.neckMP - 0)
    sets.EvaHaste[8] = set_combine(sets.EvaHaste[7],{back="Toreador's Cape"})
    sets.EvaHaste[8].MP = sets.EvaHaste[7].MP - (sets.MaxMP.backMP - 0)
    sets.EvaHaste[9] = set_combine(sets.EvaHaste[8],{rring="Jelly Ring"})
    sets.EvaHaste[9].MP = sets.EvaHaste[8].MP - (sets.MaxMP.rringMP - 0)
    sets.EvaHaste[10]= set_combine(sets.EvaHaste[9],{ear1="Drone Earring"})
    sets.EvaHaste[10].MP= sets.EvaHaste[9].MP - (sets.MaxMP.ear1MP - 0)
    sets.EvaHaste[11]= set_combine(sets.EvaHaste[10],{ear2="Drone Earring"})
    sets.EvaHaste[11].MP= sets.EvaHaste[10].MP- (sets.MaxMP.ear2MP - 0)
    sets.EvaHaste[12]= set_combine(sets.EvaHaste[11],{ammo="Astrolabe"})
    sets.EvaHaste[12].MP= sets.EvaHaste[11].MP- (sets.MaxMP.ammoMP - 0)
    

-------------------------------
--        #PDTMelee          --
--         TP Brick          --
--                           --
-------------------------------
    -- PDT -24%/-30% | Accuracy +32 | Attack + 4 | Sword Skill + 5 | Double Attack +5% --
    sets.PDTMelee[0] = set_combine(sets.MaxMP,       {legs="Goliard Trews"})
    sets.PDTMelee[0].MP = sets.MaxMP.MP       - (sets.MaxMP.legsMP - 28)
    sets.PDTMelee[1] = set_combine(sets.PDTMelee[0], {back="Umbra Cape"})
    sets.PDTMelee[1].MP = sets.PDTMelee[0].MP - (sets.MaxMP.backMP - 0)
    sets.PDTMelee[2] = set_combine(sets.PDTMelee[1], {rring="Jelly Ring"})
    sets.PDTMelee[2].MP = sets.PDTMelee[1].MP - (sets.MaxMP.rringMP - 0)
    sets.PDTMelee[3] = set_combine(sets.PDTMelee[2], {hands="Dst. Mittens +1"})
    sets.PDTMelee[3].MP = sets.PDTMelee[2].MP - (sets.MaxMP.handsMP - 0)
    sets.PDTMelee[4] = set_combine(sets.PDTMelee[3], {feet="Dst. Leggings +1"})
    sets.PDTMelee[4].MP = sets.PDTMelee[3].MP - (sets.MaxMP.feetMP - 0)
    sets.PDTMelee[5] = set_combine(sets.PDTMelee[4], {body="Dst. Harness +1"})
    sets.PDTMelee[5].MP = sets.PDTMelee[4].MP - (sets.MaxMP.bodyMP - 0)
    sets.PDTMelee[6] = set_combine(sets.PDTMelee[5], {head="Darksteel Cap +1"})
    sets.PDTMelee[6].MP = sets.PDTMelee[5].MP - (sets.MaxMP.headMP - 0)
    sets.PDTMelee[7] = set_combine(sets.PDTMelee[6], {neck="Peacock Charm"})
    sets.PDTMelee[7].MP = sets.PDTMelee[6].MP - (sets.MaxMP.neckMP - 0)
    sets.PDTMelee[8] = set_combine(sets.PDTMelee[7], {waist="Virtuoso Belt"})
    sets.PDTMelee[8].MP = sets.PDTMelee[7].MP - (sets.MaxMP.waistMP - 0)
    sets.PDTMelee[9] = set_combine(sets.PDTMelee[8], {lring="Toreador's Ring"})
    sets.PDTMelee[9].MP = sets.PDTMelee[8].MP - (sets.MaxMP.lringMP - 0)
    sets.PDTMelee[10]= set_combine(sets.PDTMelee[9], {ammo="Astrolabe"})
    sets.PDTMelee[10].MP= sets.PDTMelee[9].MP - (sets.MaxMP.ammoMP - 0)
    sets.PDTMelee[11]= set_combine(sets.PDTMelee[10],{ear1="Suppanomimi"})
    sets.PDTMelee[11].MP= sets.PDTMelee[10].MP - (sets.MaxMP.ear1MP - 0)
    sets.PDTMelee[12]= set_combine(sets.PDTMelee[11],{ear2="Brutal Earring"})
    sets.PDTMelee[12].MP= sets.PDTMelee[11].MP - (sets.MaxMP.ear2MP - 0)
    
    
-- Currently basically impossible to use without manually disabling the Range slot and seeing a lot of console messages
-------------------------------
--       #WeaponSkill        --
--        Sidewinder         --
--     20% STR / 50% AGI     --
-------------------------------
    -- Raccuracy +44 | AGI +12 | STR +14 | Rattack + 0 --
    sets.ws['Sidewinder'][0] = set_combine(sets.MaxMP,               {neck="Peacock Charm"})
    sets.ws['Sidewinder'][0].MP = sets.MaxMP.MP               - (sets.MaxMP.neckMP - 0)
    sets.ws['Sidewinder'][1] = set_combine(sets.ws['Sidewinder'][0], {Head="Optical Hat"})
    sets.ws['Sidewinder'][1].MP = sets.ws['Sidewinder'][0].MP - (sets.MaxMP.headMP - 0)
    sets.ws['Sidewinder'][2] = set_combine(sets.ws['Sidewinder'][1], {rring="Merman's Ring"})
    sets.ws['Sidewinder'][2].MP = sets.ws['Sidewinder'][1].MP - (sets.MaxMP.rringMP - 0)
    sets.ws['Sidewinder'][3] = set_combine(sets.ws['Sidewinder'][2], {lring="Merman's Ring"})
    sets.ws['Sidewinder'][3].MP = sets.ws['Sidewinder'][2].MP - (sets.MaxMP.lringMP - 0)
    sets.ws['Sidewinder'][4] = set_combine(sets.ws['Sidewinder'][3], {legs="Pln. Seraweels"})
    sets.ws['Sidewinder'][4].MP = sets.ws['Sidewinder'][3].MP - (sets.MaxMP.legsMP - 0)
    sets.ws['Sidewinder'][5] = set_combine(sets.ws['Sidewinder'][4], {feet="Custom M Boots"})
    sets.ws['Sidewinder'][5].MP = sets.ws['Sidewinder'][4].MP - (sets.MaxMP.feetMP - 0)
    sets.ws['Sidewinder'][6] = set_combine(sets.ws['Sidewinder'][5], {ear1="Drone Earring"})
    sets.ws['Sidewinder'][6].MP = sets.ws['Sidewinder'][5].MP - (sets.MaxMP.ear1MP - 0)
    sets.ws['Sidewinder'][7] = set_combine(sets.ws['Sidewinder'][6], {ear2="Drone Earring"})
    sets.ws['Sidewinder'][7].MP = sets.ws['Sidewinder'][6].MP - (sets.MaxMP.ear2MP - 0)
    sets.ws['Sidewinder'][8] = set_combine(sets.ws['Sidewinder'][7], {body="Dls. Tabard +1"})
    sets.ws['Sidewinder'][8].MP = sets.ws['Sidewinder'][7].MP - (sets.MaxMP.bodyMP - 0)
    sets.ws['Sidewinder'][9] = set_combine(sets.ws['Sidewinder'][8], {hands="Custom M Gloves"})
    sets.ws['Sidewinder'][9].MP = sets.ws['Sidewinder'][8].MP - (sets.MaxMP.handsMP - 0)
    sets.ws['Sidewinder'][10]= set_combine(sets.ws['Sidewinder'][9], {waist="Warwolf Belt"})
    sets.ws['Sidewinder'][10].MP= sets.ws['Sidewinder'][9].MP - (sets.MaxMP.waistMP - 0)
    sets.ws['Sidewinder'][11]= set_combine(sets.ws['Sidewinder'][10],{back="Forager's Mantle"})
    sets.ws['Sidewinder'][11].MP= sets.ws['Sidewinder'][10].MP- (sets.MaxMP.backMP - 0)


-------------------------------
--       #WeaponSkill        --
--      Shining Strike       --
--     40% STR / 40% MND     --
-------------------------------
    -- MND +54 | STR - 3 | MAB + 5 | MAcc + 5 --
    sets.ws['Shining Strike'][0] = set_combine(sets.MaxMP,                   {feet="Errant Pigaches"})
    sets.ws['Shining Strike'][0].MP = sets.MaxMP.MP                   - (sets.MaxMP.feetMP - 20)
    sets.ws['Shining Strike'][1] = set_combine(sets.ws['Shining Strike'][0], {Head="Goliard Chapeau"})
    sets.ws['Shining Strike'][1].MP = sets.ws['Shining Strike'][0].MP - (sets.MaxMP.headMP - 20)
    sets.ws['Shining Strike'][2] = set_combine(sets.ws['Shining Strike'][1], {hands="Dvt. Mitts +1"})
    sets.ws['Shining Strike'][2].MP = sets.ws['Shining Strike'][1].MP - (sets.MaxMP.handsMP - 9)
    sets.ws['Shining Strike'][3] = set_combine(sets.ws['Shining Strike'][2], {rring="Aqua Ring"})
    sets.ws['Shining Strike'][3].MP = sets.ws['Shining Strike'][2].MP - (sets.MaxMP.rringMP - 0)
    sets.ws['Shining Strike'][4] = set_combine(sets.ws['Shining Strike'][3], {back="Prism Cape"})
    sets.ws['Shining Strike'][4].MP = sets.ws['Shining Strike'][3].MP - (sets.MaxMP.backMP - 10)
    sets.ws['Shining Strike'][5] = set_combine(sets.ws['Shining Strike'][4], {legs="Warlock's Tights"})
    sets.ws['Shining Strike'][5].MP = sets.ws['Shining Strike'][4].MP - (sets.MaxMP.legsMP - 13)
    sets.ws['Shining Strike'][6] = set_combine(sets.ws['Shining Strike'][5], {neck="Faith Torque"})
    sets.ws['Shining Strike'][6].MP = sets.ws['Shining Strike'][5].MP - (sets.MaxMP.neckMP - 0)
    sets.ws['Shining Strike'][7] = set_combine(sets.ws['Shining Strike'][6], {ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.ws['Shining Strike'][7].MP = sets.ws['Shining Strike'][6].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    sets.ws['Shining Strike'][8] = set_combine(sets.ws['Shining Strike'][7], {waist="Penitent's Rope"})
    sets.ws['Shining Strike'][8].MP = sets.ws['Shining Strike'][7].MP - (sets.MaxMP.waistMP - 0)
    sets.ws['Shining Strike'][9] = set_combine(sets.ws['Shining Strike'][8], {lring="Aqua Ring"})
    sets.ws['Shining Strike'][9].MP = sets.ws['Shining Strike'][8].MP - (sets.MaxMP.lringMP - 0)
    sets.ws['Shining Strike'][10]= set_combine(sets.ws['Shining Strike'][9], {body="Errant Hpl."})
    sets.ws['Shining Strike'][10].MP= sets.ws['Shining Strike'][9].MP - (sets.MaxMP.bodyMP - 0)
    sets.ws['Shining Strike'][11]= set_combine(sets.ws['Shining Strike'][10],{ammo="Jasper Tathlum"})
    sets.ws['Shining Strike'][11].MP= sets.ws['Shining Strike'][10].MP- (sets.MaxMP.ammoMP - 0)
    sets.ws['Shining Strike'][12]= sets.ws['Shining Strike'][11]
    sets.ws['Shining Strike'][12].MP= sets.ws['Shining Strike'][11].MP


-------------------------------
--        #WeaponSkill       --
--        Evisceration       --
--          50% DEX          --
-------------------------------
    -- Accuracy +27 | DEX +23 | STR +17 | Attack +31 --
    sets.ws['Evisceration'][0] = set_combine(sets.MaxMP,                {body="Scp. Harness +1"})
    sets.ws['Evisceration'][0].MP = sets.MaxMP.MP                 - (sets.MaxMP.bodyMP - 0)
    sets.ws['Evisceration'][1] = set_combine(sets.ws['Evisceration'][0],{waist="Virtuoso Belt"})
    sets.ws['Evisceration'][1].MP = sets.ws['Evisceration'][0].MP - (sets.MaxMP.waistMP - 0)
    sets.ws['Evisceration'][2] = set_combine(sets.ws['Evisceration'][1],{hands="Custom M Gloves"})
    sets.ws['Evisceration'][2].MP = sets.ws['Evisceration'][1].MP - (sets.MaxMP.handsMP - 4)
    sets.ws['Evisceration'][3] = set_combine(sets.ws['Evisceration'][2],{neck="Spike Necklace"})
    sets.ws['Evisceration'][3].MP = sets.ws['Evisceration'][2].MP - (sets.MaxMP.neckMP - 0)
    sets.ws['Evisceration'][4] = set_combine(sets.ws['Evisceration'][3],{rring="Rajas Ring"})
    sets.ws['Evisceration'][4].MP = sets.ws['Evisceration'][3].MP - (sets.MaxMP.rringMP - 0)
    sets.ws['Evisceration'][5] = set_combine(sets.ws['Evisceration'][4],{legs="Duelist's Tights"})
    sets.ws['Evisceration'][5].MP = sets.ws['Evisceration'][4].MP - (sets.MaxMP.legsMP - 16)
    sets.ws['Evisceration'][6] = set_combine(sets.ws['Evisceration'][5],{feet="Goliard Clogs"})
    sets.ws['Evisceration'][6].MP = sets.ws['Evisceration'][5].MP - (sets.MaxMP.feetMP - 0)
    sets.ws['Evisceration'][7] = set_combine(sets.ws['Evisceration'][6],{Head="Emperor Hairpin"})
    sets.ws['Evisceration'][7].MP = sets.ws['Evisceration'][6].MP - (sets.MaxMP.headMP - 0)
    sets.ws['Evisceration'][8] = set_combine(sets.ws['Evisceration'][7],{back="Forager's Mantle"})
    sets.ws['Evisceration'][8].MP = sets.ws['Evisceration'][7].MP - (sets.MaxMP.backMP - 0)
    sets.ws['Evisceration'][9] = set_combine(sets.ws['Evisceration'][8],{ear1="Merman's Earring"})
    sets.ws['Evisceration'][9].MP = sets.ws['Evisceration'][8].MP - (sets.MaxMP.ear1MP - 0)
    sets.ws['Evisceration'][10]= set_combine(sets.ws['Evisceration'][9],{ear2="Merman's Earring"})
    sets.ws['Evisceration'][10].MP= sets.ws['Evisceration'][9].MP - (sets.MaxMP.ear2MP - 0)
    sets.ws['Evisceration'][11]= set_combine(sets.ws['Evisceration'][10],{lring="Courage Ring"})
    sets.ws['Evisceration'][11].MP= sets.ws['Evisceration'][10].MP - (sets.MaxMP.lringMP - 0)
    sets.ws['Evisceration'][12]= set_combine(sets.ws['Evisceration'][11],{ammo="Astrolabe"})
    sets.ws['Evisceration'][12].MP= sets.ws['Evisceration'][11].MP - (sets.MaxMP.ammoMP - 0)


-------------------------------
--        #WeaponSkill       --
--         Gust Slash        --
--     40% DEX / 40% INT     --
-------------------------------
    -- INT +47 | DEX + 2 | MAcc +2 --
    sets.ws['Gust Slash'][0] = set_combine(sets.MaxMP,               {legs="Duelist's Tights"})
    sets.ws['Gust Slash'][0].MP = sets.MaxMP.MP               - (sets.MaxMP.legsMP - 16)
    sets.ws['Gust Slash'][1] = set_combine(sets.ws['Gust Slash'][0], {hands="Goliard Clogs"})
    sets.ws['Gust Slash'][1].MP = sets.ws['Gust Slash'][0].MP - (sets.MaxMP.feetMP - 0)
    sets.ws['Gust Slash'][2] = set_combine(sets.ws['Gust Slash'][1], {head="Wlk. Chapeau +1"})
    sets.ws['Gust Slash'][2].MP = sets.ws['Gust Slash'][1].MP - (sets.MaxMP.headMP - 25)
    sets.ws['Gust Slash'][3] = set_combine(sets.ws['Gust Slash'][2], {rring="Snow Ring"})
    sets.ws['Gust Slash'][3].MP = sets.ws['Gust Slash'][2].MP - (sets.MaxMP.rringMP - 0)
    sets.ws['Gust Slash'][4] = set_combine(sets.ws['Gust Slash'][3], {back="Prism Cape"})
    sets.ws['Gust Slash'][4].MP = sets.ws['Gust Slash'][3].MP - (sets.MaxMP.backMP - 10)
    sets.ws['Gust Slash'][5] = set_combine(sets.ws['Gust Slash'][4], {neck="Philomath Stole"})
    sets.ws['Gust Slash'][5].MP = sets.ws['Gust Slash'][4].MP - (sets.MaxMP.neckMP - 0)
    sets.ws['Gust Slash'][6] = set_combine(sets.ws['Gust Slash'][5], {waist="Penitent's Rope"})
    sets.ws['Gust Slash'][6].MP = sets.ws['Gust Slash'][5].MP - (sets.MaxMP.waistMP - 0)
    sets.ws['Gust Slash'][7] = set_combine(sets.ws['Gust Slash'][6], {ear1="Morion Earring +1"})
    sets.ws['Gust Slash'][7].MP = sets.ws['Gust Slash'][6].MP - (sets.MaxMP.ear1MP - 5)
    sets.ws['Gust Slash'][8] = set_combine(sets.ws['Gust Slash'][7], {lring="Snow Ring"})
    sets.ws['Gust Slash'][8].MP = sets.ws['Gust Slash'][7].MP - (sets.MaxMP.lringMP - 0)
    sets.ws['Gust Slash'][9] = set_combine(sets.ws['Gust Slash'][8], {body="Errant Hpl."})
    sets.ws['Gust Slash'][9].MP = sets.ws['Gust Slash'][8].MP - (sets.MaxMP.bodyMP - 0)
    sets.ws['Gust Slash'][10]= set_combine(sets.ws['Gust Slash'][9],{ear2="Morion Earring"})
    sets.ws['Gust Slash'][10].MP= sets.ws['Gust Slash'][9].MP - (sets.MaxMP.ear2MP - 4)
    sets.ws['Gust Slash'][11]= set_combine(sets.ws['Gust Slash'][10],{ammo="Phtm. Tathlum"})
    sets.ws['Gust Slash'][11].MP= sets.ws['Gust Slash'][10].MP- (sets.MaxMP.ammoMP - 10)
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
    -- Accuracy +35 | Sword Skill + 5 | STR +17 | DEX +12 | Attack +41 | Double Attack +5% --
    sets.ws['Fast Blade'][0] = set_combine(sets.MaxMP,              {Head="Optical Hat"})
    sets.ws['Fast Blade'][0].MP = sets.MaxMP.MP               - (sets.MaxMP.headMP - 0)
    sets.ws['Fast Blade'][1] = set_combine(sets.ws['Fast Blade'][0],{body="Assault Jerkin"})
    sets.ws['Fast Blade'][1].MP = sets.ws['Fast Blade'][0].MP - (sets.MaxMP.bodyMP - 0)
    sets.ws['Fast Blade'][2] = set_combine(sets.ws['Fast Blade'][1],{waist="Virtuoso Belt"})
    sets.ws['Fast Blade'][2].MP = sets.ws['Fast Blade'][1].MP - (sets.MaxMP.waistMP - 0)
    sets.ws['Fast Blade'][3] = set_combine(sets.ws['Fast Blade'][2],{ear1="Suppanomimi"})
    sets.ws['Fast Blade'][3].MP = sets.ws['Fast Blade'][2].MP - (sets.MaxMP.ear1MP - 0)
    sets.ws['Fast Blade'][4] = set_combine(sets.ws['Fast Blade'][3],{hands="Custom M Gloves"})
    sets.ws['Fast Blade'][4].MP = sets.ws['Fast Blade'][3].MP - (sets.MaxMP.handsMP - 4)
    sets.ws['Fast Blade'][5] = set_combine(sets.ws['Fast Blade'][4],{neck="Spike Necklace"})
    sets.ws['Fast Blade'][5].MP = sets.ws['Fast Blade'][4].MP - (sets.MaxMP.neckMP - 0)
    sets.ws['Fast Blade'][6] = set_combine(sets.ws['Fast Blade'][5],{rring="Rajas Ring"})
    sets.ws['Fast Blade'][6].MP = sets.ws['Fast Blade'][5].MP - (sets.MaxMP.rringMP - 0)
    sets.ws['Fast Blade'][7] = set_combine(sets.ws['Fast Blade'][6],{lring="Courage Ring"})
    sets.ws['Fast Blade'][7].MP = sets.ws['Fast Blade'][6].MP - (sets.MaxMP.lringMP - 0)
    sets.ws['Fast Blade'][8] = set_combine(sets.ws['Fast Blade'][7],{legs="Tatsu. Sitagoromo"})
    sets.ws['Fast Blade'][8].MP = sets.ws['Fast Blade'][7].MP - (sets.MaxMP.legsMP - 0)
    sets.ws['Fast Blade'][9] = set_combine(sets.ws['Fast Blade'][8],{feet="Dusk Ledelsens"})
    sets.ws['Fast Blade'][9].MP = sets.ws['Fast Blade'][8].MP - (sets.MaxMP.feetMP - 0)
    sets.ws['Fast Blade'][10]= set_combine(sets.ws['Fast Blade'][9],{back="Forager's Mantle"})
    sets.ws['Fast Blade'][10].MP= sets.ws['Fast Blade'][9].MP - (sets.MaxMP.backMP - 10)
    sets.ws['Fast Blade'][11]= set_combine(sets.ws['Fast Blade'][10],{ammo="Astrolabe"})
    sets.ws['Fast Blade'][11].MP= sets.ws['Fast Blade'][10].MP - (sets.MaxMP.ammoMP - 0)
    sets.ws['Fast Blade'][12]= set_combine(sets.ws['Fast Blade'][11],{ear2="Brutal Earring"})
    sets.ws['Fast Blade'][12].MP= sets.ws['Fast Blade'][11].MP - (sets.MaxMP.ear2MP - 0)


-------------------------------
--       #WeaponSkill        --
--       Burning Blade       --
--     40% STR / 40% INT     --
-------------------------------
    -- INT +48 | MAcc +2 | STR -13 | MAB +5 --
    sets.ws['Burning Blade'][0] = set_combine(sets.MaxMP,                 {feet="Goliard Clogs"})
    sets.ws['Burning Blade'][0].MP = sets.MaxMP.MP                  - (sets.MaxMP.feetMP - 0)
    sets.ws['Burning Blade'][1] = set_combine(sets.ws['Burning Blade'][0],{head="Wlk. Chapeau +1"})
    sets.ws['Burning Blade'][1].MP = sets.ws['Burning Blade'][0].MP - (sets.MaxMP.headMP - 25)
    sets.ws['Burning Blade'][2] = set_combine(sets.ws['Burning Blade'][1],{ear1="Cass. Earring", ear2="Helenus's Earring"})
    sets.ws['Burning Blade'][2].MP = sets.ws['Burning Blade'][1].MP - (sets.MaxMP.ear1MP - 5) - (sets.MaxMP.ear2MP - 0)
    sets.ws['Burning Blade'][3] = set_combine(sets.ws['Burning Blade'][2],{rring="Eremite's Ring +1"})
    sets.ws['Burning Blade'][3].MP = sets.ws['Burning Blade'][2].MP - (sets.MaxMP.rringMP - 0)
    sets.ws['Burning Blade'][4] = set_combine(sets.ws['Burning Blade'][3],{back="Prism Cape"})
    sets.ws['Burning Blade'][4].MP = sets.ws['Burning Blade'][3].MP - (sets.MaxMP.backMP - 10)
    sets.ws['Burning Blade'][5] = set_combine(sets.ws['Burning Blade'][4],{neck="Philomath Stole"})
    sets.ws['Burning Blade'][5].MP = sets.ws['Burning Blade'][4].MP - (sets.MaxMP.neckMP - 0)
    sets.ws['Burning Blade'][6] = set_combine(sets.ws['Burning Blade'][5],{legs="Mahatma Slops"})
    sets.ws['Burning Blade'][6].MP = sets.ws['Burning Blade'][5].MP - (sets.MaxMP.legsMP - 0)
    sets.ws['Burning Blade'][7] = set_combine(sets.ws['Burning Blade'][6],{waist="Penitent's Rope"})
    sets.ws['Burning Blade'][7].MP = sets.ws['Burning Blade'][6].MP - (sets.MaxMP.waistMP - 0)
    sets.ws['Burning Blade'][8] = set_combine(sets.ws['Burning Blade'][7],{lring="Eremite's Ring +1"})
    sets.ws['Burning Blade'][8].MP = sets.ws['Burning Blade'][7].MP - (sets.MaxMP.lringMP - 0)
    sets.ws['Burning Blade'][9] = set_combine(sets.ws['Burning Blade'][8],{body="Errant Hpl."})
    sets.ws['Burning Blade'][9].MP = sets.ws['Burning Blade'][8].MP - (sets.MaxMP.bodyMP - 0)
    sets.ws['Burning Blade'][10]= set_combine(sets.ws['Burning Blade'][9],{ammo="Phtm. Tathlum"})
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
    -- Accuracy +45 | Sword Skill + 5 | STR +14 | DEX + 9 | Attack +41 | FTP +.1 | Double Attack +5% --
    sets.ws['Vorpal Blade'][0] = set_combine(sets.MaxMP,                {Head="Optical Hat"})
    sets.ws['Vorpal Blade'][0].MP = sets.MaxMP.MP                 - (sets.MaxMP.headMP - 0)
    sets.ws['Vorpal Blade'][1] = set_combine(sets.ws['Vorpal Blade'][0],{body="Assault Jerkin"})
    sets.ws['Vorpal Blade'][1].MP = sets.ws['Vorpal Blade'][0].MP - (sets.MaxMP.bodyMP - 0)
    sets.ws['Vorpal Blade'][2] = set_combine(sets.ws['Vorpal Blade'][1],{waist="Virtuoso Belt"})
    sets.ws['Vorpal Blade'][2].MP = sets.ws['Vorpal Blade'][1].MP - (sets.MaxMP.waistMP - 0)
    sets.ws['Vorpal Blade'][3] = set_combine(sets.ws['Vorpal Blade'][2],{ear1="Suppanomimi"})
    sets.ws['Vorpal Blade'][3].MP = sets.ws['Vorpal Blade'][2].MP - (sets.MaxMP.ear1MP - 0)
    sets.ws['Vorpal Blade'][4] = set_combine(sets.ws['Vorpal Blade'][3],{hands="Custom M Gloves"})
    sets.ws['Vorpal Blade'][4].MP = sets.ws['Vorpal Blade'][3].MP - (sets.MaxMP.handsMP - 4)
    sets.ws['Vorpal Blade'][5] = set_combine(sets.ws['Vorpal Blade'][4],{neck="Thunder Gorget"})
    sets.ws['Vorpal Blade'][5].MP = sets.ws['Vorpal Blade'][4].MP - (sets.MaxMP.neckMP - 0)
    sets.ws['Vorpal Blade'][6] = set_combine(sets.ws['Vorpal Blade'][5],{rring="Rajas Ring"})
    sets.ws['Vorpal Blade'][6].MP = sets.ws['Vorpal Blade'][5].MP - (sets.MaxMP.rringMP - 0)
    sets.ws['Vorpal Blade'][7] = set_combine(sets.ws['Vorpal Blade'][6],{lring="Courage Ring"})
    sets.ws['Vorpal Blade'][7].MP = sets.ws['Vorpal Blade'][6].MP - (sets.MaxMP.lringMP - 0)
    sets.ws['Vorpal Blade'][8] = set_combine(sets.ws['Vorpal Blade'][7],{legs="Tatsu. Sitagoromo"})
    sets.ws['Vorpal Blade'][8].MP = sets.ws['Vorpal Blade'][7].MP - (sets.MaxMP.legsMP - 0)
    sets.ws['Vorpal Blade'][9] = set_combine(sets.ws['Vorpal Blade'][8],{feet="Dusk Ledelsens"})
    sets.ws['Vorpal Blade'][9].MP = sets.ws['Vorpal Blade'][8].MP - (sets.MaxMP.feetMP - 0)
    sets.ws['Vorpal Blade'][10]= set_combine(sets.ws['Vorpal Blade'][9],{back="Forager's Mantle"})
    sets.ws['Vorpal Blade'][10].MP= sets.ws['Vorpal Blade'][9].MP - (sets.MaxMP.backMP - 0)
    sets.ws['Vorpal Blade'][11]= set_combine(sets.ws['Vorpal Blade'][10],{ammo="Astrolabe"})
    sets.ws['Vorpal Blade'][11].MP= sets.ws['Vorpal Blade'][10].MP- (sets.MaxMP.ammoMP - 0)
    sets.ws['Vorpal Blade'][12]= set_combine(sets.ws['Vorpal Blade'][11],{ear2="Brutal Earring"})
    sets.ws['Vorpal Blade'][12].MP= sets.ws['Vorpal Blade'][11].MP- (sets.MaxMP.ear2MP - 0)


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
    -- MP:609 | Accuracy +45 | Attack +33 | Sword Skill + 5 | STR +19 | DEX -10 | MND +17 | FTP +.1 | Double Attack +5% --
    sets.ws['Death Blossom'][0] = set_combine(sets.MaxMP,                  {feet="Errant Pigaches"}) -- Rutter Sabatons (Morrigan's Pigaches)
    sets.ws['Death Blossom'][0].MP = sets.MaxMP.MP                  - (sets.MaxMP.feetMP - 20)
    sets.ws['Death Blossom'][1] = set_combine(sets.ws['Death Blossom'][0], {neck="Thunder Gorget"})
    sets.ws['Death Blossom'][1].MP = sets.ws['Death Blossom'][0].MP - (sets.MaxMP.neckMP - 0)
    sets.ws['Death Blossom'][2] = set_combine(sets.ws['Death Blossom'][1], {Head="Optical Hat"}) -- (Selenian Cap: +4 STR & +15 WS acc, +10 acc & 5 att)
    sets.ws['Death Blossom'][2].MP = sets.ws['Death Blossom'][1].MP - (sets.MaxMP.headMP - 0)
    sets.ws['Death Blossom'][3] = set_combine(sets.ws['Death Blossom'][2], {waist="Virtuoso Belt"}) -- Warwolf Belt
    sets.ws['Death Blossom'][3].MP = sets.ws['Death Blossom'][2].MP - (sets.MaxMP.waistMP - 0)
    sets.ws['Death Blossom'][4] = set_combine(sets.ws['Death Blossom'][3], {body="Assault Jerkin"}) -- (Morrigan's Robe)
    sets.ws['Death Blossom'][4].MP = sets.ws['Death Blossom'][3].MP - (sets.MaxMP.bodyMP - 0)
    sets.ws['Death Blossom'][5] = set_combine(sets.ws['Death Blossom'][4], {legs="Tatsu. Sitagoromo"}) -- Pahluwan Seraweels (Morrigan's Slops)
    sets.ws['Death Blossom'][5].MP = sets.ws['Death Blossom'][4].MP - (sets.MaxMP.legsMP - 0)
    sets.ws['Death Blossom'][6] = set_combine(sets.ws['Death Blossom'][5], {back="Forager's Mantle"})
    sets.ws['Death Blossom'][6].MP = sets.ws['Death Blossom'][5].MP - (sets.MaxMP.backMP - 0)
    sets.ws['Death Blossom'][7] = set_combine(sets.ws['Death Blossom'][6], {hands="Alkyoneus's Brc."})
    sets.ws['Death Blossom'][7].MP = sets.ws['Death Blossom'][6].MP - (sets.MaxMP.handsMP - 0)
    sets.ws['Death Blossom'][8] = set_combine(sets.ws['Death Blossom'][7], {ear1="Suppanomimi"})
    sets.ws['Death Blossom'][8].MP = sets.ws['Death Blossom'][7].MP - (sets.MaxMP.ear1MP - 0)
    sets.ws['Death Blossom'][9] = set_combine(sets.ws['Death Blossom'][8], {rring="Aqua Ring"})
    sets.ws['Death Blossom'][9].MP = sets.ws['Death Blossom'][8].MP - (sets.MaxMP.rringMP - 0)
    sets.ws['Death Blossom'][10]= set_combine(sets.ws['Death Blossom'][9], {ammo="Astrolabe"})
    sets.ws['Death Blossom'][10].MP= sets.ws['Death Blossom'][9].MP - (sets.MaxMP.ammoMP - 0)
    sets.ws['Death Blossom'][11]= set_combine(sets.ws['Death Blossom'][10],{lring="Aqua Ring"})
    sets.ws['Death Blossom'][11].MP= sets.ws['Death Blossom'][10].MP- (sets.MaxMP.lringMP - 0)
    sets.ws['Death Blossom'][12]= set_combine(sets.ws['Death Blossom'][11],{ear2="Brutal Earring"})
    sets.ws['Death Blossom'][12].MP= sets.ws['Death Blossom'][11].MP- (sets.MaxMP.ear2MP - 0)
    
    
-------------------------------
--                           --
--       Status Checks       --
--       on initialize       --
-------------------------------
    -- Check for Weakness on startup
    if buffactive['weakness'] then Weakened = (BaseMP + SubJobMP) * .75
    else                           Weakened = 0                         end
    -- Check for Subjob Restriction on startup
    if buffactive['SJ Restriction'] then SubJobMP = 0
    else                                 set_SubJobVars(player.sub_job) end
    -- Check for Max MP Down on startup
    if buffactive['Max MP Down'] then send_command('wait 2;gs c MPLock;wait .001;gs c MPLock;wait 5;gs c MPDown;wait 2;gs c Reset') end
    
end


function configureIdlesets()

    if pet.isvalid and pet.element ~= "Physical" then
        -- #Idle
        sets.idle[7] = set_combine(sets.idle[6],{hands="Nashira Gages"})
        sets.idle[7].MP = sets.idle[6].MP - (sets.MaxMP.handsMP - 0)
        sets.idle[8] = set_combine(sets.idle[7],{waist="Avatar Belt"})
        sets.idle[8].MP = sets.idle[7].MP - (sets.MaxMP.waistMP - 0)
        -- #PDTIdle
        sets.PDTidle[7] = set_combine(sets.PDTidle[6],{hands="Nashira Gages"})
        sets.PDTidle[7].MP = sets.PDTidle[6].MP - (sets.MaxMP.handsMP - 0)
        sets.PDTidle[8] = set_combine(sets.PDTidle[7],{waist="Avatar Belt"})
        sets.PDTidle[8].MP = sets.PDTidle[7].MP - (sets.MaxMP.waistMP - 0)
        -- #MDTIdle
        sets.MDTidle[7] = set_combine(sets.MDTidle[6],{hands="Nashira Gages"})
        sets.MDTidle[7].MP = sets.MDTidle[6].MP - (sets.MaxMP.handsMP - 0)
        sets.MDTidle[8] = set_combine(sets.MDTidle[7],{legs="Coral Cuisses +1"})
        sets.MDTidle[8].MP = sets.MDTidle[7].MP - (sets.MaxMP.legsMP - 0)
        sets.MDTidle[9] = set_combine(sets.MDTidle[8],{waist="Avatar Belt"})
        sets.MDTidle[9].MP = sets.MDTidle[8].MP - (sets.MaxMP.waistMP - 0)
        
        if MeleePerpCost == 1 then
            -- #Accuracy
            sets.Accuracy[1] = set_combine(sets.Accuracy[0], {waist="Avatar Belt"})
            sets.Accuracy[1].MP = sets.Accuracy[0].MP - (sets.MaxMP.waistMP - 0)
            sets.Accuracy[2] = set_combine(sets.Accuracy[1], {body="Scp. Harness +1"})
            sets.Accuracy[2].MP = sets.Accuracy[1].MP - (sets.MaxMP.bodyMP - 0)
            sets.Accuracy[3] = set_combine(sets.Accuracy[2], {legs="Tatsu. Sitagoromo"})
            sets.Accuracy[3].MP = sets.Accuracy[2].MP - (sets.MaxMP.legsMP - 0)
            sets.Accuracy[4] = set_combine(sets.Accuracy[3], {neck="Peacock Charm"})
            sets.Accuracy[4].MP = sets.Accuracy[3].MP - (sets.MaxMP.neckMP - 0)
            sets.Accuracy[5] = set_combine(sets.Accuracy[4], {back="Beak Mantle"})
            sets.Accuracy[5].MP = sets.Accuracy[4].MP - (sets.MaxMP.backMP - 0)
            sets.Accuracy[6] = set_combine(sets.Accuracy[5], {lring="Toreador's Ring", rring="Toreador's Ring"})
            sets.Accuracy[6].MP = sets.Accuracy[5].MP - (sets.MaxMP.lringMP - 0) - (sets.MaxMP.rringMP - 0)
            sets.Accuracy[7] = set_combine(sets.Accuracy[6], {hands="Nashira Gages"})
            sets.Accuracy[7].MP = sets.Accuracy[6].MP - (sets.MaxMP.handsMP - 0)
            sets.Accuracy[8] = set_combine(sets.Accuracy[7], {feet="Goliard Clogs"})
            sets.Accuracy[8].MP = sets.Accuracy[7].MP - (sets.MaxMP.feetMP - 0)
            -- #AccHaste
            sets.AccHaste[2] = set_combine(sets.AccHaste[1], {hands="Nashira Gages"})
            sets.AccHaste[2].MP = sets.AccHaste[1].MP - (sets.MaxMP.handsMP - 0)
            sets.AccHaste[3] = set_combine(sets.AccHaste[2], {feet="Dusk Ledelsens"})
            sets.AccHaste[3].MP = sets.AccHaste[2].MP - (sets.MaxMP.feetMP - 0)
            sets.AccHaste[4] = set_combine(sets.AccHaste[3], {waist="Avatar Belt"})
            sets.AccHaste[4].MP = sets.AccHaste[3].MP - (sets.MaxMP.waistMP - 0)
            sets.AccHaste[5] = set_combine(sets.AccHaste[4], {neck="Peacock Charm"})
            sets.AccHaste[5].MP = sets.AccHaste[4].MP - (sets.MaxMP.neckMP - 0)
            sets.AccHaste[6] = set_combine(sets.AccHaste[5], {back="Beak Mantle"})
            sets.AccHaste[6].MP = sets.AccHaste[5].MP - (sets.MaxMP.backMP - 0)
            sets.AccHaste[7] = set_combine(sets.AccHaste[6], {lring="Lava's Ring", rring="Kusha's Ring"})
            sets.AccHaste[7].MP = sets.AccHaste[6].MP - (sets.MaxMP.lringMP - 0) - (sets.MaxMP.rringMP - 0)
            -- #PDTHaste
            sets.PDTHaste[2] = set_combine(sets.PDTHaste[1], {hands="Nashira Gages"})
            sets.PDTHaste[2].MP = sets.PDTHaste[1].MP - (sets.MaxMP.handsMP - 0)
            sets.PDTHaste[3] = set_combine(sets.PDTHaste[2], {feet="Dusk Ledelsens"})
            sets.PDTHaste[3].MP = sets.PDTHaste[2].MP - (sets.MaxMP.feetMP - 0)
            sets.PDTHaste[4] = set_combine(sets.PDTHaste[3], {waist="Avatar Belt"})
            sets.PDTHaste[4].MP = sets.PDTHaste[3].MP - (sets.MaxMP.waistMP - 0)
            sets.PDTHaste[5] = set_combine(sets.PDTHaste[4], {neck="Peacock Charm"})
            sets.PDTHaste[5].MP = sets.PDTHaste[4].MP - (sets.MaxMP.neckMP - 0)
            sets.PDTHaste[6] = set_combine(sets.PDTHaste[5], {back="Umbra Cape"})
            sets.PDTHaste[6].MP = sets.PDTHaste[5].MP - (sets.MaxMP.backMP - 0)
            sets.PDTHaste[7] = set_combine(sets.PDTHaste[6], {rring="Jelly Ring"})
            sets.PDTHaste[7].MP = sets.PDTHaste[6].MP - (sets.MaxMP.rringMP - 0)
            -- #PDTMelee
            sets.PDTMelee[3] = set_combine(sets.PDTMelee[2], {hands="Nashira Gages"})
            sets.PDTMelee[3].MP = sets.PDTMelee[2].MP - (sets.MaxMP.handsMP - 0)
            sets.PDTMelee[4] = set_combine(sets.PDTMelee[3], {feet="Dst. Leggings +1"})
            sets.PDTMelee[4].MP = sets.PDTMelee[3].MP - (sets.MaxMP.feetMP - 0)
            sets.PDTMelee[5] = set_combine(sets.PDTMelee[4], {body="Dst. Harness +1"})
            sets.PDTMelee[5].MP = sets.PDTMelee[4].MP - (sets.MaxMP.bodyMP - 0)
            sets.PDTMelee[6] = set_combine(sets.PDTMelee[5], {head="Darksteel Cap +1"})
            sets.PDTMelee[6].MP = sets.PDTMelee[5].MP - (sets.MaxMP.headMP - 0)
            sets.PDTMelee[7] = set_combine(sets.PDTMelee[6], {neck="Peacock Charm"})
            sets.PDTMelee[7].MP = sets.PDTMelee[6].MP - (sets.MaxMP.neckMP - 0)
            sets.PDTMelee[8] = set_combine(sets.PDTMelee[7], {waist="Avatar Belt"})
            sets.PDTMelee[8].MP = sets.PDTMelee[7].MP - (sets.MaxMP.waistMP - 0)
            sets.PDTMelee[9] = set_combine(sets.PDTMelee[8], {lring="Toreador's Ring"})
            sets.PDTMelee[9].MP = sets.PDTMelee[8].MP - (sets.MaxMP.lringMP - 0)
        
            configureTPsets()
        end
    else
        -- #Idle
        sets.idle[7] = set_combine(sets.idle[6],{hands="Coral Fng. Gnt. +1"})
        sets.idle[7].MP = sets.idle[6].MP - (sets.MaxMP.handsMP - 0)
        sets.idle[8] = sets.idle[7]
        sets.idle[8].MP = sets.idle[7].MP
        -- #PDTIdle
        sets.PDTidle[7] = set_combine(sets.PDTidle[6],{hands="Coral Fng. Gnt. +1"})
        sets.PDTidle[7].MP = sets.PDTidle[6].MP - (sets.MaxMP.handsMP - 0)
        sets.PDTidle[8] = sets.PDTidle[7]
        sets.PDTidle[8].MP = sets.PDTidle[7].MP
        -- #MDTIdle
        sets.MDTidle[7] = set_combine(sets.MDTidle[6],{hands="Coral Fng. Gnt. +1"})
        sets.MDTidle[7].MP = sets.MDTidle[6].MP - (sets.MaxMP.handsMP - 0)
        sets.MDTidle[8] = set_combine(sets.MDTidle[7],{legs="Coral Cuisses +1"})
        sets.MDTidle[8].MP = sets.MDTidle[7].MP - (sets.MaxMP.legsMP - 0)
        sets.MDTidle[9] = sets.MDTidle[8]
        sets.MDTidle[9].MP = sets.MDTidle[8].MP
        
        if MeleePerpCost == 1 then
            -- #Accuracy
            sets.Accuracy[1] = set_combine(sets.Accuracy[0], {waist="Virtuoso Belt"})
            sets.Accuracy[1].MP = sets.Accuracy[0].MP - (sets.MaxMP.waistMP - 0)
            sets.Accuracy[2] = set_combine(sets.Accuracy[1], {body="Scp. Harness +1"})
            sets.Accuracy[2].MP = sets.Accuracy[1].MP - (sets.MaxMP.bodyMP - 0)
            sets.Accuracy[3] = set_combine(sets.Accuracy[2], {legs="Tatsu. Sitagoromo"})
            sets.Accuracy[3].MP = sets.Accuracy[2].MP - (sets.MaxMP.legsMP - 0)
            sets.Accuracy[4] = set_combine(sets.Accuracy[3], {neck="Peacock Charm"})
            sets.Accuracy[4].MP = sets.Accuracy[3].MP - (sets.MaxMP.neckMP - 0)
            sets.Accuracy[5] = set_combine(sets.Accuracy[4], {back="Beak Mantle"})
            sets.Accuracy[5].MP = sets.Accuracy[4].MP - (sets.MaxMP.backMP - 0)
            sets.Accuracy[6] = set_combine(sets.Accuracy[5], {lring="Toreador's Ring", rring="Toreador's Ring"})
            sets.Accuracy[6].MP = sets.Accuracy[5].MP - (sets.MaxMP.lringMP - 0) - (sets.MaxMP.rringMP - 0)
            sets.Accuracy[7] = set_combine(sets.Accuracy[6], {hands="Goliard Cuffs"})
            sets.Accuracy[7].MP = sets.Accuracy[6].MP - (sets.MaxMP.handsMP - 0)
            sets.Accuracy[8] = set_combine(sets.Accuracy[7], {feet="Goliard Clogs"})
            sets.Accuracy[8].MP = sets.Accuracy[7].MP - (sets.MaxMP.feetMP - 0)
            -- #AccHaste
            sets.AccHaste[2] = set_combine(sets.AccHaste[1], {hands="Dusk Gloves"})
            sets.AccHaste[2].MP = sets.AccHaste[1].MP - (sets.MaxMP.handsMP - 0)
            sets.AccHaste[3] = set_combine(sets.AccHaste[2], {feet="Dusk Ledelsens"})
            sets.AccHaste[3].MP = sets.AccHaste[2].MP - (sets.MaxMP.feetMP - 0)
            sets.AccHaste[4] = set_combine(sets.AccHaste[3], {waist="Speed Belt"})
            sets.AccHaste[4].MP = sets.AccHaste[3].MP - (sets.MaxMP.waistMP - 0)
            sets.AccHaste[5] = set_combine(sets.AccHaste[4], {neck="Peacock Charm"})
            sets.AccHaste[5].MP = sets.AccHaste[4].MP - (sets.MaxMP.neckMP - 0)
            sets.AccHaste[6] = set_combine(sets.AccHaste[5], {back="Beak Mantle"})
            sets.AccHaste[6].MP = sets.AccHaste[5].MP - (sets.MaxMP.backMP - 0)
            sets.AccHaste[7] = set_combine(sets.AccHaste[6], {lring="Lava's Ring", rring="Kusha's Ring"})
            sets.AccHaste[7].MP = sets.AccHaste[6].MP - (sets.MaxMP.lringMP - 0) - (sets.MaxMP.rringMP - 0)
            -- #PDTHaste
            sets.PDTHaste[2] = set_combine(sets.PDTHaste[1], {hands="Dusk Gloves"})
            sets.PDTHaste[2].MP = sets.PDTHaste[1].MP - (sets.MaxMP.handsMP - 0)
            sets.PDTHaste[3] = set_combine(sets.PDTHaste[2], {feet="Dusk Ledelsens"})
            sets.PDTHaste[3].MP = sets.PDTHaste[2].MP - (sets.MaxMP.feetMP - 0)
            sets.PDTHaste[4] = set_combine(sets.PDTHaste[3], {waist="Speed Belt"})
            sets.PDTHaste[4].MP = sets.PDTHaste[3].MP - (sets.MaxMP.waistMP - 0)
            sets.PDTHaste[5] = set_combine(sets.PDTHaste[4], {neck="Peacock Charm"})
            sets.PDTHaste[5].MP = sets.PDTHaste[4].MP - (sets.MaxMP.neckMP - 0)
            sets.PDTHaste[6] = set_combine(sets.PDTHaste[5], {back="Umbra Cape"})
            sets.PDTHaste[6].MP = sets.PDTHaste[5].MP - (sets.MaxMP.backMP - 0)
            sets.PDTHaste[7] = set_combine(sets.PDTHaste[6], {rring="Jelly Ring"})
            sets.PDTHaste[7].MP = sets.PDTHaste[6].MP - (sets.MaxMP.rringMP - 0)
            -- #PDTMelee
            sets.PDTMelee[3] = set_combine(sets.PDTMelee[2], {hands="Dst. Mittens +1"})
            sets.PDTMelee[3].MP = sets.PDTMelee[2].MP - (sets.MaxMP.handsMP - 0)
            sets.PDTMelee[4] = set_combine(sets.PDTMelee[3], {feet="Dst. Leggings +1"})
            sets.PDTMelee[4].MP = sets.PDTMelee[3].MP - (sets.MaxMP.feetMP - 0)
            sets.PDTMelee[5] = set_combine(sets.PDTMelee[4], {body="Dst. Harness +1"})
            sets.PDTMelee[5].MP = sets.PDTMelee[4].MP - (sets.MaxMP.bodyMP - 0)
            sets.PDTMelee[6] = set_combine(sets.PDTMelee[5], {head="Darksteel Cap +1"})
            sets.PDTMelee[6].MP = sets.PDTMelee[5].MP - (sets.MaxMP.headMP - 0)
            sets.PDTMelee[7] = set_combine(sets.PDTMelee[6], {neck="Peacock Charm"})
            sets.PDTMelee[7].MP = sets.PDTMelee[6].MP - (sets.MaxMP.neckMP - 0)
            sets.PDTMelee[8] = set_combine(sets.PDTMelee[7], {waist="Virtuoso Belt"})
            sets.PDTMelee[8].MP = sets.PDTMelee[7].MP - (sets.MaxMP.waistMP - 0)
            sets.PDTMelee[9] = set_combine(sets.PDTMelee[8], {lring="Toreador's Ring"})
            sets.PDTMelee[9].MP = sets.PDTMelee[8].MP - (sets.MaxMP.lringMP - 0)
        
            configureTPsets()
        end
    end
    
end


function configureTPsets()
    -- #Accuracy #AccHaste #PDTHaste #PDTMelee
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
        sets.Accuracy[10]= set_combine(sets.Accuracy[9], {ear2="Pixie Earring"})
        sets.Accuracy[11]= set_combine(sets.Accuracy[10],{ammo="Astrolabe"})
        sets.AccHaste[8] = set_combine(sets.AccHaste[7], {ear1="Suppanomimi"})
        sets.AccHaste[9] = set_combine(sets.AccHaste[8], {ear2="Pixie Earring"})
        sets.AccHaste[10]= set_combine(sets.AccHaste[9], {ammo="Astrolabe"})
        sets.PDTHaste[8] = set_combine(sets.PDTHaste[7], {ear1="Suppanomimi"})
        sets.PDTHaste[9] = set_combine(sets.PDTHaste[8], {ear2="Pixie Earring"})
        sets.PDTHaste[10]= set_combine(sets.PDTHaste[9], {ammo="Astrolabe"})
        sets.PDTMelee[11]= set_combine(sets.PDTMelee[10],{ear1="Suppanomimi"})
        sets.PDTMelee[12]= set_combine(sets.PDTMelee[11],{ear2="Pixie Earring"})
        
    elseif Weapon == 'JoyGenbu' or Weapon == "EnhanceJoy" or Weapon == 'Enmity' then
    
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
        
    elseif Weapon == 'Dagger' or Weapon == 'CeremonialGenbu' or Weapon == 'MP' then
    
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
    
        sets.Accuracy[9] = set_combine(sets.Accuracy[8], {ear1="Pixie Earring"})
        sets.Accuracy[10]= set_combine(sets.Accuracy[9], {ear2="Optical Earring"})
        sets.Accuracy[11]= set_combine(sets.Accuracy[10],{ammo="Astrolabe"})
        sets.AccHaste[8] = set_combine(sets.AccHaste[7], {ear1="Pixie Earring"})
        sets.AccHaste[9] = set_combine(sets.AccHaste[8], {ear2="Optical Earring"})
        sets.AccHaste[10]= set_combine(sets.AccHaste[9], {ammo="Astrolabe"})
        sets.PDTHaste[8] = set_combine(sets.PDTHaste[7], {ear1="Pixie Earring"})
        sets.PDTHaste[9] = set_combine(sets.PDTHaste[8], {ear2="Optical Earring"})
        sets.PDTHaste[10]= set_combine(sets.PDTHaste[9], {ammo="Astrolabe"})
        sets.PDTMelee[11]= set_combine(sets.PDTMelee[10],{ear1="Pixie Earring"})
        sets.PDTMelee[12]= set_combine(sets.PDTMelee[11],{ear2="Optical Earring"})
        
    end
    -- #AccHaste
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
    
    -- if you have different sets of gear to maximize your converts for different subjobs, configure that here. Otherwise, make these the same or comment out the unused.
    if Subjob == 'BLM' or
       Subjob == 'BLU' or
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

function precast(spell)

    PreviousSetName = ""
    IdleSetName = ""
    
    if CastingSpell == 0 and sets.ws[spell.english] then -- #WeaponSkill
    
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
        
    elseif CastingSpell == 0 and
          (spell.english == 'Quickstep' or 
           spell.english == 'Box Step' or 
           spell.english == 'Desperate Flourish') then -- #Accuracy

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
        
    elseif CastingSpell == 0 and
          (string.find(spell.english,'Curing Waltz') or 
           string.find(spell.english,'Divine Waltz')) then
           
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
            
        else-- EnmityMode == "On" #Enmity
            
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
    elseif CastingSpell == 0 and spell.action_type == 'Ranged Attack' then -- #Raccuracy

        if     ForceSwapThreshold == 100 or player.mp <= BaseMP + sets.Raccuracy[11].MP + SubJobMP - Weakened then equip(sets.Raccuracy[11])
        elseif                              player.mp <= BaseMP + sets.Raccuracy[10].MP + SubJobMP - Weakened then equip(sets.Raccuracy[10])
        elseif                              player.mp <= BaseMP + sets.Raccuracy[9].MP  + SubJobMP - Weakened then equip(sets.Raccuracy[9])
        elseif ForceSwapThreshold == 75  or player.mp <= BaseMP + sets.Raccuracy[8].MP  + SubJobMP - Weakened then equip(sets.Raccuracy[8])
        elseif                              player.mp <= BaseMP + sets.Raccuracy[7].MP  + SubJobMP - Weakened then equip(sets.Raccuracy[7])
        elseif                              player.mp <= BaseMP + sets.Raccuracy[6].MP  + SubJobMP - Weakened then equip(sets.Raccuracy[6])
        elseif ForceSwapThreshold == 50  or player.mp <= BaseMP + sets.Raccuracy[5].MP  + SubJobMP - Weakened then equip(sets.Raccuracy[5])
        elseif                              player.mp <= BaseMP + sets.Raccuracy[4].MP  + SubJobMP - Weakened then equip(sets.Raccuracy[4])
        elseif                              player.mp <= BaseMP + sets.Raccuracy[3].MP  + SubJobMP - Weakened then equip(sets.Raccuracy[3])
        elseif ForceSwapThreshold == 25  or player.mp <= BaseMP + sets.Raccuracy[2].MP  + SubJobMP - Weakened then equip(sets.Raccuracy[2])
        elseif                              player.mp <= BaseMP + sets.Raccuracy[1].MP  + SubJobMP - Weakened then equip(sets.Raccuracy[1])
        elseif                              player.mp <= BaseMP + sets.Raccuracy[0].MP  + SubJobMP - Weakened then equip(sets.Raccuracy[0]) end
        
    elseif CastingSpell == 0 and spell.english == "Sublimation" then
    
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
            
        elseif spell.skill == "Ninjutsu" then
        
            if string.find(spell.english,'Utsusemi') then
            
                if Utsusemi_Check() == true then -- #Haste
            
                    if     player.mp <= BaseMP + sets.MaxMP.MP + sets.Weapons.Earth.MP + SubJobMP - Weakened and MeleeMode == "Off" then equip(sets.Weapons.Earth)
                    elseif                                                                                       MeleeMode == "Off" then equip(sets.Weapons.MP) end
                
                    if     player.mp <= BaseMP + sets.midcast.Haste[6].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[6])
                    elseif player.mp <= BaseMP + sets.midcast.Haste[5].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[5])
                    elseif player.mp <= BaseMP + sets.midcast.Haste[4].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[4])
                    elseif player.mp <= BaseMP + sets.midcast.Haste[3].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[3])
                    elseif player.mp <= BaseMP + sets.midcast.Haste[2].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[2])
                    elseif player.mp <= BaseMP + sets.midcast.Haste[1].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[1])
                    elseif player.mp <= BaseMP + sets.midcast.Haste[0].MP + SubJobMP - Weakened then equip(sets.midcast.Haste[0]) end
                    
                else -- #EvaHaste
        
                    if     ForceSwapThreshold == 100 or player.mp <= BaseMP + sets.EvaHaste[12].MP + SubJobMP - Weakened then equip(sets.EvaHaste[12])
                    elseif                              player.mp <= BaseMP + sets.EvaHaste[11].MP + SubJobMP - Weakened then equip(sets.EvaHaste[11])
                    elseif                              player.mp <= BaseMP + sets.EvaHaste[10].MP + SubJobMP - Weakened then equip(sets.EvaHaste[10])
                    elseif ForceSwapThreshold ==  75 or player.mp <= BaseMP + sets.EvaHaste[9].MP  + SubJobMP - Weakened then equip(sets.EvaHaste[9])
                    elseif                              player.mp <= BaseMP + sets.EvaHaste[8].MP  + SubJobMP - Weakened then equip(sets.EvaHaste[8])
                    elseif                              player.mp <= BaseMP + sets.EvaHaste[7].MP  + SubJobMP - Weakened then equip(sets.EvaHaste[7])
                    elseif ForceSwapThreshold ==  50 or player.mp <= BaseMP + sets.EvaHaste[6].MP  + SubJobMP - Weakened then equip(sets.EvaHaste[6])
                    elseif                              player.mp <= BaseMP + sets.EvaHaste[5].MP  + SubJobMP - Weakened then equip(sets.EvaHaste[5])
                    elseif                              player.mp <= BaseMP + sets.EvaHaste[4].MP  + SubJobMP - Weakened then equip(sets.EvaHaste[4])
                    elseif ForceSwapThreshold ==  25 or player.mp <= BaseMP + sets.EvaHaste[3].MP  + SubJobMP - Weakened then equip(sets.EvaHaste[3])
                    elseif                              player.mp <= BaseMP + sets.EvaHaste[2].MP  + SubJobMP - Weakened then equip(sets.EvaHaste[2])
                    elseif                              player.mp <= BaseMP + sets.EvaHaste[1].MP  + SubJobMP - Weakened then equip(sets.EvaHaste[1])
                    elseif                              player.mp <= BaseMP + sets.EvaHaste[0].MP  + SubJobMP - Weakened then equip(sets.EvaHaste[0])
                    else                                                                                                      equip(sets.MaxMP)      end
                
                end
                
            elseif string.find(spell.english,'Tonko') or
                   string.find(spell.english,'Monomi') then -- #MGS
            
                if     player.mp <= BaseMP + sets.midcast.MGS[3].MP + SubJobMP - Weakened then equip(sets.midcast.MGS[3])
                elseif player.mp <= BaseMP + sets.midcast.MGS[2].MP + SubJobMP - Weakened then equip(sets.midcast.MGS[2])
                elseif player.mp <= BaseMP + sets.midcast.MGS[1].MP + SubJobMP - Weakened then equip(sets.midcast.MGS[1])
                elseif player.mp <= BaseMP + sets.midcast.MGS[0].MP + SubJobMP - Weakened then equip(sets.midcast.MGS[0]) end
                
            end
        end
    end
end


function aftercast(spell)

    CastingSpell = 0
    undulate.counter = 0
    
    -- Idle Sets cleared in Precast

    if spell.english ~= 'Convert' then
    
        equip(sets.MaxMP)
        send_command('wait .2;gs c Determine_Idle_Set')
        
    end
    
end


function determine_idle_set()

    sets.IdleSet = {}
    PreviousSetName = IdleSetName
    IdleSetName = ""
    undulate.counter = 0

    -- Guestimate amount of refresh in 12 seconds
    local Buffer = 4 * guesstimate_Refresh()

    if MDTLevel == 1 then -- #MDTPanic
        
        if PanicLevel == 1 then
        
            sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[9])
            IdleSetName = "MDT9"
        
        else
        
            if     player.mp + Buffer <= BaseMP + sets.MDT[8].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[8]);IdleSetName = "MDT8"
            elseif player.mp + Buffer <= BaseMP + sets.MDT[7].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[7]);IdleSetName = "MDT7"
            elseif player.mp + Buffer <= BaseMP + sets.MDT[6].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[6]);IdleSetName = "MDT6"
            elseif player.mp + Buffer <= BaseMP + sets.MDT[5].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[5]);IdleSetName = "MDT5"
            elseif player.mp + Buffer <= BaseMP + sets.MDT[4].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[4]);IdleSetName = "MDT4"
            elseif player.mp + Buffer <= BaseMP + sets.MDT[3].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[3]);IdleSetName = "MDT3"
            elseif player.mp + Buffer <= BaseMP + sets.MDT[2].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[2]);IdleSetName = "MDT2"
            elseif player.mp + Buffer <= BaseMP + sets.MDT[1].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[1]);IdleSetName = "MDT1"
            elseif player.mp + Buffer <= BaseMP + sets.MDT[0].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MDT[0]);IdleSetName = "MDT0"
            elseif player.mp          <= BaseMP + sets.MaxMP.MP   + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP); IdleSetName = "MaxMP" end
        
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
        
            if     player.mp + Buffer <= BaseMP + sets.PDT[5].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDT[5]);IdleSetName = "PDT5"
            elseif player.mp + Buffer <= BaseMP + sets.PDT[4].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDT[4]);IdleSetName = "PDT4"
            elseif player.mp + Buffer <= BaseMP + sets.PDT[3].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDT[3]);IdleSetName = "PDT3"
            elseif player.mp + Buffer <= BaseMP + sets.PDT[2].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDT[2]);IdleSetName = "PDT2"
            elseif player.mp + Buffer <= BaseMP + sets.PDT[1].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDT[1]);IdleSetName = "PDT1"
            elseif player.mp + Buffer <= BaseMP + sets.PDT[0].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDT[0]);IdleSetName = "PDT0"
            elseif player.mp          <= BaseMP + sets.MaxMP.MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP); IdleSetName = "MaxMP" end
        
            if moving == true then sets.IdleSet = set_combine(sets.IdleSet, sets.FastPants);IdleSetName = IdleSetName .. "|Moving" end
            
        end
        
        if     player.mp + Buffer <= BaseMP + sets.MaxMP.MP + sets.Weapons.Earth.MP + SubJobMP - Weakened and MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons.Earth);IdleSetName = IdleSetName .. "|SetWeapon"
        elseif                                                                                                MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons.MP);   IdleSetName = IdleSetName .. "|MPWeapon" end
    
    elseif player.status == 'Engaged' and CastingSpell == 0 then
        
        if     MeleeGear == 'Accuracy' then -- #Accuracy
        
            if     ForceSwapThreshold == 100 or player.mp + Buffer <= BaseMP + sets.Accuracy[11].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[11]);IdleSetName = "Accuracy11"
            elseif                              player.mp + Buffer <= BaseMP + sets.Accuracy[10].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[10]);IdleSetName = "Accuracy10"
            elseif                              player.mp + Buffer <= BaseMP + sets.Accuracy[9].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[9]); IdleSetName = "Accuracy9"
            elseif ForceSwapThreshold ==  75 or player.mp + Buffer <= BaseMP + sets.Accuracy[8].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[8]); IdleSetName = "Accuracy8"
            elseif                              player.mp + Buffer <= BaseMP + sets.Accuracy[7].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[7]); IdleSetName = "Accuracy7"
            elseif                              player.mp + Buffer <= BaseMP + sets.Accuracy[6].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[6]); IdleSetName = "Accuracy6"
            elseif ForceSwapThreshold ==  50 or player.mp + Buffer <= BaseMP + sets.Accuracy[5].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[5]); IdleSetName = "Accuracy5"
            elseif                              player.mp + Buffer <= BaseMP + sets.Accuracy[4].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[4]); IdleSetName = "Accuracy4"
            elseif                              player.mp + Buffer <= BaseMP + sets.Accuracy[3].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[3]); IdleSetName = "Accuracy3"
            elseif ForceSwapThreshold ==  25 or player.mp + Buffer <= BaseMP + sets.Accuracy[2].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[2]); IdleSetName = "Accuracy2"
            elseif                              player.mp + Buffer <= BaseMP + sets.Accuracy[1].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[1]); IdleSetName = "Accuracy1"
            elseif                              player.mp + Buffer <= BaseMP + sets.Accuracy[0].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.Accuracy[0]); IdleSetName = "Accuracy0"
            else                                                                                                               sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);       IdleSetName = "MaxMP" end
    
        elseif MeleeGear == 'AccuracyHaste' then -- #AccHaste
        
            if         AccHasteTuning ==   2 and player.mp + Buffer <= BaseMP + sets.AccHaste[12].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[12]);IdleSetName = "AccHaste12"
            elseif     AccHasteTuning ==   1 and player.mp + Buffer <= BaseMP + sets.AccHaste[11].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[11]);IdleSetName = "AccHaste11"
            elseif ForceSwapThreshold == 100 or  player.mp + Buffer <= BaseMP + sets.AccHaste[10].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[10]);IdleSetName = "AccHaste10"
            elseif                               player.mp + Buffer <= BaseMP + sets.AccHaste[9].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[9]); IdleSetName = "AccHaste9"
            elseif ForceSwapThreshold ==  75 or  player.mp + Buffer <= BaseMP + sets.AccHaste[8].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[8]); IdleSetName = "AccHaste8"
            elseif                               player.mp + Buffer <= BaseMP + sets.AccHaste[7].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[7]); IdleSetName = "AccHaste7"
            elseif                               player.mp + Buffer <= BaseMP + sets.AccHaste[6].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[6]); IdleSetName = "AccHaste6"
            elseif ForceSwapThreshold ==  50 or  player.mp + Buffer <= BaseMP + sets.AccHaste[5].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[5]); IdleSetName = "AccHaste5"
            elseif                               player.mp + Buffer <= BaseMP + sets.AccHaste[4].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[4]); IdleSetName = "AccHaste4"
            elseif                               player.mp + Buffer <= BaseMP + sets.AccHaste[3].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[3]); IdleSetName = "AccHaste3"
            elseif ForceSwapThreshold ==  25 or  player.mp + Buffer <= BaseMP + sets.AccHaste[2].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[2]); IdleSetName = "AccHaste2"
            elseif                               player.mp + Buffer <= BaseMP + sets.AccHaste[1].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[1]); IdleSetName = "AccHaste1"
            elseif                               player.mp + Buffer <= BaseMP + sets.AccHaste[0].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.AccHaste[0]); IdleSetName = "AccHaste0"
            else                                                                                                                sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);       IdleSetName = "MaxMP" end
            
            if AccHasteTuning < 1 then -- #FencerRing
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
        
            if     ForceSwapThreshold == 100 or player.mp + Buffer <= BaseMP + sets.PDTHaste[10].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[10]);IdleSetName = "PDTHaste10"
            elseif                              player.mp + Buffer <= BaseMP + sets.PDTHaste[9].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[9]); IdleSetName = "PDTHaste9"
            elseif ForceSwapThreshold ==  75 or player.mp + Buffer <= BaseMP + sets.PDTHaste[8].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[8]); IdleSetName = "PDTHaste8"
            elseif                              player.mp + Buffer <= BaseMP + sets.PDTHaste[7].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[7]); IdleSetName = "PDTHaste7"
            elseif                              player.mp + Buffer <= BaseMP + sets.PDTHaste[6].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[6]); IdleSetName = "PDTHaste6"
            elseif ForceSwapThreshold ==  50 or player.mp + Buffer <= BaseMP + sets.PDTHaste[5].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[5]); IdleSetName = "PDTHaste5"
            elseif                              player.mp + Buffer <= BaseMP + sets.PDTHaste[4].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[4]); IdleSetName = "PDTHaste4"
            elseif                              player.mp + Buffer <= BaseMP + sets.PDTHaste[3].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[3]); IdleSetName = "PDTHaste3"
            elseif ForceSwapThreshold ==  25 or player.mp + Buffer <= BaseMP + sets.PDTHaste[2].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[2]); IdleSetName = "PDTHaste2"
            elseif                              player.mp + Buffer <= BaseMP + sets.PDTHaste[1].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[1]); IdleSetName = "PDTHaste1"
            elseif                              player.mp + Buffer <= BaseMP + sets.PDTHaste[0].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTHaste[0]); IdleSetName = "PDTHaste0"
            else                                                                                                               sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);       IdleSetName = "MaxMP" end
            
        elseif MeleeGear == 'EvasionHaste' then -- #EvaHaste
        
            if     ForceSwapThreshold == 100 or player.mp + Buffer <= BaseMP + sets.EvaHaste[12].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[12]);IdleSetName = "EvaHaste12"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[11].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[11]);IdleSetName = "EvaHaste11"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[10].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[10]);IdleSetName = "EvaHaste10"
            elseif ForceSwapThreshold ==  75 or player.mp + Buffer <= BaseMP + sets.EvaHaste[9].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[9]); IdleSetName = "EvaHaste9"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[8].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[8]); IdleSetName = "EvaHaste8"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[7].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[7]); IdleSetName = "EvaHaste7"
            elseif ForceSwapThreshold ==  50 or player.mp + Buffer <= BaseMP + sets.EvaHaste[6].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[6]); IdleSetName = "EvaHaste6"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[5].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[5]); IdleSetName = "EvaHaste5"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[4].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[4]); IdleSetName = "EvaHaste4"
            elseif ForceSwapThreshold ==  25 or player.mp + Buffer <= BaseMP + sets.EvaHaste[3].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[3]); IdleSetName = "EvaHaste3"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[2].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[2]); IdleSetName = "EvaHaste2"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[1].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[1]); IdleSetName = "EvaHaste1"
            elseif                              player.mp + Buffer <= BaseMP + sets.EvaHaste[0].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.EvaHaste[0]); IdleSetName = "EvaHaste0"
            else                                                                                                               sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);       IdleSetName = "MaxMP" end
            
        elseif MeleeGear == 'Brick' then -- #PDTMelee
        
            if     ForceSwapThreshold == 100 or EnmityMode == "On" or player.mp + Buffer <= BaseMP + sets.PDTMelee[12].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[12]);IdleSetName = "PDTMelee12"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[11].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[11]);IdleSetName = "PDTMelee11"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[10].MP + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[10]);IdleSetName = "PDTMelee10"
            elseif ForceSwapThreshold ==  75 or                       player.mp + Buffer <= BaseMP + sets.PDTMelee[9].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[9]); IdleSetName = "PDTMelee9"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[8].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[8]); IdleSetName = "PDTMelee8"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[7].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[7]); IdleSetName = "PDTMelee7"
            elseif ForceSwapThreshold ==  50 or                       player.mp + Buffer <= BaseMP + sets.PDTMelee[6].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[6]); IdleSetName = "PDTMelee6"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[5].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[5]); IdleSetName = "PDTMelee5"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[4].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[4]); IdleSetName = "PDTMelee4"
            elseif ForceSwapThreshold ==  25 or                       player.mp + Buffer <= BaseMP + sets.PDTMelee[3].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[3]); IdleSetName = "PDTMelee3"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[2].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[2]); IdleSetName = "PDTMelee2"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[1].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[1]); IdleSetName = "PDTMelee1"
            elseif                                                    player.mp + Buffer <= BaseMP + sets.PDTMelee[0].MP  + SubJobMP - Weakened then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTMelee[0]); IdleSetName = "PDTMelee0"
            else                                                                                                                                     sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);       IdleSetName = "MaxMP" end
            
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
        
        if     player.mp + Buffer + RestingBuffer + sets.HMP[10].MPH <= BaseMP + sets.HMP[10].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[10]);IdleSetName = "HMP10"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[9].MPH  <= BaseMP + sets.HMP[9].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[9]); IdleSetName = "HMP9"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[8].MPH  <= BaseMP + sets.HMP[8].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[8]); IdleSetName = "HMP8"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[7].MPH  <= BaseMP + sets.HMP[7].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[7]); IdleSetName = "HMP7"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[6].MPH  <= BaseMP + sets.HMP[6].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[6]); IdleSetName = "HMP6"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[5].MPH  <= BaseMP + sets.HMP[5].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[5]); IdleSetName = "HMP5"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[4].MPH  <= BaseMP + sets.HMP[4].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[4]); IdleSetName = "HMP4"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[3].MPH  <= BaseMP + sets.HMP[3].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[3]); IdleSetName = "HMP3"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[2].MPH  <= BaseMP + sets.HMP[2].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[2]); IdleSetName = "HMP2"
        elseif player.mp + Buffer + RestingBuffer + sets.HMP[1].MPH  <= BaseMP + sets.HMP[1].MP  + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.HMP[1]); IdleSetName = "HMP1"
        elseif player.mp + Buffer + RestingBuffer                    >= BaseMP + sets.MaxMP.MP   + SubJobMP - Weakened and TaruMode == "On" then sets.IdleSet = set_combine(sets.IdleSet,sets.TaruMP); IdleSetName = "TaruMP"
        else                                                                                                                                     sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);  IdleSetName = "MaxMP" end
        
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
            
            if     player.mp + Buffer <= BaseMP + sets.idle[8].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.idle[8]);IdleSetName = "idle8"
            elseif player.mp + Buffer <= BaseMP + sets.idle[7].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.idle[7]);IdleSetName = "idle7"
            elseif player.mp + Buffer <= BaseMP + sets.idle[6].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.idle[6]);IdleSetName = "idle6"
            elseif player.mp + Buffer <= BaseMP + sets.idle[5].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.idle[5]);IdleSetName = "idle5"
            elseif player.mp + Buffer <= BaseMP + sets.idle[4].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.idle[4]);IdleSetName = "idle4"
            elseif player.mp + Buffer <= BaseMP + sets.idle[3].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.idle[3]);IdleSetName = "idle3"
            elseif player.mp + Buffer <= BaseMP + sets.idle[2].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.idle[2]);IdleSetName = "idle2"
            elseif player.mp + Buffer <= BaseMP + sets.idle[1].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.idle[1]);IdleSetName = "idle1"
            elseif player.mp + Buffer <= BaseMP + sets.idle[0].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.idle[0]);IdleSetName = "idle0"
            elseif player.mp + Buffer >= BaseMP + sets.MaxMP.MP   + SubJobMP - Weakened and TaruMode == "On" then sets.IdleSet = set_combine(sets.IdleSet,sets.TaruMP); IdleSetName = "TaruMP"
            else                                                                                                  sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);  IdleSetName = "MaxMP" end

            if     pet.isvalid and player.sub_job == "SMN" and player.mp + Buffer <= BaseMP + sets.MaxMP.MP + sets.Weapons[pet.element].MP + SubJobMP - Weakened and MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons[pet.element]);IdleSetName = IdleSetName .. "|AvatarWeapon"
            elseif                                             player.mp + Buffer <= BaseMP + sets.MaxMP.MP + sets.Weapons.Earth.MP        + SubJobMP - Weakened and MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons.Earth);       IdleSetName = IdleSetName .. "|SetWeapon"
            elseif                                                                                                                                                   MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons.MP);          IdleSetName = IdleSetName .. "|MPWeapon" end
        
        elseif IdleMode == "PDT" then -- #PDTIdle
        
            if     player.mp + Buffer <= BaseMP + sets.PDTidle[8].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTidle[8]);IdleSetName = "PDTidle8"
            elseif player.mp + Buffer <= BaseMP + sets.PDTidle[7].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTidle[7]);IdleSetName = "PDTidle7"
            elseif player.mp + Buffer <= BaseMP + sets.PDTidle[6].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTidle[6]);IdleSetName = "PDTidle6"
            elseif player.mp + Buffer <= BaseMP + sets.PDTidle[5].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTidle[5]);IdleSetName = "PDTidle5"
            elseif player.mp + Buffer <= BaseMP + sets.PDTidle[4].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTidle[4]);IdleSetName = "PDTidle4"
            elseif player.mp + Buffer <= BaseMP + sets.PDTidle[3].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTidle[3]);IdleSetName = "PDTidle3"
            elseif player.mp + Buffer <= BaseMP + sets.PDTidle[2].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTidle[2]);IdleSetName = "PDTidle2"
            elseif player.mp + Buffer <= BaseMP + sets.PDTidle[1].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTidle[1]);IdleSetName = "PDTidle1"
            elseif player.mp + Buffer <= BaseMP + sets.PDTidle[0].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.PDTidle[0]);IdleSetName = "PDTidle0"
            elseif player.mp + Buffer >= BaseMP + sets.MaxMP.MP      + SubJobMP - Weakened and TaruMode == "On" then sets.IdleSet = set_combine(sets.IdleSet,sets.TaruMP);    IdleSetName = "TaruMP"
            else                                                                                                     sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);     IdleSetName = "MaxMP" end
        
            if     pet.isvalid and player.sub_job == "SMN" and player.mp + Buffer <= BaseMP + sets.MaxMP.MP + sets.Weapons[pet.element].MP + SubJobMP - Weakened and MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons[pet.element]);IdleSetName = IdleSetName .. "|AvatarWeapon"
            elseif                                             player.mp + Buffer <= BaseMP + sets.MaxMP.MP + sets.Weapons.Earth.MP + SubJobMP - Weakened and MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons.Earth);              IdleSetName = IdleSetName .. "|SetWeapon"
            elseif                                                                                                                                            MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons.MP);                 IdleSetName = IdleSetName .. "|MPWeapon" end
        
        else-- IdleMode == "MDT" #MDTIdle
        
            if     player.mp + Buffer <= BaseMP + sets.MDTidle[9].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[9]);IdleSetName = "MDTidle9"
            elseif player.mp + Buffer <= BaseMP + sets.MDTidle[8].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[8]);IdleSetName = "MDTidle8"
            elseif player.mp + Buffer <= BaseMP + sets.MDTidle[7].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[7]);IdleSetName = "MDTidle7"
            elseif player.mp + Buffer <= BaseMP + sets.MDTidle[6].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[6]);IdleSetName = "MDTidle6"
            elseif player.mp + Buffer <= BaseMP + sets.MDTidle[5].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[5]);IdleSetName = "MDTidle5"
            elseif player.mp + Buffer <= BaseMP + sets.MDTidle[4].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[4]);IdleSetName = "MDTidle4"
            elseif player.mp + Buffer <= BaseMP + sets.MDTidle[3].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[3]);IdleSetName = "MDTidle3"
            elseif player.mp + Buffer <= BaseMP + sets.MDTidle[2].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[2]);IdleSetName = "MDTidle2"
            elseif player.mp + Buffer <= BaseMP + sets.MDTidle[1].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[1]);IdleSetName = "MDTidle1"
            elseif player.mp + Buffer <= BaseMP + sets.MDTidle[0].MP + SubJobMP - Weakened                      then sets.IdleSet = set_combine(sets.IdleSet,sets.MDTidle[0]);IdleSetName = "MDTidle0"
            elseif player.mp + Buffer >= BaseMP + sets.MaxMP.MP      + SubJobMP - Weakened and TaruMode == "On" then sets.IdleSet = set_combine(sets.IdleSet,sets.TaruMP);    IdleSetName = "TaruMP"
            else                                                                                                     sets.IdleSet = set_combine(sets.IdleSet,sets.MaxMP);     IdleSetName = "MaxMP" end
        
            if     pet.isvalid and player.sub_job == "SMN" and player.mp + Buffer <= BaseMP + sets.MaxMP.MP + sets.Weapons[pet.element].MP + SubJobMP - Weakened and MeleeMode == "Off" then sets.IdleSet = set_combine(sets.IdleSet,sets.Weapons[pet.element]);IdleSetName = IdleSetName .. "|AvatarWeapon"
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
    
    if IdleSetName ~= "" and PreviousSetName ~= IdleSetName then equip(sets.IdleSet) end
    
    if PanicLevel == 1 then send_command('gs disable all') end
    
end


function self_command(command)

    if     command == 'Determine_Idle_Set' then
    
        determine_idle_set()
        
    elseif command == 'Reset' then
        
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
        
    elseif command == 'SetWeapon' then
        
        if MeleeMode == "On" then equip(sets.Weapons[Weapon]) end
    
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
    
        if MeleeMode == 'Off' then equip(sets.Weapons.MP) end
        
        if TaruMode == 'Off' then equip(sets.MaxMP)
        else                      equip(sets.TaruMP) end
    
        if LockMP == 1 then send_command('gs disable all') end
        
        LockMP = 1
        
    elseif command == 'MPDown' then -- Makes an attempt to discern mp reduction. player.max_mp is poorly updated though, so it's often wrong
        
        if     TaruMode == 'Off' and player.max_mp < BaseMP + SubJobMP + sets.MaxMP.MP  + sets.Weapons[Weapon].MP then
        
            Weakened = BaseMP + sets.MaxMP.MP + sets.Weapons[Weapon].MP - player.max_mp
        
        elseif TaruMode == 'On'  and player.max_mp < BaseMP + SubJobMP + sets.TaruMP.MP + sets.Weapons[Weapon].MP then
        
            Weakened = BaseMP + sets.TaruMP.MP + sets.Weapons[Weapon].MP - player.max_mp
        
        end
        
    elseif command == 'RetryMPDown' then
        
        if CastingSpell == 0 then
            undulate.counter = 0
            send_command('gs c MPLock;wait .001;gs c MPLock;wait 2;gs c MPDown;wait 2;gs c Reset')
        else
            send_command('wait 1;gs c RetryMPDown')
        end
        
    elseif command == 'TaruModeOn' then
    
        if MeleeMode == "Off" then equip(sets.Weapons.MP) end
        equip(sets.TaruMP)
        
        TaruMode = "On"
        
    elseif command == 'TaruModeOff' then
    
        TaruMode = "Off"
        
    elseif command == 'Convert' then
    
        if MeleeMode == "Off" then equip(sets.Weapons.MP) end
        equip(sets.Convert)
        send_command('gs disable all;wait 15;gs enable all;') 
        
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
            send_command('Text Gearset    color 230 50 0')
            send_command('Text Enmity     color 230 50 0')
            send_command('Text Enfeebling color 230 50 0')
            send_command('Text Elemental  color 230 50 0')
        else
            SetMagicModes()
            ElementalMode = EmergencyTankMemory.MemberElementalMode
            EnfeebleMode = EmergencyTankMemory.MemberEnfeebleMode
            MeleeGear = EmergencyTankMemory.MemberMeleeGear
            EnmityMode = EmergencyTankMemory.MemberEnmityMode
            EmergencyTank = "Off"
            send_command('Text Status text')
            send_command('Text Gearset    color 200 200 200')
            send_command('Text Enmity     color 200 200 200')
            send_command('Text Enfeebling color 200 200 200')
            send_command('Text Elemental  color 200 200 200')
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
            
        if     Menu == 'Weapons' then -- #WeaponSets
            
            if Weapon == 'MP' then
                MeleeMode = "On"
                Weapon = "JoyKraken"
                FencerSwapTPThreshold = 800
                equip(sets.Weapons.MP) -- Palette cleanser required to cleanly swap weapons
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'JoyKraken' then
                MeleeMode = "On"
                Weapon = "JoyJustice"
                FencerSwapTPThreshold = 850
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'JoyJustice' then
                MeleeMode = "On"
                Weapon = "JoyGenbu"
                FencerSwapTPThreshold = 945
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'JoyGenbu' then
                MeleeMode = "On"
                Weapon = "JusticeJoy"
                FencerSwapTPThreshold = 850
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'JusticeJoy' then
                MeleeMode = "On"
                Weapon = "Dagger"
                FencerSwapTPThreshold = 950
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'Dagger' then
                MeleeMode = "On"
                Weapon = "CeremonialGenbu"
                FencerSwapTPThreshold = 950
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'CeremonialGenbu' then
                MeleeMode = "On"
                Weapon = "Club"
                FencerSwapTPThreshold = 950
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'Club' then
                MeleeMode = "On"
                Weapon = "Enmity"
                FencerSwapTPThreshold = 945
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'Enmity' then
                MeleeMode = "On"
                Weapon = "EnhanceJoy"
                FencerSwapTPThreshold = 900
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'EnhanceJoy' then
                MeleeMode = "On"
                Weapon = "EnhanceKraken"
                FencerSwapTPThreshold = 800
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'EnhanceKraken' then
                MeleeMode = "Off"
                Weapon = "MP"
                FencerSwapTPThreshold = 910
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
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
        
            if AccHasteTuning < 2 then AccHasteTuning = AccHasteTuning + 1 end
        
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
            
        if     Menu == 'Weapons' then -- #WeaponSets
            
            if Weapon == 'MP' then
                MeleeMode = "On"
                Weapon = "EnhanceKraken"
                FencerSwapTPThreshold = 800
                equip(sets.Weapons.MP) -- Palette cleanser required to cleanly swap weapons
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'JoyKraken' then
                MeleeMode = "Off"
                Weapon = "MP"
                FencerSwapTPThreshold = 910
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'JoyJustice' then
                MeleeMode = "On"
                Weapon = "JoyKraken"
                FencerSwapTPThreshold = 800
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'JoyGenbu' then
                MeleeMode = "On"
                Weapon = "JoyJustice"
                FencerSwapTPThreshold = 850
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'JusticeJoy' then
                MeleeMode = "On"
                Weapon = "JoyGenbu"
                FencerSwapTPThreshold = 945
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'Dagger' then
                MeleeMode = "On"
                Weapon = "JusticeJoy"
                FencerSwapTPThreshold = 850
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'CeremonialGenbu' then
                MeleeMode = "On"
                Weapon = "Dagger"
                FencerSwapTPThreshold = 950
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'Club' then
                MeleeMode = "On"
                Weapon = "CeremonialGenbu"
                FencerSwapTPThreshold = 950
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'Enmity' then
                MeleeMode = "On"
                Weapon = "Club"
                FencerSwapTPThreshold = 950
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'EnhanceJoy' then
                MeleeMode = "On"
                Weapon = "Enmity"
                FencerSwapTPThreshold = 945
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
            elseif Weapon == 'EnhanceKraken' then
                MeleeMode = "On"
                Weapon = "EnhanceJoy"
                FencerSwapTPThreshold = 900
                equip(sets.Weapons.MP)
                send_command('wait 0.001;gs c SetWeapon')
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
        
            if AccHasteTuning > 0 then AccHasteTuning = AccHasteTuning - 1 end
            
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
        
    else
    
        windower.add_to_chat(123,'Dear God, what did you send me?!')
        return
        
    end
    
    if command == 'PrevMenu' or 
       command == 'NextMenu' or 
       command == 'MenuOff' or 
       command == 'MenuOn' or 
       command == '++' or 
       command == '--' or 
       command == 'ToggleUndulations' or 
       command == 'ToggleEmergencyTank' then 
       DrawMenu(0)
    end
    
    if CastingSpell == 0 and (command == 'Reset' or command == 'SetWeapon' or command == 'MDT' or command == 'PDT') then determine_idle_set() end
	
	--if   buffactive['Food'] then send_command('wait .184;Text Status text')
	--else                         send_command('wait .184;Text Status text Food') end
    
    
    if PetExists ~= pet.isvalid then     
    
        PetExists = pet.isvalid
        PreviousSetName = ""
        IdleSetName = ""
        configureIdlesets()
        determine_idle_set()
        
    end

end


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


windower.raw_register_event('prerender',function()

    undulate.counter = undulate.counter + 1
    mov.counter = mov.counter + 1
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
        else
            undulate.counter = 0
        end
    end
    
end)


windower.register_event('zone change',function()

    SetMagicModes()
    DrawMenu(0)

end)


function sub_job_change(new,old)
    set_SubJobVars(new)
    send_command('wait 2;input /lockstyleset 1')
end


function status_change(new,old)
    
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


function buff_change(name,gain,buff_details)

    if name == "weakness" then
    
        if   gain == true then Weakened = (BaseMP + SubJobMP) * .75
        else                   Weakened = 0 end
        
    elseif name == "SJ Restriction" then
    
        if   gain == true then SubJobMP = 0
        else                   set_SubJobVars(player.sub_job) end
        
    elseif name == "Max MP Down" then
    
        if gain == true then
            if CastingSpell == 0 then
                undulate.counter = 0
                send_command('gs c MPLock;wait .001;gs c MPLock;wait 2;gs c MPDown;wait 2;gs c Reset')
            else
                send_command('wait 1;gs c RetryMPDown')
            end
        else
            Weakened = 0
        end
        
    elseif name == "Sublimation: Activated" and gain == true then
    
        SublimationStarted = os.time()
        
    elseif name == "Sublimation: Complete" and gain == false then
    
        send_command('wait .00;Text Sublimation text ""')
    
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
    local RefreshPotency = 2 -- Leave a little extra room for unexpected lag, hiccups, etc.
    
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
    
    if (IdleMode == "Balanced" and player.mp <= sets.idle[0].MP    + SubJobMP - Weakened) or   -- #Idle
       (IdleMode == "PDT"      and player.mp <= sets.PDTidle[0].MP + SubJobMP - Weakened) or   -- #PDTIdle
       (IdleMode == "MDT"      and player.mp <= sets.MDTidle[0].MP + SubJobMP - Weakened) then -- #MDTIdle
    
        RefreshPotency = RefreshPotency + 2
        
    else -- Refresh Body in MaxMP Set
    
        RefreshPotency = RefreshPotency + 1
    
    end
        
    return RefreshPotency
    
end


function weathercheck(spell_element)
    
    local ElementalStrength = 0
    
    if                spell_element  == world.weather_element then ElementalStrength = ElementalStrength + world.weather_intensity
    elseif Weaknesses[spell_element] == world.weather_element then ElementalStrength = ElementalStrength - world.weather_intensity
    end
    
    if                spell_element  == world.day_element then ElementalStrength = ElementalStrength + 1
    elseif Weaknesses[spell_element] == world.day_element then ElementalStrength = ElementalStrength - 1
    end
    
    if ElementalStrength >= 1 and sets.Obis[spell_element]['waist'] ~= sets.Obis['None'] then return spell_element
    else                                                                                      return 'None'
    end
    
end


function DrawMenu(delay)

    if MenuEnabled == 1 then

        if     UndulationsEnabled == 1 then send_command('wait '.. delay .. ';Text Undulation text "  Undulating   "')
        else                                send_command('wait '.. delay .. ';Text Undulation text "Not Undulating "') end
        -- #WeaponSets
        if     Weapon == "MP" then              send_command('wait '.. delay + .001 .. ';Text Weapons text "    Spells     "')
        elseif Weapon == 'JoyKraken' then       send_command('wait '.. delay + .001 .. ';Text Weapons text "Joyeuse Kraken "')
        elseif Weapon == 'JoyJustice' then      send_command('wait '.. delay + .001 .. ';Text Weapons text "Joyeuse Justice"')
        elseif Weapon == "JoyGenbu" then        send_command('wait '.. delay + .001 .. ';Text Weapons text " Joyeuse Genbu "')
        elseif Weapon == 'JusticeJoy' then      send_command('wait '.. delay + .001 .. ';Text Weapons text "Justice Joyeuse"')
        elseif Weapon == 'JusticeGenbu' then    send_command('wait '.. delay + .001 .. ';Text Weapons text " Justice Genbu "')
        elseif Weapon == "Dagger" then          send_command('wait '.. delay + .001 .. ';Text Weapons text " Hornet Genbu  "')
        elseif Weapon == "CeremonialGenbu" then send_command('wait '.. delay + .001 .. ';Text Weapons text "CeremonialGenbu"')
        elseif Weapon == "Club" then            send_command('wait '.. delay + .001 .. ';Text Weapons text " Kraken Genbu  "')
        elseif Weapon == "Enmity" then          send_command('wait '.. delay + .001 .. ';Text Weapons text " Beaver Genbu  "')
        elseif Weapon == 'EnhanceJoy' then      send_command('wait '.. delay + .001 .. ';Text Weapons text "Enhance Joyeuse"')
        elseif Weapon == 'EnhanceKraken' then   send_command('wait '.. delay + .001 .. ';Text Weapons text "Enhance Kraken "') end
        
        if     MeleeGear == "Accuracy" then      send_command('wait '.. delay + .002 .. ';Text Gearset text "Accuracy       "')
        elseif MeleeGear == "AccuracyHaste" then send_command('wait '.. delay + .002 .. ';Text Gearset text "Haste/Accuracy "')
        elseif MeleeGear == "BrickHaste" then    send_command('wait '.. delay + .002 .. ';Text Gearset text "Brick/Haste    "')
        elseif MeleeGear == "EvasionHaste" then  send_command('wait '.. delay + .002 .. ';Text Gearset text "Evasion/Haste  "')
        elseif MeleeGear == "Evasion" then       send_command('wait '.. delay + .002 .. ';Text Gearset text "Evasion        "')
        elseif MeleeGear == "Brick" then         send_command('wait '.. delay + .002 .. ';Text Gearset text "Brick          "') end
        
        if     AccHasteTuning == 0 then send_command('wait '.. delay + .003 .. ';Text Tuning text "++ Haste/Acc --"')
        elseif AccHasteTuning == 1 then send_command('wait '.. delay + .003 .. ';Text Tuning text "++ Haste/Acc +-"')
        elseif AccHasteTuning == 2 then send_command('wait '.. delay + .003 .. ';Text Tuning text "-+ Haste/Acc ++"') end
        
        if   EnmityMode == "Off" then send_command('wait '.. delay + .004 .. ';Text Enmity text "Enmity Off     "')
        else                          send_command('wait '.. delay + .004 .. ';Text Enmity text "Enmity On      "') end
        
        if   EnfeebleMode == 'Potency/Haste' then send_command('wait '.. delay + .005 .. ';Text Enfeebling text "Potency Enfeebs"')
        else                                      send_command('wait '.. delay + .005 .. ';Text Enfeebling text "Macc Enfeebles "') end
        
        if   ElementalMode == 'Potency' then send_command('wait '.. delay + .006 .. ';Text Elemental text "Potency Nukes  "')
        else                                 send_command('wait '.. delay + .006 .. ';Text Elemental text "Macc Nukes     "') end
        
        if     ForceSwapThreshold ==   0 then send_command('wait '.. delay + .007 .. ';Text ForceSwaps text "0% Force Swap  "')
        elseif ForceSwapThreshold == 100 then send_command('wait '.. delay + .007 .. ';Text ForceSwaps text "100% Force Swap"')
        else                                  send_command('wait '.. delay + .007 .. ';Text ForceSwaps text "'..ForceSwapThreshold..'% Force Swap "') end
        
        if     IdleMode == "Balanced" then send_command('wait '.. delay + .008 .. ';Text Idle text "Balanced Idle  "')
        elseif IdleMode == "PDT"      then send_command('wait '.. delay + .008 .. ';Text Idle text "PDT Idle       "')
        elseif IdleMode == "MDT"      then send_command('wait '.. delay + .008 .. ';Text Idle text "MDT Idle       "') end
        
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
  --send_command('wait .021;Keyboard_Unbind !insert')
  --send_command('wait .022;Keyboard_Unbind ^insert')
    send_command('wait .023;Keyboard_Unbind !Pageup')
    send_command('wait .024;Keyboard_Unbind !Pagedown')
    send_command('wait .025;Keyboard_Unbind !Delete')
    send_command('wait .026;Keyboard_Unbind !End')
  --send_command('wait .027;Keyboard_Unbind !numpad-')
  --send_command('wait .028;Keyboard_Unbind !numpad+')
  --send_command('wait .029;Keyboard_Unbind !^1')
  --send_command('wait .030;Keyboard_Unbind !^2')
  --send_command('wait .031;Keyboard_Unbind !^3')
  --send_command('wait .032;Keyboard_Unbind !^9')
  --send_command('wait .033;Keyboard_Unbind @1')
  --send_command('wait .034;Keyboard_Unbind @2')
  --send_command('wait .035;Keyboard_Unbind !x')
  --send_command('wait .036;Keyboard_Unbind !z')
    
end                   