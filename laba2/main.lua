local physics = require "physics"
physics.start()
local but = display.newCircle(-90,300,50)
physics.addBody(but, "dinamic")
but.isSensor = true
but.gravityScale = 0
local player = display.newCircle(40,0,25)
player:setFillColor(1, 0, 0) 
physics.addBody(player, "dinamic")
player.isSensor = true
player.gravityScale = 0.5

local function push()
    player:applyLinearImpulse(0, -0.2,player.x, player.y)
end
but:addEventListener("tap", push)



--Счет
local Text = display.newText("Счет:", -40, 20, "Helvetica", 30)

local x = 0
local Score = display.newText(x, 10, 20, "Helvetica", 30)
--

local function spawn()
    local y1 = math.random(100,150)
    local y2 = math.random(100,150)
    --local Rec1 = display.newRect(x, 60, 50, 120)
    local Rec1 = display.newRect(600, 140-y1, 50, 140)--240-y1-100
    physics.addBody(Rec1, "dinamic")
    --local Rec2 = display.newRect(x, 270, 50, 120)
    local Rec2 = display.newRect(600, 160+y2, 50, 140)
    physics.addBody(Rec2, "dinamic")
    Rec1.gravityScale = 0
    Rec2.gravityScale = 0
    Rec1:applyLinearImpulse(-0.15, 0, Rec1.x, Rec1.y)
    Rec2:applyLinearImpulse(-0.15, 0, Rec2.x, Rec2.y)
    --local mySens = display.newCircle(600,y1+20,20)--сенсор между прямоугольниками
    --mySens:setFillColor(1,0,0,0.7)
    --physics.addBody(mySens,"dinamic")
    --mySens.gravityScale = 0
    --mySens:applyLinearImpulse(-0.15, 0, mySens.x, mySens.y)
    --mySens.isSensor = true
    --mySens.ID = "target"
end
timer.performWithDelay(2500,spawn,0)--  через сколько миллисекунд, функция, сколько раз вызывать функцию




