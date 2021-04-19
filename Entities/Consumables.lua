local Consumables = {}

function Consumables.New(name, type, rarity, description, price, marketable, power)
  local instance = {
    Name = name,
    Type = type,
    Rarity = rarity,
    Description = description,
    Price = price,
    Marketable = marketable,
    Power = power,
    Equipable = false,
    Consumable = true,
    BackpackSlot = 0,
  }
  setmetatable(instance, {__index = Consumables})
  return instance
end

function Consumables:Description()
  print("Name: " .. self.Name)
  print("Tipo: " .. self.Type)
  print("Raridade: " .. self.Rarity)
  print("Preço: " .. self.Price)
  print("Description: " .. self.Description)
end

function Consumables:Use(player)
  if self.Type == "Cura" then
    if player:GainHealth(self.Power) then
      self = nil
    else 
      print("A sua saúde já está no máximo.")
  end
end


return Consumables
