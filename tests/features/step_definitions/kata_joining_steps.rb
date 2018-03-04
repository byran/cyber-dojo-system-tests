When(/^I click the "join" button$/) do
  join_button.click
end

When(/^I enter and confirm the group kata's id$/) do
  assert_page_loaded(pages.id_join_show)
  enter_kata_id(@context['group_short_kata_id'])
  ok_button.click
end

When(/^I enter and confirm the other persons kata's id$/) do
  assert_page_loaded(pages.id_join_show)
  enter_kata_id(@context['individual_short_kata_id'])
  ok_button.click
end

Then(/^I am in the group kata$/) do
  assert_page_loaded(pages.kata_edit)
  assert_equal(@context['group_short_kata_id'], kata_id[0..5],
               "Kata editor is showing a different kata id to the group kata")
end

Then(/^I am in the same kata as the other person$/) do
  assert_equal(@context['individual_short_kata_id'], kata_id[0..5],
               "Kata editor is showing a different kata id to the other persons kata")
end

Then(/^I have a different avatar to the other person$/) do
  refute_equal @context['individual_avatar'], avatar
end

Then(/^I have been assigned a valid avatar$/) do
  assert_avatar(avatar)
end
