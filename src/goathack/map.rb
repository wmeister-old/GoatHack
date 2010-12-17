module Goathack
  class Map
    attr_reader :object_map

    def initialize(raw_level)
      @raw = raw_level.split(/\n/).map{|l| l.split('') }
      @object_map = ObjectMap.new(LEVEL_GRID)
      
      x = y = HALF_TILE_SIZE
      @raw.each do |row|
        row.each do |tile|
          if tile == '|' || tile == '-'
            @object_map.insert(Tile.create(:x => x,
                                           :y => y,
                                           :image => Tile.dungeon(:wall),
                                           :zorder => -1,
                                           :blocking => true))
          elsif tile == '.'
            @object_map.insert(Tile.create(:x => x,
                                           :y => y,
                                           :image => Tile.dungeon(:floor),
                                           :zorder => -1))
          end
          x += TILE_SIZE
        end
        x = HALF_TILE_SIZE
        y += TILE_SIZE
      end
      puts @object_map.inspect
    end

    def self.generate
      return ['------------', 
              '|..........|',
              '|..........|',
              '|..........|',
              '|..........|',
              '|..........|',
              '------------'].join("\n")
    end
  end
end

