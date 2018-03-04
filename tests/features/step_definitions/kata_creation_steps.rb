
When(/^I click the "I'm on my own" button$/) do
  im_on_my_own_button.click
end

When(/^I click the "create new session" button$/) do
  assert_page_loaded(pages.individual_show)
  create_a_new_session_button.click
end

When(/^I select the "([^"]*)" language and unit test framework$/) do |languageFramework|
  assert_page_loaded(pages.setup_default_start_point_show)
  select_display_name(languageFramework)
end

When(/^I select the "([^"]*)" exercise$/) do |exercise|
  assert_page_loaded(pages.setup_default_start_point_show)
  select_exercise(exercise)
end

When(/^I confirm my language\/framework\/exercise selection$/) do
  ok_button.click
end

When(/^I acknowledge my session id$/) do
  assert_page_loaded(pages.kata_individual)
  ok_button.click
end

When(/^I switch to the editor window$/) do
  switch_to_editor_window
end

Then(/^I am in a kata$/) do
  assert_page_loaded(pages.kata_edit)
end

