module Gym
  module Validation
    class LengthValidator < Validator
      def valid?
        value.nil? ||
        (test[:maximum].nil? || MaximumValidator.new(value, test[:maximum]).valid?) &&
        (test[:minimum].nil? || MinimumValidator.new(value, test[:minimum]).valid?)
      end
    end
  end
end
