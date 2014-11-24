module Gym
  module Validation
    class TypeValidator < Validator
      def valid?
        value.nil? || value.is_a?(test)
      end
    end
  end
end
