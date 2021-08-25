-- require("__aai-programmable-vehicles__/prototypes/ai-vehicles")

for key, val in pairs(data.raw.car) do
    if val.recipe then
        local new_recipe = {}
        for _, prereq in pairs(val.prerequisites) do
            if not tech_packs[prereq] then
                table.insert(new_prereqs, prereq)
            else
                for _, tech_pack in pairs(tech_packs[prereq]) do
                    table.insert(new_recipe, tech_pack)
                end
            end
        end
        data.raw.car[key].prerequisites = new_prereqs
    end
end