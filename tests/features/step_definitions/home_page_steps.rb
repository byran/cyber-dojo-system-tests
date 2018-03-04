Given(/^I navigate to the home page$/) do
  @browser.navigate_home

  assert_page_loaded(pages.main)
end

When(/^I click the "I'm on my own" button$/) do
  im_on_my_own_button.click
  assert_page_loaded(pages.individual_show)
end

When(/^I click the "We're in a group" button$/) do
  were_in_a_group_button.click
  assert_page_loaded(pages.group_show)
end
