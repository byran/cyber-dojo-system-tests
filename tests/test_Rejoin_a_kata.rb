require_relative 'cyber_dojo_test'

class RejoinAKataTest < CyberDojoTest

  def test_A_kata_can_be_rejoined_from_the_homepage
    id,avatar_animal = individual_create_and_join_kata

    browser.restart

    navigate_to_the_rejoin_page
    enter_kata_id(id)
    rejoin_coding_using_avatar(avatar_animal)

    switch_to_editor_window

    assert_equal(avatar_animal, avatar, 'Incorrect avatar reentered')
  end

  def navigate_to_the_rejoin_page
    browser.navigate_home
    assert_page_loaded(pages.main)

    im_on_my_own_button.click
    assert_page_loaded(pages.individual_show)

    rejoin_button.click
    assert_page_loaded(pages.id_rejoin_show)
  end

end