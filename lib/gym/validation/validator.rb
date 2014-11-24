module Gym
  module Validation
    class Validator

      attr_reader :value, :test

      def initialize(value, test)
        @value = value
        @test = test
      end
    end
  end
end
