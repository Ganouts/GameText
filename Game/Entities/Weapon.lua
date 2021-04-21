--Módulos//
local Commands = require("Entities/Commands")
local Item = require("Entities/Item")

local Weapon = {}
Weapon.__index = Weapon
setmetatable(Weapon, {__index = Item})

--Função construtora//
function Weapon.New(attributes)
  local instance = Items.New(
  attributes.Name, attributes.Type, "Weapon", attributes.Rarity,
  attributes.Description, attributes.Price, attributes.Marketable
  )
  instance.Damage = attributes.Damage
  instance.Effect = attributes.Effect

  setmetatable(instance, Weapon)
  return instance
end

--Métodos//

return Weapon
