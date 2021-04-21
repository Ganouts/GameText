--Módulos//
local Commands = require("Entities/Commands")
local Item = require("Entities/Item")

local Shield = {}
Shield.__index = Shield
setmetatable(Shield, {__index = Item})

--Função construtora//
function Shield.New(attributes)
  local instance = Items.New(
  attributes.Name, attributes.Type, attributes.Rarity,
  attributes.Description, attributes.Price, attributes.Marketable
  )
  instance.Size = attributes.Size
  instance.Defense = attributes.Defense

  setmetatable(instance, Shield)
  return instance
end

--Métodos//

return Shield
