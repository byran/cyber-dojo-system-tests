require_relative 'main_page'
require_relative 'main_page_operations'
require_relative 'individual_show_page'
require_relative 'individual_show_page_operations'
require_relative 'group_show_page'
require_relative 'group_show_page_operations'

require_relative 'setup_default_start_point_show_page'
require_relative 'setup_default_start_point_show_page_operations'
require_relative 'kata_individual_page'
require_relative 'kata_individual_page_operations'
require_relative 'kata_group_page'
require_relative 'kata_group_page_operations'

require_relative 'kata_edit_page'
require_relative 'kata_edit_page_assertions'
require_relative 'kata_edit_page_operations'

require_relative 'id_join_show_page'
require_relative 'id_join_show_page_operations'
require_relative 'id_rejoin_show_page'
require_relative 'id_rejoin_show_page_operations'
require_relative 'id_review_show_page'
require_relative 'id_review_show_page_operations'

require_relative 'dashboard_show_page'
require_relative 'dashboard_show_page_assertions'
require_relative 'dashboard_show_page_operations'

require_relative 'page_assertions'

module CyberDojo

  class Pages

    attr_reader :main
    attr_reader :individual_show
    attr_reader :group_show

    attr_reader :setup_default_start_point_show
    attr_reader :kata_individual
    attr_reader :kata_group

    attr_reader :kata_edit

    attr_reader :dashboard_show

    attr_reader :id_join_show
    attr_reader :id_rejoin_show
    attr_reader :id_review_show

    attr_reader :all_pages

    def initialize(driver, browser, wait, assertions)
      @all_pages = []

      @main = MainPage.new(driver, browser, wait)
      @main_assertions = PageAssertions.new(browser, @main, assertions)
      @main_operations = MainPageOperations.new(@main, @main_assertions, self)
      add_page([], @main, @main_operations)
      add_page([ 'dojo', 'index' ], @main, @main_operations)

      @individual_show = IndividualShowPage.new(driver, browser, wait)
      @individual_show_assertions = PageAssertions.new(browser, @individual_show, assertions)
      @individual_show_operations = IndividualShowPageOperations.new(@individual_show, @individual_show_assertions, self)
      add_page([ 'individual', 'show' ], @individual_show, @individual_show_operations)

      @group_show = GroupShowPage.new(driver, browser, wait)
      @group_show_assertions = PageAssertions.new(browser, @group_show, assertions)
      @group_show_operations = GroupShowPageOperations.new(@group_show, @group_show_assertions, self)
      add_page([ 'group', 'show' ], @group_show, @group_show_operations)

      @setup_default_start_point_show = SetupDefaultStartPointShowPage.new(driver, browser, wait)
      @setup_default_start_point_show_assertions = PageAssertions.new(browser, @setup_default_start_point_show, assertions)
      @setup_default_start_point_show_operations = SetupDefaultStartPointShowPageOperations.new(@setup_default_start_point_show, @setup_default_start_point_show_assertions, self)
      add_page([ 'setup_default_start_point', 'show' ], @setup_default_start_point_show, @setup_default_start_point_show_operations)

      @kata_individual = KataIndividualPage.new(driver, browser, wait)
      @kata_individual_assertions = PageAssertions.new(browser, @kata_individual, assertions)
      @kata_individual_operations = KataIndividualPageOperations.new(@kata_individual, @kata_individual_assertions, self)
      add_page([ 'kata', 'individual' ], @kata_individual, @kata_individual_operations)

      @kata_group = KataGroupPage.new(driver, browser, wait)
      @kata_group_assertions = PageAssertions.new(browser, @kata_group, assertions)
      @kata_group_operations = KataGroupPageOperations.new(@kata_group, @kata_group_assertions, self)
      add_page([ 'kata', 'group' ], @kata_group, @kata_group_operations)

      @id_join_show = IdJoinShowPage.new(driver, browser, wait)
      @id_join_show_assertions = PageAssertions.new(browser, @id_join_show, assertions)
      @id_join_show_operations = IdJoinShowPageOperations.new(@id_join_show, @id_join_show_assertions, self)
      add_page([ 'id_join', 'show' ], @id_join_show, @id_join_show_operations)

      @id_rejoin_show = IdRejoinShowPage.new(driver, browser, wait)
      @id_rejoin_show_assertions = PageAssertions.new(browser, @id_rejoin_show, assertions)
      @id_rejoin_show_operations = IdRejoinShowPageOperations.new(@id_rejoin_show, @id_rejoin_show_assertions, self)
      add_page([ 'id_rejoin', 'show' ], @id_rejoin_show, @id_rejoin_show_operations)

      @id_review_show = IdReviewShowPage.new(driver, browser, wait)
      @id_review_show_assertions = PageAssertions.new(browser, @id_review_show, assertions)
      @id_review_show_operations = IdReviewShowPageOperations.new(@id_review_show, @id_review_show_assertions, self)
      add_page([ 'id_review', 'show' ], @id_review_show, @id_review_show_operations)

      @kata_edit = KataEditPage.new(driver, browser, wait)
      @kata_edit_assertions = KataEditPageAssertions.new(browser, @kata_edit, assertions)
      @kata_edit_operations = KataEditPageOperations.new(@kata_edit, @kata_edit_assertions, self)
      add_page([ 'kata', 'edit' ], @kata_edit, @kata_edit_operations)

      @dashboard_show = DashboardShowPage.new(driver, browser, wait)
      @dashboard_show_assertions = DashboardShowPageAssertions.new(browser, @dashboard_show, assertions)
      @dashboard_show_operations = DashboardShowPageOperations.new(@dashboard_show, @dashboard_show_assertions, self)
      add_page([ 'dashboard', 'show' ], @dashboard_show, @dashboard_show_operations)
    end

    def add_page(url_array, page, operations)
      @all_pages << { :url => url_array, :page => page, :operations => operations }
    end

    def update_driver(driver)
      @all_pages.each do |p|
        p[:page].update_driver(driver)
      end
    end

  end

end
