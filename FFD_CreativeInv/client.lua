ESX = exports['es_extended']:getSharedObject()
local GetCurrentResourceName = GetCurrentResourceName()
local ox_inventory = exports.ox_inventory

RegisterCommand('creativechest', function()
  ESX.TriggerServerCallback('FFDAdmin:getUsergroup', function(group)
    if group == 'admin' or group == 'superadmin' or group == 'mod' or group == 'help' then
      if ox_inventory:openInventory('stash', 'creativechest') == false then
        TriggerServerEvent('ox:creativechest')
        ox_inventory:openInventory('stash', 'creativechest')
      end
    else 
      ESX.ShowNotification("Vous devez être admin.")
    end
  end)
end)

RegisterCommand('trash', function()
  ESX.TriggerServerCallback('FFDAdmin:getUsergroup', function(group)
    if group == 'admin' or group == 'superadmin' or group == 'mod' or group == 'help' then
      if ox_inventory:openInventory('stash', 'admintrash') == false then
        TriggerServerEvent('ox:admintrash')
        ox_inventory:openInventory('stash', 'admintrash')
      end
    else
      ESX.ShowNotification("Vous devez être admin.")
    end
  end)
end)

CreateThread(function()
  ESX.TriggerServerCallback('FFDAdmin:getUsergroup', function(group)
      playergroup = group
  end)

end)