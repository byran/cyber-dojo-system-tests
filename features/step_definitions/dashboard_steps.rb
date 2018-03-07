
And(/^I open the dashboard for the session/) do
  step 'I navigate to the home page'
  step "I click the \"We're in a group\" button"

  review_button.click
  assert_page_loaded(pages.id_review_show)

  id_text_box.send_keys(@context['short_kata_id'])
  ok_button.click
  browser.switch_to_window_with_title_starting_with('dashboard')
  assert_page_loaded(pages.dashboard_show)
end

Then(/^the dashboard traffic lights for the first avatar are "([^"]*)"$/) do |arg|
  assert_page_loaded(pages.dashboard_show)
end

Then(/^the dashboard traffic lights for the (\d+)(st|nd|rd|th) participant are "([^"]*)"$/) do |index, ignore, lights|
  assert_page_loaded(pages.dashboard_show)
  assert_traffic_lights(@context['avatar_' + index.to_s], lights.split(','))
end

Then(/^the session leader's dashboard traffic lights for participant (\d+) are "([^"]*)"$/) do |index, lights|
  assert_page_loaded(pages.dashboard_show)
  toggle_auto_refresh
  toggle_auto_refresh
  assert_traffic_lights(@context['avatar_' + index.to_s], lights.split(','))
end
