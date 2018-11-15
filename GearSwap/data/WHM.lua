require 'organizer-lib'
-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

-- Initialization function for this job file.
function get_sets()
	DevoMode=0 --0=devo mode non actif, 1=devomode actif
	mote_include_version = 2
	-- Load and initialize the include file.
	include('Mote-Include.lua')
end

-- Setup vars that are user-independent.
function job_setup()
--include('caster_buffWatcher.lua')

include('common_info.status.lua')
	state.Buff['Afflatus Solace'] = buffactive['afflatus solace'] or false
end


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
	state.OffenseMode:options('None', 'Normal')
	state.CastingMode:options('Normal', 'Eco')
	state.IdleMode:options('Normal', 'PDT', 'Meva')

	send_command('bind NUMPAD1 input /ma "Cure II" <stal>')
	send_command('bind NUMPAD2 input /ma "Cure III" <stal>')
	send_command('bind NUMPAD3 input /ma "Cure IV" <stal>')
	
	send_command('bind ^NUMPAD1 input /ma "Curaga II" <stal>')
	send_command('bind ^NUMPAD2 input /ma "Curaga III" <stal>')
	send_command('bind ^NUMPAD3 input /ma "Curaga IV" <stal>')
	
	send_command('bind !NUMPAD1 input /ma "Regen IV" <stal>')
	send_command('bind !NUMPAD2 input /ja "Martyr" <stal>')
	send_command('bind !NUMPAD3 input /ja "Devotion" <stal>')
	
	send_command('bind NUMPAD4 input /ma "Erase" <stal>')
	send_command('bind NUMPAD5 input /ma "Paralyna" <stal>')
	send_command('bind NUMPAD6 input /ma "Silena" <stal>')
	
	send_command('bind ^NUMPAD4 input /ma "" <me>')
	send_command('bind ^NUMPAD5 input /ma "" <me>')
	send_command('bind ^NUMPAD6 input /ma "" <me>')
	
	send_command('bind !NUMPAD4 input /ma "" <me>')
	send_command('bind !NUMPAD5 input /ma "" <me>')
	send_command('bind !NUMPAD6 input /ma "" <me>')
	
	send_command('bind NUMPAD7 input /ma "Stoneskin" <me>')
	send_command('bind NUMPAD8 input /ma "Protectra V" <me>')
	send_command('bind NUMPAD9 input /ma "Shellra V" <me>')
	
	send_command('bind ^NUMPAD7 input /ja "Divine Caress" <me>')
	send_command('bind ^NUMPAD8 input /ja "Divine Seal" <me>')
	send_command('bind ^NUMPAD9 input /ja "Sacrosanctity" <me>')
	
	send_command('bind !NUMPAD7 input /ma "Arise" <stal>')
	send_command('bind !NUMPAD8 input /ma "Raise" <stal>')
	send_command('bind !NUMPAD9 input /ma "Raise II" <stal>')
	
	-- Default macro set/book
	set_macro_page(1, 3)
end

-- Called when this job file is unloaded (eg: job change)
function file_unload()
	if binds_on_unload then
		binds_on_unload()
	end
end


