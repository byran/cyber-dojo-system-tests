require_relative './cyber_dojo_test.rb'

class RunningTestsInAKataTest < CyberDojoTest

  def test_The_starting_test_fails
    create_kata

    browser.page.test_button.click

    browser.page.wait_for_spinner_to_show_and_hide

    assert_equal 1, browser.page.number_of_traffic_lights
    assert_equal 'red', browser.page.traffic_light(0).attribute('data-colour')
    assert_equal browser.base_URL + 'images/bulb_red.png', browser.page.traffic_light_image(0).attribute('src')
    assert_equal '1', browser.page.traffic_light_count_element.text
  end

  def test_Code_passing_the_tests_adds_a_green_traffic_light
    create_kata

    browser.page.select_file 'hiker.c'

    browser.page.editor.clear
    browser.page.editor.send_keys "#include \"hiker.h\"\n"
    browser.page.editor.send_keys "int answer() { return 42; }\n"

    browser.page.test_button.click

    browser.page.wait_for_spinner_to_show_and_hide

    assert_equal 1, browser.page.number_of_traffic_lights
    assert_equal 'green', browser.page.traffic_light(0).attribute('data-colour')
    assert_equal browser.base_URL + 'images/bulb_green.png', browser.page.traffic_light_image(0).attribute('src')
    assert_equal '1', browser.page.traffic_light_count_element.text
  end

  def test_A_syntax_error_in_the_code_adds_a_amber_traffic_light
    create_kata

    browser.page.select_file 'hiker.c'

    browser.page.editor.clear
    browser.page.editor.send_keys "abc\n"

    browser.page.test_button.click

    browser.page.wait_for_spinner_to_show_and_hide

    assert_equal 1, browser.page.number_of_traffic_lights
    assert_equal 'amber', browser.page.traffic_light(0).attribute('data-colour')
    assert_equal browser.base_URL + 'images/bulb_amber.png', browser.page.traffic_light_image(0).attribute('src')
    assert_equal '1', browser.page.traffic_light_count_element.text
  end

end
