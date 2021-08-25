for key, val in pairs(data.raw.recipe) do
for _, rcp in pairs({val, val.normal, val.expensive}) do
if rcp and rcp.ingredients then
for i, ing in pairs(rcp.ingredients) do
if ing.type == "item" and ing.amount ~= nil and (ing.probability or 1) == 1 then
rcp.ingredients[i] = {ing.name, ing.amount}
end
end
end
end
end