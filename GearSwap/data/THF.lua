-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

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
    
	--send_command('clearbinds')
	
    include('Mote-TreasureHunter')

	send_command('bind NUMPAD1 input /ja "Sneak Attack" <me>')
	send_command('bind NUMPAD2 input /ja "Trick Attack" <me>')
	send_command('bind NUMPAD3 input /ja "Accomplice" <stpt>')
	
	send_command('bind NUMPAD4 input /ws Rudra')
	send_command('bind NUMPAD5 input /ws "Evisceration" <t>')
	send_command('bind NUMPAD6 input /ws "Exenterator" <t>')
	
	send_command('bind NUMPAD7 input /ws "Shark Bite" <t>')
	send_command('bind NUMPAD8 input /ws "Mandalic Stab" <t>')
	send_command('bind NUMPAD9 input /ws "Aeolian Edge" <t>')
	
	send_command('bind ^NUMPAD1 input /ja "Feint" <me>')
	send_command('bind ^NUMPAD2 input /ja "Conspirator" <me>')
	send_command('bind ^NUMPAD3 input /ja "Bully" <t>')
	
	send_command('bind ^NUMPAD4 input /ja "Steal" <t>')
	send_command('bind ^NUMPAD5 input /ja "Mug" <t>')
	send_command('bind ^NUMPAD6 input /ja "Despoil" <t>')
	
	send_command('bind ^NUMPAD7 input /ja "Larceny" <me>')
	send_command('bind ^NUMPAD8 input /ja "Hide" <me>')
	send_command('bind ^NUMPAD9 input /ja "Perfect Dodge" <me>')
	
	send_command('bind !NUMPAD1 input /ja "Provoke" <t>')
	send_command('bind !NUMPAD2 input /ja "Berserk" <me>')
	send_command('bind !NUMPAD3 input /ja "Warcry" <me>')
	
	send_command('bind !NUMPAD4 input /ja "Agressor" <me>')
	send_command('bind !NUMPAD5 input /ja "Defender" <me>')
	send_command('bind !NUMPAD6 input /ja "Warcry" <me>')
	
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
    state.OffenseMode:options('LowAcc', 'FullAcc')
    state.HybridMode:options('Normal', 'PDT')
	state.IdleMode:options('Normal', 'Refresh','Regen', 'PDT')

    -- Additional local binds
    send_command('bind f10 gs c cycle treasuremode')
	send_command('bind f11 gs c cycle OffenseMode')
	send_command('bind f12 gs c cycle HybridMode')

    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('clearbinds')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	sets.TreasureHunter = {hands="Plunderer's Armlets +1",feet="Skulk. Poulaines +1",waist="Chaac Belt",}
	moonshade_WS = S{"Rudra's Storm", "Evisceration", "Shark Bite", "Mandalic Stab", "Exenterator", "Savage Blade", "Vorpal Blade", "Requiescat", "Sanguine Blade"}
	
	sets.engaged =   
	{
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Pillager's Vest +3",
    hands="Adhemar Wrist. +1",
    legs="Meg. Chausses +2",
    feet="Plun. Poulaines +3",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Epona's Ring",
    right_ring="Hetairoi Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Damage taken-5%',}},
	}
   
   sets.precast.WS  = 
   {
    ammo="Jukukik Feather",
    head="Pill. Bonnet +3",
    body="Herculean Vest",
    hands="Meg. Gloves +2",
    legs="Plun. Culottes +3",
    feet="Lustra. Leggings +1",
    neck="Asn. Gorget +2",
    waist="Artful Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Regal Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	sets.precast.WS.SA =
	{
	ammo="Yetshila +1",
    head="Pill. Bonnet +3",
    body="Plunderer's Vest +3",
    hands="Meg. Gloves +2",
    legs="Plun. Culottes +3",
    feet="Lustra. Leggings +1",
    neck="Asn. Gorget +2",
    waist="Artful Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Regal Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	
	sets.precast.WS.TA =
	{
	ammo="Yetshila +1",
    head="Pill. Bonnet +3",
    body="Plunderer's Vest +3",
    hands="Meg. Gloves +2",
    legs="Plun. Culottes +3",
    feet="Lustra. Leggings +1",
    neck="Asn. Gorget +2",
    waist="Artful Belt",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Regal Ring",
    right_ring="Ilabrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	
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
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' and not spell.interrupted then
        state.Buff['Sneak Attack'] = false
        state.Buff['Trick Attack'] = false
        state.Buff['Feint'] = false
    end
end

-- Called after the default aftercast handling is complete.
function job_post_aftercast(spell, action, spellMap, eventArgs)
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
        elseif not gain then
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
    check_buff('Sneak Attack', eventArgs)
    check_buff('Trick Attack', eventArgs)
end


function customize_idle_set(idleSet)
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
	if state.Buff.Sleep and player.hp > 120 and player.status == "Engaged" then
        meleeSet = set_combine(meleeSet,{head="Frenzied Sallet"})
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
    if category == 2 or 
        (category == 3 and param == 30) or
        (category == 6 and info.default_ja_ids:contains(param)) or
        (category == 14 and info.default_u_ja_ids:contains(param))
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
        set_macro_page(2, 1)
    elseif player.sub_job == 'WAR' then
        set_macro_page(3, 1)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 1)
    else
        set_macro_page(3, 1)
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
