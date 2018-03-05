require_relative 'page_assertions'

module CyberDojo

  class DashboardShowPageAssertions < PageAssertions

    def assert_traffic_lights(animal, lights)
      assert_equal(lights.size.to_s, traffic_light_count(animal).text)
      lights.each_with_index do |colour, index|
        assert_equal(colour, traffic_light_colour(animal, index + 1), "Incorrect traffic light at position #{index + 1}")
      end
    end

  end

end
