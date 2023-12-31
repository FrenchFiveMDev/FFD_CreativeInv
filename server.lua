local inventory <const> = exports.ox_inventory
local items <const> = inventory:Items()
local weapons <const> = inventory:Weapons()

RegisterNetEvent('ox:creativechest', function()
  local player <const> = Player(source).state
  if not (Config.groups[player.group]) then return print("Vous devez être admin.") end
  inventory:RegisterStash('creativechest', Config.NameCreativeMenu, Config.MaxSlotsCreativeMenu, Config.MaxWeight, true)
  for _, item in pairs(items) do
    inventory:AddItem('creativechest', item.label, item.amount, item.data)
  end

  for _, weapon in pairs(weapons) do
    inventory:AddItem('creativechest', weapon.label, weapon.amount, weapon.data)
  end
end)

RegisterNetEvent('ox:admintrash', function()
  local player <const> = Player(source).state
  if not (Config.groups[player.group]) then return print("Vous devez être admin.") end
  inventory:RegisterStash('admintrash', Config.NameTrashAdmin, Config.MaxSlotsTrash, Config.MaxWeightTrash, true)
  Citizen.Wait(10 * 60 * 1000)
  inventory:ClearInventory('admintrash')
end)