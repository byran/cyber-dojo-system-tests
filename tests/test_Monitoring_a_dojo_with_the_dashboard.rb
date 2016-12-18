require_relative './cyber_dojo_test.rb'

class MonitoringADojoWithTheDashboardTest < CyberDojoTest

  def test_The_number_of_tests_added_in_a_kata_can_be_seen_in_the_dashboard_from_a_different_browser_instance
    create_and_enter_kata

    run_a_failing_test
    run_a_passing_test

    id = kata_id
    avatar_animal = avatar

    browser.restart

    browser.navigate_home
    assert_page_loaded pages.main

    enter_button.click
    assert_page_loaded pages.enter_show

    kata_id_text_box.send_keys id
    dashboard_button.click

    assert_page_loaded pages.dashboard_show

    # Turn off auto refresh as it could refresh when finding elements
    checkbox = auto_refresh_checkbox
    checkbox.click
    assert_page_loaded pages.dashboard_show

    assert_equal '2', traffic_light_count(avatar_animal).text
  end

  def test_Multiple_katas_can_be_seen_in_the_dashboard
    create_and_enter_kata

    run_a_failing_test
    run_a_passing_test

    id = kata_id
    avatar_1_animal = avatar

    browser.switch_to_window_with_title_starting_with 'home'
    assert_page_loaded pages.main

    enter_button.click
    assert_page_loaded pages.enter_show

    # Enter another kata
    start_coding_button.click
    ok_button.click

    @browser.switch_to_window 2
    assert_page_loaded pages.kata_edit

    run_a_failing_test

    assert_equal id, kata_id, "Entered a different dojo"
    avatar_2_animal = avatar

    # Open the dashboar
    browser.switch_to_window_with_title_starting_with 'home'
    assert_page_loaded pages.main

    enter_button.click
    assert_page_loaded pages.enter_show

    dashboard_button.click
    assert_page_loaded pages.dashboard_show

    # Turn off auto refresh as it could refresh when finding elements
    checkbox = auto_refresh_checkbox
    checkbox.click
    assert_page_loaded pages.dashboard_show

    assert_equal '2', traffic_light_count(avatar_1_animal).text
    assert_equal '1', traffic_light_count(avatar_2_animal).text
  end

end

