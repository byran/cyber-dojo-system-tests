module CyberDojo

  class PageAssertions

    protected
    attr_reader :browser

    public

    def initialize(browser, page, assertions)
      @browser = browser
      @page = page
      @scenario_assertions = assertions
    end

    def method_missing(sym, *args, &block)
      if @page.respond_to?(sym)
        @page.send(sym, *args, &block)
      elsif @scenario_assertions.respond_to?(sym)
        @scenario_assertions.send(sym, *args, &block)
      else
        super(sym, *args, &block)
      end
    end

    def respond_to?(method, include_private = false)
      super ||
          @page.respond_to?(method, include_private) ||
          @scenario_assertions.respond_to?(method, include_private)
    end

    def assert_page_loaded(page)
      assert(
          @browser.wait.until_or_false{
        page.load_completed? &&
            @browser.page == page
      }, "Failed to load page, current url #{@browser.full_url}")
    end

  end

end
