local Commands = {}

function Commands.View()
  print("/Exit ou /Sair para sair do jogo.")
end

function Commands.ReturnAttributes(object)
  if object.Damage then
    return object.Name, object.Type, object.Rarity, object.Description, object.Price, object.Marketable, object.Damage, object.Effect
  end
  if object.Defense then
    return object.Name, object.Type, object.Rarity, object.Description, object.Price, object.Marketable, object.Defense
  end
end

function Commands.VerifyInput(input, player)
  input = string.lower(input)
  if string.find(input, "exit") or string.find(input, "sair") then
    os.exit()
  elseif string.find(input, "attribute") or string.find(input, "atributo") then
    player:Attributes()
  elseif string.find(input, "profile") or string.find(input, "perfil") then
    player:Profile()
  end
end
function Commands.VerifyName(name)
--Verifica a resposta do usuário.
  function VerifyAnswer(answer)
    while true do
      if answer == "yes" or answer == "sim" then
        return false
      elseif answer == "no" or answer == "nao" then
        return true
      else
        print("Digite: (Yes/Sim) OU (No/Nao)")
        answer = string.lower(io.read())
      end
    end
  end
--[[Verificação do nome, se houver caracteres que não são letras, ele irá recusar o nome, se o nome tiver mais que 17 caracteres-
ele também irá recusar.]]
  if string.find(name, "%A") then
    print("Nome inválido, digite novamente...")
    return false
  elseif string.find(name, "%a", 17) then
    print("Nome inválido, digite novamente...")
    return false
  else
    print("Nome válido, deseja alterar? (Yes/Sim, No/Nao)")
    return VerifyAnswer(string.lower(io.read()))
  end
end

return Commands
