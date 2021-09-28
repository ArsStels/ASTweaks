require("prototypes.technology.tech-changes")
require("prototypes.recipe.rocket-parts")
require("prototypes.recipe.science-packs")
require("prototypes.recipe.recipes-fix")

table.remove(data.raw.recipe["se-recycle-medium-electric-pole"].icons, 2)
for i =1, #data.raw.item["medium-electric-pole"].icons do
  table.insert(data.raw.recipe["se-recycle-medium-electric-pole"].icons, data.raw.item["medium-electric-pole"].icons[i])
end
table.remove(data.raw.recipe["se-recycle-big-electric-pole"].icons, 2)
table.remove(data.raw.recipe["se-recycle-substation"].icons, 2)
table.remove(data.raw.recipe["se-recycle-radar"].icons, 2)

--for s, val in pairs(data.raw.recipe) do
--  if string.find(s, "se%-recycle%-") then
--    data.raw.recipe[s] = nil
--  end
--end
ast.allrecipesdif()
ast.fixRecipes()