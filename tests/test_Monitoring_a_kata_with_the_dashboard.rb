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

  def test_Multiple_katas_can_be_seen_in_the_dashboard
    id = group_create_kata

    avatar_1_animal = navigate_to_the_join_page_and_join(id)
    run_a_failing_test
    run_a_passing_test

    browser.restart
    avatar_2_animal = navigate_to_the_join_page_and_join(id)
    run_a_failing_test

    navigate_to_the_id_review_page_and_open_dashboard(id)
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

end

