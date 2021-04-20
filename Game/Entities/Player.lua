local Class = require("Entities/Class")
local Commands = require("Entities/Commands")
local Player = {}
Player.__index = Player

function Player.New()
  local instance = {
    Name = "None", -- O Nome do personagem.
    Class = "None", -- Classe(Espadachim, Engenheiro, Paladino).
    Age = 20, -- Idade.
    Experience = 0, -- Experiencia.
    MaxExperience = 100, --O Máximo de experiencia.
    Level = 1, --O Level, cada level tem seu máximo de experiencia próprio.
    Money = 0,  -- O dinheiro do jogo, usado para comprar itens.
    Health = 100, -- Vida atual.
    MaxHealth = 100, -- Vida máxima.
    Damage = 0, --Dano causado aos inimigos.
    Resistance = 0, -- Dano reduzido ao receber.
    Defense = 0, --Chance de defender por porcentagem.
    Backpack = {}, --Mochila do player.
    Hands = {Shield = "none", Weapon = "none"}, --Shield = Escudo | Weapon = Arma
    Body = {Armor = "none", Backpack = "none"}, --Armor = Armadura | Backpack = Mochila
    --Estados
    Live = true,
    InShop = false,
  }

  setmetatable(instance, Player)
  return instance
end

--[[function Player:EquipItem(item)

end]]

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

return Player
