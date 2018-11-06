-- **Ganno's DRK lua** --
-- ** I Use Some of Motenten's Functions ** --
 
function get_sets()
	send_command('bind f2 gs c C6') -- Toggle Idle Mode
	send_command('bind f1 gs c C7') -- Toggle PDT Mode
	send_command('bind f3 gs c C17') -- Toggle Weapon
    AccIndex = 1
    AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid/Stun. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below. Most of These Sets Are Empty So You Need To Edit Them On Your Own. Remember To Check What The Combined Set Is For Each Sets. --
    WeaponIndex = 1
    WeaponArray = {"Masamune","Dojikiri","Kogarasumaru","Soboro"} -- Default Main Weapon Is Masamune. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
    IdleIndex = 1
    IdleArray = {"Normal","Regen","Refresh","Regain"} -- Default Idle Set Is Movement --
    Armor = 'None'
    Twilight = 'None'
    Attack = 'OFF' -- Set Default WS Attack Set ON or OFF Here --
    Rancor = 'ON' -- Set Default Rancor ON or OFF Here --
    Samurai_Roll = 'ON' -- Set Default SAM Roll ON or OFF Here --
    target_distance = 5 -- Set Default Distance Here --
    select_default_macro_book() -- Change Default Macro Book At The End --
	
	-- add here to the ws list those you want moonshade on when less than 3000tp
    moonshade_WS = S{"Tachi: Fudo","Tachi: Shoha", "Tachi: Gekko", "Tachi: Kasha", "Tachi: Jinpu"}

 
    sets.Idle = {           sub="Utu Grip",
							neck="Bathy Choker +1",
        					ammo="Staunch Tathlum +1",
        					ear1="Infused Earring",
        					ear2="Genmei Earring",
							head="Kendatsuba Jinpachi +1",
        					body="Tartarus Platemail",
        					hands="Sakonji Kote +2",
        					left_ring="Dim. Ring (Holla)",
        					right_ring="Warp Ring",
        					back="Moonlight cape",
        					waist="Flume belt",
							legs="Kendatsuba Hakama +1",
        					feet="Danzo Sune-Ate"}
	sets.Idle.Masamune = set_combine(sets.Idle,{
            main="Masamune"})
    sets.Idle.Masamune.SAM = set_combine(sets.Idle,{
            main="Masamune"})
    sets.Idle.Dojikiri = set_combine(sets.Idle,{
            main="Dojikiri Yasutsuna"})
    sets.Idle.Dojikiri.SAM = set_combine(sets.Idle,{
            main="Dojikiri Yasutsuna"})
    sets.Idle.Kogarasumaru = set_combine(sets.Idle,{
            main="Kogarasumaru"})
    sets.Idle.Kogarasumaru.SAM = set_combine(sets.Idle,{
            main="Kogarasumaru"})
    sets.Idle.Soboro = set_combine(sets.Idle,{
            main="Soboro Sukehiro"})
    sets.Idle.Soboro.SAM = set_combine(sets.Idle,{
            main="Soboro Sukehiro"})			
    -- Regen Set --
    sets.Idle.Regen = {
                            ammo="Staunch Tathlum +1",
                            neck="Bathy Choker +1",
                            ear1="Infused Earring",
        					ear2="Genmei Earring",
							head="Valorous Mask",
        					body="Hiza. Haramaki +2",
                            hands="Sakonji Kote +2",
                            ring1="Sheltered Ring",
                            ring2="Paguroidea Ring",
                            back="Moonlight cape",
                            waist="Flume Belt",
                            legs="Kendatsuba Hakama +1",
                            feet="Flamma Gambieras +2"}
    sets.Idle.Regen.Masamune = set_combine(sets.Idle.Regen,{
            main="Masamune"})
    sets.Idle.Regen.Masamune.SAM = set_combine(sets.Idle.Regen,{
            main="Masamune"})
    sets.Idle.Regen.Dojikiri = set_combine(sets.Idle.Regen,{
            main="Dojikiri Yasutsuna"})
    sets.Idle.Regen.Dojikiri.SAM = set_combine(sets.Idle.Regen,{
            main="Dojikiri Yasutsuna"})
    sets.Idle.Regen.Kogarasumaru = set_combine(sets.Idle.Regen,{
            main="Kogarasumaru"})
    sets.Idle.Regen.Kogarasumaru.SAM = set_combine(sets.Idle.Regen,{
            main="Kogarasumaru"})
	sets.Idle.Regen.Soboro = set_combine(sets.Idle.Regen,{
            main="Soboro Sukehiro"})
    sets.Idle.Regen.Soboro.SAM = set_combine(sets.Idle.Regen,{
            main="Soboro Sukehiro"})		
 
    -- Regain Sets --
    sets.Idle.Regain = set_combine(sets.Idle.Regen,{
            head="Valorous Mask",
			neck="Vim Torque +1",
            ring2="Roller's Ring",})
    sets.Idle.Regain.Masamune = set_combine(sets.Idle.Regain,{
            main="Masamune"})
    sets.Idle.Regain.Masamune.SAM = set_combine(sets.Idle.Regain,{
            main="Masamune"})
    sets.Idle.Regain.Dojikiri = set_combine(sets.Idle.Regain,{
            main="Dojikiri Yasutsuna"})
    sets.Idle.Regain.Dojikiri.SAM = set_combine(sets.Idle.Regain,{
            main="Dojikiri Yasutsuna"})
    sets.Idle.Regain.Kogarasumaru = set_combine(sets.Idle.Regain,{
            main="Kogarasumaru"})
    sets.Idle.Regain.Kogarasumaru.SAM = set_combine(sets.Idle.Regain,{
            main="Kogarasumaru"})
    sets.Idle.Regain.Soboro = set_combine(sets.Idle.Regain,{
            main="Soboro Sukehiro"})
    sets.Idle.Regain.Soboro.SAM = set_combine(sets.Idle.Regain,{
            main="Soboro Sukehiro"})			
 
    sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}
 
    -- TP Base Set --
    sets.TP = {}
   --SAM Roll 2(lucky) =  +86TP (retour TP= 277)
   --SAM Roll 7 = +67TP (retour TP= 258)
   --SAM Roll 11 = +96TP (retour TP= 287)
   --CC SAM Roll 11 = +115TP (retour TP= 306)
    -- Masamune(AM3 Down) TP Sets --
    sets.TP.Masamune = { --1212Accu  271tp/hit
                            main="Masamune",
							sub="Utu Grip",
    						ammo="Ginsen",
    						head="Flam. Zucchetto +2",
    						body={ name="Valorous Mail", augments={'Accuracy+22','"Store TP"+7','AGI+5',}},
    						hands="Wakido Kote +3",
    						legs={ name="Ryuo Hakama +1", augments={'Accuracy+25','"Store TP"+5','Phys. dmg. taken -4',}},
    						feet="Flam. Gambieras +2",
    						neck="Samurai's Nodowa +2",
    						waist="Ioskeha Belt +1",
    						left_ear="Telos Earring",
    						right_ear="Cessance Earring",
    						left_ring="Niqmaddu Ring",
    						right_ring="Hetairoi Ring",
    						back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},}
    sets.TP.Masamune.MidACC = set_combine(sets.TP.Masamune,{
                            legs="Kendatsuba Hakama +1",              
                            ear2="Dignitary's earring",
							ring1="Flamma Ring"})
    sets.TP.Masamune.HighACC = set_combine(sets.TP.Masamune.MidACC,{})
 
 
    -- Masamune(SAM Roll) TP Sets --
    sets.TP.Masamune.STP = {--1167Accu  194tp/hit (sans roll)
							main="Masamune",
							sub="Utu Grip",
	                        ammo="Paeapua",
                            head="Ken. Jinpachi +1",
                            body="Ken. Samue +1",
                            hands="Wakido Kote +3",
                            legs="Ken. Hakama +1",
                            feet="Ken. Sune-Ate +1",
                            neck="Ganesha's Mala",
                            waist="Windbuffet Belt +1",
                            left_ear="Brutal Earring",
                            right_ear="Cessance Earring",
                            left_ring="Niqmaddu Ring",
                            right_ring="Hetairoi Ring",
                            back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
    sets.TP.Masamune.MidACC.STP = {--1201Accu 276tp/hit (sans roll) bon pour Lucky/CCX/XI
                            main="Masamune",
							sub="Utu Grip",
    						ammo="Ginsen",
    						head="Flam. Zucchetto +2",
    						body={ name="Valorous Mail", augments={'Accuracy+22','"Store TP"+7','AGI+5',}},
    						hands="Wakido Kote +3",
    						legs={ name="Ryuo Hakama +1", augments={'Accuracy+25','"Store TP"+5','Phys. dmg. taken -4',}},
    						feet="Flam. Gambieras +2",
    						neck="Samurai's Nodowa +2",
    						waist="Ioskeha Belt +1",
    						left_ear="Telos Earring",
    						right_ear="Cessance Earring",
    						left_ring="Niqmaddu Ring",
    						right_ring="Flamma Ring",
    						back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},}
    sets.TP.Masamune.HighACC.STP = {--1167Accu  241tp/hit (sans roll) bon pour CCXI
							main="Masamune",
    						sub="Utu Grip",
    						ammo="Paeapua",
    						head="Flam. Zucchetto +2",
    						body={ name="Valorous Mail", augments={'Accuracy+22','"Store TP"+7','AGI+5',}},
    						hands="Wakido Kote +3",
    						legs={ name="Ryuo Hakama +1", augments={'Accuracy+25','"Store TP"+5','Phys. dmg. taken -4',}},
    						feet="Ken. Sune-Ate +1",
    						neck="Samurai's Nodowa +2",
    						waist="Ioskeha Belt +1",
    						left_ear="Brutal Earring",
    						right_ear="Cessance Earring",
    						left_ring="Niqmaddu Ring",
    						right_ring="Hetairoi Ring",
    						back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
 
    -- Dojikiri TP Sets --
    sets.TP.Dojikiri = {-- retourTP 222  267tp/hit Accu1289
    						main="Dojikiri Yasutsuna",
    						sub="Utu Grip",
    						ammo="Ginsen",
    						head="Ken. Jinpachi +1",
    						body={ name="Valorous Mail", augments={'Accuracy+22','"Store TP"+7','AGI+5',}},
    						hands="Wakido Kote +3",
    						legs="Ken. Hakama +1",
    						feet="Ken. Sune-Ate +1",
    						neck="Samurai's Nodowa +2",
    						waist="Ioskeha Belt +1",
    						left_ear="Telos Earring",
    						right_ear="Cessance Earring",
    						left_ring="Petrov Ring",
    						right_ring="Niqmaddu Ring",
    						back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},}
							
	sets.TP.Dojikiri.MidACC = {
                            main="Dojikiri Yasutsuna",
                            sub="Utu Grip",
                            ammo="Ginsen",
                            head={ name="Argosy Celata +1", augments={'DEX+12','Accuracy+20','"Dbl.Atk."+3',}},
                            body="Ignominy Cuirass +3",
                            hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
                            legs={ name="Odyssean Cuisses", augments={'Accuracy+19 Attack+19','"Store TP"+6','Accuracy+14',}},
                            feet={ name="Argosy Sollerets +1", augments={'HP+65','"Dbl.Atk."+3','"Store TP"+5',}},
                            neck="Combatant's Torque",
                            waist="Ioskeha Belt +1",
                            left_ear="Telos Earring",
                            right_ear="Cessance Earring",
                            left_ring="Regal Ring",
                            right_ring="Moonlight ring",
                            back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}

    sets.TP.Dojikiri.HighACC = {
                            main="Dojikiri Yasutsuna",
                            sub="Utu Grip",
                            ammo="Seeth. Bomblet +1",
                            head={ name="Argosy Celata +1", augments={'DEX+12','Accuracy+20','"Dbl.Atk."+3',}},
                            body="Ignominy Cuirass +3",
                            hands={ name="Emi. Gauntlets +1", augments={'HP+65','DEX+12','Accuracy+20',}},
                            legs="Ignominy Flanchard +3",
                            feet={ name="Odyssean Greaves", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+3','STR+9','Accuracy+15',}},
                            neck="Combatant's Torque",
                            waist="Ioskeha Belt +1",
                            left_ear="Telos Earring",
                            right_ear="Mache Earring +1",
                            left_ring="Regal Ring",
                            right_ring="Ramuh Ring +1",
                            back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}

    -- Dojikiri(SAM Roll) TP Sets --
    sets.TP.Dojikiri.STP = {--270tp/hit Accu1171
							main="Dojikiri Yasutsuna",
    						sub="Utu Grip",
    						ammo="Ginsen",
    						head="Flam. Zucchetto +2",
    						body={ name="Valorous Mail", augments={'Accuracy+22','"Store TP"+7','AGI+5',}},
    						hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
    						legs={ name="Odyssean Cuisses", augments={'Accuracy+19 Attack+19','"Store TP"+6','Accuracy+14',}},
    						feet={ name="Argosy Sollerets +1", augments={'HP+65','"Dbl.Atk."+3','"Store TP"+5',}},
    						neck="Ganesha's Mala",
    						waist="Windbuffet Belt +1",
    						left_ear="Digni. Earring",
    						right_ear="Telos Earring",
    						left_ring="Petrov Ring",
    						right_ring="Niqmaddu Ring",
    						back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
							
	sets.TP.Dojikiri.MidACC.STP = {
    						main="Dojikiri Yasutsuna",
    						sub="Utu Grip",
    						ammo="Ginsen",
    						head="Sulevia's Mask +2",
    						body={ name="Valorous Mail", augments={'Accuracy+22','"Store TP"+7','AGI+5',}},
    						hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
    						legs={ name="Odyssean Cuisses", augments={'Accuracy+19 Attack+19','"Store TP"+6','Accuracy+14',}},
    						feet={ name="Argosy Sollerets +1", augments={'HP+65','"Dbl.Atk."+3','"Store TP"+5',}},
    						neck="Combatant's Torque",
    						waist="Ioskeha Belt +1",
    						left_ear="Digni. Earring",
    						right_ear="Telos Earring",
    						left_ring="Regal Ring",
    						right_ring="Moonlight ring",
    						back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
							
    sets.TP.Dojikiri.HighACC.STP = {
                            main="Dojikiri Yasutsuna",
                            sub="Utu Grip",
                            ammo="Seeth. Bomblet +1",
                            head={ name="Argosy Celata +1", augments={'DEX+12','Accuracy+20','"Dbl.Atk."+3',}},
                            body="Ignominy Cuirass +3",
                            hands={ name="Emi. Gauntlets +1", augments={'HP+65','DEX+12','Accuracy+20',}},
                            legs="Ignominy Flanchard +3",
                            feet={ name="Odyssean Greaves", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+3','STR+9','Accuracy+15',}},
                            neck="Combatant's Torque",
                            waist="Ioskeha Belt +1",
                            left_ear="Telos Earring",
                            right_ear="Mache Earring +1",
                            left_ring="Regal Ring",
                            right_ring="Ramuh Ring +1",
                            back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
                            
    -- Kogarasumaru TP Sets --
    sets.TP.Kogarasumaru = {--219TP/hit 1140cu
                            main="Kogarasumaru",
                            sub="Utu Grip",
                            ammo="Ginsen",
                            head={ name="Argosy Celata +1", augments={'DEX+12','Accuracy+20','"Dbl.Atk."+3',}},
                            body={ name="Valorous Mail", augments={'Accuracy+22','"Store TP"+7','AGI+5',}},
                            hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
                            legs={ name="Odyssean Cuisses", augments={'Attack+19','"Store TP"+7','Accuracy+15',}},
                            feet={ name="Argosy Sollerets +1", augments={'HP+65','"Dbl.Atk."+3','"Store TP"+5',}},
                            neck="Combatant's Torque",
                            waist="Ioskeha Belt +1",
                            left_ear="Telos Earring",
                            right_ear="Cessance Earring",
                            left_ring="Petrov Ring",
                            right_ring="Moonlight ring",
                            back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
							
	sets.TP.Kogarasumaru.MidACC = 	{
                            main="Kogarasumaru",
                            sub="Utu Grip",
                            ammo="Ginsen",
                            head={ name="Argosy Celata +1", augments={'DEX+12','Accuracy+20','"Dbl.Atk."+3',}},
                            body="Ignominy Cuirass +3",
                            hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
                            legs="Ig. Flanchard +3",
                            feet={ name="Argosy Sollerets +1", augments={'HP+65','"Dbl.Atk."+3','"Store TP"+5',}},
                            neck="Combatant's Torque",
                            waist="Ioskeha Belt +1",
                            left_ear="Telos Earring",
                            right_ear="Cessance Earring",
                            left_ring="Regal Ring",
                            right_ring="Moonlight ring",
                            back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}	
							
    sets.TP.Kogarasumaru.HighACC = {
                            main="Kogarasumaru",
                            sub="Utu Grip",
                            ammo="Seeth. Bomblet +1",
                            head={ name="Argosy Celata +1", augments={'DEX+12','Accuracy+20','"Dbl.Atk."+3',}},
                            body="Ignominy Cuirass +3",
                            hands={ name="Emi. Gauntlets +1", augments={'HP+65','DEX+12','Accuracy+20',}},
                            legs="Ignominy Flanchard +3",
                            feet={ name="Odyssean Greaves", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+3','STR+9','Accuracy+15',}},
                            neck="Combatant's Torque",
                            waist="Ioskeha Belt +1",
                            left_ear="Telos Earring",
                            right_ear="Mache Earring +1",
                            left_ring="Regal Ring",
                            right_ring="Ramuh Ring +1",
                            back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
 
    -- Kogarasumaru(SAM Roll) TP Sets --
    sets.TP.Kogarasumaru.STP = {--270tp/hit Accu1111
							main="Kogarasumaru",
    						sub="Utu Grip",
    						ammo="Ginsen",
    						head="Flam. Zucchetto +2",
    						body={ name="Valorous Mail", augments={'Accuracy+22','"Store TP"+7','AGI+5',}},
    						hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
    						legs={ name="Odyssean Cuisses", augments={'Accuracy+19 Attack+19','"Store TP"+6','Accuracy+14',}},
    						feet={ name="Argosy Sollerets +1", augments={'HP+65','"Dbl.Atk."+3','"Store TP"+5',}},
    						neck="Ganesha's Mala",
    						waist="Windbuffet Belt +1",
    						left_ear="Digni. Earring",
    						right_ear="Telos Earring",
    						left_ring="Petrov Ring",
    						right_ring="Niqmaddu Ring",
    						back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}

    sets.TP.Kogarasumaru.MidACC.STP = {
    						main="Kogarasumaru",
    						sub="Utu Grip",
    						ammo="Ginsen",
    						head={ name="Argosy Celata +1", augments={'DEX+12','Accuracy+20','"Dbl.Atk."+3',}},
    						body={ name="Valorous Mail", augments={'Accuracy+22','"Store TP"+7','AGI+5',}},
    						hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
    						legs={ name="Odyssean Cuisses", augments={'Accuracy+19 Attack+19','"Store TP"+6','Accuracy+14',}},
    						feet={ name="Argosy Sollerets +1", augments={'HP+65','"Dbl.Atk."+3','"Store TP"+5',}},
    						neck="Combatant's Torque",
    						waist="Ioskeha Belt +1",
    						left_ear="Digni. Earring",
    						right_ear="Telos Earring",
    						left_ring="Regal Ring",
    						right_ring="Niqmaddu Ring",
    						back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
 							
	sets.TP.Kogarasumaru.HighACC.STP = {
                            main="Kogarasumaru",
                            sub="Utu Grip",
                            ammo="Seeth. Bomblet +1",
                            head={ name="Argosy Celata +1", augments={'DEX+12','Accuracy+20','"Dbl.Atk."+3',}},
                            body="Ignominy Cuirass +3",
                            hands={ name="Emi. Gauntlets +1", augments={'HP+65','DEX+12','Accuracy+20',}},
                            legs="Ignominy Flanchard +3",
                            feet={ name="Odyssean Greaves", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+3','STR+9','Accuracy+15',}},
                            neck="Combatant's Torque",
                            waist="Ioskeha Belt +1",
                            left_ear="Telos Earring",
                            right_ear="Mache Earring +1",
                            left_ring="Regal Ring",
                            right_ring="Ramuh Ring +1",
                            back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
     -- Soboro TP Sets --
    sets.TP.Soboro =       {
							main="Soboro Sukehiro",
    						sub="Utu Grip",
    						ammo="Paeapua",
    						head="Flam. Zucchetto +2",
    						body="Ken. Samue +1",
    						hands="Wakido Kote +3",
    						legs="Ken. Hakama +1",
    						feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
    						neck="Samurai's Nodowa +2",
    						waist="Windbuffet Belt +1",
    						left_ear="Brutal Earring",
    						right_ear="Cessance Earring",
							left_ring="Niqmaddu Ring",
    						right_ring="Flamma Ring",
    						back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},}
							
	sets.TP.Soboro.MidACC = 	{
                            main="Soboro Sukehiro",
							sub="Utu Grip",
    						ammo="Ginsen",
    						head="Flam. Zucchetto +2",
    						body={ name="Valorous Mail", augments={'Accuracy+22','"Store TP"+7','AGI+5',}},
    						hands="Wakido Kote +3",
    						legs={ name="Valor. Hose", augments={'Accuracy+30','"Store TP"+4','DEX+9','Attack+9',}},
    						feet="Flam. Gambieras +2",
    						neck="Samurai's Nodowa +2",
    						waist="Ioskeha Belt +1",
    						left_ear="Telos Earring",
    						right_ear="Cessance Earring",
    						left_ring="Flamma Ring",
    						right_ring="Ilabrat Ring",
    						back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},}
							
    sets.TP.Soboro.HighACC = {
							main="Soboro Sukehiro",
    						sub="Utu Grip",
    						ammo="Paeapua",
    						head="Flam. Zucchetto +2",
    						body="Ken. Samue +1",
    						hands="Wakido Kote +3",
    						legs="Ken. Hakama +1",
    						feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
    						neck="Samurai's Nodowa +2",
    						waist="Windbuffet Belt +1",
    						left_ear="Brutal Earring",
    						right_ear="Cessance Earring",
							left_ring="Niqmaddu Ring",
    						right_ring="Flamma Ring",
    						back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},}
 
    -- Soboro(SAM Roll) TP Sets --
    sets.TP.Soboro.STP = {
							main="Soboro Sukehiro",
    						sub="Utu Grip",
    						ammo="Paeapua",
    						head="Flam. Zucchetto +2",
    						body="Ken. Samue +1",
    						hands="Wakido Kote +3",
    						legs="Ken. Hakama +1",
    						feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
    						neck="Samurai's Nodowa +2",
    						waist="Windbuffet Belt +1",
    						left_ear="Brutal Earring",
    						right_ear="Cessance Earring",
							left_ring="Niqmaddu Ring",
    						right_ring="Flamma Ring",
    						back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},}

    sets.TP.Soboro.MidACC.STP = {
							main="Soboro Sukehiro",
							sub="Utu Grip",
	                        ammo="Ginsen",
    						head="Flam. Zucchetto +2",
    						body={ name="Valorous Mail", augments={'Accuracy+22','"Store TP"+7','AGI+5',}},
    						hands="Wakido Kote +3",
    						legs={ name="Ryuo Hakama +1", augments={'Accuracy+25','"Store TP"+5','Phys. dmg. taken -4',}},
    						feet="Flam. Gambieras +2",
    						neck="Samurai's Nodowa +2",
    						waist="Ioskeha Belt +1",
    						left_ear="Telos Earring",
    						right_ear="Cessance Earring",
    						left_ring="Niqmaddu Ring",
    						right_ring="Flamma Ring",
    						back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},}
 							
	sets.TP.Soboro.HighACC.STP = {
							main="Soboro Sukehiro",
    						sub="Utu Grip",
    						ammo="Paeapua",
    						head="Flam. Zucchetto +2",
    						body={ name="Valorous Mail", augments={'Accuracy+22','"Store TP"+7','AGI+5',}},
    						hands="Wakido Kote +3",
    						legs={ name="Ryuo Hakama +1", augments={'Accuracy+25','"Store TP"+5','Phys. dmg. taken -4',}},
    						feet="Ken. Sune-Ate +1",
    						neck="Samurai's Nodowa +2",
    						waist="Ioskeha Belt +1",
    						left_ear="Brutal Earring",
    						right_ear="Cessance Earring",
    						left_ring="Niqmaddu Ring",
    						right_ring="Hetairoi Ring",
    						back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}

    -- PDT/MDT Sets --
    sets.PDT = {            ammo="Staunch Tathlum +1",
    						head="Flam. Zucchetto +2",
    						body="Wakido Domaru +3",
    						hands={ name="Sakonji Kote +2", augments={'Enhances "Blade Bash" effect',}},
    						legs={ name="Valor. Hose", augments={'Accuracy+30','"Store TP"+4','DEX+9','Attack+9',}},
    						feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
    						neck="Loricate Torque +1",
    						waist="Ioskeha Belt +1",
    						left_ear="Telos Earring",
    						right_ear="Cessance Earring",
    						left_ring="Defending Ring",
    						right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -6%',}},
    						back="Moonlight Cape",}
 
    sets.MDT = {            ammo="Hasty Pinion +1",
							head="Sulevia's Mask +2",
							body="Sulevia's Plate. +2",
							hands="Sulev. Gauntlets +2",
							legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
							feet="Sulev. Leggings +2",
							neck="Loricate Torque +1",
							waist="Ioskeha Belt +1",
							left_ear="Odnowa Earring +1",
							right_ear="Odnowa Earring",
							left_ring="Defending Ring",
							right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -6%',}},
							back="Moonlight cape",}
                           
    sets.Scarlet = {		ammo="Ginsen",
							head="Ratri Sallet",
    						body="Ignominy Cuirass +3",
    						hands="Ratri Gadlings",
    						legs="Ratri Cuisses",
    						feet="Ratri Sollerets",
    						neck="Bathy Choker +1",
    						waist="Ioskeha Belt +1",
    						left_ear="Mache Earring +1",
    						right_ear="Mache Earring",
    						left_ring="Moonlight ring",
    						right_ring="Ramuh Ring +1",
    						back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
 
    -- Hybrid Set --
    sets.TP.Hybrid = {	    main="Masamune",
							sub="Utu Grip",
    						ammo="Staunch Tathlum +1",
    						head="Flam. Zucchetto +2",
    						body="Wakido Domaru +3",
    						hands={ name="Sakonji Kote +2", augments={'Enhances "Blade Bash" effect',}},
    						legs={ name="Valor. Hose", augments={'Accuracy+30','"Store TP"+4','DEX+9','Attack+9',}},
    						feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
    						neck="Loricate Torque +1",
    						waist="Ioskeha Belt +1",
    						left_ear="Telos Earring",
    						right_ear="Cessance Earring",
    						left_ring="Defending Ring",
    						right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -6%',}},
    						back="Moonlight Cape",}
    sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
    sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})
 
    -- WS Base Set --
    sets.WS = {--retour TP 200
                            ammo="Knobkierrie",
							head={ name="Valorous Mask", augments={'Weapon skill damage +5%','Accuracy+13',}},
							body={ name="Valorous Mail", augments={'Accuracy+22','"Store TP"+7','AGI+5',}},
							hands={ name="Valorous Mitts", augments={'Weapon skill damage +5%','DEX+3','Accuracy+6','Attack+14',}},
							legs="Wakido Haidate +3",
							feet={ name="Valorous Greaves", augments={'Attack+6','Weapon skill damage +5%','STR+3',}},
							neck="Samurai's Nodowa +2",
							waist="Fotia Belt",
							left_ear="Ishvara Earring",
							right_ear="Vulcan's Pearl",
							left_ring="Niqmaddu Ring",
							right_ring="Regal Ring",
							back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}
 
    -- Tachi: Fudo Sets -- /gs equip sets.WS[\"Tachi: Fudo\"]
    sets.WS["Tachi: Fudo"] = {--retour TP 200
                            ammo="Knobkierrie",
							head={ name="Valorous Mask", augments={'Weapon skill damage +5%','Accuracy+13',}},
							body="Sakonji Domaru +3",
							hands={ name="Valorous Mitts", augments={'Weapon skill damage +5%','DEX+3','Accuracy+6','Attack+14',}},
							legs="Wakido Haidate +3",
							feet={ name="Valorous Greaves", augments={'Attack+6','Weapon skill damage +5%','STR+3',}},
							neck="Samurai's Nodowa +2",
							waist="Fotia Belt",
							left_ear="Ishvara Earring",
							right_ear="Vulcan's Pearl",
							left_ring="Niqmaddu Ring",
							right_ring="Regal Ring",
							back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}
    sets.WS["Tachi: Fudo"].HighACC = set_combine(sets.WS["Tachi: Fudo"],{})
   
    -- Tachi: Shoha Sets --
    sets.WS["Tachi: Shoha"] = {-- retour TP 200
                            ammo="Knobkierrie",
							head={ name="Valorous Mask", augments={'Weapon skill damage +5%','Accuracy+13',}},
							body="Sakonji Domaru +3",
							hands={ name="Valorous Mitts", augments={'Weapon skill damage +5%','DEX+3','Accuracy+6','Attack+14',}},
							legs="Wakido Haidate +3",
							feet={ name="Valorous Greaves", augments={'Attack+6','Weapon skill damage +5%','STR+3',}},
							neck="Samurai's Nodowa +2",
							waist="Fotia Belt",
							left_ear="Ishvara Earring",
							right_ear="Vulcan's Pearl",
							left_ring="Niqmaddu Ring",
							right_ring="Regal Ring",
							back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}
            sets.WS["Tachi: Shoha"].HighACC = set_combine(sets.WS["Tachi: Shoha"],{})
 
	-- Tachi Gekko Sets --
    sets.WS["Tachi: Gekko"] = {--retour TP 128
                            ammo="Knobkierrie",
							head={ name="Valorous Mask", augments={'Weapon skill damage +5%','Accuracy+13',}},
							body="Sakonji Domaru +3",
							hands={ name="Valorous Mitts", augments={'Weapon skill damage +5%','DEX+3','Accuracy+6','Attack+14',}},
							legs="Wakido Haidate +3",
							feet={ name="Valorous Greaves", augments={'Attack+6','Weapon skill damage +5%','STR+3',}},
							neck="Samurai's Nodowa +2",
							waist="Fotia Belt",
							left_ear="Ishvara Earring",
							right_ear="Vulcan's Pearl",
							left_ring="Niqmaddu Ring",
							right_ring="Regal Ring",
							back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}
            sets.WS["Tachi: Gekko"].HighACC = set_combine(sets.WS["Tachi: Gekko"],{})                           
 
    -- Tachi: Rana Sets --
    sets.WS["Tachi: Rana"] = {
							ammo="Knobkierrie",
							head={ name="Valorous Mask", augments={'Weapon skill damage +5%','Accuracy+13',}},
							body="Sakonji Domaru +3",
							hands={ name="Valorous Mitts", augments={'Weapon skill damage +5%','DEX+3','Accuracy+6','Attack+14',}},
							legs="Wakido Haidate +3",
							feet={ name="Valorous Greaves", augments={'Attack+6','Weapon skill damage +5%','STR+3',}},
							neck="Samurai's Nodowa +2",
							waist="Fotia Belt",
							left_ear="Ishvara Earring",
							right_ear="Vulcan's Pearl",
							left_ring="Niqmaddu Ring",
							right_ring="Regal Ring",
							back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}
    sets.WS["Tachi: Rana"].HighACC = set_combine(sets.WS["Tachi: Rana"],{})
 
    -- Tachi: Jinpu Sets --
    sets.WS["Tachi: Jinpu"] = {
                            ammo="Knobkierrie",
							head={ name="Valorous Mask", augments={'Weapon skill damage +5%','Accuracy+13',}},
							body="Sakonji Domaru +3",
							hands={ name="Valorous Mitts", augments={'Weapon skill damage +5%','DEX+3','Accuracy+6','Attack+14',}},
							legs="Wakido Haidate +3",
							feet={ name="Valorous Greaves", augments={'Attack+6','Weapon skill damage +5%','STR+3',}},
							neck="Samurai's Nodowa +2",
							waist="Fotia Belt",
							left_ear="Ishvara Earring",
							right_ear="Vulcan's Pearl",
							left_ring="Niqmaddu Ring",
							right_ring="Regal Ring",
							back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}
    sets.WS["Tachi: Jinpu"].HighACC = set_combine(sets.WS["Tachi: Jinpu"],{})
                           
    -- Tachi: Kasha Sets --
    sets.WS["Tachi: Kasha"] = {
                            ammo="Knobkierrie",
							head={ name="Valorous Mask", augments={'Weapon skill damage +5%','Accuracy+13',}},
							body="Sakonji Domaru +3",
							hands={ name="Valorous Mitts", augments={'Weapon skill damage +5%','DEX+3','Accuracy+6','Attack+14',}},
							legs="Wakido Haidate +3",
							feet={ name="Valorous Greaves", augments={'Attack+6','Weapon skill damage +5%','STR+3',}},
							neck="Samurai's Nodowa +2",
							waist="Fotia Belt",
							left_ear="Ishvara Earring",
							right_ear="Vulcan's Pearl",
							left_ring="Niqmaddu Ring",
							right_ring="Regal Ring",
							back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}
    sets.WS["Tachi: Kasha"].HighACC = set_combine(sets.WS["Tachi: Kasha"],{})                           

 
    -- JA Sets --
    sets.JA = {}
    sets.JA['Meditate'] = {head="Wakido Kabuto +3",hands="Sakonji Kote +2",back="Smertrios's Mantle"}
    sets.JA['Warding Circle'] = {head="Wakido Kabuto +3"}
    sets.JA['Blade Bash'] = {hands="Sakonji Kote +2"}
    sets.JA['Hasso'] = {hands="Wakido Kote +3",legs="Kasuga Haidate +1"}
    sets.JA['Seigan'] = {head="Kasuga Kabuto"}
    sets.JA['Sekkanoki'] = {hands="Kasuga Kote +1"}
	sets.JA['Third Eye'] = {legs="Sakonji Haidate +3"}
	sets.JA['Shikikoyo'] = {legs="Sakonji Haidate +3"}
	sets.JA['Meikyo Shisui'] = {feet="Sakonji Sune-Ate +3"}
	sets.JA['Sengikori'] = {feet="Kasuga Sune-Ate +1"}
 
 
	sets.Doom = {waist="Gishdubar sash",ring1="Saida Ring",ring2="Saida Ring",neck="Nicander's necklace"}
	
    -- Waltz Set --
    sets.Waltz = {}
 
    sets.Precast = {}
    -- Fastcast Set --
    sets.Precast.FastCast = { 	
							ammo="Sapience Orb",
							head="Flam. Zucchetto +2",
							body="Wakido Domaru +3",
							hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
							legs="Wakido Haidate +3",
							feet={ name="Valorous Greaves", augments={'Attack+6','Weapon skill damage +5%','STR+3',}},
							neck="Orunmila's Torque",
							waist="Flume Belt",
							left_ear="Enchntr. Earring +1",
							right_ear="Loquac. Earring",
							left_ring="Lebeche Ring",
							right_ring="Rahab Ring",
							back={ name="Smertrios's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}},}

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
			if (spell.english == "Tachi: Fudo" or spell.english == "Tachi: Shoha" or spell.english == "Tachi: Gekko" or spell.english == "Tachi: Kasha" or spell.english == "Cross Reaper" or spell.english == "Guillotine" or spell.english == "Resolution" or spell.english == "Insurgency") and (player.tp < 2750 or buffactive.Sekkanoki) then
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
            if spell.english == 'Utsusemi: Ni' then
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
		if spell.english == "Stoneskin" then
            if buffactive.Stoneskin then
                send_command('@wait 1.7;cancel stoneskin')
            end
            equipSet = equipSet.Stoneskin
        elseif spell.english == "Sneak" then
            if spell.target.name == player.name and buffactive['Sneak'] then
                send_command('cancel sneak')
            end
            equipSet = sets.PDT
        elseif spell.english:startswith('Utsusemi') then
            if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
                send_command('@wait 1.7;cancel Copy Image*')
            end
            equipSet = sets.PDT
        elseif spell.english == 'Monomi: Ichi' then
            if buffactive['Sneak'] then
                send_command('@wait 1.7;cancel sneak')
            end
            equipSet = sets.Precast.FastCast
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
            target_distance = math.floor(player.target.distance*20)/10
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
        set_macro_page(1, 12)
    end
end