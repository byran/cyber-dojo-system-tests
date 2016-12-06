require 'selenium-webdriver'

module CyberDojo

  module DriverMixIn

    def scroll_into_view(element)
      execute_script('arguments[0].scrollIntoView(true);', element)
    end

  end

end
