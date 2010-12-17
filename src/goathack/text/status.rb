module Goathack
  module Text
    class Status
      def initialize(player)
        @player = player
        # XXX hide this text initially
        @graphic = Chingu::Text.create("[PLAYER STATUS HERE]",
                                       :x => 0,
                                       :y => TILE_SIZE * LEVEL_HEIGHT,
                                       :size => FONT_SIZE,
                                       :font => FONT,
                                       :color => Color::WHITE)
      end

      def update

      end

      def draw
        @graphic.draw
      end
    end
  end
end
