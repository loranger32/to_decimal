# to_decimal 2.0.0 (2022-10-02)
---
New Features :
- Allow instantiation of new base objects
- Allow usage of bases up to 36

Breaking Changes :

- `WrongBaseInputError` is renamed `WrongInputBaseError`
- The `Base2`, `Base3`, ... `Base10` constants are no longer provided, you need to instantiate Base object yourself

Other :
- Change Convertor class name to Base
- Update development dependecies and use Standard instead of Rubocop for linting

# to_decimal 1.0.2 (2019-12-20)
---
- fix a bug by removing the require statements at the top of `lib/to_decimal.rb`
- slight improvements to readme

# to_decimal 1.0.1 (2019-03-16)
---

- update required ruby version to 2.4.5 due to security fix
- update the required versions of:
  - rake (12.3.2)
- add development dependencies:
  - rubocop (0.65.0)
  - pry (0.12.2)
  - minitest (5.11)
  - minitest-reporters (1.3.6)
- Fix some style issues in the code

# to_decimal 1.0.0 (2018-11-27)
---
**Breaking changes !** 

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
