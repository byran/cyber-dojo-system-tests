require_relative 'minitest_assertions'
require_relative 'cyberdojo_assertions'
require_relative 'common_operations'
require_relative '../browser/browser'

module CyberDojo
  class Scenario

    attr_reader :scenario_assertions
    attr_reader :browser
    attr_reader :main_browser

    def initialize
      @context = {}
      @scenario_assertions = MinitestAssertions.new
      @scenario_assertions.extend(CyberDojo::Assertions)
      @browser = CyberDojo::Browser.new(scenario_assertions)
      @main_browser = @browser
      @participant_browser = {}

      extend(CyberDojo::CommonOperations)
    end

    def method_missing(sym, *args, &block)
      if scenario_assertions.respond_to?(sym)
        scenario_assertions.send(sym, *args, &block)
      elsif browser.page_operations.respond_to?(sym)
        browser.page_operations.send(sym, *args, &block)
      else
        super(sym, *args, &block)
      end
    end

    def respond_to?(method, include_private = false)
      super ||
          scenario_assertions.respond_to?(method, include_private) ||
          browser.page_operations.respond_to?(method, include_private)
    end

  end
end
