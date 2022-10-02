# to_decimal (Version 1.0.2)

A simple gem to convert an integer or string representation of an integer expressed in bases
ranging from 2 to 36 into a decimal integer.

Ruby comes with built-in methods to convert integers and string
representations of integers to another base ([`String#to_i(base=10)`](http://ruby-doc.org/core-2.5.3/String.html#method-i-to_i),
[`Kernel#Integer(arg, base=0)`](https://ruby-doc.com/core-2.5.2/Kernel.html#method-i-Integer) and 
[`Integer#to_s(base=10)`](http://ruby-doc.org/core-2.5.3/Integer.html#method-i-to_s).

You can also use prefixes with [litteral numeric constant](https://ruby-doc.com/core-2.5.2/doc/syntax/literals_rdoc.html#label-Numbers),
for binary, octal, decimal and hexadecimal notation :

```ruby
# binary
0b10111 # => 23

# octal
0o27 # => 23

# decimal
0d23 # => 23

# hexadecimal
0x17 # => 23
```

For other bases ranging from 2 to 36, you can proceed like this :

```ruby
12.to_s.to_i(6) # => 8
# OR
Integer("12", 6)  # => 8)
```

The `Kernel#Integer` method raises useful error messages when using invalid arguments.

```
Integer "17", 6 # => `Integer': invalid value for Integer(): "17" (ArgumentError)

Integer "17, 37 # => `Integer': invalid radix 37 (ArgumentError)
```

The `String#to_i` method on the other hand also raises an ArgumentError when trying to use an invalid radix, _but_ if the string value does not represent a valid integer, or an integer that doesn't match the provided base, the method silently stop the conversion process when it encounters an invalid character, and returns the result of the conversion so far :

```
"17".to_i(37) # => invalid radix 37 (ArgumentError)
"17".to_i(6) # => 1
"12378".to_i(6) # => 51
```

This gem is simply a wrapper around the `String#to_i` and `Kernel#Integer` methods, with some argument validations and useful error messages.

If you need more features, checkout these twp gems :
- [bases](https://github.com/whatyouhide/bases) ;
- [radix](https://github.com/rubyworks/radix) ;

They are very comprehensive, go both behind the base 36, which is the limit
of Ruby, and allow to convert form bases back and forth.


# Installation
```shell
$ gem install to_decimal
```

Or add this line to your Gemfile

```ruby
gem 'to_decimal'
```

and run

```shell
$ bundle install
```

# Test

This project is tested under minitest.

`rake` or `rake test`

# Usage

You can create a `ToDecimal::Base` object with the required base as an integer argument :

```ruby
b8 = ToDecimal::Base.new(8)
```

Each object is frozen after initialisation and exposes a `[]` method, which takes as argument an integer OR a string
representation of an integer of the corresponding base and returns this integer expressed
in base 10 :

```ruby
base2 = ToDecimal::Base.new(2)
base2[10] # => 2
base2["10"] # => 2
base2["010"] # => 2

b8 = ToDecimal::Base.new(8)
b8[12] # => 10
b8['12'] # => 10
b8['012'] # => 10

b8["99"]
# => raises : A number of base 8 cannot have a  digit greater or equal to '7'. Check your argument: '99'. (ToDecimal::WrongInputBaseError)

b36 = ToDecimal::Base.new(36)
b36[12] # => 38
b36["ruby"] # => 1299022

```

# Contribute

Think it could be better ? Great !

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

MIT
