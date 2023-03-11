fx_version 'cerulean'
game 'gta5'

name "dynyx-impound"
description "Impound Script Made By Dynyx."
author "Green"
version "1.0."

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'client/main.lua',
}

server_scripts {
	'server/main.lua',
}

dependencies {
	'PolyZone',
	'qb-target',
}
