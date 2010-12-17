module Goathack
  class Creature < Entity
    def move_if_possible(x, y)
      if move_possible?(x, y)
        move(x, y) 
        return true 
      else
        return false 
      end
    end

    def move(x, y)
      @x = x
      @y = y
    end

    def move_possible?(x, y)
      @map.object_map.at(x, y).each do |o|
        return false if o.blocking?
      end 
      return true
    end
  end
end
