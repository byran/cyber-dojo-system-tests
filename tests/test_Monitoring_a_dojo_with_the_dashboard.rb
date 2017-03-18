require_relative 'cyber_dojo_test'

class MonitoringADojoWithTheDashboardTest < CyberDojoTest

  def test_The_number_of_tests_added_in_a_kata_can_be_seen_in_the_dashboard_from_a_different_browser_instance
    create_a_kata_with_two_tests_one_failing_and_one_passing

    id = kata_id
    avatar_animal = avatar

    browser.restart

    navigate_home
    start_reviewing_a_kata
    open_a_dashboard_for_kata_with_id(id)

    # Turn off auto refresh as it could refresh when finding elements
    toggle_auto_refresh

    assert_equal('2', traffic_light_count(avatar_animal).text)
    assert_equal('red', traffic_light_colour(avatar_animal, 1))
    assert_equal('green', traffic_light_colour(avatar_animal, 2))
  end

  def test_Multiple_katas_can_be_seen_in_the_dashboard
    create_a_kata_with_two_tests_one_failing_and_one_passing

    id = kata_id
    avatar_1_animal = avatar

    create_another_kata_in_the_same_dojo
    switch_to_editor_window(2)
    run_a_failing_test

    assert_equal(id, kata_id, "Entered a different dojo")
    avatar_2_animal = avatar

    # Open the dashboard
    switch_to_window_showing_home_page
    start_reviewing_a_kata
    open_a_dashboard_for_kata

    # Turn off auto refresh as it could refresh when finding elements
    toggle_auto_refresh

    assert_equal('2', traffic_light_count(avatar_1_animal).text)
    assert_equal('red', traffic_light_colour(avatar_1_animal, 1))
    assert_equal('green', traffic_light_colour(avatar_1_animal, 2))

    assert_equal('1', traffic_light_count(avatar_2_animal).text)
    assert_equal('red', traffic_light_colour(avatar_2_animal, 1))
  end

  private

  def create_a_kata_with_two_tests_one_failing_and_one_passing
    create_and_enter_kata

    run_a_failing_test
    run_a_passing_test
  end

  def create_another_kata_in_the_same_dojo
    switch_to_window_showing_home_page
    start_entering_an_existing_dojo
    start_a_new_kata
  end

  def switch_to_window_showing_home_page
    browser.switch_to_window_with_title_starting_with('home')
    assert_page_loaded(pages.main)
  end

end

