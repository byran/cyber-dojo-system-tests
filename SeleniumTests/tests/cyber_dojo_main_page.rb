require 'selenium-webdriver'

class CyberDojoMainPage
  def initialize(browser, wait)
    @browser = browser
    @wait = wait
  end

  def setup_button
    @wait.until { @browser.find_element :id => 'setup-a-new-practice-session-button' }
  end

  def enter_button
    @wait.until { @browser.find_element :id => 'enter-button' }
  end

  def donate_button
    @wait.until { @browser.find_element :id => 'donate-button' }
  end

end
