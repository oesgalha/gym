require 'spec_helper'

class Person
  include Gym::Model
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
