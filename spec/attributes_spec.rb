require 'spec_helper'

class Hero
  include Gym::Attributes
end

describe Hero do
  subject { Hero.new(name: 'Spider Man', real_name: 'Peter Parker', is_batman: false) }

  it '#to_h' do
    subject.must_respond_to :to_h
    hash = subject.to_h
    hash[:name].must_equal 'Spider Man'
    hash[:real_name].must_equal 'Peter Parker'
    hash[:is_batman].must_equal false
  end

  it '#name' do
    subject.name.must_equal 'Spider Man'
  end

  it '#real_name' do
    subject.real_name.must_equal 'Peter Parker'
  end

  it '#is_batman' do
    subject.is_batman.must_equal false
  end

  it '#name=' do
    subject.name = 'Batman'
    subject.name.must_equal 'Batman'
  end

  it '#real_name=' do
    subject.real_name = 'Bruce Wayne'
    subject.real_name.must_equal 'Bruce Wayne'
  end

  it '#is_batman=' do
    subject.is_batman = true
    subject.is_batman.must_equal true
  end
end
