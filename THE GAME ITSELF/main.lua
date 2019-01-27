--  Authors: William Xie, Jaafar Kaoussarani, Marianick Benoit, Jason Ma  --
--  File: main.lua                            --
--  Description: Executes the program         --

require "font"
require "camera"
require "physics"
require "config"
require "player"
require "map"
require "menu"

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

function love.load()
  windowSet(WINDOW_WIDTH, WINDOW_HEIGHT) --1280*720
  loadFont()
  menu = Menu()
  physicsInit()
  map = Map()
  player = Player()
end

function love.update(dt)
  if menu then
    menu:update(dt)
  else
    world:update(dt)
    camera:setPosition(player.body:getX() - WINDOW_WIDTH/2, -WINDOW_HEIGHT/2)
    player:update(dt)
  end
end


function love.draw()
  if menu then
    menu:draw()
  else
    camera:set()
    player:draw()
    map:draw()
    camera:unset()
  end
end
