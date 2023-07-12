ESX = exports['es_extended']:getSharedObject()
local GetCurrentResourceName = GetCurrentResourceName()
local ox_inventory = exports.ox_inventory

local items = require('item') 

RegisterNetEvent('ox:creativechest', function()
  ox_inventory:RegisterStash('creativechest', Config.NameCreativeMenu, Config.MaxSlotsCreativeMenu, Config.MaxWeight, true)

  for _, item in ipairs(items) do
    ox_inventory:AddItem('creativechest', item.label, item.amount, item.data)
  end

end)

RegisterNetEvent('ox:admintrash', function()
  ox_inventory:RegisterStash('admintrash', Config.NameTrashAdmin, Config.MaxSlotsTrash, Config.MaxWeightTrash, true)
  Citizen.Wait(Config.ClearTrash)
  ox_inventory:ClearInventory('admintrash')
end)
  
ESX.RegisterServerCallback('FFDAdmin:getUsergroup', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local group = xPlayer.getGroup()
  cb(group)
end)
