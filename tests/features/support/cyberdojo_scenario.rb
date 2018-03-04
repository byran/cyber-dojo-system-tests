require_relative 'minitest_assertions'
require_relative 'common_operations'
require_relative '../../browser/browser'

module CyberDojo
  class Scenario

    attr_reader :assertions
    attr_reader :browser

    def initialize
      @context = {}
      @assertions = MinitestAssertions.new
      @browser = CyberDojo::Browser.new(@assertions)

      extend(CyberDojo::CommonOperations)
    end

    def method_missing(sym, *args, &block)
      if assertions.respond_to?(sym)
        assertions.send(sym, *args, &block)
      elsif browser.page_operations.respond_to?(sym)
        browser.page_operations.send(sym, *args, &block)
      else
        super(sym, *args, &block)
      end
    end

    def respond_to?(method, include_private = false)
      super ||
          assertions.respond_to?(method, include_private) ||
          browser.page_operations.respond_to?(method, include_private)
    end

  end
end
