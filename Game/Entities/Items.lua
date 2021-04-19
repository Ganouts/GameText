local Items = {}

function Items.New(name, type, rarity, description, price, marketable, equipable, consumable)
  local instance = {
    Name = name,
    Type = type,
    Class = class,
    Rarity = rarity,
    Description = description,
    Price = price,
    Marketable = marketable,
    Equipable = equipable,
    Consumable = consumable,
    BackpackSlot = 0,
  }
  setmetatable(instance, {__index = Items})
  return instance
end

function Items:ViewDescription()
  print("Nome: " .. self.Name)
  print("Tipo: " .. self.Type)
  print("Raridade: " .. self.Rarity)
  print("Preço: " .. self.Price)
  print("Description: " .. self.Description)
end

function Items:Sell(player)
  if player.InShop and self.Marketable then
    player.Money = player.Money + self.Price
    return table.remove(player.Backpack, self.BackpackSlot)
  end
end

function Items:Destroy(player)
  table.remove(player.Backpack, self.BackpackSlot)
end

return Items
