require_relative './cyber_dojo_test.rb'

class ReenteringAKataTest < CyberDojoTest

  def test_A_kata_can_be_reentered_from_the_homepage
    create_and_enter_kata

    id = kata_id
    avatar_animal = avatar

    browser.restart

    browser.navigate_home
    assert_page_loaded pages.main

    enter_button.click
    assert_page_loaded pages.enter_show

    kata_id_text_box.send_keys id
    resume_coding_button.click
    resume_avatar(avatar_animal).click

    browser.switch_to_window 1

    assert_page_loaded pages.kata_edit
    assert_equal avatar_animal, avatar, 'Incorrect avatar reentered'
  end

end