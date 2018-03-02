def run_tests
  directory = File.expand_path(File.dirname(__FILE__))
  #test_filter = File.join(directory, "**", "test_*.rb")
  #test_filenames = Dir.glob(test_filter)
  #test_filenames.each do |filename|
  #  require filename
  #end
  require '/tests/test_Homepage.rb'
  require '/tests/test_Creating_a_kata.rb'
  require '/tests/test_Running_tests_in_a_kata.rb'
  require '/tests/test_Diffing_in_a_kata.rb'
  require '/tests/test_Join_a_kata.rb'
  require '/tests/test_Rejoin_a_kata.rb'
  require '/tests/test_Renaming_files_in_a_kata.rb'

end

if ENV['browser'] == 'chrome'
  puts "Running tests against chrome\n"
  run_tests
elsif ENV['browser'] == 'firefox'
  puts "Running tests against firefox\n"
  run_tests
else
  puts "Unknown browser specified\n"
end
