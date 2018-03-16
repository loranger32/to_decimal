# to_decimal

Provide a simple way to convert an integer expressed in bases
2 up to 10 to a decimal integer.

I've looked for a simple way to get a decimal integer from an integer expressed
in another base lesser or equal to ten, but I didn't found one, so I decided to
create my own little gem for that. If it already exists, just let me know.

For more comprehensive tools, see the
[bases](https://github.com/whatyouhide/bases) or
[radix](https://github.com/rubyworks/radix) gems.

# Installation

`gem install to_decimal`

# Test

This project is tested under minitest.

`rake` or `rake test`

# Usage

### Instance methods

Instantiate a new `Convertor` object :

```ruby
convertor = Convertor.new
# => a new object with default input number set to 0 and default base 
# set to 10

# or
convertor = Convertor.new(125)
# or
convertor = Convertor.new('125')
# => a new object with input number set to 125 and default base set to 10

# or
convertor = Convertor.new(125, 8)
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


### Class methods

Instead of creating a new object, you can also call a class method `#to_d` on
the Convertor class itself :

```ruby
Convertor.to_d(1231, 4)
# => 109
```

# Contribute

If you think this (very) small gem could be improved, don't hesitate.

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
