module Goathack
  class Game 
    def initialize
      @turn = 0
      # the order of events here is important, each depending on the last
      @window = Goathack::Window.new
      Tile.load_all(@window)
      @maps   = [Map.new(Map.generate)]
      @messages = Text::MessageList.new
      @player = Player.make(@maps[0], @messages)
      @status = Text::Status.new(@player)

      @window.show
      do_one_loop
    end

    def do_one_loop
      update
      draw
    end

    def update
      #@status.update
      #@messages.update
    end

    def draw
      #@status.draw
      #@messages.draw
    end
  end
end
