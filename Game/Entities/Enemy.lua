--Módulos//
local Commands = require("Entities/Commands")
local Backpack = require("Entities/Backpack")

local Enemy = {}
Enemy.__index = Enemy

--Função construtora//
function Enemy.New(_class, _description, _level, _healthMax)
  local instance = {
    Class = _class, -- Classe do inimigo.
    Description = _description, -- Descrição do inimigo.
    Level = _level, -- Level do inimigo.
    HealthMax = _healthMax, -- Vida máxima.
    Health = _healthMax, -- Vida atual.
    Damage = 0, -- Dano causado.
    Resistance = 0, -- Dano reduzido ao receber.
    Defense = 0, -- Dano reduzido ao se defender em porcentagem.
    Dodge = 0, -- Chance de esquiva em porcentagem.
    Backpack = Backpack.New(0.5, "Mochila dos inimigos."), -- Mochila do inimigo.
    Hands = {Shield = "none", Weapon = "none"}, --Shield = Escudo | Weapon = Arma
    Body = {Armor = "none"}, --Armor = Armadura
    --Estados//
    Live = true
  }

  setmetatable(instance, Enemy)
  return instance
end

--Métodos//
function Enemy:Stats()
  print("Classe:" .. self.Class)
  print("Nível:" .. self.Level)
  print("Saúde:" .. self.Health)
  print("Dano:" .. self.Damage)
  print("Resistência:" .. self.Resistance)
  print("Defesa" .. self.Defense)
  print("Chance de esquiva:" .. self.Dodge .. "%")
end

function Enemy:IsLive()
  if self.Health <= 0 then
    self.Live = false
    self.Health = 0
    print(self.Class .. " morreu!")
    return false
  else
    self.Live = true
    return true
  end
end

function Enemy:TakeDamage(damage)
  if self.Live == true then
    self.Health = self.Health - damage
  else
    self.Health = 0
  end
  self:IsLive()
end

function Enemy:Attack(player)
  player:TakeDamage(self.Damage)
  print(self.Class .. " ataca " .. player.Name .. " causando " .. self.Damage .. "!")
end

return Enemy
