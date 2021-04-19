local Items = require("Entities/Items")

local Equipables = {}

function Equipables.New(name, type, class, rarity, description, price, marketable)
  local instance = {
    Name = name,
    Type = type,
    Class = class,
    Rarity = rarity,
    Description = description,
    Price = price,
    Marketable = marketable,
    Equipable = true,
    Consumable = false,
    BackpackSlot = 0,
  }
  setmetatable(instance, {__index = Equipables})
  return instance
end

function Equipables:ViewDescription()
  print("Nome: " .. self.Name)
  print("Tipo: " .. self.Type)
  print("Raridade: " .. self.Rarity)
  print("Preço: " .. self.Price)
  print("Description: " .. self.Description)
  if self.Damage then
    print("Dano: " .. self.Damage)
    print("Efeito: " .. tostring(self.Effect))
  end
end

return Equipables
