local Item = {}
Item.__index = Item

--Função construtora//
function Item.New(_name, _type, _class, _rarity, _description, _price, _marketable)
  local instance = {
    Name = _name,
    Type = _type,
    Class = _class,
    Rarity = _rarity,
    Description = _description,
    Price = _price,
    Marketable = _marketable,
  }

  setmetatable(instance, Item)
  return instance
end

--Métodos//
function Item:Destroy()
  for i, v in pairs(self) do
    self[i] = nil
  end

  setmetatable(self, nil)
end

return Item
