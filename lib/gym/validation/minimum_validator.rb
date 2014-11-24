module Gym
  module Validation
    class MinimumValidator < Validator
      def valid?
        value.nil? || value.length > test
      end
    end
  end
end
