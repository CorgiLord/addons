require 'strings'
http = require('socket.http')
require('logger')

_addon.name = 'Roster'
_addon.author = 'original: CorgiLord'
_addon.version = '1.0'
_addon.command = 'roster'

a = ""
b = ""
c = ""

function refresh()
	local result_table = {};
		http.request{
		url = "http://arcadoid.com/get.php",
		sink = ltn12.sink.table(result_table),
	}
    result = table.concat(result_table)
	
	_roster = ""
	local ally = string.gmatch(result, "<tr><td>([^<]*)</td>")
	for word in ally do _roster = word  end
	
    a,b,c = string.match(_roster, "(.*)%-(.*)%-(.*)")
	log('Roster up to date')
	log(a)
	coroutine.sleep(.1)
	log(b)
	coroutine.sleep(.1)
	log(c)
end
function printToLS()
	coroutine.sleep(.5)
	windower.send_command('input /linkshell '..a..'')
	coroutine.sleep(1.5)
	windower.send_command('input /linkshell '..b..'')
	coroutine.sleep(1.5)
	windower.send_command('input /linkshell '..c..'')
	coroutine.sleep(1)
end

windower.register_event('addon command', function(input, ...)
    local cmd = string.lower(input)
	local args = {...}
	
	if cmd == 'get' then
		refresh()
	elseif cmd == 'ls' then
		printToLS()
    end
end)