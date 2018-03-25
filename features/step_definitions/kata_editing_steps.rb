Then(/^there are no traffic lights$/) do
  refute(traffic_light_count_element_present?, 'Traffic light count was found')
  refute(traffic_light_elements_present?, 'Traffic lights were found')
end

When(/^I run the tests$/) do
  run_kata_tests
end

Then(/^the traffic lights are "([^"]*)"$/) do |lights|
  assert_traffic_lights(lights.split(','))
end

When(/^I edit "([^"]*)" to be$/) do |fileName, source_code|
  edit_file(fileName, source_code)
end

When(/^I run a failing test$/) do
  edit_file('hiker.rb', 'def answer; 49; end')
  run_kata_tests
end

When(/^I run a passing test$/) do
  edit_file('hiker.rb', 'def answer; 42; end')
  run_kata_tests
end

When(/^I rename "([^"]*)" to "([^"]*)"$/) do |originalFileName, newFileName|
  select_file(originalFileName)

  rename_button.click

  rename_dialog_filename.clear
  rename_dialog_filename.send_keys(newFileName)

  rename_dialog_ok_button.click
end

When(/^I click on traffic light number (\d+)$/) do |trafficLightNumber|
  traffic_light(trafficLightNumber.to_i - 1).click
end

Then(/^the diff dialog is shown$/) do
  refute_nil(diff_dialog, 'Could not find the diff dialog')
end

Then(/^the diff for the "([^"]*)" file is$/) do |fileName, expected|
  select_diff(fileName)

  assert_equal(expected, diff_view.text)
end


Then(/^there is a "([^"]*)" line in the test output$/) do |line|
  assert_page_loaded(pages.kata_edit)
  assert(test_output.include?(line))
end

Then(/^there is no "([^"]*)" line in the test output$/) do |line|
  assert_page_loaded(pages.kata_edit)
  refute(test_output.include?(line))
end
