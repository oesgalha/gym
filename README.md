[![Build Status](https://travis-ci.org/oesgalha/gym.svg)](https://travis-ci.org/oesgalha/gym)

# Gym

Put your Plain Old Ruby Object in shape!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gym'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gym

## Usage

This gem contains modules that add extra functionalities to POROs.

### Attributes

In order to use the attributes module, include it in the desired class:
```ruby
class Human
  include Gym::Attributes
end
```

Set and read any attribute for the modified class:
```ruby
class Human
  include Gym::Attributes
end

human = Human.new
human.age = 16
human.name = 'Finn'

human.name    # => 'Finn'
human.age     # => 16
human.traits  # => nil
```

Initialize a class with any attributes you want:
```ruby
class Dog
  include Gym::Attributes
end

dog = Dog.new(name: 'Jake')
dog.name      # => 'Jake'
```

Set defaults:
```ruby
class Dog
  include Gym::Attributes

  default color: :yellow
end

jake = Dog.new(name: 'Jake')
jake.name       # => 'Jake'
jake.color      # => :yellow
```

Get a hash with all the attributes:
```ruby
class Dog
  include Gym::Attributes

  default color: :yellow
end

jake = Dog.new(name: 'Jake', power: 'stretch', alignment: :neutral)
jake.to_h   # => {
            # =>  name: 'Jake',
            # =>  power: 'stretch',
            # =>  color: :yellow,
            # =>  alignment: :neutral
            # => }
```

Nest and manipulate objects:
```ruby
class Dog
  include Gym::Attributes

  default color: :yellow
end

jake = Dog.new(name: 'Jake')
joshua = Dog.new(name: 'Joshua')
jake.parent = joshua
jake.parent.color   # => :yellow
jake.parent.has_hat = true

jake.to_h           # => {
                    # =>  name: 'Jake',
                    # =>  color: :yellow,
                    # =>  parent: {
                    # =>    name: 'Joshua',
                    # =>    color: :yellow,
                    # =>    has_hat: true
                    # =>  }
                    # => }
```

### Poro

If you want all the aforementioned features in your class you can simply include one module:
```ruby
class MyAwesomeClass
  include Gym::Poro
end
```

And that's it. MyAwesomeClass has all those features for free!
One module to wrap them all.

Happy hacking.

## Contributing

1. Fork it ( https://github.com/oesgalha/gym/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
