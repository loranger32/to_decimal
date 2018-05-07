require 'rake'

Gem::Specification.new do |s|
  s.name        = 'to_decimal'
  s.version     = '0.0.2'
  s.date        = '2018-05-07'
  s.summary     = "A simple integer converter from bases 2..10 to decimal integers"
  s.description = <<~EOF
                  Provides a simple way to convert an integer expressed in bases
                  2 up to 10 to a decimal integer
                  EOF
  s.authors     = ["Laurent Guinotte"]
  s.email       = 'laurentguinotte@icloud.com'
  s.files       = FileList['lib/**/*.rb', '[A-Z]*','test/*'].to_a
  s.homepage    =
    'https://github.com/loranger32/to_decimal'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 2.4.1'

  s.metadata = {
    "source_code_uri" => "https://github.com/loranger32/to_decimal",
    "changelog_uri"   => "https://github.com/blob/master/CHANGELOG.md"
  }


  s.add_development_dependency 'bundler', '~> 1.16'
  s.add_development_dependency 'rake', '~> 12.3'
  s.add_development_dependency 'minitest', '~> 5.11'
  s.add_development_dependency 'minitest-reporters', '~> 1.1'
end
