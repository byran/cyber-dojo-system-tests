require_relative './cyber_dojo_test.rb'

class RunningTestsInAKataTest < CyberDojoTest

  def test_The_starting_test_fails
    create_kata

    browser.page.test_button.click

    browser.page.wait_for_spinner_to_show_and_hide

    assert_number_of_traffic_lights_is 1
    assert_traffic_light_at_index_is_colour 0, 'red'
  end

  def test_Code_passing_the_tests_adds_a_green_traffic_light
    create_kata

    browser.page.select_file 'hiker.c'

    browser.page.editor.clear
    browser.page.editor.send_keys "#include \"hiker.h\"\n"
    browser.page.editor.send_keys "int answer() { return 42; }\n"

    browser.page.test_button.click

    browser.page.wait_for_spinner_to_show_and_hide

    assert_number_of_traffic_lights_is 1
    assert_traffic_light_at_index_is_colour 0, 'green'
  end

  def test_A_syntax_error_in_the_code_adds_a_amber_traffic_light
    create_kata

    browser.page.select_file 'hiker.c'

    browser.page.editor.clear
    browser.page.editor.send_keys "abc\n"

    browser.page.test_button.click

    browser.page.wait_for_spinner_to_show_and_hide

    assert_number_of_traffic_lights_is 1
    assert_traffic_light_at_index_is_colour 0, 'amber'
  end

  def assert_number_of_traffic_lights_is(count)
    assert_equal count, browser.page.number_of_traffic_lights
    assert_equal "#{count}", browser.page.traffic_light_count_element.text
  end

  def assert_traffic_light_at_index_is_colour(index, colour)
    assert_equal colour, browser.page.traffic_light(index).attribute('data-colour')
    assert_equal browser.base_URL + "images/bulb_#{colour}.png", browser.page.traffic_light_image(index).attribute('src')
  end

end
