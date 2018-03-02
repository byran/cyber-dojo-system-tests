require_relative 'cyber_dojo_test'

class ReenteringAKataTest < CyberDojoTest

  def test_A_kata_can_be_reentered_from_the_homepage
    create_and_enter_kata

    id = kata_id
    avatar_animal = avatar

    browser.restart

    navigate_to_the_enter_page
    enter_kata_id(id)
    resume_coding_using_avatar(avatar_animal)

    switch_to_editor_window

    assert_equal(avatar_animal, avatar, 'Incorrect avatar reentered')
  end

  def navigate_to_the_enter_page
    browser.navigate_home
    assert_page_loaded(pages.main)

    im_on_my_own_button.click
    assert_page_loaded(pages.individual)

    rejoin_button.click
    assert_page_loaded(pages.id_rejoin_show)
  end

end