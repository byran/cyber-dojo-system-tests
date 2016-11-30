require 'selenium-webdriver'

class CyberDojoPage
  def initialize(driver, wait)
    @driver = driver
    @wait = wait
  end

end