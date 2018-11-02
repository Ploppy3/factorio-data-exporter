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
                             moduleSlots = 0,
                }
                local module_slots = entity.module_inventory_size;
                if module_slots ~= nil then
                    foo.moduleSlots = module_slots;
                else
                    foo.moduleSlots = 0;
                end
                table.insert(craftingMachines, foo)
            end
        end
        data.craftingMachines = craftingMachines;

        local modules = {}
        for k, module in pairs(game.item_prototypes) do
            local module_effects = module.module_effects
            if module_effects ~= nil then
                local foo = {
                             name = k,
                             effects = module.module_effects,
                             category = module.category,
                             tier = module.tier,
                             limitations = module.limitations,
                }
                table.insert(modules, foo)
            end
        end
        data.modules = modules

        game.write_file('ploppy-exported-data.json', json.encode(data))
    end,
});

function consoleLog()
    game.player.print 'test log'
end
