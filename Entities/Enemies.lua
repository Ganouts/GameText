local Enemies = {}

function Enemies.New(level, class, health, strength, agility, intelligence)
  local instance = {
    Level = level,
    Backpack = {},
    Class = class,
    Health = health,
    Strength = strength,
    Agility = agility,
    Intelligence = intelligence,
    Hands = {Left = "Empty", Right = "Empty"},
    Body = {Head = "Empty", Chest = "Empty", Waist = "Empty", Legs = "Empty", Foot = "Empty"},
    Damage = 0,
    Defense = 0,
    --Estados
    Live = true
  }
  setmetatable(instance, {__index = Enemy})
  return instance
end

function Enemies:Stats()
  print("Nível:" .. self.Level)
  print("Saúde:" .. self.Health)
  print("Força:" .. self.Strength)
  print("Agilidade:" .. self.Agility)
  print("Inteligência:" .. self.Intelligence)
end

function Enemies:IsLive()
  if self.Health <= 0 then
    self.Live = false
    self.Health = 0
    return false
  else
    self.Live = true
    return true
  end
end

function Enemies:TakeDamage()
  if self.Live == true then
    self.Health = self.Health - tonumber(damage)
  else
    self.Health = 0
  end
  self:IsLive()
end

function Enemies:AttackPlayer(player)
  player:TakeDamage(self.Damage)
end

return Enemies
