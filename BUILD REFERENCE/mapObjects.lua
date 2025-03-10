-- COLLECTION OF MAP OBJECTS -- 
require "physics"
require "player"
local timer = 100
MANORMUSIC = love.audio.newSource("Music/spooky-ambience-2.wav","static")

--GENERAL--
function loadGeneral()
  general = {} -- Table to hold all our general objects
end

function drawGeneral()
  
end

-- INTRO LEVEL --
function loadIntro()
  
  outdoors = love.graphics.newImage("Images/Art-marte/outside.png")
  
  intro = {} -- Table to hold all our intro level objects
  intro.ground = {}
  intro.ground.body = love.physics.newBody(world, WINDOW_WIDTH/2 + 512, WINDOW_HEIGHT/2, static)
  intro.ground.shape = love.physics.newRectangleShape(2048, 60)
  intro.ground.fixture = love.physics.newFixture(intro.ground.body, intro.ground.shape, 0)
  intro.ground.image = love.graphics.newImage("Images/Art-marte/ground0000.png")
  
  intro.wall= {}
  intro.wall.body = love.physics.newBody(world, (WINDOW_WIDTH/2) - 484, WINDOW_HEIGHT/2 - 272, static)
  intro.wall.shape = love.physics.newRectangleShape(64, 600)
  intro.wall.fixture = love.physics.newFixture(intro.wall.body, intro.wall.shape, 0)
  intro.wall.image = love.graphics.newImage("Images/Art-marte/supertalltree0000.png")
  
  intro.door = {}
  intro.door.body = love.physics.newBody(world, (WINDOW_WIDTH) + 256 - 20, (WINDOW_HEIGHT/2) - 128 - 32)
  intro.door.shape = love.physics.newRectangleShape(256, 256)
  intro.door.fixture = love.physics.newFixture(intro.door.body, intro.door.shape, 0)
  intro.door.fixture:setMask(1)
  intro.door.image = love.graphics.newImage("Images/Art-marte/puerta0000.png")
  
  intro.sign = {}
  intro.sign.body = love.physics.newBody(world, WINDOW_WIDTH/2 + 1200, intro.ground.body:getY() - 64 - 32)
  intro.sign.shape = love.physics.newRectangleShape(128,128)
  intro.sign.fixture = love.physics.newFixture(intro.sign.body, intro.sign.shape, 0)
  intro.sign.fixture:setMask(1)
end

local readSign1 = false
function updateIntro(player)
  if intro.door.fixture:testPoint(player.body:getX(),player.body:getY()) then
    if love.keyboard.isDown("z") then
      love.audio.play(MANORMUSIC)
      player.body:setX(intro.ground.body:getX() - 512)
      player.body:setY(intro.ground.body:getY() + 1000 - 64)
      levelConstant = 1000
    end
  end
  if intro.sign.fixture:testPoint(player.body:getX(), player.body:getY()) then
    if love.keyboard.isDown("z") then
      readSign1 = true
    end
  end
end

