local json = require "json";

--/c remote.call("Extractor", "export_all");

remote.add_interface("Extractor", {
	consoleLog = function()
		consoleLog()
	end,
	export_all = function()
		local data = {}
		--[[]]
		local recipes = {}
		for k, recipe in pairs(game.forces.player.recipes) do
				local foo = {
						name = recipe.name,
						category = recipe.category,
						ingredients = recipe.ingredients,
						products = recipe.products,
						energy = recipe.energy,
				}
				table.insert(recipes, foo)
		end
		data.recipes = recipes;
		local craftingMachines = {}
		for k, entity in pairs(game.entity_prototypes) do
				local categories = entity.crafting_categories
				if categories ~= nil then
					local foo = { 
						name = k,
						categories = entity.crafting_categories,
						craftingSpeed = entity.crafting_speed,
						ingredientCount = entity.ingredient_count,
					}
					table.insert(craftingMachines, foo)
				end
		end
		data.craftingMachines = craftingMachines;
		game.write_file('ploppy-exported-data.json', json.encode(data))
	end,
});

function consoleLog()
	game.player.print 'test log'
end
