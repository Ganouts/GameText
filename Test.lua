local Commands = require("Entities/Commands")
local Player = require("Entities/Player")
local Items = require("Entities/Items")
local Weapons = require("Entities/Weapons")
local Shields = require("Entities/Shields")

local Jogador = Player.New()
Player:ChangeName("TestPlayer")

local Espada = Items.New("The Lost Sword", "Sword", "Rare", "The sword", 999.9, false, true, false)
local Colar = Items.New("Divine Blessing", "Necklace", "Rare", "O Colar da Deusa", 100, false, true, false)
local Escudo = Items.New("The Shield of Power", "Shield", "Common", "Um poderoso escudo.", 35, true, true, false)
local Espada2 = Items.New("The Found Sword", "Sword", "Epic", "The sword has found", 1000, false, true, false)

Jogador:PutInBackpack(Espada)
Jogador:PutInBackpack(Colar)
Jogador:PutInBackpack(Escudo)
Jogador:PutInBackpack(Espada2)
Jogador:ViewBackpack()

print("___________________________________________________________________________________")
Jogador:RemoveFromBackpack(3)
Jogador:ViewBackpack()
print("---------------------------------------------------")
print(Commands.ReturnAttributes({5,4,3,2,1}))
local EspadaTeste = Weapons.Create("Sword", "Espada Devastada")
for i,v in pairs(EspadaTeste) do
  print(i .. " : " .. tostring(v))
end
print("_________//")
EspadaTeste:ViewDescription()
print("___________________________________________________________________________________")
