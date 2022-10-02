Gem::Specification.new do |s|
  s.name = "to_decimal"
  s.version = "2.0.0"
  s.summary = "A small gem to convert integers from bases 2..36 to decimal integers"
  s.description = <<~DESCRIPTION
    Provides a simple way to convert an integer expressed in bases
    2 up to 36 to a decimal integer
  DESCRIPTION
  s.authors = ["Laurent Guinotte"]
  s.email = "laurentguinotte@icloud.com"
  s.files = %w[LICENCE.txt CHANGELOG.md README.md lib/to_decimal.rb lib/to_decimal/base_class.rb test/to_decimal_test.rb]
  s.homepage = "https://github.com/loranger32/to_decimal"
  s.license = "MIT"

  s.required_ruby_version = ">= 2.4.5"

  s.metadata = {
    "source_code_uri" => "https://github.com/loranger32/to_decimal",
    "changelog_uri" => "https://github.com/loranger32/blob/master/CHANGELOG.md"
  }

  s.add_development_dependency "rake", "~> 13.0", ">= 13.0.6"
  s.add_development_dependency "minitest", "~> 5.16", ">= 5.16.3"
  s.add_development_dependency "minitest-reporters", "~> 1.5", ">= 1.5.0"
  s.add_development_dependency "standard", "~> 1.16", ">= 1.16.1"
end
