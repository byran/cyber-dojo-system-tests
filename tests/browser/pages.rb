require_relative 'main_page'
require_relative 'setup_default_start_point_show_languages_page'
require_relative 'setup_default_start_point_show_exercises_page'
require_relative 'kata_edit_page'
require_relative 'enter_show_page'
require_relative 'enter_review_page'
require_relative 'dashboard_show_page'

module CyberDojo

  class Pages

    attr_reader :main
    attr_reader :setup_default_start_point_show_languages
    attr_reader :setup_default_start_point_show_exercises
    attr_reader :kata_edit
    attr_reader :enter_show
    attr_reader :enter_review
    attr_reader :dashboard_show

    attr_reader :all_pages

    def initialize(driver, browser, wait)
      @all_pages = []

      @main = MainPage.new(driver, browser, wait)
      add_page([], @main)
      add_page([ 'dojo', 'index' ], @main)

      @setup_default_start_point_show_languages = SetupDefaultStartPointShowLanguagesPage.new(driver, browser, wait)
      add_page([ 'setup_default_start_point', 'show_languages' ], @setup_default_start_point_show_languages)

      @setup_default_start_point_show_exercises = SetupDefaultStartPointShowExercisesPage.new(driver, browser, wait)
      add_page([ 'setup_default_start_point', 'show_exercises' ], @setup_default_start_point_show_exercises)

      @kata_edit = KataEditPage.new(driver, browser, wait)
      add_page([ 'kata', 'edit' ], @kata_edit)

      @enter_show = EnterShowPage.new(driver, browser, wait)
      add_page([ 'enter', 'show' ], @enter_show)

      @enter_review = EnterReviewPage.new(driver, browser, wait)
      add_page([ 'enter', 'review' ], @enter_review)

      @dashboard_show = DashboardShowPage.new(driver, browser, wait)
      add_page([ 'dashboard', 'show' ], @dashboard_show)
    end

    def add_page(url_array, page)
      @all_pages << { :url => url_array, :page => page }
    end

    def update_driver(driver)
      @all_pages.each do |p|
        p[:page].update_driver(driver)
      end
    end

  end

end
