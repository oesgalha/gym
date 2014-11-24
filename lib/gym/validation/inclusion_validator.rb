module Gym
  module Validation
    class InclusionValidator < Validator
      def valid?
        value.nil? ||
        (test[:in].nil? || test[:in].include?(value))
      end
    end
  end
end