function drawIntro(player)
  -- Draw the wall
  love.graphics.draw(outdoors, 0-1280, -720/2)
  love.graphics.draw(outdoors, 0, -720/2)
  love.graphics.draw(outdoors, 0+2000, -720/2)
  love.graphics.setColor(1,1,1)
  for x = (WINDOW_WIDTH/2) - 500, (WINDOW_WIDTH/2) - 500, 16 do 
    love.graphics.draw(intro.wall.image, x, intro.wall.body:getY() - 1000)
  end
  
  -- Draw the ground
  for x = (WINDOW_WIDTH/2) - 512, (WINDOW_WIDTH/2) + 1024 + 512 - 16, 16 do 
      for y = (WINDOW_HEIGHT/2 - 32), WINDOW_HEIGHT/2, 16 do  
        love.graphics.draw(intro.ground.image, x, y)
      end
  end
  
  if(readSign1) then
    if timer > 0 then
      love.graphics.print("Beware of really REALLY vertical cliff", intro.sign.body:getX() -100, intro.sign.body:getY() -150)
    end
    if timer == 0 then
      readSign1 = false
      timer = 100
    end
    timer = timer - 1
  end
  
  --love.graphics.draw(image, 1328, (WINDOW_HEIGHT/2 - 278))
  love.graphics.draw(intro.door.image, (intro.door.body:getX() - 128), (intro.door.body:getY() - 128))
  love.graphics.setColor(0.5, 0.2, 0.05)
  love.graphics.rectangle("fill", intro.sign.body:getX() - 32 , intro.ground.body:getY() - 64 - 16 , 10, 50)
  love.graphics.rectangle("fill", intro.sign.body:getX() - 57 , intro.ground.body:getY() - 64 - 16 - 35 , 60, 40)
  love.graphics.setColor(1,1,1)
 --love.graphics.polygon("fill", intro.ground.body:getWorldPoints(intro.ground.shape:getPoints()))
 
 if intro.door.fixture:testPoint(player.body:getX(),player.body:getY()) or intro.sign.fixture:testPoint(player.body:getX(),player.body:getY()) then
   love.graphics.setColor(1,1,1)
   love.graphics.rectangle("fill", player.body:getX() -8 , player.body:getY() - 64, 16, 16)
   love.graphics.print("Z", player.body:getX() -4, player.body:getY() - 64)
end
end

-- HUB (+1000) --

function loadHub()
  manor = love.graphics.newImage("Images/Art-marte/manor.png")
  hub = {} -- Table to hold all our intro level objects
  hub.ground = {}
  hub.ground.body = love.physics.newBody(world, WINDOW_WIDTH/2, 1000 + WINDOW_HEIGHT/2)
  hub.ground.shape = love.physics.newRectangleShape(2048, 64)
  hub.ground.fixture = love.physics.newFixture(hub.ground.body, hub.ground.shape, 0)
  hub.ground.image = love.graphics.newImage("Images/Art-marte/wood0000.png")
  
  hub.door = {}
  hub.door.body = love.physics.newBody(world, WINDOW_WIDTH/2, hub.ground.body:getY() - 128 - 32)
  hub.door.shape = love.physics.newRectangleShape(256, 256)
  hub.door.fixture = love.physics.newFixture(hub.door.body, hub.door.shape, 0)
  hub.door.fixture:setMask(1)
  hub.door.image = love.graphics.newImage("Images/Art-marte/puerta0000.png")
  
  hub.sign = {}
  hub.sign.body = love.physics.newBody(world, WINDOW_WIDTH/2 + 600, hub.ground.body:getY() - 64 - 32)
  hub.sign.shape = love.physics.newRectangleShape(128,128)
  hub.sign.fixture = love.physics.newFixture(hub.sign.body, hub.sign.shape, 0)
  hub.sign.fixture:setMask(1)
  
end

triedToGoBack = false
readSign = false

function updateHub(player)
  if hub.door.fixture:testPoint(player.body:getX(), player.body:getY()) then
    if love.keyboard.isDown("z") then
      triedToGoBack = true
    end
  end
  if hub.sign.fixture:testPoint(player.body:getX(), player.body:getY()) then
    if love.keyboard.isDown("z") then
      readSign = true
    end
  end
end

