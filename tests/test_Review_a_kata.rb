require_relative 'cyber_dojo_test'

class ReviewAKataTest < CyberDojoTest

  def test_An_individual_kata_can_be_reviewed_from_the_homepage
    id,_ = individual_create_and_join_kata
    browser.restart
    navigate_to_the_id_review_page_and_open_dashboard(id)
  end

  # - - - - - - - - - - - - - - - - - - - - -

  def test_A_group_kata_can_be_reviewed_from_the_homepage
    id = group_create_kata
    navigate_to_the_id_review_page_and_open_dashboard(id)
  end

end