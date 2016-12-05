require_relative './main_page.rb'
require_relative './setup_default_start_point_show_languages_page.rb'
require_relative './setup_default_start_point_show_exercises_page.rb'
require_relative './kata_edit_page.rb'

module CyberDojo

  class Pages

    attr_reader :main
    attr_reader :setup_default_start_point_show_languages
    attr_reader :setup_default_start_point_show_exercises
    attr_reader :kata_edit

    attr_reader :all_pages

    def initialize(driver, wait)
      @all_pages = []

      @main = MainPage.new(driver, wait)
      add_page [], @main

      @setup_default_start_point_show_languages = SetupDefaultStartPointShowLanguagesPage.new(driver, wait)
      add_page [ 'setup_default_start_point', 'show_languages' ], @setup_default_start_point_show_languages

      @setup_default_start_point_show_exercises = SetupDefaultStartPointShowExercisesPage.new(driver, wait)
      add_page [ 'setup_default_start_point', 'show_exercises' ], @setup_default_start_point_show_exercises

      @kata_edit = KataEditPage.new(driver, wait)
      add_page [ 'kata', 'edit' ], @kata_edit
    end

    def add_page(url_array, page)
      @all_pages << { :url => url_array, :page => page }
    end

  end
end
