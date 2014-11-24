module Gym
  module Validation
    class MaximumValidator < Validator
      def valid?
        value.nil? || value.length < test
      end
    end
  end
end
