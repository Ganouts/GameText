local Player = require("Entities/Player")
local Inimigos = require("Entities/Enemies")
local Items = require("Entities/Items")
local Commands = require("Entities/Commands")

function InputLoop(player)
  while true do
    Commands.VerifyInput(io.read(), player)
  end
end

print("Bem vindo ao GameText!")
--Criação de personagem vv
local PlayerOne = Player.New()
while true do
  print("Insira um nome ao seu personagem:")
  --Se o nome digitado pelo jogador for válido, execute o resto do código vv
  local NameAnswer = io.read()
  if Commands.VerifyName(NameAnswer) then
    PlayerOne:ChangeName(NameAnswer)
    print("Escolha uma classe: (Espadachim-Agility|Paladino-Strength|Engineer-Intelligence)")
    PlayerOne:ChooseClass(io.read())
    print("Personagem criado!")
    InputLoop(PlayerOne)
  end
end
