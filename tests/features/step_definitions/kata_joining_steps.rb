And(/^I click the "join" button$/) do
  join_button.click
end

And(/^I enter and confirm the group kata's id$/) do
  assert_page_loaded(pages.id_join_show)
  enter_kata_id(@context['group_short_kata_id'])
  ok_button.click
end

Then(/^I am in the group kata$/) do
  assert_page_loaded(pages.kata_edit)
  assert_equal(@context['group_short_kata_id'], kata_id[0..5],
               "Kata editor is showing a different kata id to the group kata")
end

And(/^I have been assigned a valid avatar$/) do
  assert_avatar(avatar)
end