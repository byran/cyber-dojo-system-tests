def run_tests
  directory = File.expand_path(File.dirname(__FILE__))
  test_filter = File.join(directory, "**", "test_*.rb")

  test_files = Dir.glob(test_filter)

  test_files.each do |file|
    require file
  end
end

if ENV['browser'] == 'chrome'
  print("Running tests against chrome\n\n")
  run_tests
elsif ENV['browser'] == 'firefox'
  print("Running tests against firefox\n\n")
  run_tests
else
  print("Unknown browser specified\n\n")
end
