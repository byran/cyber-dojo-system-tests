When(/^I navigate to the individual rejoin page$/) do
  step 'I navigate to the home page'
  step "I click the \"I'm on my own\" button"

  rejoin_button.click
end

When(/^I enter my previous kata id$/) do
  assert_page_loaded(pages.id_rejoin_show)
  id_text_box.send_keys(@context['individual_short_kata_id'])
end

When(/^I select my previous avatar$/) do
  assert_page_loaded(pages.id_rejoin_show)
  rejoin_avatar_image(@context['individual_avatar']).click
end

Then(/^I am in my previous kata as my previous avatar$/) do
  assert_page_loaded(pages.kata_edit)
  assert_equal(@context['individual_short_kata_id'], kata_id[0..5],
               "Kata editor is showing a different kata id to the id of the previous kata")
  assert_equal(@context['individual_avatar'], avatar,
               "Kata editor is showing a different avatar to the avatar of the previous kata")
end