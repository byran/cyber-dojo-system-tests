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

  main_browser.close

  for participant in @participant_browser
    participant[1].close
  end
end
