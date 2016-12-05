require 'selenium-webdriver'

module CyberDojo

  class Page

    def initialize(driver, wait)
      @driver = driver
      @wait = wait
    end

    def load_completed?
      false
    end

  end

  def self.find_item_in_cyber_dojo_list(driver, list_id, item_text)
    list = driver.find_element :id => list_id
    list_items = list.find_elements :class => 'filename'
    for item in list_items
      if item.text == item_text
        return item
      end
    end
    return nil
  end

end
