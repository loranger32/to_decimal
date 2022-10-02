require "rake/testtask"
require "standard/rake"
require "find"

desc "Run tests"
Rake::TestTask.new(:test) do |t|
  t.libs << "lib"
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
end

desc "Run tests"
task default: :test

desc "Display inventory of all files"
task :inventory do
  Find.find(".") do |name|
    next if name.include?("/.") # Excludes files and directories with . names
    puts name if File.file?(name)
  end
end
