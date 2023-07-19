local inventory <const> = exports.ox_inventory
local items <const> = inventory:Items()

RegisterNetEvent('ox:creativechest', function()
  local player <const> = Player(source).state
  if not (Config.groups[player.group]) then return print("Vous devez être admin.") end
  inventory:RegisterStash('creativechest', Config.NameCreativeMenu, Config.MaxSlotsCreativeMenu, Config.MaxWeight, true)
  for _, item in ipairs(items) do
    inventory:AddItem('creativechest', item.label, item.amount, item.data)
  end
end)

RegisterNetEvent('ox:admintrash', function()
  local player <const> = Player(source).state
  if not (Config.groups[player.group]) then return print("Vous devez être admin.") end
  inventory:RegisterStash('admintrash', Config.NameTrashAdmin, Config.MaxSlotsTrash, Config.MaxWeightTrash, true)
  Citizen.Wait(10 * 60 * 1000)
  inventory:ClearInventory('admintrash')
end)