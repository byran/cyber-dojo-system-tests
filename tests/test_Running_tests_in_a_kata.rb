require_relative 'cyber_dojo_test'

class RunningTestsInAKataTest < CyberDojoTest

  def test_A_traffic_light_is_added_for_each_test_run
    create_and_enter_kata
    assert_there_are_no_traffic_lights

    run_tests
    assert_traffic_lights('red')

    edit_hiker_c("abc")
    run_tests
    assert_traffic_lights('red', 'amber')

    edit_hiker_c("int answer() { return 42; }")
    run_tests
    assert_traffic_lights('red', 'amber', 'green')
  end

  private

  def edit_hiker_c(content)
    select_file('hiker.c')
    editor.clear

    editor.send_keys("#include \"hiker.h\"\n")
    editor.send_keys("#{content}\n")
  end

  def run_tests
    test_button.click
    wait_for_spinner_to_show_and_hide
  end


  def assert_there_are_no_traffic_lights
    refute(traffic_light_count_element_present?, 'Traffic light count was found')
    refute(traffic_light_elements_present?, 'Traffic lights were found')
  end

  def assert_traffic_lights(*lights)
    assert_traffic_lights_count_is(lights.size)
    lights.each_with_index do |colour, index|
      assert_equal(colour, traffic_light(index).attribute('data-colour'))
      expected_image_url = browser.base_URL + "images/bulb_#{colour}.png"
      actual_image_url = traffic_light_image(index).attribute('src')
      assert_equal(expected_image_url, actual_image_url)
    end
  end

  def assert_traffic_lights_count_is(count)
    assert_equal(count, number_of_traffic_lights)
    assert_equal(count.to_s, traffic_light_count_element.text)
  end
end
