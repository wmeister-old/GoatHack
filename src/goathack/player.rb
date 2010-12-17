module Goathack
  class Player < Creature
    attr_accessor :map

    def self.make(map, messages)
      player = Player.create(map, messages, 
                             {:x     => TILE_SIZE + HALF_TILE_SIZE,
                              :y     => TILE_SIZE + HALF_TILE_SIZE,
                              :image => Tile.creature(:player),
                              :zorder => 2,
                              :blocking => true})
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

    def initialize(map, messages, options = {})
      # XXX raise if map is wrong class
      super(options)
      @map = map
      @messages = messages
    end

    # XXX update object map when player moves

    def attempt_move(x, y)
      @messages.alert('Thou shalt not wonder where thy path does not lead.') unless move_if_possible(x, y)
    end

    def move_up
      attempt_move(@x, @y - TILE_SIZE)
    end

    def move_down
      attempt_move(@x, @y + TILE_SIZE)
    end

    def move_left
      attempt_move(@x - TILE_SIZE, @y)
    end

    def move_right
      attempt_move(@x + TILE_SIZE, @y)
    end

    def move_up_left
      attempt_move(@x - TILE_SIZE, @y - TILE_SIZE)
    end

    def move_up_right
      attempt_move(@x + TILE_SIZE, @y - TILE_SIZE)
    end

    def move_down_left
      attempt_move(@x - TILE_SIZE, @y + TILE_SIZE)
    end

    def move_down_right
      attempt_move(@x + TILE_SIZE, @y + TILE_SIZE)
    end
  end
end
