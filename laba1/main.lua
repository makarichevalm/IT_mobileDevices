local background = display.newImageRect("view.jpg",500, 800);
background.x = display.contentCenterX
background.y = display.contentCenterY
local physics = require "physics"
physics.start()
local Rec1 = display.newRect(30, 300, 150, 50)
Rec1:setFillColor(black)
physics.addBody(Rec1, "static")
local Rec2 = display.newRect(280, 170, 150, 50)
Rec2:setFillColor(black)
physics.addBody(Rec2, "static")
local Rec3 = display.newRect(40, 90, 150, 50)
Rec3:setFillColor(black)
physics.addBody(Rec3, "static")
--local MyCir = display.newCircle(140,350,25)
--physics.addBody(MyCir, "dinamic")
local ball = display.newImageRect("ball.png",50, 50);
ball.x = 140
ball.y = 350
physics.addBody(ball, "dinamic")
local RecVent1 = display.newImageRect("down.png", 150, 60);
RecVent1.x = 40
RecVent1.y = 525
--local RecVent1 = display.newRect(50, 490, 150, 50);
--RecVent1:setFillColor(black)
RecVent1:rotate(35)
physics.addBody(RecVent1, "static")
local RecVent2 = display.newImageRect("down.png", 150, 60);
RecVent2.x = 270
RecVent2.y = 525
--local RecVent2 = display.newRect(270, 490, 150, 50)
--RecVent2:setFillColor(black)
RecVent2:rotate(-35)
physics.addBody(RecVent2, "static")

local function push1()
    ball:applyLinearImpulse(0.1, -0.3,ball.x, ball.y)
end
local function push2()
    ball:applyLinearImpulse(-0.1, -0.3,ball.x, ball.y)
end
RecVent1:addEventListener("tap", push1)
RecVent2:addEventListener("tap", push2)

local RectRight = display.newRect(340,240,5,500);
RectRight.alpha = 0;
physics.addBody(RectRight, "static");
local RectLeft = display.newRect(0,240,0,500);
--MyLine:setStrokeColor(0,1,0,1) 
RectLeft.alpha = 0;
physics.addBody(RectLeft, "static");
local RectTop = display.newRect(160,-40,320,0);
RectTop.alpha = 0;
physics.addBody(RectTop, "static");