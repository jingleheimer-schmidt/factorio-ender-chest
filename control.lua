--
-- -- runs when player joins is created
-- script.on_event(defines.events.on_player_created, function(player)
--   -- gets player id
--   local player_id = player.player_index
--   -- creates unique id for player ender chest
--   local ender_chest_id = "ender_chest_" .. player_id
--   --
--   local ender_chest_id.inventory = {}
-- end)

-- runs when a gui is opened
script.on_event(defines.events.on_gui_opened, function(event)

  -- adds entity as variable
  local ender_chest = event.entity

  -- checks if entity is ender chest
  if ender_chest.name == "ender-chest" then

    -- adds player and ender chest as variables
    local player_id = event.player_index
    local ender_chest_id = "ender_chest_" .. player_id

    -- inserts ender chest inventory
    ender_chest.insert(ender_chest_id.inventory)
  else
    return
  end
end)

-- runs when gui is closed
script.on_event(defines.events.on_gui_closed, function(event)

  -- adds entity as variable
  local ender_chest = event.entity

  -- checks if entity is ender chest
  if ender_chest.name == "ender-chest" then

    -- adds player and ender chest as variables
    local player_id = event.player_index
    local ender_chest_id = "ender_chest_" .. player_id

    -- saves ender chest inventory
    local ender_chest_id.inventory = get_inventory(ender_chest)

    -- clears contents of ender chest
    ender_chest.clear_items_inside()
  else
    return
  end
end)
