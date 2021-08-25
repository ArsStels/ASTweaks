data.raw.recipe["more-science-pack-1"].ingredients =
{
  {"angels-ore1-crushed", 2},
  {"angels-ore3-crushed", 2}
}
 --  data.raw.recipe["more-science-pack-4"].ingredients =
 -- {
 --   {"building-pack", 2},
 --   {"inserter", 1},
 --   {"small-lamp", 1}
 -- }
data.raw.recipe["more-science-pack-6"].ingredients =
{
  {"stone-furnace", 2},
  {"steel-plate", 1},
  {"angels-solder-mixture", 6},
  {"coal", 4}
}

data.raw.recipe["more-science-pack-6"].category = "advanced-crafting"
data.raw.recipe["more-science-pack-29"].ingredients =
{
  {"atc", 2},
  {"atomic-bomb", 1},
  {"silver-zinc-battery", 50}
}
data:extend({
 {
	type = "recipe",
	name = "as-more-science-pack-4",
	category = "crafting",
	energy_required = 5,
	order = "z[zmore-science-pack-04]",
	subgroup = "science-pack",
	ingredients = {{"building-pack", 2},{"inserter", 1},{"small-lamp", 1}},
	result = "more-science-pack-4"
 }
 })