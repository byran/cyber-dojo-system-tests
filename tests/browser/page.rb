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

  def self.find_item_in_cyber_dojo_list(driver, listId, itemText)
    list = driver.find_element :id => listId

    listItems = list.find_elements :class => "filename"

    for item in listItems
      if item.text == itemText
        return item
      end
    end

    return nil
  end
end
