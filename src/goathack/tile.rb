module Goathack
  class Tile < Chingu::GameObject
    def self.load_all(window)
      @@creature_a = Gosu::Image.load_tiles(window, "#{TILE_PATH}/creatures.png", TILE_SIZE, TILE_SIZE, false)
      @@dungeon_a  = Gosu::Image.load_tiles(window, "#{TILE_PATH}/dungeon.png", TILE_SIZE, TILE_SIZE, false)

      @@creature_h = {
        :player => @@creature_a[44]
      }
      @@dungeon_h = {
        :wall  => @@dungeon_a[0],
        :floor => @@dungeon_a[57]
      }
    end

    def self.creature(k)
      @@creature_h[k]
    end

    def self.dungeon(k)
      @@dungeon_h[k]
    end
  end
end
