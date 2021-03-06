local Backpack = {}
Backpack.__index = Backpack

--Função construtora
function Backpack.New(_tier, _description)
  local instance = {
    Class = "Backpack",
    Description = _description,
    Tier = _tier,
    SlotsMax = _tier * 10,
    Slots = {},
  }

  setmetatable(instance, Backpack)
  return instance
end

--Métodos
function Backpack:ViewBackpack()
  print("Espaço Máximo: " .. self.SlotsMax .. " | Espaços Utilizado: " .. #self.Slots)

  for i, v in pairs(self.Slots) do
    --print(" [".. i .."] " .. v.Name .. " | Tipo: " .. v.Type .. " | Raridade: " .. v.Rarity .. " | Preço: " .. v.Price)
  end
end

function Backpack:PutInBackpack(item)
  if #self.Slots < self.SlotsMax then
    table.insert(self.Slots, item)
    print(item.Name .. " adicionado ao inventário.")
  else
    print("Você não tem espaço no inventário.")
  end
end

function Backpack:RemoveFromBackpack(slot)
  if type(slot) ~= "number" then print("Insira o número do espaço.") return end

  if self.Slots[slot] then
    print("[" .. slot .. "] " .. self.Slots[slot].Name .. " removido da mochila.")
    return table.remove(self.Slots, slot)
  else
    print("Espaço: [" .. slot .. "]" .. " não há item.")
  end
end

return Backpack
