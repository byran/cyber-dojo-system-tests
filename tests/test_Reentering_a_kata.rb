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

    enter_button.click
    assert_page_loaded(pages.enter_show)
  end

  def enter_kata_id(id)
    kata_id_text_box.send_keys(id)
    wait_for_button_to_be_enabled(resume_coding_button)
  end

  def resume_coding_using_avatar(avatar_animal)
    resume_coding_button.click
    resume_avatar(avatar_animal).click
  end

  def switch_to_editor_window
    browser.switch_to_window(1)
    assert_page_loaded(pages.kata_edit)
  end

end