function drawHub(player)
  --love.graphics.polygon("fill", hub.ground.body:getWorldPoints(hub.ground.shape:getPoints()))
  love.graphics.draw(manor, -75-1280, 650)
  love.graphics.draw(manor, -75, 650)
  love.graphics.draw(manor, -75+ 1280, 650)
  --love.graphics.circle("fill", 500, 500, 20)
  if(triedToGoBack) then
    if timer > 0 then
      love.graphics.print("Seems to be locked...", hub.door.body:getX() -100, hub.door.body:getY() -150)
    end
    if timer == 0 then
      triedToGoBack = false
      timer = 100
    end
    timer = timer - 1
  end
  
  if(readSign) then
    if timer > 0 then
      love.graphics.print("Devs fell asle-", hub.sign.body:getX() -100, hub.sign.body:getY() -150)
      love.graphics.print("(Actual Game Coming Soon!)", hub.sign.body:getX() -100, hub.sign.body:getY() -50)
    end
    if timer == 0 then
      readSign = false
      timer = 100
    end
    timer = timer - 1
  end
  
  
  for x =  hub.ground.body:getX() - 1024, hub.ground.body:getX() + 1024, 16 do 
      for y = (hub.ground.body:getY() - 32), hub.ground.body:getY(), 16 do  
        
        love.graphics.draw(hub.ground.image, x, y)
        
      end
  end
  
  love.graphics.draw(hub.door.image, hub.ground.body:getX() - 128, hub.ground.body:getY() - 256 - 32)
  love.graphics.setColor(0.5, 0.2, 0.05)
  love.graphics.rectangle("fill", hub.sign.body:getX() - 32 , hub.ground.body:getY() - 64 - 16 , 10, 50)
  love.graphics.rectangle("fill", hub.sign.body:getX() - 57 , hub.ground.body:getY() - 64 - 16 - 35 , 60, 40)
  
  if hub.door.fixture:testPoint(player.body:getX(), player.body:getY()) or hub.sign.fixture:testPoint(player.body:getX(), player.body:getY()) then
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("fill", player.body:getX() -8 , player.body:getY() - 64, 16, 16)
    love.graphics.print("Z", player.body:getX() -4, player.body:getY() - 64)
  end
end

-- LEVEL 1 (+2000) --
function loadLevel1()
  level1 = {} -- Table to hold all our intro level objects

  level1.ground = {}
  level1.ground.body = love.physics.newBody(world, WINDOW_WIDTH/2, 2000 + WINDOW_HEIGHT/2)
  level1.ground.shape = love.physics.newRectangleShape(1000, 50)
  level1.ground.fixture = love.physics.newFixture(level1.ground.body, level1.ground.shape, 0)
  level1.ground.image = love.graphics.newImage("Images/Art-marte/wood0000.png")
end


function drawLevel1()
  --love.graphics.polygon("fill", level1.ground.body:getWorldPoints(level1.ground.shape:getPoints()))
  
  for x = 0, WINDOW_WIDTH, 16 do 
      for y = ((2000 + (WINDOW_HEIGHT/2)) - 25), WINDOW_HEIGHT, 16 do  
        
        love.graphics.draw(level1.ground.image, x, y)
        
      end
  end

end

-- LEVEL 2 (+3000) --
function loadLevel2()
  level2 = {} -- Table to hold all our intro level objects

  level2.ground = {}
  level2.ground.body = love.physics.newBody(world, WINDOW_WIDTH/2, 3000 + (WINDOW_HEIGHT)/2)
  level2.ground.shape = love.physics.newRectangleShape(1000, 50)
  level2.ground.fixture = love.physics.newFixture(level2.ground.body, level2.ground.shape, 0)
  level2.ground.image = "hey"
end

function drawLevel2()
  love.graphics.polygon("fill", level2.ground.body:getWorldPoints(level2.ground.shape:getPoints()))
end

-- LEVEL 3 (+4000) --
function loadLevel3()
  level3 = {} -- Table to hold all our intro level objects

  level3.ground = {}
  level3.ground.body = love.physics.newBody(world, WINDOW_WIDTH/2, 4000+WINDOW_HEIGHT/2)
  level3.ground.shape = love.physics.newRectangleShape(1000, 50)
  level3.ground.fixture = love.physics.newFixture(level3.ground.body, level3.ground.shape, 0)
  level3.ground.image = "hey"
end

function drawLevel3()
  love.graphics.polygon("fill", level3.ground.body:getWorldPoints(level3.ground.shape:getPoints()))
end