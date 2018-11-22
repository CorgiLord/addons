-- **Ganno's DRK lua** --
-- ** I Use Some of Motenten's Functions ** --
 
function get_sets()
    send_command('bind ^f4 gs c C10') -- Toggle off Dark Seal
	send_command('bind f11 gs c C6') -- Toggle Idle Mode
	send_command('bind f10 gs c C7') -- Toggle PDT Mode
	send_command('bind f9 gs c C17') -- Toggle Weapon
	send_command('bind f12 gs c C1') -- Toggle accu mode
	send_command('bind ^f9 gs c C3') -- Toggle twilight
    AccIndex = 1
    AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid/Stun. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below. Most of These Sets Are Empty So You Need To Edit Them On Your Own. Remember To Check What The Combined Set Is For Each Sets. --
    WeaponIndex = 1
    WeaponArray = {"Caladbolg","Anguta","Apocalypse","Ragnarok"} -- Default Main Weapon Is Liberator. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
    IdleIndex = 1
    IdleArray = {"Normal","Regen","Refresh","Regain"} -- Default Idle Set Is Movement --
    DarkSealIndex = 0 --Index for Dark Seal headpiece Potency(0) vs Duration(1)
    add_to_chat(158,'DarkSeal Potency: [On]')
    Armor = 'None'
    Twilight = 'None'
    Attack = 'OFF' -- Set Default WS Attack Set ON or OFF Here --
    Rancor = 'ON' -- Set Default Rancor ON or OFF Here --
    Samurai_Roll = 'ON' -- Set Default SAM Roll ON or OFF Here --
    target_distance = 5 -- Set Default Distance Here --
    select_default_macro_book() -- Change Default Macro Book At The End --
	
	-- add here to the ws list those you want moonshade on when less than 3000tp
    moonshade_WS = S{"Resolution", "Torcleaver", "Cross Reaper", "Quietus", "Entropy", "Insurgency", "Savage Blade", "Vorpal Blade", "Requiescat", "Sanguine Blade"}

 
    sets.Idle = {           ammo="staunch tathlum +1",
							body="Lugra Cloak +1",
							hands="Sulev. Gauntlets +2",
							legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}},
							feet="Sulev. Leggings +2",
							neck="Bathy Choker +1",
							waist="Flume Belt +1",
							left_ear="Odnowa Earring +1",
							right_ear="Etiolation Earring",
							left_ring="Defending Ring",
							right_ring="Moonlight Ring",
							back="Moonlight Cape",}
	sets.Idle.Liberator = set_combine(sets.Idle,{
            main="Liberator"})
    sets.Idle.Liberator.SAM = set_combine(sets.Idle,{
            main="Liberator"})
    sets.Idle.Ragnarok = set_combine(sets.Idle,{
            main="Ragnarok"})
    sets.Idle.Ragnarok.SAM = set_combine(sets.Idle,{
            main="Ragnarok"})
    sets.Idle.Caladbolg = set_combine(sets.Idle,{
            main="Caladbolg"})
    sets.Idle.Caladbolg.SAM = set_combine(sets.Idle,{
            main="Caladbolg"})
    sets.Idle.Apocalypse = set_combine(sets.Idle,{
            main="Apocalypse"})
    sets.Idle.Apocalypse.SAM = set_combine(sets.Idle,{
            main="Apocalypse"})
    sets.Idle.Anguta = set_combine(sets.Idle,{
            main="Anguta"})
    sets.Idle.Anguta.SAM = set_combine(sets.Idle,{
            main="Anguta"})
	sets.Idle.Vampirism = set_combine(sets.Idle,{
            main="Vampirism"})
	sets.Idle.Loxoticmace = set_combine(sets.Idle,{
            main="Loxotic mace"})
	
    -- Regen Set --
    sets.Idle.Regen = {
                            ammo="staunch tathlum +1",
                            neck="bathy choker +1 +1",
                            ear1="Infused Earring",
        					ear2="Genmei Earring",
        					body="Lugra Cloak +1",
                            hands="Sulevia's gauntlets +2",
                            ring1="Stikini Ring +1 +1",
                            ring2="Paguroidea Ring",
                            back="Moonlight cape",
                            waist="Flume Belt",
                            legs="Carmine cuisses +1",
                            feet="Flamma Gambieras +1"}
    sets.Idle.Regen.Liberator = set_combine(sets.Idle.Regen,{
            main="Liberator"})
    sets.Idle.Regen.Liberator.SAM = set_combine(sets.Idle.Regen,{
            main="Liberator"})
    sets.Idle.Regen.Ragnarok = set_combine(sets.Idle.Regen,{
            main="Ragnarok"})
    sets.Idle.Regen.Ragnarok.SAM = set_combine(sets.Idle.Regen,{
            main="Ragnarok"})
    sets.Idle.Regen.Caladbolg = set_combine(sets.Idle.Regen,{
            main="Caladbolg"})
    sets.Idle.Regen.Caladbolg.SAM = set_combine(sets.Idle.Regen,{
            main="Caladbolg"})
    sets.Idle.Regen.Apocalypse = set_combine(sets.Idle.Regen,{
            main="Apocalypse"})
    sets.Idle.Regen.Apocalypse.SAM = set_combine(sets.Idle.Regen,{
            main="Apocalypse"})
    sets.Idle.Regen.Anguta = set_combine(sets.Idle.Regen,{
            main="Anguta"})
    sets.Idle.Regen.Anguta.SAM = set_combine(sets.Idle.Regen,{
            main="Anguta"})
 
    -- Movement Sets --
    sets.Idle.Movement = set_combine(sets.Idle.Regen,{
            legs="Carmine Cuisses +1"})
    sets.Idle.Movement.Liberator = set_combine(sets.Idle.Movement,{
            main="Liberator"})
    sets.Idle.Movement.Liberator.SAM = set_combine(sets.Idle.Movement,{
            main="Liberator"})
    sets.Idle.Movement.Ragnarok = set_combine(sets.Idle.Movement,{
            main="Ragnarok"})
    sets.Idle.Movement.Ragnarok.SAM = set_combine(sets.Idle.Movement,{
            main="Ragnarok"})
    sets.Idle.Movement.Caladbolg = set_combine(sets.Idle.Movement,{
            main="Caladbolg"})
    sets.Idle.Movement.Caladbolg.SAM = set_combine(sets.Idle.Movement,{
            main="Caladbolg"})
    sets.Idle.Movement.Apocalypse = set_combine(sets.Idle.Movement,{
            main="Apocalypse"})
    sets.Idle.Movement.Apocalypse.SAM = set_combine(sets.Idle.Movement,{
            main="Apocalypse"})
    sets.Idle.Movement.Anguta = set_combine(sets.Idle.Movement,{
            main="Anguta"})
    sets.Idle.Movement.Anguta.SAM = set_combine(sets.Idle.Movement,{
            main="Anguta"})
 
    -- Refresh Sets --
    sets.Idle.Refresh = set_combine(sets.Idle.Regen,{
            neck="Bale choker",
            body="Lugra Cloak +1",})
    sets.Idle.Refresh.Liberator = set_combine(sets.Idle.Refresh,{
            main="Liberator"})
    sets.Idle.Refresh.Liberator.SAM = set_combine(sets.Idle.Refresh,{
            main="Liberator"})
    sets.Idle.Refresh.Ragnarok = set_combine(sets.Idle.Refresh,{
            main="Ragnarok"})
    sets.Idle.Refresh.Ragnarok.SAM = set_combine(sets.Idle.Refresh,{
            main="Ragnarok"})
    sets.Idle.Refresh.Caladbolg = set_combine(sets.Idle.Refresh,{
            main="Caladbolg"})
    sets.Idle.Refresh.Caladbolg.SAM = set_combine(sets.Idle.Refresh,{
            main="Caladbolg"})
    sets.Idle.Refresh.Apocalypse = set_combine(sets.Idle.Refresh,{
            main="Apocalypse"})
    sets.Idle.Refresh.Apocalypse.SAM = set_combine(sets.Idle.Refresh,{
            main="Apocalypse"})
    sets.Idle.Refresh.Anguta = set_combine(sets.Idle.Refresh,{
            main="Anguta"})
    sets.Idle.Refresh.Anguta.SAM = set_combine(sets.Idle.Refresh,{
            main="Anguta"})
           
    -- Regain Sets --
    sets.Idle.Regain = set_combine(sets.Idle.Regen,{
            head="Valorous Mask",
			body="Sulevia's Platemail +2",
			neck="Vim Torque +1",
            ring2="Roller's Ring",})
    sets.Idle.Regain.Liberator = set_combine(sets.Idle.Regain,{
            main="Liberator"})
    sets.Idle.Regain.Liberator.SAM = set_combine(sets.Idle.Regain,{
            main="Liberator"})
    sets.Idle.Regain.Ragnarok = set_combine(sets.Idle.Regain,{
            main="Ragnarok"})
    sets.Idle.Regain.Ragnarok.SAM = set_combine(sets.Idle.Regain,{
            main="Ragnarok"})
    sets.Idle.Regain.Caladbolg = set_combine(sets.Idle.Regain,{
            main="Caladbolg"})
    sets.Idle.Regain.Caladbolg.SAM = set_combine(sets.Idle.Regain,{
            main="Caladbolg"})
    sets.Idle.Regain.Apocalypse = set_combine(sets.Idle.Regain,{
            main="Apocalypse"})
    sets.Idle.Regain.Apocalypse.SAM = set_combine(sets.Idle.Regain,{
            main="Apocalypse"})
    sets.Idle.Regain.Anguta = set_combine(sets.Idle.Regain,{
            main="Anguta"})
    sets.Idle.Regain.Anguta.SAM = set_combine(sets.Idle.Regain,{
            main="Anguta"})
 
    sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}
 
    -- TP Base Set --
    sets.TP ={ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body={ name="Argosy Hauberk +1", augments={'STR+12','Attack+20','"Store TP"+6',}},
    hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
    legs={ name="Odyssean Cuisses", augments={'"Store TP"+6','STR+5','Accuracy+7',}},
    feet={ name="Argosy Sollerets +1", augments={'HP+65','"Dbl.Atk."+3','"Store TP"+5',}},
    neck="Abyssal Beads +2",
    waist="Ioskeha Belt",
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Regal Ring",
    right_ring="Flamma Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}}
   
    
    -- Catastrophe Sets --
    sets.WS = {
							ammo="Knobkierrie",
							head="Ynglinga Sallet",
							body={ name="Argosy Hauberk +1", augments={'STR+12','Attack+20','"Store TP"+6',}},
							hands="Flam. Manopolas +2",
							legs={ name="Odyssean Cuisses", augments={'"Mag.Atk.Bns."+15','"Dbl.Atk."+3','VIT+4',}},
							feet="Sulev. Leggings +2",
							neck="Fotia Gorget",
							waist="Fotia Belt",
							left_ear="Ishvara Earring",
							right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
							left_ring="Regal Ring",
							right_ring="Flamma Ring",
							}
    
 
    
 
    -- Entropy Sets --
    sets.WS.Entropy = {
                            ammo="Seething Bomblet +1",
							head="Ratri Sallet +1",
							body="Ignominy Cuirass +3",
							hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
							legs="Ig. Flanchard +3",
							feet={ name="Argosy Sollerets +1", augments={'STR+12','DEX+12','Attack+20',}},
							neck="Fotia Gorget",
							waist="Fotia Belt",
							left_ear="Telos Earring",
							right_ear="Abyssal Earring",
							left_ring="Niqmaddu Ring",
							right_ring="Regal Ring",
							back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},}
    
                           
    -- CrossReaper Sets --
    sets.WS.CrossReaper = {ammo="Seething Bomblet +1",
							head="Ratri Sallet +1",
							body="Ignominy Cuirass +3",
							hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
							legs="Ig. Flanchard +3",
							feet={ name="Argosy Sollerets +1", augments={'STR+12','DEX+12','Attack+20',}},
							neck="Fotia Gorget",
							waist="Fotia Belt",
							left_ear="Telos Earring",
							right_ear="Abyssal Earring",
							left_ring="Niqmaddu Ring",
							right_ring="Regal Ring",
							back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},}
                               
 
    
 
    -- JA Sets --
    sets.JA = {}
    sets.JA["Blood Weapon"] = {body="Fallen's Cuirass +1"}
    sets.JA["Diabolic Eye"] = {hands="Fall. Fin. Gaunt. +1"}
    sets.JA["Weapon Bash"] = {hands="Ignominy Gauntlets +2"}
    sets.JA["Nether Void"] = {legs="Heath. Flanchard +1"}
    sets.JA['Arcane Circle'] = {feet="Ignominy Sollerets +3"}
    sets.JA["Last Resort"] = {back="Ankou's Mantle",feet="Fall. Sollerets"}
	sets.JA["Souleater"] = {head="Ignominy Burgonet +3"}
 
 
	sets.Doom = {waist="Gishdubar sash",ring1="Saida Ring",ring2="Saida Ring"}
	
    -- Waltz Set --
    sets.Waltz = {}
 
    sets.Precast = {}
    -- Fastcast Set --
    sets.Precast.FastCast = {
							ammo="Impatiens",
							head="Carmine Mask +1",
							body="Kubira Meikogai",
							
							right_ear="Loquac. Earring",
							left_ring="Prolix Ring",
							right_ring="Kishar Ring",
							}
 
 	sets.Precast.FastCast.Impact = set_combine(sets.Precast.FastCast, {head=empty,body="Twilight Cloak"})
	
    -- Midcast Base Set --
	
	sets.Midcast = {
                            }
							
							
    sets.Midcast.Impact = {
							ammo="Ginsen",
							body="Twilight Cloak",
							hands="Argosy Mufflers +1",
							legs={ name="Odyssean Cuisses", augments={'Attack+19','"Store TP"+7','Accuracy+15',}},
							feet="Heathen's Sollerets +1",
							neck="Combatant's Torque",
							waist="Oneiros Rope",
							left_ear="Telos Earring",
							right_ear="Dedition Earring",
							left_ring="Chirich Ring",
							right_ring="Rajas Ring",
							back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},}
 
    -- Dark Magic Set --
    sets.Midcast['Dark Magic'] = {
							ammo="pemphredo tathlum",
							head="Ig. Burgonet +3",
							body={ name="Carm. Scale Mail", augments={'MP+60','INT+10','MND+10',}},
							hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
							legs="Heath. Flanchard +1",
							feet="ratri sollerets +1",
							neck="Erra Pendant",
							waist="Eschan Stone",
							left_ear="Abyssal Earring",
							right_ear="Loquac. Earring",
							left_ring="Kishar Ring",
							right_ring="Evanescence Ring",
							 back={ name="Niht Mantle", augments={'Attack+7','Dark magic skill +9','"Drain" and "Aspir" potency +24','Weapon skill damage +3%',}},}
	
	sets.Midcast['Drain'] = {
							ammo="pemphredo tathlum",
							head="Pixie hairpin +1",
							body={ name="Carm. Scale Mail", augments={'MP+60','INT+10','MND+10',}},
							hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
							legs="Eschite Cuisses",
							feet="ratri sollerets +1",
							neck="Erra Pendant",
							waist="Austerity belt +1",
							left_ear="Abyssal Earring",
							right_ear="Hirudinea Earring",
							left_ring="Archon Ring",
							right_ring="Evanescence Ring",
							back={ name="Niht Mantle", augments={'Attack+7','Dark magic skill +9','"Drain" and "Aspir" potency +24','Weapon skill damage +3%',}},}
							
	sets.Midcast['Drain III'] = {
							ammo="pemphredo tathlum",
							head={ name="Fall. Burgeonet +1", augments={'Enhances "Dark Seal" effect',}},
							body={ name="Carm. Scale Mail", augments={'MP+60','INT+10','MND+10',}},
							hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
							legs="Eschite Cuisses",
							feet="ratri sollerets +1",
							neck="Erra Pendant",
							waist="Austerity belt +1",
							left_ear="Abyssal Earring",
							right_ear="Hirudinea Earring",
							left_ring="Archon Ring",
							right_ring="Evanescence Ring",
							back={ name="Niht Mantle", augments={'Attack+7','Dark magic skill +9','"Drain" and "Aspir" potency +24','Weapon skill damage +3%',}},}						
							
	sets.Midcast['Aspir'] = {
							ammo="pemphredo tathlum",
							head={ name="Fall. Burgeonet +1", augments={'Enhances "Dark Seal" effect',}},
							body={ name="Carm. Scale Mail", augments={'MP+60','INT+10','MND+10',}},
							hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
							legs="Eschite Cuisses",
							feet="ratri sollerets +1",
							neck="Erra Pendant",
							waist="Austerity belt +1",
							left_ear="Abyssal Earring",
							right_ear="Hirudinea Earring",
							left_ring="Archon Ring",
							right_ring="Evanescence Ring",
							back={ name="Niht Mantle", augments={'Attack+7','Dark magic skill +9','"Drain" and "Aspir" potency +24','Weapon skill damage +3%',}},}
													
    -- Absorb Set --
    sets.Midcast.Absorb = {
							ammo="pemphredo tathlum",
							head="Ig. Burgonet +3",
							body={ name="Carm. Scale Mail", augments={'MP+60','INT+10','MND+10',}},
							hands="Pavor Gauntlets",
							legs="Heath. Flanchard +1",
							feet="ratri sollerets +1",
							neck="Erra Pendant",
							waist="Oneiros Rope",
							left_ear="Abyssal Earring",
							right_ear="Psystorm Earring",
							left_ring="Kishar Ring",
							right_ring="Evanescence Ring",
							back="Chuparrosa Mantle",}
    sets.Midcast.Absorb.HighACC = set_combine(sets.Midcast.Absorb,{
                            hands="Leyline Gloves",
							feet="Ignominy sollerets +3",
                            back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},})
    -- Absorb-TP Set --
    sets.Midcast['Absorb-TP'] = set_combine(sets.Midcast.Absorb,{
							hands="Heathen's Gauntlets +1",
							})
 
    -- Stun Sets --
    sets.Midcast.Stun = {
                            ammo="pemphredo tathlum",
                            head="Ig. Burgonet +3",
                            body={ name="Carm. Scale Mail", augments={'MP+60','INT+10','MND+10',}},
                            hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
                            legs="Heath. Flanchard +1",
                            feet="ratri sollerets +1",
                            neck="Erra Pendant",
                            waist="Eschan Stone",
                            left_ear="Abyssal Earring",
                            right_ear="Loquac. Earring",
                            left_ring="Archon Ring",
                            right_ring="Kishar Ring",
                            back={ name="Niht Mantle", augments={'Attack+7','Dark magic skill +9','"Drain" and "Aspir" potency +24','Weapon skill damage +3%',}},}
    sets.Midcast.Stun.MidACC = set_combine(sets.Midcast.Stun,{})
    sets.Midcast.Stun.HighACC = set_combine(sets.Midcast.Stun.MidACC,{})
 
    -- Endark Set --
    sets.Midcast.Endark2 = {
							ammo="pemphredo tathlum",
							head="Ig. Burgonet +3",
							body={ name="Carm. Scale Mail", augments={'MP+60','INT+10','MND+10',}},
							hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
							legs="Heath. Flanchard +1",
							feet="ratri sollerets +1",
							neck="Erra Pendant",
							waist="Fotia Belt",
							left_ear="Abyssal Earring",
							right_ear="Loquac. Earring",
							left_ring="Archon Ring",
							right_ring="Kishar Ring",
							back={ name="Niht Mantle", augments={'Attack+7','Dark magic skill +9','"Drain" and "Aspir" potency +24','Weapon skill damage +3%',}},}
 
    -- Enfeebling Magic Set --
    sets.Midcast['Enfeebling Magic'] = {
							ammo="pemphredo tathlum",
							head="Ig. Burgonet +3",
							body="Ignominy Cuirass +3",
							hands="Ig. Gauntlets +2",
							legs="Ig. Flanchard +3",
							feet="Flam. Gambieras +1",
							neck="Weike Torque",
							waist="Eschan Stone",
							left_ear="Psystorm Earring",
							right_ear="Lifestorm Earring",
							left_ring="Stikini Ring +1",
							right_ring="Stikini Ring +1",
							back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+13 /Mag. Dmg.+13','"Fast Cast"+10',}},}
 
    -- Elemental Magic Set --
    sets.Midcast['Elemental Magic'] = {
							ammo="pemphredo tathlum",
							head={ name="Jumalik Helm", augments={'MND+6','Magic burst dmg.+5%',}},
							body={ name="Found. Breastplate", augments={'Accuracy+4','Mag. Acc.+2',}},
							hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
							legs="Eschite Cuisses",
							feet="Flam. Gambieras +1",
							neck="Eddy Necklace",
							waist="Eschan Stone",
							left_ear="Friomisi Earring",
							right_ear="Strophadic Earring",
							left_ring="Stikini Ring +1",
							right_ring="Stikini Ring +1",
							back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+13 /Mag. Dmg.+13','"Fast Cast"+10',}},}
 
    -- Dread Spikes Set --
    sets.Midcast['Dread Spikes'] = {
							ammo="Egoist's Tathlum",
							head="Ratri Sallet +1",
							body="Heathen's Cuirass +1",
							hands="Ratri Gadlings +1",
							legs="Ratri cuisses",
							feet="ratri sollerets +1",
							neck="dualism collar +1",
							waist="Oneiros Belt",
							left_ear="Odnowa Earring +1",
							right_ear="Cassie Earring",
							left_ring="Moonlight Ring",
							right_ring="Moonlight Ring",
							back="Moonlight Cape",}
							
	sets.MAXDrain = {
							main="misanthropy",
    						ammo="pemphredo tathlum",
							head={ name="Fall. Burgeonet +1", augments={'Enhances "Dark Seal" effect',}},
							body={ name="Carm. Scale Mail", augments={'MP+60','INT+10','MND+10',}},
							hands={ name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}},
							legs="Eschite Cuisses",
							feet="ratri sollerets +1",
							neck="Erra Pendant",
							waist="Eschan Stone",
							left_ear="Abyssal Earring",
							right_ear="Hirudinea Earring",
							left_ring="Archon Ring",
							right_ring="Evanescence Ring",
							back={ name="Niht Mantle", augments={'Attack+7','Dark magic skill +9','"Drain" and "Aspir" potency +24','Weapon skill damage +3%',}},}						

	sets.SE = {head="Ignominy Burgonet +3"}
	
end

function user_unload()
    send_command('unbind f1')
    send_command('unbind f2')
	send_command('unbind f3')
end
 
function pretarget(spell,action)
	if spell.action_type == 'Magic' then
		if spell.english == "Impact" then
				equip(sets.Precast.FastCast.Impact)
			else
                equip(sets.Precast.FastCast)
		end
	end	
    if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
        cancel_spell()
        send_command('input /item "Echo Drops" <me>')
    elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
        cancel_spell()
        send_command('Aggressor')
    elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
        cancel_spell()
        send_command('ThirdEye')
    elseif spell.english == "Meditate" and player.tp > 2900 then -- Cancel Meditate If TP Is Above 2900 --
        cancel_spell()
        add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')
    elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
        cancel_spell()
        add_to_chat(123, spell.name..' Canceled: [Out of Range]')
        return
    elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
        if spell.english == "Light Arts" and not buffactive['Addendum: White'] then
            cancel_spell()
            send_command('input /ja Addendum: White <me>')
        elseif spell.english == "Manifestation" then
            cancel_spell()
            send_command('input /ja Accession <me>')
        elseif spell.english == "Alacrity" then
            cancel_spell()
            send_command('input /ja Celerity <me>')
        elseif spell.english == "Parsimony" then
            cancel_spell()
            send_command('input /ja Penury <me>')
        end
    elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
        if spell.english == "Dark Arts" and not buffactive['Addendum: Black'] then
            cancel_spell()
            send_command('input /ja Addendum: Black <me>')
        elseif spell.english == "Accession" then
            cancel_spell()
            send_command('input /ja Manifestation <me>')
        elseif spell.english == "Celerity" then
            cancel_spell()
            send_command('input /ja Alacrity <me>')
        elseif spell.english == "Penury" then
            cancel_spell()
            send_command('input /ja Parsimony <me>')
        end
    end
end
 
function precast(spell,action)
refine_various_spells(spell, action, spellMap, eventArgs)
	if spell.type == "WeaponSkill" then
            equipSet = sets.WS
            if equipSet[spell.english] then
                equipSet = equipSet[spell.english]
            end
            if Attack == 'ON' then
                equipSet = equipSet["ATT"]
            end
            if equipSet[AccArray[AccIndex]] then
                equipSet = equipSet[AccArray[AccIndex]]
            end
            if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
                equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
            end
            if world.time <= (7*60) or world.time >= (17*60) then -- 3000 TP or Sekkanoki: Equip Lugra Earring +1 From Dusk To Dawn --
                    equipSet = set_combine(equipSet,{ear1="Lugra Earring +1",ear2="Lugra Earring"})            end
			if (spell.english == "Entropy" or spell.english == "Torcleaver" or spell.english == "Ground Strike" or spell.english == "Shockwave" or spell.english == "Cross Reaper" or spell.english == "Guillotine" or spell.english == "Resolution" or spell.english == "Insurgency") and (player.tp < 2750 or buffactive.Sekkanoki) then
            equipSet = set_combine(equipSet,{ear2="Moonshade Earring"})
			end
            equip(equipSet)
 
		elseif spell.type == "JobAbility" then
        if sets.JA[spell.english] then
            equip(sets.JA[spell.english])
        end
		elseif spell.action_type == 'Magic' then
			if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
            cancel_spell()
            add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
            return
        else
            if spell.english == "Stun" then
                if buffactive.Hasso or buffactive.Seigan then -- Cancel Hasso or Seigan When You Use Stun --
                    cast_delay(0.2)
                    send_command('cancel Hasso,Seigan')
                end
                equip(sets.Precast.FastCast)
			elseif spell.english == "Impact" then
				equip(sets.Precast.FastCast.Impact)
			elseif buffactive['Dark Seal'] and buffactive['Nether Void'] and S{"Drain II","Drain III"}:contains(spell.english) and player.tp<500 and not buffactive["Aftermath: Lv.3"] then
			equip(sets.MAXDrain)
			add_to_chat(100,'WARNING: Misanthropy is on now ***** manually remove it after Drain3 ******************')
            elseif spell.english == 'Utsusemi: Ni' then
                if buffactive['Copy Image (3)'] then
                    cancel_spell()
                    add_to_chat(123, spell.name .. ' Canceled: [3 Images]')
                    return
                else
                    equip(sets.Precast.FastCast)
                end
            elseif sets.Precast[spell.skill] then
                equip(sets.Precast[spell.skill])
            else
                equip(sets.Precast.FastCast)
            end
        end
    elseif spell.type == "Waltz" then
        refine_waltz(spell,action)
        equip(sets.Waltz)
    elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
        cast_delay(0.2)
        send_command('cancel Sneak')
    end
    if Twilight == 'Twilight' then
        equip(sets.Twilight)
    end
end
 
function midcast(spell,action)
    equipSet = {}
    if spell.action_type == 'Magic' then
        equipSet = sets.Midcast
        if spell.english:startswith('Absorb') and spell.english ~= "Absorb-TP" then
            equipSet = sets.Midcast.Absorb
			    if equipSet[AccArray[AccIndex]] then
                equipSet = equipSet[AccArray[AccIndex]]
				end
        elseif spell.english == "Drain" or spell.english == "Drain II" or spell.english:startswith('Bio') then
            if world.day == "Darksday" or world.weather_element == "Dark" then -- Equip Hachirin-no-Obi On Darksday or Dark Weather --
                equipSet = set_combine(equipSet,{waist="Hachirin-no-Obi"})
            end
            equipSet = sets.Midcast['Drain']
		elseif spell.english:startswith('Aspir') then
            if world.day == "Darksday" or world.weather_element == "Dark" then -- Equip Hachirin-no-Obi On Darksday or Dark Weather --
                equipSet = set_combine(equipSet,{waist="Hachirin-no-Obi"})
            end
            equipSet = sets.Midcast['Aspir']
		elseif buffactive['Dark Seal'] and buffactive['Nether Void'] and S{"Drain II","Drain III"}:contains(spell.english) and player.tp<500 then
			equipSet = sets.MAXDrain
			add_to_chat(100,'WARNING: Misanthropy is on now ***** manually remove it after Drain3 ******************')
        elseif spell.english == "Stoneskin" then
            if buffactive.Stoneskin then
                send_command('@wait 1.7;cancel stoneskin')
            end
            equipSet = equipSet.Stoneskin
        elseif spell.english == "Sneak" then
            if spell.target.name == player.name and buffactive['Sneak'] then
                send_command('cancel sneak')
            end
            equipSet = equipSet.Haste
        elseif spell.english:startswith('Utsusemi') then
            if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
                send_command('@wait 1.7;cancel Copy Image*')
            end
            equipSet = equipSet.Haste
        elseif spell.english == 'Monomi: Ichi' then
            if buffactive['Sneak'] then
                send_command('@wait 1.7;cancel sneak')
            end
            equipSet = equipSet.Haste
        elseif spell.english:startswith('Endark') then
            equipSet = sets.Midcast.Endark2
		else
            if equipSet[spell.english] then
                equipSet = equipSet[spell.english]
            end
            if equipSet[AccArray[AccIndex]] then
                equipSet = equipSet[AccArray[AccIndex]]
            end
            if equipSet[spell.skill] then
                equipSet = equipSet[spell.skill]
            end
            if equipSet[spell.type] then
                equipSet = equipSet[spell.type]
            end
        end
    elseif equipSet[spell.english] then
        equipSet = equipSet[spell.english]
    end
    if buffactive["Dark Seal"] and DarkSealIndex==0 then -- Equip Aug'd Fall. Burgeonet +1 When You Have Dark Seal Up --
                    equipSet = set_combine(equipSet,{head="Fall. Burgeonet +1"})
    end
    equip(equipSet)
	if Twilight == 'Twilight' then
        equip(sets.Twilight)
    end
end

function aftercast(spell,action)
 
		if spell.type == "WeaponSkill" then
            send_command('wait 0.2;gs c TP')
        elseif spell.english == "Arcane Circle" then -- Arcane Circle Countdown --
            send_command('wait 260;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..': [OFF]')
        elseif spell.english == "Sleep II" then -- Sleep II Countdown --
			send_command('timers c "Sleep II" 90 down spells/00259.png')
            send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
        elseif spell.english == "Sleep" then -- Sleep Countdown --
			send_command('timers c "Sleep" 60 down spells/00253.png')
            send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
        elseif spell.english == 'Break' then
		send_command('timers c "Break" 30 down spells/00255.png')
		send_command('wait 15;input /echo Break Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Break Effect: [WEARING OFF IN 5 SEC.]')
		end
        status_change(player.status)
		if Twilight == 'Twilight' then
        equip(sets.Twilight)
    end
    end
   
 
function status_change(new,old)
--    check_equip_lock()
    if Armor == 'PDT' then
        equip(sets.PDT)
    elseif Armor == 'MDT' then
        equip(sets.MDT)
    elseif Armor == 'Scarlet' then
        equip(sets.Scarlet)
    elseif new == 'Engaged' then
        equipSet = sets.TP
        if Armor == 'Hybrid' and equipSet["Hybrid"] then
            equipSet = equipSet["Hybrid"]
        end
        if equipSet[WeaponArray[WeaponIndex]] then
            equipSet = equipSet[WeaponArray[WeaponIndex]]
        end
        if equipSet[player.sub_job] then
            equipSet = equipSet[player.sub_job]
        end
        if equipSet[AccArray[AccIndex]] then
            equipSet = equipSet[AccArray[AccIndex]]
        end
        if buffactive["Aftermath: Lv.3"] and equipSet["AM3"] then
                if buffactive["Last Resort"] and ((buffactive.Haste and buffactive.March == 2) or (buffactive.Embrava and (buffactive.March == 2 or (buffactive.March and buffactive.Haste) or (buffactive.March and buffactive['Mighty Guard']) or (buffactive['Mighty Guard'] and buffactive.Haste))) or (buffactive[580] and (buffactive.March or buffactive.Haste or buffactive.Embrava or buffactive['Mighty Guard']))) and equipSet["HighHaste"] then
                    equipSet = equipSet["AM3_HighHaste"]
                elseif Rancor == 'ON' then -- Default Rancor Toggle Is Rancorous Mantle --
                    equipSet = set_combine(equipSet["AM3"],sets.TP.Rancor)
                else -- Use Rancor Toggle For Atheling Mantle --
                    equipSet = equipSet["AM3"]
                end
        end
        if buffactive.Aftermath and equipSet["AM"] then
            equipSet = equipSet["AM"]
        end
        if buffactive["Last Resort"] and ((buffactive.Haste and buffactive.March == 2) or (buffactive.Embrava and (buffactive.March == 2 or (buffactive.March and buffactive.Haste) or (buffactive.March and buffactive['Mighty Guard']) or (buffactive['Mighty Guard'] and buffactive.Haste))) or (buffactive[580] and (buffactive.March or buffactive.Haste or buffactive.Embrava or buffactive['Mighty Guard']))) and equipSet["HighHaste"] then
            equipSet = equipSet["HighHaste"]
        end
        if buffactive.Ionis and equipSet["Ionis"] then
            equipSet = equipSet["Ionis"]
        end
        if buffactive["Samurai Roll"] and equipSet["STP"] and Samurai_Roll == 'ON' then
            equipSet = equipSet["STP"]
        end
        equip(equipSet)
    else
        equipSet = sets.Idle
        if equipSet[IdleArray[IdleIndex]] then
            equipSet = equipSet[IdleArray[IdleIndex]]
        end
        if equipSet[WeaponArray[WeaponIndex]] then
            equipSet = equipSet[WeaponArray[WeaponIndex]]
        end
        if equipSet[player.sub_job] then
            equipSet = equipSet[player.sub_job]
        end
        if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
            equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
        end
		if world.area:endswith('Adoulin') then
            equipSet = set_combine(equipSet,{body="Councilor's Garb"})
        end
        equip(equipSet)
    end
    if Twilight == 'Twilight' then
        equip(sets.Twilight)
    end
end
 
function buff_change(buff,gain)
	-- Init a new eventArgs
	local eventArgs = {handled = false}

	-- Allow jobs to handle buff change events.
	if job_buff_change then
		job_buff_change(buff, gain, eventArgs)
	end

	-- Allow a global function (ie: UserGlobals.lua) to be called on buff change,
	-- if the individual job didn't mark it as handled.
	if not eventArgs.handled then
		if user_buff_change then
			user_buff_change(buff, gain, eventArgs)
		end
	end
	if buff =="terror" or buff =="petrification" or buff =="stun" and gain then
        equip(sets.PDT)
		elseif buff == "sleep" and gain and player.hp > 200 then -- Equip Berserker's Torque When You Are Asleep & Have 200+ HP --
        equip({neck="Berserker's Torque"})
		else
        if not midaction() then
            status_change(player.status)
        end
	end
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
        if gain then
            send_command('timers create "Aftermath: Lv.3" 180 down;wait 150;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 15;input /echo Aftermath: Lv.3 [WEARING OFF IN 15 SEC.];wait 5;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
        else
            send_command('timers delete "Aftermath: Lv.3"')
            add_to_chat(123,'AM3: [OFF]')
        end
		elseif buff == 'weakness' then -- Weakness Timer --
        if gain then
            send_command('timers create "Weakness" 300 up')
        else
            send_command('timers delete "Weakness"')
        end
	end
	if buffactive['Souleater'] then
        equip(sets.SE)
        disable('Head')
        add_to_chat(100,'WARNING: SOUL EATER HEAD ON ONLY.')
		else
        enable('Head')
	end
	if buffactive['Arcane Circle'] then
        equip(sets.AC)
        disable('Body')
        add_to_chat(100,'WARNING: Arcane Circle BODY ON ONLY.')
		else
        enable('Body')
	end
	if buff == "doom" then
        if gain then           
            equip(sets.Doom)
            send_command('@input /p Doomed please cursna.')
            send_command('@input /item "Holy Water" <me>')
            disable('ring1','ring2','waist','legs')
        else
            enable('ring1','ring2','waist','legs')
            handle_equipping_gear(player.status)
        end
    end
end
 
-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
    if command == 'C1' then -- Accuracy Level Toggle --
        AccIndex = (AccIndex % #AccArray) + 1
        status_change(player.status)
        add_to_chat(158,'Accuracy Level: '..AccArray[AccIndex])
    elseif command == 'C17' then -- Main Weapon Toggle --
        WeaponIndex = (WeaponIndex % #WeaponArray) + 1
        add_to_chat(158,'Main Weapon: '..WeaponArray[WeaponIndex])
        status_change(player.status)
    elseif command == 'C5' then -- Auto Update Gear Toggle --
        status_change(player.status)
        add_to_chat(158,'Auto Update Gear')
    elseif command == 'C2' then -- Hybrid Toggle --
        if Armor == 'Hybrid' then
            Armor = 'None'
            add_to_chat(123,'Hybrid Set: [Unlocked]')
        else
            Armor = 'Hybrid'
            add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
        end
        status_change(player.status)
        elseif command == 'C10' then -- DarkSeal Toggle --
        if DarkSealIndex == 1 then
                        DarkSealIndex = 0
                        add_to_chat(158,'DarkSeal Duration: [On]')
        else
                        DarkSealIndex = 1
                        add_to_chat(158,'DarkSeal Potency: [On]')
        end
        status_change(player.status)
    elseif command == 'C7' then -- PDT Toggle --
        if Armor == 'PDT' then
            Armor = 'None'
            add_to_chat(123,'PDT Set: [Unlocked]')
        else
            Armor = 'PDT'
            add_to_chat(158,'PDT Set: [Locked]')
        end
        status_change(player.status)
    elseif command == 'C15' then -- MDT Toggle --
        if Armor == 'MDT' then
            Armor = 'None'
            add_to_chat(123,'MDT Set: [Unlocked]')
        else
            Armor = 'MDT'
            add_to_chat(158,'MDT Set: [Locked]')
        end
        status_change(player.status)
    elseif command == 'C9' then -- Scarlet Toggle --
        if Armor == 'Scarlet' then
            Armor = 'None'
            add_to_chat(123,'Scarlet Set: [Unlocked]')
        else
            Armor = 'Scarlet'
            add_to_chat(158,'Scarlet Set: [Locked]')
        end
        status_change(player.status)
    elseif command == 'C16' then -- Rancor Toggle --
        if Rancor == 'ON' then
            Rancor = 'OFF'
            add_to_chat(123,'Rancor: [OFF]')
        else
            Rancor = 'ON'
            add_to_chat(158,'Rancor: [ON]')
        end
        status_change(player.status)
    elseif command == 'C' then -- Attack Toggle --
        if Attack == 'ON' then
            Attack = 'OFF'
            add_to_chat(123,'Attack: [OFF]')
        else
            Attack = 'ON'
            add_to_chat(158,'Attack: [ON]')
        end
        status_change(player.status)
    elseif command == 'C3' then -- Twilight Toggle --
        if Twilight == 'Twilight' then
            Twilight = 'None'
            add_to_chat(123,'Twilight Set: [Unlocked]')
        else
            Twilight = 'Twilight'
            add_to_chat(158,'Twilight Set: [locked]')
        end
        status_change(player.status)
    elseif command == 'C8' then -- Distance Toggle --
        if player.target.distance then
            target_distance = math.floor(player.target.distance*10)/10
            add_to_chat(158,'Distance: '..target_distance)
        else
            add_to_chat(123,'No Target Selected')
        end
    elseif command == 'C6' then -- Idle Toggle --
        IdleIndex = (IdleIndex % #IdleArray) + 1
        status_change(player.status)
        add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
    elseif command == 'TP' then
        add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
    elseif command:match('^SC%d$') then
        send_command('//' .. sc_map[command])
    end
end
 
function handle_equipping_gear(playerStatus, petStatus)
	-- init a new eventArgs
	local eventArgs = {handled = false}

	-- Allow jobs to override this code
	if job_handle_equipping_gear then
		job_handle_equipping_gear(playerStatus, eventArgs)
	end
end

--    if player.hp < 700 then
--        meleeSet = set_combine(meleeSet, sets.PDT)
--    end

 function refine_various_spells(spell, action, spellMap, eventArgs)
	local eventArgs = {handled = false}
    aspirs = S{'Aspir','Aspir II','Aspir III'}
	drains = S{'Drain','Drain II','Drain III'}
    sleeps = S{'Sleep','Sleep II'}
	nukes = S{'Fire', 'Blizzard', 'Aero', 'Stone', 'Thunder', 'Water',
        'Fire II', 'Blizzard II', 'Aero II', 'Stone II', 'Thunder II', 'Water II',
        'Fire III', 'Blizzard III', 'Aero III', 'Stone III', 'Thunder III', 'Water III',}
 
    if not sleeps:contains(spell.english) and not drains:contains(spell.english) and not aspirs:contains(spell.english) and not nukes:contains(spell.english)then
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
            end         
        elseif sleeps:contains(spell.english) then
            if spell.english == 'Sleep' then
                add_to_chat(122,cancelling)
                eventArgs.cancel = true
                return
            elseif spell.english == 'Sleep II' then
                newSpell = 'Sleep'
            end
		elseif drains:contains(spell.english) then
            if spell.english == 'Drain' then
                add_to_chat(122,cancelling)
                eventArgs.cancel = true
                return
            elseif spell.english == 'Drain III' then
                newSpell = 'Drain II'
            elseif spell.english == 'Drain II' then
                newSpell = 'Drain'
			end			
		elseif nukes:contains(spell.english) then	
			if spell.english == 'Fire' then
			   eventArgs.cancel = true
                return
			elseif spell.english == 'Fire III' then
                newSpell = 'Fire II'	
			elseif spell.english == 'Fire II' then
                newSpell = 'Fire'
            end    			
			if spell.english == 'Blizzard' then
			   eventArgs.cancel = true
                return
			elseif spell.english == 'Blizzard III' then
                newSpell = 'Blizzard II'	
			elseif spell.english == 'Blizzard II' then
                newSpell = 'Blizzard'
			end  
			if spell.english == 'Aero' then
			   eventArgs.cancel = true
                return
			elseif spell.english == 'Aero III' then
                newSpell = 'Aero II'	
			elseif spell.english == 'Aero II' then
                newSpell = 'Aero'
			end  	
			if spell.english == 'Stone' then
			   eventArgs.cancel = true
                return
			elseif spell.english == 'Stone III' then
                newSpell = 'Stone II'	
			elseif spell.english == 'Stone II' then
                newSpell = 'Stone'
			end  
			if spell.english == 'Thunder' then
			   eventArgs.cancel = true
                return
			elseif spell.english == 'Thunder III' then
                newSpell = 'Thunder II'	
			elseif spell.english == 'Thunder II' then
                newSpell = 'Thunder'	
			end  
			if spell.english == 'Water' then
			   eventArgs.cancel = true
                return
			elseif spell.english == 'Water III' then
                newSpell = 'Water II'	
			elseif spell.english == 'Water II' then
                newSpell = 'Water'
			end  
        end
    end
  
    if newSpell ~= spell.english then
	    cancel_spell()
        send_command('@input /ma "'..newSpell..'" '..tostring(spell.target.raw))
        eventArgs.cancel = true
        return
    end
end
 
function refine_waltz(spell,action)
    if spell.type ~= 'Waltz' then
        return
    end
 
    if spell.name == "Healing Waltz" or spell.name == "Divine Waltz" then
        return
    end
 
    local newWaltz = spell.english
    local waltzID
 
    local missingHP
 
    if spell.target.type == "SELF" then
        missingHP = player.max_hp - player.hp
    elseif spell.target.isallymember then
        local target = find_player_in_alliance(spell.target.name)
        local est_max_hp = target.hp / (target.hpp/100)
        missingHP = math.floor(est_max_hp - target.hp)
    end
 
    if missingHP ~= nil then
        if player.sub_job == 'DNC' then
            if missingHP < 40 and spell.target.name == player.name then
                add_to_chat(123,'Full HP!')
                cancel_spell()
                return
            elseif missingHP < 150 then
                newWaltz = 'Curing Waltz'
                waltzID = 190
            elseif missingHP < 300 then
                newWaltz = 'Curing Waltz II'
                waltzID = 191
            else
                newWaltz = 'Curing Waltz III'
                waltzID = 192
            end
        else
            return
        end
    end
 
    local waltzTPCost = {['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50}
    local tpCost = waltzTPCost[newWaltz]
 
    local downgrade
 
    if player.tp < tpCost then
 
        if player.tp < 20 then
            add_to_chat(123, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
            cancel_spell()
            return
        elseif player.tp < 35 then
            newWaltz = 'Curing Waltz'
        elseif player.tp < 50 then
            newWaltz = 'Curing Waltz II'
        end
 
        downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
    end
 
    if newWaltz ~= spell.english then
        send_command('@input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
        if downgrade then
            add_to_chat(8, downgrade)
        end
        cancel_spell()
        return
    end
 
    if missingHP > 0 then
        add_to_chat(8,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
    end
end
 
function find_player_in_alliance(name)
    for i,v in ipairs(alliance) do
        for k,p in ipairs(v) do
            if p.name == name then
                return p
            end
        end
    end
end
 
function sub_job_change(newSubjob, oldSubjob)
    select_default_macro_book()
end
 
function set_macro_page(set,book)
    if not tonumber(set) then
        add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
        return
    end
    if set < 1 or set > 10 then
        add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
        return
    end
 
    if book then
        if not tonumber(book) then
            add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
            return
        end
        if book < 1 or book > 20 then
            add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
            return
        end
        send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
    else
        send_command('@input /macro set '..tostring(set))
    end
end
 
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(2, 1)
    elseif player.sub_job == 'SAM' then
        set_macro_page(2, 1)
    else
        set_macro_page(2, 1)
    end
end
--fps = 1
--emergencypdt=0
--windower.register_event('prerender', function()
--    if fps < 50 then
--        fps = fps +1
--    else
--        fps = 1
--    end
--    if fps == 1 then
--        if player.hp < 1500 and emergencypdt == 0 then
--        add_to_chat(123,'Emergency PDT')
--            meleeSet = set_combine(meleeSet, sets.PDT)
--            equip(meleeSet)
--            emergencypdt=1
--        end
--    end
--end)