require 'minitest/autorun'

require_relative 'browser/browser'

class CyberDojoTest < Minitest::Test

  def setup
    @browser = CyberDojo::Browser.new(self)
  end

  def teardown
    if not passed?
      begin
        @browser.save_screenshot(name)
      rescue
        print "Failed to save screenshot for '#{name}'\n"
      else
        print "Save screenshot as '#{name}'\n"
      end
    end
    @browser.close
  end

  attr_reader :browser

  def method_missing(sym, *args, &block)
    if @browser.steps.respond_to?(sym)
      @browser.steps.send(sym, *args, &block)
    else
      super(sym, *args, &block)
    end
  end

  def respond_to?(method, include_private = false)
    super || @browser.steps.respond_to?(method, include_private)
  end

  def debug_print_timing(message)
    @browser.debug_print_timing(message)
  end

  def pages
    @browser.pages
  end

  def assert_page_loaded(page)
    assert(@browser.wait.until_or_false{
      page.load_completed? &&
          @browser.page == page
    }, 'Failed to load page')
  end

  def wait_for_button_to_be_enabled(button)
    assert(@browser.wait.until_or_false{ true if button.enabled? }, "'#{button.text}' button was not enabled")
  end

  def navigate_home
    browser.navigate_home

    assert_page_loaded(pages.main)
  end

  def create_and_enter_kata(language = "C (gcc)", framework = "assert", exercise = "(Verbal)")
    navigate_home

    start_setting_up_a_kata

    select_a_language_and_framework(language, framework)

    select_an_exercise_then_enter_kata(exercise)
  end

  def run_a_failing_test
    select_file('hiker.c')

    editor.clear
    editor.send_keys("#include \"hiker.h\"\n")
    editor.send_keys("int answer(void) { return 47; }\n")

    test_button.click

    wait_for_spinner_to_show_and_hide
  end

  def run_a_passing_test
    select_file('hiker.c')

    editor.clear
    editor.send_keys("#include \"hiker.h\"\n")
    editor.send_keys("int answer(void) { return 42; }\n")

    test_button.click

    wait_for_spinner_to_show_and_hide
  end

end
