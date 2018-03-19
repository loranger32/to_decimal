# to_decimal

A simple gem to convert an integer expressed in bases
ranging from 2 to 10 into a decimal integer.

Ruby comes with useful built-in methods to convert integers and string
representation of integers to another base (`String#to_i(base=10)` and 
`Ìnteger#to_s(base=10)`).

But I didn't found a simple and straightforward way to convert an integer
form a given base to an integer of base 10, nor in the core API, nor in the
Standard Library.

I found the following two gems :
- [bases](https://github.com/whatyouhide/bases) ;
- [radix](https://github.com/rubyworks/radix) gems ;

They are very comprehensive, and go both behind the base 36, which is the limit
of Ruby.

But they are a little too heavy for my purpose. I just wanted something like :

```ruby
ToDecimal.to_d(12, base: 8) # => 10

# or

base8.to_d(12) # => 10

# or even

base8[12] # => 10 
```

And, if any conversion is needed back to the original base, we can just use
the buit-in Ruby methods on the return value of the method.

So I decided to create this little gem for that. If something similar already
exists, I would be happy to know.


# Installation
```shell
$ gem install to_decimal
$ bundle install
```

# Test

This project is tested under minitest.

`rake` or `rake test`

# Usage

### Instance methods

Instantiate a new `ToDecimal` object :

```ruby
base10 = ToDecimal.new
# => a new object with default base set to 10

# or
base8 = ToDecimal.new(8)
# or
base8 = ToDecimal.new('8')
# => a new object with base set to 8
```

The base attribute can be updated simply :

```ruby
base8.base = 3

#or

base8.base = '3'
```

To convert a number of a given base to a base 10 integer, use the `#to_d(input)`
method (alias `#[]`):

```ruby
base8.to_d(12) # => 10

# alias

base8[12] # => 10
```
An error wil be raised if the input integer is not of the given base.

### Class method

Instead of creating a new object, you can also call a class method `#to_d` on
the `ToDecimal class itself :

```ruby
ToDecimal.to_d(1231, base: 4)
# => 109
```

# Contribute

If you think this small gem could be improved in any way, don't hesitate,
I would be happy to learn. And if you want to contribute, I would be happy too !

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
