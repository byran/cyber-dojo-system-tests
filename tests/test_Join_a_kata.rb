require_relative 'cyber_dojo_test'

class JoinAKataTest < CyberDojoTest

  def test_An_individual_kata_can_be_joined_from_the_homepage
    id,first_avatar = individual_create_and_join_kata
    browser.restart
    second_avatar = navigate_to_the_join_page_and_join(id)
    refute_equal first_avatar, second_avatar
  end

  # - - - - - - - - - - - - - - - - - - - - -

  def test_A_group_kata_can_be_joined_from_the_homepage
    id = group_create_kata
    navigate_to_the_join_page_and_join(id)
  end

  # - - - - - - - - - - - - - - - - - - - - -

  def navigate_to_the_join_page_and_join(id)
    navigate_home
    were_in_a_group_button.click

    assert_page_loaded(pages.group)
    join_button.click

    assert_page_loaded(pages.id_join_show)
    enter_kata_id(id[0..5])
    ok_button.click
    switch_to_editor_window
    assert_avatar(avatar)
    avatar
  end

end