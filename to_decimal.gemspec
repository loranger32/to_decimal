require 'rake'

Gem::Specification.new do |s|
  s.name        = 'to_decimal'
  s.version     = '1.0.2'
  s.date        = '2019-12-20'
  s.summary     = 'A small gem to convert integers from bases 2..10 to decimal integers'
  s.description = <<~DESCRIPTION
                  Provides a simple way to convert an integer expressed in bases
                  2 up to 10 to a decimal integer
                  DESCRIPTION
  s.authors     = ['Laurent Guinotte']
  s.email       = 'laurentguinotte@icloud.com'
  s.files       = FileList['lib/**/*.rb', '[A-Z]*','test/*'].to_a
  s.homepage    =
    'https://github.com/loranger32/to_decimal'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 2.4.5'

  s.metadata = {
    'source_code_uri' => 'https://github.com/loranger32/to_decimal',
    'changelog_uri'   => 'https://github.com/loranger32/blob/master/CHANGELOG.md'
  }

  s.add_development_dependency 'bundler', '~> 2.0', '>= 2.0.1'
  s.add_development_dependency 'rake', '~> 12.3'
  s.add_development_dependency 'minitest', '~> 5.11'
  s.add_development_dependency 'minitest-reporters', '~> 1.1'
  s.add_development_dependency 'pry', '~> 0.12.2'
  s.add_development_dependency 'rubocop', '~> 0.65.0'
end
