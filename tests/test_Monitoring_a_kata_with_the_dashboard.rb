require_relative 'cyber_dojo_test'

class MonitoringAKataWithTheDashboardTest < CyberDojoTest

  def test_The_number_of_tests_added_in_a_kata_can_be_seen_in_the_dashboard_from_a_different_browser_instance
    id,avatar_animal = individual_create_and_join_kata
    run_a_failing_test
    run_a_passing_test
    browser.restart
    navigate_to_the_id_review_page_and_open_dashboard(id)
    toggle_auto_refresh # could refresh when finding elements
    assert_traffic_lights(avatar_animal, 'red', 'green')
  end

  def X_test_Multiple_katas_can_be_seen_in_the_dashboard
    id,avatar_1_animal = individual_create_and_join_kata
    run_a_failing_test
    run_a_passing_test
    puts avatar_1_animal

    #switch_to_window_showing_home_page
    avatar_2_animal = navigate_to_the_join_page_and_join(id)
    puts avatar_2_animal

    switch_to_editor_window(2)
    run_a_failing_test

    #assert_equal(id, kata_id, 'Entered a different kata')
    #avatar_2_animal = avatar

    # Open the dashboard
    navigate_to_the_id_review_page_and_open_dashboard(id)
    #switch_to_window_showing_home_page
    #start_reviewing_a_kata # <<<<
    #open_a_dashboard_for_kata

    toggle_auto_refresh # could refresh when finding elements

    assert_traffic_lights(avatar_1_animal, 'red', 'green')
    assert_traffic_lights(avatar_2_animal, 'red')
  end

  private

  def assert_traffic_lights(animal, *lights)
    assert_equal(lights.size.to_s, traffic_light_count(animal).text)
    lights.each_with_index do |colour, index|
      diagnostic = "Incorrect traffic light at position #{index + 1}"
      assert_equal(colour, traffic_light_colour(animal, index + 1), diagnostic)
    end
  end

  #def create_another_avatar_in_the_same_kata(id)
    #start_entering_an_existing_kata # <<<<<
    #start_a_new_avatar
  #end

  def switch_to_window_showing_home_page
    browser.switch_to_window_with_title_starting_with('home')
    assert_page_loaded(pages.main)
  end

end

