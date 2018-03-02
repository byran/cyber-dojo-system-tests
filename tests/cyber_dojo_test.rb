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
        puts "Failed to save screenshot for '#{name}'"
      else
        puts "Save screenshot as '#{name}'"
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
      page.load_completed? && @browser.page == page
    }, 'Failed to load page')
  end

  def wait_for_button_to_be_enabled(button)
    assert(@browser.wait.until_or_false{
      true if button.enabled?
      }, "'#{button.text}' button was not enabled")
  end

  def navigate_home
    browser.navigate_home
    assert_page_loaded(pages.main)
  end

  def create_and_enter_kata(language = 'C (gcc)', framework = 'assert', exercise = '(Verbal)')
    navigate_home
    im_on_my_own_button.click

    assert_page_loaded(pages.individual)
    create_a_new_session_button.click

    assert_page_loaded(pages.setup_default_start_point_show)
    display_name = [language,framework].join(', ')
    select_display_name(display_name)
    select_exercise(exercise)
    ok_button.click

    assert_page_loaded(pages.kata_individual)
    ok_button.click
    switch_to_editor_window

    assert_page_loaded(pages.kata_edit)
  end

  def switch_to_editor_window(index = 1)
    @browser.switch_to_window(index)
    assert_page_loaded(pages.kata_edit)
  end

end
