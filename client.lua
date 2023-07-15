local ESX <const> = exports['es_extended']:getSharedObject()
local inventory <const> = exports.ox_inventory
local player <const> = LocalPlayer.state

RegisterCommand('creativechest', function()
  ESX.TriggerServerCallback('FFDAdmin:getUsergroup', function(group)
    if group == 'admin' or group == 'superadmin' or group == 'mod' or group == 'help' then
      if inventory:openInventory('stash', 'admintrash') == false then
        TriggerServerEvent('ox:creativechest')
        inventory:openInventory('stash', 'admintrash')
      end
    else 
      ESX.ShowNotification("Vous devez être admin.")
    end
  end)
end, false)

RegisterCommand('creativechest', function()
  if not Config.groups[player.group] then return print("Vous devez être admin.") end
  if not (inventory:openInventory('stash', 'admintrash')) then return end
  TriggerServerEvent('ox:creativechest')
  inventory:openInventory('stash', 'admintrash')
end, false)

RegisterCommand('trash', function()
  if not Config.groups[player.group] then return print("Vous devez être admin.") end
  if not (inventory:openInventory('stash', 'admintrash')) then return end
  TriggerServerEvent('ox:admintrash')
  inventory:openInventory('stash', 'admintrash')
end, false)
