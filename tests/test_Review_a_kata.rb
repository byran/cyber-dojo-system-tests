require_relative 'cyber_dojo_test'

class ReviewAKataTest < CyberDojoTest

  def test_An_individual_kata_can_be_reviewed_from_the_homepage
    id,_ = individual_create_and_join_kata
    browser.restart
    navigate_to_the_review_page_and_review(id)
  end

  # - - - - - - - - - - - - - - - - - - - - -

  def test_A_group_kata_can_be_reviewed_from_the_homepage
    id = group_create_kata
    navigate_to_the_review_page_and_review(id)
  end

  # - - - - - - - - - - - - - - - - - - - - -

  def navigate_to_the_review_page_and_review(id)
    navigate_home
    were_in_a_group_button.click

    assert_page_loaded(pages.group)
    review_button.click

    assert_page_loaded(pages.id_review_show)
    enter_kata_id(id[0..5])
    ok_button.click
    assert_page_loaded(pages.dashboard_show)
  end

end