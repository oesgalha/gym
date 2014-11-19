module Gym
  module Attributes
    def initialize(attributes = {})
      @gym_attributes = self.class.gym_defaults.merge(attributes)
    end

    def gym_attributes
      @gym_attributes.tap do |attributes|
        attributes.each do |attribute, value|
          attributes[attribute] = value.gym_attributes if value.respond_to?(:gym_attributes)
        end
      end
    end
    alias_method :to_h, :gym_attributes

    def method_missing(name, *args)
      if name.to_s.end_with? '='
        define_singleton_method(name.to_sym) { |value| @gym_attributes[name.to_s[0...-1].to_sym] = value }
      else
        define_singleton_method(name.to_sym) { @gym_attributes[name.to_sym] }
      end
      send(name, *args)
    end

    module ClassMethods
      def default(options)
        gym_defaults.merge!(options)
      end

      def gym_defaults
        @gym_defaults ||= {}
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
