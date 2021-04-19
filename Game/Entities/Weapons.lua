--Módulos e Classes
local Equipables = require("Entities/Equipables")
local Commands = require("Entities/Commands")
--Módulo
local Weapons = {}

function Weapons.New(name, type, rarity, description, price, marketable, damage, effect)
  local instance = Equipables.New(name, type, rarity, description, price, marketable)
  instance.Damage = damage
  instance.Effect = effect
  return instance
end

function Weapons.Create(type, name)
  return Weapons.New(Commands.ReturnAttributes(Weapons[type][name]))
end

--[[ Propriedades das Armas.
Name = ,
Type = ,
Rarity = ,
Description = ,
Price = ,
Marketable = ,
Damage = ,
Effect = ,
]]
--21 ARMAS ADICIONADA!
Weapons.Sword = {
  ["Azyt"] = {
    Name = "Azyt",
    Type = "Espada",
    Rarity = "Comum",
    Description = "Uma espada inicial portada pelo Espadachim.",
    Price = 4,
    Marketable = true,
    Damage = 2,
    Effect = "Sangramento",
  },
  ["Espada Devastada"] = {
    Name = "Espada Devastada",
    Type = "Espada",
    Rarity = "Comum",
    Description = "Uma espada velha e enferrujada.",
    Price = 10,
    Marketable = true,
    Damage = 3,
    Effect = false,
  },
  ["Espada de Aventureiro"] = {
    Name = "Espada de Aventureiro",
    Type = "Espada",
    Rarity = "Comum",
    Description = "Uma espada comum e muito usada por iniciantes.",
    Price = 110,
    Marketable = true,
    Damage = 15,
    Effect = false,
  },
  ["Cogumoi"] = {
    Name = "Cogumoi",
    Type = "Espada",
    Rarity = "Raro",
    Description = "Uma espada feita de cogumelos e um raro metal. Carrega consigo esporos capazes de causar confusão naqueles que não estão habituados à presença dos mesmos.",
    Price = 550,
    Marketable = false,
    Damage = 30,
    Effect = "Atordoamento",
  },
  ["Celestial"] = {
    Name = "Celestial",
    Type = "Espada",
    Rarity = "Raro",
    Description = "Um anjo celestial teve sua espada roubada por sua bondade e coração puro. O ladrão que saqueou essa preciosidade ama a cor dourada, cor essa que está presente em toda parte de seu trabalho.",
    Price = 750,
    Marketable = true,
    Damage = 46,
    Effect = false,
  },
  ["Astro"] = {
    Name = "Astro",
    Type = "Espada",
    Rarity = "Raro",
    Description = "Astro é um belíssima espada feita de um metal estranho que parece que a superficie da espada é um céu  com varias estrelas, mas estranhamente essa espada tem um fio impecável.",
    Price = 890,
    Marketable = true,
    Damage = 55,
    Effect = false,
  },
  ["Ragnarok"] = {
    Name = "Ragnarok",
    Type = "Espada",
    Rarity = "Épico",
    Description = "Essa espada leva esse nome por ter já tirado o nome de vários guerreiros, sua lâmina tinha a cor prata, mas agora está permanentemente manchada de vermelho, o sangue se cristalizou tornando a lâmina serrilhada mas tambem tirando parte de sua fio.",
    Price = 1100,
    Marketable = false,
    Damage = 68,
    Effect = "Sangramento",
  },
  ["Lâmina do Rei Construído"] = {
    Name = "Lâmina do Rei Construído",
    Type = "Espada",
    Rarity = "Épico",
    Description = "A lâmina de um Rei digno que mesmo após perder sua esposa manteve seu reinado e trouxe paz para as regiões onde se assentava o reino.",
    Price = 1700,
    Marketable = true,
    Damage = 102,
    Effect = "Deterioração",
  },
  ["A Espada"] = {
    Name = "A Espada",
    Type = "Espada",
    Rarity = "Lendário",
    Description = "Uma espada que gerou todas as outras, dizem que ela é uma lenda, será mesmo?",
    Price = 99999,
    Marketable = false,
    Damage = 999,
    Effect = "Sangramento",
  },
}

