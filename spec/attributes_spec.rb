require 'spec_helper'

class Person
  include Gym::Attributes
end

class Band
  include Gym::Attributes
end

describe Person do
  subject { Person.new(name: 'John', age: 31) }

  it '#to_h' do
    subject.must_respond_to :to_h
    hash = subject.to_h
    hash[:name].must_equal 'John'
    hash[:age].must_equal 31
  end

  it '#name' do
    subject.name.must_equal 'John'
  end

  it '#name=' do
    subject.name = 'Joe'
    subject.name.must_equal 'Joe'
  end

  it '#age' do
    subject.age.must_equal 31
  end

  it '#age=' do
    subject.age = 28
    subject.age.must_equal 28
  end

end

describe Band do
  subject {
    Band.new(
      name: 'Black Sabbath',
      vocal: Person.new(name: 'Ozzy', age: 65, eat_bats: true),
      guitar: Person.new(name: 'Tony ', age: 66, complete_hand_fingers: 8),
      bass: Person.new(name: 'Geezer ', age: 65)
    )
  }

  it '#name' do
    subject.name.must_equal 'Black Sabbath'
  end

  it '#to_h' do
    subject.must_respond_to :to_h
    hash = subject.to_h
    hash[:name].must_equal 'Black Sabbath'
    hash[:vocal].must_be_kind_of Hash
    hash[:vocal][:name].must_equal 'Ozzy'
    hash[:vocal][:age].must_equal 65
    hash[:vocal][:eat_bats].must_equal true
  end
end