module Gym
  module Validation

    VALIDATORS = {
      type: Gym::Validation::TypeValidator,
      presence: Gym::Validation::PresenceValidator,
      length: Gym::Validation::LengthValidator,
      inclusion: Gym::Validation::InclusionValidator
    }.freeze

    def gym_valid?
      self.class.gym_validations.each do |attribute, validations|
        value = send(attribute.to_sym)
        return false if value.respond_to?(:gym_valid?) && !value.gym_valid?
        validations.each do |validation, test|
          return false unless VALIDATORS[validation].new(value, test).valid?
        end
      end
      return true
    end
    alias_method :valid?, :gym_valid?

    module ClassMethods
      def validate(attribute, options)
        gym_validations.merge!(attribute => options)
      end

      def gym_validations
        @gym_validations ||= {}
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
