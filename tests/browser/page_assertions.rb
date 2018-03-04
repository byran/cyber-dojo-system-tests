module CyberDojo

  class PageAssertions

    protected
    attr_reader :browser

    public

    def initialize(browser, page, test)
      @browser = browser
      @page = page
      @test = test

      @inRespondTo = false
    end

    def method_missing(sym, *args, &block)
      if @page.respond_to?(sym)
        @page.send(sym, *args, &block)
      elsif @test.respond_to?(sym)
        @test.send(sym, *args, &block)
      else
        super(sym, *args, &block)
      end
    end

    def respond_to?(method, include_private = false)
      # Stop infinite loop
      # @test is the object that support assert but it is also the test
      # so will try and check this object for missing methods
      return false if @inRespondTo

      @inRespondTo = true
      result = super || @page.respond_to?(method, include_private) || @test.respond_to?(method, include_private)
      @inRespondTo = false

      result
    end

    def assert_page_loaded(page)
      assert(@browser.wait.until_or_false{
        page.load_completed? &&
            @browser.page == page
      }, "Failed to load page, current url #{@browser.full_url}")
    end

  end

end
