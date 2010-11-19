module Goathack
  class Player < Creature
    attr_accessor :map

    def self.make(map)
      player = Player.create(map, {:x     => TILE_SIZE + HALF_TILE_SIZE,
                                   :y     => TILE_SIZE + HALF_TILE_SIZE,
                                   :image => Tile.creature(:player),
                                   :zorder => 2})
      player.input = {
        :h => :move_left,
        :j => :move_down,
        :k => :move_up,
        :l => :move_right, 
        :y => :move_up_left,
        :u => :move_up_right,
        :b => :move_down_left,
        :n => :move_down_right
      }      
      return player
    end

    def initialize(map, options = {})
      # XXX raise if map is wrong class
      super(options)
      @map = map
    end

    def move_up
      @y -= TILE_SIZE
    end

    def move_down
      @y +=TILE_SIZE
    end

    def move_left
      @x -= TILE_SIZE
    end

    def move_right
      @x += TILE_SIZE
    end

    def move_up_left
      @y -= TILE_SIZE
      @x -= TILE_SIZE
    end

    def move_up_right
      @y -= TILE_SIZE
      @x += TILE_SIZE
    end

    def move_down_left
      @y += TILE_SIZE
      @x -= TILE_SIZE
    end

    def move_down_right
      @y += TILE_SIZE
      @x += TILE_SIZE
    end
  end
end
