require './cyber_dojo_page'

class CyberDojoMainPage < CyberDojoPage

  def setup_button
    @wait.until { @driver.find_element :id => 'setup-a-new-practice-session-button' }
  end

  def enter_button
    @wait.until { @driver.find_element :id => 'enter-button' }
  end

  def donate_button
    @wait.until { @driver.find_element :id => 'donate-button' }
  end

end
