require_relative 'main_page'
require_relative 'main_page_steps'
require_relative 'individual_show_page'
require_relative 'individual_show_page_steps'
require_relative 'group_show_page'
require_relative 'group_show_page_steps'

require_relative 'setup_default_start_point_show_page'
require_relative 'setup_default_start_point_show_page_steps'
require_relative 'kata_individual_page'
require_relative 'kata_individual_page_steps'
require_relative 'kata_group_page'
require_relative 'kata_group_page_steps'

require_relative 'kata_edit_page'
require_relative 'kata_edit_page_steps'

require_relative 'id_join_show_page'
require_relative 'id_join_show_page_steps'
require_relative 'id_rejoin_show_page'
require_relative 'id_rejoin_show_page_steps'
require_relative 'id_review_show_page'
require_relative 'id_review_show_page_steps'

require_relative 'dashboard_show_page'
require_relative 'dashboard_show_page_steps'

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

    def initialize(driver, browser, wait, test)
      @all_pages = []

      @main = MainPage.new(driver, browser, wait)
      @main_steps = MainPageSteps.new(@main, test)
      add_page([], @main, @main_steps)
      add_page([ 'dojo', 'index' ], @main, @main_steps)

      @individual_show = IndividualShowPage.new(driver, browser, wait)
      @individual_show_steps = IndividualShowPageSteps.new(@individual_show, test)
      add_page([ 'individual', 'show' ], @individual_show, @individual_show_steps)

      @group_show = GroupShowPage.new(driver, browser, wait)
      @group_show_steps = GroupShowPageSteps.new(@group_show, test)
      add_page([ 'group', 'show' ], @group_show, @group_show_steps)

      @setup_default_start_point_show = SetupDefaultStartPointShowPage.new(driver, browser, wait)
      @setup_default_start_point_show_steps = SetupDefaultStartPointShowPageSteps.new(@setup_default_start_point_show, test)
      add_page([ 'setup_default_start_point', 'show' ], @setup_default_start_point_show, @setup_default_start_point_show_steps)

      @kata_individual = KataIndividualPage.new(driver, browser, wait)
      @kata_individual_steps = KataIndividualPageSteps.new(@kata_individual, test)
      add_page([ 'kata', 'individual' ], @kata_individual, @kata_individual_steps)

      @kata_group = KataGroupPage.new(driver, browser, wait)
      @kata_group_steps = KataGroupPageSteps.new(@kata_group, test)
      add_page([ 'kata', 'group' ], @kata_group, @kata_group_steps)

      @id_join_show = IdJoinShowPage.new(driver, browser, wait)
      @id_join_show_steps = IdJoinShowPageSteps.new(@id_join_show, test);
      add_page([ 'id_join', 'show' ], @id_join_show, @id_join_show_steps)

      @id_rejoin_show = IdRejoinShowPage.new(driver, browser, wait)
      @id_rejoin_show_steps = IdRejoinShowPageSteps.new(@id_rejoin_show, test);
      add_page([ 'id_rejoin', 'show' ], @id_rejoin_show, @id_rejoin_show_steps)

      @id_review_show = IdReviewShowPage.new(driver, browser, wait)
      @id_review_show_steps = IdReviewShowPageSteps.new(@id_review_show, test);
      add_page([ 'id_review', 'show' ], @id_review_show, @id_review_show_steps)

      @kata_edit = KataEditPage.new(driver, browser, wait)
      @kata_edit_steps = KataEditPageSteps.new(@kata_edit, test)
      add_page([ 'kata', 'edit' ], @kata_edit, @kata_edit_steps)

      @dashboard_show = DashboardShowPage.new(driver, browser, wait)
      @dashboard_show_steps = DashboardShowPageSteps.new(@dashboard_show, test)
      add_page([ 'dashboard', 'show' ], @dashboard_show, @dashboard_show_steps)
    end

    def add_page(url_array, page, steps)
      @all_pages << { :url => url_array, :page => page, :steps => steps }
    end

    def update_driver(driver)
      @all_pages.each do |p|
        p[:page].update_driver(driver)
      end
    end

  end

end
