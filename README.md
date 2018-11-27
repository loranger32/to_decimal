# to_decimal

A simple gem to convert an integer expressed in bases
ranging from 2 to 10 into a decimal integer.

Ruby comes with useful built-in methods to convert integers and string
representation of integers to another base (`String#to_i(base=10)` and 
`Integer#to_s(base=10)`).

But if you want to convert an integer of say, base 8, to an integer of base 10,
you need to proceed like this (AFAIK):

`12.to_s.to_i(8) => 10`

It's not a concern if you need to to this occasionally, but I thought there
could be a more straightforward and consise way to
perform this, showing more clearly what your intent is.

I've looked in the core API and in the Standard Library, but I didn't find
anything. 

I found the following two gems :
- [bases](https://github.com/whatyouhide/bases) ;
- [radix](https://github.com/rubyworks/radix) ;

They are very comprehensive, go both behind the base 36, which is the limit
of Ruby, and allow to vonvert bases back and forth.

But they were a little too heavy for my purpose, which was simply
converting from a base lesser or equal than 10 and to return an integer.


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

The gem gives you access to 9 objects under the namespace `ToDecimal` called :
`Base2`, `Base3`,... `Base10`.

Each object has a `[]` method, which takes as parameter an integer OR a string
representation of the corresponding base and returns this integer expressed
in base 10 :

```ruby
base2 = ToDecimal::Base2
base2[10] # => 2

base8 = ToDecimal::Base8
base8[12] # => 10

base8['12'] # => 10
```

An `WrongBaseInputError` will be raised if the input (or string) integer is not
of the given base. Compare this with `0` being returned when you use the 
`Integer.to_s(#base).to_i` method chaining.


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
