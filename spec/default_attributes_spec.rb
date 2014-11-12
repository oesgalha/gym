require 'spec_helper'

class Distance
  include Gym::Attributes

  default unit: 'meter', unit_abbr: 'm'
end

describe Distance do
  subject { Distance.new(amount: 10) }

  it '#amount' do
    subject.amount.must_equal 10
  end

  it '#unit' do
    subject.unit.must_equal 'meter'
  end

  it '#unit_abbr' do
    subject.unit_abbr.must_equal 'm'
  end

end
