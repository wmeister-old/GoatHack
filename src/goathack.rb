require 'chingu'
include Gosu

$map = <<MAP
------------
|..........|
|..........|
|..........|
|..........|
|..........|
------------
MAP


    

module Goathack
  TILE_SIZE = 32
  HALF_TILE_SIZE = (TILE_SIZE / 2).to_i
  LEVEL_WIDTH = 25
  LEVEL_HEIGHT = 15
  LEVEL_GRID = [LEVEL_WIDTH, LEVEL_HEIGHT]

  module Tile
    def self.load_all(window)
      @@creature = Gosu::Image.load_tiles(window, '../data/tiles/creatures.png', TILE_SIZE, TILE_SIZE, false)
      @@dungeon  = Gosu::Image.load_tiles(window, '../data/tiles/dungeon.png', TILE_SIZE, TILE_SIZE, false)
    end

    def self.tile_not_found(name)
      raise "Tile '#{name}' not found!"
    end

    def self.creature(name)
      if name == :player
        @@creature[44]
      else
        tile_not_found(name)
      end
    end

    def self.dungeon(name)
      if name == :wall
        @@dungeon[0]
      elsif name == :floor
        @@dungeon[57]
      else
        tile_not_found(name)
      end
    end
  end

  class Window < Chingu::Window
    def initialize
      super(800, 600, false)
      Tile.load_all(self)
      Goathack::Map.level << Goathack::Map::Level.new($map)

      @player.input = {
        :h => :move_left,
        :j => :move_down,
        :k => :move_up,
        :l => :move_right, 
        :y => :move_up_left,
        :u => :move_up_right,
        :b => :move_down_left,
        :n => :move_down_right
      }

      @player = Player.create(:x => TILE_SIZE + HALF_TILE_SIZE,
                              :y => TILE_SIZE + HALF_TILE_SIZE,
                              :image => Tile.creature(:player),
                              :zorder => 2)


      @status_txt = Chingu::Text.create("[PLAYER STATUS HERE]",
                                        :x => 0,
                                        :y => (Goathack::TILE_SIZE * Goathack::LEVEL_HEIGHT),
                                        :size => Goathack::HALF_TILE_SIZE,
                                        :font => 'verdana',
                                        :color => Color::WHITE)

      @messages = ['Welcome to Goathack!']
      @message_txt = Chingu::Text.create(@messages[-1],
                                         :x => 0,
                                         :y => (Goathack::TILE_SIZE * Goathack::LEVEL_HEIGHT) + Goathack::HALF_TILE_SIZE,
                                         :size => Goathack::HALF_TILE_SIZE,
                                         :font => 'verdana',
                                         :color => Color::WHITE)
      update_status_line
      update_messages
    end

    def update_status_line
      @status_txt.draw
    end

    def update_messages
      @message_txt.text = @messages[-1]
      @message_txt.draw
    end
  end

  class Creature < Chingu::GameObject
    def move_to_if_possible(x_mod, y_mod)
      dest_x = @x + (x_mod * TILE_SIZE)
      dest_y = @y + (y_mod * TILE_SIZE)
      move_to(dest_x, dest_y) if move_possible(dest_x, dest_y)
    end

    def move_to(x, y)
      @x = x
      @y = y
    end

    def move_possible(x, y)

    end
  end

  class Player < Creature
    def move_up; @y -= TILE_SIZE; end
    def move_down; @y +=TILE_SIZE; end
    def move_left; @x -= TILE_SIZE; end
    def move_right; @x += TILE_SIZE; end
    def move_up_left; @y -= TILE_SIZE; @x -= TILE_SIZE; end
    def move_up_right; @y -= TILE_SIZE; @x += TILE_SIZE; end
    def move_down_left; @y += TILE_SIZE; @x -= TILE_SIZE; end
    def move_down_right; @y += TILE_SIZE; @x += TILE_SIZE; end
  end

  module Map
    @@level = []

    def self.level
      @@level
    end

    class ObjectMap
      def initialize(grid_size)
        @width = grid_size[0]
        @height = grid_size[1]
        @map = []
        @height.times{ @map << Array.new(@width) }
      end

      def insert(obj)
        y = (obj.y / TILE_SIZE)
        x = (obj.x / TILE_SIZE)
        if @map[y][x].nil?
          @map[y][x] = [obj]
        elsif @map[y][x].is_a?(Array)
          @map[y][x] << obj
        else
          raise "Expected nil or array at insert location.."
        end
        puts "insert at y:#{y} x:#{x}"
      end
  end

    class Level
      def initialize(raw_level)
        @raw_level = raw_level.split(/\n/).map{|l| l.split('') }
        @object_map = ObjectMap.new(LEVEL_GRID)
 
        x = y = HALF_TILE_SIZE
        @raw_level.each do |row|
          row.each do |tile|
            if tile == '|' || tile == '-'
              @object_map.insert(Tile.create(:x => x,
                                             :y => y,
                                             :image => Goathack::Tile.dungeon(:wall),
                                             :zorder => -1))
            elsif tile == '.'
              @object_map.insert(Tile.create(:x => x,
                                             :y => y,
                                             :image => Goathack::Tile.dungeon(:floor),
                                             :zorder => -1))
            end
            x += TILE_SIZE
          end
          x = HALF_TILE_SIZE
          y += TILE_SIZE
        end
      end
    end

    class Tile < Chingu::GameObject
    end
  end
end


window = Goathack::Window.new
#window.load_map
window.show


