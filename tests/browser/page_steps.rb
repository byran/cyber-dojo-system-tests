module CyberDojo

  class PageSteps

    def initialize(page, test)
      @page = page
      @test = test
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
      super || @page.respond_to?(method, include_private) || @test.respond_to?(method, include_private)
    end

  end

end