-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = { 
	main="Grioavolr",
    sub="Clerisy strap",
    ammo="Incantor Stone",
    head="Nahtirah Hat",
    body="Inyanga Jubbah +2",
    hands="Fanatic Gloves",
    legs="Lengo pants",
    feet="Chelona Boots +1", --feet="Regal Pumps +1",
    neck="Orison Locket",
    waist="Witful Belt",
    left_ear="Mendicant's Earring",
    right_ear="Loquac. Earring",
    left_ring="Lebeche Ring",
    right_ring="Kishar Ring",
    back="Alaunus's Cape",
}
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, { waist= "Siegel Sash"})
   
	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {main="Queller Rod",sub="Thuellaic Ecu +1",legs="Ebers Pant. +1"}) --Chanter's Shield

	sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic'] 
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {hands="Carapacho Cuffs",legs="Doyen Pants"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC.HealingMagic, {main="Grioavolr",
    sub="Clerisy strap",
    ammo="Incantor Stone",
    head="Theophany cap +1",
    body="Inyanga Jubbah +2",
    hands="Vanya Cuffs",
    legs="Lengo pants",
    feet="Chelona Boots +1",
    neck="Orison Locket",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring="Kishar Ring",
    back="Alaunus's Cape",
})

	sets.precast.FC.Curaga = sets.precast.FC.Cure
	-- Precast sets to enhance JAs
	sets.precast.JA.Benediction = {
	main="Queller Rod",
    sub="Ammurapi Shield",
    ammo="Strobilus",
    head="Pixie Hairpin +1",
    body={ name="Weather. Robe +1", augments={'MP+120',}},
    hands={ name="Otomi Gloves", augments={'HP+30','MP+30','MP+30',}},
    legs="Inyanga Shalwar +2",
    feet="Theo. Duckbills +3",
    neck="Dualism Collar +1",
    waist="Shinjutsu-no-Obi +1",
    left_ear="Etiolation Earring",
    right_ear="Influx Earring",
    left_ring="Mephitas's Ring +1",
    right_ring="Mephitas's Ring",
    back="Fi Follet Cape +1",}
	
	sets.precast.JA.Devotion = {
		main="Serenity",
		sub="Clerisy strap",
		ammo="Incantor Stone",
		head={ name="Piety Cap +1", augments={'Enhances "Devotion" effect',}},
		body="Ros. Jaseran +1",
		hands={ name="Telchine Gloves", augments={'Potency of "Cure" effect received+6%','Enh. Mag. eff. dur. +10',}},
		legs={ name="Piety Pantaln. +1", augments={'Enhances "Shellra V" effect',}},
		feet="Theo. Duckbills +3",
		neck="Dualism Collar +1",
		waist="Gishdubar Sash",
		left_ear="Etiolation Earring",
		right_ear="Mendi. Earring",
		left_ring="K'ayres Ring",
		right_ring="Kunaji Ring",
		back="Solemnity cape",
		}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {ear2="Roundel Earring"}
	
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	gear.default.weaponskill_neck = "fotia gorget"
	gear.default.weaponskill_waist = "fotia belt"
	sets.precast.WS = {}
	
	sets.precast.WS['Mystic Boon'] = {
    main="Queller Rod",
    sub="Genbu\'s Shield",
    ammo="Quartz Tathlum +1",
    head="Befouled Crown",
    body="Inyanga Jubbah +2",
    hands="Inyan. Dastanas +2",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+11 "Mag.Atk.Bns."+11','MND+7','Mag. Acc.+14',}},
    feet="Inyan. Crackows +2",
    neck="Sanctity Necklace",
    waist="Olseni Belt",
    left_ear="Moonshade Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%',}},
}
	

	-- Midcast Sets
	
	sets.midcast.FastRecast = {
	main="Queller Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Theo. Briault +1",
    hands="Fanatic Gloves",
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet="Medium's Sabots",
    neck="Nodens Gorget",
    waist="Gishdubar Sash",
    left_ear="Gifted Earring",
    right_ear="Mendicant's Earring",
    left_ring="Lebeche Ring",
    right_ring="Kishar Ring",
    back="Solemnity Cape",
}
	
	-- Cure sets
	gear.default.obi_waist = ""
	gear.default.obi_back = ""

	sets.midcast.CureSolace = {
    main="Queller Rod",
    sub="Thuellaic Ecu +1",
    ammo="Pemphredo Tathlum",
    head="Kaykaus Mitra +1",
    body="Theo. Briault +1",
    hands="Theophany Mitts +1",
    legs="Ebers Pant. +1",
    feet="Kaykaus Boots +1",
    neck="Nodens Gorget",
    waist="Austerity Belt +1",
    left_ear="Glorious Earring",
    right_ear="Gifted Earring",
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
    back="Alaunus's Cape",
}
	sets.midcast.CureSolace.Eco = {
    main={ name="Queller Rod", augments={'MP+80','"Cure" potency +15%','Enmity-5',}},
    sub="Thuellaic Ecu +1",
    ammo="Pemphredo Tathlum",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body="Theo. Briault +1",
    hands="Theophany Mitts +1",
    legs="Ebers Pant. +1",
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck="Nodens Gorget",
    waist="Austerity Belt +1",
    left_ear="Glorious Earring",
    right_ear="Gifted Earring",
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%',}},
}
	sets.midcast.Cure = {
    main="Queller Rod",
    sub="Thuellaic Ecu +1",
    ammo="Pemphredo Tathlum",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body="Theo. Briault +1",
    hands="Theophany Mitts +1",
    legs="Ebers Pant. +1",
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck="Nodens Gorget",
    waist="Austerity Belt +1",
    left_ear="Glorious Earring",
    right_ear="Gifted Earring",
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",
}

	sets.midcast.Cure.Eco = {
    main={ name="Queller Rod", augments={'MP+80','"Cure" potency +15%','Enmity-5',}},
    sub="Thuellaic Ecu +1",
    ammo="Pemphredo Tathlum",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body="Theo. Briault +1",
    hands="Theophany Mitts +3",
    legs="Ebers Pant. +1",
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck="Nodens Gorget",
    waist="Austerity Belt +1",
    left_ear="Glorious Earring",
    right_ear="Gifted Earring",
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",
}
	
	sets.midcast.Curaga = {
    main="Queller Rod",
    sub="Thuellaic Ecu +1",
    ammo="Pemphredo Tathlum",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body="Theo. Briault +1",
    hands="Theophany Mitts +3",
    legs="Ebers Pant. +1",
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck="Nodens Gorget",
    waist="Austerity Belt +1",
    left_ear="Glorious Earring",
    right_ear="Gifted Earring",
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",
}

	sets.midcast.Curaga.Eco = {
    main="Queller Rod",
     sub="Thuellaic Ecu +1",
    ammo="Pemphredo Tathlum",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body="Theo. Briault +1",
    hands="Theophany Mitts +3",
    legs="Ebers Pant. +1",
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck="Nodens Gorget",
    waist="Austerity Belt +1",
    left_ear="Glorious Earring",
    right_ear="Gifted Earring",
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",
}

	sets.self_healing = {
	main="Queller Rod",
    sub="Thuellaic Ecu +1",
    ammo="Pemphredo Tathlum",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body="Ebers Bliaud +1",
    hands="Theophany Mitts +3",
    legs={ name="Telchine Braconi", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck="Phalaina Locket",
    waist="Gishdubar Sash",
    left_ear="Glorious Earring",
    right_ear="Gifted Earring",
    left_ring="Asklepian Ring",
    right_ring="Kunaji Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%',}},
}
	sets.self_healing.Eco = {
	main="Queller Rod",
    sub="Thuellaic Ecu +1",
    ammo="Pemphredo Tathlum",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body="Ebers Bliaud +1",
    hands="Theophany Mitts +3",
    legs={ name="Telchine Braconi", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck="Phalaina Locket",
    waist="Gishdubar Sash",
    left_ear="Glorious Earring",
    right_ear="Gifted Earring",
    left_ring="Asklepian Ring",
    right_ring="Kunaji Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%',}},
}
	
	sets.midcast.CureMelee = {
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaud +1",
    hands="Theophany Mitts +3",
    legs="Ebers Pant. +1",
    feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
    neck="Phalaina Locket",
    waist="Austerity Belt +1",
    left_ear="Nourish. Earring +1",
    right_ear="Mendi. Earring",
    left_ring="Defending Ring",
    right_ring="Lebeche Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%',}},
}

	sets.midcast.Erase = {main="Queller Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Theo. Briault +1",
    hands="Fanatic Gloves",
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet="Medium's Sabots",
    neck="Cleric's Torque",
    waist="Gishdubar Sash",
    left_ear="Gifted Earring",
    right_ear="Mendicant's Earring",
    left_ring="Lebeche Ring",
    right_ring="Kishar Ring",
    back="Solemnity Cape",
}

	sets.midcast.Cursna = {main="Queller Rod",
	sub="Thuellaic ecu +1",
    ammo="Incantor Stone",
    head="Ebers Cap +1",
    body="Ebers Bliaud +1",
    hands="Fanatic Gloves",
    legs="Theo. Pant. +3",
    feet="Vanya Clogs",
    neck="Debilis Medallion",
    waist="Gishdubar Sash",
    left_ear="Gifted Earring",
    right_ear="Mendicant's Earring",
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    back="Alaunus's Cape",
}

	sets.midcast.Paralyna = {
    main="Queller Rod",
    sub="Genbu\'s Shield",
    ammo="Incantor Stone",
    head="Befouled Crown",
    body="Ros. Jaseran +1",
    hands="Chironic Gloves",
    legs="Lengo pants",
    feet="Theo. Duckbills +3",
    neck="Twilight Torque",
    waist="Emphatikos Rope",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Evanescence Ring",
    back="Solemnity Cape",
}

	sets.midcast.Arise = {
    main="Queller Rod",
    sub="Thuellaic Ecu +1",
    ammo="Incantor Stone",
    head="Adhara Turban",
    body="Ros. Jaseran +1",
    hands="Chironic Gloves",
    legs="Aya. Cosciales +2",
    feet="Theo. Duckbills +3",
    neck="Nodens Gorget",
    waist="Cetl Belt",
    left_ear="Mendi. Earring",
    right_ear="Gifted Earring",
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",
}
	
	sets.midcast.Raise = {
    main="Queller Rod",
    sub="Thuellaic Ecu +1",
    ammo="Incantor Stone",
    head="Adhara Turban",
    body="Ros. Jaseran +1",
    hands="Chironic Gloves",
    legs="Aya. Cosciales +2",
    feet="Theo. Duckbills +3",
    neck="Nodens Gorget",
    waist="Cetl Belt",
    left_ear="Mendi. Earring",
    right_ear="Gifted Earring",
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",
}

	sets.midcast.Reraise = {
    main="Queller Rod",
    sub="Thuellaic Ecu +1",
    ammo="Incantor Stone",
    head="Adhara Turban",
    body="Ros. Jaseran +1",
    hands="Chironic Gloves",
    legs="Aya. Cosciales +2",
    feet="Theo. Duckbills +3",
    neck="Nodens Gorget",
    waist="Cetl Belt",
    left_ear="Mendi. Earring",
    right_ear="Gifted Earring",
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",
}

	sets.midcast.StatusRemoval = {main="Queller Rod",
	sub="Thuellaic ecu +1",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +1",
    body="Witching Robe",
    hands="Fanatic Gloves",
    legs="Ebers Pant. +1",
    feet="Medium's Sabots",
    neck="Nodens Gorget",
    waist="Austerity Belt +1",
    left_ear="Gifted Earring",
    right_ear="Mendicant's Earring",
    back="Fi Follet Cape +1",
}

	sets.midcast['Enhancing Magic'] = {
	main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','"Mag.Atk.Bns."+7',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Potency of "Cure" effect received+6%','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},
    feet="Theo. Duckbills +3",
    neck="Nodens Gorget",
    waist="Gishdubar Sash",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -6%',}},
    back="Fi Follet Cape +1",
}

	sets.midcast.Haste = sets.midcast['Enhancing Magic']
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {waist="Gishdubar Sash", back="Grapevine Cape"})
	
	sets.midcast.Shell = {
	main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','"Mag.Atk.Bns."+7',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Potency of "Cure" effect received+6%','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},
    feet="Theo. Duckbills +3",
    neck="Nodens Gorget",
    waist="Gishdubar Sash",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Defending Ring",
    right_ring="Sheltered Ring",
    back="Fi Follet Cape +1",
}

	sets.midcast.Protect = {
	main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','"Mag.Atk.Bns."+7',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Potency of "Cure" effect received+6%','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},
    feet="Theo. Duckbills +3",
    neck="Nodens Gorget",
    waist="Gishdubar Sash",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Defending Ring",
    right_ring="Sheltered Ring",
    back="Fi Follet Cape +1",
}

	sets.midcast.Stoneskin = {
	main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','"Mag.Atk.Bns."+7',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Potency of "Cure" effect received+6%','Enh. Mag. eff. dur. +10',}},
    legs="Shedir Seraweels",
    feet="Theo. Duckbills +3",
    neck="Stone Gorget",
    waist="Siegel Sash",
    left_ear="Gifted Earring",
    right_ear="Earthcry Earring",
    back="Fi Follet Cape +1",
}
	
	sets.midcast.Aquaveil = {
	main="Vadose Rod",
    sub="Ammurapi Shield",
    ammo="Incantor Stone",
    head="chironic hat",
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Potency of "Cure" effect received+6%','Enh. Mag. eff. dur. +10',}},
    legs="Shedir Seraweels",
    feet="Theo. Duckbills +3",
    neck="Nodens Gorget",
    waist="Emphatikos Rope",
    left_ear="Gifted Earring",
    right_ear="Mendicant's Earring",
    back="Fi Follet Cape +1",
	left_ring="Defending Ring",
    right_ring="Evanescence Ring",
}

	sets.midcast.Auspice = {
	main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','"Mag.Atk.Bns."+7',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Witching Robe",
    hands={ name="Telchine Gloves", augments={'Potency of "Cure" effect received+6%','Enh. Mag. eff. dur. +10',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet="Ebers Duckbills +1",
    neck="Nodens Gorget",
    waist="Austerity Belt +1",
    left_ear="Gifted Earring",
    right_ear="Mendicant's Earring",
    back="Fi Follet Cape +1",
}

	sets.midcast.BarElement = {main="Beneficus",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +1",
    body="Ebers Bliaud +1",
    hands="Ebers Mitts +1",
    legs="Piety Pantaloons +1",
    feet="Ebers Duckbills +1",
    neck="Nodens Gorget",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Mendicant's Earring",
    left_ring="Defending Ring",
    right_ring="Dark Ring",
    back="Fi Follet Cape +1",
}

	sets.midcast.Regen = {main="Bolelabunga",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Inyanga Tiara +2",
    body={ name="Piety Briault +1", augments={'Enhances "Benediction" effect',}},
    hands="Ebers Mitts +1",
    legs="Theo. Pant. +3",
    feet="Theo. Duckbills +3",
    neck="Nodens Gorget",
    waist="Austerity Belt +1",
    left_ear="Gifted Earring",
    right_ear="Mendicant's Earring",
    back="Fi Follet Cape +1",
}

	sets.midcast.Protectra = {main="Queller Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Potency of "Cure" effect received+6%','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}},
    feet="Piety Duckbills +1",
    neck="Nodens Gorget",
    waist="Gishdubar Sash",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Defending Ring",
    right_ring="Sheltered Ring",
    back="Fi Follet Cape +1",
}

	sets.midcast.Shellra = {main="Queller Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Potency of "Cure" effect received+6%','Enh. Mag. eff. dur. +10',}},
    legs="Piety Pantaloons +1",
    feet="Theo. Duckbills +3",
    neck="Nodens Gorget",
    waist="Gishdubar Sash",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Defending Ring",
    right_ring="Sheltered Ring",
    back="Fi Follet Cape +1",
}


	sets.midcast['Divine Magic'] = {hands="Fanatic Gloves",}

	sets.midcast['Dark Magic'] = {}

	--sets.midcast.Stun = set_combine(sets.midcast.DarkMagic, {main=gear.RecastStaff})

	-- Custom spell classes
	sets.midcast['Enfeebling Magic'] = {
	main={ name="Gada", augments={'"Cure" potency +8%','STR+12','Mag. Acc.+20','"Mag.Atk.Bns."+14','DMG:+15',}},
    sub="Ammurapi Shield",
	ammo="Quartz Tathlum +1",
    head="Befouled Crown",
    body="Theo. Briault +1",
    hands="Inyanga Dastanas +2",
    legs="Chironic Hose",
    feet="Theo. Duckbills +3",
    neck="Nodens Gorget",
    waist="Rumination Sash",
    left_ear="Regal Earring",
    right_ear="Enfeebling Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Altruistic Cape",
}
	sets.midcast.MndEnfeebles = {
    main={ name="Gada", augments={'"Cure" potency +8%','STR+12','Mag. Acc.+20','"Mag.Atk.Bns."+14','DMG:+15',}},
    sub="Ammurapi Shield",
    ammo="Quartz Tathlum +1",
    head="Befouled Crown",
    body="Theo. Briault +1",
    hands="Inyan. Dastanas +2",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+11 "Mag.Atk.Bns."+11','MND+7','Mag. Acc.+14',}},
    feet="Theo. Duckbills +3",
    neck="Nodens Gorget",
    waist="Rumination Sash",
    left_ear="Regal Earring",
    right_ear="Enfeebling Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Altruistic Cape",
}

	sets.midcast.IntEnfeebles = {
    main={ name="Gada", augments={'"Cure" potency +8%','STR+12','Mag. Acc.+20','"Mag.Atk.Bns."+14','DMG:+15',}},
    sub="Ammurapi Shield",
    ammo="Quartz Tathlum +1",
    head="Befouled Crown",
    body="Theo. Briault +1",
    hands="Inyan. Dastanas +2",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+11 "Mag.Atk.Bns."+11','MND+7','Mag. Acc.+14',}},
    feet="Theo. Duckbills +3",
    neck="Nodens Gorget",
    waist="Rumination Sash",
    left_ear="Regal Earring",
    right_ear="Enfeebling Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Altruistic Cape",
}

	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Boonwell Staff", sub="Oneiros Grip"}
	

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {
	main="Queller Rod",
    sub="Genbu\'s Shield",
    ammo="Staunch Tathlum",
    head="Inyanga Jubbah +2",
    body="Theo. Briault +1",
    hands="Inyanga Dastanas +2",
    legs="Assid. Pants +1",
    feet="Chironic Slippers",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Inyanga Ring",
    back="Solemnity cape",}

	sets.idle.Meva = {
    main="Queller Rod",
    sub="Genbu\'s Shield",
    ammo="Staunch Tathlum",
    head="Inyanga Tiara +2",
    body="Inyanga Jubbah +2",
    hands="Inyan. Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Chironic Slippers",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Inyanga Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%',}},
}
	sets.idle.PDT = {main="Queller Rod",
    sub="Genbu\'s Shield",
    ammo="Staunch Tathlum",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Vrikodara Jupon",
    hands="Inyanga Dastanas +2",
    legs="Ayanmo Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Twilight Torque",
    waist="Rumination Sash",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -6%',}},
    back="Moonlight cape",
}

	sets.idle.Town = {main="Queller Rod",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum",
    head="Befouled Crown",
    body={ name="Witching Robe", augments={'MP+50','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
    hands="Inyanga Dastanas +2",
    legs="Assid. Pants +1",
    feet="Crier's Gaiters",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Dim. Ring (Holla)",
    right_ring="Warp ring",
    back="Moonlight cape",
}
	
	sets.idle.Weak = {main="Queller Rod",
    sub="Genbu\'s Shield",
    ammo="Staunch Tathlum",
    head="Befouled Crown",
    body={ name="Witching Robe", augments={'MP+50','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
    hands="Inyanga Dastanas +2",
    legs="Assid. Pants +1",
    feet="Crier's Gaiters",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Inyanga Ring",
    back="Moonlight cape",}
	
	sets.Owleyes = {main={ name="Queller Rod", augments={'MP+80','"Cure" potency +15%','Enmity-5',}},
    sub="Genbu\'s Shield",
    ammo="Staunch Tathlum",
    head="Befouled Crown",
    body={ name="Witching Robe", augments={'MP+50','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
    hands="Inyanga Dastanas +2",
    legs="Assid. Pants +1",
    feet="Crier's Gaiters",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -6%',}},
    back="Moonlight cape",}
	
	-- Defense sets

	sets.defense.PDT = {}

	sets.defense.MDT = {}

	sets.Kiting = {feet="crier's gaiters"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Basic set for if no TP weapon is defined.
	sets.engaged = {
    main="Queller Rod",
    sub="Genbu\'s Shield",
    ammo="Hasty Pinion +1",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Combatant's Torque",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Mache Earring +1",
    left_ring="K'ayres Ring",
    right_ring="Rajas Ring",
    back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}


	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Divine Caress'] = {hands="Ebers mitts +1", back="Mending Cape"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	classes.CustomClass = get_spell_class(spell, action, spellMap)

	if spell.english == "Paralyna" and buffactive.Paralyzed then
		-- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
		eventArgs.handled = true
	end
	
	
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		-- Default base equipment layer of fast recast.
		equip(sets.midcast.FastRecast)
	end
	if spellMap == 'Cure' and spell.target.type == 'SELF' and sets.self_healing then
        equip(sets.self_healing)
    end
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
		if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
        if world.weather_element == 'Light' or world.day_element == 'Light' then
            equip({waist="Hachirin-No-Obi"})
            add_to_chat(8,'----- Obi Equipped. -----')
        end
    end
	
end


function job_post_midcast(spell, action, spellMap, eventArgs)

    if spellMap == 'Cure' and spell.target.type == 'SELF' and sets.self_healing then
        equip(sets.self_healing)
    end
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
		if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
        if world.weather_element == 'Light' or world.day_element == 'Light' then
            equip({waist="Hachirin-No-Obi"})
            add_to_chat(8,'----- Obi Equipped. -----')
        end
    end
end


-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)
	if not spell.interrupted then
		if state.Buff[spell.name] ~= nil then
			state.Buff[spell.name] = true
		elseif spell.name == "Afflatus Misery" then
			state.Buff['Afflatus Solace'] = false
		end
	end
end


-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------

function customize_idle_set(idleSet)
	if player.mpp < 90 and state.IdleMode == "Normal" and state.Defense.Active == false then
		idleSet = set_combine(idleSet, sets.Owleyes)
	end
	
	return idleSet
end


-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	--if state.Buff[buff] ~= nil then
	--	state.Buff[buff] = gain
	--end
	--	for index,value in pairs(buffWatcher.watchList) do
   -- if index==buff then
    --  buffWatch()
    --  break
    --end
--end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
	if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
		local needsArts = 
			player.sub_job:lower() == 'sch' and
			not buffactive['Light Arts'] and
			not buffactive['Addendum: White'] and
			not buffactive['Dark Arts'] and
			not buffactive['Addendum: Black']
			
		if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
			if needsArts then
				send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
			else
				send_command('@input /ja "Afflatus Solace" <me>')
			end
		end
	end
end


-- Handle notifications of general user state change.
function job_state_change(stateField, newValue)
	if stateField == 'Offense Mode' then
		if newValue == 'Normal' then
			disable('main','sub')
		else
			enable('main','sub')
		end
	elseif stateField == 'Reset' then
		if state.OffenseMode == 'None' then
			enable('main','sub')
		end
	end
end


-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
	local defenseString = ''
	if state.Defense.Active then
		local defMode = state.Defense.PhysicalMode
		if state.Defense.Type == 'Magical' then
			defMode = state.Defense.MagicalMode
		end

		defenseString = 'Defense: '..state.Defense.Type..' '..defMode..', '
	end
	
	local meleeString = ''
	if state.OffenseMode == 'Normal' then
		meleeString = 'Melee: Weapons locked, '
	end

	add_to_chat(122,'Casting ['..state.CastingMode..'], '..meleeString..'Idle ['..state.IdleMode..'], '..defenseString..
		'Kiting: '..on_off_names[state.Kiting])

	eventArgs.handled = true
end

function job_self_command(cmdParams, eventArgs)
if cmdParams[1]=="switch" and  cmdParams[2]=="mode" and cmdParams[3] == "devotion" then
        if(DevoMode==0) then
            add_to_chat(123, "Mode DEVOTION active, desactivation des switch stuff jusqu'a activation de devotion")
            equip(sets.precast.JA.Devotion)
            turnswitch('off')
            DevoMode=1
        else
            add_to_chat(123, "Mode DEVOTION deja actif, on le desactive pour repermettre le switch de stuff")
            turnswitch('on')
            DevoMode=0
        end
    end
if cmdParams[1] == 'buffWatcher' then
	  buffWatch(cmdParams[2],cmdParams[3])
  end
  if cmdParams[1] == 'stopBuffWatcher' then
	  stopBuffWatcher()
  end	
end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function get_spell_class(spell, action, spellMap)
	local spellclass
	
	if spell.action_type == 'Magic' then
		if spell.skill == "EnfeeblingMagic" then
			if spell.type == "WhiteMagic" then
				spellclass = "MndEnfeebles"
			else
				spellclass = "IntEnfeebles"
			end
		else
			if spellMap == 'Cure' and state.Buff['Afflatus Solace'] then
				spellclass = "CureSolace"
			elseif (spellMap == 'Cure' or spellMap == "Curaga") and player.status == 'Engaged' and player.equipment.main ~= 'Queller Rod' then
				spellclass = "CureMelee"
			end
		end
	end
	
	return spellclass
end

function turnswitch(flag)
    if(flag=='on') then
        enable('main')
        enable('sub')
        enable('ranged')
        enable('ammo')
        enable('head')
        enable('neck')
        enable('lear')
        enable('rear')
        enable('body')
        enable('hands')
        enable('lring')
        enable('rring')
        enable('back')
        enable('waist')
        enable('legs')
        enable('feet')
    else
        disable('main')
        disable('sub')
        disable('ranged')
        disable('ammo')
        disable('head')
        disable('neck')
        disable('lear')
        disable('rear')
        disable('body')
        disable('hands')
        disable('lring')
        disable('rring')
        disable('back')
        disable('waist')
        disable('legs')
        disable('feet')

    end
end