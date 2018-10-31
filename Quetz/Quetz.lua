_addon.author   = 'Kaotic'
_addon.version  = '1.2'
_addon.commands = {'Quetz'}

require('logger')
require('coroutine')
packets = require('packets')
res = require('resources')

local conditions = {

	quetzPortal = false,
	goblin = false,
	reisenPortal = false,
	running = false,
	quetzAlive = false,
	quetzDead = false,
}

function stop()
	
	windower.send_command('lua unload quetz')
	
end


function start()
	log('Waiting for pop')
	local quetz = windower.ffxi.get_mob_by_name('Quetzalcoatl')
	quetzDead = true
	while quetzDead do
		if quetz.hpp > 0 then
			quetzDead = false
		end
		coroutine.sleep(.25)
		quetz = windower.ffxi.get_mob_by_name('Quetzalcoatl')
	end
	log('Pop')
	fight()
end


function fight()
	coroutine.sleep(1)
	log('Fighting')
	local get_party = windower.ffxi.get_party()
	
	local quetz = windower.ffxi.get_mob_by_name('Quetzalcoatl')
	quetzAlive = true
	
	while quetzAlive do
		if quetz.hpp == 0 then
			quetzAlive = false
		end
		if get_party.party1_count < 6 then
			log('Refreshing trusts')
			windower.send_command('input //trusts domain')
			coroutine.sleep(5)
		end
		coroutine.sleep(.25)
		quetz = windower.ffxi.get_mob_by_name('Quetzalcoatl')
	end
	exitArena()
end


function exitArena()
	
	local player = windower.ffxi.get_player()
	
	if player.vitals.hp == 0 then
		log('You died')
		coroutine.sleep(10)
		windower.send_command('setkey enter down')
		coroutine.sleep(.05)
		windower.send_command('setkey enter up')
		coroutine.sleep(.05)
		log('Raise accepted,')
		coroutine.sleep(600)
		windower.send_command('input /equip ring2 "Dim. Ring (Holla)"')
		coroutine.sleep(1)
		windower.send_command('input /item "Dim. Ring (Holla)" <me>')
		coroutine.sleep(20)
		enterReisen()
	else
		log("Fight's over, teleporting in 10 minutes.")
		coroutine.sleep(600)
		windower.send_command('input /equip ring2 "Dim. Ring (Holla)"')
		coroutine.sleep(1)
		windower.send_command('input /item "Dim. Ring (Holla)" <me>')
		coroutine.sleep(20)
		enterReisen()
	end

end


function enterReisen()

	log('Entering Reisenjima in 1 minute.')
	
	--coroutine.sleep(60)
	
	local me = windower.ffxi.get_mob_by_target('me')
	local tp = windower.ffxi.get_mob_by_name('Dimensional Portal')
	
	
	windower.ffxi.run(tp.x - me.x, tp.y - me.y, tp.z - me.z)
	conditions['running'] = true
	while conditions['running'] do
		if(math.sqrt(tp.distance)) < 3 then
			conditions['running'] = false
		end
		tp = windower.ffxi.get_mob_by_name('Dimensional Portal')
	end
	windower.ffxi.run(false)
	
    if tp then
        local p = packets.new('outgoing', 0x01A, {
            ['Target'] = tp.id,
            ['Target Index'] = tp.index,
        })
        packets.inject(p)
    end

	coroutine.sleep(10)
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(7)
	windower.send_command('setkey up down')
	coroutine.sleep(.05)
	windower.send_command('setkey up up')
	coroutine.sleep(.50)
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(.50)
	
	log('Obtaining Elvorseal in 2 minutes.')
	coroutine.sleep(100)
	windower.send_command('input //temps buy')
	coroutine.sleep(20)
	
	enterArena()

end


function enterArena()

	log('Obtaining Elvorseal')
	
	local gob = windower.ffxi.get_mob_by_name('Shiftrix')
    if gob then
        local p = packets.new('outgoing', 0x01A, {
            ['Target'] = gob.id,
            ['Target Index'] = gob.index,
        })
        packets.inject(p)
    end
	
	coroutine.sleep(10)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(7)
	
	windower.send_command('setkey down down')
	coroutine.sleep(.05)
	windower.send_command('setkey down up')
	coroutine.sleep(.5)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(10)
	
	windower.send_command('setkey up down')
	coroutine.sleep(.05)
	windower.send_command('setkey up up')
	coroutine.sleep(.1)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(5)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(5)
	
	log('Elvorseal obtained, moving to fighting location in 1 minute.')
	coroutine.sleep(60)
	
	moveToLocation()

end


function moveToLocation()

	coroutine.sleep(1)
	windower.ffxi.turn(-3.8)
	coroutine.sleep(.5)
	log('Moving to pull location.')
	windower.ffxi.run(true)
	coroutine.sleep(6)
	windower.ffxi.run(false)
	log('Arrived at pull location.')
	coroutine.sleep(.5)
	log('Summoning Trusts')
	coroutine.sleep(.5)
	windower.send_command('input //trusts domain')
	coroutine.sleep(1)
	windower.send_command('input /equip ring2 "Hetairoi Ring"')
	coroutine.sleep(10)
	start()

end


windower.register_event('addon command', function(input, ...)
    local cmd = string.lower(input)
	local args = {...}
	
	if cmd == 'stop' then
		stop()
    elseif cmd == 'start' then
		start()
	elseif cmd == 'exit' then
		exitArena()
	elseif cmd == 'enter' then
		enterArena()
	elseif cmd == 'move' then
		moveToLocation()
	elseif cmd == 'test' then
		test()
	elseif cmd == 'fight' then
		fight()
	elseif cmd == 'reisen' then
		enterReisen()
    end
end)