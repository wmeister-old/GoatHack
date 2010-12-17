module Goathack
  class ObjectMap
    def initialize(grid_size)
      @width = grid_size[0]
      @height = grid_size[1]
      @map = []
      @height.times{ @map << Array.new(@width) }
    end

    def grid_pos(x ,y)
      [x / TILE_SIZE, y / TILE_SIZE]
    end

    def at(_x, _y)
      x, y = grid_pos(_x, _y)
      objects = @map[y][x]
      objects.nil? ? [] : objects
    end

    def insert(obj)
      x, y = grid_pos(obj.x, obj.y)

      if @map[y][x].nil?
        @map[y][x] = [obj]
      elsif @map[y][x].is_a?(Array)
        @map[y][x] << obj
      else
        raise "Expected nil or array at insert location.."
      end
    end
  end
end
