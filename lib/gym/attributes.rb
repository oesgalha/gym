module Gym
  module Attributes
    def initialize(attributes = {})
      @gym_attributes = attributes
    end

    def gym_attributes
      @gym_attributes
    end
    alias to_h gym_attributes

    def method_missing(name, *args)
      if name.to_s.end_with? '='
        define_singleton_method(name) { |value| @gym_attributes[name.to_s[0...-1].to_sym] = value }
      else
        define_singleton_method(name.to_sym) { @gym_attributes[name.to_sym] }
      end
      send(name, *args)
    end
  end
end
