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