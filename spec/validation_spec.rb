require 'spec_helper'

class Music
  include Gym::Validation

  attr_reader :title, :lyrics, :year

  validate :title, presence: true, type: String
  validate :year, type: Integer
  validate :lyrics, type: String

  def initialize(title, year = nil, lyrics = nil)
    @title = title
    @year = year
    @lyrics = lyrics
  end
end

describe Music do

  it '#valid?' do
    Music.new(nil).valid?.must_equal false
    Music.new('I Just Want You', 1995).valid?.must_equal true
  end
end
