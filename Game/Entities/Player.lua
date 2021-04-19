local Class = require("Entities/Class")
local Commands = require("Entities/Commands")
local Player = {}
Player.__index = Player

function Player.New()
  local instance = {
    Name = "None",
    Age = 20,
    Experience = 0,
    MaxExperience = 100,
    Level = 1,
    Money = 0,
    Backpack = {},
    Class = "None",
    Health = 100,
    MaxHealth = 100,
    Damage = 0, --Dano causado aos inimigos.
    Resistance = 0, -- Dano reduzido ao receber.
    Defense = 0, --Chance de defender por porcentagem.
    Hands = {Shield = "none", Weapon = "none"}, --Shield = Escudo | Weapon = Arma
    Body = {Armor = "none", Backpack = "none"}, --Armor = Armadura | Backpack = Mochila
    --Estados
    Live = true,
    InShop = false,
  }
  setmetatable(instance, Player)
  return instance
end

function Player:EquipItem(item)
  
end

function Player:LoseMoney(moneyLose)
  if (self.Money - moneyLose) >= 0 then
   self.Money = self.Money - moneyLose
   return moneyLose
  end
end

function Player:GainExperience(experienceAdd)
self.Experience = self.Experience + experienceAdd
if self.Experience == self.MaxExperience then
  self:LevelUp(1)
elseif self.Experience > self.MaxExperience then
  local ExperienceRemain = self.Experience - self.MaxExperience
  self:LevelUp(1)
  self.Experience = ExperienceRemain
end
end

function Player:GainMoney(moneyAdd)
  self.Money = self.Money + moneyAdd
end

function Player:LevelUp(levelAdd)
 self.Level = self.Level + levelAdd
 self.Experience = 0
 self.MaxExperience = (self.Level * 100) - 50
end

function Player:Birthday(ageAdd)
  self.Age = self.Age + ageAdd
end

function Player:Profile()
  print("Nome: " .. self.Name)
  print("Classe: " .. self.Class)
  print("Idade: " .. self.Age)
  print("Nível: " .. self.Level)
end

function Player:Attributes()
  print("Saúde: " .. self.Health)
end

function Player:ChangeName(name)
    self.Name = name
    return true
end

function Player:IsLive()
  if self.Health <= 0 then
    self.Live = false
    self.Health = 0
    return false
  else
    self.Live = true
    return true
  end
end

function Player:GainHealth(healthAdd)
  if self.Health < self.MaxHealth then
    self.Health = self.Health + healthAdd
    if self.Health > self.MaxHealth then
      self.health = self.MaxHealth
    end
    return true
  else
    return false
  end
end

function Player:TakeDamage(damage)
  if self:IsLive() then
    self.Health = self.Health - tonumber(damage)
  else
    self.Health = 0
  end
end

function Player:AttackEnemy(enemy)
  enemy:TakeDamage(self.Damage)
end

function Player:ChooseClass(answer)
  answer = string.lower(answer)
  if answer == "espadachim" then
    Class.Espadachim(self)
  elseif answer == "paladino" then
    Class.Paladino(self)
  elseif answer == "engineer" then
    Class.Engineer(self)
  end
end

function Player:ViewBackpack()
  for i,v in pairs(self.Backpack) do
    print(" ["..v.BackpackSlot.."] " .. v.Name .. " | Tipo: " .. v.Type .. " | Raridade: " .. v.Rarity .. " | Preço: " .. v.Price)
  end
end

function Player:PutInBackpack(item)
  table.insert(self.Backpack, item)
  item.BackpackSlot = #self.Backpack
end

function Player:RemoveFromBackpack(slot)
  if next(self.Backpack, slot) == nil then return table.remove(self.Backpack, slot) end
  for i = next(self.Backpack, slot),#self.Backpack do
    self.Backpack[i].BackpackSlot = i - 1
  end
  slot.BackpackSlot = 0
  return table.remove(self.Backpack, slot)
end

return Player
