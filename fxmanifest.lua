fx_version 'cerulean'
game 'gta5'

author 'Tobix'
description 'Fivem script for scrapyard'
version '1.0.0'
lua54 'yes'

-- Add your scripts below
shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config.lua',
}
client_scripts {
    'client/*.lua',
}
server_scripts {
    'server/*.lua',
}