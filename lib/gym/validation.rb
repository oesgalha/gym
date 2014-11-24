module Gym
  module Validation
    def gym_valid?
      self.class.gym_validations.each do |attribute, validations|
        value = send(attribute.to_sym)
        return false if value.respond_to?(:gym_valid?) && !value.gym_valid?
        validations.each do |validation, test|
          case validation.to_sym
          when :type
            return false if !value.nil? && !value.is_a?(test)
          when :presence
            return false unless value
          when :length
            test.each do |sub_validation, sub_test|
              case sub_validation
              when :maximum
                return false unless value.length > sub_test
              when :minimum
                return false unless value.length < sub_test
              end
            end
          when :inclusion
            test.each do |sub_validation, sub_test|
              case sub_validation
              when :in
                return false unless sub_test.include?(value)
              end
            end
          end
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
