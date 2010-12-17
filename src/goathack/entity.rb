module Goathack
  class Entity < Chingu::GameObject
    def initialize(options = {})
      blocking = options[:blocking] || false
      options.delete(:blocking)
      super(options)
      @blocking = blocking
    end

    def blocking?; @blocking; end
  end
end
