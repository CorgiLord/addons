-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

-- Initialization function for this job file.
function get_sets()
	mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
end


-- Setup vars that are user-independent.
function job_setup()
include('caster_buffWatcher.lua')
buffWatcher.watchList = {
                        ["Aquaveil"]="Aquaveil",
                        ["Stoneskin"]="Stoneskin",
                        ["Haste"]="Haste",
						["Phalanx"]="Phalanx",
						["Refresh"]="Refresh",
						["Blink"]="Blink",
                        ["Protect"]="Protect III",
                        ["Shell"]="Shell II",
                        }
include('common_info.status.lua')
end


-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
	state.OffenseMode:options('Laevateinn', 'Raetic', 'PDT')
	state.CastingMode:options('Normal', 'MagicBurst')
	state.IdleMode:options('Laevateinn', 'Raetic', 'PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.EquipBodyAF = M{['description']='Body', 'BodyAF', 'AmalricBody'}
	
	state.MagicBurst = M(false, 'Magic Burst')
	
	
	lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
	'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
	'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
	'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
	'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}
	
	send_command('bind F7 gs c cycle OffenseMode')
	send_command('bind F3 gs c cycle EquipBodyAF')
	send_command('bind F2 gs c cycle IdleMode')
	-- Default macro set/book
	set_macro_page(8, 4)
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
	send_command('unbind F7')
	send_command('unbind F3')
	send_command('unbind F2')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	---- Precast Sets ----

	-- Precast sets to enhance JAs
	sets.precast.JA['Mana Wall'] = {feet="Wicce Sabots +1",back="Taranus's Cape",}

	sets.precast.JA.Manafont = {body="Archmage's Coat +1"}

	-- equip to maximize HP (for Tarus) and minimize MP loss before using convert
	sets.precast.JA.Convert = {}


	-- Fast cast sets for spells

	sets.precast.FC = {
	sub="Enki strap",
	head="Merlinic Hood",--{name="Amalric Coif +1", priority=15},
	neck={name="Orunmila's Torque", priority=13},
	ear1="Etiolation Earring",
	ear2="Loquacious Earring",
	hands={ name="Merlinic Dastanas", 	augments={'Mag. Acc.+4','"Fast Cast"+7','"Mag.Atk.Bns."+12',}},
	waist={name="Witful Belt", priority=3},
	body="Merlinic Jubbah",
	back={name="Perimede Cape", priority=1},
	ammo={name="Impatiens", priority=2},
	ring1={name="Lebeche Ring", priority=12},
	ring2="Kishar Ring",
	legs="Lengo Pants",--{name="Psycloth Lappas", priority=14},
	feet="Chelona Boots +1",} --{ name="Merlinic Crackows", augments={'Mag. Acc.+21','"Fast Cast"+7','INT+2',}}}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear2="Barkarole Earring",back={ name="Taranus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','MP+20','"Fast Cast"+10',}},})

	sets.precast.FC.Death ={
    ammo="Impatiens",
	head={name="Amalric Coif +1", priority=15},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+21','"Fast Cast"+7','CHR+1','"Mag.Atk.Bns."+14',}},
    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+4','"Fast Cast"+7','"Mag.Atk.Bns."+12',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+21','"Fast Cast"+7','INT+2',}},
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Enchntr. Earring +1",
    left_ring={name="Mephitas's Ring +1", priority=14},
    right_ring="Lebeche Ring",
    back={ name="Taranus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','MP+20','"Fast Cast"+10', priority=13}},
}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {head={name="Amalric Coif +1", priority=15},hands="Vanya Cuffs",back={ name="Taranus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','MP+20','"Fast Cast"+10',}},ear1="Etiolation Earring",ear2="Mendicant's Earring",neck="Orunmila's Torque",waist="Acerbic sash +1",ammo="Strobilus"})

	sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {ring1="Rahab Ring",ammo="Sapience Orb",ear1="Enchanter Earring +1",back={ name="Taranus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','MP+20','"Fast Cast"+10',}},head=empty,body="Twilight Cloak"})
	
	sets.precast.FC.Death.MagicBurst = {
    ammo="Sapience Orb",
    head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+24','"Fast Cast"+7','VIT+3',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+21','"Fast Cast"+7','CHR+1','"Mag.Atk.Bns."+14',}},
    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+4','"Fast Cast"+7','"Mag.Atk.Bns."+12',}},
    legs={name={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}, priority=14},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+21','"Fast Cast"+7','INT+2',}},
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear={name="Etiolation Earring", priority=13},
    right_ear="Enchntr. Earring +1",
    left_ring={name="Mephitas's Ring +1", priority=15},
    right_ring="Kishar Ring",
    back={name={ name="Taranus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','MP+20','"Fast Cast"+10',}}, priority=12},
}

	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {hands="Carapacho Cuffs",legs={name="Psycloth Lappas", priority=15},ring1={name="Lebeche Ring", priority=14}})

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Pemphredo Tathlum",
	head="Amalric Coif +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Regal Earring",
	body="Amalric Doublet +1",hands={ name="Merlinic Dastanas", augments={'Pet: Attack+11 Pet: Rng.Atk.+11','"Conserve MP"+1','"Refresh"+2','Accuracy+20 Attack+20',}},ring1="Shiva Ring +1",ring2="Shiva Ring +1",
	back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},waist="Fotia Belt",legs="Amalric Slops +1",feet={ name="Merlinic Crackows", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','INT+8','Mag. Acc.+14','"Mag.Atk.Bns."+14',}}}

	-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Myrkr'] = {ammo="Strobilus",
	head="Amalric Coif +1",neck="Dualism Collar +1",ear1="Moonshade Earring",ear2="Influx Earring",
	body="Weatherspoon robe +1",hands="Otomi Gloves",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
	back="Bane Cape",waist="Shinjutsu-no-obi +1",legs="Amalric Slops +1",feet="Psycloth Boots"}

	sets.precast.WS['Vidohunir'] = {ammo="Pemphredo Tathlum",
	head="Pixie Hairpin +1",neck="Mizukage-no-Kubikazari",ear1="Regal Earring",ear2="Barkarole Earring",
	body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Archon Ring",ring2="Shiva Ring +1",
	back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},waist="Yamabuki-no-obi",legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+9','MND+14','Mag. Acc.+11','"Mag.Atk.Bns."+12',}},feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Occult Acumen"+3','INT+6','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},}


	---- Midcast Sets ----

	sets.midcast.FastRecast = {
	head="Amalric Coif +1",ammo="Impatiens",ear1="Etiolation Earring",ear2="Loquacious Earring",
	body="Amalric Doublet +1",hands="Otomi Gloves",ring1="Lebeche Ring",
	back="Perimede Cape",waist="Cetl Belt",legs="Psycloth Lappas",feet="Merlinic Crackows"}

	sets.midcast.Cure = {
    main="Raetic Rod +1",
    sub="Ammurapi Shield",
    ammo="Strobilus",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Phalaina Locket",
    waist="Austerity Belt +1",
    left_ear="Roundel Earring",
    right_ear="Mendi. Earring",
    left_ring="Mephitas's Ring +1",
    right_ring="Mephitas's Ring",
    back="Solemnity Cape",}

	sets.self_healing = {
    main="Raetic Rod +1",
    sub="Ammurapi Shield",
    ammo="Strobilus",
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Otomi Gloves", augments={'HP+30','MP+30','MP+30',}},
    legs={ name="Telchine Braconi", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Phalaina Locket",
    waist="Gishdubar Sash",
    left_ear="Roundel Earring",
    right_ear="Mendi. Earring",
    left_ring="Asklepian Ring",
    right_ring="Kunaji Ring",
    back="Solemnity Cape",
}

	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast['Enhancing Magic'] = {
	main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','"Mag.Atk.Bns."+7',}},
    sub="Ammurapi Shield",
	ammo="Pemphredo Tathlum",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Potency of "Cure" effect received+6%','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Evans Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -6%',}},
    back="Fi Follet Cape +1",
}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {hands={name="Otomi Gloves", priority=13},back={name="Fi Follet Cape +1", priority=12},neck="Stone Gorget",ear1="Earthcry Earring",legs="Shedir Seraweels",waist="Siegel Sash",ring1={name="mephitas's ring +1", priority=15},ring2={name="mephitas's ring", priority=14}})

	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {head={ name="Merlinic Hood", augments={'Pet: "Store TP"+1','Mag. Acc.+11','Phalanx +5','Accuracy+5 Attack+5',}},})
	
	sets.midcast.Aquaveil = {
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','"Mag.Atk.Bns."+7',}},
    sub="Ammurapi Shield",
    ammo="Impatiens",
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Potency of "Cure" effect received+6%','Enh. Mag. eff. dur. +10',}},
    legs="Shedir Seraweels",
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Loricate Torque +1",
    waist="Emphatikos Rope",
    left_ear="Etiolation Earring",
    right_ear="Gifted Earring",
    left_ring="Mephitas's Ring +1",
    right_ring="Evanescence Ring",
    back={ name="Bane Cape", augments={'Elem. magic skill +9','Dark magic skill +7','"Mag.Atk.Bns."+3',}},}

	sets.midcast.Refresh = set_combine(sets.midcast.Aquaveil, {head="Amalric Coif +1",body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},hands={ name="Telchine Gloves", augments={'Potency of "Cure" effect received+6%','Enh. Mag. eff. dur. +10',}},legs={ name="Telchine Braconi", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},waist="Gishdubar Sash",feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},back="Grapevine Cape"})

	sets.midcast.Haste = {
	main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','"Mag.Atk.Bns."+7',}},
    sub="Ammurapi Shield",
    ammo="Strobilus",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Potency of "Cure" effect received+6%','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Dualism Collar +1",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Evans Earring",
    left_ring="Mephitas's Ring +1",
    right_ring="Mephitas's Ring",
    back="Fi Follet Cape +1",}

	sets.midcast.MndEnfeebles = {
	main={ name="Gada", augments={'"Cure" potency +8%','STR+12','Mag. Acc.+20','"Mag.Atk.Bns."+14','DMG:+15',}},
    sub="Ammurapi Shield",
	ammo="Quartz Tathlum +1",
	head="Befouled Crown",
	neck="Incanter's Torque",
	ear1="Regal Earring",
	ear2="Barkarole Earring",
	body="Spaekona's Coat +3",
	hands="Lurid Mitts",
	ring1="Stikini Ring +1",
	ring2="Stikini Ring +1",
	back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	waist="Rumination sash",
	legs={name="Psycloth Lappas", priority=15},
	feet={name="Skaoi boots", priority=14}}

	sets.midcast.IntEnfeebles = sets.midcast.MndEnfeebles
	
	sets.midcast.Breakga = {
	main={ name="Gada", augments={'"Cure" potency +8%','STR+12','Mag. Acc.+20','"Mag.Atk.Bns."+14','DMG:+15',}},
    sub="Ammurapi Shield",
	ammo="Quartz Tathlum +1",
	head={ name="Merlinic Hood", augments={'Pet: "Store TP"+5','"Store TP"+1','"Treasure Hunter"+2','Accuracy+17 Attack+17',}},
	neck="Incanter's Torque",
	ear1="Regal Earring",
	ear2="Barkarole Earring",
	body="Spaekona's Coat +3",
	hands={ name="Merlinic Dastanas", augments={'MND+5','"Drain" and "Aspir" potency +8','"Treasure Hunter"+2','Accuracy+17 Attack+17',}},
	left_ring="Stikini Ring +1",
	right_ring="Kishar Ring",
	back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	waist="Chaac Belt",
	legs={name="Psycloth Lappas", priority=15},
	feet={name="Skaoi boots", priority=14}}
	
	sets.midcast.Break = sets.midcast.Breakga
	
	sets.midcast.Sleep = {
	main={ name="Gada", augments={'"Cure" potency +8%','STR+12','Mag. Acc.+20','"Mag.Atk.Bns."+14','DMG:+15',}},
    sub="Ammurapi Shield",
	ammo="Quartz Tathlum +1",
	head={ name="Merlinic Hood", augments={'Pet: "Store TP"+5','"Store TP"+1','"Treasure Hunter"+2','Accuracy+17 Attack+17',}},
	neck="Incanter's Torque",
	ear1="Regal Earring",
	ear2="Barkarole Earring",
	body="Spaekona's Coat +3",
	hands={ name="Merlinic Dastanas", augments={'MND+5','"Drain" and "Aspir" potency +8','"Treasure Hunter"+2','Accuracy+17 Attack+17',}},
	ring1="Stikini ring +1",
	ring2="Kishar Ring",
	back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	waist="Chaac Belt",
	legs={name="Psycloth Lappas", priority=15},
	feet={name="Skaoi boots", priority=14}}
	
	sets.midcast['Sleep II'] = sets.midcast.Sleep
    sets.midcast.Sleepga = sets.midcast.Sleep
    sets.midcast['Sleepga II'] = sets.midcast.Sleep
	
	sets.midcast.Blind = {
	main={ name="Gada", augments={'"Cure" potency +8%','STR+12','Mag. Acc.+20','"Mag.Atk.Bns."+14','DMG:+15',}},
    sub="Ammurapi Shield",
	ammo="Quartz Tathlum +1",
    head={ name="Merlinic Hood", augments={'Pet: "Store TP"+5','"Store TP"+1','"Treasure Hunter"+2','Accuracy+17 Attack+17',}},
    body="Spaekona's Coat +3",
    hands={ name="Merlinic Dastanas", augments={'MND+5','"Drain" and "Aspir" potency +8','"Treasure Hunter"+2','Accuracy+17 Attack+17',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet="Skaoi Boots",
    neck="Incanter's Torque",
    waist="Chaac Belt",
    left_ear="Regal Earring",
    right_ear="Barkaro. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	sets.midcast['Dark Magic'] = {
	main="Rubicundity",
    sub="Ammurapi Shield",
	ammo="Pemphredo Tathlum",
	head="Amalric Coif +1",
	neck="Erra Pendant",
	ear1="Dark Earring",
	ear2="Barkarole Earring",
	body="Psycloth Vest",
	hands="Jhakri Cuffs +2",
	ring1="Archon Ring",
	ring2="Evanescence Ring",
	back={name="Bane Cape", priority=15},
	waist="Cetl Belt",
	legs="Spaekona's Tonban +3",
	feet="Wicce Sabots +1"}

	sets.midcast.Drain = {
	main="Rubicundity",
    sub="Ammurapi Shield",
	ammo="Strobilus",
	head="Pixie Hairpin +1",
	neck="Erra Pendant",
	ear1="Hirudinea Earring",
	ear2="Barkarole Earring",
	body="Psycloth Vest",
	hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+12','"Drain" and "Aspir" potency +11','"Mag.Atk.Bns."+7',}},
	ring1="Archon Ring",
	ring2="Evanescence Ring",
	back={name="Bane Cape", priority=15},
	waist="Fucho-no-obi",
	legs="Spaekona's Tonban +3",
	feet="Wicce Sabots +1"}

	sets.midcast.Aspir = sets.midcast.Drain

	sets.midcast['Aspir III'] = sets.midcast.Drain

	sets.midcast.Raise = {
    ammo="Impatiens",
    head="Adhara Turban",
    body="Ros. Jaseran +1",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Lengo Pants", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Occult Acumen"+3','INT+6','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
    neck="Loricate Torque +1",
    waist="Emphatikos Rope",
    left_ear="Etiolation Earring",
    right_ear="Gifted Earring",
    left_ring="Mephitas's Ring +1",
    right_ring="Evanescence Ring",
    back={ name="Bane Cape", augments={'Elem. magic skill +9','Dark magic skill +7','"Mag.Atk.Bns."+3',}},
}

	-- Elemental Magic sets are default for handling low-tier nukes.
	sets.midcast['Elemental Magic'] = {
    sub="Enki Strap",
    ammo="Dosis Tathlum",
    head="Archmage's Petasos +3",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}, priority=14},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}, priority=15},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Occult Acumen"+3','INT+6','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
    neck="Sanctity Necklace",
    waist="Refoccilation Stone",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Fenrir Ring +1",
    right_ring="Fenrir Ring +1",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

	sets.midcast['Elemental Magic'].MagicBurst = {
    sub="Enki Strap",
    ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Ea Houppelande +1",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea slops +1",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Occult Acumen"+3','INT+6','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
    neck="Sorcerer's stole +2",
    waist="Refoccilation Stone",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Fenrir Ring +1",
    right_ring="Mujin Band",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

	sets.midcast['Elemental Magic'].HighTierNuke = {
    ammo="Pemphredo Tathlum",
    head="Archmage's Petasos +3",
    body="Spaekona's Coat +3",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+9','MND+14','Mag. Acc.+11','"Mag.Atk.Bns."+12',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Occult Acumen"+3','INT+6','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
    neck="Sorcerer's stole +2",
    waist="Yamabuki-no-Obi",
    left_ear="Regal Earring",
    right_ear="Barkaro. Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}


	sets.midcast['Elemental Magic'].HighTierNuke.MagicBurst = {
    ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Spaekona's Coat +3",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea slops +1",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Occult Acumen"+3','INT+6','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
    neck="Sorcerer's stole +2",
    waist="Yamabuki-no-Obi",
    left_ear="Regal Earring",
    right_ear="Barkaro. Earring",
    left_ring="Shiva Ring +1",
    right_ring="Mujin Band",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

	sets.midcast.Burn = {
    ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Spaekona's Coat +3",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Spae. Tonban +3",
    feet={ name="Arch. Sabots +3", augments={'Reduces Ancient Magic II MP cost',}},
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ear="Barkaro. Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Bane Cape", augments={'Elem. magic skill +9','Dark magic skill +7','"Mag.Atk.Bns."+3',}},
}

	sets.midcast.Rasp = sets.midcast.Burn
	sets.midcast.Shock = sets.midcast.Burn
	sets.midcast.Drown = sets.midcast.Burn
	sets.midcast.Choke = sets.midcast.Burn
	sets.midcast.Frost = sets.midcast.Burn
	
	sets.midcast.Impact = {
	main="Khatvanga",
	sub="Enki strap",
	ammo="Seraphic Ampulla",
	head=empty,
	body="Twilight Cloak",
	hands={ name="Helios Gloves", augments={'"Mag.Atk.Bns."+24','"Occult Acumen"+10','INT+7 MND+7',}},
	legs="Perdition Slops",
	feet={ name="Helios Boots", augments={'Pet: Attack+26 Pet: Rng.Atk.+26','"Occult Acumen"+7',}},
	neck="Combatant's Torque",
	waist="Oneiros Rope",
	left_ear="Dedition Earring",
	right_ear="Telos Earring",
	left_ring="K'ayres Ring",
	right_ring="Rajas Ring",
	back={ name="Taranus's Cape", augments={'MP+60','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},}
	
	sets.midcast.Impact.MagicBurst = sets.midcast.Impact
	
	sets.midcast.Meteor = {
	ammo="Pemphredo Tathlum",
    head="Archmage's Petasos +3",
    body="Spaekona's Coat +3",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+9','MND+14','Mag. Acc.+11','"Mag.Atk.Bns."+12',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Occult Acumen"+3','INT+6','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
    neck="Sorcerer's stole +2",
    waist="Yamabuki-no-Obi",
    left_ear="Regal Earring",
    right_ear="Barkaro. Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	
	sets.midcast.Comet = {
	ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Spaekona's Coat +3",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Wicce Chausses +1",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Occult Acumen"+3','INT+6','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
    neck="Sorcerer's stole +2",
    waist="Yamabuki-no-Obi",
    left_ear="Regal Earring",
    right_ear="Barkaro. Earring",
    left_ring="Archon Ring",
    right_ring="Fenrir Ring +1",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	
	sets.midcast.Comet.MagicBurst = {
	ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Spaekona's Coat +3",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Wicce Chausses +1",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+10%','CHR+3','Mag. Acc.+1','"Mag.Atk.Bns."+5',}},
    neck="Sorcerer's stole +2",
    waist="Yamabuki-no-Obi",
    left_ear="Static Earring",
    right_ear="Regal Earring",
    left_ring="Archon Ring",
    right_ring="Mujin Band",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	
	sets.midcast.Death = {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}, priority=14},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}, priority=15},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Occult Acumen"+3','INT+6','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
    neck="Sorcerer's stole +2",
    waist="Yamabuki-no-Obi",
    left_ear="Regal Earring",
    right_ear="Barkaro. Earring",
    left_ring="Archon Ring",
    right_ring="Fenrir Ring +1",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	
	sets.midcast.Death.MagicBurst = {
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Ea Houppelande +1",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Ea slops +1",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+10%','CHR+3','Mag. Acc.+1','"Mag.Atk.Bns."+5',}},
    neck="Sorcerer's stole +2",
    waist="Yamabuki-no-Obi",
    left_ear="Barkarole Earring",
    right_ear="Regal Earring",
    left_ring="Archon Ring",
    right_ring="Mujin Band",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	
	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {ammo="Strobilus",
	head="Amalric Coif +1",neck="Dualism Collar +1",ear1="Etiolation Earring",ear2="Influx Earring",
	body="Amalric Doublet +1",hands={ name="Merlinic Dastanas", augments={'Pet: Attack+11 Pet: Rng.Atk.+11','"Conserve MP"+1','"Refresh"+2','Accuracy+20 Attack+20',}},ring1="Mephitas's Ring +1",ring2="Stikini Ring +1",
	waist="Shinjutsu-no-obi +1",legs="Assiduity Pants +1",feet={ name="Merlinic Crackows", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','CHR+10','"Refresh"+2',}},}


	-- Idle sets

	-- Normal refresh idle set
	sets.idle.Laevateinn = {
	main="Laevateinn",
	sub="Enki strap",
    ammo={name="Strobilus", priority=11},
    head="Befouled Crown",
    body={ name="Shamash Robe", priority=15},
    hands={ name="Merlinic Dastanas", augments={'Pet: Attack+11 Pet: Rng.Atk.+11','"Conserve MP"+1','"Refresh"+2','Accuracy+20 Attack+20',}},
    legs="Assid. Pants +1",
    feet="Crier's Gaiters",
    neck="Dualism Collar +1",
    waist={name="Shinjutsu-no-Obi +1", priority=13},
    left_ear={name="Etiolation Earring", priority=12},
    right_ear="Genmei Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Bane Cape", augments={'Elem. magic skill +9','Dark magic skill +7','"Mag.Atk.Bns."+3', priority=14}},
}

	-- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
	sets.idle.PDT = {
	main="Laevateinn",
	sub="Enki strap",
	ammo="Staunch Tathlum +1",
	head={ name="Merlinic Hood", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Phys. dmg. taken -4%',}},
	body="Shamash Robe",
	hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Phys. dmg. taken -4%','Accuracy+14 Attack+14',}},
	legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+19','Damage taken-3%','MND+6',}},
	feet={ name="Merlinic Crackows", augments={'Phys. dmg. taken -4%','CHR+3','Mag. Acc.+3','"Mag.Atk.Bns."+4',}},
	neck="Loricate Torque +1",
	waist="Shinjutsu-no-Obi +1",
	left_ear="Etiolation Earring",
	right_ear="Genmei Earring",
	left_ring="Defending Ring",
	right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -6%',}},
	back="Moonlight cape",}
	
	sets.idle.Raetic = {
	main="Raetic Staff +1",
	sub="Enki strap",
	ammo="Strobilus",
	head="Befouled Crown",
	neck="Dualism Collar +1",
	ear1={name="Etiolation Earring", priority=13},
	ear2="Genmei Earring",
	body={name="Shamash Robe", priority=15},
	hands={ name="Merlinic Dastanas", augments={'Pet: Attack+11 Pet: Rng.Atk.+11','"Conserve MP"+1','"Refresh"+2','Accuracy+20 Attack+20',}},
	ring1="Stikini Ring +1",
	ring2="Stikini Ring +1",
	back="Bane Cape",waist={name="Shinjutsu-no-obi +1", priority=14},
	legs="Assiduity Pants +1",
	feet={ name="Merlinic Crackows", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','CHR+10','"Refresh"+2',}},}

	-- Idle mode scopes:
	-- Idle mode when weak.
	--sets.idle.Weak. = {ammo="Strobilus",
	--head="Befouled Crown",neck="Dualism Collar +1",ear1="Etiolation Earring",ear2="Genmei Earring",
	--body="Jhakri Robe +2",hands="Otomi Gloves",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
	--back="Bane Cape",waist="Shinjutsu-no-obi +1",legs="Assiduity Pants +1",feet="Psycloth Boots"}

	-- Town gear.
	sets.idle.Town = {main="Laevateinn",
	sub="Enki Strap",
	ammo="Staunch Tathlum +1",
	head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
	body="Shamash Robe",
	hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
	legs="Amalric Slops +1",
	feet="Crier's Gaiters",
	neck="Incanter's Torque",
	waist="Hachirin-no-Obi",
	left_ear="Etiolation Earring",
	right_ear="Genmei Earring",
	left_ring="Dim. Ring (Holla)",
	right_ring="Stikini Ring +1",
	back="Moonlight cape"}

	-- Defense sets

	sets.defense.PDT = {}

	sets.defense.MDT = {}

	sets.Kiting = {feet="Crier's Gaiters"}


	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.

	sets.buff['Mana Wall'] = {feet="Wicce Sabots +1",back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}

	sets.TPdown = {neck="Chrysopoeia torque"}

	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged.Laevateinn = {
	main="Laevateinn",
	sub="Enki strap",
    ammo={name="Strobilus", priority=11},
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Combatant's Torque",
    waist="Cetl Belt",
    left_ear="Telos Earring",
    right_ear="Mache Earring +1",
    left_ring={name="Mephitas's Ring +1", priority=15},
    right_ring={name="Mephitas's Ring", priority=14},
    back={name={ name="Taranus's Cape", augments={'MP+60','Accuracy+20 Attack+20','MP+20','"Dbl.Atk."+10',}}, priority=13},
}
	sets.engaged.Raetic = {
	main="Raetic Staff +1",
	sub="Enki strap",
    ammo={name="Strobilus", priority=11},
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Combatant's Torque",
    waist="Cetl Belt",
    left_ear="Telos Earring",
    right_ear="Mache Earring +1",
    left_ring={name="Mephitas's Ring +1", priority=15},
    right_ring={name="Mephitas's Ring", priority=14},
    back={name={ name="Taranus's Cape", augments={'MP+60','Accuracy+20 Attack+20','MP+20','"Dbl.Atk."+10',}}, priority=13},
}
	sets.engaged.PDT = {
	main="Laevateinn",
	sub="Enki strap",
    ammo="Hasty Pinion +1",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Combatant's Torque",
    waist="Olseni Belt",
    left_ear="Telos Earring",
    right_ear="Mache Earring +1",
    left_ring="Ramuh Ring +1",
    right_ring="Ramuh Ring +1",
    back={ name="Taranus's Cape", augments={'MP+60','Accuracy+20 Attack+20','MP+20','"Dbl.Atk."+10',}},
}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if spellMap == 'Cure' or spellMap == 'Curaga' then
	gear.default.obi_waist = "Goading Belt"
	elseif spell.skill == 'Elemental Magic' then
	gear.default.obi_waist = "Sekhmet Corset"
	if state.CastingMode.value == 'Proc' then
	classes.CustomClass = 'Proc'
	end
end
	if spell.action_type == 'Magic' then
	if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
            cancel_spell()
            add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
            return
        else
		if player.tp>200 or buffactive["Aftermath: Lv.2"] then
		disable('main','sub')
		else 
		enable ('main','sub')
		end
		end
	end	
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
	if buffactive.silence then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
            cancel_spell()
            add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
            return
        else
		if player.tp>200 or buffactive["Aftermath: Lv.2"] then
		disable('main','sub')
		else 
		enable ('main','sub')
		end
		end
	end	
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
	if buffactive.silence then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
            cancel_spell()
            add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
            return
        else
		if player.tp>200 or buffactive["Aftermath: Lv.2"] then
		disable('main','sub')
		end
		end	
	end	
	if spellMap == 'Cure' and spell.target.type == 'SELF' and sets.self_healing then
		equip(sets.self_healing)
	end
	if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' and spell.english ~= 'Impact' then
    if spell.element == world.weather_element or spell.element == world.day_element then
		equip({waist="Hachirin-no-Obi"})
		add_to_chat(8,'----- Obi Equipped. -----')
		end
	end
	if spell.type == "WeaponSkill" and not spell.name == 'Myrkr' then
    if spell.element == world.weather_element or spell.element == world.day_element then
        equip({waist="Hachirin-no-Obi"})
		add_to_chat(8,'----- Obi Equipped. -----')
    end
	end
	if spell.skill == 'Elemental Magic' and spell.name == 'Impact' then
		if spell.element == world.day_element or spell.element == world.weather_element then
			equip({waist="Oneiros Rope"})
			add_to_chat(8,'----- TP Equipped. -----')
		end
	end
	if spell.skill == 'Elemental Magic' then
		if state.EquipBodyAF.value == 'AmalricBody' then
			equip({body="Amalric Doublet +1"})
		end
		if state.EquipBodyAF.value == 'AmalricBody' and state.CastingMode.value == 'MagicBurst' then
			equip({body="Ea Houppelande +1"})
		end
	end
end

function job_aftercast(spell, action, spellMap, eventArgs)	
	if spell.english == "Impact" then
		disable ('main','sub')
	end
	if spell.english == "Shattersoul" then
		enable ('main','sub')
	end
     --Lock feet after using Mana Wall.
    if not spell.interrupted then
        if spell.english == 'Mana Wall' then
            enable('Back','feet')
            equip(sets.buff['Mana Wall'])
            disable('Back','feet')
            end
    end
    if spell.english == 'Sleep II' then
    send_command('timers c "Sleep II" 90 down spells/00259.png')
  elseif spell.english == 'Sleep' then
    send_command('timers c "Sleep" 60 down spells/00253.png')
  elseif spell.english == 'Break' then
    send_command('timers c "Break" 30 down spells/00255.png')
  elseif spell.english == 'Sleepga' then
    send_command('timers c "Sleepga" 60 down spells/00253.png')
    elseif spell.english == 'Sleepga II' then
    send_command('timers c "Sleepga" 90 down spells/00259.png')
    elseif spell.english == 'Breakga' then
    send_command('timers c "Breakga" 30 down spells/00255.png')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	-- Unlock feet when Mana Wall buff is lost.
	if buff == "Mana Wall" and not gain then
		enable('feet','back')
		handle_equipping_gear(player.status)
	end
	for index,value in pairs(buffWatcher.watchList) do
    if index==buff then
      buffWatch()
      break
    end
  end
end

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
	if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
		if lowTierNukes:contains(spell.english) then
			return 'LowTierNuke'
		else
			return 'HighTierNuke'
		end
	end
	if spell.skill == 'Enfeebling Magic' then
		if spell.type == 'WhiteMagic' then
			return 'MndEnfeebles'
		else
			return 'IntEnfeebles'
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
--function job_state_change(stateField, newValue)
--if stateField == 'Offense Mode' then
--	if newValue == 'Normal' then
--		disable('main','sub')
--	else
--		enable('main','sub')
--	end
--elseif stateField == 'Reset' then
--	if state.OffenseMode == 'None' then
--		enable('main','sub')
--	end
--end
--end


-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
	local meleeString = ''
	if state.OffenseMode == 'Normal' or 'Accu' then
	meleeString = 'Melee: Weapons locked, '
	end

	local defenseString = ''
		if state.Defense.Active then
		local defMode = state.Defense.PhysicalMode
		if state.Defense.Type == 'Magical' then
		defMode = state.Defense.MagicalMode
	end

	defenseString = 'Defense: '..state.Defense.Type..' '..defMode..', '
	end

	add_to_chat(122,meleeString..'Casting ['..state.CastingMode..'], Idle ['..state.IdleMode..'], '..defenseString..
	'Kiting: '..on_off_names[state.Kiting])

	eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function job_precast(spell, action, spellMap, eventArgs)
	if spell.type == 'Cure' then
		refine_cure(spell, action, spellMap, eventArgs)
	end
refine_various_spells(spell, action, spellMap, eventArgs)	
end

-- Function to get the custom class to use for nukes.
function get_nuke_class(spell, action, spellMap)
	if Impact[spell.english] then
		return 'Impact'
	end
end

function customize_idle_set(idleSet)
	if player.tp > 2950 then
	idleSet = set_combine(idleSet, sets.TPdown)
	end
	if player.mpp < 51 then
		idleSet = set_combine(idleSet, sets.latent_refresh)
	end
	state.Buff["Mana Wall"] = buffactive["Mana Wall"] or false
  if state.Buff["Mana Wall"] then
    idleSet = set_combine(idleSet, sets.idle.PDT)
  end
	return idleSet
end

function refine_various_spells(spell, action, spellMap, eventArgs)
	aspirs = S{'Aspir','Aspir II','Aspir III'}
	sleeps = S{'Sleep II','Sleep'}
	banish = S{'Banish II','Banish'}
	sleepgas = S{'Sleepga II','Sleepga'}
	nukes = S{'Fire', 'Blizzard', 'Aero', 'Stone', 'Thunder', 'Water',
	'Fire II', 'Blizzard II', 'Aero II', 'Stone II', 'Thunder II', 'Water II',
	'Fire III', 'Blizzard III', 'Aero III', 'Stone III', 'Thunder III', 'Water III',
	'Fire IV', 'Blizzard IV', 'Aero IV', 'Stone IV', 'Thunder IV', 'Water IV',
	'Fire V', 'Blizzard V', 'Aero V', 'Stone V', 'Thunder V', 'Water V',
	'Fire VI', 'Blizzard VI', 'Aero VI', 'Stone VI', 'Thunder VI', 'Water VI',
	'Firaga', 'Blizzaga', 'Aeroga', 'Stonega', 'Thundaga', 'Waterga',
	'Firaga II', 'Blizzaga II', 'Aeroga II', 'Stonega II', 'Thundaga II', 'Waterga II',
	'Firaga III', 'Blizzaga III', 'Aeroga III', 'Stonega III', 'Thundaga III', 'Waterga III',	
	'Firaja', 'Blizzaja', 'Aeroja', 'Stoneja', 'Thundaja', 'Waterja',
	}

	if not sleepgas:contains(spell.english) and not banish:contains(spell.english) and not sleeps:contains(spell.english) and not aspirs:contains(spell.english) and not nukes:contains(spell.english) then
		return
	end

	local newSpell = spell.english
	local spell_recasts = windower.ffxi.get_spell_recasts()
	local cancelling = 'All '..spell.english..' spells are on cooldown. Cancelling spell casting.'

	if spell_recasts[spell.recast_id] > 0 then
		if aspirs:contains(spell.english) then
			if spell.english == 'Aspir' then
				add_to_chat(122,cancelling)
				eventArgs.cancel = true
			return
			elseif spell.english == 'Aspir II' then
				newSpell = 'Aspir'
			elseif spell.english == 'Aspir III' then
				newSpell = 'Aspir II'
			end 
		elseif sleeps:contains(spell.english) then
			if spell.english == 'Sleep' then
				add_to_chat(122,cancelling)
				eventArgs.cancel = true
			return
			elseif spell.english == 'Sleep II' then
				newSpell = 'Sleep'
			end
		elseif sleepgas:contains(spell.english) then
			if spell.english == 'Sleepga' then
				add_to_chat(122,cancelling)
				eventArgs.cancel = true
				return
			elseif spell.english == 'Sleepga II' then
				newSpell = 'Sleepga'
			end
		elseif nukes:contains(spell.english) then	
			if spell.english == 'Fire' then
				eventArgs.cancel = true
				return
			elseif spell.english == 'Fire VI' then
				newSpell = 'Fire V'
			elseif spell.english == 'Fire IV' then
				newSpell = 'Fire III'	
			elseif spell.english == 'Fire II' then
				newSpell = 'Fire'
			elseif spell.english == 'Firaja' then
				newSpell = 'Firaga III'
			elseif spell.english == 'Firaga II' then
				newSpell = 'Firaga'
			end 
			if spell.english == 'Blizzard' then
				eventArgs.cancel = true
				return
			elseif spell.english == 'Blizzard VI' then
				newSpell = 'Blizzard V'
			elseif spell.english == 'Blizzard IV' then
				newSpell = 'Blizzard III'	
			elseif spell.english == 'Blizzard II' then
				newSpell = 'Blizzard'
			elseif spell.english == 'Blizzaja' then
				newSpell = 'Blizzaga III'
			elseif spell.english == 'Blizzaga II' then
				newSpell = 'Blizzaga'	
			end 
			if spell.english == 'Aero' then
				eventArgs.cancel = true
				return
			elseif spell.english == 'Aero VI' then
				newSpell = 'Aero V'
			elseif spell.english == 'Aero IV' then
				newSpell = 'Aero III'	
			elseif spell.english == 'Aero II' then
				newSpell = 'Aero'
			elseif spell.english == 'Aeroja' then
				newSpell = 'Aeroga III'
			elseif spell.english == 'Aeroga II' then
				newSpell = 'Aeroga'	
			end 
			if spell.english == 'Stone' then
				eventArgs.cancel = true
				return
			elseif spell.english == 'Stone VI' then
				newSpell = 'Stone V'
			elseif spell.english == 'Stone IV' then
				newSpell = 'Stone III'	
			elseif spell.english == 'Stone II' then
				newSpell = 'Stone'
			elseif spell.english == 'Stoneja' then
				newSpell = 'Stonega III'
			elseif spell.english == 'Stonega II' then
				newSpell = 'Stonega'	
			end 
			if spell.english == 'Thunder' then
				eventArgs.cancel = true
				return
			elseif spell.english == 'Thunder VI' then
				newSpell = 'Thunder V'
			elseif spell.english == 'Thunder IV' then
				newSpell = 'Thunder III'	
			elseif spell.english == 'Thunder II' then
				newSpell = 'Thunder'
			elseif spell.english == 'Thundaja' then
				newSpell = 'Thundaga III'
			elseif spell.english == 'Thundaga II' then
				newSpell = 'Thundaga'	
			end 
			if spell.english == 'Water' then
				eventArgs.cancel = true
				return
			elseif spell.english == 'Water VI' then
				newSpell = 'Water V'
			elseif spell.english == 'Water IV' then
				newSpell = 'Water III'	
			elseif spell.english == 'Water II' then
				newSpell = 'Water'
			elseif spell.english == 'Waterja' then
				newSpell = 'Waterga III'
			elseif spell.english == 'Waterga II' then
				newSpell = 'Waterga'	
			end 
			if spell.english == 'Flare' then
                add_to_chat(122,cancelling)
                eventArgs.cancel = true
                return
            elseif spell.english == 'Flare II' then
                newSpell = 'Flare'
            end
					elseif banish:contains(spell.english) then
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

function job_self_command(cmdParams, eventArgs)
if cmdParams[1] == 'buffWatcher' then
	  buffWatch(cmdParams[2],cmdParams[3])
  end
  if cmdParams[1] == 'stopBuffWatcher' then
	  stopBuffWatcher()
  end
end
