require 'spec_helper'

class Alien
  include Gym::Validation

  attr_reader :name, :species, :planet, :age

  validate :name, presence: true, type: String
  validate :species, type: Symbol, inclusion: { in: [:martian, :decapodian, :unknown] }
  validate :planet, type: String, length: { minimum: 3, maximum: 50 }
  validate :age, type: Integer

  def initialize(name, age = nil, species = nil, planet = nil)
    @name = name
    @age = age
    @species = species
    @planet = planet
  end
end

describe Alien do
  it '#valid?' do
    Alien.new(nil).valid?.must_equal false
    Alien.new('Leela').valid?.must_equal true
    Alien.new('Morbo', 42, :unknown, 'Earth').valid?.must_equal true
    Alien.new('John Zoidberg', '86', :decapodian, 'Earth').valid?.must_equal false # Age is not an integer
    Alien.new('John Zoidberg', 86, :decapodain, 'Earth').valid?.must_equal false # Typo in species (not one of the expected species)
    Alien.new('John Zoidberg', 86, :decapodian, :earth).valid?.must_equal false # Planet is not a string
    Alien.new('John Zoidberg', 86, :decapodian, 'Ea').valid?.must_equal false # Planet name doesn't have the minimum length
    Alien.new('John Zoidberg', 86, :decapodian, 'Earth').valid?.must_equal true # (V) (;,,;) (V)
  end
end
