def run_tests
  require("./test_demo.rb")
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
