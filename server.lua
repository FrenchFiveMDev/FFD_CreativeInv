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

  -- for _, weapon in pairs(weapons) do
  --   inventory:AddItem('creativechest', weapon.label, weapon.amount, weapon.data)
  -- end
end)

-- RegisterNetEvent('ox:admintrash', function()
--   local player <const> = Player(source).state
--   if not (Config.groups[player.group]) then return print("Vous devez être admin.") end
--   inventory:RegisterStash('admintrash', Config.NameTrashAdmin, Config.MaxSlotsTrash, Config.MaxWeightTrash, true)
--   Citizen.Wait(5000)
--   inventory:ClearInventory(player.source, 'admintrash')
--   inventory:ClearInventory('admintrash')    
--   TriggerClientEvent('chatMessage', player.source, '^2Tous les items ont été supprimés de l\'inventaire admintrash.')
--   print("Items deleted.")
-- end)

-- RegisterNetEvent('ox:admintrash', function()
--   local player = Player(source).state
--   if not (Config.groups[player.group]) then
--       return print("Vous devez être admin.")
--   end

--   local adminTrash = exports.ox_inventory:CreateTemporaryStash({
--       label = 'admintrash',
--       slots = Config.MaxSlotsTrash,
--       maxWeight = Config.MaxWeightTrash,
--       owner = true,
--       groups = {
--           ['admin'] = 0,
--           ['superadmin'] = 0,
--           ['mod'] = 0
--       }
--   })

--   Citizen.Wait(Config.AdminTrashDuration * 1000)

--   local success, response = exports.ox_inventory:RemoveInventory(adminTrash)

--   if success then
--       TriggerClientEvent('chatMessage', player.source, '^2L\'inventaire admintrash a été supprimé.')
--   else
--       TriggerClientEvent('chatMessage', player.source, '^1Erreur lors de la suppression de l\'inventaire admintrash: ' .. response)
--   end
-- end)


RegisterCommand("creativechest", function(source, args, rawCommand)
  local src = source

  -- print("Executing creativechest command...")

  local inventoryResource = exports["ox_inventory"]
  if not inventoryResource then
      print("ox_inventory resource not found.")
      return
  end

  -- Attempt to retrieve items from the inventory
  local items = {}
  for _, item in pairs(inventoryResource:Items()) do
      table.insert(items, { item.name, 1, {} })
  end

  -- Create a temporary stash
  local id = inventoryResource:CreateTemporaryStash({
      label = "Creative Inventory",
      slots = 1000,
      maxWeight = 500000000000000000,
      owner = true,
      items = items
  })

  TriggerClientEvent('ox_inventory:openInventory', src, 'creative', id)

  -- print("Creative inventory opened successfully.")
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