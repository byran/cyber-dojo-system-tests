module CyberDojo
  module Scenario

    def method_missing(sym, *args, &block)
      operations = @browser.page_operations
      if operations.respond_to?(sym)
        @browser.page_operations.send(sym, *args, &block)
      else
        super(sym, *args, &block)
      end
    end

    def respond_to?(method, include_private = false)
      super || @browser.page_operations.respond_to?(method, include_private)
    end

    def debug_print_timing(message)
      @browser.debug_print_timing(message)
    end

    def pages
      @browser.pages
    end

  end
end
