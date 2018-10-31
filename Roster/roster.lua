require 'strings'
http = require('socket.http')
require('logger')

_addon.name = 'Roster'
_addon.author = 'original: CorgiLord'
_addon.version = '1.0'
_addon.command = 'roster'

function getRoster()
	local result_table = {};
		http.request{
		url = "https://docs.google.com/spreadsheets/d/e/2PACX-1vRncLOwAhiOtz8E2VpPdEdmw_LBx5WD7LbaMy-QHpB6SSnI5rXBFaTI2wS9Gp3wZ_nrT5hsWiVbFe7Z/pub?gid=271293840&single=true&output=tsv",
		sink = ltn12.sink.table(result_table),
	}
    result = table.concat(result_table)

    --_roster = ""
    --local re = (string.gmatch(result,"ROSTER</td><td>([^<]*)</td>"))
    --for word in re do
    --    _roster = word
    --end
	--windower.send_command('input /linkshell '.._roster..'')
    log(result)
end

windower.register_event('addon command', function(input, ...)
    local cmd = string.lower(input)
	local args = {...}
	
	if cmd == 'go' then
		getRoster()
    end
end)