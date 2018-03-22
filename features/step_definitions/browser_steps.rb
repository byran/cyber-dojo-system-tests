Then(/^the browser title is "([^"]*)"$/) do |title|
  assert_equal(title, @browser.title)
end

When(/^I open a new browser$/) do
  @browser.restart
end

When(/^I switch to the editor window$/) do
  switch_to_editor_window
end


And(/^I switch to my new editor window$/) do
  switch_to_editor_window
  # TODO: Work out how to check if the browser back button is
  # enabled and verify that it is not here
end