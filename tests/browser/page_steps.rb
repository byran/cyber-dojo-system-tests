module CyberDojo

  class PageSteps

    def initialize(page, test)
      @page = page
      @test = test
      @respond_to_active = false
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
      # Block a recursive loop if the method called
      # is not implemented on any of the objects
      return false if @respond_to_active
      @respond_to_active = true

      responds_to = super || @page.respond_to?(method, include_private) || @test.respond_to?(method, include_private)

      @respond_to_active = false
      responds_to
    end

  end

end
