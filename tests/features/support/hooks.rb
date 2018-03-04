require_relative '../../browser/browser'
require_relative 'scenario'
require_relative 'common_operations'

Before do |scenario|
  @browser = CyberDojo::Browser.new(self)

  extend(CyberDojo::Scenario)
  extend(CyberDojo::CommonOperations)
end


After do |scenario|
  if scenario.failed?
    begin
      @browser.save_screenshot(scenario.name)
    rescue
      print "Failed to save screenshot for '#{scenario.name}'\n"
    else
      print "Save screenshot as '#{scenario.name}'\n"
    end
  end
  @browser.close
end
