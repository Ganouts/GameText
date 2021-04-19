--Módulos e Classes
local Equipables = require("Entities/Equipables")
local Commands = require("Entities/Commands")
--Módulo
local Shields = {}

function Shields.New(name, type, rarity, description, price, marketable, size, defense)
  local instance = Equipables.New(name, type, "Shield", rarity, description, price, marketable)
  instance.Size = size
  instance.Defense = defense
  return instance
end

function Shields.Create(size, name)
  return Shields.New(Commands.ReturnAttributes(Shields[size][name]))
end

--[[ Propriedades dos Escudos.
Name = ,
Type = ,
Rarity = ,
Description = ,
Price = ,
Marketable = ,
Size = ,
Defense = ,
]]

Shields.Small = {}
Shields.Medium = {}
Shields.Large = {}

return Shields
