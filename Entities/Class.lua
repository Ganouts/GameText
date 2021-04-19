local Class = {}

function Class.Espadachim(player)
  if player.Class == "None" then
    player.Class = "Espadachim"
    player.Strength = 1
    player.Agility = 5
    player.Intelligence = 3
  end
end

function Class.Paladino(player)
  if player.Class == "None" then
    player.Class = "Paladino"
    player.Strength = 6
    player.Agility = 1
    player.Intelligence = 3
  end
end

function Class.Engineer(player)
  if player.Class == "None" then
    player.Class = "Engineer"
    player.Strength = 2
    player.Agility = 3
    player.Intelligence = 5
  end
end

return Class
