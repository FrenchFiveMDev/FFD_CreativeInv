fx_version 'cerulean'
game 'gta5'
lua54 'yes'
name 'FFD_CreativeInv'
description 'Creative Inventory'
author 'ffdfivem'

version '1.0.1'

client_script 'client.lua'

server_script 'server.lua'

shared_script 'config.lua'


dependencies {
    'oxmysql',
    'ox_inventory',
    'ox_lib'
}