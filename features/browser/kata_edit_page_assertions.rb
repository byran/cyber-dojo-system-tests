require_relative 'page_assertions'

module CyberDojo

  class KataEditPageAssertions < PageAssertions

    def assert_traffic_lights(lights)
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

end
