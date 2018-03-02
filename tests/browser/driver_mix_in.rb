require 'selenium-webdriver'

module CyberDojo

  module DriverMixIn

    def scroll_into_view(element)
      execute_script('arguments[0].scrollIntoView(true);', element)
    end

    def textContent_of(element)
      execute_script('return arguments[0].textContent;', element)
    end

    def print_sub_elements(element)
      print "\n============================\n"
      print_sub_elements_with_indent element
    end

    def print_sub_elements_with_indent(element, indent = '')
      print_element_details element, indent
      sub_elements = element.find_elements(:xpath => './*')
      for sub_element in sub_elements
        print_sub_elements_with_indent sub_element, indent + '| '
      end
    end

    def print_element_details(element, indent = '')
      print indent
      print element.tag_name
      id = element.attribute('id')
      print ' - id: ' + id if !id.nil? && id != ''
      element_class = element.attribute('class')
      print ' - class: ' + element_class if !element_class.nil? && element_class != ''
      print "\n"
    end

  end

end
