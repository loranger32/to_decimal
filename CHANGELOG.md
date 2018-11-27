# to_decimal 0.0.3 (2018-11-27)
---

**Breaking changes !!!** 

- Provides a namespace `ToDecimal` to the gem
- Renames the main class from `ToDecimal` to `Convertor`
- Provides constants `ToDecimal::Base2` to `ToDecimal::Base10` as convenience.
- Remove all other class and instance methods, except the getter for the `base`
  attribute of the `Convertor` class
- Make the `ToDecimal::Convertor.new` class method private
- Update tests accordingly


# to_decimal 0.0.2 (2018-05-08)
---

- Fix a typo in the required ruby version : set 2.4.1 instead of 2.5.0.
