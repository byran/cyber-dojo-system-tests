require File.join(File.expand_path(File.dirname(__FILE__)), "cyber_dojo_test.rb")

class RunningTestsInAKataTest < CyberDojoTest

  def test_The_starting_test_fails
    create_kata

    browser.page.test_button.click

    browser.page.wait_for_spinner_to_show_and_hide

    assert_equal 1, browser.page.number_of_traffic_lights
    assert_equal "red", browser.page.traffic_light(0).attribute("data-colour")
    assert_equal browser.base_url + "images/bulb_red.png", browser.page.traffic_light_image(0).attribute("src")
    assert_equal "1", browser.page.traffic_light_count_element.text
  end

end