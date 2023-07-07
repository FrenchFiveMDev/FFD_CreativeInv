fx_version 'cerulean'
game 'gta5'

name 'FFD_CreativeInv'
description 'Creative Inventory'
author 'ffdfivem'

version '1.0.0'

client_script 'client.lua'

server_script 'server.lua'

shared_script 'config.lua'

lua54 'yes'

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