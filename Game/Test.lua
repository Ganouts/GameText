--Modules
local Player = require("Entities/Player")
local Backpack = require("Entities/Backpack")
local Item = require("Entities/Items")

local Mochila = Backpack.New(1)

Mochila:PutInBackpack({Name = "Cordão elementar"})
Mochila:RemoveFromBackpack(2)
Mochila:RemoveFromBackpack(1)
