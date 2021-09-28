ast = {}

function ast.art(rc, tech) -- add recipe to tech (also hide and disable it)
  local name = data.raw.technology[tech]
  data.raw.recipe[rc].hidden = true
  data.raw.recipe[rc].enabled = false
  table.insert(name.effects, {type="unlock-recipe",recipe=rc})
end

function ast.mrft(rc, fromtech, totech) -- move a recipe from one technology to another
  local namefrom = data.raw.technology[fromtech]
  local nameto = data.raw.technology[totech]
  for key, value in pairs(namefrom.effects) do
      if value.type == "unlock-recipe"
      and value.name == rc then
      table.remove(namefrom.effects, key)
    end
  end
  table.insert(nameto.effects, {type="unlock-recipe",recipe=rc})
end

function ast.rr(rc) -- just hide the recipe
  data.raw.recipe[rc].hidden = true
  data.raw.recipe[rc].enabled = false
end

function ast.rrt(rc, tech) -- hide the recipe and remove it from the technology
  local name = data.raw.technology[tech]
  for key, value in pairs(name.effects) do
      if value.type == "unlock-recipe"
      and value.name == rc then table.remove(name.effects, key)
      end
  end
  data.raw.recipe[rc].hidden = true
  data.raw.recipe[rc].enabled = false
end

function ast.ntc(tech, count, time, items) -- new tech cost
data.raw["technology"][tech].unit =
  {
    count = count,
    ignore_tech_cost_multiplier = true,
    ingredients = items,
    time = time
  }
end

function ast.table_contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end




ast.item_categories = {
    "item", "ammo", "capsule", "gun", "item-with-entity-data",
    "item-with-label", "item-with-inventory", "blueprint-book", "item-with-tags",
    "selection-tool", "blueprint", "copy-paste-tool", "deconstruction-item", "upgrade-item",
    "module", "rail-planner", "spidertron-remote", "tool", "armor", "repair-tool",
    "fluid"
}

function ast.getItemPrototype(key)
    for _, category in pairs(ast.item_categories) do
        if data.raw[category][key] then
            return data.raw[category][key]
        end
    end
end

function ast.fixRecipes()
  for _, recipe in pairs(data.raw.recipe) do
    if recipe ~= nil then
      for _, recipe_type in pairs({recipe, recipe.normal, recipe.expensive}) do
        if recipe_type and recipe_type.results ~= nil then
          for i, result in pairs(recipe_type.results) do
            if result.type ~= "fluid" then
              local converted_result = table.deepcopy(result)
                if converted_result[1] then
                  converted_result = {type="item", name=converted_result[1], amount=converted_result[2]}
                local result_proto = ast.getItemPrototype(converted_result.name)
                if result_proto.type == "fluid" then
                  converted_result.type = "fluid"
                  recipe_type.results[i] = converted_result
                end
              end
            end
          end
        end
      end
    end
  end
end

function ast.allrecipesdif()
  for _, recipe in pairs(data.raw.recipe) do
    if recipe ~= nil then
      for _, recipe_type in pairs({recipe, recipe.normal, recipe.expensive}) do
        local expensive = recipe.expensive
        local normal = recipe.normal
        if recipe.expensive ~= nil then
          normal = expensive
        end
      end
    end
  end
end