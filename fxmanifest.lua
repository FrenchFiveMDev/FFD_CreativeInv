fx_version 'cerulean'
game 'gta5'
lua54 'yes'
name 'FFD_CreativeInv'
description 'Creative Inventory'
author 'ffdfivem'
contributor 'spacev' 'Manta95'

version '1.0.4'

client_script 'client.lua'

server_script 'server.lua'

shared_script 'config.lua'

escrow_ignore {
    'client.lua',
    'server.lua',
    'config.lua'
}

dependencies {
    'oxmysql',
    'ox_inventory',
    'ox_lib'
}