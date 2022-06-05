local composer = require("composer")
local widget = require ("widget")
local scene = composer.newScene()-- объявление сцены
local physics = require "physics"
physics.start()

local function handleButtonRecord( event )
    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
    local audio1Channel = audio.play( audio1, {channel=1} )
    audio.setVolume( 0.5, {channel=1} )
    composer.gotoScene( "scenes.records", { time=800, effect="slideRight" } )
    end
end
local function handleButtonChoose( event )
    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
        local audio1Channel = audio.play( audio1, {channel=1} )
        audio.setVolume( 0.5, {channel=1} )
        composer.gotoScene( "scenes.levels", { time=800, effect="slideRight" } )
    end
end
function scene:create( event )
    local sceneGroup = self.view
    local background = display.newImageRect("img/phone.jpg", 1000, 750);
    background.x = display.contentCenterX+100
    background.y = display.contentCenterY
    local menu = display.newImageRect("img/txt.png",650, 250);
    menu.x = 160;
    menu.y = 40;
    --[[local backgroundMusic = audio.loadSound( "music/menu.mp3" )
    local Musicoptions =
    {
        channel = 2,
        loops = -1,
    }
    local laserChannel = audio.play( backgroundMusic,Musicoptions)]]
    local audio1 = audio.loadSound( "music/click.mp3" )
    -- Function to handle button events
    
    local buttonRecord = widget.newButton(
        {
            width = 300,
            height = 90,
            defaultFile = "img/but.png",
            label = "View records",
            font = "IdealGothicBold.otf",
            fontSize = 28,
            labelColor = { default={ 1, 1, 1 }, over={ 1, 1, 1, 0.5 } },
            onEvent = handleButtonRecord
        }
    )
    buttonRecord.x = display.contentCenterX
    buttonRecord.y = display.contentCenterY+150

    
    local buttonChoose = widget.newButton(
        {
            width = 300,
            height = 90,
            defaultFile = "img/but.png",
            label = "Select a level",
            font = "IdealGothicBold.otf",
            fontSize = 28,
            labelColor = { default={ 1, 1, 1 }, over={ 1, 1, 1, 0.5 } },
            onEvent = handleButtonChoose
        }
    )
    buttonChoose.x = display.contentCenterX
    buttonChoose.y = display.contentCenterY+70
end
-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene


