# to_decimal

A simple gem to convert an integer expressed in bases
ranging from 2 to 10 into a decimal integer.

Ruby comes with useful built-in methods to convert integers and string
representation of integers to another base (`String#to_i(base=10)` and 
`Ìnteger#to_s(base=10)`).

But I didn't found a simple and straightforward way to convert an integer
form a given base to an integer of base 10, nor in the core API, nor in the
Standard Library.

I found the two following gems :
- [bases](https://github.com/whatyouhide/bases) ;
- [radix](https://github.com/rubyworks/radix) gems ;

They are very comprehensive, and go both behind the base 36, which is the limit
of Ruby.

But they are a little too heavy for my purpose. I just wanted something like :

```ruby
ToDecimal.(12, base: 8) # => 10

#or

base8(12).to_d #=> 10
```

So I decided to create this little gem for that. If something similar already
exists, I woudl be happy to know.


# Installation

`$ gem install to_decimal`
`$ bundle install`

# Test

This project is tested under minitest.

`rake` or `rake test`

# Usage

### Instance methods

Instantiate a new `Convertor` object :

```ruby
convertor = ToDecimal::Convertor.new
# => a new object with default input number set to 0 and default base 
# set to 10

# or
convertor = ToDecimal::Convertor.new(125)
# or
convertor = ToDecimal::Convertor.new('125')
# => a new object with input number set to 125 and default base set to 10

# or
convertor = ToDecimal::Convertor.new(125, 8)
# => a new object with input number set to 125 and base set to 8
```

Both input number and base attributes can be updated simply :

```ruby
convertor.input = 120
#or
convertor.input = '120'

convertor.base = 3
```

To get the input number converted to a base 10 integer :

```ruby
convertor.to_d

# alias

convertor.to_decimal
```

To avoid the need of updating both base and input number and calling `#to_d` or 
`#to_decimal` after that, there is a shortcut:

```ruby
convertor.to_d_with(1231, 4)
# => 109
```

with the first argument being the input integer and the second argument the
base. Works also with a string as firts argument


### Class method

Instead of creating a new object, you can also call a class method `#to_d` on
the Convertor class itself :

```ruby
ToDecimal::Convertor.to_d(1231, 4)
# => 109
```

# Contribute

If you think this small gem could be improved in any way, don't hesitate,
I would be happy to learn. And if you want to contribute, I woudl be happy too !

- Fork it ;
- Create your own branch (`git checkout -b my-new-feature`) ;
- Make your feature addition or bug fix ;
- Add tests for it ;
- Commit on your own branch ;
- Push to the branch (`git push origin my-new-feature`) ;
- Create a new pull request ;

# Author

Laurent Guinotte


# Licence

to_decimal is released under the MIT Licence. See LICENCE.txt
for further details.
