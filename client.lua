local inventory <const> = exports.ox_inventory
local player <const> = LocalPlayer.state

--RegisterCommand('creativechest', function()
--  if not Config.groups[player.group] then return print("Vous devez être admin.") end
--  if (inventory:openInventory('stash', 'creativechest')) then return end
--  TriggerServerEvent('ox:creativechest')
--  inventory:openInventory('stash', 'creativechest')
--end, false)

--RegisterCommand('trash', function()
--  if not Config.groups[player.group] then return print("Vous devez être admin.") end
--  if (inventory:openInventory('stash', 'admintrash')) then return end
--  TriggerServerEvent('ox:admintrash')
--  inventory:openInventory('stash', 'admintrash')
--end, false)

--RegisterCommand('trash', function()
--    local players = PlayerPedId()
--    if not players then
--        return print("Vous devez  tre admin.")
--    end
    -- if not Config.groups[players.group] then
    --     return print("Vous devez  tre admin.")
    -- end
--    if inventory:openInventory('stash', 'admintrash') then
--        return
--    end
--    TriggerServerEvent('ox:admintrash')
--end, false)