require 'spec_helper'

class Cart
  include Gym::Poro

  def total
    product.price.amount + tax.amount
  end
end

class Product
  include Gym::Poro
end

class Computer < Product
  default color: 'black'
end

class Money
  include Gym::Poro
  default currency: 'USD'
end

class Measure
  include Gym::Poro
end

class Memory < Measure
end

describe Cart do

  let (:deal_time) { DateTime.now }

  subject {
    Cart.new(
      deal_date: deal_time,
      tax: Money.new(amount: 20.0),
      product: Computer.new(
        cpus: 2,
        ram: Memory.new(amount: 1, magnitude: :gb),
        price: Money.new(amount: 1_000.0)
      )
    )
  }

  it '#deal_date' do
    subject.deal_date.must_be_kind_of DateTime
  end

  it '#deal_date=' do
    now = DateTime.now
    subject.deal_date = now
    subject.deal_date.must_equal now
  end

  it '#product' do
    subject.product.must_be_kind_of Product
    subject.product.must_be_kind_of Computer
  end

  it '#tax' do
    subject.tax.must_be_kind_of Money
  end

  it '#total' do
    subject.total.must_equal 1_020.0
  end

  it '#tax.amount' do
    subject.tax.amount.must_equal 20.0
  end

  it '#tax.currency' do
    subject.tax.currency.must_equal 'USD'
  end

  it '#product.cpus' do
    subject.product.cpus.must_equal 2
  end

  it '#product.color' do
    subject.product.color.must_equal 'black'
  end

  it '#product.ram' do
    subject.product.ram.must_be_kind_of Measure
    subject.product.ram.must_be_kind_of Memory
  end

  it '#product.price' do
    subject.product.price.must_be_kind_of Money
  end

  it '#product.ram.amount' do
    subject.product.ram.amount.must_equal 1
  end

  it '#product.ram.amount=' do
    subject.product.ram.amount = 2
    subject.product.ram.amount.must_equal 2
  end

  it '#product.price.amount' do
    subject.product.price.amount.must_equal 1_000.0
  end

  it '#product.price.currency' do
    subject.product.price.currency.must_equal 'USD'
  end

  it '#to_h' do
    subject.to_h.must_equal(
      deal_date: deal_time,
      tax: { amount: 20.0, currency: 'USD' },
      product: {
        color: 'black',
        cpus: 2,
        ram: { amount: 1, magnitude: :gb },
        price: { amount: 1_000.0, currency: 'USD' }
      }
    )
  end

end
