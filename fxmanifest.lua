fx_version 'cerulean'

author 'Foltone#6290'

games { 'gta5' };

client_scripts {
	'@es_extended/locale.lua',
	'Config.lua',
	'locales/*.lua',
	'client/*.lua'
}

server_script {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'Config.lua',
	'locales/*.lua',
    'server/*.lua'
}

dependencies {
	'es_extended'
}
