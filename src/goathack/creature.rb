module Goathack
  class Creature < Chingu::GameObject
    def move_if_possible(x_mod, y_mod)
      dest_x = @x + (x_mod * TILE_SIZE)
      dest_y = @y + (y_mod * TILE_SIZE)
      move(dest_x, dest_y) if move_possible(dest_x, dest_y)
    end

    def move(x, y)
      @x = x
      @y = y
    end

    def move_possible(x, y)

    end
  end
end
