require 'minitest/autorun'

require_relative './browser/browser.rb'

class CyberDojoTest < Minitest::Test

  def setup
    @browser = CyberDojo::Browser.new
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
    if @browser.page.respond_to?(sym)
      @browser.page.send(sym, *args, &block)
    else
      super(sym, *args, &block)
    end
  end

  def respond_to?(method, include_private = false)
    super || @browser.page.respond_to?(method, include_private)
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

  def create_and_enter_kata(language = "C (gcc)", framework = "assert", exercise = "(Verbal)")
    browser.navigate_home

    assert_page_loaded(pages.main)

    browser.page.setup_button.click

    assert_page_loaded(pages.setup_default_start_point_show_languages)

    browser.page.select_language(language)
    browser.page.select_framework(framework)
    browser.page.next_button.click

    assert_page_loaded(pages.setup_default_start_point_show_exercises)

    browser.page.select_exercise(exercise)
    browser.page.set_it_up_button.click

    browser.page.start_coding_button.click

    browser.page.ok_button.click

    browser.switch_to_window(1)

    assert_page_loaded(pages.kata_edit)
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
