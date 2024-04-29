local inventory <const> = exports.ox_inventory
local items <const> = inventory:Items()
-- local weapons <const> = inventory:Weapons()

RegisterNetEvent('ox:creativechest', function()
  local player <const> = Player(source).state
  if not (Config.groups[player.group]) then return print("Vous devez être admin.") end
  inventory:RegisterStash('creativechest', Config.NameCreativeMenu, Config.MaxSlotsCreativeMenu, Config.MaxWeight, true)
  for _, item in pairs(items) do
    inventory:AddItem('creativechest', item.label, item.amount, item.data)
  end

end)

RegisterCommand("creativechest", function(source, args, rawCommand)
  local src = source


  local inventoryResource = exports["ox_inventory"]
  if not inventoryResource then
      print("ox_inventory resource not found.")
      return
  end

  local items = {}
  for _, item in pairs(inventoryResource:Items()) do
      table.insert(items, { item.name, 1, {} })
  end

  local id = inventoryResource:CreateTemporaryStash({
      label = "Creative Inventory",
      slots = 1000,
      maxWeight = 500000000000000000,
      owner = true,
      items = items
  })

  TriggerClientEvent('ox_inventory:openInventory', src, 'creative', id)

end)

RegisterCommand("stash", function(source, args, rawCommand)
  local src = source

  print("Executing stash command...")

  local inventoryResource = exports["ox_inventory"]
  if not inventoryResource then
      print("ox_inventory resource not found.")
      return
  end

  -- Create a temporary stash
  local id = inventoryResource:CreateTemporaryStash({
      label = "Stash",
      slots = 1000,
      maxWeight = 500000000000000000,
      owner = true,
      items = items
  })

  TriggerClientEvent('ox_inventory:openInventory', src, 'stash', id)
end)