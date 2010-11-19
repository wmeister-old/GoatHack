module Goathack
  module Text
    class MessageList
      def initialize(player)
        @player = player
        @messages = ['Welcome to Goathack!']
        # XXX hide this initially
        @graphic = Chingu::Text.create(@messages[-1],
                                    :x => 0,
                                    :y => (TILE_SIZE * LEVEL_HEIGHT) + HALF_TILE_SIZE,
                                    :size => HALF_TILE_SIZE,
                                    :font => 'monospace',
                                    :color => Color::WHITE)
      end

      def update
        @graphic.text = @messages[-1] # XXX maybe make this conditional
        @text.draw
      end
    end
  end
end
