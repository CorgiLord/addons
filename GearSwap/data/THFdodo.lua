-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    Custom commands:
    gs c cycle treasuremode (set on ctrl-= by default): Cycles through the available treasure hunter modes.
    
    Treasure hunter modes:
        None - Will never equip TH gear
        Tag - Will equip TH gear sufficient for initial contact with a mob (either melee, ranged hit, or Aeolian Edge AOE)
        SATA - Will equip TH gear sufficient for initial contact with a mob, and when using SATA
        Fulltime - Will keep TH gear equipped fulltime
--]]

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
	include('organizer-lib')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
    state.Buff['Trick Attack'] = buffactive['trick attack'] or false
    state.Buff['Feint'] = buffactive['feint'] or false
    
    include('Mote-TreasureHunter')

    -- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish
    info.default_ja_ids = S{35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('NoHaste', 'MidHaste', 'CapHaste', 'Acc', 'PDTAcc')
    state.HybridMode:options()
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.PhysicalDefenseMode:options('Evasion', 'PDT')
	state.IdleMode:options('Normal', 'Regen', 'PDT')

    -- Additional local binds
    send_command('bind ^` input /ja "Flee" <me>')
    send_command('bind ^= gs c cycle treasuremode')
    send_command('bind !- gs c cycle targetmode')

    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !-')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------
    sets.TreasureHunter = {
		hands="Plunderer's Armlets +1", 
		feet="Skulk. Poulaines +1",waist="Chaac Belt",}
    sets.ExtraRegen = {neck="Bathy Choker +1",ring1="Sheltered Ring",ring2="Paguroidea ring"}
    sets.Kiting = {feet="Jute Boots +1"}
	
	moonshade_WS = S{"Rudra's Storm", "Evisceration", "Shark Bite", "Mandalic Stab", "Exenterator", "Savage Blade", "Vorpal Blade", "Requiescat", "Sanguine Blade"}

    --sets.buff['Sneak Attack'] = {
	--	ammo="Yetshila +1",
    --    head="Adhemar Bonnet",
	--	neck="Caro Necklace",
	--	ear1="Mache Earring",
	--	ear2="Cessance Earring",
     --   body="Abnoba Kaftan",
	--	hands="Meg. Gloves +1",
	--	ring1="Ramuh Ring +1",
	--	ring2="Ramuh Ring +1",
     --   back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	--	waist="Grunfeld Rope",
	--	legs="Lustratio Subligar +1",
	--	feet="Lustratio Leggings +1"}

    --sets.buff['Trick Attack'] = {
	--	ammo="Yetshila +1",
     --   head="Adhemar Bonnet",
	--	neck="Combatant's Torque",
	--	ear1="Mache Earring",
	--	ear2="Cessance Earring",
    --    body="Abnoba Kaftan",
	--	hands="Meg. Gloves +1",
	--	ring1="Epona's Ring",
	--	ring2="Rajas Ring",
	--	back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
     --   waist="Grunfeld Rope",
	--	legs="Lustratio Subligar +1",
	--	feet="Lustratio Leggings +1"}

    -- Actions we want to use to tag TH.
    sets.precast.Step = sets.TreasureHunter
    sets.precast.Flourish1 = sets.TreasureHunter
    sets.precast.JA.Provoke = sets.TreasureHunter


    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {head="Skulker's Bonnet +1"}
    sets.precast.JA['Accomplice'] = {head="Skulker's Bonnet +1"}
    sets.precast.JA['Flee'] = {feet="Pillager's Poulaines +1"}
    sets.precast.JA['Hide'] = {body="Pillager's Vest +1"}
    sets.precast.JA['Conspirator'] = {body="Skulker's Vest"}
    sets.precast.JA['Steal'] = {ammo="Barathrum",neck="Pentalagus Charm",head="Plunderer's bonnet +1",hands="Pillager's Armlets +1",legs="Pillager's Culottes +1",feet="Pillager's Poulaines +1"}
    sets.precast.JA['Despoil'] = {ammo="Barathrum",legs="Skulker's Culottes",feet="Skulker's Poulaines +1"}
    sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
    sets.precast.JA['Feint'] = {legs="Plunderer's Culottes"}
	sets.precast.JA['Assassin Charge'] = {Feet="Plunderer's Poulaines +1"}
	sets.precast.JA['Mug'] = {ammo="Expeditious Pinion",head="Pursuer's Beret",neck="Magoraga bead necklace",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Pursuer's cuffs",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Toutatis's Cape",waist="Chaac Belt",legs="Pursuer's Pants",feet="Pursuer's Gaiters"}
	sets.precast.JA['Lunge'] = {ammo="Seething Bomblet +1",head=MABhead,neck="Baetyl Pendant",ear1="Hecate's Earring",ear2="Friomisi Earring",
		body="Samnuha Coat",hands=MABhands,ring1="Acumen ring",ring2="Arvina Ringlet +1",
		back="Toro Cape",waist="Eschan Stone",legs=MABlegs,feet=MABfeet} 
	sets.precast.JA['Swipe'] = {sets.precast.JA['Lunge']} 
	
    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']
	
	sets.precast.Item = {HolyWater}
	
	sets.precast.Item['Holy Water'] = {ring1="Purity Ring"}
	sets.buff.Doom = {waist="Gishdubar sash",ring1="Saida Ring",ring2="Saida Ring"}


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
    head="Haruspex Hat +1",
	neck="Loricate Torque +1",
	legs="Dashing Subligar",
	body="Passion Jacket",
	hands="Plunderer's armlets +1",
	waist="Flume Belt",
	back="Mollusca Mantle",
	ring1="Asklepian ring",
	ring2="Defending Ring",
	legs="Plunderer's Culottes +1",
	feet="Rawhide Boots"
}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {feet="Rawhide boots"}


    -- Fast cast sets for spells
    sets.precast.FC ={
	ammo="Sapience Orb",
	head="Haruspex Hat +1",
	neck="Orunmila's Torque",
	body="Taeon Tabard",
	ear1="Enchntr. Earring +1",
	ear2="Loquacious Earring",
	hands="Leyline Gloves",
	ring1="Lebeche Ring",
	ring2="Veneficium Ring",
	legs="Enif Cosciales",
	waist="Dynamic Belt +1",
    back={ name="Toutatis's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}},
}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})
	
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})


    -- Ranged snapshot gear
    --sets.precast.RA = {
			--		   body="Pursuer's Doublet",legs="Pursuer's Pants",feet="Adhemar gamashes"}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS  = {
		head="Adhemar Bonnet +1",
		body="Meghanada Cuirie +1",
		hands="Meg. Gloves +1",
		legs="Lustratio Subligar +1",
		feet="Lustratio Leggings +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear="Mache Earring +1",
		left_ring="Ramuh Ring +1",
		right_ring="Ramuh Ring +1",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Falcon Eye"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Exenterator'] = {ammo="Falcon Eye",
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Infused Earring",ear2="Mache Earring +1",
        body="Meghanada Cuirie +1",hands="Adhemar Wristbands",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist="Fotia Belt",legs="Samnuha Tights",feet=Critfeet}
    sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {ammo="Falcon Eye"})

    sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Dancing Edge'].Acc = set_combine(sets.precast.WS['Dancing Edge'], {ammo="Falcon Eye"})

    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Yetshila +1"})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {ammo="Falcon Eye",back="Toutatis's Cape"})
	
	sets.precast.WS['Mercy Stroke'] = {ammo="Seething Bomblet +1",
        head="Lilitu headpiece",neck="Caro Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Meghanada Cuirie +1",hands=WShands,ring1="Ramuh Ring +1",ring2="Rajas Ring",
        back="Buquwik Cape",waist="Metalsinger Belt",legs="Samnuha Tights",feet="Lustratio Leggings +1"}
    sets.precast.WS['Mercy Stroke'].Mod = set_combine(sets.precast.WS['Mercy Stroke'], {ammo="Yetshila +1",
        body="Pillager's Vest +1"})
    sets.precast.WS['Mercy Stroke'].SA = set_combine(sets.precast.WS['Mercy Stroke'].Mod, {back="Toutatis's Cape"})
    sets.precast.WS['Mercy Stroke'].TA = set_combine(sets.precast.WS['Mercy Stroke'].Mod, {})
    sets.precast.WS['Mercy Stroke'].SATA = set_combine(sets.precast.WS['Mercy Stroke'].Mod, {back="Toutatis's Cape"})

    sets.precast.WS["Rudra's Storm"] = {
		ammo="Expeditious Pinion",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands="Meg. Gloves +1",
    legs="Lustratio Subligar +1",
    feet="Lustratio Leggings +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Mache Earring +1",
    left_ring="Ilabrat Ring",
    right_ring="Ramuh Ring +1",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},}
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"], {body="Meghanada Cuirie +1", ammo="Yetshila +1", neck="Caro Necklace", waist="Grunfeld Rope",})
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"], {body="Meghanada Cuirie +1", ammo="Yetshila +1", neck="Caro Necklace", waist="Grunfeld Rope",})
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"], {body="Meghanada Cuirie +1", ammo="Yetshila +1", neck="Caro Necklace", waist="Grunfeld Rope",})

    sets.precast.WS['Shark Bite'] = {
		ammo="Expeditious Pinion",
        head="Lilitu headpiece",
		neck="Caro Necklace",
		ear1="Dominance Earring",
		ear2="Ishvara Earring",
        body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		ring1="Ilabrat Ring",
		ring2="Ramuh Ring +1",
        back=WScape,
		waist="Wanion Belt",
		legs="Lustratio Subligar",
		feet="Herculean Boots"}
    sets.precast.WS['Shark Bite'].Mod = set_combine(sets.precast.WS['Shark Bite'], {ammo="Yetshila +1",
        body="Abnoba Kaftan",back="Toutatis's Cape"})
    sets.precast.WS['Shark Bite'].SA = set_combine(sets.precast.WS['Shark Bite'].Mod, {})
    sets.precast.WS['Shark Bite'].TA = set_combine(sets.precast.WS['Shark Bite'].Mod, {})
    sets.precast.WS['Shark Bite'].SATA = set_combine(sets.precast.WS['Shark Bite'].Mod, {})

    sets.precast.WS['Mandalic Stab'] = {
		ammo="Expeditious Pinion",
        head="Lilitu headpiece",
		neck="Caro Necklace",
		ear1="Ishvara Earring",
		ear2="Mache Earring +1",
        body="Meghanada Cuirie +1",
		hands="Adhemar Wristbands",
		ring1="Ramuh Ring +1",
		ring2="Ramuh Ring +1",
        back=WSCape,
		waist="Wanion Belt",
		legs="Lustratio Subligar",
		feet="Herculean Boots"}
    sets.precast.WS['Mandalic Stab'].Mod = set_combine(sets.precast.WS['Mandalic Stab'], {ammo="Yetshila +1",
        body="Abnoba Kaftan",back="Toutatis's Cape"})
    sets.precast.WS['Mandalic Stab'].SA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {})
    sets.precast.WS['Mandalic Stab'].TA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {})
    sets.precast.WS['Mandalic Stab'].SATA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {})

    sets.precast.WS['Aeolian Edge'] = {
    ammo="Pemphredo Tathlum",
    head="Herculean Helm",
    body={ name="Samnuha Coat", augments={'Mag. Acc.+14','"Mag.Atk.Bns."+13','"Fast Cast"+4','"Dual Wield"+3',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Limbo Trousers",
    feet={ name="Herculean Boots", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','"Store TP"+3','STR+13','Mag. Acc.+7','"Mag.Atk.Bns."+11',}},
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Crematio Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Toutatis's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)
		
	--sets.precast.WS['Last Stand'] = {
     --   head="Pursuer's Beret",neck="Fotia Gorget",ear1="Clearview Earring",ear2="Moonshade Earring",
     --   body="Foppish Tunica",hands=RNGhands,ring1="Garuda Ring +1",ring2="Garuda Ring +1",
      --  back="Libeccio Mantle",waist="Yemaya Belt",legs=RNGlegs,feet=RNGfeet}
		
	sets.precast.WS['Vorpal Blade'] = {sets.precast.WS['Evisceration']}



    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
		ammo="Brigantia Pebble",
        head="Herculean Helm",
		neck="Orunmila's Torque",
		ear1="Etiolation earring",
		ear2="Loquacious Earring",
        body="Samnuha Coat",
		hands="Leyline Gloves",
		ring1="Prolix Ring",
		ring2="Defending Ring",
		back="Moonbeam Cape",
        waist="Ninurta's Sash",
		legs="Dashing Subligar",
		feet="Skulker's Poulaines +1"}

    -- Specific spells
    sets.midcast.Utsusemi = {neck="Loricate Torque +1",Ring1="Defending Ring",Ring2="Dark Ring",back="Mollusca Mantle",waist="Flume Belt"}
		
	sets.midcast['Enhancing Magic'] = {neck="Incanter's Torque",ear1="Andoaa Earring",waist="Olympus Sash"}
	

    -- Ranged gear
    --sets.midcast.RA = {
       -- head="Pursuer's beret",neck="Combatant's Torque",ear1="Neritic Earring",ear2="Volley Earring",
       -- body="Pursuer's Doublet",hands=RNGhands,ring1="Garuda Ring +1",ring2="Garuda Ring +1",
       -- back="Libeccio Mantle",waist="Yemaya Belt",legs=RNGlegs,feet=RNGfeet}

    --sets.midcast.RA.Acc = {
       -- head="Pursuer's beret",neck="Combatant's Torque",ear1="Clearview Earring",ear2="Volley Earring",
      --  body="Foppish Tunica",hands=RNGhands,ring1="Garuda Ring +1",ring2="Garuda Ring +1",
     --   back="Libeccio Mantle",waist="Yemaya Belt",legs="Pursuer's Pants",feet=RNGfeet}


    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {
		neck="Bathy Choker +1",
		ring1="Sheltered Ring",
		ring2="Paguroidea Ring"}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle =  {
		ammo="Yetshila +1",
		head="Adhemar Bonnet +1",
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		feet="Jute Boots +1",
		neck="Loricate Torque +1",
		waist="Flume Belt",
		left_ear="Etiolation Earring",
		right_ear="Infused Earring",
		left_ring="Warp Ring",
		right_ring="Defending Ring",
		back="Moonbeam Cape"}
		
	sets.idle.Regen = {
		ammo="Brigantia Pebble",
        head="Ocelomeh Headpiece +1",
		neck="Bathy Choker +1",
		ear1="Etiolation Earring",
		ear2="Genmei Earring",
        body="Emet Harness +1",
		hands="Umuthi Gloves",
		ring1="Sheltered Ring",
		ring2="Paguroidea Ring",
        back="Moonbeam Cape",
		waist="Flume Belt",
		legs="Iuitl Tights +1",
		feet="Jute Boots +1"}
		
	sets.idle.PDT = {
        ammo="Brigantia Pebble",
		head="Lithelimb Cap",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Genmei Earring",
        body="Emet Harness +1",
		hands="Meghanada Gloves +1",
		ring1="Dark Ring",
		ring2="Defending Ring",
        back="Moonbeam Cape",
		waist="Flume Belt",
		legs="Qaaxo Tights",
		feet="Jute Boots +1"}

    sets.idle.Town = {
		main="Twashtar",
		sub="Aeneas",
		ammo="Yetshila +1",
		head="Adhemar Bonnet +1",
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		feet="Jute Boots +1",
		neck="Loricate Torque +1",
		waist="Flume Belt",
		left_ear="Etiolation Earring",
		right_ear="Infused Earring",
		left_ring="Warp Ring",
		right_ring="Dim. Ring (Holla)",
		back="Moonbeam Cape"}

    sets.idle.Weak = {
        ammo="Brigantia Pebble",
		head="Lithelimb Cap",
		neck="Twilight Torque",
		ear1="Etiolation Earring",
		ear2="Genmei Earring",
        body="Meghanada Cuirie +1",
		hands="Umuthi Gloves",
		ring1="Patricius Ring",
		ring2="Defending Ring",
        back="Moonbeam Cape",
		waist="Flume Belt",
		legs="Iuitl Tights +1",
		feet="Jute Boots +1"}


    -- Defense sets

    sets.defense.Evasion = {
        head=DThead,neck="Bathy Choker +1",ear1="Eabani Earring",ear2="Assuage Earring",
        body="Emet Harness +1",hands=DThands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
        waist="Chiner's Belt +1",legs=DTlegs,feet=DTfeet}

    sets.defense.PDT = {
        ammo="Brigantia Pebble",
		head="Lithelimb Cap",
		neck="Twilight Torque",
		ear1="Etiolation Earring",
		ear2="Genmei Earring",
        body="Emet Harness +1",
		hands="Umuthi Gloves",
		ring1="Patricius Ring",
		ring2="Defending Ring",
        back="Moonbeam Cape",
		waist="Flume Belt",
		legs="Iuitl Tights +1",
		feet="Jute Boots +1"}

    sets.defense.MDT = {ammo="Vanir Battery",
        head=DThead,neck="Warder's Charm +1",ear1="Sanare Earring",ear2="Eabani Earring",
        body="Lapidary Tunic",hands="Leyline Gloves",ring1="Purity Ring",ring2="Defending Ring",
        back="Mubvumbamiri Mantle",waist="Engraved Belt",legs="Feast Hose",feet="Jute Boots +1"}


    --------------------------------------
    -- Melee sets
    --------------------------------------

    -- Normal melee group
    sets.engaged.NoHaste = {
		ammo="Ginsen",
		head={ name="Taeon Chapeau", augments={'Accuracy+20 Attack+20','"Dual Wield"+5','STR+3 DEX+3',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','DEX+1',}},
		neck="Combatant's Torque",
		waist="Reiki Yotai",
		left_ear="Heartseeker Earring",
		right_ear="Dudgeon Earring",
		left_ring="Epona's Ring",
		right_ring="Hetairoi Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10',}},}
		
	sets.engaged.MidHaste = {
		ammo="Ginsen",
		head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Taeon Boots", augments={'Accuracy+17 Attack+17','"Dual Wield"+5','DEX+1',}},
		neck="Combatant's Torque",
		waist="Windbuffet Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Epona's Ring",
		right_ring="Hetairoi Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10',}},}
		
	sets.engaged.CapHaste = {
		ammo="Ginsen",
		head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Samnuha Tights",
		feet={ name="Herculean Boots", augments={'Accuracy+29','"Triple Atk."+4','Attack+1',}},
		neck="Combatant's Torque",
		waist="Windbuffet Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Epona's Ring",
		right_ring="Petrov Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10',}},}
		
	sets.engaged.Acc = {
		ammo="Falcon Eye",
		head="Meghanada Visor +1",
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Meghanada Chausses +1",
		feet="Meghanada Jambeaux +1",
		neck="Combatant's Torque",
		waist="Olseni Belt",
		left_ear="Mache Earring +1",
		right_ear="Telos Earring",
		left_ring="Ramuh Ring +1",
		right_ring="Ramuh Ring +1",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10',}},}
		

	sets.engaged.PDTAcc = {
		ammo="Falcon Eye",
		head="Meghanada Visor +1",
		body="Meghanada Cuirie +1",
		hands="Meg. Gloves +1",
		legs="Meghanada Chausses +1",
		feet="Meghanada Jambeaux +1",
		neck="Loricate Torque +1",
		waist="Flume Belt",
		left_ear="Heartseeker Earring",
		right_ear="Dudgeon Earring",
		left_ring="Defending Ring",
		right_ring="Patricius Ring",
		back="Agema Cape",}
 
	sets.common = {}
	sets.common.trust = sets.midcast.FastRecast
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
 --   if spell.english == 'Aeolian Edge' and state.TreasureMode.value ~= 'Fulltime' then
 --       equip(sets.TreasureHunter)
		if spell.english=='Sneak Attack' or spell.english=='Trick Attack'  then
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
    end
	if spell.action_type=="Magic" and buffactive.Silence then
        eventArgs.cancel = true
        send_command('input /item "Echo Drops" <me>')
    end
    if spell.type=='WeaponSkill' then
        if moonshade_WS:contains(spell.english) and player.tp<2900 then
            equip({ear1="Moonshade Earring"})
        end
    end
end

-- Run after the general midcast() set is constructed.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.TreasureMode.value ~= 'None' and spell.action_type == 'Ranged Attack' then
        equip(sets.TreasureHunter)
    end
--	if spell.type == "WeaponSkill" then
--    if spell.element == world.weather_element or spell.element == world.day_element then
--        equip({waist="Hachirin-no-Obi"})
--		add_to_chat(8,'----- Obi Equipped. -----')
--    end
--	end
	
if spell.type=="Trust" then
    equip(sets.common.trust)
  end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    -- Weaponskills wipe SATA/Feint.  Turn those state vars off before default gearing is attempted.
    if spell.type == 'WeaponSkill' and not spell.interrupted then
        state.Buff['Sneak Attack'] = false
        state.Buff['Trick Attack'] = false
        state.Buff['Feint'] = false
    end
end

-- Called after the default aftercast handling is complete.
function job_post_aftercast(spell, action, spellMap, eventArgs)
    -- If Feint is active, put that gear set on on top of regular gear.
    -- This includes overlaying SATA gear.
    check_buff('Feint', eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
	if buff:lower()=='terror' or buff:lower()=='petrification' or buff:lower()=='sleep' or buff:lower()=='stun' then
        if gain then
            equip(sets.defense.PDT)
        elseif not gain then 
            handle_equipping_gear(player.status)
        end
    end
	if buff:lower()=='sleep' then
        if gain and player.hp > 120 and player.status == "Engaged" then -- Equip Berserker's Torque / frenzy When You Are Asleep
            equip({head="Frenzy Sallet"})
        elseif not gain then -- Take Berserker's off
            handle_equipping_gear(player.status)
        end
    end
	if buff == "doom" then
        if gain then           
            equip(sets.buff.Doom)
            send_command('@input /p Doomed please cursna.')
            send_command('@input /item "Holy Water" <me>')
            disable('ring1','ring2','waist')
        else
            enable('ring1','ring2','waist')
            handle_equipping_gear(player.status)
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function get_custom_wsmode(spell, spellMap, defaut_wsmode)
    local wsmode

    if state.Buff['Sneak Attack'] then
        wsmode = 'SA'
    end
    if state.Buff['Trick Attack'] then
        wsmode = (wsmode or '') .. 'TA'
    end

    return wsmode
end


-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    -- Check that ranged slot is locked, if necessary
    check_range_lock()

    -- Check for SATA when equipping gear.  If either is active, equip
    -- that gear specifically, and block equipping default gear.
    check_buff('Sneak Attack', eventArgs)
    check_buff('Trick Attack', eventArgs)
end


function customize_idle_set(idleSet)
    if player.hpp < 80 then
        idleSet = set_combine(idleSet, sets.ExtraRegen)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
    if S{"Eastern Adoulin","Western Adoulin"}:contains(world.area) then
        idleSet = set_combine(idleSet,{body="Councilor's Garb"})
    end
    return idleSet
end


function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end
	if state.Buff.Sleep and player.hp > 120 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep
        meleeSet = set_combine(meleeSet,{head="Frenzy Sallet"})
    end
    if player.hp < 700 then
        meleeSet = set_combine(meleeSet, sets.defense.PDT)
    end
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end
    return meleeSet
end


-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    th_update(cmdParams, eventArgs)
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
    
    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ', Target NPCs'
    end
    
    msg = msg .. ', TH: ' .. state.TreasureMode.value

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
    if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        eventArgs.handled = true
    end
end


-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
function th_action_check(category, param)
    if category == 2 or -- any ranged attack
        --category == 4 or -- any magic action
        (category == 3 and param == 30) or -- Aeolian Edge
        (category == 6 and info.default_ja_ids:contains(param)) or -- Provoke, Animated Flourish
        (category == 14 and info.default_u_ja_ids:contains(param)) -- Quick/Box/Stutter Step, Desperate/Violent Flourish
        then return true
    end
end


-- Function to lock the ranged slot if we have a ranged weapon equipped.
function check_range_lock()
    if player.equipment.range ~= 'empty' then
        disable('range', 'ammo')
    else
        enable('range', 'ammo')
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 6)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 6)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 6)
    else
        set_macro_page(1, 6)
    end
end

-------------------------------------Aspir,Sleep/ga Nuke's refine rules (thanks Asura.Vafruvant for this code)-----------------------------------
function refine_various_spells(spell, action, spellMap, eventArgs)
	banish = S{'Banish II','Banish'}
	
	if not banish:contains(spell.english) then
		return
	end

	local newSpell = spell.english
	local spell_recasts = windower.ffxi.get_spell_recasts()
	local cancelling = 'All '..spell.english..' spells are on cooldown. Cancelling spell casting.'

	if spell_recasts[spell.recast_id] > 0 then
			if banish:contains(spell.english) then
				if spell.english == 'Banish' then
				add_to_chat(122,cancelling)
				eventArgs.cancel = true
			return
			elseif spell.english == 'Banish II' then
				newSpell = 'Banish'
			end
		end
	end

	if newSpell ~= spell.english then
		send_command('@input /ma "'..newSpell..'" '..tostring(spell.target.raw))
		eventArgs.cancel = true
		return
	end
end

function job_precast(spell, action, spellMap, eventArgs)
    refine_various_spells(spell, action, spellMap, eventArgs)
end
