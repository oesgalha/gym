require 'spec_helper'

class Person
  include Gym::Attributes
end

class Band
  include Gym::Attributes
end

describe Band do
  subject {
    Band.new(
      name: 'Black Sabbath',
      vocal: Person.new(name: 'Ozzy', age: 65, eat_bats: true),
      guitar: Person.new(name: 'Tony', age: 66, complete_hand_fingers: 8),
      bass: Person.new(name: 'Geezer', age: 65)
    )
  }

  it '#name' do
    subject.name.must_equal 'Black Sabbath'
  end

  it '#vocal' do
    subject.vocal.name.must_equal 'Ozzy'
    subject.vocal.age.must_equal 65
    subject.vocal.eat_bats.must_equal true
  end

  it '#guitar' do
    subject.guitar.name.must_equal 'Tony'
    subject.guitar.age.must_equal 66
    subject.guitar.complete_hand_fingers.must_equal 8
  end

  it '#bass' do
    subject.bass.name.must_equal 'Geezer'
    subject.bass.age.must_equal 65
  end

  it '#to_h' do
    subject.must_respond_to :to_h
    hash = subject.to_h
    hash.must_be_kind_of Hash
    hash[:name].must_equal 'Black Sabbath'
    hash[:vocal].must_be_kind_of Hash
    hash[:vocal][:name].must_equal 'Ozzy'
    hash[:vocal][:age].must_equal 65
    hash[:vocal][:eat_bats].must_equal true
    hash[:guitar].must_be_kind_of Hash
    hash[:guitar][:name].must_equal 'Tony'
    hash[:guitar][:age].must_equal 66
    hash[:guitar][:complete_hand_fingers].must_equal 8
    hash[:bass].must_be_kind_of Hash
    hash[:bass][:name].must_equal 'Geezer'
    hash[:bass][:age].must_equal 65
  end
end
