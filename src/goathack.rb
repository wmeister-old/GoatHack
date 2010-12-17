require 'chingu'
include Gosu
require 'goathack/entity'
require 'goathack/text'
require 'goathack/tile'
require 'goathack/creature'
require 'goathack/player'
require 'goathack/map'
require 'goathack/object_map'
require 'goathack/window'
require 'goathack/game'

module Goathack
  TILE_SIZE = 32
  HALF_TILE_SIZE = (TILE_SIZE / 2).to_i
  LEVEL_WIDTH = 25
  LEVEL_HEIGHT = 15
  LEVEL_GRID = [LEVEL_WIDTH, LEVEL_HEIGHT]
  DATA_PATH = File.expand_path("#{File.dirname(__FILE__)}/../data")
  TILE_PATH = "#{DATA_PATH}/tiles"
  FONT_PATH = "#{DATA_PATH}/fonts"
  FONT = "#{FONT_PATH}/diablo.ttf" # XXX check this exists and pick something else if it doesn't
  FONT_SIZE = 18
end


