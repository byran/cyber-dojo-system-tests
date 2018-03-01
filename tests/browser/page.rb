require 'selenium-webdriver'

module CyberDojo

  class FailedToClickOnElement < Exception
  end

  class Page

    def initialize(driver, browser, wait)
      @driver = driver
      @browser = browser
      @wait = wait
    end

    def load_completed?
      false
    end

    def update_driver(driver)
      @driver = driver
    end

    protected

    def find_item_in_cyber_dojo_list(list_id, item_text)
      puts "find_item_in_cyber_dojo_list(#{list_id}, #{item_text})"
      list = @driver.find_element(:id => list_id)
      list_items = list.find_elements(:class => 'filename')
      for item in list_items
        puts "comparing it to: #{item.text}"
        if item.text == item_text
          return item
        end
      end
      return nil
    end

    def click_on_element_until_it_has_class(fail_message, element, required_class, timeout = 10, interval = 0.2)
      end_time = Time.now + timeout
      until Time.now > end_time
        @driver.scroll_into_view(element)
        element.click
        all_classes = element.attribute('class')
        if not all_classes.nil?
          classes = all_classes.split(' ')
          return if classes.any? { |value| value == required_class}
        end
        sleep interval
      end
      raise FailedToClickOnElement, fail_message
    end

  end # class

end # module
