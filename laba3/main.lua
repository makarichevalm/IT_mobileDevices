local physics = require("physics")
physics.start()

local Text = display.newText("Счет:", 200, 0, "Helvetica", 40)
local Text1 = display.newText("Рекорд:", 177, -50, "Helvetica", 40)
local x = 0
local maxScore = 0
local Score = display.newText(x, 280, 0, "Helvetica", 40)
local MaxScore = display.newText(maxScore, 280, -50, "Helvetica", 40)

local control = display.newCircle(160, 440, 50)
control.fill ={type="image", filename="smile.png"}
--control:setFillColor(1, 0, 0)
physics.addBody(control,"static")
control.gravityScale = 0
--перемещение перетаскиванием
local function MoveOB(event)
    if(event.phase == "began") then
        display.currentStage:setFocus(control)
        control.touchOfsetX = event.x-control.x
        control.touchOfsetY = event.y-control.y
    end
    if(event.phase == "moved") then
        control.x = event.x-control.touchOfsetX
        control.y = event.y-control.touchOfsetY
    end
    if(event.phase == "ended") then
        display.currentStage:setFocus(nil)
    end
end
control:addEventListener("touch", MoveOB)
--обработка столкновения
local function crash(self, event)
    if(event.phase == "began" and event.other.ID == "good")then
        x = x+1
        event.other:removeSelf()
        Score.text = x
    end
    if(event.phase == "began" and event.other.ID == "bad")then
        if x > maxScore then
            maxScore = x
        end
        x = 0
        event.other:removeSelf()
        MaxScore.text = maxScore
        Score.text = x
    end
end
--падение
local function spawnGood()
    local x = math.random(35,285)
    local r = math.random(10, 35)
    local myCir = display.newCircle(x,0,r)
    myCir.isSensor = true 
    myCir.ID = "good"
    myCir.fill ={type="image", filename="apple.png"}
    --myCir:setFillColor(0, 1, 0)
    physics.addBody(myCir,"dinamic")
    myCir.gravityScale = math.random(2, 4) / 10
    myCir:applyLinearImpulse(0, 0, myCir.x, myCir.y)
    
end
timer.performWithDelay(2000,spawnGood,0)
--падение
local function spawnBad()
    local x = math.random(35,285)
    local r = math.random(10, 35)
    local myCir = display.newCircle(x,0,r)
    myCir.isSensor = true 
    myCir.ID = "bad"
    myCir.fill ={type="image", filename="ball.png"}
    --myCir:setFillColor(0, 0, 1)
    physics.addBody(myCir,"dinamic")
    myCir.gravityScale = math.random(2, 4) / 10
    myCir:applyLinearImpulse(0, 0, myCir.x, myCir.y)
end
timer.performWithDelay(3000,spawnBad,0)
-- обработка столкновения функцией crash
control.collision = crash
control:addEventListener("collision", myCir)

