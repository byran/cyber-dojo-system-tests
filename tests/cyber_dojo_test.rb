require "minitest/autorun"

require File.join(File.expand_path(File.dirname(__FILE__)), "browser/browser.rb")

class CyberDojoTest < Minitest::Test

  def setup
    @browser = CyberDojo::Browser.new
  end

  def teardown
    @browser.close
  end

  attr_reader :browser

  def pages
    @browser.pages
  end

  def assert_page_loaded(page)
    assert @browser.wait.until_or_false{
      page.load_completed? &&
          @browser.page == page
    }, "Failed to load page"
  end

  def create_kata(language = "C (gcc)", framework = "assert", exercise = "(Verbal)")
    browser.navigate_home

    assert_page_loaded(pages.main)

    browser.page.setup_button.click

    assert_page_loaded(pages.setup_default_start_point_show_languages)

    browser.page.select_language language
    browser.page.select_framework framework
    browser.page.next_button.click

    assert_page_loaded(pages.setup_default_start_point_show_exercises)

    browser.page.select_exercise exercise
    browser.page.set_it_up_button.click

    browser.page.start_coding_button.click

    browser.page.ok_button.click

    browser.switch_to_window 1

    assert_page_loaded(pages.kata_edit)
  end

end
