module Goathack
  class Game 
    def initialize
      # the order of events here is important, each depending on the last
      @window = Goathack::Window.new
      Tile.load_all(@window)
      @maps   = [Map.new(Map.generate)]
      @player = Player.make(@maps[0])
      @status = Text::Status.new(player)
      @messages = Text::MessageList.new(player)
   
      @window.show
      # XXX move these into a update routine inside the Window object
      @status.update # XXX maybe move these above @window.show
      @messages.update
    end
  end
end