Weapons.Dagger = {
  ["Lâmina do Tolo"] = {
    Name = "Lâmina do Tolo",
    Type = "Adaga",
    Rarity = "Comum",
    Description = "Se fossemos dividir armas em um formato de cadeia alimentar, essa pequena adaga com certeza estaria no fundo. Feita por um amador, a lâmina se encontra em péssimo estado.",
    Price = 60,
    Marketable = true,
    Damage = 8,
    Effect = false,
  },
  ["Adaga de Jade"] = {
    Name = "Adaga de Jade",
    Type = "Adaga",
    Rarity = "Incomum",
    Description = "Uma bela adaga feita do material Jade, provavelmente usada em cerimônias, cuidado ao usar, fragil.",
    Price = 300,
    Marketable = true,
    Damage = 25,
    Effect = false,
  },
  ["Adaga do Cultista"] = {
    Name = "Adaga do Cultista",
    Type = "Adaga",
    Rarity = "Épico",
    Description = "O antigo portador dessa adaga almejava a morte de todos a sua volta.",
    Price = 980,
    Marketable = true,
    Damage = 60,
    Effect = "Sangramento",
  },
}

Weapons.Hammer = {
  ["Zenth"] = {
    Name = "Zenth",
    Type = "Martelo",
    Rarity = "Comum",
    Description = "Martelo inicial portado pelo Paladino.",
    Price = 5,
    Marketable = true,
    Damage = 3,
    Effect = "Atordoamento",
  },
  ["Garra de Nefesto"] = {
    Name = "Garra de Nefesto",
    Type = "Martelo",
    Rarity = "Épico",
    Description = "O grande martelo de guerra leva o esse nome por causa de seu portador original \"Nefesto\" \"Causador da Desgraça\",\"Garra\" vem das aparentes pontas vindas de cada extremidade do martelo, Muitos não a desejam por ser uma faca de dois gumes, podendo trazer tanto a desgraça ao seus inimigos quanto a do usuario.",
    Price = 1800,
    Marketable = false,
    Damage = 120,
    Effect = "Deterioração",
  },
}

Weapons.Bow = {
  ["Zhan"] = {
    Name = "Zhan",
    Type = "Arco",
    Rarity = "Comum",
    Description = "Arco inicial portado pelo Engineer.",
    Price = 4,
    Marketable = true,
    Damage = 2,
    Effect = "Deterioração",
  },
  ["Última pontada"] = {
    Name = "Última pontada",
    Type = "Arco",
    Rarity = "Incomum",
    Description = "Um básico arco encatado que permite que flechas atiradas pelo mesmo tenham efeitos calmantes em seus alvos. Ferramenta muito utilizada em caçadas.",
    Price = 95,
    Marketable = true,
    Damage = 12,
    Effect = "Deterioração",
  },
  ["Ventos Fortes"] = {
    Name = "Ventos Fortes",
    Type = "Arco",
    Rarity = "Raro",
    Description = "Ventos fortes era um antigo arco, cujo nome ainda tem muitas dúvidas sobre o significado.",
    Price = 590,
    Marketable = true,
    Damage = 35,
    Effect = "Atordoamento",
  },
}

Weapons.Axe = {
  ["Machado Pouco Deteriorado"] = {
    Name = "Machado Pouco Deteriorado",
    Type = "Machado",
    Rarity = "Comum",
    Description = "Um machado um pouco deteriorado... por lutas?",
    Price = 710,
    Marketable = true,
    Damage = 40,
    Effect = false,
  },
  ["Cortatouro"] = {
    Name = "Cortatouro",
    Type = "Machado",
    Rarity = "Incomum",
    Description = "Ferramenta utilizada por um hábil açougueiro, conhecido pelo seu uso peculiar de machados durante o preparo da carne.",
    Price = 269,
    Marketable = true,
    Damage = 20,
    Effect = "Sangramento",
  },
  ["Mast"] = {
    Name = "Mast",
    Type = "Machado",
    Rarity = "Épico",
    Description = "Esse machado tem sua lâmina azul e um tamanho um tanto quanto estranho, um tamanho anormal para um machado \"Grande como um mastro, pesado como uma onda\" dizem que cada impacto dessa arma é igual ao som de ondas numa tempestade.",
    Price = 1200,
    Marketable = true,
    Damage = 85,
    Effect = "Atordoamento",
  },
}
return Weapons
