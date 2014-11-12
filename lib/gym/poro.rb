module Gym
  module Poro
    include Gym::Attributes

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
