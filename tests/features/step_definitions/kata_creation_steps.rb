
When(/^I click the "I'm on my own" button$/) do
  im_on_my_own_button.click
  assert_page_loaded(pages.individual_show)
end

When(/^I click the "We're in a group" button$/) do
  were_in_a_group_button.click
  assert_page_loaded(pages.group_show)
end

When(/^I click the "create new session" button$/) do
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
  assert_page_loaded(pages.setup_default_start_point_show)
  ok_button.click
end

When(/^I acknowledge my session id$/) do
  assert_page_loaded(pages.kata_individual)
  @context['short_kata_id'] = short_kata_id
  ok_button.click
end

When(/^I acknowledge the groups session id$/) do
  assert_page_loaded(pages.kata_group)
  @context['short_kata_id'] = short_kata_id
  ok_button.click
end

When(/^I switch to the editor window$/) do
  switch_to_editor_window
end

Then(/^I am in the kata I've just created$/) do
  assert_page_loaded(pages.kata_edit)
  assert_equal(@context['short_kata_id'], kata_id[0..5],
               "Kata editor is showing a different kata id to the kata created")
end


Then(/^I am viewing a dashboard for the kata I've just created$/) do
  assert_page_loaded(pages.dashboard_show)
  assert_equal(@context['short_kata_id'], kata_id[0..5],
         "Dashboard is showing a different kata id to the kata created")
end