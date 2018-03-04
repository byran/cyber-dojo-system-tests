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

Given(/^someone else has created an individual kata$/) do
  step 'I navigate to the home page'
  step "I click the \"I'm on my own\" button"
  step 'I click the "create new session" button'
  step 'I select the "Ruby, MiniTest" language and unit test framework'
  step 'I select the "(Verbal)" exercise'
  step 'I confirm my language/framework/exercise selection'
  step 'I acknowledge my session id'
  step 'I switch to the editor window'
  step "I am in the kata I've just created"

  @context['individual_short_kata_id'] = @context['short_kata_id']
  @context['individual_avatar'] = avatar

  step 'I open a new browser'
end


Given(/^the session leader has created a group kata$/) do
  step 'I navigate to the home page'
  step "I click the \"We're in a group\" button"
  step 'I click the "create new session" button'
  step 'I select the "Ruby, MiniTest" language and unit test framework'
  step 'I select the "(Verbal)" exercise'
  step 'I confirm my language/framework/exercise selection'
  step 'I acknowledge the groups session id'
  step "I am viewing a dashboard for the kata I've just created"
  step 'I open a new browser'

  @context['group_short_kata_id'] = @context['short_kata_id']
end
