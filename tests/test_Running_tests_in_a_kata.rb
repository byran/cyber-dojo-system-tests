require_relative 'cyber_dojo_test'

class RunningTestsInAKataTest < CyberDojoTest

  def test_A_traffic_light_is_added_for_each_test_run
    create_and_enter_kata
    assert_there_are_no_traffic_lights

    run_kata_tests
    assert_traffic_lights('red')

    edit_hiker_c("abc")
    run_kata_tests
    assert_traffic_lights('red', 'amber')

    edit_hiker_c("int answer() { return 42; }")
    run_kata_tests
    assert_traffic_lights('red', 'amber', 'green')
  end

  def test_A_timeout_traffic_light_is_added_if_the_test_enters_an_infinate_loop
    create_and_enter_kata

    edit_hiker_c("int answer() { while(1); return 42; }")
    run_kata_tests

    assert_traffic_lights('timed_out')
  end

  private

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
