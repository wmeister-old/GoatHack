module Goathack
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
end
