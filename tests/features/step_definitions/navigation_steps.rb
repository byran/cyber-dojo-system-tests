Given(/^I navigate to the home page$/) do
  @browser.navigate_home

  assert_page_loaded(pages.main)
end

Then(/^the browser title is "([^"]*)"$/) do |title|
  assert_equal(title, @browser.title)
end

When(/^I open a new browser$/) do
  @browser.restart
end
