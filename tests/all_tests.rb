def run_tests
  directory = File.expand_path(File.dirname(__FILE__))
  #test_filter = File.join(directory, "**", "test_*.rb")
  test_filter = File.join(directory, "**", "test_Diff*.rb")

  test_files = Dir.glob(test_filter)

  test_files.each do |file|
    require file
  end
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
