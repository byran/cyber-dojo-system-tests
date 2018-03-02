require_relative 'cyber_dojo_test'

class JoinAKataTest < CyberDojoTest

  def test_A_kata_can_be_joined_from_the_homepage
    create_and_enter_kata
    id = kata_id
    puts id
    puts avatar
    browser.restart

    navigate_to_the_join_page
    enter_kata_id(id[0..5])
    ok_button.click
    #rejoin_coding_using_avatar(avatar_animal)
    switch_to_editor_window
    puts avatar
    #assert_equal(avatar_animal, avatar, 'Incorrect avatar reentered')
  end

  def navigate_to_the_join_page
    browser.navigate_home
    assert_page_loaded(pages.main)

    were_in_a_group_button.click
    assert_page_loaded(pages.group)

    join_button.click
    assert_page_loaded(pages.id_join_show)
  end

end