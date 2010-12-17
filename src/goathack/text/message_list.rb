module Goathack
  module Text
    class MessageList
      attr_accessor :messages

      def initialize
        @messages = ['Welcome to Goathack!']
        # XXX hide this initially
        @graphic = Chingu::Text.create(@messages[-1],
                                       :x => 0,
                                       :y => (TILE_SIZE * LEVEL_HEIGHT) + HALF_TILE_SIZE,
                                       :size => FONT_SIZE,
                                       :font => FONT,
                                       :color => Color::WHITE)
      end

      def alert(msg)
        @messages << msg
        update
        draw
      end

      def update
        @graphic.text = @messages[-1] # XXX maybe make this conditional
      end

      def draw
        @graphic.draw
      end
    end
  end
end
