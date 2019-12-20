# to_decimal (Version 1.0.2)

A simple gem to convert an integer expressed in bases
ranging from 2 to 10 into a decimal integer.

Ruby comes with useful built-in methods to convert integers and string
representations of integers to another base ([`String#to_i(base=10)`](http://ruby-doc.org/core-2.5.3/String.html#method-i-to_i),
[`Kernel#Integer(arg, base=0)`](https://ruby-doc.com/core-2.5.2/Kernel.html#method-i-Integer) and 
[`Integer#to_s(base=10)`](http://ruby-doc.org/core-2.5.3/Integer.html#method-i-to_s).

You can also use prefixes with [litteral numeric constant](https://ruby-doc.com/core-2.5.2/doc/syntax/literals_rdoc.html#label-Numbers),
but it only works for binary, octal, decimal and hexadecimal notation (which cover
the most usecases):

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

But if you want to convert an integer of say, base 6, to an integer of base 10,
you need to proceed like this (AFAIK):

```ruby
12.to_s.to_i(6) # => 8
```

It's not a concern if you need to do this occasionally, or if you can easily
manage using prefixes, but I thought there could be a more straightforward,
consise and explicit way to perform this, showing more clearly what your intent
is.

I've looked in the core API and in the Standard Library, but I didn't find
anything. 

I found the following two gems :
- [bases](https://github.com/whatyouhide/bases) ;
- [radix](https://github.com/rubyworks/radix) ;

They are very comprehensive, go both behind the base 36, which is the limit
of Ruby, and allow to convert form bases back and forth.

But they were a little too heavy for my purpose, which was simply
converting from a base lesser or equal than 10 and to return an integer
expressed in base 10. So I decided to write my own gem.

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

The gem gives you access to 9 objects under the namespace `ToDecimal` called :
`Base2`, `Base3`,... `Base10`.

Each object has a `[]` method, which takes as parameter an integer OR a string
representation of the corresponding base and returns this integer expressed
in base 10 :

```ruby
base2 = ToDecimal::Base2
base2[10] # => 2

b8 = ToDecimal::Base8
b8[12] # => 10

b8['12'] # => 10
b8['012'] # => 10
```

These objects and their associated `[]` method are basically wrappers for the
`Integer.to_s.to_i(original_base)` or `String.to_i(original_base)` methods,
with a custom error when the input is not of the excpected base, or not a valid
string representation of an integer. In this case, you will get
a `WrongBaseInputError` instead of the default results of the previous methods, which can lead to unexpected results if drown into some other computations.

The objects are frozen and no new `Convertor` object can be instantiated.

The benefit you may find using this gem are:

- **argument validation** : you avoid the standard behavior of the different built-in
methods, which sometimes throw an error (`Kernel#Integer(arg, base)`) or worse,
silently stop the conversion process when they encounter an invalid character, returning the result of the conversion so far. Instead, you have a consistent
behavior, and you are free to decide what to do with the error.

- **allow you to work with strings with leading zeros** : in this case, zeros are removed form the beginning of the string, avoiding the implict conversion in
base 8, which is, most of the time, not what you want ;


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

to_decimal is released under the MIT Licence. See LICENCE.txt
for further details.
