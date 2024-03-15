# FFD_CreativeInv

1.0.0
Original code

1.0.1
Modification of the code in order to load all the items of the items.lua in ox_inventory !

1.0.2
Code corrected by spacev

1.0.3
Bug Fix !

1.0.4
Bug Fix for Creative Chest! 

# Read Me

Go to       ox_inventory/modules/items/server.lua (last version)

search container about line 295 replace this

		if container then
			count = 1
			metadata.container = metadata.container or GenerateText(3)..os.time()
			metadata.size = container.size
		elseif not next(metadata) then
			if item.name == 'identification' then
				count = 1
				metadata = {
					type = inv.player.name,
					description = locale('identification', (inv.player.sex) and locale('male') or locale('female'), inv.player.dateofbirth)
				}
			elseif item.name == 'garbage' then
				local trashType = trash[math.random(1, #trash)]
				metadata.image = trashType.image
				metadata.weight = trashType.weight
				metadata.description = trashType.description
			end
		end

        by this

        if container then
            count = 1
            metadata.container = metadata.container or GenerateText(3) .. os.time()
            metadata.size = container.size
        elseif not next(metadata) then
            if item.name == 'identification' then
                count = 1
                if inv and inv.player then 
                    metadata = {
                        type = inv.player.name,
                        description = locale('identification', (inv.player.sex) and locale('male') or locale('female'), inv.player.dateofbirth)
                    }
                else
                    print("Error: inv or inv.player is nil")
                end
            elseif item.name == 'garbage' then
                local trashType = trash[math.random(1, #trash)]
                metadata.image = trashType.image
                metadata.weight = trashType.weight
                metadata.description = trashType.description
            end
        end