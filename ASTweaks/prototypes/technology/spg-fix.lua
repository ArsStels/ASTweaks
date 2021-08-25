local tech_packs = {}
tech_packs["sem:spg_science-pack-1-tech"] = {}
for key, val in pairs(data.raw.technology) do
    if val.unit.ingredients then
        local new_prereqs = {}
        for _, prereq in pairs(val.unit.ingredients) do
           if not tech_packs[prereq] then
                table.insert(new_prereqs, prereq)
            else
                for _, tech_pack in pairs(tech_packs[prereq]) do
                    table.insert(new_prereqs, tech_pack)
                end
            end
        end
      data.raw.technology[key].unit.ingredients = new_prereqs
    end
end