# EquationSystem

This gem will generate a system of equations up to an arbitrary size.

## Installation

Add this line to your application's Gemfile:

    gem 'equation_system'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install equation_system

## Usage

For ruby usage:
``` ruby
var_count = 3 # number of variables for the system of equations (required)

equation_system = EquationSystem.new(var_count, range: -10..10, allow_zero: false, failsafe: 10)
# => #<EquationSystem::System:0x007faa498...>

# Get the equations
equation_system.equations
# => ["5x + 2y + 2z = -24", "-5x - 7y - 5z = -8", "-7x - 5y - 2z = 28"]

# Get the answers
equation_system.answers
# => {:x=>-8, :y=>4, :z=>4}

# Use to get any one variable value
equation_system.solution_for_x
# => -8
```

This gem also adds the commandline tool equation_system.
It can return the 

## Contributing

1. Fork it ( https://github.com/R167/equation_system/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
